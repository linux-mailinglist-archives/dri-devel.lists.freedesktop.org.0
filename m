Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2884FD32D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 11:04:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F8910E5BB;
	Tue, 12 Apr 2022 09:04:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D52E10E5BB
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 09:04:03 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id z8so18381686oix.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 02:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:user-agent:references:in-reply-to:mime-version:date:message-id
 :subject:to:cc;
 bh=TaVLZyoZEENt9mm6XHe8rhxlLaPeM8tk8R1AgC2794g=;
 b=sesqj42IAFm9WSWsTOqHdYA5Rorjo3bfN3YoTtq6JHYKWQqX1WmBP4uULeeni1uzGm
 /hfuD40g58GgUJw3f9vzeM8X+LkiE2vXLWO6yolkj181V2nTWeGDiebzZ91tyH5BpGPv
 zoQIBLJLMpiNHlQdyQc9zrY059t+bgc1gIWC7WwGslbm7t2nXtJJ5k723Eh4DT8Tb0QL
 GFGKkRRWR16wjNsMJ07818rU6oJfnetWzWgQauQeYKQj0z3lhi3ue8MXM9rZPV19+9rQ
 zqEOHIBojyGpj0ozyivfpOgZ5YZi4XuapP//Puf3rnOnvV42BlenzwpudpXnFaFyKAcx
 bC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:user-agent:references:in-reply-to
 :mime-version:date:message-id:subject:to:cc;
 bh=TaVLZyoZEENt9mm6XHe8rhxlLaPeM8tk8R1AgC2794g=;
 b=I+Cu2MSi9o8m6ME/9PdG1+zkRkzLvEZoFL686cTr1GuGsaj4gzGUc/sFWDctbwfxqP
 x4WQtwL/vYrs8r+LFoE7hsx/BqhPbvsl0ENXcwbikzUr2KJWaRUQ837VrgI3M96F9pJJ
 bUB4GrtroEuKCc7hAxTiEoHE6mQKoG+0wIZcFBnsI4SuO3IAuLiAq3MSKYZnQ7oHM1bR
 TpgEwhVScIpegY8k9ln9HOMKnDkKJMIwyjVmG6vC25izbC5GW29/Fzf6xGp7sygK+O+1
 Pyb2xginyl9CpdqbvHIGTWcDrkVK30B440l2J9oOGI/T3svSs5Bw7vysQ092N82joZMM
 lwtg==
X-Gm-Message-State: AOAM533qQUUI2+9Edw1f2jUSpah5H3NQvM7bnJwfrgSIcuREeFtjeyPs
 RJ4js8CG92zBgcu32W3PSzI69ZiaJRYQJFQWbcOncQ==
X-Google-Smtp-Source: ABdhPJzzWwf0u6lyl2/9u7EvJbdiNju6WRex6OFE3yBhD7hT45+S39d1b5mmEOgGvzLwyVK+y4+UdItaHwgA6/SFgm8=
X-Received: by 2002:a05:6808:159d:b0:2da:3946:ab3d with SMTP id
 t29-20020a056808159d00b002da3946ab3dmr1265654oiw.248.1649754242818; Tue, 12
 Apr 2022 02:04:02 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 Apr 2022 02:04:02 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220327223927.20848-1-granquet@baylibre.com>
 <20220327223927.20848-18-granquet@baylibre.com>
 <4697e3af-86f7-83e0-1737-3f5000fc8d30@collabora.com>
In-Reply-To: <4697e3af-86f7-83e0-1737-3f5000fc8d30@collabora.com>
MIME-Version: 1.0
Date: Tue, 12 Apr 2022 02:04:02 -0700
Message-ID: <CABnWg9s7MN_21CEYVJV9=udfYkYQ_huJjQvLf+Jcb3Dmc8pNCA@mail.gmail.com>
Subject: Re: [PATCH v9 17/22] phy: phy-mtk-dp: Add driver for DP phy
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 vkoul@kernel.org, 
 airlied@linux.ie, chunfeng.yun@mediatek.com, chunkuang.hu@kernel.org, 
 ck.hu@mediatek.com, daniel@ffwll.ch, deller@gmx.de, jitao.shi@mediatek.com, 
 kishon@ti.com, krzk+dt@kernel.org, maarten.lankhorst@linux.intel.com, 
 matthias.bgg@gmail.com, mripard@kernel.org, p.zabel@pengutronix.de, 
 robh+dt@kernel.org, tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 28 Mar 2022 10:20, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>Il 28/03/22 00:39, Guillaume Ranquet ha scritto:
>> From: Markus Schneider-Pargmann <msp@baylibre.com>
>>
>> This is a new driver that supports the integrated DisplayPort phy for
>> mediatek SoCs, especially the mt8195. The phy is integrated into the
>> DisplayPort controller and will be created by the mtk-dp driver. This
>> driver expects a struct regmap to be able to work on the same registers
>> as the DisplayPort controller. It sets the device data to be the struct
>> phy so that the DisplayPort controller can easily work with it.
>>
>> The driver does not have any devicetree bindings because the datasheet
>> does not list the controller and the phy as distinct units.
>>
>> The interaction with the controller can be covered by the configure
>> callback of the phy framework and its displayport parameters.
>>
>> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>> ---
>>   MAINTAINERS                       |   1 +
>>   drivers/phy/mediatek/Kconfig      |   8 ++
>>   drivers/phy/mediatek/Makefile     |   1 +
>>   drivers/phy/mediatek/phy-mtk-dp.c | 201 ++++++++++++++++++++++++++++++
>>   4 files changed, 211 insertions(+)
>>   create mode 100644 drivers/phy/mediatek/phy-mtk-dp.c
>>
>
>..snip..
>
>> diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
>> new file mode 100644
>> index 000000000000..e5c5494f3636
>> --- /dev/null
>> +++ b/drivers/phy/mediatek/phy-mtk-dp.c
>
>..snip..
>
>> +
>> +static int mtk_dp_phy_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct mtk_dp_phy *dp_phy;
>> +	struct phy *phy;
>> +	struct regmap *regs;
>> +
>> +	regs = syscon_regmap_lookup_by_phandle(dev->of_node, "mediatek,dp-syscon");
>> +
>
>Please drop this blank line
>
>> +	if (IS_ERR(regs))
>> +		return PTR_ERR(regs);
>> +
>> +	dp_phy = devm_kzalloc(dev, sizeof(*dp_phy), GFP_KERNEL);
>> +	if (!dp_phy)
>> +		return -ENOMEM;
>> +
>> +	dp_phy->regs = regs;
>> +
>> +	phy = devm_phy_create(dev, NULL, &mtk_dp_phy_dev_ops);
>> +
>
>Same here
>
>> +	if (IS_ERR(phy))
>> +		return dev_err_probe(dev, PTR_ERR(phy), "Failed to create DP PHY: %ld\n", PTR_ERR(phy));
>> +
>
>Using dev_err_probe automates printing the error, so the correct usage is:
>
>return dev_err_probe(dev, PTR_ERR(phy), "Failed to create DP PHY\n");
>
>> +	phy_set_drvdata(phy, dp_phy);
>> +
>> +	return 0;
>> +}
>> +
>> +struct platform_driver mtk_dp_phy_driver = {
>> +	.probe = mtk_dp_phy_probe,
>> +	.driver = {
>> +		.name = "mediatek-dp-phy",
>> +	},
>> +};
>> +module_platform_driver(mtk_dp_phy_driver);
>
>Also, in your dt-binding, you mention a compatible for this driver, but I don't see
>any, here. This means that you do know what to do, so please do it.
>

Following the comments from rob [1], I'll revert back to using
platform_device_register_data() from v8.

[1] https://lore.kernel.org/linux-mediatek/YkOPB5W7uXkOc72%2F@robh.at.kernel.org/

>Regards,
>Angelo
>
>> +
>> +MODULE_AUTHOR("Markus Schneider-Pargmann <msp@baylibre.com>");
>> +MODULE_DESCRIPTION("MediaTek DP PHY Driver");
>> +MODULE_LICENSE("GPL");
>

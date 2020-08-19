Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E84024A4A5
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 19:12:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187CE6E578;
	Wed, 19 Aug 2020 17:12:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856936E578
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 17:12:33 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y3so22286535wrl.4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 10:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=P/BxB6Tk9AqvsGBqiTBEZmxawpSGqW2VpShvG8egiLE=;
 b=aOT8FZXVbYAg7wGPDj6bcP9F+iWPGFAHwmYImaZXz4dUZFvLGzdMD5+6ayifi72/FH
 21dd5Set+gYeTPzss4RyBymKDuogTsC0beZM4OvOL+ezO23pv46w1CIc/RsIQ6PMUPoL
 k1P3ymaMirYfMEx6WQ6qQv6OKryMX2mOn99eiEABq5HfSSCwULPH0sV5/UOEvfxjCdcI
 hsf5z7wcQ7vzqqZNsEj1ft73UrkozG8GecNNKYKCNl8IJU525hQnfL14HmWvmCdnCaYw
 PZqzYQ6UK5hq3eiWw6FU2yVpuc54RspJhyBq/IXuIJjyuWIy89lFl10O02gOtcOZMCd3
 +7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P/BxB6Tk9AqvsGBqiTBEZmxawpSGqW2VpShvG8egiLE=;
 b=nHX3S5YCDoz0KbUII3rWKL51IKsQf8jFINQtb2L+wVQAsjOsimyTFAgv0aWyy0O2Eq
 VcxCB7Pl9BlwtalDYn3t32JWXeI/qe2cvYBR/BRE+erd2D4J43yjetFYZOmmBoHHdOyb
 sl1R350r7Vcgf3uLvkr/BZjB9V/26uvXxxhln4zR5LWBwQ7urkDXeHsyeSzWSkB19ztu
 BsBkA1zGL/FOcJFHh4OhEChBGSfd/tjdQv8xkDXF9UHGoYXtl2zbpeT0cibkDxmrUVcc
 2Bqtyt/uRFy/OL84TeVVdYUtE4UThAKvixJd5p24lu8CSQXLW8TiuiR9rcqFG6TD9M5e
 raWQ==
X-Gm-Message-State: AOAM533I05iZ4N6UUqAFidiIFAueoskyHEvJ3Kn9npBENRZ4/FVABQVc
 8LdXtu4WQSesQ+VvdbFs2vU=
X-Google-Smtp-Source: ABdhPJxbMdMiABMczUJpbzVpjiKzWMQlXai3V6kLN1aQ5/US5xWa8crZteCDS1MmrXTkNtT+nkvzHQ==
X-Received: by 2002:adf:9c8c:: with SMTP id d12mr4884761wre.369.1597857151947; 
 Wed, 19 Aug 2020 10:12:31 -0700 (PDT)
Received: from ziggy.stardust ([93.176.180.54])
 by smtp.gmail.com with ESMTPSA id s2sm20811016wrr.55.2020.08.19.10.12.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2020 10:12:31 -0700 (PDT)
Subject: Re: [PATCH v5 3/7] drm/mediatek: disable tmds on mt2701
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20200819081752.4805-1-linux@fw-web.de>
 <20200819081752.4805-4-linux@fw-web.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <f68cf4c2-6c79-fe46-b7b4-bcc49e0b6b69@gmail.com>
Date: Wed, 19 Aug 2020 19:12:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200819081752.4805-4-linux@fw-web.de>
Content-Language: en-US
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Frank Wunderlich <frank-w@public-files.de>, David Airlie <airlied@linux.ie>,
 chunhui dai <chunhui.dai@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 19/08/2020 10:17, Frank Wunderlich wrote:
> From: chunhui dai <chunhui.dai@mediatek.com>
> 
> disable tmds on phy on mt2701 to support other resolutions like 1280x1024
> 

Isn't that worth a Fixes tag?

Regards,
Matthias

> Signed-off-by: chunhui dai <chunhui.dai@mediatek.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Tested-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>   drivers/gpu/drm/mediatek/mtk_hdmi_phy.c        | 3 +++
>   drivers/gpu/drm/mediatek/mtk_hdmi_phy.h        | 1 +
>   drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c | 1 +
>   3 files changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
> index 5223498502c4..edadb7a700f1 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
> @@ -184,6 +184,9 @@ static int mtk_hdmi_phy_probe(struct platform_device *pdev)
>   		return PTR_ERR(phy_provider);
>   	}
>   
> +	if (hdmi_phy->conf->pll_default_off)
> +		hdmi_phy->conf->hdmi_phy_disable_tmds(hdmi_phy);
> +
>   	return of_clk_add_provider(dev->of_node, of_clk_src_simple_get,
>   				   hdmi_phy->pll);
>   }
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h
> index 2d8b3182470d..f472fdeb63dc 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h
> @@ -22,6 +22,7 @@ struct mtk_hdmi_phy;
>   struct mtk_hdmi_phy_conf {
>   	bool tz_disabled;
>   	unsigned long flags;
> +	bool pll_default_off;
>   	const struct clk_ops *hdmi_phy_clk_ops;
>   	void (*hdmi_phy_enable_tmds)(struct mtk_hdmi_phy *hdmi_phy);
>   	void (*hdmi_phy_disable_tmds)(struct mtk_hdmi_phy *hdmi_phy);
> diff --git a/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c b/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
> index d3cc4022e988..6fbedacfc1e8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
> +++ b/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
> @@ -239,6 +239,7 @@ static void mtk_hdmi_phy_disable_tmds(struct mtk_hdmi_phy *hdmi_phy)
>   struct mtk_hdmi_phy_conf mtk_hdmi_phy_2701_conf = {
>   	.tz_disabled = true,
>   	.flags = CLK_SET_RATE_GATE,
> +	.pll_default_off = true,
>   	.hdmi_phy_clk_ops = &mtk_hdmi_phy_pll_ops,
>   	.hdmi_phy_enable_tmds = mtk_hdmi_phy_enable_tmds,
>   	.hdmi_phy_disable_tmds = mtk_hdmi_phy_disable_tmds,
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

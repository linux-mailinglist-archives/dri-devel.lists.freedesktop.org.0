Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 344EB4C431F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 12:11:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D22310E379;
	Fri, 25 Feb 2022 11:11:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 264C310E379
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 11:10:59 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id bn33so6904388ljb.6
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 03:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=yfHDVChMIt79P8PwPVg3ITAsqmLO2xEVeCJUOEsGqTU=;
 b=YYiU90jPEjbBPpGtGlks3J6ji5Nd3R7OXrhwxviCnTFNqQpKJJnJtC5ehaLTKgPv6d
 kytOZEuiglne9JU2KDODLNAk3kSnVaXhENvmnBtvrBbuGp/LmYESK1W3L2pDk+iUYmTq
 KqWJVFd1YncInr0mcJoJcA0/NgWltTcKtQEvETZRIPWbMYnZwgIomPPWFTh/GwaEQ0w/
 /q92mKU79F4TZmLhSIed3q5bfj8I0MJ7jU8M5FhdAjmYQ/xwPXK9nq/oM1z1t6IqlZOS
 5Fktm2+KaIZ1bj+8igJ/PSK5VWx+/oGbmra2Gr9CrvDH4UL45bEStlNRKgE6PNXEv63N
 5b/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yfHDVChMIt79P8PwPVg3ITAsqmLO2xEVeCJUOEsGqTU=;
 b=QRCsG9PG8aCeqqPKizAPdUfOoE7AQSoNaQNwGTmctGGROlnlCef1SheCvgZDlvDp6y
 fMVeKHakA4GrvstAwx4q7i9qg+eRERuQw/uo1pl1+HxAYVt41R/NlSfpNy81R/wg/3Sb
 yw9Zre+xaQ2wIGFIWwBaRXySz1yWPR2o5CuL50HqAV+iXe/9PgkKgSlWCxdkMhSypnoU
 h8wW9BbLHLIhQB5TvIm/m37ME070LPAXXz2J1Ul5dHXenzUOGdA2+yFAlQc/BMPTWuIg
 aTspF3FtHG0XU5f3re95YSkYL+/NMoSygKyoLeNI/UwbQwi674neoECYvPDNcE6VmWdo
 ekAQ==
X-Gm-Message-State: AOAM53109u0dVwRi3CIToMf9k5DwypPxE5R1/4h7EvjB8WXBp1+pwyLd
 bwYwZ9lLX5d9BWuT3hvcqRY=
X-Google-Smtp-Source: ABdhPJy3g0VW5PnDPjeFJlNBTjarbzOJxXYBGGvfVSZkpGhwP0uSgOx0oKsnOg7b8V6oGQav6wtkcA==
X-Received: by 2002:a2e:7218:0:b0:246:4772:1fa0 with SMTP id
 n24-20020a2e7218000000b0024647721fa0mr4972875ljc.125.1645787457313; 
 Fri, 25 Feb 2022 03:10:57 -0800 (PST)
Received: from [192.168.2.145] (109-252-137-194.dynamic.spd-mgts.ru.
 [109.252.137.194]) by smtp.googlemail.com with ESMTPSA id
 u17-20020a056512095100b0044381f00805sm174550lft.139.2022.02.25.03.10.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 03:10:56 -0800 (PST)
Message-ID: <78207d97-b5a1-9792-8ec9-11fcf2e00370@gmail.com>
Date: Fri, 25 Feb 2022 14:10:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 10/24] drm/rockchip: dw_hdmi: Add support for hclk
Content-Language: en-US
To: Sascha Hauer <s.hauer@pengutronix.de>
References: <20220225075150.2729401-1-s.hauer@pengutronix.de>
 <20220225075150.2729401-11-s.hauer@pengutronix.de>
 <47ddcaf3-4544-2b7c-a2f6-1f6346907f33@gmail.com>
 <20220225104924.GC19585@pengutronix.de>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20220225104924.GC19585@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kernel@pengutronix.de,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Andy Yan <andy.yan@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

25.02.2022 13:49, Sascha Hauer пишет:
> On Fri, Feb 25, 2022 at 01:26:14PM +0300, Dmitry Osipenko wrote:
>> 25.02.2022 10:51, Sascha Hauer пишет:
>>> The rk3568 HDMI has an additional clock that needs to be enabled for the
>>> HDMI controller to work. The purpose of that clock is not clear. It is
>>> named "hclk" in the downstream driver, so use the same name.
>>>
>>> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
>>> ---
>>>
>>> Notes:
>>>     Changes since v5:
>>>     - Use devm_clk_get_optional rather than devm_clk_get
>>>
>>>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 16 ++++++++++++++++
>>>  1 file changed, 16 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
>>> index fe4f9556239ac..c6c00e8779ab5 100644
>>> --- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
>>> +++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
>>> @@ -76,6 +76,7 @@ struct rockchip_hdmi {
>>>  	const struct rockchip_hdmi_chip_data *chip_data;
>>>  	struct clk *ref_clk;
>>>  	struct clk *grf_clk;
>>> +	struct clk *hclk_clk;
>>>  	struct dw_hdmi *hdmi;
>>>  	struct regulator *avdd_0v9;
>>>  	struct regulator *avdd_1v8;
>>> @@ -229,6 +230,14 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
>>>  		return PTR_ERR(hdmi->grf_clk);
>>>  	}
>>>  
>>> +	hdmi->hclk_clk = devm_clk_get_optional(hdmi->dev, "hclk");
>>> +	if (PTR_ERR(hdmi->hclk_clk) == -EPROBE_DEFER) {
>>
>> Have you tried to investigate the hclk? I'm still thinking that's not
>> only HDMI that needs this clock and then the hardware description
>> doesn't look correct.
> 
> I am still not sure what you mean. Yes, it's not only the HDMI that
> needs this clock. The VOP2 needs it as well and the driver handles that.

I'm curious whether DSI/DP also need that clock to be enabled. If they
do, then you aren't modeling h/w properly AFAICS.

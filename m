Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF464C423D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 11:26:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4829010E864;
	Fri, 25 Feb 2022 10:26:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B361D10E864
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 10:26:17 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id u7so6705014ljk.13
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 02:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wWkiKPp0yU51YIZBOYra9GP4j4G9QYqwO5yPBvcytuI=;
 b=OTdlbCcloAhlN/v+ZbSF/fydVTwpPRXxMmlE+7+s30HFgGm03WAAt8twDvEuaEJfn9
 Zv6QWe9jnaaCK0tnQef0t4rf8BQfUIM0jFQOEWN23hi79xzUW5zyO7IEyv2jn2QkD+9V
 AEMNKmVJYNXZU9Hwxha2va+GuXP/qBuuDksEhhg+oih08RmH/MPZ2WU6GEsoaX2gBLsR
 bLKlYfAj2TcDpg4HHOZwROkP1jIk2TsrsD2VyvMQmr/YYMg/MvEFeKtRs69uqthR+n+/
 vjnq3+21i1tAq8irdoG045HCbslBM2GlsbPy57MPZi2LpCEgEiUIXrSq3U1QmlsBUVqZ
 94Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wWkiKPp0yU51YIZBOYra9GP4j4G9QYqwO5yPBvcytuI=;
 b=gT16B8XzTsE8Ug9W8NSr8FkPNCb0OTEaoQmBqXroC3opUBRcEAAZHP3dJ8yZbGvbpA
 JciSWUTYLiZBSRgdzSaSteeVru5CPCpYlKSvecYtowcaeRdZbeu5VmHbTgSgweq2WSVH
 UVnS8+TV9WNTvka5r6jKqtvCsYvsTeDJ6kHKEXKZUXrTh8af148+xW7Z4KF5TET3tzFJ
 NeT/Os1Cb5LPyLksTvIaJpXedFqsVLLtVxrAb/6WJIMUtzowP96HDiim46xJcce8ty7E
 DtUiAdk1oVZWmFodFA/RiAjEXlJNcJGcLQg3LXI0uG6qzd9a0FX3+dHz7gE1NETiEzvJ
 IElA==
X-Gm-Message-State: AOAM532TW9Mh5FzYpjNo2yt3y7Aavl5r2V8HDkRB0GpLqJYtSrFoPyac
 PybjeeRKaIDAOK2r328KxmM=
X-Google-Smtp-Source: ABdhPJxS32kW61bz2PV5TVfzLTeGimkAktcHo9OysUKyXqkNxifBz36DVjPV0ZnKaOzpknqaSHhfXA==
X-Received: by 2002:a2e:9f02:0:b0:244:8e4b:5aaa with SMTP id
 u2-20020a2e9f02000000b002448e4b5aaamr4993707ljk.249.1645784775907; 
 Fri, 25 Feb 2022 02:26:15 -0800 (PST)
Received: from [192.168.2.145] (109-252-137-194.dynamic.spd-mgts.ru.
 [109.252.137.194]) by smtp.googlemail.com with ESMTPSA id
 w9-20020a05651203c900b0044399c17e58sm163232lfp.224.2022.02.25.02.26.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 02:26:15 -0800 (PST)
Message-ID: <47ddcaf3-4544-2b7c-a2f6-1f6346907f33@gmail.com>
Date: Fri, 25 Feb 2022 13:26:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 10/24] drm/rockchip: dw_hdmi: Add support for hclk
Content-Language: en-US
To: Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20220225075150.2729401-1-s.hauer@pengutronix.de>
 <20220225075150.2729401-11-s.hauer@pengutronix.de>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20220225075150.2729401-11-s.hauer@pengutronix.de>
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
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Andy Yan <andy.yan@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

25.02.2022 10:51, Sascha Hauer пишет:
> The rk3568 HDMI has an additional clock that needs to be enabled for the
> HDMI controller to work. The purpose of that clock is not clear. It is
> named "hclk" in the downstream driver, so use the same name.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
> 
> Notes:
>     Changes since v5:
>     - Use devm_clk_get_optional rather than devm_clk_get
> 
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> index fe4f9556239ac..c6c00e8779ab5 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> @@ -76,6 +76,7 @@ struct rockchip_hdmi {
>  	const struct rockchip_hdmi_chip_data *chip_data;
>  	struct clk *ref_clk;
>  	struct clk *grf_clk;
> +	struct clk *hclk_clk;
>  	struct dw_hdmi *hdmi;
>  	struct regulator *avdd_0v9;
>  	struct regulator *avdd_1v8;
> @@ -229,6 +230,14 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
>  		return PTR_ERR(hdmi->grf_clk);
>  	}
>  
> +	hdmi->hclk_clk = devm_clk_get_optional(hdmi->dev, "hclk");
> +	if (PTR_ERR(hdmi->hclk_clk) == -EPROBE_DEFER) {

Have you tried to investigate the hclk? I'm still thinking that's not
only HDMI that needs this clock and then the hardware description
doesn't look correct.

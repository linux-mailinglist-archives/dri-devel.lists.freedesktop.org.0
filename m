Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E13494DD63E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 09:34:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE6910E13F;
	Fri, 18 Mar 2022 08:34:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6442810E13F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 08:34:22 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id h16so3885367wmd.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 01:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JBS5kufLWoBh6jQkmIuGyN5TkwDV0dVUAqqIzxduWmI=;
 b=C2N9K5pfOPn/jknROvQpydIUdZhtPhgfzwtrdxtOqMriMgwmN9SOB0q2DoKREemaPT
 TmgFRoaDNpM5mX8cYICfo4xIavieRqMs9XzIqr7WZ8clUs4S7jlUnll8qhWo7yr91dXO
 zw1hNdAfijoFQZ6/ADo9cyiCR/3v9vQli9xaS4ShNCIygqVNhEoTHwWY291JHeMFK/Eu
 BfSBEvyGvsO7WVTDdvR0Jez+kU0n6Ce55MtxzLdMozvdDgLBocXfMAGOQVhVtmpbUpv6
 iHchIFSmE2FVAXoAYH2TZ2EuPxmm5C8FnGlmkkX4lAfv5rJsdC3PiBuXE2gf/pa2H4jG
 Rz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JBS5kufLWoBh6jQkmIuGyN5TkwDV0dVUAqqIzxduWmI=;
 b=vZYYTvn96+HK4e+IBndylnxJzeIL3NuQtybPpXhNH1EmwflFMAz51/6LLvC8PrCB7s
 bcn8kE2UKa+p/t0XiQqjLzO3stdohlT4Mz58qNTpEVMEHKJU3Ka9P90652Hakm0HYgm2
 lGTPf8Be9FLQe5nlRHIxGQ1Rxvqn1s243IJwqrvQFCSnNdDI7W+CUoI9I29Pca3YKzB+
 FZTD16pYDV1HuflZh+fJrIxGF9C5nUUTA0TyHYqeQ81CwtjppAEVeR3/IEExWt5+EDR2
 8SevSyNUnfuGIRDCivvDZDlOuVNZxoHPtGY6j4qCdD9HoWryrZ0zGlgrqTFK9s9uXnzQ
 c/1A==
X-Gm-Message-State: AOAM533LDS7oMPDbXiy/2+GQQHYRbxSiMFutYIs81R5VUPUpqi+1Q6mE
 wOyKLoWG6tMHcIeBe/+5n/vz8Q==
X-Google-Smtp-Source: ABdhPJwdJb/+m+x3Q5ZCtXIp+6h80maidNey0nwW4zOpf/79eRHvrlLepalIv2+SeV8SZlK+2CGezw==
X-Received: by 2002:a7b:c3d5:0:b0:389:a49f:c7e6 with SMTP id
 t21-20020a7bc3d5000000b00389a49fc7e6mr14808995wmj.99.1647592460780; 
 Fri, 18 Mar 2022 01:34:20 -0700 (PDT)
Received: from [192.168.1.10]
 (i16-les01-ntr-213-44-230-108.sfr.lns.abo.bbox.fr. [213.44.230.108])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a056000186f00b0020384249361sm6603079wri.104.2022.03.18.01.34.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 01:34:20 -0700 (PDT)
Message-ID: <ae37bbcc-14b9-8024-c10f-7a71bd90ff0e@baylibre.com>
Date: Fri, 18 Mar 2022 09:34:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/3] drm: bridge: it66121: Fix the register page length
Content-Language: en-US
To: Nicolas Belin <nbelin@baylibre.com>, andrzej.hajda@intel.com,
 robert.foss@linaro.org
References: <20220316135733.173950-1-nbelin@baylibre.com>
 <20220316135733.173950-3-nbelin@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220316135733.173950-3-nbelin@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/03/2022 14:57, Nicolas Belin wrote:
> Set the register page length or window length to
> 0x100 according to the documentation.
> 
> Fixes: 988156dc2fc9 ("drm: bridge: add it66121 driver")
> Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
> ---
>   drivers/gpu/drm/bridge/ite-it66121.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index 06b59b422c69..64912b770086 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -227,7 +227,7 @@ static const struct regmap_range_cfg it66121_regmap_banks[] = {
>   		.selector_mask = 0x1,
>   		.selector_shift = 0,
>   		.window_start = 0x00,
> -		.window_len = 0x130,
> +		.window_len = 0x100,
>   	},
>   };
>   

The documentation we have access to at [1] is confusing:
Reg00 ~ Reg2F are accessible in any register bank.
Reg30~ RegFF are accessible in register bank0
Reg130~ Reg1BF are accessible in register bank1. These are HDMI packet registers.

But indeed it means:
- Reg00 ~ Reg2F: are always accessible, whether bank0 or bank1 is set
- Reg30~ RegFF: only when bank0 is set
- Reg130~ Reg1BF: only when bank0 is set at Reg30~ RegF range

So 0x100 is the right window_len here.

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

[1] https://rockchip.fr/radxa/IT66121_Register_List_Release_V1.0.pdf

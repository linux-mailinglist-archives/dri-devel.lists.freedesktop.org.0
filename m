Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC51444AECE
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 14:33:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5DA6E888;
	Tue,  9 Nov 2021 13:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF256E888
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 13:33:34 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id v127so15812905wme.5
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Nov 2021 05:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oXCMr+/KNYtEmd3upAl6pgL78E6/B9BzleWtsQw0fvY=;
 b=PIPWFklLYdgHZz4sKScFOtQx6cc5AfdbB5bOrVhuqRUiAzI1PaY+eRkD0cIJqZ3H9/
 h1rdNDh8mqEeHVaXg0cb3WRG7klHAZoc5xVzCCdIF3xYgUFgqcIQHumCSTp4Lrr07mgY
 7NnCI5jXzZnHp8IEpdYA5rHUaG+Jrs2syXW5xZDrJyZVRUkpMXme1hcBNDySAj0t+N4B
 OC5/zdexojm+lxiOnHB6Ud/hgYHBY6RagfFKblEm8ngUWrtP+7++Y2+VIVh4L5FzT+y4
 y8BtRyQgrstwlAZlokt2xX6a8m2P/F6hkDCz2/NRh5lEEAbT3wbdGPVebjUcb4CmW3Qw
 Ux1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=oXCMr+/KNYtEmd3upAl6pgL78E6/B9BzleWtsQw0fvY=;
 b=iB03IJWpsNy6Wt8F/QYjnoEGpnYZmVLH+7NsGlQX4Xj45GxA5rJl+HXBDr/kU2dlOM
 D83aymT7P1AbCGLyc55Res9TiD41AxtChOfctK8R+ermePZC/KMm5iaQKqSHEFMPgxlO
 jBhO+4zrRulE+thQZ12BcCBdYRoFN0d2G3UIipl+LSxE9TBQiSmr3lcN8br6kPWk/dlw
 SYC1fQldXgU/1O9Jbb5bdL/lkLtEJ/mALA0osL75Jsu/e1KKhai3VjW37GLNXACNffgg
 k1C7k6wixb643OiVmPwEvGam+idK1Q9KPXpiN/mFRf8KMLA51FqnRdz9qtDbtKCAwoLZ
 MLqg==
X-Gm-Message-State: AOAM533W+HvxWfFHXWiy8lPwoBnWPf7hhKkscCA92hvmbkzGmlJiTX/o
 WwoptxeZPKsm6hTb5i4C8ECgLQ==
X-Google-Smtp-Source: ABdhPJzffaQ/PmeccpPGpLG2Fa3ejyKOv/JPCrxy7S3CJFfFhWSYI5qMjQ09cL5DK1P5TdmiNEFvlA==
X-Received: by 2002:a1c:7c19:: with SMTP id x25mr7466982wmc.42.1636464812656; 
 Tue, 09 Nov 2021 05:33:32 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:d284:de3f:b3d6:f714?
 ([2001:861:44c0:66c0:d284:de3f:b3d6:f714])
 by smtp.gmail.com with ESMTPSA id o1sm20351064wru.91.2021.11.09.05.33.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 05:33:32 -0800 (PST)
Subject: Re: [PATCH] drm/omap: increase DSS5 max tv pclk to 192MHz
To: tomba@kernel.org
References: <20211012133939.2145462-1-narmstrong@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <b0683f52-abde-cb11-c88c-dd05645945a0@baylibre.com>
Date: Tue, 9 Nov 2021 14:33:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211012133939.2145462-1-narmstrong@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: khilman@baylibre.com, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

On 12/10/2021 15:39, Neil Armstrong wrote:
> From: Tomi Valkeinen <tomi.valkeinen@ti.com>
> 
> DSS5's maximum tv pclk rate (i.e. HDMI) is set to 186MHz, which comes
> from the TRM (DPLL_HDMI_CLK1 frequency must be lower than 186 MHz). To
> support DRA76's wide screen HDMI feature, we need to increase this
> maximum rate.
> 
> Testing shows that the PLL seems to work fine even with ~240MHz clocks,
> and even the HDMI output at that clock is stable enough for monitors to
> show a picture. This holds true for all DRA7 and AM5 SoCs (and probably
> also for OMAP5).
> 
> However, the highest we can go without big refactoring to the clocking
> code is 192MHz, as that is the DSS func clock we get from the PRCM. So,
> increase the max HDMI pixel clock to 192MHz for now, to allow some more
> 2k+ modes to work.
> 
> This patch never had a clear confirmation from HW people, but this
> change stayed on production trees for multiple years without any report
> on an eventual breakage.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/omapdrm/dss/dispc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Tomi,
> 
> I slighly changed the commit message to point the fact this patch has been
> used in production fort years without any sign of breakage.
> 
> Neil
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
> index 5619420cc2cc..3c4a4991e45a 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dispc.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
> @@ -4458,7 +4458,7 @@ static const struct dispc_features omap54xx_dispc_feats = {
>  	.mgr_width_max		=	4096,
>  	.mgr_height_max		=	4096,
>  	.max_lcd_pclk		=	170000000,
> -	.max_tv_pclk		=	186000000,
> +	.max_tv_pclk		=	192000000,
>  	.max_downscale		=	4,
>  	.max_line_width		=	2048,
>  	.min_pcd		=	1,
> 
> base-commit: e4e737bb5c170df6135a127739a9e6148ee3da82
> 

Gentle ping,

Neil

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4793E3F8464
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 11:19:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF6E56E588;
	Thu, 26 Aug 2021 09:19:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 695916E588
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 09:19:00 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 v20-20020a1cf714000000b002e71f4d2026so5159042wmh.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 02:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=KMJBcmq1ZbF4M7qvQIwnmFbcPOdYmPNTJCyQyrP/K4I=;
 b=HYMxJKmJI6lkK9oRwabJkJvg4BmknVTOZc6kLrTHzRnJGXKHNy8FEqyc/pVEv7AI7v
 FzXm9+8wsENdDtneykOm5Kwv7Wkqek7pHpSFvoGSt9UThVfJDY/Xjr3I8M3VHEHX0PUo
 DoWF7H0mo9TXaFpvpSbb9W/3UlLv8RvHPMGyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=KMJBcmq1ZbF4M7qvQIwnmFbcPOdYmPNTJCyQyrP/K4I=;
 b=KKfFj8X5TSnDeENc8gUQXBS1JreS6fvHRcl/7J/1mGOrIemQ7iGb8AhyZazUyoD7C0
 J2/rXY+fxwNbcVgRbsSpBL/JZTezGomLIUnT01iRmJjTqrKyTtvAPTJ084I8wqFDs+f9
 qYp2bybefNgHfsrcWSynoR20HzBBM1CUcRYd+oxz1xaAyu1LPNrng0Q5kFfbCIbMX6gu
 WsOqfSE1pLHtzawnOUoOI+P1uTbRRVGT99nw1UUzPbHzHzlWw01ksvqe7cVQACwaDFzN
 JUfzwsKHZ9nHHexL+p+j3T7OwJ0xcZu7eq2Zd3I0gEN3MMVVN9iqiODelPxxwD68j+Jz
 ydAw==
X-Gm-Message-State: AOAM532Lk6hrt8D4jJxs63HY54YPseydRrBXJBPFJegaeDERBWkjeCNf
 TxOymLlC6b9WK7TtHJpT7ELdmK7pz5idig==
X-Google-Smtp-Source: ABdhPJyRLhnVn7qZJ+4BuVfziyV2sSG5HJDNYqpREM4DjFqEBEWHewXDa8dbxtyIY5O9FmU4npDFrA==
X-Received: by 2002:a05:600c:4fc7:: with SMTP id
 o7mr12963274wmq.55.1629969538974; 
 Thu, 26 Aug 2021 02:18:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u5sm2417412wrr.94.2021.08.26.02.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 02:18:58 -0700 (PDT)
Date: Thu, 26 Aug 2021 11:18:56 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Emma Anholt <emma@anholt.net>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] drm: omap: remove obsolete selection of OMAP2_DSS
 in config DRM_OMAP
Message-ID: <YSdcgLcD2hOZks6l@phenom.ffwll.local>
Mail-Followup-To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Emma Anholt <emma@anholt.net>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20210819112253.16484-1-lukas.bulwahn@gmail.com>
 <20210819112253.16484-6-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210819112253.16484-6-lukas.bulwahn@gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 19, 2021 at 01:22:53PM +0200, Lukas Bulwahn wrote:
> Commit 55b68fb856b5 ("drm/omap: squash omapdrm sub-modules into one")
> removes the config OMAP2_DSS in ./drivers/gpu/drm/omapdrm/dss/Kconfig,
> while moving the other configs into./drivers/gpu/drm/omapdrm/Kconfig, but
> misses to remove an obsolete selection of OMAP2_DSS in config DRM_OMAP.
> 
> Hence, ./scripts/checkkconfigsymbols.py warns:
> 
> OMAP2_DSS
> Referencing files: drivers/gpu/drm/omapdrm/Kconfig
> 
> Remove this reference in an obsolete selection.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Except the amdgpu patch all merged to drm-misc-next. amdgpu should get
picked up by Alex.
-Daniel

> ---
>  drivers/gpu/drm/omapdrm/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/Kconfig b/drivers/gpu/drm/omapdrm/Kconfig
> index e7281da5bc6a..d6e4df291d6f 100644
> --- a/drivers/gpu/drm/omapdrm/Kconfig
> +++ b/drivers/gpu/drm/omapdrm/Kconfig
> @@ -3,7 +3,6 @@ config DRM_OMAP
>  	tristate "OMAP DRM"
>  	depends on DRM
>  	depends on ARCH_OMAP2PLUS || ARCH_MULTIPLATFORM
> -	select OMAP2_DSS
>  	select DRM_KMS_HELPER
>  	select VIDEOMODE_HELPERS
>  	select HDMI
> -- 
> 2.26.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AED282ADB65
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 17:15:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C8D489B99;
	Tue, 10 Nov 2020 16:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F56D89B78
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 16:15:28 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id w24so3598706wmi.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 08:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=7CGWOWW/W5NZPaOpqTfKKcrmTlDUB36jZ3I9AkmIH6I=;
 b=Oyb2FmYMYcgg5GEthU7jt9bPL3ouAxvWpva7pbs8v91NGyhpUCqh7bYu4tkpyT0ALU
 x4A/AOa1lWZB0RDjFVBwRe6INqMWSkMViRHDSXCBUBaZoq73SLM1M4v1iJyCtmmTVKDH
 6/2eIt4EyxEhLJNA5JflypvukRIdCSQYuaqFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=7CGWOWW/W5NZPaOpqTfKKcrmTlDUB36jZ3I9AkmIH6I=;
 b=Lsqc5PHPOvCCZ4weBXIVX2FuJNxn2UBsxmhu5n952Yn4tJjyDDddBOoErr0EJtKWVe
 kAxdSHcTk9sIaAtn5YKE6Fn5BIXTdhEyVV0OWxQnXfs2iXwoHyZ/gYifJsLrXDb9rljB
 mYe/BwB8r5NUseq6aXNvOdn6E56FCSzTO2pgJuqkQYu6qe2qLGCTRMZJQfOLwzQ6PL6H
 uUdMqCl6/ZtpQF7doJ8kzg5rWAxt43Xg0zUr44YmqEf0amM9XNnDRyrmmUKPqINOK13f
 p3WmG5jb1BiugIfOhM8WLSkn1X/7VdoGb789a/kJbkI9CojSTYZ6bb+xkmSKqehsh3Q3
 ag+Q==
X-Gm-Message-State: AOAM533Y9AqezFq82uanzHQT8ufieciEwku4XPbgrFDr1jhprTNED5nR
 lcJQpmye3Ez/Hl+bWi348ctk0A==
X-Google-Smtp-Source: ABdhPJwhsIWxla7qG5MoctbGmInEVIF8xoR14d/2DvWqNkUzSlrZ+dLToTW7q8cmJUQcQpt1J4zGTw==
X-Received: by 2002:a1c:7213:: with SMTP id n19mr492446wmc.36.1605024927076;
 Tue, 10 Nov 2020 08:15:27 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q17sm2660356wro.36.2020.11.10.08.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 08:15:26 -0800 (PST)
Date: Tue, 10 Nov 2020 17:15:23 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] drm: DRM_KMB_DISPLAY should depend on ARCH_KEEMBAY
Message-ID: <20201110161523.GN401619@phenom.ffwll.local>
Mail-Followup-To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Edmund Dea <edmund.j.dea@intel.com>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20201110144350.3279147-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201110144350.3279147-1-geert+renesas@glider.be>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: David Airlie <airlied@linux.ie>, Edmund Dea <edmund.j.dea@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 10, 2020 at 03:43:50PM +0100, Geert Uytterhoeven wrote:
> The Intel Keem Bay display controller is only present on Intel Keem Bay
> SoCs.  Hence add a dependency on ARCH_KEEMBAY, to prevent asking the
> user about this driver when configuring a kernel without Intel Keem Bay
> platform support.
> 
> Note that:
>   1. The dependency on ARM is dropped, as Keem Bay SoCs are only
>      supported in arm64 kernel builds,
>   2. The dependencies on OF and COMMON_CLK can be dropped for
>      compile-testing, as the driver builds fine regardless.
> 
> Fixes: ed794057b052b52a ("drm/kmb: Build files for KeemBay Display driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Both drm/kmb fixes applied to drm-misc-next, thanks a lot!
-Daniel

> ---
>  drivers/gpu/drm/kmb/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/kmb/Kconfig b/drivers/gpu/drm/kmb/Kconfig
> index 022ef3e3f05635be..3921c57ac511e2fb 100644
> --- a/drivers/gpu/drm/kmb/Kconfig
> +++ b/drivers/gpu/drm/kmb/Kconfig
> @@ -1,7 +1,7 @@
>  config DRM_KMB_DISPLAY
>  	tristate "INTEL KEEMBAY DISPLAY"
> -	depends on DRM && OF && (ARM || ARM64)
> -	depends on COMMON_CLK
> +	depends on DRM
> +	depends on ARCH_KEEMBAY || COMPILE_TEST
>  	select DRM_KMS_HELPER
>  	select DRM_KMS_CMA_HELPER
>  	select DRM_GEM_CMA_HELPER
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

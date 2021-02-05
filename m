Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF82310D80
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 16:58:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B0D76F47B;
	Fri,  5 Feb 2021 15:58:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 965846F47B
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 15:58:36 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id p15so8194966wrq.8
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Feb 2021 07:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rK3MsyMoEulHKJ/zMGt+yFnGJfCMJt45GtoaiFHKLNM=;
 b=HlEoQlKL1WMDSW/dbWjebJvJeGoJqsOQNhOLH4KskcJ5ovqAWNRjqWx656HUnurYzY
 aJCQw3map2w36uUARjhYDpsXUTl+Fiypla/lOshrYTbx0CWRBEw4k6fE3sirWBwbU1bU
 yOQtGYKrnGaYqJwBMYgt89UvBpBixm2MXH2dE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rK3MsyMoEulHKJ/zMGt+yFnGJfCMJt45GtoaiFHKLNM=;
 b=MnGDMhjnA7TqRURf8NLxJmyL2Nl+qDaooqC35xK2RTyjDmllin6QGrMoOc2ecPfUuy
 uQvkKBmsneh9afr+HxHbZoH/QXPJaW+nAlTd0OlZmgkO5MuQqlPSsv/W67RFE6ROwGwe
 q7bqkp9suDegCQnBahJJMYNTBf4GndA1gIAnTaDfDUXXGfHeiwvOIELlhpq4n5gl3Ogg
 X/LMNL2ygOUwU+WUSMJGWp/wqwUwbsk4OEdeONznsTZGPsmDhql5PGxCSQ7ye9JBXbvl
 0adz7qGWcvdnB1ON2p/Kkh+BSxbjUa3hUnV78RhQ9dlL2J3ZPbCQcfNo4RkcdzhaG9W4
 DYsA==
X-Gm-Message-State: AOAM5335A+F3D8/78gv7C0odDHOvKwWcMl6+kj059MrzggHUFAK4PpZq
 d5NlEzNeT2cMybhMcyzm+q94KHrlL6S4yS25
X-Google-Smtp-Source: ABdhPJw5mK5eU3ZApKRmHlpqbA/vwgJF48hPWYROVF7p+9T6lqAPcoiKSI0gDJJNGSaig1R/RxbCXA==
X-Received: by 2002:a05:6000:1201:: with SMTP id
 e1mr5814548wrx.112.1612540715258; 
 Fri, 05 Feb 2021 07:58:35 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f7sm11827960wre.78.2021.02.05.07.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 07:58:34 -0800 (PST)
Date: Fri, 5 Feb 2021 16:58:32 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] drm/i915: Autoselect CONFIG_CHECKPOINT_RESTORE for
 SYS_kcmp
Message-ID: <YB1rKLGvpnFDom11@phenom.ffwll.local>
References: <20210205130307.8294-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210205130307.8294-1-chris@chris-wilson.co.uk>
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
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 05, 2021 at 01:03:07PM +0000, Chris Wilson wrote:
> gallium (iris) depends on os_same_file_description() to disambiguate
> screens and so avoid importing the same screen fd twice as two distinct
> entities (that share all the kernel resources, so actions on screen
> affect the other and would cause random faiure). As they depend on it,
> so must we. os_same_file_description() uses SYS_kcmp to check the file
> tables for the equivalent struct file, but SYS_kcmp is hidden behind
> CONFIG_CHECKPOINT_RESTORE. As this is not default, we must select it for
> ourselves to ensure that our userspace is fully supported.
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/3046
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>

Hm shouldn't we crank this up to CONFIG_DRM?

Or embedded folks going to be unhappy about that? If so I guess we'd need
to pull out just the SYS_kcmp part ...

Asking because I think Bas is also looking at this, and it's not great if
we're building on this and then users end up with very subtly broken gl/vk
stacks :-/
-Daniel

> ---
>  drivers/gpu/drm/i915/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> index 1e1cb245fca7..470a5214bd33 100644
> --- a/drivers/gpu/drm/i915/Kconfig
> +++ b/drivers/gpu/drm/i915/Kconfig
> @@ -21,6 +21,7 @@ config DRM_I915
>  	select ACPI_VIDEO if ACPI
>  	select ACPI_BUTTON if ACPI
>  	select SYNC_FILE
> +	select CHECKPOINT_RESTORE # gallium depends on SYS_kcmp
>  	select IOSF_MBI
>  	select CRC32
>  	select SND_HDA_I915 if SND_HDA_CORE
> -- 
> 2.20.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

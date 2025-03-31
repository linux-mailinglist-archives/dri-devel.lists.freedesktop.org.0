Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E826BA764B7
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 13:03:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EDE510E3D8;
	Mon, 31 Mar 2025 11:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="LyocLm9Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A17110E3D7
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 11:03:42 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5e5e22e6ed2so6450456a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 04:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1743419021; x=1744023821; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W0baC4YlxovWBg32x4oOh4BRryuR9bo09gX/qacWoD0=;
 b=LyocLm9ZcJlgTITNplWNzfZXAyS07WijNA2VuzbOHwC+ntd7wioKcFGRAM+OGraLWf
 97oGv5RORg0rO70LMXeNvdkCcSOSq8gFLKzL81N6CDWN67ppolAtV7NgGNe/Jvw9E5/2
 wI1tauMZ+s9FVn1P0/UoLnS56hvKL3V/R8sPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743419021; x=1744023821;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W0baC4YlxovWBg32x4oOh4BRryuR9bo09gX/qacWoD0=;
 b=DM4ms0rRLba/As/po8KpAnVhCCrSUusjbAxVOoI5g0DmzDrf6ORLO273hd5oGn+dYt
 yrb/fz52Sla27+SBImnYbyxLfuKguLqb8R+ezlrnAayeOaM4AnLt5/Xs/JyIMe4V+0mH
 XYvz2lxyQSqI5R4R0/wwRUft2HJ9ZQX/dH/W41peL7wyLaRLFPHJDWIj0S6qOIqdWNqy
 QISoklg+80fvczl11YcwFIQDAPHYlYNzaXmceUPoKWDjN9f03VjtLWTC0vXeSQP+7b6u
 j6XDti7nrnTQ4aANbx45LpvFnky1OyiTseTABaiP0ceSXVSxH/qAWPqyKm16BScx4jDt
 EPLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8DeNdYtEDOYPwkdjUvYt7QD0Adyn98f/5+tHndc1+g/nv9g3XKxV9GTNR0mQPg//6cAccAgX3ltM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxI90kPXSzuQgm2fufHCSdcw1pFE3a3oLWHGKQ84j4ZWOmG8qbm
 UYoVeSpCDB4Fv2hOWTJxRMBJZL/4gpvPSvpAAFHYgO1N2pqXbafrtEabjiy+t7M=
X-Gm-Gg: ASbGncsMSb4XeHHXENvOtRAaRENRRQ/jUoBZJNEj5jMIR2NhIEzsyB3JSy5DkUwwCx1
 F29ffuqdR10f9JEYqdVhYvyZb/rs5xnP9WTJI9ZI9AD/C31LI6ldYQKtgpTy3LN8Lyz6QYBP3KC
 3L4tBv3NCBoKJ4fMpEkWv24yBk5ObkknKz7+X7SBFlaIsmFnwjn412H29qoBn330mz9wPj//qh2
 JBfxEcrr9GvbkxK1tFQqPZWjuZQZZ0tHcZTuw/QJ6FIQ5D8zDg04O/TPCI/Zpt1Cw4z0dWY30LD
 eaCXw+uEJlZ1xL4C7YQKK0W1fS1aC9y3tGzUJAsUsBuu2Wmc4Sp8XSbn
X-Google-Smtp-Source: AGHT+IGbEkLt/pdqtr7jHdhTlllynrPZYy1qTEFfhq/Z7GtBF5C0yu87OoFAg4/L8QbcYZjR08Rfng==
X-Received: by 2002:a17:907:2d07:b0:ac3:ed4c:6a17 with SMTP id
 a640c23a62f3a-ac738a36df5mr636160766b.24.1743419020662; 
 Mon, 31 Mar 2025 04:03:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5edc16ef7b2sm5776884a12.40.2025.03.31.04.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 04:03:40 -0700 (PDT)
Date: Mon, 31 Mar 2025 13:03:38 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Airlie <airlied@gmail.com>, simona.vetter@ffwll.ch,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [git pull] drm for 6.15-rc1
Message-ID: <Z-p2ii-N2-dd_HJ6@phenom.ffwll.local>
Mail-Followup-To: Jani Nikula <jani.nikula@linux.intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Airlie <airlied@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <CAPM=9tyx=edsZ3ajuAUAv4vjfa=WNEzobqAsYbBTjCfLbuEeFQ@mail.gmail.com>
 <CAHk-=wjcdfrDTjzm6J6T-3fxtVyBG7a_0BXc2=mgOuM6KPFnCg@mail.gmail.com>
 <87h6394i87.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h6394i87.fsf@intel.com>
X-Operating-System: Linux phenom 6.12.17-amd64 
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

Hi Linus,

On Mon, Mar 31, 2025 at 01:17:28PM +0300, Jani Nikula wrote:
> On Fri, 28 Mar 2025, Linus Torvalds <torvalds@linux-foundation.org> wrote:
> > If you want to do that hdrtest thing, do it as part of your *own*
> > checks. Don't make everybody else see that disgusting thing and have
> > those turds in their trees.
> >
> > I'll just disable it by marking it BROKEN for now. You guys can figure
> > out what you want to do, but no, forcing others to see those things is
> > not the answer.
> 
> Fair. I hear you.

Mea culpa also from the drm maintainer side. As Jani explains below, we
really want to make this and similar things happen in drm, and we thought
this much more limited version would address your concerns. Evidently not.
We also got a heads-up from the Kbuild maintainer that you really don't
like this, and I guess that wasn't clear enough in the pr cover letter.
Plus at that point it was all already in drm-next, and we figured it's not
worth the trouble of pulling it out and doing a separate topic branch pr
so you can check it out separately.

Hindsight and all that.

Cheers, Sima

> 
> > I would suggest you *not* make this part of the Kconfig setup and
> > normal build at all, but be something where *you* can run it as part
> > of your tests (ie do it as a "make drm-hdrtest" kind of thing, not as
> > part of regular builds).
> 
> I would very much prefer for this to be part of the build, just hidden
> behind Kconfig. We're doing build-time checks, and kbuild gives us all
> the machinery to make it happen. Without the dependency tracking you'd
> have to check everything every time, and that's just going to mean
> people won't run it.
> 
> I suggest a Kconfig knob to truly make this opt-in, only for developers
> who actually want it. Not enabled by allmodconfig or allyesconfig or
> even allnoconfig. Only if you manually enable it. And yes, that's how it
> should've been from the start. My bad.
> 
> Below's a patch to make it happen. We'll probably want to add more
> checks like this in the future. We want to catch a whole bunch of build
> issues up front. We want to be clean of e.g. W=1 and kernel-doc issues
> pre-merge instead of doing extra rounds of fixes afterwards.
> 
> BR,
> Jani.
> 
> 
> 
> From 8c709510caab4b4ad6aa73cbcd972f32b58cad8d Mon Sep 17 00:00:00 2001
> From: Jani Nikula <jani.nikula@intel.com>
> Date: Mon, 31 Mar 2025 12:25:45 +0300
> Subject: [PATCH] drm: add config option for extra build-time checks
> Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
> Cc: Jani Nikula <jani.nikula@intel.com>
> 
> The DRM subsystem contains additional build-time checks, primarily aimed
> at DRM developers and CI systems. The checks may be overzealous. They
> may slow down or fail the build altogether. They may create excessive
> dependency files in the build tree. They should not be enabled for
> regular builds, and certainly not forced on unsuspecting developers
> running an allyesconfig or allmodconfig build.
> 
> Add config DRM_DISABLE_EXTRA_BUILD_CHECKS, enabled by default as well as
> by allyesconfig/allmodconfig, hiding the extra checks from anyone but
> people who intentionally opt-in for the checks.
> 
> For example, to enable header tests:
> 
> $ scripts/config --disable CONFIG_DRM_DISABLE_EXTRA_BUILD_CHECKS --enable CONFIG_DRM_HEADER_TEST
> $ make olddefconfig
> 
> Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
> Closes: https://lore.kernel.org/r/CAHk-=wjcdfrDTjzm6J6T-3fxtVyBG7a_0BXc2=mgOuM6KPFnCg@mail.gmail.com
> Fixes: 62ae45687e43 ("drm: ensure drm headers are self-contained and pass kernel-doc")
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/Kconfig | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 2cba2b6ebe1c..5a3fce9ef998 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -489,9 +489,26 @@ config DRM_PRIVACY_SCREEN
>  	bool
>  	default n
>  
> +# Reversed option to disable on allyesconfig/allmodconfig builds
> +config DRM_DISABLE_EXTRA_BUILD_CHECKS
> +	bool "Disable DRM subsystem extra build-time checks"
> +	default y
> +	help
> +	  The DRM subsystem contains additional build-time checks, primarily
> +	  aimed at DRM developers and CI systems. The checks may be
> +	  overzealous. They may slow down or fail the build altogether. They may
> +	  create excessive dependency files in the tree. They should not be
> +	  enabled for regular builds, and thus they are disabled by default.
> +
> +# Proxy config to allow simple "depends on DRM_EXTRA_BUILD_CHECKS"
> +config DRM_EXTRA_BUILD_CHECKS
> +	bool
> +	depends on DRM && EXPERT && DRM_DISABLE_EXTRA_BUILD_CHECKS=n
> +	default !DRM_DISABLE_EXTRA_BUILD_CHECKS
> +
>  config DRM_WERROR
>  	bool "Compile the drm subsystem with warnings as errors"
> -	depends on DRM && EXPERT
> +	depends on DRM_EXTRA_BUILD_CHECKS
>  	depends on !WERROR
>  	default n
>  	help
> @@ -505,7 +522,7 @@ config DRM_WERROR
>  
>  config DRM_HEADER_TEST
>  	bool "Ensure DRM headers are self-contained and pass kernel-doc"
> -	depends on DRM && EXPERT && BROKEN
> +	depends on DRM_EXTRA_BUILD_CHECKS
>  	default n
>  	help
>  	  Ensure the DRM subsystem headers both under drivers/gpu/drm and
> -- 
> 2.39.5
> 
> 
> -- 
> Jani Nikula, Intel

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

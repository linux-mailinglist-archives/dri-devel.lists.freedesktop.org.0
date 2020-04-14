Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 548691A7AFC
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 14:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044D389C49;
	Tue, 14 Apr 2020 12:41:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A345589C49
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 12:41:36 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id j2so14147008wrs.9
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 05:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=EOTA3Bl8xK7jbI/7Nx56mhbuxCAqHFdnbLl81CCUHsQ=;
 b=SAi6aRueQ5Zyf7tLT2VCOAgQfNIxII4FkFQe+ghkqK3mPNmGOXJYz88+RE3XsXdRi6
 pI0oSaGVyF7xDMAM9kwkKlt7DjRomsEap9SMshCDqJXjPRJo2hwkBrrB0P9+mCDiBJ3x
 kRKLEK5KpPf4yrnR71LhJXZxP/UV/q63+DjlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=EOTA3Bl8xK7jbI/7Nx56mhbuxCAqHFdnbLl81CCUHsQ=;
 b=V6Hr9kWpd3Yq8iNUfuEHbcvlY7GHtzBJhEhohXjcrhkHVB+sn/oseyp0FU9/M89w1O
 eVju8COP27sdrPI71ejck25XugE3bnKJEAZ0jNJfTPZTm8czvT+E90IwU8eB8pftSCiq
 5DoAbywo2nCXfuEivEE5E3ZNUpuMdZDgtEdTvIDNmJrBLXH/2J/XWsI1L5n3Y7rv5opl
 7HfQxZMW7ITq7o0EnwhAVYutuB7MUpivGUFEFND/85d9nf6hGM4ItbKRBs26GcOf4xSF
 RpUsLzCYvV6FNicLBOgaQdh1id8m+Zs4cmtySAYEFjHBJU7tUHe0b5lNWR7+IW5JkJTm
 gJyQ==
X-Gm-Message-State: AGi0PuauXp6Q1D9ukD+JwzgCIlJ4gVFcXNCALp18rq5qqaziaWGBugYr
 j+kMiU2JIacXMVMpmTEDmGq5BZQGrl0=
X-Google-Smtp-Source: APiQypLKGFmCSvctczx8VqjOVo8EhZPFdvd9ehQw9JMKKTphUeYZwccZm2MYcJ+RgiNCMDJUQcRwEQ==
X-Received: by 2002:adf:cc8c:: with SMTP id p12mr23416418wrj.165.1586868095238; 
 Tue, 14 Apr 2020 05:41:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v21sm18064169wmj.8.2020.04.14.05.41.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 05:41:34 -0700 (PDT)
Date: Tue, 14 Apr 2020 14:41:32 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Yussuf Khalil <dev@pp3345.net>
Subject: Re: [PATCH 1/5] drm/modes: Indicate CEA-861 CE modes to user-space
Message-ID: <20200414124132.GV3456981@phenom.ffwll.local>
Mail-Followup-To: Yussuf Khalil <dev@pp3345.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20200413214024.46500-1-dev@pp3345.net>
 <20200413214024.46500-2-dev@pp3345.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200413214024.46500-2-dev@pp3345.net>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 13, 2020 at 11:40:22PM +0200, Yussuf Khalil wrote:
> Add a new flag to mark modes that are considered a CE mode according to the
> CEA-861 specification. Modes without this flag are implicitly considered to
> be IT modes.
> 
> User-space applications may use this flag to determine possible
> implications of using a CE mode (e.g., limited RGB range).
> 
> There is no use for this flag inside the kernel, so we set it only when
> communicating a mode to user-space.
> 
> Signed-off-by: Yussuf Khalil <dev@pp3345.net>

Do we have userspace for this?

If we go with the existing quant range property you don't need new
userspace for the property itself. But this flag here is new uapi, so
needs userspace per

https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements

Also since this standardizes kms uapi, we need testcases per

https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#testing-requirements-for-userspace-api

Cheers, Daniel

> ---
>  drivers/gpu/drm/drm_modes.c | 14 ++++++++++++++
>  include/uapi/drm/drm_mode.h |  2 ++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index d4d64518e11b..0d8a032f437d 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -1973,6 +1973,14 @@ void drm_mode_convert_to_umode(struct drm_mode_modeinfo *out,
>  		break;
>  	}
>  
> +	if (drm_match_cea_mode(in) > 1) {
> +		/*
> +		 * All modes in CTA-861-G Table 1 are CE modes, except 640x480p
> +		 * (VIC 1).
> +		 */
> +		out->flags |= DRM_MODE_FLAG_CEA_861_CE_MODE;
> +	}
> +
>  	strncpy(out->name, in->name, DRM_DISPLAY_MODE_LEN);
>  	out->name[DRM_DISPLAY_MODE_LEN-1] = 0;
>  }
> @@ -2045,6 +2053,12 @@ int drm_mode_convert_umode(struct drm_device *dev,
>  		return -EINVAL;
>  	}
>  
> +	/*
> +	 * The CEA-861 CE mode flag is purely informational and intended for
> +	 * userspace only.
> +	 */
> +	out->flags &= ~DRM_MODE_FLAG_CEA_861_CE_MODE;
> +
>  	out->status = drm_mode_validate_driver(dev, out);
>  	if (out->status != MODE_OK)
>  		return -EINVAL;
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 735c8cfdaaa1..5e78b350b2e2 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -124,6 +124,8 @@ extern "C" {
>  #define  DRM_MODE_FLAG_PIC_AR_256_135 \
>  			(DRM_MODE_PICTURE_ASPECT_256_135<<19)
>  
> +#define DRM_MODE_FLAG_CEA_861_CE_MODE (1<<23)
> +
>  #define  DRM_MODE_FLAG_ALL	(DRM_MODE_FLAG_PHSYNC |		\
>  				 DRM_MODE_FLAG_NHSYNC |		\
>  				 DRM_MODE_FLAG_PVSYNC |		\
> -- 
> 2.26.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

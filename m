Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC6911E945
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 18:33:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648CF6EB79;
	Fri, 13 Dec 2019 17:33:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD5A6EB79
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 17:33:54 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id d5so423968wmb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 09:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=F3/RX5pz9qAXeL/5DUblSLPQEe7d0L4mzOA7bkof7+M=;
 b=DoWN+4rUDaes49FWEO01I6QZQBXvLGlnQhCfyxypkbFKOKAyzZYZmY7ue2cDGiaoL7
 ONg4ycH+OnfRffekvxonkA7lqNn59TKgal+q3GvfQX0988A1XVdvu0eBllAo0kHi7pvK
 CS7Gq2cgBsgPa+MVg87nYNxXc2SGzmqi14VmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=F3/RX5pz9qAXeL/5DUblSLPQEe7d0L4mzOA7bkof7+M=;
 b=ku7cG1eATRcdSdmSqbC8aPZIlTDGLvyeZbC49iPYOiJRYQm/ah8mKcO1SwgwjxKtVX
 vtiB4CXxNM8shiXVxqPY71qEq4xbi+e3qMjY2tvNG/NYeiUQ0DblUC+T1hF7pcFzj2eu
 DP1EQ2uCMJzPt8XQEb4pI7Imtd8My7AhteOVllwIRu9xDTmP7rXshl6648AmsnRq+uc2
 1i8AhuY26iLSXsACd7xuwqDAt3bUL8SYoqEeewKKXF0lC8WHrROjHxdhnktCiG680La9
 1QLOMeQ96Sd1Gv0PM6UjwgroqyjMGXpclLLW5+r/pWOfESq1A0xlLWE6P3OjYLQXnlNB
 UZAA==
X-Gm-Message-State: APjAAAUe7DqfhENNBczBGv5FYVr+MTRTAhmmD6s/kVTZYhXp8TzfIYqY
 oTI6jWB3INqDQMWxzAy66m7tgA==
X-Google-Smtp-Source: APXvYqyHDXY2mh6ELXw3SZaxk9FD3WJ6fytZc5ftzi3N/NfPmv6IgMjAR7zwPTe6BVA+FN0qxslYkw==
X-Received: by 2002:a1c:964f:: with SMTP id y76mr14581079wmd.62.1576258433003; 
 Fri, 13 Dec 2019 09:33:53 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id o7sm10912370wmc.41.2019.12.13.09.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 09:33:52 -0800 (PST)
Date: Fri, 13 Dec 2019 18:33:50 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCHv4 06/36] drm/gem-fb-helper: Add method to allocate struct
 drm_framebuffer
Message-ID: <20191213173350.GJ624164@phenom.ffwll.local>
References: <20191213155907.16581-1-andrzej.p@collabora.com>
 <20191213155907.16581-7-andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191213155907.16581-7-andrzej.p@collabora.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, kernel@collabora.com,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Sandy Huang <hjc@rock-chips.com>, James Wang <james.qian.wang@arm.com>,
 dri-devel@lists.freedesktop.org, Mihail Atanassov <mihail.atanassov@arm.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 13, 2019 at 04:58:37PM +0100, Andrzej Pietrasiewicz wrote:
> Some drivers might want to use the modifier_info field of struct
> drm_framebuffer to hold struct drm_afbc. The memory for the latter must
> be managed by the driver. To eliminate the need to modify existing
> invocations of kfree(fb), add a function to allocate struct drm_framebuffer
> and its associated struct drm_afbc in one chunk.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 32 ++++++++++++++++++++
>  include/drm/drm_gem_framebuffer_helper.h     |  1 +
>  2 files changed, 33 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index e20f4d00b0a5..0338f303f988 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -21,6 +21,13 @@
>  #include <drm/drm_modeset_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
>  
> +#define DRM_ALIGN_MASK(type) \
> +	(__alignof__(type) - 1)
> +#define DRM_INFO_OFFSET(type1, type2)	\
> +	((sizeof(type1) + DRM_ALIGN_MASK(type2)) & ~DRM_ALIGN_MASK(type2))
> +#define DRM_COMPOUND_SIZE(type1, type2) \
> +	(DRM_INFO_OFFSET(type1, type2) + sizeof(type2))
> +
>  #define AFBC_HEADER_SIZE		16
>  #define AFBC_TH_LAYOUT_ALIGNMENT	8
>  #define AFBC_SUPERBLOCK_PIXELS		256
> @@ -59,6 +66,31 @@ struct drm_gem_object *drm_gem_fb_get_obj(struct drm_framebuffer *fb,
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_fb_get_obj);
>  
> +/**
> + * drm_gem_fb_alloc_with_afbc() - Allocate struct drm_framebuffer together
> + *				  with a struct drm_afbc for easier freeing
> + *				  and assign drm_framebuffer's modifier_info
> + *
> + * Returns:
> + * Pointer to drm_framebuffer on success or NULL
> + */
> +struct drm_framebuffer *drm_gem_fb_alloc_with_afbc(void)
> +{
> +	struct drm_framebuffer *fb;
> +
> +	/* alloc in one chunk to ease freeing */
> +	fb = kzalloc(DRM_COMPOUND_SIZE(struct drm_framebuffer, struct drm_afbc),
> +		     GFP_KERNEL);
> +	if (!fb)
> +		return NULL;
> +
> +	fb->modifier_info =
> +		fb + DRM_INFO_OFFSET(struct drm_framebuffer, struct drm_afbc);

That's not how we do subclassing in general ... (so also no on patch 1).
What I mean here is:

struct drm_afbc {
	struct drm_framebuffer base;
	/* additional afbc information goes here, _not_ into struct
	 * drm_framebuffer */
}

#define drm_framebuffer_to_afbc(fb) container_of(fb, struct drm_afbc, base)

Both probably best stuffed into drm_plane.h

Aside from that style issue I think the core/helper work of this patch
series is getting there. But I didn't read the details (and probably wont
get to that before the new year because stuff and vacations).

Cheers, Daniel

> +
> +	return fb;
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_fb_alloc_with_afbc);
> +
>  int drm_gem_fb_init_with_funcs(struct drm_framebuffer *fb,
>  			       struct drm_device *dev,
>  			       const struct drm_mode_fb_cmd2 *mode_cmd,
> diff --git a/include/drm/drm_gem_framebuffer_helper.h b/include/drm/drm_gem_framebuffer_helper.h
> index 3d6015194b3c..4e7b1e2c765b 100644
> --- a/include/drm/drm_gem_framebuffer_helper.h
> +++ b/include/drm/drm_gem_framebuffer_helper.h
> @@ -42,6 +42,7 @@ struct drm_afbc {
>  
>  struct drm_gem_object *drm_gem_fb_get_obj(struct drm_framebuffer *fb,
>  					  unsigned int plane);
> +struct drm_framebuffer *drm_gem_fb_alloc_with_afbc(void);
>  int drm_gem_fb_init_with_funcs(struct drm_framebuffer *fb,
>  			       struct drm_device *dev,
>  			       const struct drm_mode_fb_cmd2 *mode_cmd,
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

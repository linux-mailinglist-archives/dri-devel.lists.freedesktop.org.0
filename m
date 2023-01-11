Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E108E666667
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 23:48:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A5610E821;
	Wed, 11 Jan 2023 22:48:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C779A10E821
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 22:48:22 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 ay12-20020a05600c1e0c00b003d9ea12bafcso9998764wmb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 14:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MuTC1kfSsnFCGwUIql/f+JQxzi0KkC1wyB0xTJXr5Ts=;
 b=Js2u6sL8FqhtZhjphxzIL3gaE86ebKYot48NXEIWQNENDb+Eb98MWjB7FNlXwXpoq/
 BANyiPgyyWCJDTUcApuuxqUHQ+jpPOuNYdqJVCVu5fh5OfBocMEPOK2nvwrU8Mc3H3No
 t/M7XVCRrkCWHF6m1AvZlPx0dCnN/3h+xIJFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MuTC1kfSsnFCGwUIql/f+JQxzi0KkC1wyB0xTJXr5Ts=;
 b=3rcOYc4EkSsEk0Ik/8KyrxlAyAZyjEhoDrnYmLe7NThkObh6xopQYy8f9xvPf/rg8Z
 JSscMCv710WwYjEw7NzdVu9C+OP0BNT2DWB3yuHGIw/X+Bk2K5QTdEpPLg4w9rCn2ty8
 W8g/hqJr9lh70CQwu8sz9L7ZLec8msGlNqw4DDlGL5NwDh5nTCsHQHafH5Zrw6OQe9Od
 OCHKApsYPw5Mh1tNdYmO5U2FGwEllcQ88ezio8RICvhRxSsUNjQ3Oq7dw4Q5m4sirguB
 ZQxPoet+lqxLmQpKR3StDdRAyzAFBU+MeMyYlW5RYsWAZ7vnm+1RpSG+/N+zuiy1bW7W
 ivDw==
X-Gm-Message-State: AFqh2kpBeG+n7jW+nu0CEYdk5INcuweQxNv756cVu0tWCQ48qlmlgd8e
 pPf77cdM2K5WbDAVkRtSLn0Jhw==
X-Google-Smtp-Source: AMrXdXvoDs7MQW5PQ7RzZespb/rcshZIoq997FGciTLRdcJkKhPXNXwGGbOLkwOcvkezldhUaExRuw==
X-Received: by 2002:a05:600c:22d4:b0:3cf:82b9:2fe6 with SMTP id
 20-20020a05600c22d400b003cf82b92fe6mr63787861wmg.8.1673477301281; 
 Wed, 11 Jan 2023 14:48:21 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 l36-20020a05600c1d2400b003d9fb59c16fsm7183671wms.11.2023.01.11.14.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 14:48:20 -0800 (PST)
Date: Wed, 11 Jan 2023 23:48:18 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH 1/5] drm/framebuffer: Check for valid formats
Message-ID: <Y788su0QVqdBz5bo@phenom.ffwll.local>
References: <20230109105807.18172-1-mcanal@igalia.com>
 <20230109105807.18172-2-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230109105807.18172-2-mcanal@igalia.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 09, 2023 at 07:58:04AM -0300, Maíra Canal wrote:
> Currently, framebuffer_check() doesn't check if the pixel format is
> supported, which can lead to the acceptance of invalid pixel formats
> e.g. the acceptance of invalid modifiers. Therefore, add a check for
> valid formats on framebuffer_check(), so that the ADDFB2 IOCTL rejects
> calls with invalid formats.
> 
> Moreover, note that this check is only valid for atomic drivers,
> because, for non-atomic drivers, checking drm_any_plane_has_format() is
> not possible since the format list for the primary plane is fake, and
> we'd therefore reject valid formats.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  Documentation/gpu/todo.rst        | 9 ++++-----
>  drivers/gpu/drm/drm_framebuffer.c | 8 ++++++++
>  2 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 1f8a5ebe188e..3a79c26c5cc7 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -276,11 +276,10 @@ Various hold-ups:
>  - Need to switch to drm_fbdev_generic_setup(), otherwise a lot of the custom fb
>    setup code can't be deleted.
>  
> -- Many drivers wrap drm_gem_fb_create() only to check for valid formats. For
> -  atomic drivers we could check for valid formats by calling
> -  drm_plane_check_pixel_format() against all planes, and pass if any plane
> -  supports the format. For non-atomic that's not possible since like the format
> -  list for the primary plane is fake and we'd therefor reject valid formats.
> +- Need to switch to drm_gem_fb_create(), as now framebuffer_check() checks for
> +  valid formats for atomic drivers.
> +
> +- Add an addfb format validation for non-atomic drivers.
>  
>  - Many drivers subclass drm_framebuffer, we'd need a embedding compatible
>    version of the varios drm_gem_fb_create functions. Maybe called
> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
> index aff3746dedfb..605642bf3650 100644
> --- a/drivers/gpu/drm/drm_framebuffer.c
> +++ b/drivers/gpu/drm/drm_framebuffer.c
> @@ -280,6 +280,14 @@ static int framebuffer_check(struct drm_device *dev,
>  		}
>  	}
>  
> +	/* Verify that the modifier is supported. */
> +	if (drm_drv_uses_atomic_modeset(dev) &&
> +	    !drm_any_plane_has_format(dev, r->pixel_format, r->modifier[0])) {
> +		drm_dbg_kms(dev, "Unsupported pixel format %p4cc / modifier 0x%llx\n",
> +			    &r->pixel_format, r->modifier[0]);
> +		return -EINVAL;
> +	}
> +
>  	return 0;
>  }
>  
> -- 
> 2.39.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

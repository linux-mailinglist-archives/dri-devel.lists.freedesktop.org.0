Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC30666666C
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 23:50:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 495A610E832;
	Wed, 11 Jan 2023 22:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65DF110E82E
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 22:50:20 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 m26-20020a05600c3b1a00b003d9811fcaafso13778453wms.5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 14:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+sQGs0x5broQ060QblgxdkojwSBGm6c9FifhWg0Fh6c=;
 b=bCZ6q6Ng37YThePYLToZ7UZCUEVKTGd+x9Jav7Yuj9c44zg/kzbHK6bfbRDkFpqX2h
 AOhC3rMtzc2Mjd7BO7rHu6k35iRDmYm3sK5fTSbxvpa0LihB7BJNCS+SEbDhIFPmJEVs
 9sIFR3IuM+9ogXWM4NUiVFhJCqmAdfcUnaQNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+sQGs0x5broQ060QblgxdkojwSBGm6c9FifhWg0Fh6c=;
 b=5yIxC28DxIqy1ppQ/hROTHVxUlAvrGigbiHdz4OF6DoX8HWAr+NGkU0cAGZ8EWHk2I
 C73ZPBu3doVYOsO+qbiHDOwuH5CuCAnzwNrHCqje4JLS4liDhX42gRupZ/F2VJQzD09I
 DuijNrHNJiiZNfoexheb4Wa7DywWYGb1Z8GLXLBUaGh1MhksJIYjxZzIqQSwHeHaqKIS
 Mvvk9LfpSWR8vdqNlFivW+fi/3ePMOGpm6rEmj+KHp9sUTnZtxImwB9Wc1yjnptSOtUH
 WM7u2mFdttUbNeaJf57gFk/SQu6Cxuz//WGV+G9YWq8WqITSQRzmcfZ6cagfOXuP7xqJ
 25Zw==
X-Gm-Message-State: AFqh2kqsFxXBr0AIWyZ0Tl9zKRjSgiISbM8uyfOMhpuXIpOU7nG8L4hr
 RGdIpx9o8/rf6t9tD1mciRwOmw==
X-Google-Smtp-Source: AMrXdXspeQJHJT9AVEAbvVxV9Me8z0LaalWZChGsvYCqMMnkIdi3e4pfpWQIJflhA0h2wwXyL1PQWg==
X-Received: by 2002:a05:600c:4fcc:b0:3d9:f91c:4bfc with SMTP id
 o12-20020a05600c4fcc00b003d9f91c4bfcmr5990323wmq.31.1673477418756; 
 Wed, 11 Jan 2023 14:50:18 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 o21-20020a1c7515000000b003d995a704fdsm19544026wmc.33.2023.01.11.14.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 14:50:17 -0800 (PST)
Date: Wed, 11 Jan 2023 23:50:15 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH 5/5] drm/plane: Unexport drm_any_plane_has_format()
Message-ID: <Y789J/xm++6lfad7@phenom.ffwll.local>
References: <20230109105807.18172-1-mcanal@igalia.com>
 <20230109105807.18172-6-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230109105807.18172-6-mcanal@igalia.com>
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

On Mon, Jan 09, 2023 at 07:58:08AM -0300, Maíra Canal wrote:
> As the format validation is being dealt with exclusively
> inside framebuffer_check(), there is no need to export the
> drm_any_plane_has_format() symbol.
> 
> Therefore, unexport the drm_any_plane_has_format() symbol, reinforcing
> that format validation is being dealt with by the DRM API.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Usually we also delete the kerneldoc at that point, since that's mainly
for driver authors and they don't need this anymore. With that

Also please move the function decl to the drm_crtc_internal.h since this
is no longer used outside of drm core/helper code.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_plane.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 24e7998d1731..67c0ab60c7b6 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -837,7 +837,6 @@ bool drm_any_plane_has_format(struct drm_device *dev,
>  
>  	return false;
>  }
> -EXPORT_SYMBOL(drm_any_plane_has_format);
>  
>  /*
>   * __setplane_internal - setplane handler for internal callers
> -- 
> 2.39.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

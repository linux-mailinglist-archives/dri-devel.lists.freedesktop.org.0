Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EBFBCAD05
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 22:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E99CB10EB04;
	Thu,  9 Oct 2025 20:35:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dGgWoL7o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F64D10EB04
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 20:35:56 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-7e3148a8928so13321246d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 13:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760042155; x=1760646955; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=v3okaB6Ra2GdOKqXM9QGEC1h+5Fvw+d98i/mY7hHa9g=;
 b=dGgWoL7o3WCcbWKXTcp0wb1bhZtEV76c7zPFNjB58/GvfdAKqwQ35UU4BcesnifcUV
 2sirHIKo5H/g29CVPbdGHFvHNvxbQsxXmnIoAFMQPhqzCDUEv/ijmOKIhuAVDMgSDkbQ
 DMmQrXIIFeQ9WYrwVuqKgJDpqbirkvW8wDZAj6aK1rtImbQr+p+avzpeYU95SEV3Lqtm
 v2XIBLAKDZ25izlSfJmxmsrSLf3KBI3WrbYJIAIgo8wxYzylenqRXwhQtnD1FMfVj6bb
 KC2BuOikZGQv9/b6QymYoeQXcU+6CZ1oSCd6t2UzoDdk7CvUmSDMJjrLhikFYLutknsp
 XjMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760042155; x=1760646955;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v3okaB6Ra2GdOKqXM9QGEC1h+5Fvw+d98i/mY7hHa9g=;
 b=g7W+M6ELWtTtE7/DBtMhZWDS+IZZG3qKfevublxy87E9MyplgVoF7J/v4tHS6VXBAl
 dvxN7BjIYu5aMNSoy8Wx4VkTYHBlPqHck/GtxBWST9ZZdTFgtuu52Yewi+Z8b6g+AV/N
 eusSkSUlS8EPU12lSWY1mdp5c2r3Iz7ihQJfjv0wAObYpgocvBELV/i3gUwDLbhrn6jB
 1luVz//ITSXQFMVymIIYyaS9va4Y6gWSOsHi7elMsw+YjwjBFzf0tqUHGAvI+Y67fbcX
 5xLiCrQkbT6mRKpqmxdZzsFIRs8nKp+CEwnkV2NBUBQbTkFqHSgqUivVH43hUvGckTya
 KBHg==
X-Gm-Message-State: AOJu0YzAicgkckVr3HXHjg/7vrJcvVoTa/J4rrTWMDx/YVhSf2aTj01h
 BpviXmWs3ZVZmGLfyU+Yl79W8XmZIOsBFPhP/4TIvLDebMlx1HfS0cx16LKfWFC4pELy0hKDJIO
 OwK4edw2FSHEeFo2sl//7unJcnP1ZICo=
X-Gm-Gg: ASbGncuNTb9GxFG6JSvldX62/lTbx4nmm9DSGBBQf/cPzlyjDyjULmlcqXO3+I0ocgT
 ReJcJQKgHDlS5sJLNfbXJXCoyjYmZXJX+0d7b+MqmKO/NeNm47Ak4HuV0K58ctGLrHUBiSC0f1D
 wgRrqGOzAYwGBJF6Japra4+nwn0gjvQOFri3mLht65OAwjEWP2ws8Gs4J1QIyepmxV2/LklHoRA
 b3fqxqWFDdSnP3Cfj53X2QtPjiTbg==
X-Google-Smtp-Source: AGHT+IHEtEM0119LDRkkhntkIgAePg/A/rgI4IXAqByCsL0tL4bbDzt3QXVE6cqIOiQqO+cFicXh/d+mhllAPM07r5I=
X-Received: by 2002:a05:6214:3001:b0:84d:5b71:8a7f with SMTP id
 6a1803df08f44-87b2ef6cbfamr128053776d6.34.1760042155002; Thu, 09 Oct 2025
 13:35:55 -0700 (PDT)
MIME-Version: 1.0
References: <20251009200354.2752095-1-zack.rusin@broadcom.com>
In-Reply-To: <20251009200354.2752095-1-zack.rusin@broadcom.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 10 Oct 2025 06:35:43 +1000
X-Gm-Features: AS18NWAU4zffEFe7Qp1HBoMBR9ExnS89hvCxQhAr1Si-GArP1hSsqRer-AZpjxc
Message-ID: <CAPM=9twGyY03RNHQZvi_AWmKQS8EnyVvT4VxGGSraoN_V89m6Q@mail.gmail.com>
Subject: Re: [PATCH] drm/syncobj: [RFC] Propagate fence errors to userspace
To: Zack Rusin <zack.rusin@broadcom.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, 
 Faith Ekstrand <faith@gfxstrand.net>
Cc: dri-devel@lists.freedesktop.org, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
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

Just adding Christian and Faith, who might have some more comments.

On Fri, 10 Oct 2025 at 06:04, Zack Rusin <zack.rusin@broadcom.com> wrote:
>
> Propagate the fence errors from drivers to userspace. Allows userspace to
> react to asynchronous errors coming from the drivers.
>
> One of the trickiest bits of drm syncobj interface is that, unexpectedly,
> the syncobj doesn't propagate the fence errors on wait. Whenever something
> goes wrong in an asynchronous task/job that uses drm syncobj to
> communicate with the userspace there's no way to convey that issue
> with userspace as drm syncobj wait function will only check whether
> a fence has been signaled but not whether it has been signaled without
> error.
>
> Instead of assuming that a signaled fence implies success grab the actual
> status of the fence and return the first fence error that has been
> spotted. Return the first error because all the subsequent errors are
> likely to be caused by the initial error in a chain of tasks.
>
> [RFC]: Some drivers (e.g. Xe) do accept drm syncobj's in the vm_bind
> and exec interface, they also call dma_fence_set_error when those
> operations asynchronously fail, currently those errors will just be
> silently ignored (because they don't propagate), I'm not sure how the
> userspace written for those drivers will react to actually receiving
> those errors, even if silently dropping those driver errors seems
> completely wrong to me.
>
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_syncobj.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index e1b0fa4000cd..bcd8eff8b59a 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -1067,6 +1067,7 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
>         struct dma_fence *fence;
>         uint64_t *points;
>         uint32_t signaled_count, i;
> +       int fence_status, first_fence_error = 0;
>
>         if (flags & (DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
>                      DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE)) {
> @@ -1170,6 +1171,9 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
>                              dma_fence_add_callback(fence,
>                                                     &entries[i].fence_cb,
>                                                     syncobj_wait_fence_func))) {
> +                               fence_status = dma_fence_get_status(fence);
> +                               if (fence_status < 0 && !first_fence_error)
> +                                       first_fence_error = fence_status;
>                                 /* The fence has been signaled */
>                                 if (flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL) {
>                                         signaled_count++;
> @@ -1213,6 +1217,14 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
>  err_free_points:
>         kfree(points);
>
> +       /*
> +        * Propagate the last fence error the code has seen, but
> +        * give precedence to the overall wait error in case one
> +        * was encountered.
> +        */
> +       if (first_fence_error < 0 && timeout >= 0)
> +               timeout = first_fence_error;
> +
>         return timeout;
>  }
>
> --
> 2.48.1
>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F6D85EDA7
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 01:10:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB3AF10E69F;
	Thu, 22 Feb 2024 00:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fl9vwlU6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49ED810E69F
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 00:10:23 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a3ed9cae56fso58567066b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 16:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708560621; x=1709165421; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/CPXuADPc1QxoMZjAwD1Xt6l0BCotJbrzUsoURBNG2E=;
 b=fl9vwlU6xtdTSHlAxkEsPxD30XnjVUgFX2oDTTVVzVm5GeL3M9lL7ZQjIo7NRBTXGK
 HzI/YzMhhXTjZfWnCqFOvbuEbF63g8tO+qlazO5bLHwONsQlVW2hzBXX+4xss7DV/zsr
 Lqto7P6nFb82CzuJ9hAJhim6TZHg9z9ADDDd2nrjADai5TrlsMW81lOxLS+RgNiTDvbV
 yx7mc6qRxWS1qZGBYO5YxwApCemxkgpwP1rPRYCNc59eIbZEIJ2YgLd1ATtMRs7PuLVO
 ihdMCJQigKx6MwJTv2dPceBmKEGkKDfwsCTd2dl2cwCQfXTw6VshZxRQGJmVwgKm9UC0
 c7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708560621; x=1709165421;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/CPXuADPc1QxoMZjAwD1Xt6l0BCotJbrzUsoURBNG2E=;
 b=HrEeVHnhIAV6W8SXeOaPVHJ1cCnN1HWvVwWN8hV/ubaKFShskiwcw/UQoadCv5t+UH
 P4nhDP/yfH2UOIkQlMACCOUjY3RtJtu2aXH5eJ+QYrsUxHAxsHWMJh5o3I/GlSkLW9B/
 fX1eifAk5I0OIKbY7tRIFgkyvLJ15gz5Ch0KTBf0uB+xEmmt7Jqm2iHLgfjfk+ErnPpy
 29r8rp2GjZLCiRUT7t8dOjAaXrFCcqHz8libT9qqBFm7fJ6JhxI9OuLhThHi8lrqXA58
 GHrHYm7Fc+xe9/ogtbCYZnMSzvw+cqa9ysbSfwCogXhUIglW5h4K7wpUbOCxZtWlUTlQ
 5s3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3D9Klz5DGfY+b8zQJfPmfJ3N3zZBmmE1iDlJEINo9WoVPJ8uXog0xB6PKXp1osQ37F+y4RWg2crv6nKr6yH7UvKkyM3ZvRj1jiDbLPf/k
X-Gm-Message-State: AOJu0YwJr9aGcZo5Qo/KErHM4nInZMAz7LO31Xw/3Yghm8Vw5UjDLzgx
 TYu5kwlB7ivzDtvYILKQ0ZV5URFEbfGGdsGoo7/EXhg8Mkojx2mfqkatcd3UiYC0ywnt+yVXASn
 zs21UjmuegHSoVsnONMnA4cji+XM=
X-Google-Smtp-Source: AGHT+IELXnOhtmbMW6Kg2uQcsTxtkawC7WB154TNxNlb1YNiPWaW6zwumy3oaWt1h6IDATIfXPScink4z0SWIKFJTa0=
X-Received: by 2002:a17:906:3398:b0:a3e:8b8e:8795 with SMTP id
 v24-20020a170906339800b00a3e8b8e8795mr748114eja.34.1708560620955; Wed, 21 Feb
 2024 16:10:20 -0800 (PST)
MIME-Version: 1.0
References: <20240119163208.3723457-1-ekurzinger@nvidia.com>
 <ZbKkfKHwYriYtSDY@phenom.ffwll.local>
 <31d1599c-e3ba-469d-b4bc-0548ef961247@nvidia.com>
In-Reply-To: <31d1599c-e3ba-469d-b4bc-0548ef961247@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 22 Feb 2024 10:10:09 +1000
Message-ID: <CAPM=9txvnaUukNgA80E2+-JuK3SkjVmGm=3S5ZCHauSg0D1Smw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/syncobj: call drm_syncobj_fence_add_wait when
 WAIT_AVAILABLE flag is set
To: Erik Kurzinger <ekurzinger@nvidia.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 contact@emersion.fr, 
 david1.zhou@amd.com, ashafer@nvidia.com, jajones@nvidia.com, 
 kbrenneman@nvidia.com
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

Can someone pick these up into misc?

Dave.

On Thu, 22 Feb 2024 at 04:48, Erik Kurzinger <ekurzinger@nvidia.com> wrote:
>
> It looks these these patches have still not been merged after one month, is there anything more that needs to be done for this to happen?
>
> On 1/25/24 10:12, Daniel Vetter wrote:
> > On Fri, Jan 19, 2024 at 08:32:06AM -0800, Erik Kurzinger wrote:
> >> When waiting for a syncobj timeline point whose fence has not yet been
> >> submitted with the WAIT_FOR_SUBMIT flag, a callback is registered using
> >> drm_syncobj_fence_add_wait and the thread is put to sleep until the
> >> timeout expires. If the fence is submitted before then,
> >> drm_syncobj_add_point will wake up the sleeping thread immediately which
> >> will proceed to wait for the fence to be signaled.
> >>
> >> However, if the WAIT_AVAILABLE flag is used instead,
> >> drm_syncobj_fence_add_wait won't get called, meaning the waiting thread
> >> will always sleep for the full timeout duration, even if the fence gets
> >> submitted earlier. If it turns out that the fence *has* been submitted
> >> by the time it eventually wakes up, it will still indicate to userspace
> >> that the wait completed successfully (it won't return -ETIME), but it
> >> will have taken much longer than it should have.
> >>
> >> To fix this, we must call drm_syncobj_fence_add_wait if *either* the
> >> WAIT_FOR_SUBMIT flag or the WAIT_AVAILABLE flag is set. The only
> >> difference being that with WAIT_FOR_SUBMIT we will also wait for the
> >> fence to be signaled after it has been submitted while with
> >> WAIT_AVAILABLE we will return immediately.
> >>
> >> IGT test patch: https://lists.freedesktop.org/archives/igt-dev/2024-January/067537.html
> >>
> >> v1 -> v2: adjust lockdep_assert_none_held_once condition
> >>
> >> Fixes: 01d6c3578379 ("drm/syncobj: add support for timeline point wait v8")
> >> Signed-off-by: Erik Kurzinger <ekurzinger@nvidia.com>
> >
> > Yeah I think this series catches now all the corner cases I spotted in v1.
> > On the series:
> >
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >> ---
> >>  drivers/gpu/drm/drm_syncobj.c | 6 ++++--
> >>  1 file changed, 4 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> >> index 94ebc71e5be5..97be8b140599 100644
> >> --- a/drivers/gpu/drm/drm_syncobj.c
> >> +++ b/drivers/gpu/drm/drm_syncobj.c
> >> @@ -1058,7 +1058,8 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
> >>      uint64_t *points;
> >>      uint32_t signaled_count, i;
> >>
> >> -    if (flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT)
> >> +    if (flags & (DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
> >> +                 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE))
> >>              lockdep_assert_none_held_once();
> >>
> >>      points = kmalloc_array(count, sizeof(*points), GFP_KERNEL);
> >> @@ -1127,7 +1128,8 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
> >>       * fallthough and try a 0 timeout wait!
> >>       */
> >>
> >> -    if (flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT) {
> >> +    if (flags & (DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
> >> +                 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE)) {
> >>              for (i = 0; i < count; ++i)
> >>                      drm_syncobj_fence_add_wait(syncobjs[i], &entries[i]);
> >>      }
> >> --
> >> 2.43.0
> >>
> >
>

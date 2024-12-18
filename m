Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6769F6C04
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 18:10:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84BEE10E1FA;
	Wed, 18 Dec 2024 17:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="McuPfsBZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4106010E1FA
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 17:10:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1734541790; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=UZoX3A/8Zo0oHTXYhyEkEEqc0QNVKFgmiSnQ3sLIdmEkCIdOhOHBa7gFzkat5B9ZbkFwGLGLN2X3/fcRPiNbgKhy5odNWKP6GU3ZXb/FSl8h3NedWfrUbtxPyKRy5ETqr0Tu1vEVcN220rrF+MWvQZn5AWqxYjU43tw7YgmmdG8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1734541790;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=zNQU5aUE9ACljlgKFQ985BaW2zK171beGfCCA0yi6Ig=; 
 b=jv+K9/AMVkc5FyQev6W5fTlDtJR/FcDb7A4slLlehoFNlPVTZ/PihZROnO2SAtgMZruLhRh73imJKPnlJHu+d6m+ANGuKigRvrUaG2O++ML2xSqBP7J4HW+Hx7WT3741t+1bYepkgIuscKIrKnXrvh5HYLfFE8P1GvTYpapRTb8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1734541790; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=zNQU5aUE9ACljlgKFQ985BaW2zK171beGfCCA0yi6Ig=;
 b=McuPfsBZ7jUV7lQYoLFf4BJ3yz4AQI4+j2ljhou4++kGvEfSjHgt9RVlSF3gOirQ
 6qwn3Zan/GQvryCdJYo8wfoznpDzipIJXqA8TqIp07JpYmGT1WqKUnZIcUQTh3/mMjJ
 ruV1id3Z8rDJLO44fmOCI4ZViol6vZz/GSRIy1yo=
Received: by mx.zohomail.com with SMTPS id 1734541788916968.974173755823;
 Wed, 18 Dec 2024 09:09:48 -0800 (PST)
Date: Thu, 19 Dec 2024 01:09:42 +0800
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] Documentation/gpu: Add fdinfo meanings of
 drm-*-internal memory tags
Message-ID: <knnhq3aehfy7r5gy7l5z4sluzyghpz22mu66lei6ysnhvzxz2c@sajpyqyu64qq>
References: <20241211163436.381069-1-adrian.larumbe@collabora.com>
 <20241211163436.381069-3-adrian.larumbe@collabora.com>
 <Z2A4RjVe8gPWpRua@e110455-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z2A4RjVe8gPWpRua@e110455-lin.cambridge.arm.com>
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

On 16.12.2024 14:25, Liviu Dudau wrote:
> On Wed, Dec 11, 2024 at 04:34:32PM +0000, Adrián Larumbe wrote:
> > A previous commit enabled display of driver-internal kernel BO sizes
> > through the device file's fdinfo interface.
> > 
> > Expand the description of the relevant driver-specific key:value pairs
> > with the definitions of the new drm-*-internal ones.
> > 
> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> > ---
> >  Documentation/gpu/panthor.rst | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/Documentation/gpu/panthor.rst b/Documentation/gpu/panthor.rst
> > index 3f8979fa2b86..c6d8236e3665 100644
> > --- a/Documentation/gpu/panthor.rst
> > +++ b/Documentation/gpu/panthor.rst
> > @@ -26,6 +26,10 @@ the currently possible format options:
> >       drm-cycles-panthor:     94439687187
> >       drm-maxfreq-panthor:    1000000000 Hz
> >       drm-curfreq-panthor:    1000000000 Hz
> > +     drm-total-internal:     10396 KiB
> > +     drm-shared-internal:    0
> > +     drm-active-internal:    10396 KiB
> > +     drm-resident-internal:  10396 KiB
> >       drm-total-memory:       16480 KiB
> >       drm-shared-memory:      0
> >       drm-active-memory:      16200 KiB
> > @@ -44,3 +48,13 @@ driver by writing into the appropriate sysfs node::
> >  
> >  Where `N` is a bit mask where cycle and timestamp sampling are respectively
> >  enabled by the first and second bits.
> > +
> > +Possible `drm-*-internal` key names are: `total`, `active` and `resident`.
> 
> I think Mihail's comment stands. There is no harm in being thorough, so either
> we list `shared` as a possible key name, or we remove it from the example and
> re-introduce it later with a patch.

I'll mention it here too, even though there is no way I can prevent 'drm-shared-internal'
from being displayed because drm_print_memory_stats() is inflexible about this.

> > +These values convey the sizes of the internal driver-owned shmem BO's that
> > +aren't exposed to user-space through a DRM handle, like queue ring buffers,
> > +sync object arrays and heap chunks. Because they are all allocated and pinned
> > +at creation time, `drm-resident-internal` and `drm-total-internal` should always
> > +be equal. `drm-active-internal` shows the size of kernel BO's associated with
> > +VM's and groups currently being scheduled for execution by the GPU.
> > +`drm-shared-memory` is unused at present, but in the future it might stand for
> > +the size of the Firmware regions, since they do not belong to an open file context.
> 
> But there are firmware regions that are per context, like the save/restore buffers.
> Also, I think we are creating confusion there between drm-shared-memory and
> drm-shared-internal. I'm fine with having a note here regarding `drm-shared-memory`
> as long as `drm-shared-internal` also gets a note to explain the difference with its
> cousin.

This was a typo on my part, should've written 'drm-shared-internal' instead because the
definition of drm-shared-memory is done in the documentation for the DRM fdinfo core.
In the next revision, I'll also mention that the potential future meaning of drm-shared-internal
could be the size of the executable FW regions to dispel any ambiguities.

> Best regards,
> Liviu
> 
> > -- 
> > 2.47.0
> > 
> 
> -- 
> ====================
> | I would like to |
> | fix the world,  |
> | but they're not |
> | giving me the   |
>  \ source code!  /
>   ---------------
>     ¯\_(ツ)_/¯

Adrian Larumbe

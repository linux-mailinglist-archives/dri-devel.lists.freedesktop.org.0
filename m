Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D42E19ED307
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 18:03:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A550810EBC3;
	Wed, 11 Dec 2024 17:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="avWXRrWP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6708F10EBC3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 17:03:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1733936582; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=dK8JK0kbZKxjv++k/4k8p7Z8/goU52BzSiOI7dcXMBedTlx4EVtlGaOnSMrmhWquQS/sVY605pf2Mpo7BXIiwdvibpHO+zgioeyuIhlpClqVG4K85fdvG8wVp6FTzZBxJh8qUjV77OQGjEy2srpsQczxmW5YbrtbQnE8SyKbJho=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1733936582;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=PjTBpQFNQ1d0TWGoaimrCIzB0pWOahz/CZSyOIvp154=; 
 b=O6pHPgjgG+Rl/a457dDuPNFUrSDRr0BCE8zb1b+MYSsqLkp4BluHYz9Fpa2kHPBSmPkdEUNl4m7UgK1dWA2QaMSyKWJ+0uPbZ6rLr4N/l43Al0WY+Ashq6q7O6vWXjAy9hTO5K6wA6VHc6T6Nt2k7RTbs9OHDAvoD23Y4Mnjztg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733936582; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=PjTBpQFNQ1d0TWGoaimrCIzB0pWOahz/CZSyOIvp154=;
 b=avWXRrWPJJ2KIYsuoCAgAAqw17RPDmHcGgelskmqiTKZhBorxW36JAoGiiUZIarL
 NcLmG8FlBTqFrGigU1pCPfKpXqu9T1B4d6yinLtQ+1QNN8N1jCVTfd6tCvTexHqoCid
 o/n0kPH4eO/pCM+cm3OiTwvXH12QqXtFny9Q4FsI=
Received: by mx.zohomail.com with SMTPS id 1733936578719892.8241132723481;
 Wed, 11 Dec 2024 09:02:58 -0800 (PST)
Date: Wed, 11 Dec 2024 17:02:54 +0000
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Mihail Atanassov <mihail.atanassov@arm.com>
Cc: nd@arm.com, kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v4 2/2] Documentation/gpu: Add fdinfo meanings of
 drm-*-internal memory tags
Message-ID: <bvqjlomae7w34nawaqtrnthqvcypjui4cperriorzlv7uhngxb@4pqbagnew7in>
References: <20241211163436.381069-1-adrian.larumbe@collabora.com>
 <20241211163436.381069-3-adrian.larumbe@collabora.com>
 <85010ca7-0c34-4be6-9dfa-5be742ded25d@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85010ca7-0c34-4be6-9dfa-5be742ded25d@arm.com>
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

Hi Mihail,

On 11.12.2024 16:40, Mihail Atanassov wrote:
> Hi Adrián,
> 
> On 11/12/2024 16:34, Adrián Larumbe wrote:
> > A previous commit enabled display of driver-internal kernel BO sizes
> > through the device file's fdinfo interface.
> > 
> > Expand the description of the relevant driver-specific key:value pairs
> > with the definitions of the new drm-*-internal ones.
> > 
> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> > ---
> >   Documentation/gpu/panthor.rst | 14 ++++++++++++++
> >   1 file changed, 14 insertions(+)
> > 
> > diff --git a/Documentation/gpu/panthor.rst b/Documentation/gpu/panthor.rst
> > index 3f8979fa2b86..c6d8236e3665 100644
> > --- a/Documentation/gpu/panthor.rst
> > +++ b/Documentation/gpu/panthor.rst
> > @@ -26,6 +26,10 @@ the currently possible format options:
> >        drm-cycles-panthor:     94439687187
> >        drm-maxfreq-panthor:    1000000000 Hz
> >        drm-curfreq-panthor:    1000000000 Hz
> > +     drm-total-internal:     10396 KiB
> > +     drm-shared-internal:    0
> 
> You give an example of `drm-shared-internal`...
> 
> > +     drm-active-internal:    10396 KiB
> > +     drm-resident-internal:  10396 KiB
> >        drm-total-memory:       16480 KiB
> >        drm-shared-memory:      0
> >        drm-active-memory:      16200 KiB
> > @@ -44,3 +48,13 @@ driver by writing into the appropriate sysfs node::
> >   Where `N` is a bit mask where cycle and timestamp sampling are respectively
> >   enabled by the first and second bits.
> > +
> > +Possible `drm-*-internal` key names are: `total`, `active` and `resident`.
> 
> ... but don't list it as a valid key name here.

I do mention slightly further below that that key:value pair is at the time being unused,
but I've thought of a possible interpretation that could be part of another commit.

> > +These values convey the sizes of the internal driver-owned shmem BO's that
> > +aren't exposed to user-space through a DRM handle, like queue ring buffers,
> > +sync object arrays and heap chunks. Because they are all allocated and pinned
> > +at creation time, `drm-resident-internal` and `drm-total-internal` should always
> > +be equal. `drm-active-internal` shows the size of kernel BO's associated with
> > +VM's and groups currently being scheduled for execution by the GPU.
> > +`drm-shared-memory` is unused at present, but in the future it might stand for
> > +the size of the Firmware regions, since they do not belong to an open file context.
> 
> -- 
> Mihail Atanassov <mihail.atanassov@arm.com>

Adrian Larumbe

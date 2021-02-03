Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 501E930DAB1
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 14:11:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75AFA6EAA4;
	Wed,  3 Feb 2021 13:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F696EAAA
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 13:11:10 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id u14so5164733wmq.4
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Feb 2021 05:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=98vsBgcuoDvTfqJfjl4OuTtzO0K+8P+ZFHH2fOEBr9I=;
 b=jd1iAvIHF4AVVO6VuPQIh6f2ZResVSPpdGyQEO02get32t/v8d0ribVW+kvX/HsT21
 DhdHrt+OWOr3qaph7KbNXw7lh9rHHU7QuWm2X2yQMV91B8yQB9BpuCWNEFY+SIqJRYHH
 52nh8KRyM9ERegbfqOlbaISBRc7atx8+aCDfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=98vsBgcuoDvTfqJfjl4OuTtzO0K+8P+ZFHH2fOEBr9I=;
 b=e2pwA0kAufFtvk1Q9gbdu4RxVmJqWImGFKIJWwltdJ/3wNB0MBDXJtYgVtwqM8OdES
 Nl7RkWUWThFXL8HZOWuA95ZdG+AlRV/7l5Uz6dwMjcVLIBTDVbNaNNiWurbpr5Sb8BXC
 jeZK8iuOMIZxvOs1fx1gGgGm5e9kAbUTXAUPL8UwrYZ+IqTz8oxlAAhYG3LJg2eZDfZh
 mnE+/2ppC195otnnv7WBml43UBlaht1a966Lpyq0P0Hyu1Nmr1YM0O/IOSGop4mn0IYQ
 NiHeKtJIc/dKNxhzRejUDrnB4Fij0xv4R0JpXYJgc9UmCxokCLPOI3I1m8jZC8Au3yCa
 FUiQ==
X-Gm-Message-State: AOAM531xRlLxGOaNzJUObUsG0ZvwVpDCprXei7kUk++Lm/6yVGYi+ytW
 03OR71QxEnItyQnpUvM5G8IXkQ==
X-Google-Smtp-Source: ABdhPJw5NP169kixDu9IIGlSVUkDflz1tcmHpKTjH9q2Q6cRcxxbMfh5YnqTQYWO0Bv47jyYbkn/Cg==
X-Received: by 2002:a05:600c:2305:: with SMTP id
 5mr846961wmo.183.1612357869563; 
 Wed, 03 Feb 2021 05:11:09 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h1sm3691810wrr.73.2021.02.03.05.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 05:11:08 -0800 (PST)
Date: Wed, 3 Feb 2021 14:11:07 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/todo: Add entry for moving to dma_resv_lock
Message-ID: <YBqg6x8jWIAe2IpH@phenom.ffwll.local>
References: <20210122133624.1751802-1-daniel.vetter@ffwll.ch>
 <97c93ad7-9aa1-dcf7-42a9-4f8076eeb135@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <97c93ad7-9aa1-dcf7-42a9-4f8076eeb135@suse.de>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel.vetter@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 22, 2021 at 03:06:44PM +0100, Thomas Zimmermann wrote:
> Hi
> =

> Am 22.01.21 um 14:36 schrieb Daniel Vetter:
> > Requested by Thomas. I think it justifies a new level, since I tried
> > to make some forward progress on this last summer, and gave up (for
> > now). This is very tricky.
> =

> Adding it to the TODO list is a first step. :)
> =

> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Applied.
-Daniel

> =

> > =

> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: "Christian K=F6nig" <christian.koenig@amd.com>
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > ---
> >   Documentation/gpu/todo.rst | 19 +++++++++++++++++++
> >   1 file changed, 19 insertions(+)
> > =

> > diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> > index dea9082c0e5f..f872d3d33218 100644
> > --- a/Documentation/gpu/todo.rst
> > +++ b/Documentation/gpu/todo.rst
> > @@ -23,6 +23,9 @@ Advanced: Tricky tasks that need fairly good understa=
nding of the DRM subsystem
> >   and graphics topics. Generally need the relevant hardware for develop=
ment and
> >   testing.
> > +Expert: Only attempt these if you've successfully completed some tricky
> > +refactorings already and are an expert in the specific area
> > +
> >   Subsystem-wide refactorings
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> > @@ -168,6 +171,22 @@ Contact: Daniel Vetter, respective driver maintain=
ers
> >   Level: Advanced
> > +Move Buffer Object Locking to dma_resv_lock()
> > +---------------------------------------------
> > +
> > +Many drivers have their own per-object locking scheme, usually using
> > +mutex_lock(). This causes all kinds of trouble for buffer sharing, sin=
ce
> > +depending which driver is the exporter and importer, the locking hiera=
rchy is
> > +reversed.
> > +
> > +To solve this we need one standard per-object locking mechanism, which=
 is
> > +dma_resv_lock(). This lock needs to be called as the outermost lock, w=
ith all
> > +other driver specific per-object locks removed. The problem is tha rol=
ling out
> > +the actual change to the locking contract is a flag day, due to struct=
 dma_buf
> > +buffer sharing.
> > +
> > +Level: Expert
> > +
> >   Convert logging to drm_* functions with drm_device paramater
> >   ------------------------------------------------------------
> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =





-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

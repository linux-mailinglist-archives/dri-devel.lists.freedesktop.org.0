Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 856A81DB476
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 15:01:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3466A6E831;
	Wed, 20 May 2020 13:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B06916E831
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 13:01:02 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l11so3095025wru.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 06:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=6qBIKcomtrWkayP//yej9PNIxpZ4gM4Fk7eMYMjTDGQ=;
 b=NzTNEAWGyZc7XIqaEnpWkFCISaa149ApkY3iAVTrecwCfZQ6FHadOCCmseoFP2ieMS
 ZEHiIYC1wWk/EzhcebcCiF1iM0PYG5+GRncbNGl9snWK8ry91Aff/aE1HlwDpLEbG+04
 qR3dc/lfeTm134dzN0RbkJPVGhh4g+oX4bxMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6qBIKcomtrWkayP//yej9PNIxpZ4gM4Fk7eMYMjTDGQ=;
 b=umKGQaCE0Zx4EP2voak2Y95a/8yFq0Gd59p9o6JK9HlIGn31nl+fpSy/NqmTkq0diw
 od6U6sTjR8yh4SS32Svf6qewScr8ZxTfGmve+nKWaXvctt09cK1XIUF22lFO+pInFMjo
 nQ/QlWsyouwLzA3y5kNX5E7uDTT3ZjUBhwFpu+lfQwiJsutFeaxlDXM83QEcR/XYmHAw
 OjKbUdMc4a4CQgWzvrgeGB9mwpiF5wTddt0ARHBibrXKByT+4qGW18Fnp+dhNSGubvR1
 zQPuIusi8cMDv4aW7rhwYPG7iz/suIAdeeVN6QpzYGIeGkYUhma+0Y0YYsUfynWdbd0X
 z5rw==
X-Gm-Message-State: AOAM531l8ws7YgGd3O/H6uaNpGwNHuNSfVFpnpdTlRV+2kZWheJ8OZZe
 O/t/wYvd3ItAh43uWPEv41rEBw==
X-Google-Smtp-Source: ABdhPJzScBkil339JVxqiLUDwmW3j8+Nx9V2q8LMdKL12C/d6vLRdpNsigxdUK1uJCGcalFdEltznw==
X-Received: by 2002:adf:f786:: with SMTP id q6mr4041005wrp.120.1589979661084; 
 Wed, 20 May 2020 06:01:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x6sm2807514wrv.57.2020.05.20.06.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 06:01:00 -0700 (PDT)
Date: Wed, 20 May 2020 15:00:58 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 1/1] drm: check for NULL pointer in drm_gem_object_put
Message-ID: <20200520130058.GZ206103@phenom.ffwll.local>
References: <20200520121450.79340-1-nirmoy.das@amd.com>
 <96a01388-7d91-56b5-4cd4-16052aba7a60@amd.com>
 <158997895740.8153.16875812670855148581@build.alporthouse.com>
 <b2284cd6-56cb-847a-1b6f-e4825c4ec1d3@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b2284cd6-56cb-847a-1b6f-e4825c4ec1d3@amd.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Emil Velikov <emil.l.velikov@gmail.com>,
 Nirmoy Das <nirmoy.aiemd@gmail.com>, Nirmoy Das <nirmoy.das@amd.com>,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 20, 2020 at 02:54:55PM +0200, Christian K=F6nig wrote:
> Am 20.05.20 um 14:49 schrieb Chris Wilson:
> > Quoting Christian K=F6nig (2020-05-20 13:19:42)
> > > Am 20.05.20 um 14:14 schrieb Nirmoy Das:
> > > > drm_gem_fb_destroy() calls drm_gem_object_put() with NULL obj causi=
ng:
> > > > [   11.584209] BUG: kernel NULL pointer dereference, address: 00000=
00000000000
> > > > [   11.584213] #PF: supervisor write access in kernel mode
> > > > [   11.584215] #PF: error_code(0x0002) - not-present page
> > > > [   11.584216] PGD 0 P4D 0
> > > > [   11.584220] Oops: 0002 [#1] SMP NOPTI
> > > > [   11.584223] CPU: 7 PID: 1571 Comm: gnome-shell Tainted: G       =
     E     5.7.0-rc1-1-default+ #27
> > > > [   11.584225] Hardware name: Micro-Star International Co., Ltd. MS=
-7A31/X370 XPOWER GAMING TITANIUM (MS-7A31), BIOS 1.MR 12/03/2019
> > > > [   11.584237] RIP: 0010:drm_gem_fb_destroy+0x28/0x70 [drm_kms_help=
er]
> > > > <snip>
> > > > [   11.584256] Call Trace:
> > > > [   11.584279]  drm_mode_rmfb+0x189/0x1c0 [drm]
> > > > [   11.584299]  ? drm_mode_rmfb+0x1c0/0x1c0 [drm]
> > > > [   11.584314]  drm_ioctl_kernel+0xaa/0xf0 [drm]
> > > > [   11.584329]  drm_ioctl+0x1ff/0x3b0 [drm]
> > > > [   11.584347]  ? drm_mode_rmfb+0x1c0/0x1c0 [drm]
> > > > [   11.584421]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
> > > > [   11.584427]  ksys_ioctl+0x87/0xc0
> > > > [   11.584430]  __x64_sys_ioctl+0x16/0x20
> > > > [   11.584434]  do_syscall_64+0x5f/0x240
> > > > [   11.584438]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> > > > [   11.584440] RIP: 0033:0x7f0ef80f7227
> > > > =

> > > > Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
> > > Fixes: .... missing here. Apart from that Reviewed-by: Christian K=F6=
nig
> > > <christian.koenig@amd.com>.
> > > =

> > > Please resend with the tag added, then I'm going to push this to
> > > drm-misc-next asap.
> > > =

> > > Christian.
> > > =

> > > > ---
> > > >    include/drm/drm_gem.h | 3 +++
> > > >    1 file changed, 3 insertions(+)
> > > > =

> > > > diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> > > > index 52173abdf500..a13510346a9b 100644
> > > > --- a/include/drm/drm_gem.h
> > > > +++ b/include/drm/drm_gem.h
> > > > @@ -372,6 +372,9 @@ static inline void drm_gem_object_get(struct dr=
m_gem_object *obj)
> > > >    static inline void
> > > >    drm_gem_object_put(struct drm_gem_object *obj)
> > > >    {
> > > > +     if (!obj)
> > > > +             return;
> > > > +
> > This adds several thousand NULL checks where there were previously none.
> > I doubt the compiler eliminates them all.
> > =

> > I'd suggest reverting
> > b5d250744ccc ("drm/gem: fold drm_gem_object_put_unlocked and __drm_gem_=
object_put()")
> =

> I didn't looked into this patch in detail, but allowing to call *_put()
> functions with NULL and nothing bad happens is rather common practice.
> =

> On the other hand I agree that this might cause a performance problem. How
> many sites do we have which could call drm_gem_object_put() with NULL?

Hm how did we even get to a place where one of the _put functions had a
NULL check and the other didn't?

I do expect the compiler to clean up the entire mess, only place where I
can think of NULL checks is dumb cleanup code when driver load failed
halfway through. In all other places the compiler should have some
evidence that the pointer isn't NULL. But would be good to check that's
the case and we're not doing something stupid here ...
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B70D63DA39A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 15:00:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE276EDA3;
	Thu, 29 Jul 2021 13:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF1366EDA3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 13:00:04 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id f12so7469548ljn.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 06:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=AHWPERw4sOTyW9nOFgWwND9PpAneImCTb0cpl6K5gvs=;
 b=mtGbGNk2k161S/Gm15U/+Z2gGE+is3TIdkV8JtsakjCI8IdyuVy0scRQVDwULgZWGv
 IJX/1JNvyKEDIv639JKIUaajuAnEi1WYpYRErbhXEluembincigkVZ4xoPCfx/z8FHeT
 otRDxDiz5TeRACOAExCYKBoTEEjozKJdT/XH1iX1DwG73jPn2J/7gB9AzNBn9X9D0Qfp
 9mGNq6amPqZaUjFyCbpMRRpM+ayk6hW9+n33Jbe11NGOqK7UdZqjEeLcZwYYXzLCI639
 EjfjjADfvpHIIowMVHxd5mvPS5Nzfj7Oh0sdVUfl4P1dXpn67USiHeJPAqwn9Hm1h6H0
 lBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=AHWPERw4sOTyW9nOFgWwND9PpAneImCTb0cpl6K5gvs=;
 b=Yd7OkJanSSArHJjyz+bPibLpjS12mvvgJPUxTY0UngR8JhDpeuFHootv0n5QdCGnWB
 w0GmbLIpUPTYABpbOFUzikXnn1cYeHSxIEW5M5r+YxH97UaODsZ90puVFaF3sFITU/uB
 Bu+OUIJzGE/Zs3MPMCRLOZDBHdIKUuAZ/+wIioOLbhyrYKfSztm+zcjwqyteZg89AIgH
 Yn7fq+2Wd/7dt5B9hwIxIkgiDczXLoGxhcPzN5Cpmc86wixe6XOGgeg2jErKHcfZMZcm
 9E7gRjvL5l2NIFPGpm/kc1VNVd7waNksvo/ihCcJ82WIVn4vAS3Op7EgzR0kaGG1Vdgv
 3nBQ==
X-Gm-Message-State: AOAM5339Sq4PS3nP3bz0uZlgCDqMQU7YgmKCTLvLthMbKqqy42P+ZY9o
 n2ktGjlnyR0PHrW0CtsYoQM=
X-Google-Smtp-Source: ABdhPJzuMUS5G4/ARO2Qj5l6VTMlQgRTGvkYy4bK2qvRsoQmQDNC9IWOALqJEInVvvf9ldMGUtKQ6g==
X-Received: by 2002:a2e:bc1a:: with SMTP id b26mr2883094ljf.132.1627563602984; 
 Thu, 29 Jul 2021 06:00:02 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id y24sm298653lfe.255.2021.07.29.06.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 06:00:02 -0700 (PDT)
Date: Thu, 29 Jul 2021 15:59:59 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>, Simon Ser <contact@emersion.fr>
Subject: Re: [RFC 0/4] dma-fence: Deadline awareness
Message-ID: <20210729155959.665fc1a6@eldfell>
In-Reply-To: <YQKclVvL+QeeL6cP@phenom.ffwll.local>
References: <CAJs_Fx4O4w5djx3-q5zja51-ko_nQ0X2nEk3qoZB_axpBVSrKA@mail.gmail.com>
 <f6d73ec5-85f9-1b18-f2d2-a5f3b7333efa@gmail.com>
 <c9ee242e-542e-e189-a1ec-c1be34d66c93@daenzer.net>
 <04d44873-d8e6-6ae7-f0f9-17bcb484d697@amd.com>
 <9d5f4415-d470-3bc1-7d52-61ba739706ae@daenzer.net>
 <CAF6AEGu409eY9xznTAaBf2ZDcV_AaDELUzN2afWgiHwB_uBwqg@mail.gmail.com>
 <YQJUKXgf/Q957fmy@phenom.ffwll.local>
 <ff394f2b-b555-e80f-b685-d0d59e2bbe67@daenzer.net>
 <YQJu6AqKn7bdT1li@phenom.ffwll.local>
 <20210729123732.3259a9bf@eldfell>
 <YQKclVvL+QeeL6cP@phenom.ffwll.local>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Bp9P0PhOYSeF=xCOV=ad2n.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Rob Clark <robdclark@chromium.org>, Matthew Brost <matthew.brost@intel.com>,
 Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING
 FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Roy Sun <Roy.Sun@amd.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Lee Jones <lee.jones@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Bp9P0PhOYSeF=xCOV=ad2n.
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 29 Jul 2021 14:18:29 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Thu, Jul 29, 2021 at 12:37:32PM +0300, Pekka Paalanen wrote:
> > On Thu, 29 Jul 2021 11:03:36 +0200
> > Daniel Vetter <daniel@ffwll.ch> wrote:
> >  =20
> > > On Thu, Jul 29, 2021 at 10:17:43AM +0200, Michel D=C3=A4nzer wrote: =
=20
> > > > On 2021-07-29 9:09 a.m., Daniel Vetter wrote:   =20
> > > > > On Wed, Jul 28, 2021 at 08:34:13AM -0700, Rob Clark wrote:   =20
> > > > >> On Wed, Jul 28, 2021 at 6:24 AM Michel D=C3=A4nzer <michel@daenz=
er.net> wrote:   =20
> > > > >>> On 2021-07-28 3:13 p.m., Christian K=C3=B6nig wrote:   =20
> > > > >>>> Am 28.07.21 um 15:08 schrieb Michel D=C3=A4nzer:   =20
> > > > >>>>> On 2021-07-28 1:36 p.m., Christian K=C3=B6nig wrote:   =20
> > > > >>>>>> Am 27.07.21 um 17:37 schrieb Rob Clark:   =20
> > > > >>>>>>> On Tue, Jul 27, 2021 at 8:19 AM Michel D=C3=A4nzer <michel@=
daenzer.net> wrote:   =20
> > > > >>>>>>>> On 2021-07-27 5:12 p.m., Rob Clark wrote:   =20
> > > > >>>>>>>>> On Tue, Jul 27, 2021 at 7:50 AM Michel D=C3=A4nzer <miche=
l@daenzer.net> wrote:   =20
> > > > >>>>>>>>>> On 2021-07-27 1:38 a.m., Rob Clark wrote:   =20
> > > > >>>>>>>>>>> From: Rob Clark <robdclark@chromium.org>
> > > > >>>>>>>>>>>
> > > > >>>>>>>>>>> Based on discussion from a previous series[1] to add a =
"boost" mechanism
> > > > >>>>>>>>>>> when, for example, vblank deadlines are missed.  Instea=
d of a boost
> > > > >>>>>>>>>>> callback, this approach adds a way to set a deadline on=
 the fence, by
> > > > >>>>>>>>>>> which the waiter would like to see the fence signalled.=
 =20
> >=20
> > ...
> >  =20
> > > > I'm not questioning that this approach helps when there's a direct
> > > > chain of fences from the client to the page flip. I'm pointing out
> > > > there will not always be such a chain.
> > > >=20
> > > >    =20
> > > > >> But maybe the solution to make this also useful for mutter   =20
> > > >=20
> > > > It's not just mutter BTW. I understand gamescope has been doing
> > > > this for some time already. And there seems to be consensus among
> > > > developers of Wayland compositors that this is needed, so I expect
> > > > at least all the major compositors to do this longer term.
> > > >=20
> > > >    =20
> > > > >> is to, once we have deadline support, extend it with an ioctl to
> > > > >> the dma-fence fd so userspace can be the one setting the
> > > > >> deadline.   =20
> > > >=20
> > > > I was thinking in a similar direction.
> > > >    =20
> > > > > atomic ioctl with TEST_ONLY and SET_DEADLINES? Still gives mutter
> > > > > the option to bail out with an old frame if it's too late?   =20
> > > >=20
> > > > This is a bit cryptic though, can you elaborate?   =20
> > >=20
> > > So essentially when the mutter compositor guesstimator is fairly
> > > confident about the next frame's composition (recall you're keeping
> > > track of clients to estimate their usual latency or something like
> > > that), then it does a TEST_ONLY commit to check it all works and prep
> > > the rendering, but _not_ yet fire it off.
> > >=20
> > > Instead it waits until all buffers complete, and if some don't, pick
> > > the previous one. Which I guess in an extreme case would mean you
> > > need a different window tree configuration and maybe different
> > > TEST_ONLY check and all that, not sure how you solve that.
> > >=20
> > > Anyway, in that TEST_ONLY commit my idea is that you'd also supply
> > > all the in-fences you expect to depend upon (maybe we need an
> > > additional list of in-fences for your rendering job), plus a deadline
> > > when you want to have them done (so that there's enough time for your
> > > render job still). And the kernel then calls dma_fence_set_deadline
> > > on all of them.
> > >=20
> > > Pondering this more, maybe a separate ioctl is simpler where you just
> > > supply a list of in-fences and deadlines.
> > >=20
> > > The real reason I want to tie this to atomic is for priviledge
> > > checking reasons. I don't think normal userspace should have the
> > > power to set arbitrary deadlines like this - at least on i915 it will
> > > also give you a slight priority boost and stuff like that, to make
> > > sure your rendering for the current frame goes in ahead of the next
> > > frame's prep work.
> > >=20
> > > So maybe just a new ioctl that does this which is limited to the
> > > current kms owner (aka drm_master)? =20
> >=20
> > Yeah.
> >=20
> > Why not have a Wayland compositor *always* "set the deadlines" for the
> > next screen update as soon as it gets the wl_surface.commit with the
> > new buffer and fences (a simplified description of what is actually
> > necessary to take a new window state set into use)? =20
>=20
> Yeah taht's probably best. And if the frame is scheduled (video at 24fps
> or whatever) you can also immediately set the deadline for that too, just
> a few frames later. Always minus compositor budget taken into account.
>=20
> > The Wayland client posted the frame to the compositor, so surely it
> > wants it ready and displayed ASAP. If we happen to have a Wayland frame
> > queuing extension, then also take that into account when setting the
> > deadline.
> >=20
> > Then, *independently* of that, the compositor will choose which frames
> > it will actually use in its composition when the time comes.
> >=20
> > No need for any KMS atomic commit fiddling, userspace just explicitly
> > sets the deadline on the fence and that's it. You could tie the
> > privilege of setting deadlines to simply holding DRM master on whatever
> > device? So the ioctl would need both the fence and any DRM device fd. =
=20
>=20
> Yeah tying that up with atomic doesn't make sense.
>=20
> > A rogue application opening a DRM device and becoming DRM master on it
> > just to be able to abuse deadlines feels both unlikely and with
> > insignificant consequences. It stops the obvious abuse, and if someone
> > actually goes the extra effort, then so what. =20
>=20
> With logind you can't become drm master just for lolz anymore, so I'm not
> worried about that. On such systems only logind has the rights to access
> the primary node, everyone doing headless goes through the render node.

Mm, I hope the DRM leasing protocols don't rely on clients being able
to open KMS nodes anymore... they used to at some point, I think, for
the initial resource discovery before actually leasing anything.

"only logind has rights" might be a bit off still.

> So just limiting the deadline ioctl to current kms owner is imo perfectly
> good enough for a security model.

There could be multiple DRM devices. Including VKMS. Some of them not
used. The deadline setting ioctl can't guarantee the fenced buffer is
going to be used on the same DRM device the ioctl was called with. Or
used at all with KMS.

Anyway, even if that is not completely secure, I wouldn't think that
setting deadlines can do more than change GPU job priorities and power
consumption, which seem quite benign. It's enough hoops to jump through
that I think it stops everything we care to stop.


Thanks,
pq

--Sig_/Bp9P0PhOYSeF=xCOV=ad2n.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmECpk8ACgkQI1/ltBGq
qqeTphAAjdrSd2HmqryE0+cM7PrpS/OxFyqco/zB3Hz7kdTiRPJYyhBSN4DEg0jD
p+0NJL6iRgeGYTNsWd4VXPXWCQyCSz9GXrngylCabrP/M4h+S4126ei0ldzXDvXU
ml0hdFohySDgwv6MuyzhSPI7byR3NMU7rWRJh2fAwNHaglp7jVL1aH5FZvQduNeR
3Y00KJKfEzxeBhtO3Lje/RzP/n/Fyx+k/ysKQoPJIam/+NTvPAGOjVswX+wakiYA
IQNvmO5g2GVr0vhjzdOR9YPvJCEIsHtIz7HOes962Vumm8qLdyJqW8jI+WLtUwSq
6fyT/s0hcbWdiiyhiUlAxcas1U7yJ4CBJ7z5L7DhffVZ4EyK2TW4xgdzmkzM3AQx
mwDmTFUD7xQ6Jj5V2o2kHk3EoRqYvXyi/XXcrJT8Hwyuybu8zJE5OISeofSUoFjI
WLrmzAzffc8SFVfx6OpdjHT4/wC+PEQTa5JFlv15BY4auicbmu+BxqxcyKoKkRK3
rUWFNUsW4lHsrEyh7QPuT1Ikc+K9H6cJZoKzcsfaMMKWush2O2FAgPjlpOkcgY34
oXr8e50sXcjrwxHOUcXLl92n7h/vXAKuS2a+lVDU/QuVT7V3VY39xnnefnhZY3kU
8DmUOwzPJNtfLrrl6+3MLu315tzDg+X9KxRw18k+zKxZI1zyZAE=
=jYId
-----END PGP SIGNATURE-----

--Sig_/Bp9P0PhOYSeF=xCOV=ad2n.--

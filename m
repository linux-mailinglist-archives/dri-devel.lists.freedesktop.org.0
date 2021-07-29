Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4323DA026
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 11:15:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD966ECFC;
	Thu, 29 Jul 2021 09:15:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8685A6ECFC
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 09:15:47 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id r26so9740579lfp.5
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 02:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=S2WOhbKtnksCXQrfbao+yG0WrUawlgDIizHpSnBnnf0=;
 b=D1AbJjVfa4UVIhgpkG/gleRi/WBc+YSAmXO7N6VAI/6EsbHZDUntTRkVR7HTdTNYyR
 l4f2aekCso1BFLDzAzoT3tjfZ9aNNDBv8HBGK3IurM5h/q+7XfMtPyvu4LoPBZdILign
 bweFkU3RXmi6pjX/iQDcJ/vZ/kOznl6/JiEimo7YH1ukGFdZmC8QXdoxgUBULvmQ8A0n
 CFHV9T2g4WvkpBhXNvC4LgoPnNcRnUlFIQESXY77jnDNIpLxZUKf4WMuHq0YA/OLDmgw
 Z/yVj9jztRqGhabEHmJVKlWbOzVDx/GMvDC8m7Rud46PvUKAPMayTE4HwcIWCR2mPgrh
 7Xbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=S2WOhbKtnksCXQrfbao+yG0WrUawlgDIizHpSnBnnf0=;
 b=RhYOJlBpcHgbDQsZxA3p53DoWvJaDvVEK0LGZTwXgmMfgtfKh96FDXoxsj3JbebSmg
 BDuT7J/LQEzucdpgdST12ry8CWtee4b775g3Mn8nkY5Ha1wbiHDmHmjfCn/sHZjZxVYb
 mjoqRwM42IyjTttLNVdLty0a6AwZCXF0v8S/DQrqIUapR6dAunnCOcBtx2Af+oMghpNe
 5m/V57I4puXOST/qcBV1tn3/utsooPjDfKDeEsrpZlMgi0HDmEiksuNMq/4KTj0omKZP
 tuRidSxA4bnYgiXJUuDlc45unhbOclrEzLOyd9mBE5jI1rBlEgeA++zjvKLmDHheAhKm
 GgcA==
X-Gm-Message-State: AOAM533345zI+3gJxRHIfXqHRKRu8stCEtJJ+ZQQMJtsBfkxmQUV3ZNJ
 rJ3RLPAWI6ts5LZdaEhyPm0=
X-Google-Smtp-Source: ABdhPJxTojV5Vf7auhwpvtT6+k/6OqxJ3aPn3ow4yXkZOCokj3Y2M8c+/CsdBCoUUkBNcyQBvK1Cmg==
X-Received: by 2002:a19:4341:: with SMTP id m1mr2942235lfj.443.1627550145755; 
 Thu, 29 Jul 2021 02:15:45 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id a13sm247194lfl.206.2021.07.29.02.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 02:15:45 -0700 (PDT)
Date: Thu, 29 Jul 2021 12:15:42 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [RFC 0/4] dma-fence: Deadline awareness
Message-ID: <20210729121542.27d9b1cc@eldfell>
In-Reply-To: <3675d530-c9fc-7ec9-e157-b6abeeec7c2a@amd.com>
References: <20210726233854.2453899-1-robdclark@gmail.com>
 <28ca4167-4a65-0ccc-36be-5fb017f6f49d@daenzer.net>
 <CAF6AEGuhQ2=DSDaGGVwBz5O+FoZEjpgoVJOcFecpd--a9yDY1w@mail.gmail.com>
 <99984703-c3ca-6aae-5888-5997d7046112@daenzer.net>
 <CAJs_Fx4O4w5djx3-q5zja51-ko_nQ0X2nEk3qoZB_axpBVSrKA@mail.gmail.com>
 <f6d73ec5-85f9-1b18-f2d2-a5f3b7333efa@gmail.com>
 <c9ee242e-542e-e189-a1ec-c1be34d66c93@daenzer.net>
 <04d44873-d8e6-6ae7-f0f9-17bcb484d697@amd.com>
 <9d5f4415-d470-3bc1-7d52-61ba739706ae@daenzer.net>
 <eedfdc75-72f8-9150-584b-c5e9d16db180@amd.com>
 <20210728165700.38c39cf8@eldfell>
 <74e310fa-e544-889f-2389-5abe06f80eb8@amd.com>
 <20210729112358.237651ff@eldfell>
 <3675d530-c9fc-7ec9-e157-b6abeeec7c2a@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LoBVg6qhcuxdajU4QJB+N2E";
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
 Jack Zhang <Jack.Zhang1@amd.com>,
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
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/LoBVg6qhcuxdajU4QJB+N2E
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 29 Jul 2021 10:43:16 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> Am 29.07.21 um 10:23 schrieb Pekka Paalanen:
> > On Wed, 28 Jul 2021 16:30:13 +0200
> > Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> > =20
> >> Am 28.07.21 um 15:57 schrieb Pekka Paalanen: =20
> >>> On Wed, 28 Jul 2021 15:31:41 +0200
> >>> Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> >>>    =20
> >>>> Am 28.07.21 um 15:24 schrieb Michel D=C3=A4nzer: =20
> >>>>> On 2021-07-28 3:13 p.m., Christian K=C3=B6nig wrote: =20
> >>>>>> Am 28.07.21 um 15:08 schrieb Michel D=C3=A4nzer: =20
> >>>>>>> On 2021-07-28 1:36 p.m., Christian K=C3=B6nig wrote: =20
> >>>>>>>> At least AMD hardware is already capable of flipping frames on G=
PU events like finishing rendering (or uploading etc).
> >>>>>>>>
> >>>>>>>> By waiting in userspace on the CPU before send the frame to the =
hardware you are completely killing of such features.
> >>>>>>>>
> >>>>>>>> For composing use cases that makes sense, but certainly not for =
full screen applications as far as I can see. =20
> >>>>>>> Even for fullscreen, the current KMS API only allows queuing a si=
ngle page flip per CRTC, with no way to cancel or otherwise modify it. Ther=
efore, a Wayland compositor has to set a deadline for the next refresh cycl=
e, and when the deadline passes, it has to select the best buffer available=
 for the fullscreen surface. To make sure the flip will not miss the next r=
efresh cycle, the compositor has to pick an idle buffer. If it picks a non-=
idle buffer, and the pending rendering does not finish in time for vertical=
 blank, the flip will be delayed by at least one refresh cycle, which resul=
ts in visible stuttering.
> >>>>>>>
> >>>>>>> (Until the deadline passes, the Wayland compositor can't even kno=
w if a previously fullscreen surface will still be fullscreen for the next =
refresh cycle) =20
> >>>>>> Well then let's extend the KMS API instead of hacking together wor=
karounds in userspace. =20
> >>>>> That's indeed a possible solution for the fullscreen / direct scano=
ut case.
> >>>>>
> >>>>> Not for the general compositing case though, since a compositor doe=
s not want to composite multiple output frames per display refresh cycle, s=
o it has to make sure the one frame hits the target. =20
> >>>> Yeah, that's true as well.
> >>>>
> >>>> At least as long as nobody invents a mechanism to do this decision on
> >>>> the GPU instead. =20
> >>> That would mean putting the whole window manager into the GPU. =20
> >> Not really. You only need to decide if you want to use the new backing
> >> store or the old one based on if the new surface is ready or not. =20
> > Except that a window content update in Wayland must be synchronised with
> > all the possible and arbitrary other window system state changes, that
> > will affect how and where other windows will get drawn *this frame*,
> > how input events are routed, and more.
> >
> > But, if the window manager made sure that *only* window contents are
> > about to change and *all* other state remains as it was, then it would
> > be possible to let the GPU decide which frame it uses. As long as it
> > also tells back which one it actually did, so that presentation
> > feedback etc. can trigger the right Wayland events.
> >
> > Wayland has "atomic commits" to windows, and arbitrary protocol
> > extensions can add arbitrary state to be tracked with it. A bit like KMS
> > properties. Even atomic commits affecting multiple windows together are
> > a thing, and they must be latched either all or none.
> >
> > So it's quite a lot of work to determine if one can allow the GPU to
> > choose the buffer it will texture from, or not. =20
>=20
> But how does it then help to wait on the CPU instead?

A compositor does not "wait" literally. It would only check which state
set is ready to be used, and uses the most recent set that is ready. Any
state sets that are not ready are ignored and reconsidered the next
time the compositor updates the screen.

Depending on which state sets are selected for a screen update, the
global window manager state may be updated accordingly, before the
drawing commands for the composition can be created.

> See what I'm proposing is to either render the next state of the window=20
> or compose from the old state (including all atomic properties).

Yes, that's exactly how it would work. It's just that state for a
window is not an independent thing, it can affect how unrelated windows
are managed.

A simplified example would be two windows side by side where the
resizing of one causes the other to move. You can't resize the window
or move the other until the buffer with the new size is ready. Until
then the compositor uses the old state.

> E.g. what do you do if you timeout and can't have the new window content=
=20
> on time? What's the fallback here?

As there is no wait, there is no timeout either.

If the app happens to be frozen (e.g. some weird bug in fence handling
to make it never ready, or maybe it's just bugged itself and never
drawing again), then the app is frozen, and all the rest of the desktop
continues running normally without a glitch.


Thanks,
pq

--Sig_/LoBVg6qhcuxdajU4QJB+N2E
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmECcb4ACgkQI1/ltBGq
qqevgw/+MKmK6sPuVfhHb1eCWriLQnS4+VWN8qCqZDOxWoelMi9ZdBxvJGnMvt9u
5xf6Mq90XuckM1me48ElO6KuuVcMO3V8J4ee8sJRuG/WdPEHzWDHqxF2kTmdH0lM
7ZBG/trWGr5JSJ+JT8qPMgBauz0LwHS+WY2o2NhgF5KaoqcVljZpbQRdfbyWYqfs
Hz4luuGorQ46AYy1imRh/LfwZiG2IzRJ2wuBFAaziW+UjkMxnQ7RJKFC/06guzDy
B+86dERQCrls9PTZJfECHMmOvi/+d6KS6NvlhGUzcp+v0+HDJmiPI5pLEOe2UOCH
Y0pqXjgZkbNlwEz+ofgQlfkOZHt95nVta61wK1d06oacKVtZHQOrCZjCIKpphpka
7snCgUzZ3jyPuHVIa7WzduTzDXrraqbKSYpbztsQ7hEZ9asHKMiC4Qq9X0iyuUGy
U5IHaiGsWsH08R8kRM8ccVZ4orvKxQyKUGR51tEDrmi4W1U7yr5//dj5Zdd8no9R
AN2YrUzOrvjPq7jza3xkkFCiKzU10n/aiwqjEcMHSk4qASlGu56283zeSqjGm5of
jVIr+TmgYwoZi43wqgnURWTK3FM6m9RoBrD/D76t7SeyBkY1M7WbXekfrFq0D3oz
vhkP49LVKt9I2HceIN/5dzKASb8jk9VWbvWIuq4XQIwUcv+gGqU=
=vcqV
-----END PGP SIGNATURE-----

--Sig_/LoBVg6qhcuxdajU4QJB+N2E--

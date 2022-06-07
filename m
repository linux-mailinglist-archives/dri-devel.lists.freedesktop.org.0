Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDF953F7DF
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 10:07:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A563312AF9E;
	Tue,  7 Jun 2022 08:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D106012AF9E;
 Tue,  7 Jun 2022 08:07:21 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id g25so18257400ljm.2;
 Tue, 07 Jun 2022 01:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=7mz/koFuXsqGOA9LiLodV6ltDVMka4rURZkszhqj3Yg=;
 b=exvL5IrQT2wWoaZwLOB/1wkt5vO5Lj5j743kg+No0pDX/1xzZYzz8cKbRpYsQd/ZKn
 7EAr+wXMExQ4gVxnq4BQgsqh3ButeCRugbBe+gFaxedjEFZefu2UojsUB2Fsb9h/No4f
 IrbN+GMxWjvTq0waqMFMZEfXVSY0VhEWch6u/Gvcxlu6nwDeaXbsErIjChWFeTrlQejz
 i+ezUfVBwJeoPpFog7ZA2vE17hDbxv7ai9216xODUX5fretS7ut20dJKX9+XlCFdLLDO
 bfp6BM6xfVMQUc37eTgecu+TzOUxFkr+RJKiCZp0B+7XCYFdLbWlxNlvdU8CPjKz32Fx
 wZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=7mz/koFuXsqGOA9LiLodV6ltDVMka4rURZkszhqj3Yg=;
 b=24/t3cHYWWIS8dhPYRN+lLC8KkHgzlpYwcfeahS891aTTtNQ9r++BD23rBv1a9oZN7
 rhQ40CBFtMQ8gYtjqfpjmc6d8b2LLOxA6IzJjEnhNmrBiAiPbmaHn0gR3jYwo2nMi+R5
 nANb+UsHNEh3PykFRdJxOePn6FyRqD6UKBX0oEtPVzFkFoWaZnUuCVE01C/hrQA7rXML
 U+55yVWN4awr+DREJ6XJUH3U7NM3okCYyNHg9RFFqmGNMeMUAdgBV5MWXNpJZU7Qts2C
 D32x1/NaI2AHTwNGEgkWzXAMjaiEV/Lwmdg64mx+ZDly5i/6saSybJWhLPwWuYPgtrGQ
 nAjw==
X-Gm-Message-State: AOAM5318P3LT7HfuEqc0sekCFKJufisgn/gdWIrs1HaLkAOGpp/fZyEt
 3eMMX0BHiRRy8hrg3a7Y1Eo=
X-Google-Smtp-Source: ABdhPJyicuLBh7kVytcpjRegEvfvM+A3ELYONFONwO+ZKmEUlAqpWvo7/NZSpmLjbHPA5vrS+YhV4w==
X-Received: by 2002:a2e:9682:0:b0:255:7b9f:6e8a with SMTP id
 q2-20020a2e9682000000b002557b9f6e8amr12037370lji.19.1654589239749; 
 Tue, 07 Jun 2022 01:07:19 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 v28-20020a2e505c000000b00253deeaeb3dsm2714123ljd.131.2022.06.07.01.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 01:07:19 -0700 (PDT)
Date: Tue, 7 Jun 2022 11:07:07 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Message-ID: <20220607110707.02eccda5@eldfell>
In-Reply-To: <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
References: <20220602154243.1015688-1-zack@kde.org>
 <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jnpIlGDBlgE=J/DCpCC99+x";
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
Cc: Hans de Goede <hdegoede@redhat.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 krastevm@vmware.com, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 wayland-devel <wayland-devel@lists.freedesktop.org>, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/jnpIlGDBlgE=J/DCpCC99+x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 03 Jun 2022 14:14:59 +0000
Simon Ser <contact@emersion.fr> wrote:

> Hi,
>=20
> Please, read this thread:
> https://lists.freedesktop.org/archives/dri-devel/2020-March/thread.html#2=
59615
>=20
> It has a lot of information about the pitfalls of cursor hotspot and
> other things done by VM software.
>=20
> In particular: since the driver will ignore the KMS cursor plane
> position set by user-space, I don't think it's okay to just expose
> without opt-in from user-space (e.g. with a DRM_CLIENT_CAP).
>=20
> cc wayland-devel and Pekka for user-space feedback.
>=20
> On Thursday, June 2nd, 2022 at 17:42, Zack Rusin <zack@kde.org> wrote:
>=20
> > - all userspace code needs to hardcore a list of drivers which require
> > hotspots because there's no way to query from drm "does this driver
> > require hotspot" =20
>=20
> Can you elaborate? I'm not sure I understand what you mean here.
>=20

Hi Zack and everyone,

I would like to try to reboot this discussion and explain where I come
from. Maybe I have misunderstood something.

I have no fundamental objection to adding KMS properties for cursor
hotspot, but I do want to make sure the design is fully thought out and
not simply copied from legacy KMS, because atomic KMS with universal
planes is not like legacy KMS.

To my understanding from the past discussions, the fundamental reason
why you are proposing hotspot properties is that when one is running a
desktop inside a VM and looking at it through a VM viewer application,
the pointer cursor is misplaced: the hotspot is not where the end user
sees it. This you never mentioned in any of the patches nor in the
cover letter. I can only guess that this misplacement could be the
reason why some display servers have deny-listed paravirtualized
drivers. While your goal is to get paravirtualized drivers out of the
deny-lists, we must first understand why they got there in the first
place.

Why are pointer cursors misplaced on paravirtualized drivers?

It is because the paravirtualized drivers or VM viewers do *not* place
the cursor plane at the CRTC_X, CRTC_Y position in the guest CRTC area.
This is obvious: if CRTC_X, CRTC_Y were honoured, there would be no
misplacement.

Instead, the VM stack plays clever tricks with cursor planes. I have
understood only one of those tricks, and it goes something like this.
To improve hand-eye coordination, that is to reduce the hand-to-eye
response time a.k.a latency, the VM guest KMS driver relays the cursor
plane separately to the VM viewer application. The VM viewer
application presents the cursor plane content by pushing them to the
host window system as the pointer cursor. This means the host window
system will be autonomously moving the cursor plane image around,
completely disregarding what the guest KMS client programmed into
CRTC_X, CRTC_Y. When this works, it is a huge improvement in user
experience. I believe this is called "seamless pointer" or such.

When it doesn't work, the cursor is misplaced or even completely
arbitrary guest windows start flying around as if they were the pointer
cursor.

In legacy KMS, cursors have always been very special and had their own
special UAPI with even hotspot information. There paravirtualized
drivers got away with these clever tricks because no-one bothered
putting anything but actual cursor images on the (one) cursor plane.

Then comes KMS universal planes concept. All planes are assumed roughly
equal, apart from what KMS properties tell userspace about them. The
plane type primary/overlay/cursor is still kept, but only because it
helps userspace find a KMS configuration that the driver accepts at
all. Hardware may not be able to light up a CRTC without at least one
primary plane, for example. Atomic KMS requires universal planes.

The atomic KMS UAPI contract says, that a plane is positioned at
CRTC_X, CRTC_Y inside the respective CRTC. I do not know of any
documented exceptions to this. Therefore, an atomic driver that does
not show a cursor plane at the programmed CRTC_X, CRTC_Y is violating
the UAPI contract.

See https://www.kernel.org/doc/html/latest/gpu/drm-kms.html#standard-plane-=
properties
and how "cursor" plane type makes no exceptions, and how CRTC_X and
CRTC_Y are defined. Also note that all hardware drivers and VKMS
apparently follow the contract.

Given this UAPI contract, it is very easy for userspace to make the
conclusion that a cursor plane is just another plane it can use for
whatever it wants. Weston and wlroots indeed leverage this, putting
also normal windows and other stuff to the cursor plane when they
happen to fit.

If a paravirtualized driver commandeers the cursor plane display
position, a possible result is that arbitrary windows start flying
around unexpectedly.

Therefore we have two problems:

- paravirtualized drivers commandeering the cursor plane
- VM software not able to implement "seamless pointer" correctly

To my understanding, this patch series concerns only the latter problem
but not the former problem. I believe the solutions to both are related
and need to be considered together.

How do we stop paravirtualized drivers from commandeering their cursor
plane when guest userspace does not expect it?

How do we still make "seamless pointer" possible when the guest
userspace is prepared for cursor plane commandeering?

These are the questions that need answers. To me, getting
paravirtualized drivers off display server deny-lists is a consequence,
a secondary goal. The primary goal must be to fix why the drivers ended
up in deny-lists in the first place (and I am only assuming that this
is he reason, so maybe there are other reasons?).

I believe the solution has two parts:

- The guest KMS driver needs to know whether the guest userspace is
  prepared for the cursor plane being commandeered. If userspace does
  not indicate it is prepared for it, commandeering must not happen.

- Cursor hotspot needs new KMS properties, and a KMS client must set
  them if the KMS client indicates it is prepared for cursor plane
  commandeering.

How to exactly do those can be discussed after we can agree on what
problems we are solving.

There are further problems with cursor plane commandeering. The 2020
email thread Simon linked to discusses the problem of pointer devices:
if VM guest userspace takes pointer input from multiple sources, how
will the VM stack know which virtual input device, if any, should drive
the cursor plane position?

To me the answer to this question seems it could be intimately tied
to the first problem: commandeering the cursor plane is allowed only
if guest userspace tells the guest KMS driver which input device the
cursor plane shall be related to. If no input device is indicated, then
commandeering must not happen. I can understand if people do not want
to tackle this question, because it probably has not been a problem
yet. Ignoring it would be unfortunate though, because that would seem
to imply that VM software still needs to keep some heuristics for when
commandeering the cursor plane is desired.

I could also talk about multiple cursors, but I guess that goes really
too far.

Which root problems do you want to solve exactly?


Thanks,
pq

--Sig_/jnpIlGDBlgE=J/DCpCC99+x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmKfBysACgkQI1/ltBGq
qqdMzQ/+KknmU63agIA+9eAcLeqyStcUMtq7k7bjRAp1O0AWQBcXyXw1TXL1RyyG
kr19KUs9h8toNVXZnuzuiSZ0iUQDSie5f95dYGfYxapx2mk/5Gu5E0sihOvY3DBr
zlNLsM4QVHvqNW1xQJyFzOAgFEYgPwB0r4xyEpEyYrA2RyLLAkSL8ZW2qUofr3Tm
n3B7GWZcmmjfLQ8TluZVdvxD77C6RKt2Od5l/V+O0dPW22lZKSaoqfzlB82EMpn9
GFA9xjw8HtuF4QYdIBaqusuQdgkcw8s5iLbmEVvuhbZv3vxWo+VKjAJwITDcLchE
rHK72i6R0+zeQjsP4PldbXk7VBTdBHQd8/2Lqbu6cEiuG8W1RIbqWi5M1LCd1XrE
VGt64VTnke0ejd3GxEpA5hXMMwPsBQaZUAVMTeR/l4qBZ175Z0uaDz0K8hJpDH3k
e/DMEmNHKg24qkh33a+z4OFfLEC+hnZJiVZY1G191bQzQoRvklelx91AEUH98DbM
eSXXCbwIx891fChz9KiD8NSLeeHGl7yjGUeWIgtEJzj1glXRrY0969P8lWu8xCpz
Hf72RNdVLzUdMPmE/ne/c/cMgNbDszh0AHZejuqVXsyGuaigw1oo0iDDlVPBdEFk
aAq21TZwdbHe7aCvzl8++e9+XTX0yp5FHlPtjxX2u2giO/Kkjvc=
=QdZB
-----END PGP SIGNATURE-----

--Sig_/jnpIlGDBlgE=J/DCpCC99+x--

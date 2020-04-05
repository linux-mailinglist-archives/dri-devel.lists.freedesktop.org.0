Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1F419E9E1
	for <lists+dri-devel@lfdr.de>; Sun,  5 Apr 2020 10:21:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E0088DA5;
	Sun,  5 Apr 2020 08:21:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0AD288DA5
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Apr 2020 08:21:45 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id v7so177945lfg.6
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Apr 2020 01:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=nIO+J2zROqa96NMMWoih0Qljxk32u2jcYYmYCIzDWOo=;
 b=CTA5wKCwt5q6Tc3i0iLZLpKmP48Rk231FGPsHzCb1UhztD2vHX3WFpIegR9E7xj9oo
 hnguM9uHj7Rmqjf3/gfUfhKg3hv+z5NjRYrxZCjM5JlVjaHILbQ/scFDd29qBhnhvdPT
 FyYYx7wD3eOeRxV97M05x2HdVcUpLcL5bI6vfP0SDZFIvW3loO2sLV+oY88kSB9Ud/GL
 wUm08JhF1vU0lW5SIw2gXWL2/dZAQy6pF+zvWXC672jBdognXyqR5yCl9nHgA0/Ha8o9
 7gJoept7/bQkhJx/6UlDmTAZvuodKm9aPM/V5bwWaaOKOAoHolHTdcX3vp22pbC7oe5q
 7hkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=nIO+J2zROqa96NMMWoih0Qljxk32u2jcYYmYCIzDWOo=;
 b=foYejOqeWes8MfqojSUqYY8ad7TbY1xqRL539H5zTvGH07MVk6rae27fVYlejqPATg
 NoY87PFaRRf3ySQKVwGCkaXm0YdB9MBMwUM/rjh/+1bwCH9FFQqQy7pEVwevKjQMyuK2
 4ZkZB5VdzWJQQcaQ5crCI+6TiGsc1Bgq29wIWcAHq+qHDbAPkiyTvPlh1VIblSmT9ZZG
 ROmKV59J9ON2Pvhwq1bNkb1zN1MBpMH2n0apDrytu+2RkrDDbUhTv0Jn7Z6pMyGKKIbk
 0Bepc8ah8X3P38fZNdwqMZM3r2PxETFXv6HfKvh76rwBGnOWrgZvrIU1yUp5T0vbWUqB
 n/Ig==
X-Gm-Message-State: AGi0PuaZksSAPhQcAk7tBYSw686LBdVP7UodxoIW/XAKew1rSVrXkA5C
 iMKwYKYk3LROO5PIFv9mHY0=
X-Google-Smtp-Source: APiQypKSpMw5V79yM1wKW/pW1O97VlxXYOz+ebQtUV7w00u8QOvpDNtx3Y/tQaPJl8/dbxl2/VwnCA==
X-Received: by 2002:a19:ac41:: with SMTP id r1mr10154348lfc.113.1586074904034; 
 Sun, 05 Apr 2020 01:21:44 -0700 (PDT)
Received: from ferris.localdomain (85-156-247-180.elisa-laajakaista.fi.
 [85.156.247.180])
 by smtp.gmail.com with ESMTPSA id t6sm9430023lfb.55.2020.04.05.01.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Apr 2020 01:21:43 -0700 (PDT)
Date: Sun, 5 Apr 2020 11:21:31 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Erik Jensen <rkjnsn@google.com>, Simon Ser <contact@emersion.fr>
Subject: Re: Curtaining API / Force blanking displays
Message-ID: <20200405112131.1b2c5fc0@ferris.localdomain>
In-Reply-To: <CAN=K5G92HHwFqH4FPeqfJkD-hj8HJBy+7dTWEg55BP_HnHFjKw@mail.gmail.com>
References: <CAN=K5G92HHwFqH4FPeqfJkD-hj8HJBy+7dTWEg55BP_HnHFjKw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0911616806=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0911616806==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/3Y_vz_5_O2wcb38b7.=gpNa"; protocol="application/pgp-signature"

--Sig_/3Y_vz_5_O2wcb38b7.=gpNa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 3 Apr 2020 12:56:33 -0700
Erik Jensen <rkjnsn@google.com> wrote:

> First off, apologies if the functionality described already exists and I
> just failed to find it, or if this isn't the correct venue for this
> discussion. If so, pointers to the correct location would be appreciated.
>=20
> I'm currently looking into the feasibility of developing a remote access
> tool using kernel-level interfaces (e.g., drmModeGetFB and uinput) to
> operate regardless of whether the user is using Xorg, a Wayland composito=
r,
> or even a text console (assuming KMS is in use).
>=20
> One of the requirements, however, is the remote user is able to "curtain"
> their session in order to prevent individuals near the physical machine
> from watching their session. Imagine a user working from home and
> connecting to their workstation in a shared office space.
>=20
> One possible solution I came up with would be a new kernel API to allow a
> privileged process other than the DRM-Master to request that all displays
> of a card be blanked or left in power saving mode. This wouldn't affect t=
he
> ability of the DRM-Master to change modes and layout configuration, but no
> content would be visible on the physical displays until the curtaining
> process ended the curtain or exited.
>=20
> Is this (a) a good approach to solving this issue, (b) an API that, if
> implemented, would be likely to be accepted into the kernel, and (c)
> something that would be feasible to implement given the current
> architecture? E.g., would it require changes in individual drivers, or
> could it be managed solely in driver-independent kernel code?
>=20
> I'm new to DRI development, so if it is something that folks would be open
> to having, pointers to a good part of the code to look at to start
> implementing such a feature would be appreciated.

Hi,

I have heard of such a screen scraper already existing, maybe Simon
remembers where one is?

Personally I am very much against the whole idea:

Screen scraping like that will have big problems trying to a)
synchronize to the display updates correctly (was the screen
updated, did you get old or new frame, and you have to poll rather
than be notified), and b) synchronizing framebuffer reads vs.
writes (is the display server re-using the buffer when you are
still reading it). You also get to handle each KMS plane
individually.

You have to adapt to what the display server does and you have no
way to negotiate better configurations. The framebuffers could be
tiled and/or compressed, and quite likely are the kind of memory
that is very slow to read by CPU, at least directly.

It obviously needs elevated privileges, because you are stealing
data behind the display server's back. Then you are feeding it
through network.

The curtaining goes against the policy that the current DRM master
is in full control of the display. It also means the kernel has to
lie to the DRM master to make the display server unaware of the
funny business, and I don't like that at all.

With uinput, you will be having fun issues trying to guess what
keymaps the display server and apps might be using, since you need
to know that to be able to manufacture the right evdev keycodes
that will be translated into the keysyms you actually wanted.
Keymaps can change dynamically, too.

I believe it would much better to cooperate with display servers
than trying to bypass and fool them. Maybe look towards Pipewire at
least for the screen capturing API?


Thanks,
pq

--Sig_/3Y_vz_5_O2wcb38b7.=gpNa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl6JlQsACgkQI1/ltBGq
qqcSrhAAjWuEaNY30y9AkhqBqfvlR529671sI8EJ754Cawl++gi6lEnYKBEW39jB
ljkYBjEZuRbIt3GHD4TRq/8J+A9GUF6m6yjlsMCOsM+mCcbxfav9cND2EkSaxXaQ
cMJfGbN/tXeZiW9o6/XauS5gNFjizcnlwBXjBv4RSmD17Ik3F07IllLDQYknKmAQ
OPNXLJDpwyvu/E/xMbQQnu/DTZI41xinnaHUuSmfhSmnZuKf/qqtYBU/ABpgMAYT
Qn21kdXH5aSSuMYZH6d0aTt4GxawiiB8loj6MYjFC19QSgMNkyqTdWU9tOb4Ax95
l0dtJavCaRgXgkYJR2ezPed9As5Brf75U3ATJHooUC+UKUDQ19y3QA++MDm7jxJr
OYJ/fLpiL6/WjPB6RrO6OQzH7Rbr4f8w7Ox1MzKniZw7pjG0uFJSU3U8D0iv452u
2Djx3pA5pYRBvn4a6FBLgsjEIkz+peCZbeuensm+fd6ePWT0EtZWTTU6bUomeMPR
hEw8Cra8WoE5c2gFJ80G08WsvIVIopfwCpqWAJkODjQ9gaHyVQLKAwgoGaos5bsI
LKjGdhY1ba5nBadFNS/354RrNR7PGxcmUbk5LCLeX4OntBLdAWJVa1jnd/SXWL50
prCwCL3KZxQgp3DzHdBwqItrpCubvRi415Lr5m8PdTn6vzhaurY=
=ptef
-----END PGP SIGNATURE-----

--Sig_/3Y_vz_5_O2wcb38b7.=gpNa--

--===============0911616806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0911616806==--

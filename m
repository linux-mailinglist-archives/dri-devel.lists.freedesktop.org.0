Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AC81E1C62
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 09:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23FAE89B33;
	Tue, 26 May 2020 07:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32CB889B33
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 07:39:42 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id l15so22925302lje.9
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 00:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=7ScOrYTllOY++BlasNM6jnwDzUpu8MWVQMS+ePPmJ4E=;
 b=ql2uaQM3A8Uo5HCGt8loxaJ+i++4MSfmxHInbEXRqBraBgrM3JzpV3sJ0VyPnj5pHO
 pOkWxUk/Lenmm51zyT4ePVMJmYW6XS4IEh58joM6JuykRUbDTWqU831cInV8A/TUdRk9
 nBKDGD2C859HNDRrxhMDguDETL0cBTY/4f+BIYfI0KTKWPagTJNhz5/Ra+xMFBcAYUcI
 J3aCmJTr/3SUUW0MumTTyttF42DuCSIg82HF3edNiT9B+R0ryIEqifoF1uzopfdOAiKD
 +gHpnxm2N8EW9mwmiGVyHn0y/gJB7cHm/IS8xkD9BsmhxQfwoP+MbtIAue65jnh3ikP7
 m/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=7ScOrYTllOY++BlasNM6jnwDzUpu8MWVQMS+ePPmJ4E=;
 b=ndbjU8a00CxFS6+yu7w7AigNo5kiegkS4qgrXrheif0uff9QmgqEaYjQQQtp6S6DcD
 09IQDD/gHa5KJxxzvBz1uR4an3SD7Ldv/yklAoE91Bn7Mu32FdBhHjNY1OSjLGckAfjv
 2obeWhkZr01Efh77gFmWWahvy92CIAesm4klJGjiD5VbD4VhrcnGb50/c0sgdrjHgdnU
 B7/IxiZjizaTK9ZxtPt6XCTvrCL0LHnMGrGZqv4ZbIdZoIbpR+Awosi672VILtkJlQml
 DRLHJMTTvYZLvrZrpnGMbHAkBXwMwNUKW2mrfbbO5N4tb8ZQsnXc1gz3hTDRlCCZoXE6
 S4Lw==
X-Gm-Message-State: AOAM5312j7Fe5aS10/LoUdoLu5yKit4QZmBUCFOPRHmOrZj/afgCYHt1
 CpZKhKFsQLeO+XoetCctP/A=
X-Google-Smtp-Source: ABdhPJycVSmzriDhRCoJzAd4UuwfdXx3U5QYMgRq+E7HBqLcnwDjiKRaXOKER5LvzDGiM0yhoqd8EA==
X-Received: by 2002:a2e:3e09:: with SMTP id l9mr14888722lja.260.1590478780446; 
 Tue, 26 May 2020 00:39:40 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id t7sm5767870lfq.64.2020.05.26.00.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 00:39:40 -0700 (PDT)
Date: Tue, 26 May 2020 10:39:21 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Yogish Kulkarni <yogishkulkarni@gmail.com>
Subject: Re: Dynamically change enumeration list of DRM enumeration property
Message-ID: <20200526103921.0817ee0b@eldfell.localdomain>
In-Reply-To: <CAL3Fm-JJbjCby5_HojTf9dWKurw+CECN7LDqamtf53c9L-0jtw@mail.gmail.com>
References: <CAL3Fm-JJbjCby5_HojTf9dWKurw+CECN7LDqamtf53c9L-0jtw@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0355327201=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0355327201==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/dl7Xp4lkJqMfX.B4QK52GcL"; protocol="application/pgp-signature"

--Sig_/dl7Xp4lkJqMfX.B4QK52GcL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 26 May 2020 10:01:23 +0530
Yogish Kulkarni <yogishkulkarni@gmail.com> wrote:

> Hi,
>=20
> Is it possible to dynamically change enumeration list of  DRM enumeration
> property ? Motivation behind this question is to understand whether it is
> possible to create connector enum property (e.g a property which will list
> supported output encodings -  like yuv420, yuv422 etc) whose list of
> supported enum values could be changed dynamically e.g. based on which si=
nk
> is connected.
>=20
> I think there is existing EDID connector property whose value changes bas=
ed
> on connected sink. EDID is a BLOB property, I am trying to understand if
> this is also possible for ENUM type property. There is
> "drm_property_replace_blob" to replace blob but I wasn't able to find any
> API which could replace list of supported enums. Alternatively, would it =
be
> good idea to destroy custom enum property created by a driver and create
> new enum property with new list of supported enums e.g when there is a
> HOTPLUG event.

Hi,

looking at Weston code, it *might* cope with it. A hotplug event does
cause Weston to re-discover all properties of a connector. This is
specific to connectors only.

The race exists though: userspace might be poking at KMS after you
changed the property in the kernel but before userspace handles the
hotplug event. You'd have to check that does not cause regressions. I
guess for a completely new property, the risk seems low, as userspace
does not know to poke at it (risk of using outdated property or value
IDs causing unexpected atomic commit failure). Also I'm not aware of
any KMS program that would yet attempt blind KMS state save & restore
to sanitize the KMS state after dropping and re-gaining DRM master.

You'd have to check all other KMS using programs too: every Wayland
compositor, Xorg, DRM Vulkan WSI(?), ...


Thanks,
pq

--Sig_/dl7Xp4lkJqMfX.B4QK52GcL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl7Mx6kACgkQI1/ltBGq
qqeoRA/6AiP2uD5UeXodeblXHvsIAdFGk/g1rSeT83YqKsiLIRgMFp8QaKt6QY//
HhIQS73eLUiz3NTHV3DK/RD2HxV8K06hk7Cz5dc7jYkzaLfY214x1nXk35e7w+u5
ZONiPKKd6hL4AIYjK1Gte+5YX9JToF+0Xq9By9vI7/j1RCAHRX8CchAo/L1N0dKE
ulKdroKxP6c8daBDm+0UEnwGrPFgvXE6zfkho0wL+2z6NaMcNM3qIjRb4dcSsxNo
VwK6qfDeQoY4o+zK+z9JVM33vA0RnFm3jmmikIZFh0ffz/MpLjfoYb6dxxfGjp8h
BOoEMBX5YvLuaaH0gXGVI1Hu5Z6x8xhmdnTVhvrazNvKj89y65rxuZU7DV1zYK8M
5jmeF1iImsMVLH3KiihhAHw6aEyDGcpv0ODth/CC+/gjO4/aj5Uf6pzSAG8qQ8m2
jTI5lzPOcTiIIBNSyIieHOW42aoQuCZZxTkgexUU4aDw3iEXN8+WATS5EzbD3tJS
vWMO3nw9JT0fTCyERd5SticbKPfZY9V7gUuoKbVnBjYSAEDJbo4gL0xgDMg6fQFd
c6I2n/aQHGG0LRwjg2TwADNGzMVVpVJXc9eM7pft1maYLNedfy66oT+fmh+JyztH
vI3m9JvsXo5ugAZLZ5evi0iCOyIAh+amVgY0v986IIpzYxw58m8=
=E1Y3
-----END PGP SIGNATURE-----

--Sig_/dl7Xp4lkJqMfX.B4QK52GcL--

--===============0355327201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0355327201==--

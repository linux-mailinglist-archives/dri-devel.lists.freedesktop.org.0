Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6465415956
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 09:44:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0EC66ECF5;
	Thu, 23 Sep 2021 07:44:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B2B6ECF3;
 Thu, 23 Sep 2021 07:44:08 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id i25so23243323lfg.6;
 Thu, 23 Sep 2021 00:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=sxO9wiKWU8LxvoAFdFHc7ptlbcuUg/7qHSamou9zy0k=;
 b=ibLpNIL3lMgiaDddC1aHZVnOjPVw2QXg0/gKOmtmRgKjeqfNctglnvSo5IloYbooVY
 kdJdB76H6spUnaX4Q0zHN10PmPhNTdxkOKpJ0JpGm10Zq29rN9aZwbC0VaLraed0R08O
 kC9Hmqueh0D7sRrWlnz3AuVoHDoDVV0t3UpjAZwzz7i4wCAtgRywaCZjM1XnJAEfIMFS
 IuWMTKvSXLA+8XphvhCeuKsNuTWQuZtPAA332lg9OBi2bpm5eWkM+340mJMw3Nc7o9CM
 miSz6IT3CjpfYWLJn5RNPgkYQ8DKYiJVu8Qhje1stDbr8hXPDB/Nh8ADAUY6SbCIzsRF
 lmPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=sxO9wiKWU8LxvoAFdFHc7ptlbcuUg/7qHSamou9zy0k=;
 b=GtFNR0YslihdCq2WjBmmmOzQJDmYBK2vnFM0ryl9fnHwyhAMGvQ01QTmDiswuAHjha
 rH0n+BhAXCYyoOGttd7ONfP2IoY9vEtrcv4fVdqpp1QEEtgmavW/HcU3foGoV/sLtDJ8
 0lTqZwtDh4n/lM8D9BJgoxHnTuQTKHIJjVXKoWNXsEgffxwK+COT+0xB+wg8I87S1CiE
 eS8JlA2GXv0W+SjeTzZhPvyqtgkuT/oqWrXCQ2UHmB4UBz7c9wX9kwIyCG2gYWWy2LKB
 XNqQpfZNuwwYJ/CIaSyjIW9RhijdwvAKrbBMViFw4p1+dYyoINH7vahTOeLIQ1BLspi3
 cIFA==
X-Gm-Message-State: AOAM530JOuBLqwNI6xpfshIaXLOnzyR/zvPXQ/r/xZ3LaDhDLvBaqwq2
 rbr2kJ3k/t+OGMEp+sZDQLc=
X-Google-Smtp-Source: ABdhPJwOKzXjzrsxRyIAJnbyyctqIr5LFWVCT990i9WjwMV1tUPSecE0GclRCxZRXOyDIsjP5wsEyg==
X-Received: by 2002:a19:501e:: with SMTP id e30mr2915618lfb.123.1632383047141; 
 Thu, 23 Sep 2021 00:44:07 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id r15sm381913lfi.167.2021.09.23.00.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 00:44:06 -0700 (PDT)
Date: Thu, 23 Sep 2021 10:43:54 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, sebastian@sebastianwick.net,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mcasas@google.com, jshargo@google.com, Shashank.Sharma@amd.com,
 Deepak.Sharma@amd.com, Shirish.S@amd.com, Vitaly.Prosyak@amd.com,
 aric.cyr@amd.com, Bhawanpreet.Lakha@amd.com, Krunoslav.Kovac@amd.com,
 hersenxs.wu@amd.com, Nicholas.Kazlauskas@amd.com,
 laurentiu.palcu@oss.nxp.com, ville.syrjala@linux.intel.com,
 jeremy@jcline.org, Brian Starkey <brian.starkey@arm.com>
Subject: Re: [RFC PATCH v3 1/6] drm/doc: Color Management and HDR10 RFC
Message-ID: <20210923104354.585ed9b1@eldfell>
In-Reply-To: <823898e8-a8fe-cc74-e5b4-c4907826efbc@amd.com>
References: <20210730204134.21769-1-harry.wentland@amd.com>
 <20210730204134.21769-2-harry.wentland@amd.com>
 <20210915170127.31377385@eldfell>
 <4ed51ca0-ca98-cf84-33ed-ab172e3548d3@amd.com>
 <20210921163158.688c26bc@eldfell>
 <0c673cf8-2b90-c1ca-a0b0-c809e7e10c2c@amd.com>
 <20210922113105.2e42754c@eldfell>
 <823898e8-a8fe-cc74-e5b4-c4907826efbc@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KZJFcJ42xx2mtwZ8U/l6Sra";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/KZJFcJ42xx2mtwZ8U/l6Sra
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 22 Sep 2021 11:28:37 -0400
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2021-09-22 04:31, Pekka Paalanen wrote:
> > On Tue, 21 Sep 2021 14:05:05 -0400
> > Harry Wentland <harry.wentland@amd.com> wrote:
> >  =20
> >> On 2021-09-21 09:31, Pekka Paalanen wrote: =20
> >>> On Mon, 20 Sep 2021 20:14:50 -0400
> >>> Harry Wentland <harry.wentland@amd.com> wrote:
> >>>    =20
>=20
> ...
>=20
> >  =20
> >> Did anybody start any CM doc patches in Weston or Wayland yet? =20
> >=20
> > There is the
> > https://gitlab.freedesktop.org/swick/wayland-protocols/-/blob/color/uns=
table/color-management/color.rst
> > we started a long time ago, and have not really touched it for a while.
> > Since we last touched it, at least my understanding has developed
> > somewhat.
> >=20
> > It is linked from the overview in
> > https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_reques=
ts/14
> > and if you want to propose changes, the way to do it is file a MR in
> > https://gitlab.freedesktop.org/swick/wayland-protocols/-/merge_requests
> > against the 'color' branch. Patches very much welcome, that doc does
> > not need to limit itself to Wayland. :-)
> >  =20
>=20
> Right, I've read all that a while back.
>=20
> It might be a good place to consolidate most of the Linux CM/HDR discussi=
on,
> since gitlab is good with allowing discussions, we can track changes, and
> it's more formatting and diagram friendly than text-only email.

Fine by me, but the way things are right now, we'd be hijacking
Sebastian's personal repository for these things. That's not ideal.

We can't merge the protocol XML into wayland-protocols until it has the
accepted implementations required by the governance rules, but I wonder
if we could land color.rst ahead of time, then work on that in
wayland-protocols upstream repo.

It's hard to pick a good place for a cross-project document. Any other
ideas?

> > We also have issues tracked at
> > https://gitlab.freedesktop.org/swick/wayland-protocols/-/issues?scope=
=3Dall&utf8=3D%E2%9C%93&state=3Dopened


Thanks,
pq

--Sig_/KZJFcJ42xx2mtwZ8U/l6Sra
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmFMMDoACgkQI1/ltBGq
qqeAfg/9FSk5m2yP7blP4mZoHPVhn+S6ICSGkyYnFYZvs1t6N00RnYdq32R4e0oA
mnkOHaVzWseGGRVWR6I+31cGz1qu7Mt8vRKRoEswK9IU9MOyEj6sU9VlT1HoMFaY
k+IKE7mYU7hD9m7jvJGlFPR2KjfSgrrB4TCdF0YLc4QWJJnNM4revMwQ8Hlurqoc
nT7I9/3clMcfH8IJ4QrkI9XYG7RaOUXCkoq9AJ4PnNH6DQ9VHdXWsgAzx5Y9VOnH
eSAQdJt9BdU3onerNSxthLyTmZN4/N28OVAxcohJ2RQ0zg76pkOrrcg6KRfzGaQz
epeJZBMD7B6RRdRhCjFzDS3JRhBENagjKdCQvSpSGSDRcJjuex8J/E1wGiDc1em7
hYpFCcPp1BE1s18n9WI1zOU5MtgB898+4XJ05ASrif1IfoNjpslLUsjndTRW6N4t
9YpKKwqOFt00+TzFCMGhf4jDNcFpXp1LFH4oNzs66aIQLCdJe4+o7kRlzsfe+cWW
oCNGqyhvMbJjbsH28s2PrHMG5dQChX4JXoD7ByzIiBec6HWu1m8mcOayQQU8silo
L6avZudWDNO8MiHuGWvLGbVDYHOHlhjUwp/I5WY4AgSA37mN2KSQ6nqTIb/UHIpq
c9kHejjjy2wYtv+7HeEuw/+caKpJI6e9Uj6tacgraF63s6raiJs=
=ce7y
-----END PGP SIGNATURE-----

--Sig_/KZJFcJ42xx2mtwZ8U/l6Sra--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA1B3B1603
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 10:39:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079BD6E87E;
	Wed, 23 Jun 2021 08:39:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23ABA6E87E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 08:39:34 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id d2so1874262ljj.11
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 01:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=JVVPmMsCMUJTTUxP116vddvjsDYb2XLODOyPNo5b6Q0=;
 b=U8eroileOWi5RjAvTJj2sDllrmRnJd7CJ2xXyOXYrz7nigB3aytLM82H7a1DPsBH3V
 Hsw69y+VTcpUOUHJs29X501UsAhEHWI9msIuuNmEws/tq6hY6Ckgi1BPMfnKY53vE7LJ
 /TaUi+TAQv1+NYS5MR40NHlrd3xKxQtvJe8efbcBJN0rFhiakjMSlZ/7Ni+FOwsaaqfY
 96xCgqOaa0WiOonkcri+JXw/VVlO7/X6NnQiEVL3H8K4R4SMbtxIo+CqoVBewweUauvl
 5GGQ/lQHolXyiT/zVi8qRMBZa1nF8GiVwsKtUr/91gEM430Azg2ZBJHUN5Ff4MBINR/x
 J1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=JVVPmMsCMUJTTUxP116vddvjsDYb2XLODOyPNo5b6Q0=;
 b=haYWX6J1tqpV7xKgFTIGxOrf+F92bIzSJ6kJwhWJSdCwsRZnbrBzX0gyuP5XXpUIrx
 sZg6sBDZR/k4Ios2MBgMWfR8AX2XuZrfX/zgFxwY24axs5ofSkGEtDeUOL3k6uLCrlE/
 GUZ228UgyxtYQuaS+Z70cwpETnVtT+GOf5BxnlKBMGhd5iBbpA/8Joc+Azuz7nLqwodM
 wh6JWrx1I4D24Sg6y6jlkgQvCNVzlSpa2AIxvFWyOce8wEL8bVDQ7kaI6psNXLG6BVNd
 TcWdnuchGuKRlK8OFqxhQgxv+kF2ZZXU/M9Mhem4V+0PHc/g65u2uuC+/e78LQE2etNG
 7J0w==
X-Gm-Message-State: AOAM531SsNxYEBKuNBYYtMF+ezJLNfpGMs5o2IJ7KS9SHHKc08WfxB1u
 TSO1BVnta7E2vcj3uc0cpPA=
X-Google-Smtp-Source: ABdhPJzRh29FsphJLIFAyu1GAlHco4CplOxueTqhR9EahKY4LwtLyMQ1B/Fxt5QvKOBHup6q/XrY0w==
X-Received: by 2002:a2e:b88b:: with SMTP id r11mr7013293ljp.24.1624437572620; 
 Wed, 23 Jun 2021 01:39:32 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id v13sm400428lfo.33.2021.06.23.01.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 01:39:32 -0700 (PDT)
Date: Wed, 23 Jun 2021 11:39:22 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Esaki Tomohito <etom@igel.co.jp>
Subject: Re: [PATH 0/4] [RFC] Support virtual DRM
Message-ID: <20210623113922.1e603139@eldfell>
In-Reply-To: <ee0161b5-c88b-40ce-c02f-86e0927b70bb@igel.co.jp>
References: <20210621062742.26073-1-etom@igel.co.jp>
 <7cde82a9-c60c-e527-eeac-eaad0c5842a1@metux.net>
 <1cfab5f9-f275-aa53-00de-5da3fcea71c5@igel.co.jp>
 <20210622111239.73aa87aa@eldfell>
 <ee0161b5-c88b-40ce-c02f-86e0927b70bb@igel.co.jp>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/R+0wtRr6C.FPOSdHFeGxePL";
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
Cc: devicetree@vger.kernel.org, Takanari Hayama <taki@igel.co.jp>,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, "Enrico Weigelt,
 metux IT consult" <lkml@metux.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/R+0wtRr6C.FPOSdHFeGxePL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 23 Jun 2021 15:56:05 +0900
Esaki Tomohito <etom@igel.co.jp> wrote:

> Hi,
> Thank you all for your comments.
>=20
> On 2021/06/22 17:12, Pekka Paalanen wrote:
> > On Tue, 22 Jun 2021 13:03:39 +0900
> > Esaki Tomohito <etom@igel.co.jp> wrote:
> >  =20
> >> Hi, Enrico Weigelt
> >> Thank you for reply.
> >>
> >> On 2021/06/22 1:05, Enrico Weigelt, metux IT consult wrote: =20
> >>> On 21.06.21 08:27, Tomohito Esaki wrote:
> >>>
> >>> Hi,
> >>>    =20
> >>>> Virtual DRM splits the overlay planes of a display controller into m=
ultiple
> >>>> virtual devices to allow each plane to be accessed by each process.
> >>>>
> >>>> This makes it possible to overlay images output from multiple proces=
ses on a
> >>>> display. For example, one process displays the camera image without =
compositor
> >>>> while another process overlays the UI.   =20
> >>>
> >>> Are you attempting to create an simple in-kernel compositor ?   =20
> >>
> >> I think the basic idea is the same as DRMlease. =20
> >=20
> > Hi,
> >=20
> > indeed. Why not use DRM leases instead?
> >  =20
>=20
> In this use case, I understand that this is not possible with DRM lease,
> am I wrong?
> I understand that it=E2=80=99s not possible to lease a plane and update p=
lanes
> on the same output independently from different processes in current DRM
> lease.
>=20
> If this is correct, what do you think of adding support for plane leases
> to the DRM lease to handle this case?

Hi,

I would love to see support added for leasing individual planes,
especially to replace the virtual DRM proposal which seems to be
eradicating everything that atomic modesetting and nuclear pageflip
have built over the many years.

However, please note that "on the same output independently" is
physically impossible. Semantically, the planes define what a CRTC
scans out, and the CRTC defines the scanout timings. Therefore it is not
possible to update individual planes independently, they will all
always share the timings of the CRTC.

That combined with KMS not allowing multiple updates to be queued at
the same time for the same CRTC (atomic commits and legacy pageflips
returning EBUSY) makes the plane updates very much inter-dependent.

If you want to avoid EBUSY and have planes update on the vblank you
intended, you really need a userspace compositor to pull everything
together *before* submitting anything to the kernel.


Thanks,
pq

--Sig_/R+0wtRr6C.FPOSdHFeGxePL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIyBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDS8zoACgkQI1/ltBGq
qqc/5g/3ak40wL+VtqFnrsfVD4HOtihTdvbodwtvOR+di7hRg9DyAo4acZgCylm/
XDsoSrLQtUQZIhlub+nSt4937wJFkhBLdhKJIAXQ6EYJHlizAWvzh1UE949lz70T
p5pvLlXbzr1tBj7ekgLuU3J1Tk5EywMB5/nCtEfivvrSAbW4t624kR731VgFPua5
p70PRiQeNWAxwXsMhK6ujD7B0egngvnKzXCA6f8zjT8t8psi4cduGujo8v5tmGoj
wDh1HcMmtlU2eXSxaiNjq/nP+d6MV6WAeVghFzbDg8H883PB5UPLby1TAZugqO17
vcysXxj9knf4jVGO2glafuxPyQD62X2bcSbSv8EX4gEVSggseht/Lq3ZPWr+CMG2
3yGPKr3bn+MW8S2X5N0T/UQm6umxJS/3Gu0AiruVCZ2CG999CUKIc+O7cLW+EvQP
sCol/K0/fbJamuPE5wE0REj9RkpEADNM4+i/Iv1Xh9RXecetKXLuOBX2lkVZrbdr
XSU8mCVBx+D7Bhp9rGYv7uy4MP3R2m19D4UfWt1BEDEX/oF3Tv53fbIkw7U685YX
ZRQcnrMxExYyM6AZtXNs2cH1jelablm8fDPr8QLCoCDya06iAZK2F43hag0HOm3B
+ny7k73O/3HeUyehS0uFaUh+BnPLI2lHvWjURHhWlOqtNzVl2w==
=dkL2
-----END PGP SIGNATURE-----

--Sig_/R+0wtRr6C.FPOSdHFeGxePL--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F42144D33B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 09:32:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A51266E930;
	Thu, 11 Nov 2021 08:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FEA46E930
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 08:32:22 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id bu18so12540103lfb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 00:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=bAWgbXXJaehgCQZ0mNxyAnkzOz3XcEB3SFmXvKYyHQA=;
 b=WWu7o0Ebxv5vxjMOO74RStR75VA+A0Z6DIchSWcuBJsFfxoOu1PSkAPZoOQGLVyMaE
 TS0HNemSIu4VIUeCjSXHNM+bMwnV6IhQHrunxgUq1tLnUEPw4OR75M1MFFuJhkDVEXJ7
 efCQEKdtnfcayOMM2iqRf8JGG5OnlZ6Yd+86h5LXrFA5QCUlPy4fibYOksJwp9zznwou
 2mjmUsDvPVVdX5EFA2DFyGdEDqfZFkE5dPWVsMeveaIlCSlvHIVWir+ZUI3U2+ioAIHr
 MFGT3P1JqTCHp0gj8AAFlIKMfBsggfgkMN3Hoaz4o1YR7RR97XcItvCIZN80dO58Qcy/
 k08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=bAWgbXXJaehgCQZ0mNxyAnkzOz3XcEB3SFmXvKYyHQA=;
 b=yHGDSAx4yLrT8/URaDpC+2ob/34YnaTG6CYHMOWP3ULWDh8tOouO+Rxzt7+iUbxbr1
 I9h3iYKqPnfK0sJHW4wzJaNL6fEmHl3s2ef1McR5ENN5B1yG7XmWhetVsrLTao7XepY1
 /SH5ZWDAqCpHR4ab73wb1i29ImnFQ7oDhCt6Mi8rfEWg1mGF9V6j27VD9/4N/iQpatui
 9rsB9ziXoRwy0KHKAtBah61DD//lL0h182jFR0jlne86TPFjrC0aMwhzeyEeG9uP+U2R
 9gs/aWaTdFFGjc/6IkS8yPt3+15ZhjYJguK6qG+S6QBYLv3PAjyM6Bmd+hqtnCAJdyI+
 B1TQ==
X-Gm-Message-State: AOAM530CexsUmkUDnIXVOjLIk5zovj1y3+wjOKgCPH7w2ktaLbQFmgSf
 1NB+rreC26CqcyEtqT6fH7g=
X-Google-Smtp-Source: ABdhPJwDB042Di1WT7liMCbw4AGKaH65w2zLPTQOAB8sjT28R/9hRNPR4aRk/T7oPLOB59hfeEyG9A==
X-Received: by 2002:a05:6512:2609:: with SMTP id
 bt9mr4876548lfb.202.1636619540536; 
 Thu, 11 Nov 2021 00:32:20 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id o15sm220281lfu.283.2021.11.11.00.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 00:32:20 -0800 (PST)
Date: Thu, 11 Nov 2021 10:32:16 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Igor Torrente <igormtorrente@gmail.com>
Subject: Re: [PATCH v2 0/8] Add new formats support to vkms
Message-ID: <20211111103216.23149c57@eldfell>
In-Reply-To: <CAOA8r4G50U0fxSfU0HZtZoZCK6fngPmxL3cM4LVpLQn=HfZG_Q@mail.gmail.com>
References: <20211026113409.7242-1-igormtorrente@gmail.com>
 <20211109113253.480ee93b@eldfell>
 <CAOA8r4G50U0fxSfU0HZtZoZCK6fngPmxL3cM4LVpLQn=HfZG_Q@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aAKq8mR.Zj_FBjo9G8rgMH.";
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
Cc: hamohammed.sa@gmail.com, Thomas Zimmermann <tzimmermann@suse.de>,
 rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>, melissa.srw@gmail.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/aAKq8mR.Zj_FBjo9G8rgMH.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 10 Nov 2021 14:32:26 -0300
Igor Torrente <igormtorrente@gmail.com> wrote:

> Hi Pekka,
>=20
> On Tue, Nov 9, 2021 at 6:32 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> >
> > On Tue, 26 Oct 2021 08:34:00 -0300
> > Igor Torrente <igormtorrente@gmail.com> wrote:
> > =20
> > > Summary
> > > =3D=3D=3D=3D=3D=3D=3D
> > > This series of patches refactor some vkms components in order to intr=
oduce
> > > new formats to the planes and writeback connector.
> > >
> > > Now in the blend function, the plane's pixels are converted to ARGB16=
161616
> > > and then blended together.
> > >
> > > The CRC is calculated based on the ARGB1616161616 buffer. And if requ=
ired,
> > > this buffer is copied/converted to the writeback buffer format.
> > >
> > > And to handle the pixel conversion, new functions were added to conve=
rt
> > > from a specific format to ARGB16161616 (the reciprocal is also true).
> > >
> > > Tests
> > > =3D=3D=3D=3D=3D
> > > This patch series was tested using the following igt tests:
> > > -t ".*kms_plane.*"
> > > -t ".*kms_writeback.*"
> > > -t ".*kms_cursor_crc*"
> > > -t ".*kms_flip.*"
> > >
> > > New tests passing
> > > -------------------
> > > - pipe-A-cursor-size-change
> > > - pipe-A-cursor-alpha-transparent
> > >
> > > Performance
> > > -----------
> > > Following some optimization proposed by Pekka Paalanen, now the code
> > > runs way faster than V1 and slightly faster than the current implemen=
tation.
> > >
> > > |                          Frametime                          |
> > > |:---------------:|:---------:|:--------------:|:------------:|
> > > |  implmentation  |  Current  |  Per-pixel(V1) | Per-line(V2) |
> > > | frametime range |  8~22 ms  |    32~56 ms    |    6~19 ms   |
> > > |     Average     |  10.0 ms  |     35.8 ms    |    8.6 ms    | =20
> >
> > Wow, that's much better than I expected.
> >
> > What is your benchmark? That is, what program do you use and what
> > operations does it trigger to produce these measurements? What are the
> > sizes of all the planes/buffers involved? What kind of CPU was this ran
> > on? =20
>=20
> 1 and 2) I just measured the frametime of the IGT test ".*kms_cursor_crc*"
> using jiffies. I Collected all the frametimes, put all of them into a
> spreadsheet, calculated some values and drew some histograms.
>=20
> I mean, it is not the best benchmark, but at least give an idea of what
> is happening.
>=20
> 3) The primary plane was 1024x768, but the cursor plane
> varies between the tests. All XRGB_8888, if I'm not mistaken.
>=20
> 4) I tested it on a Qemu VM running on the Intel core i5 4440. ~3.3GHz

Hi Igor,

alright, that analysis sounds fine, even though varying cursor plane
size is casting some ambiguity on the results.

If you want to dig deeper into measuring this, I would suggest some
scenarios if at all possible:

- large primary plane and large cursor plane with 100% overlap, to
  measure the raw pixel throughput

- large primary plane and small cursor plane with 100% overlap, to
  measure the efficiency of skipping pixels that do not need blending

- large primary plane and large cursor plane with only a little
  overlap (cursor largely off-screen), to measure the efficiency of
  skipping pixels that do not contribute to the end result at all

But that's only curiosity, I think your existing benchmarks sound
perfectly fine as the difference is so big.


Thanks,
pq

--Sig_/aAKq8mR.Zj_FBjo9G8rgMH.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmGM1RAACgkQI1/ltBGq
qqccjw/+NaIAuS5yjND9W+LPJZ6qAEJ2F5MhH86jmZxxj/9MOD6wn6ZSNRXJYqWO
PJkCoYx9pGaAzLiXvU0NhHe7V8Bt0RkAdH0B4HdNkzXaJ6uExc36kmDAFeFAY9kA
b2clmUZ/g2d9QLAitRdFzfZE8RYeC/hhZ0nynoOg6NwEEdYB76dlOTjg1y49d/lQ
Xv6Ey+O9uXH7hAMdSIB4NjDiyDLHJQRJW6zBF8VCmwv4cVuVtwKpNTAFkjJVJY1e
8i8idGeGrGZbgMLo5dQrFYBGEv3ah8NVoliaS7lUBIE5EAFZnaTHyDgRcgnFYkiC
+vCr68X/ywoZs1byB+6KJYpCp8QNEba97564TZ7TNogsn3/tI4PQcy5dtNKVRfLQ
soviDa0lFgu+uZc9QLZckZWtJW6Cg5am4R9EvmigNWT9mHSW9Kk9hXOx+CWaCDlw
Wx/HYRYaDocuhxHBhBaY+iUc0b7napeW4kNG+pUROVhYLa046/cyaXDDLUd1v6Hj
KlBxNFuvNLgoqCCG5wNAFkqM2+LXxt6a/cfNw361+FKH+oWfdGnrwIdy22l7PKso
QhiM0v+SDH1po/l5YuXJFGtC4p/ycAUA3d+YQDKTHIBpIwEqBK90VAMgnQc3S/kR
0EFgnljpEKeLbIaA0HPWI34I+Wq/S8U83Ecv/DNl5/8xNuGNxRE=
=Jg9X
-----END PGP SIGNATURE-----

--Sig_/aAKq8mR.Zj_FBjo9G8rgMH.--

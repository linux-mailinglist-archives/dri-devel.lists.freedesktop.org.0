Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B43824F343
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 09:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEFCF6E1B7;
	Mon, 24 Aug 2020 07:43:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C5C66E1B5;
 Mon, 24 Aug 2020 07:43:39 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id f26so8486106ljc.8;
 Mon, 24 Aug 2020 00:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=LwplKGrJx3eQBkv1HvhogR0iGUz1klnaWD2nLVc/pI4=;
 b=IDiUiAk9BpRYOruP/JHY1bGmA7UtWlohHPDqUBNgSvKOzJ5H5w0Sod/KKKGlyRh/+d
 BYzWjWxA8vtVC8pMu0NUbO8c59a29JeYqkMq2I73f1Q7AozEPB+suBAX8fVbpVxn5QxN
 lSVf/h0bZxEcz4yYfDw0pEwtzzqAI6NcVCZjM/7FoHvRQTMdDMfPJ/1DkQ8lX0soqVek
 AWqdmfJgtTB/gNNjUVzCLfD0d/wQSiz/BNJKuVzookp9f977ig5H4BFm7BAPr4t3UTMr
 +UaDpuWuzE12rtg3uFWLTIF16UVZ7SvMhCMRhvPsYpLE3IYEgpcLvrL8pxI7A0Ra5/2I
 K/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=LwplKGrJx3eQBkv1HvhogR0iGUz1klnaWD2nLVc/pI4=;
 b=mNxV8wwUKM8vpukNsR+boT5DxX2bovjxcq6s7WITGdMtEayMU5ixPazaxuL9yGuYA4
 fMiUBedPFk5gRJBT2QH0dYbSdU9HQQ37YiNqjVMWlmAjWGMfsKGp2KK2Y9hSk35jGw3B
 NQTd7+Y7IZcDurEr9IiyKXTfq6UMJ+kS5+2V9vmCgD4t0X9LrDRP3AB8e/ggwzYkjy0+
 FCUT73HPYenZbE+m7Nok6hXSPIgmhwDOO3yh4DuAjodR5e5uspFOXnJDzlKyCGWDPXO6
 ItzYeIiH4L6lTregzlXtDZIkmdskSs5BsqRUR/mzw4bH0zY0YhfO2kMJemZBnDdogH2h
 mGKw==
X-Gm-Message-State: AOAM5314GMJrdQS0W4Bp3LGvFklpUnEqnLVmv3QQDLzt7AwJHDYSguf0
 gM+K9txUF/nlbG9/g7r+4oY=
X-Google-Smtp-Source: ABdhPJzYqVPorqe6mnw5YmSW0FCNzpD4BgyJZEcDuMQFlGlIccSXEzHKIGzsCsFBBljbVNRGkH3C1Q==
X-Received: by 2002:a2e:7210:: with SMTP id n16mr2154087ljc.262.1598255017700; 
 Mon, 24 Aug 2020 00:43:37 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id h18sm39871lfk.86.2020.08.24.00.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 00:43:37 -0700 (PDT)
Date: Mon, 24 Aug 2020 10:43:27 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Subject: Re: [PATCH] drm/amdgpu/dc: Require primary plane to be enabled
 whenever the CRTC is
Message-ID: <20200824104327.559503f7@eldfell>
In-Reply-To: <91391bb3-a855-1a29-2d2e-a31856c99946@daenzer.net>
References: <20200821165758.1106210-1-michel@daenzer.net>
 <58dc5ed0-307e-74c9-1a8b-1e998be04900@amd.com>
 <91391bb3-a855-1a29-2d2e-a31856c99946@daenzer.net>
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
Cc: Leo Li <sunpeng.li@amd.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel@daenzer.net>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1976639461=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1976639461==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/OCe4xJ9_5URsE0E98COHEyp"; protocol="application/pgp-signature"

--Sig_/OCe4xJ9_5URsE0E98COHEyp
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 22 Aug 2020 11:59:26 +0200
Michel D=C3=A4nzer <michel@daenzer.net> wrote:

> On 2020-08-21 8:07 p.m., Kazlauskas, Nicholas wrote:
> > On 2020-08-21 12:57 p.m., Michel D=C3=A4nzer wrote: =20
> >> From: Michel D=C3=A4nzer <mdaenzer@redhat.com>
> >>
> >> Don't check drm_crtc_state::active for this either, per its
> >> documentation in include/drm/drm_crtc.h:
> >>
> >> =C2=A0 * Hence drivers must not consult @active in their various
> >> =C2=A0 * &drm_mode_config_funcs.atomic_check callback to reject an ato=
mic
> >> =C2=A0 * commit.
> >>
> >> The atomic helpers disable the CRTC as needed for disabling the primary
> >> plane.
> >>
> >> This prevents at least the following problems if the primary plane gets
> >> disabled (e.g. due to destroying the FB assigned to the primary plane,
> >> as happens e.g. with mutter in Wayland mode):
> >>
> >> * Toggling CRTC active to 1 failed if the cursor plane was enabled
> >> =C2=A0=C2=A0 (e.g. via legacy DPMS property & cursor ioctl).
> >> * Enabling the cursor plane failed, e.g. via the legacy cursor ioctl. =
=20
> >=20
> > We previously had the requirement that the primary plane must be enabled
> > but some userspace expects that they can enable just the overlay plane
> > without anything else.
> >=20
> > I think the chromuiumos atomictest validates that this works as well:
> >=20
> > So is DRM going forward then with the expectation that this is wrong
> > behavior from userspace?
> >=20
> > We require at least one plane to be enabled to display a cursor, but it
> > doesn't necessarily need to be the primary. =20
>=20
> It's a "pick your poison" situation:
>=20
> 1) Currently the checks are invalid (atomic_check must not decide based
> on drm_crtc_state::active), and it's easy for legacy KMS userspace to
> accidentally hit errors trying to enable/move the cursor or switch DPMS
> off =E2=86=92 on.
>=20
> 2) Accurately rejecting only atomic states where the cursor plane is
> enabled but all other planes are off would break the KMS helper code,
> which can only deal with the "CRTC on & primary plane off is not
> allowed" case specifically.
>=20
> 3) This patch addresses 1) & 2) but may break existing atomic userspace
> which wants to enable an overlay plane while disabling the primary plane.
>=20
>=20
> I do think in principle atomic userspace is expected to handle case 3)
> and leave the primary plane enabled.

Hi,

my opinion as a userspace developer is that enabling a CRTC without a
primary plane has traditionally not worked, so userspace cannot *rely*
on it ever working. I think legacy KMS API does not even allow to
express that really, or has built-in assumptions that it doesn't work -
you can call the legacy cursor ioctls, they don't fail, but also the
CRTC remains off. Correct me if this is not true.

Atomic userspace OTOH is required to test the strange (and all!) cases
like this to see if they work or not, and carry on with a fallback if
they don't. Userspace that wants to use a CRTC without a primary plane
likely needs other CRTC properties as well, like background color.

I would guess that when two regressions conflict, the older userspace
would win. Hence legacy KMS using Mutter should keep working, while
atomic userspace is left with increased power consumption. Not using a
hardware cursor (Mutter) is much more easily an end-user visible
regression than slightly shorter battery life.

Atomic test commits are allowed to fail at any time for any reason and
something that previously worked can fail on the next frame or on the
next kernel, as far as I understand.

Sounds like the helpers you refer to are inadequate for your case.
Can't you fix the helpers in the long run and land this patch as an
immediate fix?


Thanks,
pq

--Sig_/OCe4xJ9_5URsE0E98COHEyp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl9Db58ACgkQI1/ltBGq
qqf97g//c1DTrMrYA/OP85hXeTS9zYFVXFWv+d38iBxtAGbCuMmZ4Aewa08n7Frp
ZxauVpTjF74HDma2XQ8IGDqQFRtveRbtVgxOXSU9bg9IKxPwJapVdeC69Z75ob/p
qSIZhP/i40qmVL/N+lXhzmCOOIJSCkbb8W/mOTyzmLyPWhLboO4y1QsOlxCvcJoA
kvmTB0QyT73H0LDSEtnAneL/eSp3qJ55sVDCBHXix8TCiEKaLCGjUP+tqIdjMn40
3da+qlPYk901F48/L2SzciGKo+aGWwQfFW30ekg5vndDVLX5jxpAFt8mzbYQcqlA
cxc1jkBwgD/7raEc6tT9L5wS2OJY3n0Ifw8w51Ee3QIJ2BZfrW8XHb1bw+ZCPBx3
6rVw8WVDy1fz4owrZAAd4Sn8B97qzx/E9ISbsr8lHP6kNaCgpqkoE8bmo/E/yA94
WKT0vhgekPNjTB/tWs46q6NcoL3SIV8xoyybJ8x6HS4R9TvXFDUdzWPOML387Fe0
QvExP2UEwEliivCFiJZCBlGY6/ZLs+IsYiOJpWW6q1uTf2wCnbX6RroV795KUDhp
Q0qGlbhoVkaOsgTM13Fw6XD3bcc8y+ZL7X2FwtSE8am8ZGtukOAo9/MjjbfTD5AE
0e+7IX5d9EeT21B6afOCINjoEb0kJQbfFiheCNt65gIi9ENNcqo=
=NCKp
-----END PGP SIGNATURE-----

--Sig_/OCe4xJ9_5URsE0E98COHEyp--

--===============1976639461==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1976639461==--

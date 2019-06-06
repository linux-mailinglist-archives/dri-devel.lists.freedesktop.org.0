Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DD2380FF
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 00:40:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5235E89A5C;
	Thu,  6 Jun 2019 22:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F78189A5C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 22:40:19 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id s57so139430qte.8
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 15:40:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=X04iGhDQzw+yQxS/c88O+hKoiyR84ubnTVeo0JYdCO8=;
 b=unbmp9liRqYHjJ9vnU5+khhBV5pW8G6QLjpkRXXDNl3+ssQ5OZrpPiZWklMhyNQDkI
 698AHwKDYg/I2jsJXVzBf6MgtpQQgUbj4PUXKJLHcockQtkaGZetD5VwHVqeQlaWN4nU
 7b3tY7+vvxu/fgyPBVumb7R1JJZiqCSLaIIV8s5t9MFMESGbg5whplT2mIvSRQry+Heo
 Qc5yL9p0T6T214tefpQwQ4rqdm4lgxPWT7YziCjvtsKvpF8BmraDs0IV2lJGDkMVaukv
 TJ4H/cCyR9XSgog3t8X/JaG58ziFpaQkuSCXTZAR0PR+i/+3hykyVZWQaTiBw7DDl7Kb
 zY3w==
X-Gm-Message-State: APjAAAWtTuIIFurvfnN3j7EVov9D4uyOV8afLjLUbaTEaAGI7hA2O1L2
 CxtcOqB1g7eQ0I438VRDumE=
X-Google-Smtp-Source: APXvYqxsUjIa/bzBg+ectDFHonbB3fvpMVWwMiFC9WyWojB2K3od3AKrLhj5ninduUP/gVHZ7yiAYQ==
X-Received: by 2002:a0c:ed4b:: with SMTP id v11mr40088143qvq.126.1559860818713; 
 Thu, 06 Jun 2019 15:40:18 -0700 (PDT)
Received: from smtp.gmail.com ([187.121.151.146])
 by smtp.gmail.com with ESMTPSA id c18sm105921qkm.78.2019.06.06.15.40.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 15:40:18 -0700 (PDT)
Date: Thu, 6 Jun 2019 19:40:13 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Brian Starkey <brian.starkey@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Daniel Vetter <daniel@ffwll.ch>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simon Ser <contact@emersion.fr>
Subject: [PATCH 0/2] drm/vkms: Introduces writeback support
Message-ID: <cover.1559860606.git.rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=X04iGhDQzw+yQxS/c88O+hKoiyR84ubnTVeo0JYdCO8=;
 b=AwO+LEHwNcOjItvoP+6RgLmB/qXyyEalhoWC967tTiNj9hmgsQAOnXLqpCvE/LgIrW
 7LxBC0iHC0hdkuKNSaFVfUcmFmFitowIF/tRuTvWUXcHKMUz0mLqTPm9Ss0m/SfPDNfk
 uViw3s2aPk9pKyeA4f/yRoMyaaP1q/RUikSq+4GQbL+tMyrojZGXNU4cxKqDeDThHKh5
 ah9Njc/fnFkfljlJDoZtuG8jw++nrpbDxjgFLb/Y+nDOgXBCEXVX6kPfkb9MNo3apGGN
 NHeHSg3fu8MyZaGcdMasrp20RMaYPp6VrSfzQMwB4r62AMDs4YnSYFtsoBTelMv+nqQd
 3HVg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1644089792=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1644089792==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cmukgb7fz6z6a5r7"
Content-Disposition: inline


--cmukgb7fz6z6a5r7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This patchset introduces the writeback connector to vkms. The first
patch is required for enabling the virtual encoder to be compatible with
the crtc when we have multiple encoders. The second patch adds the
required implementation to enable writeback in the vkms. With this
patchset, vkms can successfully pass all the kms_writeback tests from
IGT.

Rodrigo Siqueira (2):
  drm/vkms: Use index instead of 0 in possible crtc
  drm/vkms: Add support for writeback

 drivers/gpu/drm/vkms/Makefile         |   9 +-
 drivers/gpu/drm/vkms/vkms_crtc.c      |   5 +
 drivers/gpu/drm/vkms/vkms_drv.c       |  12 +-
 drivers/gpu/drm/vkms/vkms_drv.h       |  16 ++-
 drivers/gpu/drm/vkms/vkms_output.c    |  12 +-
 drivers/gpu/drm/vkms/vkms_plane.c     |   4 +-
 drivers/gpu/drm/vkms/vkms_writeback.c | 165 ++++++++++++++++++++++++++
 7 files changed, 214 insertions(+), 9 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_writeback.c

--=20
2.21.0

--cmukgb7fz6z6a5r7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAlz5lk0ACgkQWJzP/com
vP+dqA/9HI1pPOrEyDIDVVJXSpLTTija/8sRarCwikNphSgn/0b7lDcISbEFDYFj
qgFkYToECrof2TEd5dQbIOTEZ3CzVmtlECSmAk/2Bv3Fm47OfhRXN33m2mgKha4A
+6S1Mr5HYCF/+OsOgMQQNNEi8kqRUuan+Tf5oKlfLKuP8bCBIv0cfRgq+yvkcQRE
6qvyMCE3TS19H7Qr9EsTXUJ5Hvr5hFs/0uHfPDAZgoEqj4DXIvICFMwDhKI3txXj
ZhXxKPJn4a6wluSpDAJuuJwan9ARUlxgT3KQR4k881yg95Q/qlG+xzbq3DrsWbLQ
jogEDXKYFiqKDXTfy77Re1/28YHLRrcWOQSMlDk+4dVWBVIKPGSpHQuBIl86WGrs
Jovl9ePplJW+ltCP+KEaO9Q+9nOhE3xXVIUurLN+wREBjc/SIFlNZho/N5C6U1Mu
DIWBNlUgG8l4Gnd4yJo6q4RwqoVnexXBx+7z6IdmN7RXpKh7fJaGyUKys89uz2ZJ
n2zLhLBgwLqE0H8hRZtAa3TNui2xOFH8M3tS3qHSZLnH/dt414EC2wUQjLUX/5Ln
OWnKSXV2S8j/WS381V7L2F8JPe1fcYmtIBCW10+3y63QUQgWyYvIE6GH8yKGmb7y
V2d5ImBPgcrMlaSm+UZ45rEGG5qOfV3v/rOg4jzVjRUcbq3SOTM=
=yMZ+
-----END PGP SIGNATURE-----

--cmukgb7fz6z6a5r7--

--===============1644089792==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1644089792==--

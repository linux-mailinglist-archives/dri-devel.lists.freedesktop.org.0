Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 756E363F05
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 03:52:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 607AC89590;
	Wed, 10 Jul 2019 01:52:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F94B89590
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 01:52:10 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id d15so694968qkl.4
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2019 18:52:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=/vJaT+pqGNNv8eMpv9fAaGOGmsc6Sqo+aqF8frZ6VU4=;
 b=QKu4Yp2BQBqdGL+r1CUp9gCGd9HKi7ms8JxDH3dfJSD09Iii0ugAPW9A/xEYaqkN02
 uONb0vr8Vq5P3+Kkj+Rgf4ns32laStRny8b6MLZexEARH4RQOd2rXt1YOP06Vv7+Hio7
 3Fwb8CGuPdrBjl1lDUaFbw/Z7R3S969TWJId7TY4nZuScGbH9OkHNrzqRAyGaLcXQoZv
 imYeP1X7RPFMh/N+NuLLoyQtacJngv6nWc3Tzr2fQHGlQkvThOtjtbhtwa92T70o/cNb
 8ZNalAbbIkF9zl5RB/MrAKkb2saYwiWgj2JnAVaZSwIY36trxUjN/szlQ6PWHqMTJWwx
 qhXg==
X-Gm-Message-State: APjAAAX7ZiceFclcBSCvM5V5//VFfti+Abyl/rbgc7XWkgX7znI3cCBh
 8iAeaAcBOhJGXk+24mLBEy0=
X-Google-Smtp-Source: APXvYqzjNiMJsDIb05GsaQaXWWCIkmVWa2PyK/6tCX9e2QA8jGN+nQ7bs1D9eeOKrISYN1nQyceSwA==
X-Received: by 2002:a37:9506:: with SMTP id x6mr21748901qkd.107.1562723529657; 
 Tue, 09 Jul 2019 18:52:09 -0700 (PDT)
Received: from smtp.gmail.com ([187.121.151.22])
 by smtp.gmail.com with ESMTPSA id y16sm385418qkf.93.2019.07.09.18.52.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 18:52:09 -0700 (PDT)
Date: Tue, 9 Jul 2019 22:52:02 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 David Airlie <airlied@linux.ie>, Simon Ser <contact@emersion.fr>,
 Oleg Vasilev <oleg.vasilev@intel.com>,
 Mamta Shukla <mamtashukla555@gmail.com>,
 Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH 0/2] drm/vkms: Use alpha value for blending
Message-ID: <cover.1562695974.git.rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=/vJaT+pqGNNv8eMpv9fAaGOGmsc6Sqo+aqF8frZ6VU4=;
 b=EOI7rPcvGy/A6BcL9HiADyvraniOSlO+5sCUSl/uIvTRJhpbgfLfd3m19LO1ovXVTM
 AHWQJbQD/ZMI6HA0Kn80unoTcoA6SgNGRgjbSA2omtQkdG5Aud66/RfOygTCIU8Wi31+
 5ZB0du45nRhBRU8N21nvVcmBmkAYUeKPobUFHwJn9JzdTykK0EI3IUyaFEZolNP9ggjW
 jlOmYhhOJJ0ZE3d0+lF5d9/IdyaeIattRgY6SeHwAg6SatLYULev9sHYtum8iGOiSePx
 K9yDYElmtREqM2UkXyOQZs78lwbzwTAFSHV3YyiwImrZWR+9Blkh7Dedla8hNQxHp7vH
 +a6Q==
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
Content-Type: multipart/mixed; boundary="===============0854235445=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0854235445==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fyrleg2cbocjyu6s"
Content-Disposition: inline


--fyrleg2cbocjyu6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The first patch of this series reworks part of the blend function to
improve the readability and also for preparing it for using alpha value.
The second patch updates the blend function for applying alpha value for
a fully transparent blend. After applying this patchset,
pipe-a-cursor-alpha-transparent in kms_cursor_crc start to pass.

This patchset depends on:
https://patchwork.freedesktop.org/series/61738/

Rodrigo Siqueira (2):
  drm/vkms: Rework blend function
  drm/vkms: Use alpha channel for blending cursor with primary

 drivers/gpu/drm/vkms/vkms_composer.c | 54 ++++++++++++++++++++--------
 1 file changed, 39 insertions(+), 15 deletions(-)

--=20
2.21.0

--fyrleg2cbocjyu6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl0lRMIACgkQWJzP/com
vP8Cnw//dlryTWFCJiRp35ea2i6MuLQbjbUeV8bUyH8LN4vDgMrtNcCapfD7jWLz
QaQJj/gXz60LBLSdzwOYP738pRVGw9yP4zE58PLhMCXkyL19SvtBz+3GDdrmkBmO
UiVPFsZa44edCFFnXiZ4qS7ElN5yL3x138zCbOnS3MoLMi02TvXN8nzqWWU07omC
k89d8Uf1pU3FmmOkcRdXe9DNZhkqu6W9fERu625mPzmtn3qEZqPvSDjCcjAizn0H
pS35uLEWvENNY1W0snhbS5X7aS8yMByMKTfO0Mo8BFQ4ZUb+iDUFXTBYPdXtfYX2
mD2prwwzuWn61Z+ByOM2L8ZuPMOAH48yw2iZzOW8Lsu2NWSh4Md31pUxSE5Bsguj
JddJE8v9BYSQgs9ntKYraKPKzhi6U2vFj1mYycfPWUEc6q4piiR9sLZRC2dFjbX/
f617U17muG2kCjdUA1ypcRnrkBXCtLjT0JnRB1bhFsgSEcnwX6TUrRZvEVPRC/xH
wDS7JfWEum++tlMWL+AUn01vHNItOIjAB8LdcWhuYbRxEZa5ut3UZpky0FTUcRlV
X9ELtMP5oGjF/N8qEaJ1LiFzj1GLlfZYglD6gOlyOtKKuePnRONPvSP7ow/V14Yb
9cZKu+NDl4pRozw3cdPp0rjyb3O9wylfGaN5yelcSsEP9Yh9Oso=
=twWP
-----END PGP SIGNATURE-----

--fyrleg2cbocjyu6s--

--===============0854235445==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0854235445==--

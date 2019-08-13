Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E46F8B41C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 11:30:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3892A6E0D1;
	Tue, 13 Aug 2019 09:30:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ADAC6E0D0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 09:30:37 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id z23so837985wmf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 02:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5Y25q7PgM9CKHuEAFVYY56MJI3Hns4muOB+FOFTdHU4=;
 b=oJ7tthqPmvYUjXuTPbEA1nnp6tsAaXrhu8oYX9bWUU3I0JAZhqRl1Pg/OJXbA4JJOX
 iqClnZaLv/KWYyAUeYyZVhizP3CW7BKQEus6U/Nnpxlx+zjeIc31U24L/KovBRXWw6TI
 w/1ZoA/UP9zDMIx60l2kLKvnlQpgloF5VllV9k5oqI2iWB1JLvpz1ZKYTB+AUcciN1Y2
 AbzB9MPRimAE3EUEKBFWHu3UlNg+l9HeOo7pL4PH/6gCxSVjr2YZka8Kzkjzt9v9Xnop
 ZNPpIHPDB2eSslnAyQN1c7elJ6nAtPrL7TeeLB+AAwKXTLkohFgDKyS2LVZpyacK3coR
 2Ovw==
X-Gm-Message-State: APjAAAUqpPan4w2ieKUfz12wr0ac3y28EPGcr7PX8MN4m2bEXs8UI8uo
 RUCwnwUixISgOpY0iHaUERtZ88yt
X-Google-Smtp-Source: APXvYqy6Ja1w8IB3tE9s0COb5ILfn+T79wR6juP5bNnd58pt76m8nV4dOze2X1+s2betghj3DPz42Q==
X-Received: by 2002:a1c:7f93:: with SMTP id a141mr2035911wmd.131.1565688636431; 
 Tue, 13 Aug 2019 02:30:36 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id f12sm122444143wrg.5.2019.08.13.02.30.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 02:30:35 -0700 (PDT)
Date: Tue, 13 Aug 2019 11:30:34 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 1/4] drm/i2c/tda998x: drop use of drmP.h
Message-ID: <20190813093034.GB1137@ulmo>
References: <20190804094132.29463-1-sam@ravnborg.org>
 <20190804094132.29463-2-sam@ravnborg.org>
MIME-Version: 1.0
In-Reply-To: <20190804094132.29463-2-sam@ravnborg.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5Y25q7PgM9CKHuEAFVYY56MJI3Hns4muOB+FOFTdHU4=;
 b=j+DhxxJkGhg3Pw4t1w+WqyXf6OfzKwYODMJ0FG2UL4qRZY6Y99tSpdML3EqfQWLvWS
 ulFXigfevSnc5Bsn4SNyY/wbq5XTqyWful+axjUzqG0VAXqTFMwSneqMpiW1vz/YePfa
 70PQDks7Y/Fgeyl1ey6rhDx70nUY6yVohvLToq8pBmrsIGcKAdMMkaMktOR1ilcVkt7v
 n1RjQgyW647bBcroLLFiscJf1Euv1I8PnLQcVNpEkQ1KcEBk/FOJuEajuvKJKxdyNvgE
 Q1VSp7QA1YC+Bng7DCIU+t9yUaSq0BWEMq8cIcZZUnAsVGa5Nil225ZyFhsN2IO+CvD/
 esTg==
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>, malidp@foss.arm.com,
 linux-tegra@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0477128217=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0477128217==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GRPZ8SYKNexpdSJ7"
Content-Disposition: inline


--GRPZ8SYKNexpdSJ7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 04, 2019 at 11:41:29AM +0200, Sam Ravnborg wrote:
> Drop use of the deprecated drmP.h header file.
> Fix fallout.
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/i2c/tda998x_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--GRPZ8SYKNexpdSJ7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1SgzoACgkQ3SOs138+
s6Ednw/9EQDt0WWcZ4KD4LRH6jtkdKpX+5+8t1NaUnVHmwYUF4zhN+n9xLFaQhZ8
GnAlYAkIrouWJONNOpH3NjK388eOLn1udMs5sOZ3QkYz0IKZdg3xsUBlUXyMfNl5
9K37zwG+Jpg1eoMQIMxHImLp7tTTM2YSXFMVAVR0LOfeq44mLVVAq4yhRngLtA2c
gHTgLpHT6XXl4j2eEbTp1bwQ6mgG85j7P/avdR/sU7CYQf8QCOE3uT2NuItUcFGd
r9RDoAVLy9uP3uBzppkcYH80xHuplge6fMzB4RLCCwHwEcUYaoVoT+goxLH5xxXE
HFCv0BcSO1nPUDdXXXu4ldjdVgxmX+HnOKhdVX3EwJ3IGdyCHq1K3ArKFupUXDdW
vBWecZnlgg5DooLEOQMkydvodQrr0r++UQEGUYiAnd1O9o7QWFU7E5Yaa3hrRtAu
vGQSmjuNNRTDwd8nFI3DpAwTT70oROFN3QFOiV8xwGA0kQi5K8ySCwwnage7kF3c
qtbUMZwnwuVW93oND63nTOGdPm9OImqWVz5aoa+AsfBzDnHt4E1idZOynC6+MS/u
gFgZ99c6+qKHmOqfwqC0aYDHw2XyNiFumX70sHCxGBhdR5659TmxReChjRTGFG6X
6fK3vkbAAaSf+GKseEqYXi+j4o6e1MOs1g0y/OhcqQvd2s9v4+M=
=dhsw
-----END PGP SIGNATURE-----

--GRPZ8SYKNexpdSJ7--

--===============0477128217==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0477128217==--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C181EDFB2
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 10:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8AB6E192;
	Thu,  4 Jun 2020 08:22:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB3B66E192
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jun 2020 08:22:47 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id m18so6158788ljo.5
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jun 2020 01:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=/pZRUQwbTJyxIjfL2SLZaaCRlVPUN1E89Tgo7boEHrY=;
 b=gn2JTTevK/73GbATNCXpC8WiDu0GR/R4p9RCNBJJHKqT4hXpfs8Se96Z++XqTbDTvv
 1I68UMOFgVBIHBDuA0wxomVL9CML8c90CiQoarDdiXXIIehcqsxzrHALuyutxN3vfRGO
 Ooh772/2qY2Qs9y2pVA+K4YHHc6Phcc0JNyeZ+evo3H9JAJhROOmhuFZx/ZTZj+DSDYh
 rVeaz8/1k0Jrp1/9DHAIkBPMbCAb+UjCH7NXFqgUhfkGj59Gonq9pBF3EqKP3NI/LX7M
 UkLLuYQQQQnfdhXpeMOnLvdG8CeF+v42IUf3tuHUcTYbFu1k0RBBtbmR7qnyERxaUd+c
 8Cng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=/pZRUQwbTJyxIjfL2SLZaaCRlVPUN1E89Tgo7boEHrY=;
 b=Ofq79/RqHsQ7aeLVJamV5XB0FiDRLAoUvQXTvJDbhgy9xlCT1vyJfyYCrrq3vE0Yb+
 zuCgfC0qat2fz0CKZtLZUlIW7PhH056ST1tLGNcG/obGtmkWadWK73ogtIpxbe6Ni9fX
 PkUxjldo0vjkwwNb3OX7g7x5UCjDWkaCRDPr+mO/fAXzEYxaf8+HgXrsgGm8cpRSTO6q
 FfnMfTDmAQ0Px/h7m07rUMLCggZiz18x8pCMt07gMAUYMtzXs8AxrIZGCB0VfpzEoiou
 IVpKbr607vvbn9rat9jYkYnjmL0fSUvK15Meay1dRLuiN6Wwh8VYDLsnrZcA70Xzh0ML
 IG0Q==
X-Gm-Message-State: AOAM532QDm4no4wGr8VzfREKqovGIdvqIp7uMTBeegJOQPBLtPU6wFN/
 iqHAu0JgU7Xc4HlBRxCe6Nk=
X-Google-Smtp-Source: ABdhPJwpcV8sR/8e6TUhVrMndC2q04n2y9gia509NnYsFtk4TjSvo4KVguFBEyVdx9FhLnf8nSSCyA==
X-Received: by 2002:a2e:8246:: with SMTP id j6mr1524263ljh.54.1591258965089;
 Thu, 04 Jun 2020 01:22:45 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id k29sm1038116ljc.136.2020.06.04.01.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 01:22:44 -0700 (PDT)
Date: Thu, 4 Jun 2020 11:22:34 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Chuhong Yuan <hslester96@gmail.com>
Subject: Re: [PATCH] fbdev: geocode: Add the missed pci_disable_device() for
 gx1fb_map_video_memory()
Message-ID: <20200604112234.7d840c15@eldfell.localdomain>
In-Reply-To: <20200603092547.1424428-1-hslester96@gmail.com>
References: <20200603092547.1424428-1-hslester96@gmail.com>
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
Cc: Andrew Morton <akpm@osdl.org>, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-geode@lists.infradead.org, Andres Salomon <dilinger@queued.net>,
 David Vrabel <dvrabel@arcom.com>, Adrian Bunk <bunk@stusta.de>
Content-Type: multipart/mixed; boundary="===============0640965234=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0640965234==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/7zGwgSlxxHt_4_lufD_uPZr"; protocol="application/pgp-signature"

--Sig_/7zGwgSlxxHt_4_lufD_uPZr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed,  3 Jun 2020 17:25:47 +0800
Chuhong Yuan <hslester96@gmail.com> wrote:

> Although gx1fb_probe() has handled the failure of gx1fb_map_video_memory()
> partly, it does not call pci_disable_device() as gx1fb_map_video_memory()
> calls pci_enable_device().
> Add the missed function call to fix the bug.
>=20
> Fixes: 53eed4ec8bcd ("[PATCH] fbdev: geode updates]")
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---
>  drivers/video/fbdev/geode/gx1fb_core.c | 37 ++++++++++++++++++--------
>  1 file changed, 26 insertions(+), 11 deletions(-)

Hi,

there is a typo in the patch subject, the driver seems to be called
geode, not geocode.


Thanks,
pq

--Sig_/7zGwgSlxxHt_4_lufD_uPZr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl7Yr0sACgkQI1/ltBGq
qqfEDw/+KLMc9/wo+jXiWAnLH7DQ87u0JEDybMYKFKx6EpC9KBlSApWcagjDaiw7
Swy6OTzovGayh7moGisYDCTSsXsG0KyA3AmGbOhTDSjIyWYb+HPPAI9X10yMmwvo
ql4+Jl5NF5ClfmQl3FAQKcrsdcUiTMJCu9rUBtaZG4RhTS/IV8Ou78BymOtzHSU3
0W/IeutQWwjH3txsdthOe4O2mkJy3DCok0jxn76VsivoifPKxRbia8O7NH+UbFP6
7p164/E4mVaTIHzFfqvvPqfZrh4w5k6meQHRy+9TC5AE46vADO/L7wcrghqrj0dK
wXc6i16+04wreh1cQLK/37V3SGYLhILjvK+K/ERvr1utyGUoPu3pmf67qugwxSoj
RfxWJj3yMnba/H7rCVXUKak5DtMixvtLlgwWg9JM0k453H8Ma4+pPPnEs5LrVVuw
ANeolbROqLp7EDQ4nFSgLY3Jac2QH3uiUg/KyB+MMbA8HyTqHEyfPXoFQWFeEGdW
c+ZPkw+f7QOYDOxGMmMKiZb6Vut5lNbfpSOIsleOeMbeifx2xtDK8IKV5gSfeFlI
kueD9zp8FjwMZ4wDRYXpW+l8y3EQj1Dt0GDuw6f9K5Xo2a7s89jMY+2K+qJX9y5m
oa24nht3w0fptulkyk4NPiuZVMXe6s8fZ/Fwf5M5W/Dd6Ii/dEE=
=W7Eg
-----END PGP SIGNATURE-----

--Sig_/7zGwgSlxxHt_4_lufD_uPZr--

--===============0640965234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0640965234==--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 358351FC693
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 09:03:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F10CC6E109;
	Wed, 17 Jun 2020 07:03:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED32C6E109;
 Wed, 17 Jun 2020 07:03:12 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49mwy44sBYz9sSc;
 Wed, 17 Jun 2020 17:03:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1592377391;
 bh=GrjcWt65On8ptPVGkgLJTte3NXkx9HklLRUHmriiWTE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NH8Kf57H5XFN9+75JQ4RTRnSV80r8jFNzsf1pR+WMUsjiDDl1X9ZkGZpdJ0I2npgh
 HaTtpseUxYG26zgx6KEHKl78LqI0cm2i2Ss3c/iqh7OrtReFKRCabmkk65zd9RTZZa
 OvqSuqd/yrC9XhXjtdvZ5irrABE+tny5s6jkYnb+H4L8sFMJyHBc5CQhmv3z2AdAhw
 LG12zvroCmFPk6BZE9hQtUMb8LewkSvPUVtEGvHSRIzFW4lFooPxYpvlwWiitQbkg/
 GKxxydfLszEAycBAxz0qMyoAsCGtCDSEC5mb68qYZKK5ZmpDAt8a/2KO7/A5YMAKOQ
 nDp0wGn51DWEA==
Date: Wed, 17 Jun 2020 17:03:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20200617170307.3c87be5a@canb.auug.org.au>
In-Reply-To: <c82b9c52-d4e6-9eef-e37d-0a26ee9f1183@suse.de>
References: <20200617105929.534edd34@canb.auug.org.au>
 <c82b9c52-d4e6-9eef-e37d-0a26ee9f1183@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: multipart/mixed; boundary="===============0112682197=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0112682197==
Content-Type: multipart/signed; boundary="Sig_/CFuhTYCQOJWS.N4Fev1VXiA";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/CFuhTYCQOJWS.N4Fev1VXiA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Wed, 17 Jun 2020 08:33:24 +0200 Thomas Zimmermann <tzimmermann@suse.de> =
wrote:
>
> We recently dropped the _unlock() suffix from drm_gem_object_put(). This
> patch should be ok.

Yes, but what it shows is that the drm-misc tree is still based on
v5.7-rc1 and v5.8-rc1 has about 16000 more commits for you to get
conflicts against :-)

--=20
Cheers,
Stephen Rothwell

--Sig_/CFuhTYCQOJWS.N4Fev1VXiA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7pwCsACgkQAVBC80lX
0GxDGQf8CC2+Ktdz5dyuFmZlGHbsWC27PbUpPtzHBtyTU7lyG+622BZAGyeE5LYa
kMsFA/a6lSE5IHC5z/8C+3g+MGjsLhl85AFPR1GRxCxNK4Y5UcBfxWxhKcOhM+Pd
OcOjaSc3VRr3Dt2IG3DCdo63H5IN6xrIDPKiDzIMXlBZwaGf/33lXYap/dUsJF5U
9wZwnGFpcpxkRqUHmuJjGCDZyzGryu2qiiTSclw3ys1OpIG9WVLqD5iqoxvOsnOV
KQ6IyGoHyd+0hpSIQx7Ach0AbQ0n0bAE76F0dWCRj5ujykjWIcN5Px2aksXPvOj4
fSKxyqpYyh+B3uhof+0hQ5HMyEGH5A==
=zVg0
-----END PGP SIGNATURE-----

--Sig_/CFuhTYCQOJWS.N4Fev1VXiA--

--===============0112682197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0112682197==--

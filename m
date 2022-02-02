Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E16B04A6AB9
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 05:03:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3FA410E9A4;
	Wed,  2 Feb 2022 04:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251CE10E9A4
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 04:03:25 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JpSp115MMz4xkH;
 Wed,  2 Feb 2022 15:03:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1643774601;
 bh=fPSUE9cT5IaVsFt6OxDftNTj1uNRzbWDxReqIA1Ne/M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Jawe4pnq7tN0yJz4BBc1YGquJ24/pAaOFu28eD/K/+MPAByg0MEFeqPyBYgLtvyG8
 YSWZ94zbi3Sn2QIN0IIxX00KF8yFWxTnIVSQl2EV9rMy4ScNRyGCvv8Y+V/56AiaWn
 57jXwEbELHX25e2GMhbLNSeccSIjkrVximwfFjVP2m7UlsLtZN3LaDYgssAx4r7iHZ
 PHUuSMBBnk8hgG+jvR5Nj9JzccePz42BUlkjpXYa5K3Jm/IA+mz/rJNyzUNTVkpj5V
 pAmqeGAaULNBv0FXNpiVG4gJTRiKLpQrmF1Qqd484BEXRkzIICUvipDtK+BVVTcJ7y
 sOPcryUAplQqg==
Date: Wed, 2 Feb 2022 15:03:20 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build warning after merge of the drm tree
Message-ID: <20220202150320.3e9bdd62@canb.auug.org.au>
In-Reply-To: <20220202150201.290c7d3d@canb.auug.org.au>
References: <20220202150201.290c7d3d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qXoKYoK/5G2wYu3I20es+3L";
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Rajat Jain <rajatja@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/qXoKYoK/5G2wYu3I20es+3L
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 2 Feb 2022 15:02:01 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the drm tree, today's linux-next build (htmldocs) produced
> this warning:
>=20
> drivers/gpu/drm/drm_privacy_screen.c:X: warning: Function parameter or me=
mber 'data' not described in 'drm_privacy_screen_register'

Actually:

drivers/gpu/drm/drm_privacy_screen.c:392: warning: Function parameter or me=
mber 'data' not described in 'drm_privacy_screen_register'

--=20
Cheers,
Stephen Rothwell

--Sig_/qXoKYoK/5G2wYu3I20es+3L
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmH6AogACgkQAVBC80lX
0GxoRAf9HxTTUeh6Up+L3aae7sxok64xRTLPEKfde0esK0UxsW1JtPzrJH52uZip
hZs7TpEcPBr84zmESpAAxpr0uFABKR0KbDUOIVNfDukD7Euo9oHlv1HNFvkpl1Kx
Pz0U6H00b96RaqUoRm8ZGKzR9goGLaCsop0QcI8xm1aQ812J+nTVUZCfbmLCsvmL
X4w8q44uxpbvk+Gq9JU6BASYPj6mitE63pkk8u4kzhJ5NCqfr1C5a3KkvtBe32s2
bBAooFeqtwPqqeDD4An/BK9Y+67pJClfE8H/2woTuqLVsuz44DZ2VzlInHQA+fqf
Ouxp7R7/EFdm20z3u189duUlvrhJLw==
=VsnU
-----END PGP SIGNATURE-----

--Sig_/qXoKYoK/5G2wYu3I20es+3L--

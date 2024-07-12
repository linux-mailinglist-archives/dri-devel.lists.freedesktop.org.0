Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 648C292F402
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 04:28:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADBA910E7CB;
	Fri, 12 Jul 2024 02:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QRATs0aw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36D0B10E7CB
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 02:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1720751325;
 bh=776BhMmb21jisugPehbvK83vs4KqO37PlFEa+bKwYmU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QRATs0awvti9IbE4hdeNyKsmvZ7nPdqDpB6SYH0SQCFUwR1XWt4/3RWfVW+knaCrN
 7M8+XqYN2ZMNeRAarGigCgkCNMFTm9flvANvT8L1kzGW3YrVRvViMK0F3cx8n8QsPI
 krR67X+l72x+BYtfiPW6/j65miQsVPgfXi+cEOo7mALFAjKJc+9bq3TB6URX4MmP9Y
 FKlgUvhRqr1nHgl9KdmC4hFN31NumtZ+8Cgfk145NfXBnPME7gpl4dgvYvzNP0hjU4
 shlcp3VDRUgNfca9J4JoVqslkeXGRrZvYJPh3DfW6oFp+Xx/7h4+CJUwe0yO7ivDul
 VlVe97f2ZPb/w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WKwWc1XWlz4w2R;
 Fri, 12 Jul 2024 12:28:44 +1000 (AEST)
Date: Fri, 12 Jul 2024 12:28:43 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Ville =?UTF-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm tree
Message-ID: <20240712122843.312313a4@canb.auug.org.au>
In-Reply-To: <20240701171901.GA882812@thelio-3990X>
References: <20240701191319.087b227e@canb.auug.org.au>
 <20240701171901.GA882812@thelio-3990X>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/H/iDkLlMHsM8Mgav8Y0_chz";
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

--Sig_/H/iDkLlMHsM8Mgav8Y0_chz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 1 Jul 2024 10:19:01 -0700 Nathan Chancellor <nathan@kernel.org> wro=
te:
>
> On Mon, Jul 01, 2024 at 07:13:19PM +1000, Stephen Rothwell wrote:
> >=20
> > After merging the drm tree, today's linux-next build (powerpc
> > allyesconfig) failed like this:
> >=20
> > In file included from arch/powerpc/include/asm/mmu.h:144,
> >                  from arch/powerpc/include/asm/paca.h:18,
> >                  from arch/powerpc/include/asm/current.h:13,
> >                  from include/linux/sched.h:12,
> >                  from include/linux/ratelimit.h:6,
> >                  from include/linux/dev_printk.h:16,
> >                  from include/linux/device.h:15,
> >                  from include/linux/dma-mapping.h:8,
> >                  from drivers/gpu/drm/omapdrm/omap_gem.c:7:
> > drivers/gpu/drm/omapdrm/omap_gem.c: In function 'omap_gem_pin_tiler':
> > arch/powerpc/include/asm/page.h:25:33: error: conversion from 'long uns=
igned int' to 'u16' {aka 'short unsigned int'} changes value from '65536' t=
o '0' [-Werror=3Doverflow]
> >    25 | #define PAGE_SIZE               (ASM_CONST(1) << PAGE_SHIFT)
> >       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/omapdrm/omap_gem.c:758:42: note: in expansion of macro =
'PAGE_SIZE'
> >   758 |                                          PAGE_SIZE);
> >       |                                          ^~~~~~~~~
> > drivers/gpu/drm/omapdrm/omap_gem.c: In function 'omap_gem_init':
> > arch/powerpc/include/asm/page.h:25:33: error: conversion from 'long uns=
igned int' to 'u16' {aka 'short unsigned int'} changes value from '65536' t=
o '0' [-Werror=3Doverflow]
> >    25 | #define PAGE_SIZE               (ASM_CONST(1) << PAGE_SHIFT)
> >       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/omapdrm/omap_gem.c:1504:65: note: in expansion of macro=
 'PAGE_SIZE'
> >  1504 |                         block =3D tiler_reserve_2d(fmts[i], w, =
h, PAGE_SIZE);
> >       |                                                                =
 ^~~~~~~~~
> > cc1: all warnings being treated as errors
> >=20
> > Exposed by commit
> >=20
> >   dc6fcaaba5a5 ("drm/omap: Allow build with COMPILE_TEST=3Dy")
> >=20
> > PowerPC 64 bit uses 64k pages.
> >=20
> > I have reverted that commit for today. =20
>=20
> FWIW, I sent a patch to address this in a bit of a more targeted manner
> over a week ago:
>=20
> https://lore.kernel.org/20240620-omapdrm-restrict-compile-test-to-sub-64k=
b-page-size-v1-1-5e56de71ffca@kernel.org/
>=20
> Although somehow, I left off Ville from that patch :/

I am still reverting that commit (as of yesterday, the failure still
occurs) ...

--=20
Cheers,
Stephen Rothwell

--Sig_/H/iDkLlMHsM8Mgav8Y0_chz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaQlNsACgkQAVBC80lX
0Gy4vggAiVPl92oeXBiXBv07+6oFM8mgQZicXoV1qRz8CFGEjrhw7r15r0U+wR1P
YQFSPtg8lADO3oSBHjzm1YeCIsECq8QAi9GY4YF2bTsRgIgMnpOFAyeZoCv0uMR0
1otR5Z8ztH5nvpz7SPthIHSfh3Auf1C1ruQMgCxpUzgRjZnoP74n9Zm67wHE2edX
YscNPi+pLWdqfQwvpH/pJqGRXG8QaQSr4U9W7Np9I3oYRgNfqb3LDszjju22H9OO
h5G9dcuBckSa+dDcsdYowpLb6tVsRSQX8EQRdz6Z+CZzV8AcRdbDrhzfBVDWvYHN
BacfJ8E3KYL+sO7m1NeEBRRIXR46ng==
=15md
-----END PGP SIGNATURE-----

--Sig_/H/iDkLlMHsM8Mgav8Y0_chz--

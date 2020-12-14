Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 231DE2DA0C9
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 20:50:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D4BB6E0E8;
	Mon, 14 Dec 2020 19:50:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC8F6E0E8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 19:50:51 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CvsSl20Wlz9sSC;
 Tue, 15 Dec 2020 06:50:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1607975448;
 bh=SiM6OolBIVz1VZDedujcSYZU0SwArZpvblJttzS4JjE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oUcWc2wcSLG6vMdRDxFvulBd1QpfwBzPcm+OWiXjNzwkR1ei7aE+IAMfWabc6sPkx
 l6iBqgpVnQThJ3MxkFYpySVa/m5hK7Aoq6BksLz9KSJguTgJTWJVibqFm+gGAk/0WM
 H5TTvDoaeDhs7FT4pnGnVRzBBTGRtlrBtrc5woaG1TDdOpmdMWx36QWcHLx8++IxWB
 rSZjDYtFiJj0oocBE/svGaxEN2e4qm74nKLW4NtKnvlrvirL+lX8uBWJtMJVOgtzus
 qMo1Z8JRD/jqEDDcs746ZMl7nSP8U4m12ia+cTB46j5h5NzCOwEuLmH/c3wQ6x2H0W
 4Wz/WUNFu87Fw==
Date: Tue, 15 Dec 2020 06:50:45 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build warnings after merge of the drm tree
Message-ID: <20201215065045.66421c34@canb.auug.org.au>
In-Reply-To: <20201116104444.044486ea@canb.auug.org.au>
References: <20201105175031.00e0b081@canb.auug.org.au>
 <20201116104444.044486ea@canb.auug.org.au>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: multipart/mixed; boundary="===============1823190133=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1823190133==
Content-Type: multipart/signed; boundary="Sig_/zipSDVKtS6Y4nnGDoufGEAU";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/zipSDVKtS6Y4nnGDoufGEAU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 16 Nov 2020 10:44:44 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Thu, 5 Nov 2020 17:50:31 +1100 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > After merging the drm tree, today's linux-next build (htmldocs) produced
> > these warnings:
> >=20
> > include/linux/dma-buf-map.h:106: warning: Excess function parameter 'va=
ddr' description in 'DMA_BUF_MAP_INIT_VADDR'
> > include/linux/dma-buf-map.h:106: warning: Function parameter or member =
'vaddr_' not described in 'DMA_BUF_MAP_INIT_VADDR'
> > include/linux/dma-buf-map.h:106: warning: Excess function parameter 'va=
ddr' description in 'DMA_BUF_MAP_INIT_VADDR'
> >=20
> > Introduced by commit
> >=20
> >   20e76f1a7059 ("dma-buf: Use struct dma_buf_map in dma_buf_vunmap() in=
terfaces") =20
>=20
> I am still getting these warnings.

I am still getting these warnings.

--=20
Cheers,
Stephen Rothwell

--Sig_/zipSDVKtS6Y4nnGDoufGEAU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/XwhUACgkQAVBC80lX
0Gzr1Af/eCI35O+38wh7zrAhZRf2O0N1uLLg7rhej+NLPT0BOHDiQjnd94G0sTNG
BnWkiVmWdqh9HmZwdDsb//5jI6Vs/72GuzKJlEG4agXg/dGdBoNqOaoplIKgiDut
KxticwmdfHmCf6Mn2gnToWY192hvMEYhYjGXSbNCXlWPmBHtB1skgqG718y0GIR1
EQsxW8EWXaRxQDJdVyBiVoeZninP/3dfSupIUke6AFGTmCSeOflpS7RHcLZJsZh/
Q9iApjPyrFZB09IieWsPtoY7z9hJKh4y7qzBaXLcEr+DIFyBSq7XiYizKRdKeINv
Bm/PxL+gdu2KpJ5LJWM/KO67AmYYiA==
=8UTM
-----END PGP SIGNATURE-----

--Sig_/zipSDVKtS6Y4nnGDoufGEAU--

--===============1823190133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1823190133==--

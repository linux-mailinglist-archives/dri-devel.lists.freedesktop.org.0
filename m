Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8352DA666
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 03:47:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20A4889F2A;
	Tue, 15 Dec 2020 02:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C2D289F2A
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 02:47:11 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cw2j404Flz9s1l;
 Tue, 15 Dec 2020 13:47:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1608000428;
 bh=KZgrX3Svat5vQenpVlJt3m8LE64eIbU2SMKOm1f4eqw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mgm/IBpG59UpDk+tbrszWnNzkj94drwh7QLU0axkmc6WEPr5D6ku3bhwseNxU6nmr
 4n+VGLRdYj9N1XxfOGbVJlGB8RV5kStd0XD+y/xZ8L/LKUWjdtCwQ6YzePiaw58fja
 hTrydH0FRTrv0Vu+NnYFKZxvdcbQzp01g2LzBPR7G9YqZ3+QeXYnhTNQ7PuuLqkFx7
 WHp5Dfk9xgh0YOFGKVdp3k0MW/6RnHpMubdk/7kx6LewNsHWZFSPmpz5ohwhd2cm62
 xyNry6rdEVbdvJW4ovizoGfO2zCRdX9La/t/PXxjL7hEq1ahJbZgsgfdztbzlznn82
 JlIIqeE0K6dXg==
Date: Tue, 15 Dec 2020 13:47:02 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build warnings after merge of the drm tree
Message-ID: <20201215134702.37a12a03@canb.auug.org.au>
In-Reply-To: <20201215065045.66421c34@canb.auug.org.au>
References: <20201105175031.00e0b081@canb.auug.org.au>
 <20201116104444.044486ea@canb.auug.org.au>
 <20201215065045.66421c34@canb.auug.org.au>
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
Content-Type: multipart/mixed; boundary="===============1832297219=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1832297219==
Content-Type: multipart/signed; boundary="Sig_/6exDK=Qk6gCjsZQ=Od9rDCZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/6exDK=Qk6gCjsZQ=Od9rDCZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 15 Dec 2020 06:50:45 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Mon, 16 Nov 2020 10:44:44 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > On Thu, 5 Nov 2020 17:50:31 +1100 Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote: =20
> > >
> > > After merging the drm tree, today's linux-next build (htmldocs) produ=
ced
> > > these warnings:
> > >=20
> > > include/linux/dma-buf-map.h:106: warning: Excess function parameter '=
vaddr' description in 'DMA_BUF_MAP_INIT_VADDR'
> > > include/linux/dma-buf-map.h:106: warning: Function parameter or membe=
r 'vaddr_' not described in 'DMA_BUF_MAP_INIT_VADDR'
> > > include/linux/dma-buf-map.h:106: warning: Excess function parameter '=
vaddr' description in 'DMA_BUF_MAP_INIT_VADDR'
> > >=20
> > > Introduced by commit
> > >=20
> > >   20e76f1a7059 ("dma-buf: Use struct dma_buf_map in dma_buf_vunmap() =
interfaces")   =20
> >=20
> > I am still getting these warnings. =20
>=20
> I am still getting these warnings.

These warnings are now from Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/6exDK=Qk6gCjsZQ=Od9rDCZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/YI6YACgkQAVBC80lX
0Gzy9ggAo6DY0cMD+RSQKBQKQJibhAuPuHpnjBz2rRm5hbrs7EU5s2sq7KyWy9Ch
Qsamkx4S0lcFNQI4JkMjq4Tc3okBiPwozew7KR08sldQzJTIsaf7w/JiTWb4Llbq
wONTdWYKRwA34CusGe8QZytvLTtlKYef/xr+E4Oog3wKtO7k/QYK7+GCRXjmZMGF
NGKZgZzzV7g1zPzvPx0ekCMGi6vHb2SsWa2QLEoRFHlUeUFa8bU9TCPu1cB47lSC
NlSmdMjYT/kwsSDihlfX0sSjRUtVKS+BYNeqxDUcJlAihZxasCu7iukIUCWFbryo
tJNjx5L4z3LlTTOZHYTHL00ad2iyQg==
=+tga
-----END PGP SIGNATURE-----

--Sig_/6exDK=Qk6gCjsZQ=Od9rDCZ--

--===============1832297219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1832297219==--

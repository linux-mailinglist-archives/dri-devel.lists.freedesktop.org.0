Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5493E4415F6
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 10:18:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A59F89C6E;
	Mon,  1 Nov 2021 09:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D182489BD5;
 Mon,  1 Nov 2021 09:17:59 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HjS9v4w2Pz4xbM;
 Mon,  1 Nov 2021 20:17:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1635758276;
 bh=3PZGj0sci0bcIw2HkwJH0u3E+keMCC3880sW+RDPpLA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Sz8NDmRJfupih7wwXJd+Z+oIWl/sTJIaYi4SfEV/BOmIogtNZiLSOL0OSX/cfTk4A
 LcUra4B1MNgSrhpstI9NTJ074f+vZ5MN49AzZEIgZ5N/IK6nPq9fmBZareLVWZe888
 i/lctwsHkNXVLVQSSQb0Pt6u2QojcRa1ucVykkpsOGvPJztdKS198eFFz7X+suQ0f5
 grkcAPcNq3jvKtDMfecwfbb1y9FwlCBK8Fi2cec4GRUNv9CfPx3uKqMjsRxT0f8IlF
 tzXMJAsJpoGipTQ9l5xgOIzjs9rBxUh176JQcM1mGhGHhbEhh3ZzpPmyGuGFwVa4ZK
 Y3gIANeGopJ+w==
Date: Mon, 1 Nov 2021 20:17:54 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20211101201754.53c6c148@canb.auug.org.au>
In-Reply-To: <20211005185940.382720e7@canb.auug.org.au>
References: <20211005185940.382720e7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pPtQHmT5cGItirLOVele=Cw";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/pPtQHmT5cGItirLOVele=Cw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Tue, 5 Oct 2021 18:59:40 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Hi all,
>=20
> After merging the drm-misc tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> include/linux/dma-buf.h:456: warning: Function parameter or member 'cb_in=
' not described in 'dma_buf'
> include/linux/dma-buf.h:456: warning: Function parameter or member 'cb_ou=
t' not described in 'dma_buf'
>=20
> Introduced by commit
>=20
>   6b51b02a3a0a ("dma-buf: fix and rework dma_buf_poll v7")

This is back again as well :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/pPtQHmT5cGItirLOVele=Cw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF/sMIACgkQAVBC80lX
0GzqjAgAoHMxsBNaMEZw8e0gYsvplWSyRZUsYI9du1Og34jxHCucN+9CRgFHjflb
sBjS5ZJzVSGYeT+igTiHoq3m/kHtJP2IcxuRPDaUQCT/SVGowUwCLgL8nZAbWunc
rlB922IvJU14KTCQ8CFhptddX4LE9RwP2mHoHlmd8E6QnZBvR1Im2qWBgCtb4lWr
YdljQP8dYl/Uw1Kj/XexiLEhVX92yakc/tZuqiC4Fyy07k1IbPehqn4LG7jxfgBY
FieVWxLHqyPtpcVwWZUPhqCpxYJ6VXZJZ021HYGIr05bYfSZFrRGtZCqBATQBB2X
/Mzeq3fVoPI3L6NBsUqX/BQCEjh+qQ==
=wLoe
-----END PGP SIGNATURE-----

--Sig_/pPtQHmT5cGItirLOVele=Cw--

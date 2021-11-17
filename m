Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A02E453E93
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 03:49:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCAD789C63;
	Wed, 17 Nov 2021 02:49:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C62089C63;
 Wed, 17 Nov 2021 02:49:34 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hv6pH2JnFz4xbH;
 Wed, 17 Nov 2021 13:49:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1637117367;
 bh=6dE0/f/XWAyAwX7t19FAMH6J/SSu+5CqZOEJTvTMsFE=;
 h=Date:From:To:Cc:Subject:From;
 b=nAOc0kThOwDPLBC17cxuOoV2rkpgWfNqAgk4Ec1D+Ll4d6AP7LMe9zZa3D/xuS3aK
 u3hDzzw740bXyyuPC5mscIszWu6W/GXF5yx88gum1yp0nVyS/ftLp27S6Bts8qOE5A
 w/p20tPn9jDQaLJqo73lOt2ZfzppyLksCq6G80CkLjqcibfagqxKdOX3ILZcKXRYvH
 rRhu3+sG6jlz3X8LbwD3CaLaSJ/6bDcP9GYfNK01OlpwmI6Q9yicJg7kKgqXuTL3VJ
 HasxQ+Nc0cpWWtiSvFQcyxYZUi/tA3Ays5f7aKN3/pXBFSy2rzRZnYbvVW6/l4nEJ4
 jb7XDRFzRLgiQ==
Date: Wed, 17 Nov 2021 13:49:26 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20211117134926.1d339d71@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nGT7HMzE=uumvIefyvH.E03";
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/nGT7HMzE=uumvIefyvH.E03
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

include/drm/gpu_scheduler.h:316: warning: Function parameter or member 'wor=
k' not described in 'drm_sched_job'

Introduced by commit

  542cff7893a3 ("drm/sched: Avoid lockdep spalt on killing a processes")

--=20
Cheers,
Stephen Rothwell

--Sig_/nGT7HMzE=uumvIefyvH.E03
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGUbbYACgkQAVBC80lX
0GwxdAf8C8568o1CK6RwcuYtmAGqfiH119S/ovG0HGttngtMI3jRWzQYmFcG0kBn
6Dqa8hOZn0xP4OVwIHXqeNW1pxO5ef/99KtHIlyXlOuTv8VSdOo7blmbGWY+x43e
TDzskqsQnPTcMjoMYlmP/9Vjj663GjL+l6R35pNMvvJvR6K8WPS1HHqbkSL51hXs
kXP+KG+FyjgpY2iZ3Wv8HBGPBD8W/b8v3Ui3xcD0nqZBASY4K/01BprhNsOouMPU
VB+WDGW+ZcAaD3JzR1IV0TFnH0ro+UZchR90j7utJxNR9jj17ETdv5RRe+vd/9jT
0liW8UgnwmvZV8RmadEkyk6iYXfHPw==
=fTz5
-----END PGP SIGNATURE-----

--Sig_/nGT7HMzE=uumvIefyvH.E03--

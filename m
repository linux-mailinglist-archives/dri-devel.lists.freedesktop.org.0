Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB854422005
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 09:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF1AE6F5AD;
	Tue,  5 Oct 2021 07:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B471F6F5AB;
 Tue,  5 Oct 2021 07:59:47 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HNqk73Tmdz4xbC;
 Tue,  5 Oct 2021 18:59:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1633420785;
 bh=wfeXA7dMbbU3zv2UjIpe4e0tS5IB1hPNSHNMLRMmit0=;
 h=Date:From:To:Cc:Subject:From;
 b=uSvqMIZ9QTCXc/u82OEuuMkVqDfJreRQ0jmrC1bS2ankHyCq8l2sDdMuHU8WXr9/Q
 /iVY2/IFrCLunSKHnPjVSMLSl/lawhO78oS4l2HzRu9C0VJs0BZyoyFscVRgDKRw4B
 j1StM8W3TEQTj7J/DOHc/XfPJ2jtrS354VkKVAKdOSpMLBQxrmSq7L+FGHKPq2ZG6v
 3Vv/fuZ8Q0MWSRGrOu5YphBqQ5YdfDABUA2wSeAE59MVbd2JzNt0BgM1zBYwmkswrM
 XEHfxYEHkiW46Bu/RQLXQWIULy5nW/b3NGzwU2c6qeOLGGCO1LE5i2sjk9tH9AZnsw
 OiZIMiOyiF1Zg==
Date: Tue, 5 Oct 2021 18:59:40 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20211005185940.382720e7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DzN9LhCaJE=kJIITRXpYg2U";
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

--Sig_/DzN9LhCaJE=kJIITRXpYg2U
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

include/linux/dma-buf.h:456: warning: Function parameter or member 'cb_in' =
not described in 'dma_buf'
include/linux/dma-buf.h:456: warning: Function parameter or member 'cb_out'=
 not described in 'dma_buf'

Introduced by commit

  6b51b02a3a0a ("dma-buf: fix and rework dma_buf_poll v7")

--=20
Cheers,
Stephen Rothwell

--Sig_/DzN9LhCaJE=kJIITRXpYg2U
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFcBewACgkQAVBC80lX
0Gz87Qf/ejwjqlHJAHNP2eNsQJh+/0/HggBItJofeqDAXd9uPH2oap2ZHo85ot2P
CIn/vLl4N290pS+YVWc+D8rnWiytgb+ASFjCBVaSnIIqzN2SIMvTOHfHtTvZuGTF
owhBNWD9TkdZwJqUemERiHB3J9aHoH5RyHqhMu+drFivhTAIn/YR7suHlTuw4ogU
m1G01RjLJkkEGx23S9uFV+Dz7/zt7gYe70Y7Q3/I5xj0Od5sm4JCz/sUJjMoOMpH
UnETNYkC5tzh4ojcQz9LnoXhPIzPRuB6R+jFBD3nzCqG7zjDbAWmSbMFY9RHYfVr
+ZsCqKnBkjVOFXdQFXAltDt3piqAGQ==
=13EE
-----END PGP SIGNATURE-----

--Sig_/DzN9LhCaJE=kJIITRXpYg2U--

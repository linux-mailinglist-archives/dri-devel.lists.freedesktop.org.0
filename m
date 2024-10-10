Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E070997C25
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 07:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9463010E85A;
	Thu, 10 Oct 2024 05:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kDddgVuL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B30E10E85A;
 Thu, 10 Oct 2024 05:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1728536983;
 bh=l78YHDmJugQiujynpBuw1ZbiWPCE2LAycgeN/kNr1Wg=;
 h=Date:From:To:Cc:Subject:From;
 b=kDddgVuLjk6joM2ROVImGVtwMwqQ4RQHU2z24AZ9yL124Yt29OOZErsTwx0eNQMJo
 iw2tIzv3l+5I0F9BP57GhQw1MaLyMUw7VeJj5VCgl/taYMCDr8MQ1hVxi1PQjZyRrs
 xm1n/Xn/7ex8hYbk+AL//G6s0Ue3bqSMsgbkUASCuc3QG5IDPi3O2H5d4qmBsZXwW7
 q8L/3DzOLtZ9gQPVUtUyju/uLI62EbUV12cMTPvuQIghuGPo3iRSsS6ocqIeTQmH97
 kyi18MIlmnqDhwQvGsWYArhpqACe7K1NQyAcGPRC7EZnpSWv+v0zAjyh0cQxi6S6Sx
 w223a7ztW8JtA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XPHqp286kz4wd0;
 Thu, 10 Oct 2024 16:09:42 +1100 (AEDT)
Date: Thu, 10 Oct 2024 16:09:42 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the drm-misc tree
Message-ID: <20241010160942.192caf60@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1l8H0U29nDHzadQ1jJRBArU";
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

--Sig_/1l8H0U29nDHzadQ1jJRBArU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced these warnings:

include/drm/ttm/ttm_device.h:255: warning: Incorrect use of kernel-doc form=
at:          * @unevictable Buffer objects which are pinned or swapped and =
as such
include/drm/ttm/ttm_device.h:270: warning: Function parameter or struct mem=
ber 'unevictable' not described in 'ttm_device'

Introduced by commit

  fc5d96670eb2 ("drm/ttm: Move swapped objects off the manager's LRU list")

--=20
Cheers,
Stephen Rothwell

--Sig_/1l8H0U29nDHzadQ1jJRBArU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcHYZYACgkQAVBC80lX
0GwE9gf/Qu9AW+zSWz0YqtAUkNgZO89GNECGlKn4CkYI8sdYm2TXnsOYwlZxOpvt
Kc02dfQN7F9IDpRBFnp56st4GhYlz2bbnN8SkGTDpx0IcuP4tnRafsuVICQ1U0ah
n/lfqjG+jZiz+GuHwUwc0HWA50xf8V8QAyuG/7WepRRF6Hek89VT0VjBt1lTADlN
G7lZaqMZEG+rXZKtvLVdR4zShrJZJ3GL1M7tEIqZzk08EfWDqtoCBpViRqvMt8tt
whEhsN09QoaZFvwpQ/YX0ALhXDp1+ORlS4WDoPDiKQdLtJa12h/XVrI+lj/KIaAK
LFCaRcPHa2yuFAokv3I+kByBDRE+cA==
=A4ko
-----END PGP SIGNATURE-----

--Sig_/1l8H0U29nDHzadQ1jJRBArU--

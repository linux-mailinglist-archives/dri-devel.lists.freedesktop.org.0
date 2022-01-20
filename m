Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 215A849461A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 04:26:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 475D510E1AD;
	Thu, 20 Jan 2022 03:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EEF110E1AD;
 Thu, 20 Jan 2022 03:26:41 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JfSbg5bpkz4y3h;
 Thu, 20 Jan 2022 14:26:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1642649200;
 bh=FT3/xS+i3pKO1Rq5p3/rgHtAgCACk52OCkLLXm/hxl8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pwBctDf9UXYvLw9avbNru0hoc+QC78quF5aL0hsg6kSxqN+ScdEb6wk2Og5Wdyybj
 GCd7sqiIHpG26yRbi5V5VzDcqEpemBZ8VoYRbOhvTjyLh1AmIHTiNqRR8BQ0NmeD3x
 qhSzp3ZRBcnk08HsHtGQR4LywBcisWKnyzVL1zikdq+0ca46OAXTHWgmgdM7Erh927
 Dtz5OYoYk0fzqaHe57VAoHsoiQYShuyhjLRz4K4Ffl1+UFJcmvO6o1aTsNlhtyPlLi
 VD7SrfDoTqX+hwIA/MLqaH9xt5/BdATjT0ddAamYlc4VCyN0UzMWCA+wHJbZU4vTE2
 i8JPQjhtTCXew==
Date: Thu, 20 Jan 2022 14:26:39 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20220120142639.02c54ae9@canb.auug.org.au>
In-Reply-To: <20211117134926.1d339d71@canb.auug.org.au>
References: <20211117134926.1d339d71@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Xhb9mvR1geFap9+==HkXU1D";
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

--Sig_/Xhb9mvR1geFap9+==HkXU1D
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 17 Nov 2021 13:49:26 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> After merging the drm-misc tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> include/drm/gpu_scheduler.h:316: warning: Function parameter or member 'w=
ork' not described in 'drm_sched_job'
>=20
> Introduced by commit
>=20
>   542cff7893a3 ("drm/sched: Avoid lockdep spalt on killing a processes")

I am still seeing this warning.
--=20
Cheers,
Stephen Rothwell

--Sig_/Xhb9mvR1geFap9+==HkXU1D
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmHo1m8ACgkQAVBC80lX
0Gwe4wgAg1Avti7A8EJ2DCMxpGmXL4BjKZeX0jKKbDuPJTDrMgGR7S3duunC7waT
7QFTHTxnEwSeRt+sm8ZkofrBvLxkZg4WUCn8YkxcTU7S1H9SY/r86+zJMlPCc/xB
GyMv7oY+G1HkG7XA0Ou5FgBjTxHyqrWr9a462Fosim2CEr1klT4H+uP7DGoc/oKY
o0PKTBp0TEfd1i2RmqnlomxZlGZiiGpT6CvXJDfGX5kM8OghwpLc1YyJwANaDOC2
E2Kziy2wtE+ig2Sgr6liMEKyyb/qTRjhN4VcF8/BGB/SEkHMKsY5pywJQzk7Y8i1
gj28nDpwihp9p7PVvjawsreyD/pbVg==
=xwhi
-----END PGP SIGNATURE-----

--Sig_/Xhb9mvR1geFap9+==HkXU1D--

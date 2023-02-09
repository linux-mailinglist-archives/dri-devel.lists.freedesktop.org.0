Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D466914E0
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 00:47:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE5A10EC02;
	Thu,  9 Feb 2023 23:47:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F26BF10EC01;
 Thu,  9 Feb 2023 23:47:27 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PCYSV2bZRz4xGR;
 Fri, 10 Feb 2023 10:47:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1675986443;
 bh=qMEE4BwygN7AzVIj59Fb7AmZbm5i8MNYMLV473e3kVg=;
 h=Date:From:To:Cc:Subject:From;
 b=jIgaHve4rToJWs6vTiJUrzI1XT1u8LlcI2bbGZYR6bgOC2g+ty2pJuXjZHuF1GA+R
 70YdHf0S75jbMsgmpNdjjyrPQizY6bi8fjcOc0w1x2ze3p4yoWo8poySglqKcfLAA8
 R/5f2y0mXgni7P8MrSlgVZbOG99eVoBjtKmbBz+Yhkju59SqBxhw7NEz9I1wtn8iUY
 DRJ8wosXKJIT66naxGrHD32iHG2Zga763SzZrkHWLqsGORP1kpOza9X7KjvlSLPFJT
 js4x4uarbiNsWDPvjudady+HqwEWAkjBEheIaObAXfaNX2V6WjOmuyPCxlPDjMN5fO
 2HcaiRN2ObNZw==
Date: Fri, 10 Feb 2023 10:47:20 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@redhat.com>
Subject: linux-next: duplicate patch in the drm-misc-fixes tree
Message-ID: <20230210104720.365557d8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gVuEw7uYclxycRGjVdNl1TK";
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
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/gVuEw7uYclxycRGjVdNl1TK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the drm-fixes tree as a different commit
(but the same patch):

  94d8b6572a1f ("nvidiafb: detect the hardware support before removing cons=
ole.")

This is commit

  04119ab1a49f ("nvidiafb: detect the hardware support before removing cons=
ole.")

in the drm-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/gVuEw7uYclxycRGjVdNl1TK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmPlhggACgkQAVBC80lX
0Gw25AgAm3SO/3AKTE4jB5UPUjufb/vxFus/4tm6t3cifxuRSDURBF2T9Xe6wbnd
sSt5PXlPjIDcdUns3vS3o7etdGmeHCnCjt9DzYlAinhazAIz4imS8d8HBoySlOjO
IT8PKw4KGtcz/wWHlAgjpEQltescsUUbg0z/Ii2vFO/5o2B/+kzwEKR81gIbRnkK
ex5gi6cVwQeOA3BNb3g/zQ3W1A6faujOWqGhO69MgAq7/IfsWhEh1ePW7c+U3cY6
icaH5z1zbfkKnaSR9MgMk3Q5oLsY/tty5DHhwgfXK7nWDDU+8t/OkacvXxpdNQsi
ZZmbJj1COo6OpXTShHwIpLN+m702Sg==
=np7k
-----END PGP SIGNATURE-----

--Sig_/gVuEw7uYclxycRGjVdNl1TK--

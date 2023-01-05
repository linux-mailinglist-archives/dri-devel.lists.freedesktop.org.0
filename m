Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D4065E22B
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 02:06:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B0BA10E615;
	Thu,  5 Jan 2023 01:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6061110E615;
 Thu,  5 Jan 2023 01:06:00 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NnSvk6035z4xyY;
 Thu,  5 Jan 2023 12:05:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1672880755;
 bh=2DlQM3PNbWfEbIMdLPJ6D4XabmS9FmziJAsp7+tKym0=;
 h=Date:From:To:Cc:Subject:From;
 b=BJB94/miDJVCAXxDboH8LeueeKSYXmzU+TioGau0u/r7t13VcZ8NKevIkPlo0UMOY
 zKjVOqTQxbjk5vsznJ04cBgcXs0wldxaEqDzSWNUE6mnG7YXK7r+TWTEfephfc3ohg
 /+WofWASuah5CH1yKrgpC+u7jmdttG+3OvWpCYWnIFyLWr6414dp/cQhPXCZVlZMLN
 lsONDXcw0NXi0i2P9mqUAo7zG+Zr3RnSR8ogUAeWx3uJrBzc28qC4Tz011PI6LqQP/
 NKG62U5vwskRErK6zx7XLpx57Y4HZlrzRVy1Z4PQR5J2nHpTFUkkbyKRce9DXdulHy
 /2sWI7VM4OEsA==
Date: Thu, 5 Jan 2023 12:05:52 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: linux-next: duplicate patches in the drm tree
Message-ID: <20230105120552.77bcaceb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xAv5h+U54DYQAowicK6_TeW";
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/xAv5h+U54DYQAowicK6_TeW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits also exist in other trees in linux-next as different
commits (but the same patch):

  9f1ecfc5dcb4 ("drm/scheduler: Fix lockup in drm_sched_entity_kill()")
  4333472f8d7b ("drm/imx: ipuv3-plane: Fix overlay plane width")

They are also in the drm-misc-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/xAv5h+U54DYQAowicK6_TeW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmO2InAACgkQAVBC80lX
0GyUowf/SY5F+tn+BCckr3tc4JOkakwv9nLCwyJ2kiF1o8/gYamIvbwdGn+A6mY6
0RqS3AR2PLjRL/hoN2yFdA9VMz6eB9+xgT/IJkAny02TTvBqLueD4kCFeiht4iJQ
LLz7Y5h3Fs6x/c1DoKg4lua555DBluWWccfqm+D9nqbfbXW87yIo+5UK4xiL5jjP
tRa9GtO8X+pNZiq75C19cNso1/ZNto195rz3DM6zHk8bU56qOFxTZJeCYfUjDu7X
Aa0ApGk5tiIlUwnW4x8iTUV3jEYeWPpwNE7BtLE1ck0owgt0UySZg3kHKQWzV+PO
iF/ZP9YJittbWohjrPBOCKR6WrIvKQ==
=9W1S
-----END PGP SIGNATURE-----

--Sig_/xAv5h+U54DYQAowicK6_TeW--

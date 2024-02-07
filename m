Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF78484C4E0
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 07:17:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8757110E0A0;
	Wed,  7 Feb 2024 06:17:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YHXMuj+8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EB8410E0A0
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 06:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1707286643;
 bh=+5kUxFiHt+cxT0M9QTQ3TdwQ7dw2TdyekbfCEjGcd0E=;
 h=Date:From:To:Cc:Subject:From;
 b=YHXMuj+82gVWC8X8VuHkx+T9lrW7iTnWRBaeF5kF033t/zA4k7ULdPQoqZl1vIU0a
 Ol/MN3PAvbn9MRwWESTp8rUPwkXdA4zCLPFXRX7voBckU0Hc0RpNY94lv4MtByDBSS
 HlF/ji8rvbpweBx4IaSS8J1QhkxqpYovkN0b8sWBP7a59BWI08GJbhqtmsOKfRAvYP
 bU/BJP+rIrxutXhLlYtKo2IJmakJrI2cwqO8xWFNQ2Tfo2fw0/zdHRHaQMv3hiIrlZ
 z/nt3IrgQrtWxTRN8TYDcLnWtaxcE7kYSuQxYMv3inXy3uX2tT+oSubAQ+cBRQVr6B
 yGHV9fmn6nGdg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TV8zP3sSYz4wd0;
 Wed,  7 Feb 2024 17:17:21 +1100 (AEDT)
Date: Wed, 7 Feb 2024 17:17:19 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm tree
Message-ID: <20240207171719.7d15be34@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/da5j6.dKfOcG.XdRNIMLOqh";
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

--Sig_/da5j6.dKfOcG.XdRNIMLOqh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/gpu/rfc/index.rst:35: WARNING: toctree contains reference to =
nonexisting document 'gpu/rfc/xe'

Introduced by commit

  d11dc7aa98e5 ("drm/doc/rfc: Remove Xe's pre-merge plan")

--=20
Cheers,
Stephen Rothwell

--Sig_/da5j6.dKfOcG.XdRNIMLOqh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmXDIG8ACgkQAVBC80lX
0GxMqwf6ApAQ/EyQEaEwhpn1vOhxL6EQRcOY6FzX8R6eCFJy66+blTy4zTJEM8CU
NdJDGe9MPjgLt3/kku0mynB9WbwvEN2w05FJV1vLcCggjw+S8RuHMUu2kuUOq+gE
0kyHU9Y94Fi8sd5jMR7KN6Piu8JO1LDneugmmHgsZMkgZt6KIXGgalBIbHA1rAgD
9coRkns9hQvNlcBw4UBY/E97OFnI/vK30YlrEXU0AVuHdSDspR9FTREybd3TC+Yu
oi2sqJSPsimgtFpBO829MSLV8PHIGK17xhgO8zom/Mx2cSHuQAqEP0WW7Xu4b+sJ
LTLsLZK1iNOS0ql9l26IZSJ+ZbN3Pw==
=oHb2
-----END PGP SIGNATURE-----

--Sig_/da5j6.dKfOcG.XdRNIMLOqh--

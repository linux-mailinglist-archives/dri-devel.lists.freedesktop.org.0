Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B6D228F38
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 06:34:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D3A6E2EF;
	Wed, 22 Jul 2020 04:34:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50DCA6E2EF
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 04:34:26 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BBN0C43Ggz9sPB;
 Wed, 22 Jul 2020 14:34:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1595392463;
 bh=i51/MVwIwEu8gxnbsRmgekTqX8n4jpeFMBM4wQ17X00=;
 h=Date:From:To:Cc:Subject:From;
 b=k5jj9EB/XmHzBMdZw5QFCToCxG4wGzvv4ChcoW0lAJfTf3J2wEexfQLGoWR46mhHn
 TF94bPoNd9F2tn7BD2NfmG63NjVDV6p8PZIQsACJNwo/Sq7j3OIbFUTsfM10IWHdyu
 p7PA3GcykoaxW6jUlSGvPrLcr2k/hxFqdU6miGKptsbpM8bj6CFDBLzdtJ1MFoZezZ
 EeqPqCQk2CnO+pRT0CzRccc4m8f++itPuJNHbztpSoVFGfIT1kT74uH4Mn51q8Fr4B
 IBas/9KtGAo3B4Hf84VEBZIYtvtVhahQ0Jvb2G6H00K2vTLFi08kxGeS4bB0/k5U/4
 FZHFrtirnkrAw==
Date: Wed, 22 Jul 2020 14:34:17 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>, Dave Airlie <airlied@linux.ie>,
 DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the amdgpu tree with Linus' tree
Message-ID: <20200722143417.42b52c73@canb.auug.org.au>
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1778506857=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1778506857==
Content-Type: multipart/signed; boundary="Sig_/.GeUuTE65gktOvt/6ol=jTK";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/.GeUuTE65gktOvt/6ol=jTK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

[I can't find a previous email about this, sorry ...]

There is a semantic conflict between Linus' tree and the amdgpu tree
between commit

  d7a6634a4cfb ("drm/amdgpu/atomfirmware: fix vram_info fetching for renoir=
")

from Linus' tree and commts

  fe098a5d6443 ("drm/amdgpu/atomfirmware: fix vram_info fetching for renoir=
")
  836dab851903 ("drm/amdgpu/atomfirmware: update vram info handling for ren=
oir")

The automted git merge leaves two "case 12" labels.  I have been
reverting commit d7a6634a4cfb since July 3 ... This will need to be
fixed up when the amdgpu tree is next merged into the drm tree, or a back
merge of d7a6634a4cfb could be done into the amdgpu tree and the older
"case 12" label removed in that merge.

--=20
Cheers,
Stephen Rothwell

--Sig_/.GeUuTE65gktOvt/6ol=jTK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8XwckACgkQAVBC80lX
0GyQ7Af/ScEs0gB7A7xYNmEyiGaYbcDzKPylhe57EP8JNVAa/28+NrNsLh/rh7OO
rN9ATGH5UBEpI7tSxrycLho6Crg5KAhZjU9awhcY12ixd8XtdGicgwkbKUdYLaOe
HlQkGTFnRfymOtVuOaAFB4DYEqPMM87YydfXd3yA7Sh+PGaNW/SglGvNDqv60uUG
G1xINDcAC9w+xza++OnOQ4BIWseDEZm7AtmE/YPQH9TqHFCeLS5B8TBtTK/V3f9k
ji0o2xG/SRfJNgtHthYDZbp73r8w1Jhpr4/oXJnp71oDdRpmd6qxUEbf9lQdB9DM
gv+44T0QxpGsmk5nKIBU5PybhjqGCQ==
=ISPa
-----END PGP SIGNATURE-----

--Sig_/.GeUuTE65gktOvt/6ol=jTK--

--===============1778506857==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1778506857==--

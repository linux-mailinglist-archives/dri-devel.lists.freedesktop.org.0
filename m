Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A8572D9EE
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 08:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC73B10E203;
	Tue, 13 Jun 2023 06:29:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B6310E203
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 06:29:20 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QgJYQ4RCgz4x3x;
 Tue, 13 Jun 2023 16:29:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1686637755;
 bh=Py02oQEHgiJuRFvIYJOe9rwWsSnOjqYcTZ3o8HWrzgE=;
 h=Date:From:To:Cc:Subject:From;
 b=O3qyCkYn9jAsirqKfLqvB/9pwKj6CGn6v7UrmiWaItMEAxGt3kRg94mJEWN7wBAuy
 52tCg5bW3Gg6CyQ3PjgabVte3gBGtfGUNP4DQVb9LBbJmA3Av5VROfXmNL/oppKWX4
 hP+Y1x/fYmjwOxPcML8kq28/jxYLuy50ci/s1N+sq7z1u/l7x8lmwiFRqRKBoT/ZyD
 uu6PiMpQBCvzpF3aN+DHdXAT/jR4EiSAMXeLP6DDRLdo2wtgRSIe/NH8ZFsuxxd7gM
 74aTk2DmeIuiGgUdRvSO4lV4GXpJR4GvvyV0Cz/z1cKU3QGG7eGNkKRFcHvLmw++/4
 PzPcvoMVuwy3w==
Date: Tue, 13 Jun 2023 16:29:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build warnings after merge of the drm tree
Message-ID: <20230613162913.3830c7e2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/y7dbEaEyvtuHKCFjrvZJriT";
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
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/y7dbEaEyvtuHKCFjrvZJriT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs) produced
these warnings:

Documentation/gpu/i915:546: drivers/gpu/drm/i915/gt/uc/intel_huc.c:29: ERRO=
R: Unexpected indentation.
Documentation/gpu/i915:546: drivers/gpu/drm/i915/gt/uc/intel_huc.c:30: WARN=
ING: Block quote ends without a blank line; unexpected unindent.
Documentation/gpu/i915:546: drivers/gpu/drm/i915/gt/uc/intel_huc.c:35: WARN=
ING: Bullet list ends without a blank line; unexpected unindent.

Introduced by commit

  98d2722a85c4 ("drm/i915/huc: differentiate the 2 steps of the MTL HuC aut=
h flow")

--=20
Cheers,
Stephen Rothwell

--Sig_/y7dbEaEyvtuHKCFjrvZJriT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmSIDLkACgkQAVBC80lX
0Gy1wAgAifliGqpGNTdFEUE7VlFPwxOEge67Mb0m0nSMo6KUUPJYw3ACb+mOsTNH
JVSsIFGAycCZ78Sl0kf/Awab5quhfxqPT9hdc+mVpCVYE5FtKw1LzMkqt0ubF3d+
tDEt2OS6X6l3xKAvliWBHVoEdYxogI8fETUBnUUIrnExgFZKEKK2wp7boefXJd1T
t/x0FfUvIhar09GNEBioGnp4e4uGeNggQhzdfV2dYXCRtcPHRmyw9IxibLQW7ZE1
ptyq+HJNp/+zmwmAjz04r7bNHvE2iFlSFI+IGUYNTDrKu/1s9xznb7S/QQ83XJ30
lt4Qn+5A6AtjunMOB93RgZmHQ/eX8g==
=7zIa
-----END PGP SIGNATURE-----

--Sig_/y7dbEaEyvtuHKCFjrvZJriT--

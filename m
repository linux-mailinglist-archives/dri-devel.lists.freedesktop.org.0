Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE4CBB3D99
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 14:07:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD7A210E7C6;
	Thu,  2 Oct 2025 12:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Y490URen";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CDD10E7C6
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 12:07:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E561F450EE;
 Thu,  2 Oct 2025 12:07:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5300BC4CEF4;
 Thu,  2 Oct 2025 12:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759406876;
 bh=NLpMV/eax8dpgIsqSrgBnV/TD6rd7SE4F1q9XOgIlZM=;
 h=Date:From:To:Cc:Subject:From;
 b=Y490URenI8gRVb5PAyXEY0UVz4M4M0pY7K6xKZ2VKn4aTSqiF0/fzJqQHwefiCE+v
 99d5qzUghvcWhTzSRbHPtZnlUQI7J3/TKe8h57yI+JBId+3nuT5ECT6BWhFHIDRLDo
 Y6T0R7TdKU7axSwdtchuFsuwCS8z6RIos7uUvSP46HOdRm5gGCp2dLgtQGOHrqNE3v
 dVzpIzln4wH2jcROjdmP2XxTnAbVcec/VdK7PzPxi1eKBGmCS4ushLxXuc8E6tONiw
 KPqVimGm6+PNfab9y7hkNtBnlv5KCsFj99ij0BZCJmsX+lpA6aDqB6lSB2Y+J8WAB8
 8leWCWXeBnNSg==
Date: Thu, 2 Oct 2025 13:07:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Rob Herring <robh@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Wig Cheng <onlywig@gmail.com>
Subject: linux-next: manual merge of the drm tree with the origin tree
Message-ID: <aN5rGLMlO0tVf9YT@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="u7cYVcmGlRX3y38I"
Content-Disposition: inline
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


--u7cYVcmGlRX3y38I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  Documentation/devicetree/bindings/vendor-prefixes.yaml

between commit:

  4ed46073274a5 ("dt-bindings: vendor-prefixes: Add undocumented vendor pre=
fixes")

=66rom the origin tree and commit:

  09b26dce32f0d ("dt-bindings: vendor-prefixes: Add Mayqueen name")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc Documentation/devicetree/bindings/vendor-prefixes.yaml
index 7aa17199ea434,49a5117d2bbb0..0000000000000
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@@ -965,8 -935,8 +967,10 @@@ patternProperties
      description: Maxim Integrated Products
    "^maxlinear,.*":
      description: MaxLinear Inc.
 +  "^maxtor,.*":
 +    description: Maxtor Corporation
+   "^mayqueen,.*":
+     description: Mayqueen Technologies Ltd.
    "^mbvl,.*":
      description: Mobiveil Inc.
    "^mcube,.*":

--u7cYVcmGlRX3y38I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjeaxcACgkQJNaLcl1U
h9DDLAf/Qu2Vk2FvEuNcHBW+ogKWHrA4UUKRNqgob5XEBJXzcwwkqGrCJTEhbUMD
Ixo3728p7lVBmDPm3A2UsD5QePz9VnDBR1Rtk6uNQ0kKifO9DchJ1JM+kaLaZVU8
ssHF4j5d/t+SuwiUR9diaph8tiB6unc91hgm5zwVjnVGyI/TcTjC7vmpH/Nr9rGM
81ckegG3MZcMvoJUyNqXOXJMP+qQyohzZvR+PRy+2r5+Tu3SOs9A2PRsE6hENr7D
XZlmV5MVh7r5pEzFnxKrxvWW46DkhEaO7p4jjUwyqtJYGkyfGii2LGq7/pJzHapY
trzQlAf+MmNrqccanv9EXTxh3tO9UQ==
=mu3o
-----END PGP SIGNATURE-----

--u7cYVcmGlRX3y38I--

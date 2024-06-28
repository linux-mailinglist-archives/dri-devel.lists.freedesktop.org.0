Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 131F991C42B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 18:51:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E1A10ECBF;
	Fri, 28 Jun 2024 16:51:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JpuuV/eY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B00F10ECBE
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 16:51:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C178BCE4212;
 Fri, 28 Jun 2024 16:51:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62D31C116B1;
 Fri, 28 Jun 2024 16:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719593496;
 bh=Xx8AHRpEaxvuZ24nCW01xv/wTFnUrbCQevtmg0yUDOE=;
 h=Date:From:To:Cc:Subject:From;
 b=JpuuV/eYiclGYNAVtvJDqTrDM7x5lvbnXrdH/8BFy+8SlQMDNob5sS/Wxijl/qKPO
 FEg0YmRorYkgAnBeiCIeFc6bfUA5YnQMgCWxVNZ+Pqj/uwGoHzKYURZSY7Fh+EYkuH
 o5B0hLxONKr5r5omMZgv/Pp3i4Tp2u73N7uqUtSL7QOybpCNh//RVQzK4m0gnFfpo0
 vWSx1MVCfhnl4FW7o42JtzfalJcnrGBZFFWo+6i6ibpu1R3zZra/grUTePRlfCtkMf
 fht6WAR8o2GK2yd89Cx/1n0Bp0IZ6TQnPCGAkPRbTnZwQQIlpvz5joGHc6YZrYqNAs
 sCoDg8cgAqTxQ==
Date: Fri, 28 Jun 2024 17:51:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: linux-next: manual merge of the drm tree with the origin tree
Message-ID: <Zn7qE8rGdTMXmhK-@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7IWLkhR3deeAeUwl"
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


--7IWLkhR3deeAeUwl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/xe/xe_gt_idle.c

between commit:

  2470b141bfae2 ("drm/xe: move disable_c6 call")

=66rom the origin tree and commits:

  6800e63cf97ba ("drm/xe: move disable_c6 call")
  38e8c4184ea0e ("drm/xe: Enable Coarse Power Gating")
  ecab82af27873 ("drm/xe/vf: Don't support gtidle if VF")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.


diff --cc drivers/gpu/drm/xe/xe_gt_idle.c
index 944770fb2daff,67aba41405100..0000000000000
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c

--7IWLkhR3deeAeUwl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ+6hIACgkQJNaLcl1U
h9BZvwf+J82kZVRXzrNZjb7UKRVQsQVP8nAbDDMXpbBJsyU5tUHusr+/urAZoZAz
Ph8paEH9AykYvDGiGMZ+He+UwFYd90x5EXsvdD+v4qeFHRT33RDWPJ9HeqKO7czY
9d7UIkFw1/j4q5prRT0PrGvirif5W6JCR1SS8iIU/BG/gEUZ6wBHBFuab9YOPWsO
p4Ab6BJimKGf9xrzYBW39GkArebZTVD7QHEnP6AGSWrBmvYATBMhZ6tEUVFWvFHG
37mXZjJFjw/Jnb/bccp+8LjPOtaMs1fEEr/Fd4YQ6nW4ENQSBJOqeV9OMwaH53AP
DlTYhtWsoaGvWk/GU5kPkcSj7TaP9A==
=HPbD
-----END PGP SIGNATURE-----

--7IWLkhR3deeAeUwl--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E728035AA
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 14:56:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A290410E0A9;
	Mon,  4 Dec 2023 13:56:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17EE710E0A9
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 13:55:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 63601B80D53;
 Mon,  4 Dec 2023 13:55:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6150DC433C7;
 Mon,  4 Dec 2023 13:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701698141;
 bh=oZ4b/iYgBreW9QtS2G2hGTtITqzJeRENjPM1x97+Vlg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gRvc2Y2qS3N6yjKe7vlP3L5yLr2po7eVpY7e0mGpMce6s3ccULglLpzsbM4ikcX+5
 RhzZMsZ/AtwogdLxGXl6J0t3Bg+vwanoqyi5eX9A9KsG4+HtLlaNabL1JhBrA5eG72
 G4MVPFVTt9p16cX+p7pvu6G+57USSTk/0iHHaDvk7D9Ot0RJ/MLpdBrL8Y47EY7HhW
 gNZFELgRjwPjAkomdLOqwfPTQbC/RaLRQRU2PMvhFERzJeTt2zXCUwuhc7BIQtWCFH
 ms7a8CmF2udTmjb1MjLglzhNgGWxhIG4Ftbbr/IQLazpVzXxfLL+bPxEBLyrBV8R1N
 2/wQvm6+6GsXA==
Date: Mon, 4 Dec 2023 14:55:39 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Donald Robson <donald.robson@imgtec.com>
Subject: Re: [PATCH 1/2] drm/imagination: Removed unused functions in
 pvr_fw_trace
Message-ID: <7rwnnzsh6mlfnp5nqsxlehtc7siznebppixap7lh56kkr274jo@wtilprrqiuw4>
References: <20231204133611.53913-1-donald.robson@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ywz7mwoosg3s7mrw"
Content-Disposition: inline
In-Reply-To: <20231204133611.53913-1-donald.robson@imgtec.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 matt.coster@imgtec.com, tzimmermann@suse.de, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ywz7mwoosg3s7mrw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Dec 04, 2023 at 01:36:11PM +0000, Donald Robson wrote:
> Fixing the warning below due to an unused file level vtable. Removing
> only this causes additional warnings for the now unused functions, so
> I've removed those too.
>=20
> >> drivers/gpu/drm/imagination/pvr_fw_trace.c:205:37: warning: 'pvr_fw_tr=
ace_group_mask_fops' defined but not used [-Wunused-const-variable=3D]
>      205 | static const struct file_operations pvr_fw_trace_group_mask_fo=
ps =3D {
>          |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202311302054.MVYPxFCE-lkp@i=
ntel.com/
> Fixes: c98cc92ab6ce ("drm/imagination: Add firmware trace to debugfs")

That commit doesn't exist (upstream).

You made that mistake on the 5 patches you sent last week too but I
forgot to tell you about it. Are you working from a private branch?

Maxime

--ywz7mwoosg3s7mrw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZW3aVgAKCRDj7w1vZxhR
xSPgAP9erofg/RVkKD6Ziz2dMHCcsc0gXGrd4hdAvP82eS74UwEA373CvQO6UY9S
Ckpcx+NprA48bphjtNrUQ2gzOIhevwI=
=wEwQ
-----END PGP SIGNATURE-----

--ywz7mwoosg3s7mrw--

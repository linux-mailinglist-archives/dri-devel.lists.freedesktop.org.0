Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6008191C565
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 20:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B328810ECED;
	Fri, 28 Jun 2024 18:06:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lWVBdVMH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F5C10ECEF
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 18:06:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 23F07CE422A;
 Fri, 28 Jun 2024 18:06:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3618EC116B1;
 Fri, 28 Jun 2024 18:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719597975;
 bh=D6G5cgdXjZim32WgMxh26x4xF+2B++m4mGBohG1cWfM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lWVBdVMHaNApe4NP3aO54pCa+yOyFbbRm6jMbYLwqNPbPM8FDjV4ELdqaezOr7LJs
 dn9aYNxFc2Od47zWhJ/snAubr2ng9M3giYum2zQ9SqdWp+NCNIYC86H2O7ZmlluXNH
 Q1KU6Ldv9Az+D3vyN9Bg7f4guB8jaKXVitvR46IohYvVqAMoIcTm3RIwLiMvJEQu+h
 uJeBCpG9lsEO8ZSFvJj8Mu1a3Sd/Ym2hNHo4uZpBpnMnXa1ey3MHlKNhBxOa4ArtGg
 QYVw4Sfgz2yZbvJZIzB99s70FkVfiDJVV2RTOyo7tcl1RYrhpNjiWQWrRywasAB0Pi
 aUQzMxmMCr0PA==
Date: Fri, 28 Jun 2024 19:06:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>,
 Piotr =?iso-8859-1?Q?Pi=F3rkowski?= <piotr.piorkowski@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 buildfailureaftermergeofthedrmtree@sirena.org.uk,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm
Message-ID: <e45299d9-379e-4f28-bfdf-82927d78a15e@sirena.org.uk>
References: <Zn7s611xnutUFxR0@sirena.org.uk>
 <712046ed-2481-4644-80d7-707bbe8b5c20@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xDxHcWHH3x0pf4KO"
Content-Disposition: inline
In-Reply-To: <712046ed-2481-4644-80d7-707bbe8b5c20@intel.com>
X-Cookie: divorce, n:
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


--xDxHcWHH3x0pf4KO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 28, 2024 at 07:58:23PM +0200, Michal Wajdeczko wrote:
> On 28.06.2024 19:03, Mark Brown wrote:

> > /tmp/next/build/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c: In function 'pf_get_threshold':
> > /tmp/next/build/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:1788:27: error: unused variable 'xe' [-Werror=unused-variable]
> >  1788 |         struct xe_device *xe = gt_to_xe(gt);
> >       |                           ^~
> > cc1: all warnings being treated as errors

> >   629df234bfe73d ("drm/xe/pf: Introduce functions to configure VF thresholds")


> it must have been something else wrong, as this commit [1] does not
> contain this line, it was not part of patch itself [2] and I can't find
> any other commit related to this function on drm-tip

> but it was noticed today and some fixup was already applied [3]

The fixup claims that it was a bogus merge in drm-tip rather than the
commit above which introduced the function.

--xDxHcWHH3x0pf4KO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ++5AACgkQJNaLcl1U
h9DI8wf/Z/6rn/29mmom7wmhgOyXTuF7vg18jFMo05WnlRj+fcbQbilaRWVak7Yz
tyavZdHu6nF+ah1mmHp1blvMeiu2k4xGplS+DKKlAx5q6f6wYNrQQXbFF+p8+DUG
PXX4v1cjGjVDmzXfNf0DrOq/qyd7b54jo+HYmLasqhA06NufhHDD9dDOO9e5d+ny
aUxIAszJSd/mYH9IhMuYHp7MRiGwaOBLzjE2a77sPGRJxdlyRbibb/XzEA5mr+rz
f5pvlcaNf7mintvMlZWznUX2oXIrvGgC4iBZCbgiYxsnC1SHmqHYRykPqWGfX20k
KfeQqIDobo6u2ScThk9aQszj1bwLFg==
=YRKj
-----END PGP SIGNATURE-----

--xDxHcWHH3x0pf4KO--

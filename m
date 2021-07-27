Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA3F3D74AA
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 14:01:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B884C6E57E;
	Tue, 27 Jul 2021 12:01:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C5506E57E;
 Tue, 27 Jul 2021 12:01:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7116661A38;
 Tue, 27 Jul 2021 12:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627387292;
 bh=H6GBvjIm6gs/iLbLE96kn/VqKHUusHV0IfYP8LTdKuc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=anIocG4OWAwzmllx6ZRPVFzCiFPqZzRXWMI8tjJGgbGhWa1ObkMmscUx6T1ORakn8
 cQRKCsQ032g5Iw7F/t3V9TuBudHnysG4NPSNkG80hA0/rVy8scMpMofQIz8Gy/+/Ua
 O54CC2fWELD3+m2hETwm2vGztpZXlHMmnFgkP8CROD9PkXrvCXCKY+7jNgiB2y/li/
 4iPxXXADcVdBDq+1NANnmkO+Vj+ur/AUKXgaINkjp2Qf6juZG6aYlh4QgM87qx5v37
 Sz0OJDgOSNYPpXnm4mby2Sbl+MO2iYMhXa1rdvu71mGh0/FfxzFYr7D7RbrXzkEm3R
 ZxVaSpt4epHUg==
Date: Tue, 27 Jul 2021 13:01:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: linux-next: manual merge of the drm-misc tree with the drm-next
 tree
Message-ID: <20210727120122.GR4670@sirena.org.uk>
References: <20210727111448.1443-1-broonie@kernel.org>
 <CAKMK7uFNFOTrcLbFW3eoziPaZaH9JFKJe1AVvJGT6wU_rqfUeA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="RpDyejMaDGJhP2PU"
Content-Disposition: inline
In-Reply-To: <CAKMK7uFNFOTrcLbFW3eoziPaZaH9JFKJe1AVvJGT6wU_rqfUeA@mail.gmail.com>
X-Cookie: Vini, vidi, Linux!
User-Agent: Mutt/1.10.1 (2018-07-13)
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


--RpDyejMaDGJhP2PU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 27, 2021 at 01:41:30PM +0200, Daniel Vetter wrote:
> On Tue, Jul 27, 2021 at 1:15 PM Mark Brown <broonie@kernel.org> wrote:

> > Today's linux-next merge of the drm-misc tree got a conflict in:

> >   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h

> > between commit:

> >   ebc9ac7c3dfe ("drm/vmwgfx: Update device headers")

> > from the drm-next tree and commit:

> >   be4f77ac6884 ("drm/vmwgfx: Cleanup fifo mmio handling")

> > from the drm-misc tree.

> I got confused for a bit how we managed a conflict here because vmwgfx
> flows drm-misc.git -> drm.git -> linus. The 2nd patch is in
> drm-misc-fixes, which makes sense, not in drm-misc-next like I assumed
> at first drm-misc means.

I probably misidentified the tree when I was reporting things TBH -
there's so many DRM trees and they're constantly generating conflicts
that I sometimes rush through it a bit, especially for the simpler ones
like this.

--RpDyejMaDGJhP2PU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmD/9ZEACgkQJNaLcl1U
h9By1Af+JO44Ehk6vlvcgLV8W9uQiouHcojGdJQaD4MHuFGlDy46R3h/TuTDrb0M
nj5AC8yfcJx4joEF9hVYXQEWXP9LKut4afpJjpeSy/vpFsV1xmlHkKo8AtAO8Urb
osfKHwSQwwljQ+chkXP6v2zEX3DrzoscSXgJO/F9WqPLlXnWpTR4v3FVaiiIt2ob
FLb5367epKV1dSre54YYba4BDCz0EyOL5FpL/v3RQsQ3MUfPUqFVIMPF22fVJYTS
M2m0EKEPhFPR1Gu/mYGNKPfBXygQeIwBmg6voBj9WHoHBegcZzBe2yWzWsPe5Xh5
9VBig7YPnN3wLDpIQelbXU33OSnY4w==
=L+/4
-----END PGP SIGNATURE-----

--RpDyejMaDGJhP2PU--

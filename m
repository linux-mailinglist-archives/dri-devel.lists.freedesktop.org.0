Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 539567FD65B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 13:12:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABF4410E4EB;
	Wed, 29 Nov 2023 12:12:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1813F10E4EB
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 12:12:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 86497CE1EF1;
 Wed, 29 Nov 2023 12:12:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19CECC433C7;
 Wed, 29 Nov 2023 12:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701259962;
 bh=O90B4Q0S1Q+25NbVYezH5mjoV/3TQBVl6kKEY21UdBg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dNaZjDzlPm9hargk7WwoEBpWiULnK5zXGjWFr4jJRVNrO6rKAOnHDjrH0yNf2rRh0
 F4w1IjdcgUhsVUJ5fMAjZeouxDAP+fayP8yO0E81JSico4hHagDsGkQ1LnQXgY6liP
 r4TFuZFn4pE18UFGTkuK1pNLlcBljsIFFe6YTkfMsJi6S6hCVoxmK2+bp1s5oLgR4M
 zQlG1MWGEf/69f0YY9jMSx805g4qV86Dk2Pmg3BXngNhMA79aOQYWdzR4xfXn0Dw/R
 cl/8v/KFNMGjOpKzSYtmtoe4KC8WR/fwyXeGmXdY9UUULe4cj92mqiAROQCU24akRG
 0cEQvOaRvio6w==
Date: Wed, 29 Nov 2023 13:12:39 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Donald Robson <donald.robson@imgtec.com>
Subject: Re: [PATCH] drm/imagination: Fixed clang warnings for initial
 upstreamed patches.
Message-ID: <ewky6qzrzzh56pgrl3arkr5cvwncbonefmhdrjoxyvpaexlfbh@eyxh6p7znjis>
References: <20231129112014.137407-1-donald.robson@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lkhfry2wxo7bon2c"
Content-Disposition: inline
In-Reply-To: <20231129112014.137407-1-donald.robson@imgtec.com>
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
Cc: ndesaulniers@google.com, llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nathan@kernel.org, matt.coster@imgtec.com,
 tzimmermann@suse.de, trix@redhat.com, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--lkhfry2wxo7bon2c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Donald,

On Wed, Nov 29, 2023 at 11:20:14AM +0000, Donald Robson wrote:
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202311242159.hh8MWiAm-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202311241752.3iLyyFcA-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202311250632.giVEx7MU-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202311250226.Da2yiSKp-lkp@intel.com/
> Signed-off-by: Donald Robson <donald.robson@imgtec.com>

The expectation is that you send one patch per type of warning or bug report

Maxime

--lkhfry2wxo7bon2c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWcqtwAKCRDj7w1vZxhR
xcEjAQCmFNuRLlP8MT+UK0jKa63G5J3hYc4h5qVuaAmTQju1uAEAqENb8fcwuHG7
PKDe5N+lmxJDWQH3VgZ0nUTrlN5J4wk=
=pnBq
-----END PGP SIGNATURE-----

--lkhfry2wxo7bon2c--

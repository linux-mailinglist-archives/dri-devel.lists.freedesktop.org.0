Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C85CA758F2E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 09:37:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCF2A10E071;
	Wed, 19 Jul 2023 07:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0204310E071
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 07:37:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4FCC260B45;
 Wed, 19 Jul 2023 07:37:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 447FAC433C8;
 Wed, 19 Jul 2023 07:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689752220;
 bh=2bZkptLEVnv1enX4bZBWQqqQlJRS0/+8nbD5gNdGN+I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=flXBR/Zbv4jbsYeEvOmrKv04u8tWeuTAtRSzmroJ1p0dQd3/lMa/d2Mgdtz1nhWDQ
 aHvh6oU8rdfaUxP5+FZ1XqBx7bDfH4CWcLiF/7WJtJXZNFK8IiWpeGMp63vH4cWJju
 A4aKaA0FjNHrCTEw+2/0nR2mbsjFWPUxj5PfLm5CU9fQTub6xFz6M/PUt6WxXhtkBi
 UtgwoTf1y/jnOEe8kFMRdZG25Krovbj6fIW11HEWR5Uw114b+be2/8jOtzIYCiku6E
 I2NPteKNveCrii+JxkDJCopRtUL5MVn2ZWV6ApWHTPdbw9IVl9yr8sfDOjU8OkPjRX
 Vv3enEsfmll2g==
Date: Wed, 19 Jul 2023 09:36:57 +0200
From: Maxime Ripard <mripard@kernel.org>
To: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 2/4] drm/tests: Add test for
 drm_framebuffer_check_src_coords()
Message-ID: <wstx2kkfgszzekdqtem6dqnffkmlmwbj3mbdwfvxsfpjiet5wk@kilzqzv4qi6i>
References: <20230718181726.3799-3-gcarlos@disroot.org>
 <202307191411.kDvvppjm-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dwv7arpteb5tco73"
Content-Disposition: inline
In-Reply-To: <202307191411.kDvvppjm-lkp@intel.com>
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
Cc: andrealmeid@igalia.com, davidgow@google.com, tales.aparecida@gmail.com,
 Carlos Eduardo Gallo Filho <gcarlos@disroot.org>,
 dri-devel@lists.freedesktop.org, mairacanal@riseup.net, tzimmermann@suse.de,
 oe-kbuild-all@lists.linux.dev, michal.winiarski@intel.com,
 arthurgrillo@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--dwv7arpteb5tco73
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 19, 2023 at 02:50:16PM +0800, kernel test robot wrote:
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>=20
> >> ERROR: modpost: "drm_framebuffer_check_src_coords" [drivers/gpu/drm/te=
sts/drm_framebuffer_test.ko] undefined!

Yeah, drm_framebuffer_check_src_coords isn't exported to modules. This
wasn't an issue before because it was only used by the core KMS which is
always compiled in the same module, but your new tests are in another
module :)

Maxime

--dwv7arpteb5tco73
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZLeSmQAKCRDj7w1vZxhR
xSPWAQCBX9ffEDqNdVaawfeNXe/Z+ngNk1/TzHT27TCwB/477AD7BM5ynasERxOZ
dX+iv5HSrU0gkfKbFezCwMfJSfOscwk=
=8QJM
-----END PGP SIGNATURE-----

--dwv7arpteb5tco73--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ME3Er6BoGn/kQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 18:24:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B9B1AC4E6
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 18:24:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F6D10E9E5;
	Thu, 26 Feb 2026 17:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="geRMJH4v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D316B10E9C6
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 17:24:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0F77C60126;
 Thu, 26 Feb 2026 17:24:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AB83C116C6;
 Thu, 26 Feb 2026 17:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772126647;
 bh=gVAAjRcQAjRSBaF01wgeZ5pNjreL24h9dyvOoYgQepY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=geRMJH4vt65LMkwIkDumtxaFQO7RbV15iknk9dGcMFtNOnONFQD4OUbKcIfBo6wTq
 0fNvGR5byMGB4ajj9+4lSqnmqlXpg8aCZzXy+27ZSRzYvT2FPD7WL+Mx7rz0b1XO3K
 j3z+52j/GcHOnUyWlREiHkDHNoYvjmX5vhk8EGVzTHr/SsmXfpq3LuknXTlyCp5aOe
 MOaMuasHEbXWcpisaA4weknwCKgX/eUjwqGVnO9D/QefVKUOrDdc1D+QtQG6fkPcu6
 DFk1KbKmAVEury3Mtt+ZHdF+cQMuyIsKoh49BVy/MaRYgj6BdZaz4HsOr3hdn/lBnE
 ozXkgYdSo/uBQ==
Date: Thu, 26 Feb 2026 17:24:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Matt Coster <matt.coster@imgtec.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Frank Binns <frank.binns@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/imagination: Use dev_pm_domain_attach_list()
Message-ID: <c353fdef-9ccd-4a11-a527-ab4a792d8e70@sirena.org.uk>
References: <20260123-pm-domain-attach-list-v1-1-d51dd7e43253@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2DXd2cXC1a8pyR7L"
Content-Disposition: inline
In-Reply-To: <20260123-pm-domain-attach-list-v1-1-d51dd7e43253@imgtec.com>
X-Cookie: I am NOT a nut....
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS(0.00)[m:matt.coster@imgtec.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:geert@linux-m68k.org,m:frank.binns@imgtec.com,m:brajesh.gupta@imgtec.com,m:alessio.belle@imgtec.com,m:alexandru.dadu@imgtec.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[broonie@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linux-m68k.org,imgtec.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 98B9B1AC4E6
X-Rspamd-Action: no action


--2DXd2cXC1a8pyR7L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2026 at 02:44:50PM +0000, Matt Coster wrote:
> This helper handles the attaching and linking of the entire list of power
> domains. Besides making pvr_power_domains_init() simpler, this also lays
> the groundwork to simplify supporting the varied power domain names used =
in
> Volcanic GPU cores.

I'm seeing oopses in -next on at least k3-am625-verdin-wifi-mallow which
bisect to this patch.  We get:

[   10.820056] powervr fd00000.gpu: Direct firmware load for powervr/rogue_=
33.15.11.3_v1.fw failed with error -2
[   10.831903] powervr fd00000.gpu: [drm] *ERROR* failed to load firmware p=
owervr/rogue_33.15.11.3_v1.fw (err=3D-2)
=2E..
[   10.844023] Unable to handle kernel NULL pointer dereference at virtual =
address 0000000000000018
=2E..
[   11.090162] Call trace:
[   11.092600]  pvr_power_domains_fini+0x18/0xa0 [powervr] (P)
[   11.098218]  pvr_probe+0x100/0x14c [powervr]
[   11.102505]  platform_probe+0x5c/0xa4

which does seem relevant to the changed code.

Full log:

   https://lava.sirena.org.uk/scheduler/job/2499326#L865

bisect log (with links to additional runtime logs):

# bad: [7d6661873f6b54c75195780a40d66bad3d482d8f] Add linux-next specific f=
iles for 20260226
# good: [d20332bddd695a63efdf0415f752bd25f4c69d9d] Merge branch 'for-linux-=
next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
# good: [5c74a008ffc62fc57a041602b4517519c8bf9436] firmware: cs_dsp: Mark K=
Unit test suites KUNIT_SPEED_SLOW
# good: [260c3fff1fefc570d8f23e87953e181d7d248861] ASoC: cs-amp-lib-test: S=
top including platform_device.h
# good: [ada32396f90951e12465224c04742607ca56a982] ASoC: SDCA: Add CS47L47 =
to class driver
# good: [bfd7db781e2e7a99b086d645a104d16e368f58ff] regulator: Kconfig: fix =
a typo
# good: [e02902dd493bf9c9b05353c761737ac514ad7a5c] spi: add devm_spi_new_an=
cillary_device()
# good: [7c12f6ead4672cb08b74e6f6115eb04dca8ccfa4] spi: tegra210-quad: Add =
runtime autosuspend support
# good: [37983fad7f3ef296fa0504c8e945987459dc5487] regmap: define cleanup h=
elper for regmap_field
# good: [507a071d9868cb60e4e76f8a06fc8eb014f59ae4] spi: pxa2xx: use min() i=
nstead of min_t()
# good: [5ebc20921b7fff9feb44de465448e17a382c9965] ASoC: tas2552: Allow aud=
io enable GPIO to sleep
# good: [fed6e5084894373d76270cad4a32eb6479ad8247] spi: atcspi200: Remove r=
edundant assignment to .owner
# good: [fbb4c52ccdcb4a612d2b7f800aa57090eeee16d7] regulator: spacemit-p1: =
Update supply names
# good: [d075cef4af6327a5de4bee7bf77591e3201e54f4] ASoC: simple-card-utils:=
 add sysclk ordering support
# good: [78dfbd4ad0be9f51de7b9a19388809254aeccd26] ASoC: Add quirk for Leco=
o Bellator N176
# good: [0556bb42a84ee391a2145ddba86756f9747bc27f] regulator: pf0900: Make =
regu_irqs variable static const
# good: [c2bcf62ca75c541ec4297e6ff02a68ddc2e02029] regcache: Split regcache=
_count_cacheable_registers() helper
# good: [171b3663f33e1efdc97f5112f49be10b47b20fa8] ASoC: codecs: aw88261: A=
dd firmware-name support
# good: [bf122191473e26a8f195308b1ba924c98424c8e1] ASoC: rt5677-spi: Add SP=
I device ID matching table
# good: [6d438685340df6ac8570326aaa51c3603a2fe25c] drm/fbdev-emulation: Rem=
ove empty placeholders
# good: [55473b60178060a4fdb4631bd0c91879cc7d18d8] drm/fbdev-emulation: Rem=
ove support for legacy emulation
# good: [cff3f89ffbdd4b6c43a117c01aaf5b290ff80803] drm/bridge: analogix_dp:=
 Move &drm_bridge_funcs.mode_set to &drm_bridge_funcs.atomic_enable
# good: [779ec12c85c9e4547519e3903a371a3b26a289de] drm/komeda: fix integer =
overflow in AFBC framebuffer size check
git bisect start '7d6661873f6b54c75195780a40d66bad3d482d8f' 'd20332bddd695a=
63efdf0415f752bd25f4c69d9d' '5c74a008ffc62fc57a041602b4517519c8bf9436' '260=
c3fff1fefc570d8f23e87953e181d7d248861' 'ada32396f90951e12465224c04742607ca5=
6a982' 'bfd7db781e2e7a99b086d645a104d16e368f58ff' 'e02902dd493bf9c9b05353c7=
61737ac514ad7a5c' '7c12f6ead4672cb08b74e6f6115eb04dca8ccfa4' '37983fad7f3ef=
296fa0504c8e945987459dc5487' '507a071d9868cb60e4e76f8a06fc8eb014f59ae4' '5e=
bc20921b7fff9feb44de465448e17a382c9965' 'fed6e5084894373d76270cad4a32eb6479=
ad8247' 'fbb4c52ccdcb4a612d2b7f800aa57090eeee16d7' 'd075cef4af6327a5de4bee7=
bf77591e3201e54f4' '78dfbd4ad0be9f51de7b9a19388809254aeccd26' '0556bb42a84e=
e391a2145ddba86756f9747bc27f' 'c2bcf62ca75c541ec4297e6ff02a68ddc2e02029' '1=
71b3663f33e1efdc97f5112f49be10b47b20fa8' 'bf122191473e26a8f195308b1ba924c98=
424c8e1' '6d438685340df6ac8570326aaa51c3603a2fe25c' '55473b60178060a4fdb463=
1bd0c91879cc7d18d8' 'cff3f89ffbdd4b6c43a117c01aaf5b290ff80803' '779ec12c85c=
9e4547519e3903a371a3b26a289de'
# test job: [5c74a008ffc62fc57a041602b4517519c8bf9436] https://lava.sirena.=
org.uk/scheduler/job/2496408
# test job: [260c3fff1fefc570d8f23e87953e181d7d248861] https://lava.sirena.=
org.uk/scheduler/job/2494139
# test job: [ada32396f90951e12465224c04742607ca56a982] https://lava.sirena.=
org.uk/scheduler/job/2489104
# test job: [bfd7db781e2e7a99b086d645a104d16e368f58ff] https://lava.sirena.=
org.uk/scheduler/job/2489537
# test job: [e02902dd493bf9c9b05353c761737ac514ad7a5c] https://lava.sirena.=
org.uk/scheduler/job/2489681
# test job: [7c12f6ead4672cb08b74e6f6115eb04dca8ccfa4] https://lava.sirena.=
org.uk/scheduler/job/2488641
# test job: [37983fad7f3ef296fa0504c8e945987459dc5487] https://lava.sirena.=
org.uk/scheduler/job/2489206
# test job: [507a071d9868cb60e4e76f8a06fc8eb014f59ae4] https://lava.sirena.=
org.uk/scheduler/job/2486373
# test job: [5ebc20921b7fff9feb44de465448e17a382c9965] https://lava.sirena.=
org.uk/scheduler/job/2485120
# test job: [fed6e5084894373d76270cad4a32eb6479ad8247] https://lava.sirena.=
org.uk/scheduler/job/2484679
# test job: [fbb4c52ccdcb4a612d2b7f800aa57090eeee16d7] https://lava.sirena.=
org.uk/scheduler/job/2482458
# test job: [d075cef4af6327a5de4bee7bf77591e3201e54f4] https://lava.sirena.=
org.uk/scheduler/job/2483472
# test job: [78dfbd4ad0be9f51de7b9a19388809254aeccd26] https://lava.sirena.=
org.uk/scheduler/job/2483100
# test job: [0556bb42a84ee391a2145ddba86756f9747bc27f] https://lava.sirena.=
org.uk/scheduler/job/2483206
# test job: [c2bcf62ca75c541ec4297e6ff02a68ddc2e02029] https://lava.sirena.=
org.uk/scheduler/job/2483259
# test job: [171b3663f33e1efdc97f5112f49be10b47b20fa8] https://lava.sirena.=
org.uk/scheduler/job/2482602
# test job: [bf122191473e26a8f195308b1ba924c98424c8e1] https://lava.sirena.=
org.uk/scheduler/job/2482819
# test job: [6d438685340df6ac8570326aaa51c3603a2fe25c] https://lava.sirena.=
org.uk/scheduler/job/2498159
# test job: [55473b60178060a4fdb4631bd0c91879cc7d18d8] https://lava.sirena.=
org.uk/scheduler/job/2498392
# test job: [cff3f89ffbdd4b6c43a117c01aaf5b290ff80803] https://lava.sirena.=
org.uk/scheduler/job/2497735
# test job: [779ec12c85c9e4547519e3903a371a3b26a289de] https://lava.sirena.=
org.uk/scheduler/job/2498023
# test job: [7d6661873f6b54c75195780a40d66bad3d482d8f] https://lava.sirena.=
org.uk/scheduler/job/2499326
# bad: [7d6661873f6b54c75195780a40d66bad3d482d8f] Add linux-next specific f=
iles for 20260226
git bisect bad 7d6661873f6b54c75195780a40d66bad3d482d8f
# test job: [fe0b1b8269eba268a7dee293b32d6c008a6c3fec] https://lava.sirena.=
org.uk/scheduler/job/2497668
# bad: [fe0b1b8269eba268a7dee293b32d6c008a6c3fec] drm/mcde: dsi: mcde_dsi_b=
ind: break when a panel or bridge is found
git bisect bad fe0b1b8269eba268a7dee293b32d6c008a6c3fec
# test job: [3c2d28f4a67af7ada8f3332270b0d349967e6aa1] https://lava.sirena.=
org.uk/scheduler/job/2497695
# bad: [3c2d28f4a67af7ada8f3332270b0d349967e6aa1] drm/colorop: Use destroy =
callback for color pipeline teardown
git bisect bad 3c2d28f4a67af7ada8f3332270b0d349967e6aa1
# test job: [e19cc5ab347e3cdcc21c97ea5d11af8da7f1358d] https://lava.sirena.=
org.uk/scheduler/job/2498321
# bad: [e19cc5ab347e3cdcc21c97ea5d11af8da7f1358d] drm/imagination: Use dev_=
pm_domain_attach_list()
git bisect bad e19cc5ab347e3cdcc21c97ea5d11af8da7f1358d
# first bad commit: [e19cc5ab347e3cdcc21c97ea5d11af8da7f1358d] drm/imaginat=
ion: Use dev_pm_domain_attach_list()
# test job: [f81455b2d3327a5685623e7db4050dbbe5513bc3] https://lava.sirena.=
org.uk/scheduler/job/2497837
# bad: [f81455b2d3327a5685623e7db4050dbbe5513bc3] drm: bridge: anx7625: imp=
lement minimal Type-C support
git bisect bad f81455b2d3327a5685623e7db4050dbbe5513bc3
# test job: [1d7532444a32b53ff7344dc52019bab5a4b5ed66] https://lava.sirena.=
org.uk/scheduler/job/2499703
# bad: [1d7532444a32b53ff7344dc52019bab5a4b5ed66] dt-bindings: drm/bridge: =
anx7625: describe Type-C connector
git bisect bad 1d7532444a32b53ff7344dc52019bab5a4b5ed66
# test job: [e19cc5ab347e3cdcc21c97ea5d11af8da7f1358d] https://lava.sirena.=
org.uk/scheduler/job/2498321
# bad: [e19cc5ab347e3cdcc21c97ea5d11af8da7f1358d] drm/imagination: Use dev_=
pm_domain_attach_list()
git bisect bad e19cc5ab347e3cdcc21c97ea5d11af8da7f1358d
# first bad commit: [e19cc5ab347e3cdcc21c97ea5d11af8da7f1358d] drm/imaginat=
ion: Use dev_pm_domain_attach_list()

--2DXd2cXC1a8pyR7L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmggbEACgkQJNaLcl1U
h9BKkgf5ARRRKtAAzmnedQstlsuqg50s6q4MbukMn8OXpqbX2qengSAiLMnu9JPW
XTmXCr7SNCeNbsoN/VAiyaU/BvP0i2/XPf72wGqyBePUyMuKWUVbHUM5/G+cuj5r
+bUuVvgSx1WKKBfhlg/LcTiebXwu79NsSDAV60Ed/wdfZ6pZvyR8X1PwhGgToh+h
ABCGk4ooahunFg1uR66jteuaCtxKeTg+n1BzI/G9vA9dUYVf37M/IF4KqwKgQuPy
VSYnIlnY6F0Xu0LFZoBMXrX7ONjX5SzCy/VLooO3HtmsAM3ge7j6RSrRwzhlA64I
EO8UF15QnaV8imgbs2aB4N+ojRvUUQ==
=t1Vq
-----END PGP SIGNATURE-----

--2DXd2cXC1a8pyR7L--

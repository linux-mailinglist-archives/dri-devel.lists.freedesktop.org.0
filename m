Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD02C6D8EB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 10:02:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC3410E356;
	Wed, 19 Nov 2025 09:02:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tYi6Gkpz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0EA310E235
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 09:02:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 80D3C43DF7;
 Wed, 19 Nov 2025 09:02:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7628BC19423;
 Wed, 19 Nov 2025 09:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763542948;
 bh=x3Erefu0LLIavVKjiZTP0JB8l64h9R/5ClLSpQhbGmg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tYi6GkpzCeYDh1M9Oj5ex3zEIevjErNC1YfGJLc6QV17ffViR+uyBJv4WhyhL1Ghs
 ijKO4fg1Rho4FimCnwioQOTW3dZvg8qpr+wxiE7NCq67T3bMXW6WumkeQB1maoZJCP
 7yRCL/r8EhpwkKH0DQouhgmvv6BeLq5cNb8sV/SkXWa6PsqIp1Rw2g/d4cCGuZ/G+C
 hjwREyoGufMmZuG5BvWDQwJUOzPCusnaM/gosnQvo2d2f/ltz7eYTNmQY8nktDr0Xf
 CJQ33lM8XvrPP14dguRvy3IR8cJmufPXAFotYGhqyQwtg3Xp2/bJcCO7mmtWhLCSYp
 TvfsxOd3OhalA==
Date: Wed, 19 Nov 2025 10:02:23 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Chris Morgan <macromorgan@hotmail.com>
Cc: Chris Morgan <macroalpha82@gmail.com>, 
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, 
 rfoss@kernel.org, tzimmermann@suse.de, jonas@kwiboo.se,
 neil.armstrong@linaro.org, 
 heiko@sntech.de, sebastian.reichel@collabora.com, jernej.skrabec@gmail.com, 
 dri-devel@lists.freedesktop.org, andrzej.hajda@intel.com,
 andy.yan@rock-chips.com, 
 krzk+dt@kernel.org, robh@kernel.org, Laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v2 2/3] drm/bridge: dw-hdmi-qp: Add support for missing HPD
Message-ID: <hgwfztkwk4qgvefwo2cdedzas3rzlhx6yek6dgldkgaq2jskvw@exxqujjpa6bl>
References: <20251113192939.30031-1-macroalpha82@gmail.com>
 <20251113192939.30031-3-macroalpha82@gmail.com>
 <avdnpwnxs6cql7eyckdt37szpcf5ztgxlc7juwu6tqj5xxu56a@nrwljig2p67i>
 <SN6PR1901MB46548ED8D4BA1184E0EA7DC3A5D6A@SN6PR1901MB4654.namprd19.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="wdbqem6hd3bixddf"
Content-Disposition: inline
In-Reply-To: <SN6PR1901MB46548ED8D4BA1184E0EA7DC3A5D6A@SN6PR1901MB4654.namprd19.prod.outlook.com>
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


--wdbqem6hd3bixddf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/3] drm/bridge: dw-hdmi-qp: Add support for missing
 HPD
MIME-Version: 1.0

On Tue, Nov 18, 2025 at 02:36:09PM -0600, Chris Morgan wrote:
> On Tue, Nov 18, 2025 at 09:46:04AM +0100, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Thu, Nov 13, 2025 at 01:29:38PM -0600, Chris Morgan wrote:
> > > From: Chris Morgan <macromorgan@hotmail.com>
> > >=20
> > > Add support for the dw-hdmi-qp driver to handle devices with missing
> > > HPD pins.
> > >=20
> > > Since in this situation we are now polling for the EDID data via i2c
> > > change the error message to a debug message when we are unable to
> > > complete an i2c read, as a disconnected device would otherwise fill
> > > dmesg with i2c read errors.
> > >=20
> > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> >=20
> > You must also disable any mode using the scrambler when there's no
> > hotplug interrupt available.
>=20
> Is there a simple way to do that? I'm not seeing any references to
> scrambling in the current driver.
>=20
> Should I just limit the rate to HDMI14_MAX_TMDSCLK (340000000)  under
> dw_hdmi_qp_bridge_tmds_char_rate_valid() if using EDID polling? A
> document I found online from Synopsys [1] claims that scrambling is
> used by default at rates above 340 (if I'm reading it right) and used
> opportunistically at rates below 340.

Yep, that's what you should be testing for :)

Maxime

--wdbqem6hd3bixddf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaR2HnwAKCRAnX84Zoj2+
dl1hAX91CWnkZWqyujHg7Ra5UTVcO8/PTCDzBEBf9nV+OEkHsOhQhwSIeC+T7Vb6
M3s4gOgBewQnAe2ln3VIklSXwTyJhAuBujf/VUAbPACBFrFB6rc7YGTmq0PLYpG8
mB6GUJvyAA==
=P/8l
-----END PGP SIGNATURE-----

--wdbqem6hd3bixddf--

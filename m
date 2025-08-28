Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D94B39622
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 10:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B68A810E1BD;
	Thu, 28 Aug 2025 08:05:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gMnagQH3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B154010E1BD
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 08:05:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CD1C54027B;
 Thu, 28 Aug 2025 08:05:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37569C4CEEB;
 Thu, 28 Aug 2025 08:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756368331;
 bh=Szqu3ISPHcSpDClnU/NQVEOhbXjcDa2CwfQfHM2oTVQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gMnagQH3MSE3OCmKYpRsd8lUsxpc8Ung8Xj9N13IShaXG1JpVQ17BGz/vZbJ8ayia
 JATXdShQIFwJtWM16pujBqztN/HTAHa1eI1ruO392vGQ5bcnBpM/XVuQPAhLb+epfg
 l+vq7JbmIEiI0o7x/Jv6L4M7n+VVeNbukGTI3/GpD9kQYUwecJAhxnypY82JF2OpgN
 OpDKH2Xbm6L24Rh++PCS5s0FIDKVW188ch6qzc0yfxjVB+EvXvlGjVysaI9/dnMl9w
 EBrj1g+TwpS5VfAtcAXeVX4ofcMrlcOTM6deJOEiGJCGib96kXayOKOspPBjlGlk7s
 hAB3OigOpxutA==
Date: Thu, 28 Aug 2025 10:05:28 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Andy Yan <andyshrk@163.com>, heiko@sntech.de, hjc@rock-chips.com,
 naoki@radxa.com, 
 stephen@radxa.com, cristian.ciocaltea@collabora.com, neil.armstrong@linaro.org,
 Laurent.pinchart@ideasonboard.com, yubing.zhang@rock-chips.com,
 krzk+dt@kernel.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 
 robh@kernel.org, sebastian.reichel@collabora.com, 
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v7 00/10] Add support for RK3588 DisplayPort Controller
Message-ID: <20250828-tangible-wakeful-coati-ec27d1@houat>
References: <20250822063959.692098-1-andyshrk@163.com>
 <bochli5u37mhc6eup7h2oz3yeignofbbj4k5nrvm2k7zf6f4ov@t2sje4gmveqa>
 <d040da3e-501f-45d8-bcbb-95fa77e94a59@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ymx6junihpockhkm"
Content-Disposition: inline
In-Reply-To: <d040da3e-501f-45d8-bcbb-95fa77e94a59@suse.de>
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


--ymx6junihpockhkm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 00/10] Add support for RK3588 DisplayPort Controller
MIME-Version: 1.0

On Thu, Aug 28, 2025 at 09:50:34AM +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 28.08.25 um 00:24 schrieb Dmitry Baryshkov:
> > On Fri, Aug 22, 2025 at 02:39:44PM +0800, Andy Yan wrote:
> > > From: Andy Yan <andy.yan@rock-chips.com>
> > >=20
> > >=20
> > > There are two DW DPTX based DisplayPort Controller on rk3588 which
> > > are compliant with the DisplayPort Specification Version 1.4 with
> > > the following features:
> > >=20
> > > * DisplayPort 1.4a
> > > * Main Link: 1/2/4 lanes
> > > * Main Link Support 1.62Gbps, 2.7Gbps, 5.4Gbps and 8.1Gbps
> > > * AUX channel 1Mbps
> > > * Single Stream Transport(SST)
> > > * Multistream Transport (MST)
> > > * Type-C support (alternate mode)
> > > * HDCP 2.2, HDCP 1.3
> > > * Supports up to 8/10 bits per color component
> > > * Supports RBG, YCbCr4:4:4, YCbCr4:2:2, YCbCr4:2:0
> > > * Pixel clock up to 594MHz
> > > * I2S, SPDIF audio interface
> > >=20
> > > The current version of this patch series only supports basic display =
outputs.
> > > I conducted tests with DP0 in 1080p and 4K@60 YCbCr4:2:0 modes; the A=
LT/Type-C
> > > mode was tested on Rock 5B, DP1 was tested on Rock 5 ITX by Stephen a=
nd Piotr.
> > > HDCP and audio features remain unimplemented.
> > > For RK3588, it's only support SST, while in the upcoming RK3576, it c=
an support
> > > MST output.
> > >=20
> > [skipped changelog]
> >=20
> > > Andy Yan (10):
> > >    dt-bindings: display: rockchip: Add schema for RK3588 DPTX Control=
ler
> > >    drm/bridge: synopsys: Add DW DPTX Controller support library
> > >    drm/rockchip: Add RK3588 DPTX output support
> > >    MAINTAINERS: Add entry for DW DPTX Controller bridge
> > I tried pushing patches 1-4, but got the following error:
> >=20
> > dim: ERROR: 5a68dcf5837a ("MAINTAINERS: Add entry for DW DPTX Controlle=
r bridge"): Mandatory Maintainer Acked-by missing., aborting
> >=20
> > I'm not sure how to handle MAINTAINERS changes (or whether it's fine for
> > me or not), so I will probably push patches 1-3 in a few days, if nobody
> > beats me (or unless somebody points out a correct process for
> > MAINTAINERS changes).
>=20
> That warning has been added recently to make sure that patches do not get=
 in
> without sufficient review. It's overly pedantic, though.

It's not "overly pedantic", it follows the contribution rules. I'd argue
that, if anything, we've been overly tolerant with that kind of
practices.

We do have a bug with handling MAINTAINERS changes at the moment. But
everything else shouldn't be ignored: either patch MAINTAINERS to
reflect the actual contribution path, or get the maintainers Ack.

> If you're confident that you have R-bs from enough relevant people,
> push the patches with 'dim -f' to ignore the warning.

And let's not just advise that either.

Maxime

--ymx6junihpockhkm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaLANyAAKCRAnX84Zoj2+
dvcTAX9rZO7QwXxbtcVqDnn23mh2i9KEU6GCe3pKfMrxhyxr/xeu+2p/6ozBtwvy
dnuUOUwBgO9N54kfuFqmTdfZIBhi2RTQ4iuHn4jAnfkBH1wkyB6OhyEze6gnXwEZ
eUsIzifPzw==
=bTVf
-----END PGP SIGNATURE-----

--ymx6junihpockhkm--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A7885103F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 11:03:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8933410EBC9;
	Mon, 12 Feb 2024 09:55:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pFNq4/4I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6188C10E2F5
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 09:55:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 11696CE0FE8;
 Mon, 12 Feb 2024 09:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 596F5C43390;
 Mon, 12 Feb 2024 09:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707731734;
 bh=HK3iN31Pdycw3MOndavpvQN/41z5gCD2Ck3qqfmyiTg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pFNq4/4IdY9eJyoHNAwY5F9Id/Ux8i6kjVF+JRKTg6rQknYC8wuz2aFCFY+hK4ZZ6
 njuc8tqL2aDz3mWhZzl1w65nMHCnez1weC5BUMOmNmU88ZDqQoek6wNSTwGAWFsqKF
 QwDyl3+WfEAOPKih8vspHwOsxGX873v/QJWwqoSH2FRgARQa4/D3vMmmiK423muhQl
 7Uyas/g7GVxrnyEVbKKS8cpGKbqlSooxsjmop/L0AbjHqQ0PSnFn/mclIUKw8eA+xL
 OZ3oSB4BbVMzmbpapZljzKSU18kT6Rk7iHRc20M4BpNfRQOON1gQLiQICaRK2PsxIP
 I3XJ1K8595Lfw==
Date: Mon, 12 Feb 2024 10:55:32 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>,
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>, 
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: Re: Re: [PATCH v5 08/44] drm/connector: hdmi: Add Broadcast RGB
 property
Message-ID: <uplclresnokchsgutsd27ihv4422sob77reobw6ygx3c3cqnti@hjmrhut7l5r5>
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
 <20231207-kms-hdmi-connector-state-v5-8-6538e19d634d@kernel.org>
 <20240115143308.GA159345@toolbox>
 <niqn7eql5neyfp5ficdfisdpmlwrprovqn5g7lgcfwoe74ds23@7fr4yv2miqe7>
 <20240209203046.GA996172@toolbox>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="la6nsuu6qrx5qt32"
Content-Disposition: inline
In-Reply-To: <20240209203046.GA996172@toolbox>
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


--la6nsuu6qrx5qt32
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 09, 2024 at 09:30:46PM +0100, Sebastian Wick wrote:
> On Fri, Feb 02, 2024 at 04:49:04PM +0100, Maxime Ripard wrote:
> > Hi Sebastian,
> >=20
> > On Mon, Jan 15, 2024 at 03:33:08PM +0100, Sebastian Wick wrote:
> > > >  /**
> > > >   * DOC: HDMI connector properties
> > > >   *
> > > > + * Broadcast RGB
> > > > + *      Indicates the RGB Quantization Range (Full vs Limited) use=
d.
> > > > + *      Infoframes will be generated according to that value.
> > > > + *
> > > > + *      The value of this property can be one of the following:
> > > > + *
> > > > + *      Automatic:
> > > > + *              RGB Range is selected automatically based on the m=
ode
> > > > + *              according to the HDMI specifications.
> > > > + *
> > > > + *      Full:
> > > > + *              Full RGB Range is forced.
> > > > + *
> > > > + *      Limited 16:235:
> > > > + *              Limited RGB Range is forced. Unlike the name sugge=
sts,
> > > > + *              this works for any number of bits-per-component.
> > > > + *
> > > > + *      Drivers can set up this property by calling
> > > > + *      drm_connector_attach_broadcast_rgb_property().
> > > > + *
> > >=20
> > > This is a good time to document this in more detail. There might be t=
wo
> > > different things being affected:
> > >=20
> > > 1. The signalling (InfoFrame/SDP/...)
> > > 2. The color pipeline processing
> > >=20
> > > All values of Broadcast RGB always affect the color pipeline processi=
ng
> > > such that a full-range input to the CRTC is converted to either full-=
 or
> > > limited-range, depending on what the monitor is supposed to accept.
> > >=20
> > > When automatic is selected, does that mean that there is no signallin=
g,
> > > or that the signalling matches what the monitor is supposed to accept
> > > according to the spec? Also, is this really HDMI specific?
> > >=20
> > > When full or limited is selected and the monitor doesn't support the
> > > signalling, what happens?
> >=20
> > Leaving the YCbCr vs RGB discussion aside, would this be better ?
>=20
> Yes, it is. Thanks.

Great, it'll be in the next version.

> We do have to resolve the YCbCr vs RGB issue though.
>=20
> >  * Broadcast RGB (HDMI specific)
> >  *      Indicates the Quantization Range (Full vs Limited) used. The co=
lor
> >  *      processing pipeline will be adjusted to match the value of the
>=20
> Ah, another thing no note here is that the CRTC as configured by user
> space must always produce full range pixels.

Added too

Thanks

--la6nsuu6qrx5qt32
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZcnrEwAKCRDj7w1vZxhR
xdDpAQCDVmx87SVGeVycmXmU4sk+7XyYR3FCEEqCdeOHZuh2qQD/YieE0hT/nf54
5ulv0+EGxYyUNUob/q6HmPUhR3V7pQ8=
=P7ka
-----END PGP SIGNATURE-----

--la6nsuu6qrx5qt32--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2FD83DA20
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 13:27:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E7210E234;
	Fri, 26 Jan 2024 12:26:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2229110E479
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 12:26:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CFCC2CE353C;
 Fri, 26 Jan 2024 12:26:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08268C433F1;
 Fri, 26 Jan 2024 12:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706271974;
 bh=zILjTNi8K+qYGwusWH4yMUOSaDEkMO5YXXJnvLz1pr4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s8mD+afwhPlrmu4OmOaYVqSF0jxr/aTomrLbnMhboSNjnyqKXcJuQwJSupF5i1DXT
 XIfu8q/d8dbc2cE9II5CRWh/ZQRz9hggC767H36F6aouGDntUDeG10mnODj39TQOJR
 3QtAh/HQPEQz5/1eANdMewMsyYVj3cMcxapHQQyzqPNrSFx/YgPJZSQedznrRYTUEb
 /kViCzOHjNqa8e5isqAqfYdbGqbfUlfM0WTvxZyUmfMlZntN9GcYBm3Kq7P4lTNGSi
 K+UO1O/AFd/EEkFDA5CM1hMJROoEHF4f204lKZPnmXYVSU+t8MebX3CsSUxz0uLpX/
 /RrFCsgcq/yOQ==
Date: Fri, 26 Jan 2024 13:26:11 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: Re: [PATCH 0/4] Fixing live video input in ZynqMP DPSUB
Message-ID: <u5mngxudtdgy3vqkfbpgqng6tdahijnet2jtj345hrowbt47ce@t3e7hul45mr3>
References: <20240112234222.913138-1-anatoliy.klymenko@amd.com>
 <6jhwss2wego6yoo5mwmphwawhsj5bbj62gwrzcpapoixwkrkli@g4fbxdooopby>
 <20240117142343.GD17920@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5lh6jggbrvte6mqp"
Content-Disposition: inline
In-Reply-To: <20240117142343.GD17920@pendragon.ideasonboard.com>
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
Cc: tzimmermann@suse.de, airlied@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 daniel@ffwll.ch, michal.simek@amd.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--5lh6jggbrvte6mqp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 17, 2024 at 04:23:43PM +0200, Laurent Pinchart wrote:
> On Mon, Jan 15, 2024 at 09:28:39AM +0100, Maxime Ripard wrote:
> > On Fri, Jan 12, 2024 at 03:42:18PM -0800, Anatoliy Klymenko wrote:
> > > Patches 1/4,2/4,3/4 are minor fixes.
> > >=20
> > > DPSUB requires input live video format to be configured.
> > > Patch 4/4: The DP Subsystem requires the input live video format to be
> > > configured. In this patch we are assuming that the CRTC's bus format =
is fixed
> > > and comes from the device tree. This is a proposed solution, as there=
 are no api
> > > to query CRTC output bus format.
> > >=20
> > > Is this a good approach to go with?
> >=20
> > I guess you would need to expand a bit on what "live video input" is? Is
> > it some kind of mechanism to bypass memory and take your pixels straight
> > from a FIFO from another device, or something else?
>=20
> Yes and no.
>=20
> The DPSUB integrates DMA engines, a blending engine (two planes), and a
> DP encoder. The dpsub driver supports all of this, and creates a DRM
> device. The DP encoder hardware always takes its input data from the
> output of the blending engine.
>=20
> The blending engine can optionally take input data from a bus connected
> to the FPGA fabric, instead of taking it from the DPSUB internal DMA
> engines. When operating in that mode, the dpsub driver exposes the DP
> encoder as a bridge, and internally programs the blending engine to
> disable blending. Typically, the FPGA fabric will then contain a CRTC of
> some sort, with a driver that will acquire the DP encoder bridge as
> usually done.
>=20
> In this mode of operation, it is typical for the IP cores in FPGA fabric
> to be synthesized with a fixed format (as that saves resources), while
> the DPSUB supports multiple input formats.

Where is that CRTC driver? It's not clear to me why the format would
need to be in the device tree at all. Format negociation between the
CRTC and whatever comes next is already done in a number of drivers so
it would be useful to have that kind of API outside of the bridge
support.

> Bridge drivers in the upstream kernel work the other way around, with
> the bridge hardware supporting a limited set of formats, and the CRTC
> then being programmed with whatever the bridges chain needs. Here, the
> negotiation needs to go the other way around, as the CRTC is the
> limiting factor, not the bridge.

Sounds like there's something to rework in the API then?

Maxime

--5lh6jggbrvte6mqp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZbOk4wAKCRDj7w1vZxhR
xUHkAQCUlNiJ7Ynqb+0WDp6MdjbbBqiEISR9yTAhYDsOH7PrCwD/Qeh8kCS+fFoo
IjQNq7fGX5iQGxHN9Gtg2wwAZS2wOAU=
=YZlf
-----END PGP SIGNATURE-----

--5lh6jggbrvte6mqp--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EB4845DFB
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 18:01:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB1BA10E16F;
	Thu,  1 Feb 2024 17:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="F99T2ocV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9616610E16F
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 17:01:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DC452CE14EB;
 Thu,  1 Feb 2024 17:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5109C433C7;
 Thu,  1 Feb 2024 17:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706806864;
 bh=ORVetPFkmT4UVVKKyCuUwRmeXNPw9HlZpcxW5dV/1Dk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F99T2ocV6qN+IxcFBwsn1LL6d0OPn/uvYQqJ2bqeNJphRnC6Hb19Iz0KZVFjYNc6s
 cdrGzteR7vwQyZHb44z5Yd1qtb1DHg9xBvK06x2qpVIf/uyzjM8xDzRNkJTMLRTsYG
 9ieheOzFg9iddMtn2M1k2ll66EmdnIc4tovtT4atRBTOaHv7ihbp7HnhZcSgaj9mRF
 Vf0REkKwiiuU4fR4MCwFO9TyAgtP1XDOGomXwI6KRQZEfiYqfnxwXFXk5YsxHL3AqI
 6KLyxNZCUfXr9JxLG+NyQjqk3SYXxRqoxD/dic1yTuYWXmUkQ3GVQ5eKyDrvGCoh5z
 vPH6M5krOt8yg==
Date: Thu, 1 Feb 2024 18:01:01 +0100
From: Maxime Ripard <mripard@kernel.org>
To: "Klymenko, Anatoliy" <Anatoliy.Klymenko@amd.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, 
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "Simek, Michal" <michal.simek@amd.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: RE: Re: [PATCH 0/4] Fixing live video input in ZynqMP DPSUB
Message-ID: <2ytxhpti53e743b5pca3oa5jmscffi4vpsyeh727bcoh4v6cuw@zkz5pqkcv7v2>
References: <20240112234222.913138-1-anatoliy.klymenko@amd.com>
 <6jhwss2wego6yoo5mwmphwawhsj5bbj62gwrzcpapoixwkrkli@g4fbxdooopby>
 <20240117142343.GD17920@pendragon.ideasonboard.com>
 <u5mngxudtdgy3vqkfbpgqng6tdahijnet2jtj345hrowbt47ce@t3e7hul45mr3>
 <MW4PR12MB7165D35189BEECA8769552AFE6792@MW4PR12MB7165.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pjqnxa646r7gclj6"
Content-Disposition: inline
In-Reply-To: <MW4PR12MB7165D35189BEECA8769552AFE6792@MW4PR12MB7165.namprd12.prod.outlook.com>
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


--pjqnxa646r7gclj6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 11:18:30PM +0000, Klymenko, Anatoliy wrote:
>=20
>=20
> > -----Original Message-----
> > From: Maxime Ripard <mripard@kernel.org>
> > Sent: Friday, January 26, 2024 4:26 AM
> > To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Klymenko, Anatoliy <Anatoliy.Klymenko@amd.com>;
> > maarten.lankhorst@linux.intel.com; tzimmermann@suse.de; airlied@gmail.c=
om;
> > daniel@ffwll.ch; Simek, Michal <michal.simek@amd.com>; dri-
> > devel@lists.freedesktop.org; linux-arm-kernel@lists.infradead.org; linu=
x-
> > kernel@vger.kernel.org
> > Subject: Re: Re: [PATCH 0/4] Fixing live video input in ZynqMP DPSUB
> >=20
> > On Wed, Jan 17, 2024 at 04:23:43PM +0200, Laurent Pinchart wrote:
> > > On Mon, Jan 15, 2024 at 09:28:39AM +0100, Maxime Ripard wrote:
> > > > On Fri, Jan 12, 2024 at 03:42:18PM -0800, Anatoliy Klymenko wrote:
> > > > > Patches 1/4,2/4,3/4 are minor fixes.
> > > > >
> > > > > DPSUB requires input live video format to be configured.
> > > > > Patch 4/4: The DP Subsystem requires the input live video format =
to be
> > > > > configured. In this patch we are assuming that the CRTC's bus for=
mat is fixed
> > > > > and comes from the device tree. This is a proposed solution, as t=
here are no
> > api
> > > > > to query CRTC output bus format.
> > > > >
> > > > > Is this a good approach to go with?
> > > >
> > > > I guess you would need to expand a bit on what "live video input" i=
s? Is
> > > > it some kind of mechanism to bypass memory and take your pixels str=
aight
> > > > from a FIFO from another device, or something else?
> > >
> > > Yes and no.
> > >
> > > The DPSUB integrates DMA engines, a blending engine (two planes), and=
 a
> > > DP encoder. The dpsub driver supports all of this, and creates a DRM
> > > device. The DP encoder hardware always takes its input data from the
> > > output of the blending engine.
> > >
> > > The blending engine can optionally take input data from a bus connect=
ed
> > > to the FPGA fabric, instead of taking it from the DPSUB internal DMA
> > > engines. When operating in that mode, the dpsub driver exposes the DP
> > > encoder as a bridge, and internally programs the blending engine to
> > > disable blending. Typically, the FPGA fabric will then contain a CRTC=
 of
> > > some sort, with a driver that will acquire the DP encoder bridge as
> > > usually done.
> > >
> > > In this mode of operation, it is typical for the IP cores in FPGA fab=
ric
> > > to be synthesized with a fixed format (as that saves resources), while
> > > the DPSUB supports multiple input formats.
> >=20
> > Where is that CRTC driver? It's not clear to me why the format would
> > need to be in the device tree at all. Format negociation between the
> > CRTC and whatever comes next is already done in a number of drivers so
> > it would be useful to have that kind of API outside of the bridge
> > support.
>
> One example of such CRTC driver:
> https://github.com/Xilinx/linux-xlnx/blob/master/drivers/gpu/drm/xlnx/xln=
x_mixer.c It's not
> upstreamed yet. Bus format negotiations here are handled by utilizing Xil=
inx-specific bridge
> framework. Ideally, it would be nice to rework this to comply with the up=
stream DRM bridge
> framework.
>
> > > Bridge drivers in the upstream kernel work the other way around, with
> > > the bridge hardware supporting a limited set of formats, and the CRTC
> > > then being programmed with whatever the bridges chain needs. Here, the
> > > negotiation needs to go the other way around, as the CRTC is the
> > > limiting factor, not the bridge.
> >=20
> > Sounds like there's something to rework in the API then?
> >=20
> Adding an optional CRTC callback imposing CRTC specific bus format restri=
ctions, which may be
> called from here https://github.com/torvalds/linux/blob/master/drivers/gp=
u/drm/drm_bridge.c#L935
> would solve the problem.

CRTCs and bridges are orthogonal. If anything, I'd expect that callback
to be set at the CRTC, encoder and connector levels and filled by the
drm_bridge code if relevant.

Maxime

--pjqnxa646r7gclj6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZbvOTAAKCRDj7w1vZxhR
xbVPAP49vGrbelyhqSYUXSE85/vH2qXOXAJu3q1Y/CUU9DUANwEAlmtHkOex/CVN
fX5vhl8ixN+4cmpKXQHWEroLwF3pxAQ=
=Pm76
-----END PGP SIGNATURE-----

--pjqnxa646r7gclj6--

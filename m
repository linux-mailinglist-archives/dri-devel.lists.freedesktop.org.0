Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 161D2846D84
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 11:15:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9142310EE18;
	Fri,  2 Feb 2024 10:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BwctDpLZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE59A10EE18
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 10:15:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4B8C462472;
 Fri,  2 Feb 2024 10:15:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78767C433F1;
 Fri,  2 Feb 2024 10:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706868936;
 bh=h7pf+bNSUITFu2AR32lONlZfWSLcGLsu9hqoSGsNIuw=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=BwctDpLZDWbJsBJE0Xz53F3PiYQyC9raKY8A5S4MwkSs+RfXGTziIWaKODe4jkcTk
 2XxNS4Jm+epJfybsgeyMcQvNg6TIP577c6yUsq7F/sFfVU/slRZ/rZ7+kiwSkdZNNa
 5UIOpiuA22uAk9YV8gzLu3wWEEbvZ777KqhmFR+JUhDHyLz3YZmbmLAHr8k8ImLbvW
 kFXgBHxm8KkXsegqI4P9xpt0GqdqUMvMfzMfxbHiApgLiqDMVO8yswGelI1nKI3YmW
 mT4ydLO/nrtJWQZhWQlym+4vtn5kh+NGAlIRQtwOi4YGqd+1ev9bQz+QAeZgOK1fy/
 aJ07bsCNFoa0A==
Date: Fri, 2 Feb 2024 11:15:33 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
Subject: Re: Re: [PATCH RFC 0/4] Support for Simulated Panels
Message-ID: <gs634bhdctmpxhhdjw3bddirvc6ex7fwdmy4xr4pygyibvmp5g@zfouf76tmti2>
References: <20240116-jz-test-sim-panel-v1-0-f9511f46c9c7@quicinc.com>
 <x6wi5xnihnbpqsujjfjfw3ft6njncruta5l3xa44pds5oxmdkw@mmvv4bciy65s>
 <87cyu0qn81.fsf@intel.com>
 <e1f10583-1d5b-fdac-24bf-098a0ba06241@quicinc.com>
 <hhmbghooegclx3jbsx2neryligk3mj77lq7gns5xegags5ltoz@acdu6hssqwlw>
 <99705d73-abcf-6d41-3d50-757e706cf1fc@quicinc.com>
 <Zbi4-S49CWlUkO__@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="x2i24xsvgdspxesl"
Content-Disposition: inline
In-Reply-To: <Zbi4-S49CWlUkO__@phenom.ffwll.local>
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


--x2i24xsvgdspxesl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 09:53:13AM +0100, Daniel Vetter wrote:
> > > > > > Wouldn't it be simpler if we had a vkms-like panel that we coul=
d either
> > > > > > configure from DT or from debugfs that would just be registered=
 the
> > > > > > usual way and would be the only panel we register?
> > > > >=20
> > > >=20
> > > > No, we need to have validate actual hardware pipeline with the simu=
lated
> > > > panel. With vkms, actual display pipeline will not be validated. Wi=
th
> > > > incorrect display pipeline misconfigurations arising from different=
 panel
> > > > combinations, this can easily be caught with any existing IGT CRC t=
esting.
> > > > In addition, all performance related bugs can also be easily caught=
 by
> > > > simulating high resolution displays.
> > >=20
> > > That's not what I meant. What I meant was that something like a
> > > user-configurable, generic, panel driver would be a good idea. Just l=
ike
> > > vkms (with the debugfs patches) is for a full blown KMS device.
> > >=20
> >=20
> > Let me respond for both this question and the one below from you/Jani.
> >=20
> > Certainly having user-configurable information is a goal here. The end-=
goal
> > is to make everything there in the existing panels such as below like I
> > wrote:
> >=20
> > 1) Display resolution with timings (drm_display_mode)
> > 2) Compression/non-compression
> > 3) Command mode/Video mode
> > 4) MIPI mode flags
> > 5) DCS commands for panel enable/disable and other panel sequences
> > 6) Power-up/Power-down sequence for the panel
> >=20
> > But, we also have to see what all is feasible today from the DRM fwk
> > standpoint. There are some limitations about what is boot-time configur=
able
> > using bootparams and what is runtime configurable (across a modeset) us=
ing
> > debugfs.
> >=20
> > 1) Today, everything part of struct mipi_dsi_device needs to be availab=
le at
> > boot time from what I can see as we need that while calling
> > mipi_dsi_attach(). So for that we went with boot-params.
> >=20
> > 2) For the list of modes, we can move this to a debugfs like
> > "populate_modes" which the client using a sim panel can call before pic=
king
> > a mode and triggering a commit.
> >=20
> > But we need to have some default mode and configuration.
>=20
> Uh, at the risk of sounding a bit like I'm just chasing the latest
> buzzwords, but this sounds like something that's screaming for ebpf.

I make a half-joke to Jani on IRC about it, but I was also being
half-serious. If the goal we want to have is to fully emulate any panel
variation, ebpf really looks like the best and most flexible way
forward.

Maxime

--x2i24xsvgdspxesl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZbzAxAAKCRDj7w1vZxhR
xeDFAPsEkAg9JZXmG4PMCxnBcetbzTCgjtu7yt2xbAS+3Bv5ngD/ViFSXXlR9Y10
yvcfom7OcYMCE0WPcHPfQCNuRiirvwM=
=+MTv
-----END PGP SIGNATURE-----

--x2i24xsvgdspxesl--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98131846D72
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 11:12:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A85C010E957;
	Fri,  2 Feb 2024 10:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SVmgtTMp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11ED810E957
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 10:12:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D139BCE2AE2;
 Fri,  2 Feb 2024 10:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FAF7C433C7;
 Fri,  2 Feb 2024 10:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706868762;
 bh=5anGoLnHT2P3W17BB0Cn9oKUr5SH97J4Uj9F8qaqNCw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SVmgtTMpWP2VJSuve4PJkUz9Tn0a82UPzdpsfyEJ2sEDP5x9r90VucdFGuUoQghk7
 J/GHxLTY0tNTlt2WWY5juN+yqtWqM47WldExdwbB0InrFDQO3sj58c9H75Dj0B+glc
 3IxZ2UE++2/aEufS6cjLzxiEGEMC96KYvN7zDT8K7qOAEEvQowB8GxCDyrawB1gDqJ
 fK6AcFeD01UPDc+0N9quLkRNXSvb8GnXq2Q7afUzAgoVnENjQcRcR0W4lWKyUHxZhX
 Luj6q5xkBP41E4YX/lSjTx8Cxwc3cRmhSQytyCOKXhaHkaSPq2Bxqi55irbsw+Ywvl
 ro+dgsJ7m92MQ==
Date: Fri, 2 Feb 2024 11:12:39 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
Subject: Re: Re: [PATCH RFC 0/4] Support for Simulated Panels
Message-ID: <qbyx3h7pallkvjufetr4vsu2wa5lub2hh3z2vr3q4mzwqk25vx@l63qmwsoi3vu>
References: <20240116-jz-test-sim-panel-v1-0-f9511f46c9c7@quicinc.com>
 <x6wi5xnihnbpqsujjfjfw3ft6njncruta5l3xa44pds5oxmdkw@mmvv4bciy65s>
 <87cyu0qn81.fsf@intel.com>
 <e1f10583-1d5b-fdac-24bf-098a0ba06241@quicinc.com>
 <hhmbghooegclx3jbsx2neryligk3mj77lq7gns5xegags5ltoz@acdu6hssqwlw>
 <99705d73-abcf-6d41-3d50-757e706cf1fc@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tvqtf4mwmxl4db6g"
Content-Disposition: inline
In-Reply-To: <99705d73-abcf-6d41-3d50-757e706cf1fc@quicinc.com>
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


--tvqtf4mwmxl4db6g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2024 at 11:05:12AM -0800, Abhinav Kumar wrote:
> <adding device tree maintainers to comment>
>=20
> Hi Maxime
>=20
> On 1/26/2024 4:45 AM, Maxime Ripard wrote:
> > On Wed, Jan 17, 2024 at 09:36:20AM -0800, Abhinav Kumar wrote:
> > > Hi Jani and Maxime
> > >=20
> > > On 1/17/2024 2:16 AM, Jani Nikula wrote:
> > > > On Wed, 17 Jan 2024, Maxime Ripard <mripard@kernel.org> wrote:
> > > > > Hi,
> > > > >=20
> > > > > On Tue, Jan 16, 2024 at 02:22:03PM -0800, Jessica Zhang wrote:
> > > > > > This series introduces a simulated MIPI DSI panel.
> > > > > >=20
> > > > > > Currently, the only way to validate DSI connectors is with a ph=
ysical
> > > > > > panel. Since obtaining physical panels for all possible DSI con=
figurations
> > > > > > is logistically infeasible, introduce a way for DSI drivers to =
simulate a
> > > > > > panel.
> > > > > >=20
> > > > > > This will be helpful in catching DSI misconfiguration bugs and =
catching
> > > > > > performance issues for high FPS panels that might not be easily
> > > > > > obtainable.
> > > > > >=20
> > > > > > For now, the simulated panel driver only supports setting custo=
mized
> > > > > > modes via the panel_simlation.mode modparam. Eventually, we wou=
ld like
> > > > > > to add more customizations (such as configuring DSC, dual DSI, =
etc.).
> > > > >=20
> > > > > I think that it's more complicated than it needs to be.
> > > >=20
> > > > Both too complicated and not complicated enough! :p
> > >=20
> > > The end goal is to have a framework to be able to validate the display
> > > pipeline with MIPI panels of any resolution , DSC/non-DSC, different =
MIPI
> > > flags etc.
> > >=20
> > > Historically, QC has been having an in-house framework to validate the
> > > panels in a simulated way as its logistically not possible to procure=
 every
> > > panel from every vendor. This has been working pretty well but its not
> > > upstream yet. So we would like to work with the community to work on =
a model
> > > which works for everyone and this RFC was initiated with that in mind.
> >=20
> > I think the goal was pretty clear. My point was more that there's no
> > reason it should be driver specific, and having a second path for it
> > doesn't really exert the actual panel path in the driver. I think a
> > separate driver would be better.
> >=20
>=20
> We can make this generic. That would be great actually. One option could =
be
> to move the modparam we have within the msm to the drm_of.c so that
> drm_of_find_panel_or_bridge shall return the sim panel if the modparam is
> passed to select a sim panel.
>=20
> So if we make this a compile time decision whether to use real panel or s=
im
> panel and just enable the appropriate config, we dont need the modparam a=
nd
> we can implement some policy in the drm_of to first check if sim panel is
> available and if not try the real panel then everything will just happen
> under-the-hood. But we thought that a modparam based switching might be
> convenient if users dont want to recompile the code to switch but will ne=
ed
> to compile both the panels.

I agree that a module parameter to select the simulated panel looks like
the best option compared to a compile time option.

> > > There is simulation infrastructure in place in upstream for HDMI/DP i=
n the
> > > form of chamelium based testing in IGT but no such fwk exists for DSI
> > > displays.
> > >=20
> > > Different MIPI panels and resolutions test out not only the DSI contr=
oller
> > > but the entire display pipeline as based on resolution, compression a=
nd MIPI
> > > mode flags different parts of the pipeline can get exercised.
> > >=20
> > > > > Why do we need to support (and switch to) both the actual and
> > > > > "simulated" panel?
> > > > >=20
> > >=20
> > > As per my discussion on IRC with the panel/bridge maintainers and DT
> > > maintainers, a simulation panel does not qualify for its own devicetr=
ee as
> > > its not a real hardware so we needed to come up with a way to have a =
module
> > > which can be attached to the encoder without its own bindings and
> > > devicetree. Thats what led to this RFC.
> >=20
> > I still think it's worth trying, there's plenty of virtual drivers in
> > the DT already. But even then, DT policies shouldn't dictate general
> > framework design decisions: we have other ways to probe panels than
> > using the DT (by loading overlays, registering devices by hand, etc.). I
> > still think it would be a good idea to try though.
> >=20
>=20
> DT option would be great if accepted and will nicely solve the scalability
> issue of this as it desperately needs one.
>=20
> I have absolutely no concerns and would be glad if it will be accepted.
>=20
> Can the DT maintainers please comment if having a device tree for a
> simulation panel would work OR be considered because of the scalability of
> the number of panels which can be tried as Maxime wrote.
>=20
> > > > > Wouldn't it be simpler if we had a vkms-like panel that we could =
either
> > > > > configure from DT or from debugfs that would just be registered t=
he
> > > > > usual way and would be the only panel we register?
> > > >=20
> > >=20
> > > No, we need to have validate actual hardware pipeline with the simula=
ted
> > > panel. With vkms, actual display pipeline will not be validated. With
> > > incorrect display pipeline misconfigurations arising from different p=
anel
> > > combinations, this can easily be caught with any existing IGT CRC tes=
ting.
> > > In addition, all performance related bugs can also be easily caught by
> > > simulating high resolution displays.
> >=20
> > That's not what I meant. What I meant was that something like a
> > user-configurable, generic, panel driver would be a good idea. Just like
> > vkms (with the debugfs patches) is for a full blown KMS device.
> >=20
>=20
> Let me respond for both this question and the one below from you/Jani.
>=20
> Certainly having user-configurable information is a goal here. The end-go=
al
> is to make everything there in the existing panels such as below like I
> wrote:
>=20
> 1) Display resolution with timings (drm_display_mode)
> 2) Compression/non-compression
> 3) Command mode/Video mode
> 4) MIPI mode flags
> 5) DCS commands for panel enable/disable and other panel sequences
> 6) Power-up/Power-down sequence for the panel
>=20
> But, we also have to see what all is feasible today from the DRM fwk
> standpoint. There are some limitations about what is boot-time configurab=
le
> using bootparams and what is runtime configurable (across a modeset) using
> debugfs.
>
> 1) Today, everything part of struct mipi_dsi_device needs to be available=
 at
> boot time from what I can see as we need that while calling
> mipi_dsi_attach(). So for that we went with boot-params.
>=20
> 2) For the list of modes, we can move this to a debugfs like
> "populate_modes" which the client using a sim panel can call before picki=
ng
> a mode and triggering a commit.
>=20
> But we need to have some default mode and configuration.
>=20
> This is where I am not totally sure of. On HDMI/DP sinks, we usually go w=
ith
> a default of 640x480 as that one is guaranteed to be supported across sin=
ks.
>=20
> For MIPI displays, we will have to agree on some default configuration th=
en.
>=20
> So, we can certainly add debugfs to make the runtime params but we need to
> start with some default during boot-up and move the others to debugfs.
>=20
> With vkms, can you pls point us to the debugfs patches you are referring =
to?
> With the current vkms, very little is available which is debugfs
> configurable (overlay, writeback and cursor support).
>=20
> Ofcourse, all these concerns go away if DT option gets accepted.

Not entirely, no. You won't be able to express the command sequences
properly through the DT for example, so we would need some kind of
interface like that anyway.

Maxime

--tvqtf4mwmxl4db6g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZbzAFgAKCRDj7w1vZxhR
xTCYAPwI20H7PMvAPATSHOSbKbox6djl/Xz7bzwuF6pzi4WFTAEA7+1yYXqBrMyY
HGNlXJqb9JdvhI2lGxznwisFHL2eaQQ=
=7Hi4
-----END PGP SIGNATURE-----

--tvqtf4mwmxl4db6g--

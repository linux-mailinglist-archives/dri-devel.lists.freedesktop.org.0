Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C093683DA49
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 13:45:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E09D10FA12;
	Fri, 26 Jan 2024 12:45:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C806B10FA12
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 12:45:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3FFB76230B;
 Fri, 26 Jan 2024 12:45:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927C8C433C7;
 Fri, 26 Jan 2024 12:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706273117;
 bh=XIAfNN2TnesbiltFdat/ZR5k0/YSTED9WyPg9/4Ukc8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HjENpqedemo2G0vGWINC6AuDVKw5FbZCLaoR+ix/1vANsdYKjcXoB8Mb5NUnSYP88
 Q6TqJar6Jg15K5mRmDFUvF1jXrlz3MPlfaFmNpBih4c1xXL44s5/ghPbmOPsf7NieU
 haWKbLYdVz1P7TXfnaN03AUSQtJ3qBlnVB0UcDR858s2P8SU4qqkEiGGpDOf0K2PYS
 qwLEjXQismRMMffKcZvXtdr1QVwAeXxa9ir2Apfw7BLh8VXcMSKCz5xb0rnTbmDMjX
 Cwvbr8LAWHFRCpOXgE9tQV7Gg+M4bFqqLvi4yQyBjClmCiHdtDktpwtujg+LyYJ9KT
 wsgP4ZEFRSjfQ==
Date: Fri, 26 Jan 2024 13:45:15 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: Re: [PATCH RFC 0/4] Support for Simulated Panels
Message-ID: <hhmbghooegclx3jbsx2neryligk3mj77lq7gns5xegags5ltoz@acdu6hssqwlw>
References: <20240116-jz-test-sim-panel-v1-0-f9511f46c9c7@quicinc.com>
 <x6wi5xnihnbpqsujjfjfw3ft6njncruta5l3xa44pds5oxmdkw@mmvv4bciy65s>
 <87cyu0qn81.fsf@intel.com>
 <e1f10583-1d5b-fdac-24bf-098a0ba06241@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ttyvot3alawck5nq"
Content-Disposition: inline
In-Reply-To: <e1f10583-1d5b-fdac-24bf-098a0ba06241@quicinc.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ttyvot3alawck5nq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 17, 2024 at 09:36:20AM -0800, Abhinav Kumar wrote:
> Hi Jani and Maxime
>=20
> On 1/17/2024 2:16 AM, Jani Nikula wrote:
> > On Wed, 17 Jan 2024, Maxime Ripard <mripard@kernel.org> wrote:
> > > Hi,
> > >=20
> > > On Tue, Jan 16, 2024 at 02:22:03PM -0800, Jessica Zhang wrote:
> > > > This series introduces a simulated MIPI DSI panel.
> > > >=20
> > > > Currently, the only way to validate DSI connectors is with a physic=
al
> > > > panel. Since obtaining physical panels for all possible DSI configu=
rations
> > > > is logistically infeasible, introduce a way for DSI drivers to simu=
late a
> > > > panel.
> > > >=20
> > > > This will be helpful in catching DSI misconfiguration bugs and catc=
hing
> > > > performance issues for high FPS panels that might not be easily
> > > > obtainable.
> > > >=20
> > > > For now, the simulated panel driver only supports setting customized
> > > > modes via the panel_simlation.mode modparam. Eventually, we would l=
ike
> > > > to add more customizations (such as configuring DSC, dual DSI, etc.=
).
> > >=20
> > > I think that it's more complicated than it needs to be.
> >=20
> > Both too complicated and not complicated enough! :p
>
> The end goal is to have a framework to be able to validate the display
> pipeline with MIPI panels of any resolution , DSC/non-DSC, different MIPI
> flags etc.
>=20
> Historically, QC has been having an in-house framework to validate the
> panels in a simulated way as its logistically not possible to procure eve=
ry
> panel from every vendor. This has been working pretty well but its not
> upstream yet. So we would like to work with the community to work on a mo=
del
> which works for everyone and this RFC was initiated with that in mind.

I think the goal was pretty clear. My point was more that there's no
reason it should be driver specific, and having a second path for it
doesn't really exert the actual panel path in the driver. I think a
separate driver would be better.

> There is simulation infrastructure in place in upstream for HDMI/DP in the
> form of chamelium based testing in IGT but no such fwk exists for DSI
> displays.
>=20
> Different MIPI panels and resolutions test out not only the DSI controller
> but the entire display pipeline as based on resolution, compression and M=
IPI
> mode flags different parts of the pipeline can get exercised.
>=20
> > > Why do we need to support (and switch to) both the actual and
> > > "simulated" panel?
> > >=20
>=20
> As per my discussion on IRC with the panel/bridge maintainers and DT
> maintainers, a simulation panel does not qualify for its own devicetree as
> its not a real hardware so we needed to come up with a way to have a modu=
le
> which can be attached to the encoder without its own bindings and
> devicetree. Thats what led to this RFC.

I still think it's worth trying, there's plenty of virtual drivers in
the DT already. But even then, DT policies shouldn't dictate general
framework design decisions: we have other ways to probe panels than
using the DT (by loading overlays, registering devices by hand, etc.). I
still think it would be a good idea to try though.

> > > Wouldn't it be simpler if we had a vkms-like panel that we could eith=
er
> > > configure from DT or from debugfs that would just be registered the
> > > usual way and would be the only panel we register?
> >=20
>=20
> No, we need to have validate actual hardware pipeline with the simulated
> panel. With vkms, actual display pipeline will not be validated. With
> incorrect display pipeline misconfigurations arising from different panel
> combinations, this can easily be caught with any existing IGT CRC testing.
> In addition, all performance related bugs can also be easily caught by
> simulating high resolution displays.

That's not what I meant. What I meant was that something like a
user-configurable, generic, panel driver would be a good idea. Just like
vkms (with the debugfs patches) is for a full blown KMS device.

> > I get the idea of trying to test DSI code without panels, and looking at
> > the goals above, I think your vkms suggestion is going to fall short of
> > those goals.
> >=20
> > However, my gut feeling is that creating a simulated panel to catch DSI
> > misconfiguration etc. is going to be insanely complicated, and this
> > series doesn't even scratch the surface.
> >=20
> > I guess my questions are, what's the scope here really, are those goals
> > realistic, does more code already exist beyond this skeleton?
> >=20
>=20
>=20
> This series is only a starting RFC to be able to validate any display mod=
e.
> This would have to be extended to be able to customize different pieces of
> the panel. Lets talk about the customizable pieces:
>=20
> 1) Display resolution with timings (drm_display_mode)
> 2) Compression/non-compression
> 3) Command mode/Video mode
> 4) MIPI mode flags
> 5) DCS commands for panel enable/disable and other panel sequences
> 6) Power-up/Power-down sequence for the panel
>=20
> Without a physical panel, yes its hard to validate if anything is wrong w=
ith
> (4) OR (5), the display might not come up at all visually. But from our
> experience, thats only a small portion and the real benefit of this
> framework will actually be from the validation failures we will catch from
> (1) to (4).
>=20
> This RFC only provides a way to customize (1) at the moment as we wanted =
to
> get some feedback from the community about the best way which will work f=
or
> everyone to customize all these parameters.
>=20
> We are willing to expand this series based on the generic way we agree on=
 to
> customize other params.
>=20
> Yes, debugfs is an option too. But typically MIPI displays need some
> parameters configured to attach the panel to the encoder. So perhaps we c=
an
> boot the simulation panel with a default resolution passed through command
> line and then across a modeset switch (1) to (4).

I think Jani's feeling was that it was going to be super complicated
fairly fast so supporting more features would definitely help to get an
idea of where this is going.

Maxime

--ttyvot3alawck5nq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZbOpWgAKCRDj7w1vZxhR
xW4KAQDTi1qXKjvMAV4J1VrSDEPWrm4HSLnPu0Mj7t4U/P/9MwEA/wS1UZ4TlVVL
+nQ2ajQM6K66yUUIOLdzvskj3RYQ1A8=
=kTxm
-----END PGP SIGNATURE-----

--ttyvot3alawck5nq--

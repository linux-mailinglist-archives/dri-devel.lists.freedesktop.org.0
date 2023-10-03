Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8961B7B6859
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 13:53:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7366910E046;
	Tue,  3 Oct 2023 11:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1330710E046
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 11:53:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id E95D7B81A28;
 Tue,  3 Oct 2023 11:52:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA56AC433CC;
 Tue,  3 Oct 2023 11:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696333977;
 bh=3nT9KXjx1uh+vQUiuley/7+kuNpXFhE3nEWV1u0TR3I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ASdAPvSIENDL7R1Rii20A6styDC6E3zCC2btyDrfJ85cCwTDXaa6hXoyDodBPpfCX
 0lMbEUuHntubOhRzcc8rHJQfEUf+iPIPOvNV6DvIjcifpmVNuxjdQ+IVmmXZy+9vXt
 DMKLd1mUdq0dD+2tbS9dfz+NYpwRsK8IlfaMqqZCdJCaxhP4EwdspdWSnkwvqPw5P8
 X0/gjC2bHsJtvF0MC5Wjl8zI2kGcYAf+Jg2fiJthCh4dKwl9bvJIfE2EkW/UQteAA+
 bnSPGZLOYLwuWTnCBjSNRDto++u9lOHuRz/rFpkppOKvdmsIdzlSeoQ85wDKegGi6U
 rYQ53+ILTjiVQ==
Date: Tue, 3 Oct 2023 13:52:54 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Ying Liu <victor.liu@nxp.com>
Subject: Re: [PATCH v14 RESEND 5/6] drm/imx: Introduce i.MX8qm/qxp DPU DRM
Message-ID: <psbg7e7ozqr6ccevo7kdw5puvnelvmq3qwe2zywbtj4wgdcmbt@zb7twuhfzvng>
References: <20230822085949.816844-1-victor.liu@nxp.com>
 <20230822085949.816844-6-victor.liu@nxp.com>
 <22parqvy44hkd2ypkglfwk6bafi5ov4qfhpvd6qnt36us7odec@iebwnwtwvnnf>
 <AM7PR04MB704659DF09143D0C6777143098E8A@AM7PR04MB7046.eurprd04.prod.outlook.com>
 <uqu5h3ai7jz5mgh67aip7bxmhygvqqzblr4yzc3npp67m47ggc@6kqnsqwhd4hd>
 <AM7PR04MB7046F751A0DFA165B23417E098C3A@AM7PR04MB7046.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jo47ulariobhypwq"
Content-Disposition: inline
In-Reply-To: <AM7PR04MB7046F751A0DFA165B23417E098C3A@AM7PR04MB7046.eurprd04.prod.outlook.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 "Laurentiu Palcu \(OSS\)" <laurentiu.palcu@oss.nxp.com>,
 Guido =?utf-8?Q?G=C3=BCnther?= <guido.gunther@puri.sm>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--jo47ulariobhypwq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 26, 2023 at 03:55:35AM +0000, Ying Liu wrote:
> > > > > +	cf->pec_base =3D devm_ioremap(dpu->dev, pec_base, SZ_16);
> > > > > +	if (!cf->pec_base)
> > > > > +		return -ENOMEM;
> > > > > +
> > > > > +	cf->base =3D devm_ioremap(dpu->dev, base, SZ_32);
> > > > > +	if (!cf->base)
> > > > > +		return -ENOMEM;
> > > >
> > > > For the same reason, you need to protect any access to a device man=
aged
> > > > resource (so clocks, registers, regulators, etc.) by a call to
> > > > drm_dev_enter/drm_dev_exit and you need to call drm_dev_unplug
> > instead
> > > > of drm_dev_unregister.
> > >
> > > That's a good point. I've tried to do that, but it turns out that the
> > > display controller cannot be enabled again after binding the dpu-core
> > > driver manually again. It seems that the display controller requires a
> > > proper disablement procedure, but the "driver instance overview " kdoc
> > > mentions the shortcoming of no proper disablement if drm_dev_unplug()
> > > is used:
> > >
> > > """
> > > * Drivers that want to support device unplugging (USB, DT overlay unl=
oad)
> > should
> > >  * use drm_dev_unplug() instead of drm_dev_unregister(). The driver m=
ust
> > protect
> > >  * regions that is accessing device resources to prevent use after th=
ey're
> > >  * released. This is done using drm_dev_enter() and drm_dev_exit(). T=
here
> > is one
> > >  * shortcoming however, drm_dev_unplug() marks the drm_device as
> > unplugged before
> > >  * drm_atomic_helper_shutdown() is called. This means that if the dis=
able
> > code
> > >  * paths are protected, they will not run on regular driver module un=
load,
> > >  * possibly leaving the hardware enabled.
> > > """
> > >
> > > A DPU reset in dpu_core() might be helpful, but I'm not sure if there=
 is any
> > > reset line provided by the embodying system.
> >=20
> > Generally speaking, you shouldn't rely on the device being in any
> > particuliar state before your driver loads. So a reset at probe/bind
> > time is a good idea.
>=20
> Yes. I'll drop the platform device creations for CRTCs from dpu-core.c=20
> and drop the aggregation of CRTC components from different DPU
> instances into one DRM device.  This way, there will be only two CRTCs
> of one DPU in one DRM device.

Ok.

> Then, the driver will be simpler and users cannot unbind the driver of
> one of the two DPU instances,

Uh? They would still be able to do that.

> which means drm_dev_unplug() won't be needed any more(?)

So this would still be needed

> and the reset issue will be gone. The controller will be shutdown
> properly through drm_atomic_helper_shutdown() when the driver module
> is removed.

Again, you shouldn't rely on a particular state at boot. For all you
know, you could have been reset by some watchdog or been kexec'd.

> > > Even if the reset works, the 2nd DPU instance in i.MX8qm would be a
> > > problem, because it won't be reset or properly disabled if the 1st DPU
> > > instance is unbound.
> >=20
> > Why it wouldn't be reset?
>=20
> Because dpu_core_remove() is not called for the 2nd DPU instance.
> Anyway, with the above new design, this doesn't seem to be a problem
> any more.

Ok.

> >=20
> > > Although the two DPU instances could be wrapped by two DRM devices, I
> > > tend not to do that because downstream bridges in future SoCs might be
> > > able to mux to different DPU instances at runtime.
> > >
> > > Due to the disablement issue, can we set drm_dev_enter/exit/unplug
> > > aside first?
> >=20
> > I'd rather have that figured out prior to merging.
>=20
> I'm assuming that drm_dev_enter/exit/unplug won't be needed with the above
> new design - one DPU instance wrapped by one DRM device.

I'm not sure why you are making that claim. And again, that's good
practice: it does no harm while preventing unsafe behaviour in the
future.

> > > > > +static void dpu_atomic_put_plane_state(struct drm_atomic_state
> > *state,
> > > > > +				       struct drm_plane *plane)
> > > > > +{
> > > > > +	int index =3D drm_plane_index(plane);
> > > > > +
> > > > > +	plane->funcs->atomic_destroy_state(plane, state-
> > >planes[index].state);
> > > > > +	state->planes[index].ptr =3D NULL;
> > > > > +	state->planes[index].state =3D NULL;
> > > > > +	state->planes[index].old_state =3D NULL;
> > > > > +	state->planes[index].new_state =3D NULL;
> > > > > +
> > > > > +	drm_modeset_unlock(&plane->mutex);
> > > > > +
> > > > > +	dpu_plane_dbg(plane, "put state\n");
> > > > > +}
> > > > > +
> > > > > +static void dpu_atomic_put_crtc_state(struct drm_atomic_state *s=
tate,
> > > > > +				      struct drm_crtc *crtc)
> > > > > +{
> > > > > +	int index =3D drm_crtc_index(crtc);
> > > > > +
> > > > > +	crtc->funcs->atomic_destroy_state(crtc, state->crtcs[index].sta=
te);
> > > > > +	state->crtcs[index].ptr =3D NULL;
> > > > > +	state->crtcs[index].state =3D NULL;
> > > > > +	state->crtcs[index].old_state =3D NULL;
> > > > > +	state->crtcs[index].new_state =3D NULL;
> > > > > +
> > > > > +	drm_modeset_unlock(&crtc->mutex);
> > > > > +
> > > > > +	dpu_crtc_dbg(crtc, "put state\n");
> > > > > +}
> > > > > +
> > > > > +static void
> > > > > +dpu_atomic_put_possible_states_per_crtc(struct drm_crtc_state
> > > > *crtc_state)
> > > > > +{
> > > > > +	struct drm_atomic_state *state =3D crtc_state->state;
> > > > > +	struct drm_crtc *crtc =3D crtc_state->crtc;
> > > > > +	struct drm_plane *plane;
> > > > > +	struct drm_plane_state *old_plane_state, *new_plane_state;
> > > > > +	struct dpu_plane_state *old_dpstate, *new_dpstate;
> > > > > +
> > > > > +	drm_atomic_crtc_state_for_each_plane(plane, crtc_state) {
> > > > > +		old_plane_state =3D drm_atomic_get_old_plane_state(state,
> > > > plane);
> > > > > +		new_plane_state =3D drm_atomic_get_new_plane_state(state,
> > > > plane);
> > > > > +
> > > > > +		old_dpstate =3D to_dpu_plane_state(old_plane_state);
> > > > > +		new_dpstate =3D to_dpu_plane_state(new_plane_state);
> > > > > +
> > > > > +		/* Should be enough to check the below HW plane resources.
> > > > */
> > > > > +		if (old_dpstate->stage.ptr !=3D new_dpstate->stage.ptr ||
> > > > > +		    old_dpstate->source !=3D new_dpstate->source ||
> > > > > +		    old_dpstate->blend !=3D new_dpstate->blend)
> > > > > +			return;
> > > > > +	}
> > > > > +
> > > > > +	drm_atomic_crtc_state_for_each_plane(plane, crtc_state)
> > > > > +		dpu_atomic_put_plane_state(state, plane);
> > > > > +
> > > > > +	dpu_atomic_put_crtc_state(state, crtc);
> > > > > +}
> > > >
> > > > That's super suspicious too. Are you really going around and droppi=
ng
> > > > and destroying plane and crtc states in a global state?
> > >
> > > Yes.
> >=20
> > That's really not a good idea. Adding states are fine, dropping ones
> > aren't.
>=20
> The idea is to add all active planes on two CRTCs into one commit and
> try to allocate fetchunits for those planes as a whole to best meet user's
> requirements, because ...
>=20
> >=20
> > > >
> > > > At the very least, you need to describe what this addresses and why=
 you
> > > > think it's a good solution.
> > >
> > > This is the solution to assign HW resources of a plane group to the t=
wo
> > CRTCs
> > > in one DPU or one CRTC group _dynamically_ at runtime.  Dpu.h has some
> > > comments which hint this:
> > >
> > > """
> > > /*
> > >  * fetchunit/scaler/layerblend resources of a plane group are
> > >  * shared by the two CRTCs in a CRTC group
> > >  */
> > > """
> > >
> > > I can add a DPU display controller block diagram in dpu_kms.c to tell=
 the
> > HW
> > > architecture and some SW architecture to clarify this more.
> >=20
> > It's not so much the diagram that I'm looking for, but an accurate
> > description of the problem. What resource is there, why and how does it
> > need to be shared, so we can understand what you are doing there, and
> > possibly suggest other things.
>=20
> ... the problem is that fetchunits(fetchdecode/fetchlayer/fetchwarp) have
> different capabilities/feature sets and they can be built upon either of =
the
> two CRTCs through layerblends.  The 4 fetchunits for one DPU display
> controller are fetchdecode0, fetchdecode1, fetchlayer0 and fetchwarp2.
> Correspondingly, there are 4 layerblends(0 to 3).  Layerblends blend two
> input sources(primary input and secondary input). The primary input can
> be, say, constframe or another layerblend's output.  The secondary input
> can be, say, one of those fetchunits.  For example, a real use case could
> be:
> - CRTC0:
>   Primary plane:
>     Layerblend0:
>       Primary:  constframe4
>       Secondary: fetchlayer0
>   Overlay plane:
>     Layerblend1:
>       Primary: Layerblend0 output
>       Secondary: fetchdecode1 + vscaler5 + hscaler4
>=20
> - CRTC1:
>   Primary plane:
>     Layerblend2:
>       Primary:  constframe5
>       Secondary: fetchwarp2 + fetcheco2
>   Overlay plane:
>     Layerblend3:
>       Primary: Layerblend2 output
>       Secondary: fetchdecode0 + fetcheco0 + vscaler4
>=20
> Some fetchunit features:
> - fetchdecode: Horizontoal/vertical downscaling through video
>    processing blocks and YUV fb with two planars(use fetcheco).
> - fetchwarp: YUV fb with two planars(use fetcheco), up to
>   8 sub-layers and warp.
> - fetchlayer: up to 8 sub-layers.
>=20
> All fetchunits support RGB fb.
>=20
>=20
> What I do is:
> - Add all active planes(including primary and overlays) on two CRTCs
>   into one commit even if the user only wants to update the plane(s)
>   on one CRTC.
> - Those manually added planes/CRTCs are prone to put, because
>    the relevant fetchunits and layerblends are likely/eventually
>    unchanged after the allocation.
> - Traverse through fetchunit list to try to find an available one to
>    meet a plane's requirements(say CSC? Scalers?). Those prone-to-put
>    planes are handled first to use the current fetchunits if modeset
>    is not allowed, otherwise planes with lower z-positions go first.
> - Do not allow fetchunit hot-migration between two CRTCs.
> - Assign layerblend with the lowest possible index to planes.  Planes
>    with lower z-positions go first.
> - Put the prone-to-put planes/CRTC if possible to gain some
>   performance .

So, you shouldn't do it the way you did it so far, but if I got you
right, this seems similar to what we have on vc4 where all planes go
through another device (called HVS) that we maintain a global state for.
That way, any plane change will pull that global state in, and you are
getting a global view of what resources are being used in the system.

See vc4_pv_muxing_atomic_check() for an example.

Maxime

--jo47ulariobhypwq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZRwAlgAKCRDj7w1vZxhR
xVi+AQDLvwVVXxbb/hbxROK2LJGFKRqpl33wkNFNOewEkxV+CQEAojEWqsDR+Jfv
Pb5qKa/TA457QXdnr4pZyRnFoHDBYAY=
=fkBU
-----END PGP SIGNATURE-----

--jo47ulariobhypwq--

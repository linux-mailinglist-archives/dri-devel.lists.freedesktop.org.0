Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 816F3792112
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 10:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8894010E45F;
	Tue,  5 Sep 2023 08:37:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8828310E45F
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 08:37:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D61D7B8107A;
 Tue,  5 Sep 2023 08:37:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23C7FC433C9;
 Tue,  5 Sep 2023 08:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693903051;
 bh=QGLTwQmix6rRanJl/sGcF5yEISkww7AdkcJuyc5MWok=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sXCYxEq6HBPQy+2VM0dY3qmalCsYkiQzM7lLEFTswz+gRtoq5AUFPxXNvQPpGCEdg
 UM8AG+a6a6zNcOZCR/m+kEjuft6DwOTPG7CpMCR4UkawvudJSFBo/jDTril2lpN6Tz
 0aQn9UqtzLM8mczwOyGVUjlh+KdBv/m6gcpa44b74NhgqHF0lh9RrJXDacIYDNqmdv
 V8oR7RkY3Tik+0vIKF+l6O3gXbRpwU76eUdgBnrYXoSd4AF3bGqKnwhgMfxrYUV9lL
 bJUcFxF81pjMS7PaShP9ynYzHcKunv2YUoqFbzOArb76z0qFWWTprkI4JUEmIMAOk5
 WQSnluBSd1XeA==
Date: Tue, 5 Sep 2023 10:37:28 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Ying Liu <victor.liu@nxp.com>
Subject: Re: [PATCH v14 RESEND 5/6] drm/imx: Introduce i.MX8qm/qxp DPU DRM
Message-ID: <uqu5h3ai7jz5mgh67aip7bxmhygvqqzblr4yzc3npp67m47ggc@6kqnsqwhd4hd>
References: <20230822085949.816844-1-victor.liu@nxp.com>
 <20230822085949.816844-6-victor.liu@nxp.com>
 <22parqvy44hkd2ypkglfwk6bafi5ov4qfhpvd6qnt36us7odec@iebwnwtwvnnf>
 <AM7PR04MB704659DF09143D0C6777143098E8A@AM7PR04MB7046.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <AM7PR04MB704659DF09143D0C6777143098E8A@AM7PR04MB7046.eurprd04.prod.outlook.com>
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

On Tue, Sep 05, 2023 at 03:32:47AM +0000, Ying Liu wrote:
> > On Tue, Aug 22, 2023 at 04:59:48PM +0800, Liu Ying wrote:
> > > +int dpu_cf_init(struct dpu_soc *dpu, unsigned int index,
> > > +		unsigned int id, enum dpu_unit_type type,
> > > +		unsigned long pec_base, unsigned long base)
> > > +{
> > > +	struct dpu_constframe *cf;
> > > +
> > > +	cf =3D devm_kzalloc(dpu->dev, sizeof(*cf), GFP_KERNEL);
> > > +	if (!cf)
> > > +		return -ENOMEM;
> > > +
> > > +	dpu->cf_priv[index] =3D cf;
> >=20
> > You can't store structures related to KMS in a device managed structure.
> > The DRM KMS device will stick around (and be accessible from userspace)
> > after the device has been removed until the last application closed its
> > file descriptor to the device.
>=20
> The DRM device is registered after component_bind_all() is called in
> dpu_drm_bind().  The CRTC components' platform devices are created
> in the dpu_core_probe() where the device managed resources are
> created.   So, it looks those resources are safe because the DRM device
> will be unregistered before those resources are freed.

Not, it's not, because the KMS device isn't freed when devices will be
unbound/removed, but when the last application closes its fd to it, and
so you'll get dangling pointers.

The general rule to get it right is to use drmm for anything but device
resources (like clocks, regulators, memory mapping, etc.). You can
deviate from the rule, of course, but you'll need a long and clear
explanation on why it doesn't work, and why your new approach works.
Your current approach doesn't though.

> > This can be checked by enabling KASAN and manually unbinding the driver
> > through sysfs.
>=20
> I enabled KASAN and manually unbound the dpu-core driver with command:
>=20
> echo 56180000.dpu > /sys/bus/platform/drivers/dpu-core/56180000.dpu/drive=
r/unbind=20
>=20
> KASAN didin't report memory issue regarding those device managed
> resources.  However, it did report another issue in dpu_drm_unbind(),
> where drm_device should be got from drv_data->drm_dev instead of
> dev_get_drvdata(dev).  I'll fix that in next version.
>=20
> BTW, the dpu-core driver was successfully bound again after unbinding with
> command:
>=20
> echo  56180000.dpu > /sys/bus/platform/drivers/dpu-core/bind

Guess you're lucky. That doesn't make it safe or right.

> > > +	cf->pec_base =3D devm_ioremap(dpu->dev, pec_base, SZ_16);
> > > +	if (!cf->pec_base)
> > > +		return -ENOMEM;
> > > +
> > > +	cf->base =3D devm_ioremap(dpu->dev, base, SZ_32);
> > > +	if (!cf->base)
> > > +		return -ENOMEM;
> >=20
> > For the same reason, you need to protect any access to a device managed
> > resource (so clocks, registers, regulators, etc.) by a call to
> > drm_dev_enter/drm_dev_exit and you need to call drm_dev_unplug instead
> > of drm_dev_unregister.
>=20
> That's a good point. I've tried to do that, but it turns out that the
> display controller cannot be enabled again after binding the dpu-core
> driver manually again. It seems that the display controller requires a
> proper disablement procedure, but the "driver instance overview " kdoc
> mentions the shortcoming of no proper disablement if drm_dev_unplug()
> is used:
>=20
> """
> * Drivers that want to support device unplugging (USB, DT overlay unload)=
 should
>  * use drm_dev_unplug() instead of drm_dev_unregister(). The driver must =
protect
>  * regions that is accessing device resources to prevent use after they're
>  * released. This is done using drm_dev_enter() and drm_dev_exit(). There=
 is one
>  * shortcoming however, drm_dev_unplug() marks the drm_device as unplugge=
d before
>  * drm_atomic_helper_shutdown() is called. This means that if the disable=
 code
>  * paths are protected, they will not run on regular driver module unload,
>  * possibly leaving the hardware enabled.
> """
>
> A DPU reset in dpu_core() might be helpful, but I'm not sure if there is =
any
> reset line provided by the embodying system.

Generally speaking, you shouldn't rely on the device being in any
particuliar state before your driver loads. So a reset at probe/bind
time is a good idea.

> Even if the reset works, the 2nd DPU instance in i.MX8qm would be a
> problem, because it won't be reset or properly disabled if the 1st DPU
> instance is unbound.

Why it wouldn't be reset?

> Although the two DPU instances could be wrapped by two DRM devices, I
> tend not to do that because downstream bridges in future SoCs might be
> able to mux to different DPU instances at runtime.
>
> Due to the disablement issue, can we set drm_dev_enter/exit/unplug
> aside first?

I'd rather have that figured out prior to merging.
> >
> > > +static int dpu_crtc_pm_runtime_put(struct dpu_crtc *dpu_crtc)
> > > +{
> > > +	int ret;
> > > +
> > > +	ret =3D pm_runtime_put(dpu_crtc->dev->parent);
> > > +	if (ret < 0)
> > > +		dpu_crtc_err(&dpu_crtc->base,
> > > +			     "failed to put parent device RPM: %d\n", ret);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static void dpu_crtc_mode_set_nofb(struct drm_crtc *crtc)
> > > +{
> > > +	struct dpu_crtc *dpu_crtc =3D to_dpu_crtc(crtc);
> > > +	struct drm_display_mode *adj =3D &crtc->state->adjusted_mode;
> > > +	enum dpu_link_id cf_link;
> > > +
> > > +	dpu_crtc_dbg(crtc, "mode " DRM_MODE_FMT "\n",
> > DRM_MODE_ARG(adj));
> > > +
> > > +	/* request power-on when we start to set mode for CRTC */
> > > +	dpu_crtc_pm_runtime_get_sync(dpu_crtc);
> >=20
> > From the drm_crtc_helper_funcs documentation:
> >=20
> > """
> > 	 * Note that the display pipe is completely off when this function is
> > 	 * called. Atomic drivers which need hardware to be running before
> > they
> > 	 * program the new display mode (e.g. because they implement
> > runtime PM)
> > 	 * should not use this hook. This is because the helper library calls
> > 	 * this hook only once per mode change and not every time the display
> > 	 * pipeline is suspended using either DPMS or the new "ACTIVE"
> > property.
> > 	 * Which means register values set in this callback might get reset
> > when
> > 	 * the CRTC is suspended, but not restored.  Such drivers should
> > instead
> > 	 * move all their CRTC setup into the @atomic_enable callback.
> > """
>=20
> I can use drm_atomic_helper_commit_tail() but not
> drm_atomic_helper_commit_tail_rpm() because the planes need to be
> updated prior to modeset_enables(where trigger shadow registers in
> plane's HW resources to take effect).   Using the former one means that
> RPM needs to be get/put in drm_atomic_helper_commit_planes(), which
> doesn't seem good because in some cases the power of the display controll=
er
> might be lost after RPM put and I'm not sure if the registers set there w=
ill
> be lost or not.   So, to avoid the issue the documentation mentions,
> crtc_state->mode_changed is forced to be true in dpu_crtc_atomic_check()
> if the CRTC is changed to active.  Is this acceptable?

No, just move the crtc setup to atomic_enable like the doc suggests.

> > > +static void dpu_crtc_atomic_enable(struct drm_crtc *crtc,
> > > +				   struct drm_atomic_state *state)
> > > +{
> > > +	struct dpu_crtc *dpu_crtc =3D to_dpu_crtc(crtc);
> > > +	unsigned long flags;
> > > +
> > > +	drm_crtc_vblank_on(crtc);
> > > +
> > > +	enable_irq(dpu_crtc->dec_shdld_irq);
> > > +	enable_irq(dpu_crtc->ed_cont_shdld_irq);
> > > +	enable_irq(dpu_crtc->ed_safe_shdld_irq);
> > > +
> > > +	dpu_fg_enable_clock(dpu_crtc->fg);
> > > +	dpu_ed_pec_sync_trigger(dpu_crtc->ed_cont);
> > > +	dpu_ed_pec_sync_trigger(dpu_crtc->ed_safe);
> > > +	if (crtc->state->gamma_lut)
> > > +		dpu_crtc_set_gammacor(dpu_crtc);
> > > +	else
> > > +		dpu_crtc_disable_gammacor(dpu_crtc);
> > > +	dpu_fg_shdtokgen(dpu_crtc->fg);
> > > +
> > > +	/* don't relinquish CPU until TCON is set to operation mode */
> > > +	local_irq_save(flags);
> > > +	preempt_disable();
> > > +	dpu_fg_enable(dpu_crtc->fg);
> >=20
> > That's super fishy. You shouldn't need that, at all. What is going on
> > there?
>=20
> This aims to fully workaround the below errata recently released by
> NXP.
>=20
> ERR010910: DC: Display Subsystem First Frame Programming Restriction
> Link: https://www.nxp.com/docs/en/errata/IMX8_1N94W.pdf
>=20
> In short, to make sure the display controller can be enabled properly with
> prefetch engine(DPRC + PRG), the TCON must be switch from bypass mode
> to operation mode after FrameGen(FG) generates the first frame.
>=20
> Timing is critical here, so local irq and preemption are disabled during =
the
> switch procedure.
>=20
> BTW, the driver always use prefetch engines for KMS, although they can
> be bypassed.

Ok. So I think it would help your driver getting merged to split that
workaround into a separate patch. It's hard to tell what are the
implications of that workaround on your driver when it's lost in the
middle of, well, the driver :)

I guess it would be much easier for everyone if you submitted that
driver without the errata handling, or with prefetch bypassed, at first.
And then you can submit / rework the hard parts.

> >=20
> > > +
> > > +	/*
> > > +	 * TKT320590:
> >=20
> > Those are NXP internal references as far as as I can tell. They
> > shouldn't be here.
>=20
> Ok, will change it to be ERR010910.

A link to the errata description would be a good idea too.

> > > +static void dpu_atomic_put_plane_state(struct drm_atomic_state *stat=
e,
> > > +				       struct drm_plane *plane)
> > > +{
> > > +	int index =3D drm_plane_index(plane);
> > > +
> > > +	plane->funcs->atomic_destroy_state(plane, state->planes[index].stat=
e);
> > > +	state->planes[index].ptr =3D NULL;
> > > +	state->planes[index].state =3D NULL;
> > > +	state->planes[index].old_state =3D NULL;
> > > +	state->planes[index].new_state =3D NULL;
> > > +
> > > +	drm_modeset_unlock(&plane->mutex);
> > > +
> > > +	dpu_plane_dbg(plane, "put state\n");
> > > +}
> > > +
> > > +static void dpu_atomic_put_crtc_state(struct drm_atomic_state *state,
> > > +				      struct drm_crtc *crtc)
> > > +{
> > > +	int index =3D drm_crtc_index(crtc);
> > > +
> > > +	crtc->funcs->atomic_destroy_state(crtc, state->crtcs[index].state);
> > > +	state->crtcs[index].ptr =3D NULL;
> > > +	state->crtcs[index].state =3D NULL;
> > > +	state->crtcs[index].old_state =3D NULL;
> > > +	state->crtcs[index].new_state =3D NULL;
> > > +
> > > +	drm_modeset_unlock(&crtc->mutex);
> > > +
> > > +	dpu_crtc_dbg(crtc, "put state\n");
> > > +}
> > > +
> > > +static void
> > > +dpu_atomic_put_possible_states_per_crtc(struct drm_crtc_state
> > *crtc_state)
> > > +{
> > > +	struct drm_atomic_state *state =3D crtc_state->state;
> > > +	struct drm_crtc *crtc =3D crtc_state->crtc;
> > > +	struct drm_plane *plane;
> > > +	struct drm_plane_state *old_plane_state, *new_plane_state;
> > > +	struct dpu_plane_state *old_dpstate, *new_dpstate;
> > > +
> > > +	drm_atomic_crtc_state_for_each_plane(plane, crtc_state) {
> > > +		old_plane_state =3D drm_atomic_get_old_plane_state(state,
> > plane);
> > > +		new_plane_state =3D drm_atomic_get_new_plane_state(state,
> > plane);
> > > +
> > > +		old_dpstate =3D to_dpu_plane_state(old_plane_state);
> > > +		new_dpstate =3D to_dpu_plane_state(new_plane_state);
> > > +
> > > +		/* Should be enough to check the below HW plane resources.
> > */
> > > +		if (old_dpstate->stage.ptr !=3D new_dpstate->stage.ptr ||
> > > +		    old_dpstate->source !=3D new_dpstate->source ||
> > > +		    old_dpstate->blend !=3D new_dpstate->blend)
> > > +			return;
> > > +	}
> > > +
> > > +	drm_atomic_crtc_state_for_each_plane(plane, crtc_state)
> > > +		dpu_atomic_put_plane_state(state, plane);
> > > +
> > > +	dpu_atomic_put_crtc_state(state, crtc);
> > > +}
> >=20
> > That's super suspicious too. Are you really going around and dropping
> > and destroying plane and crtc states in a global state?
>=20
> Yes.

That's really not a good idea. Adding states are fine, dropping ones
aren't.

> >=20
> > At the very least, you need to describe what this addresses and why you
> > think it's a good solution.
>=20
> This is the solution to assign HW resources of a plane group to the two C=
RTCs
> in one DPU or one CRTC group _dynamically_ at runtime.  Dpu.h has some
> comments which hint this:
>=20
> """
> /*
>  * fetchunit/scaler/layerblend resources of a plane group are
>  * shared by the two CRTCs in a CRTC group
>  */
> """
>=20
> I can add a DPU display controller block diagram in dpu_kms.c to tell the=
 HW
> architecture and some SW architecture to clarify this more.

It's not so much the diagram that I'm looking for, but an accurate
description of the problem. What resource is there, why and how does it
need to be shared, so we can understand what you are doing there, and
possibly suggest other things.

Maxime

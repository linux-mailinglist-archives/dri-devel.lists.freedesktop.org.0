Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7394D784165
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 14:59:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9225510E355;
	Tue, 22 Aug 2023 12:59:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E79D810E355
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 12:59:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 448EF6563E;
 Tue, 22 Aug 2023 12:59:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1152AC433C9;
 Tue, 22 Aug 2023 12:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692709157;
 bh=NQnhsHYpEv0+wR6qYs89EorxUXngM3591u/SXhXnpPA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NU+NjR2QBirg2yiQcLKcEeJPPlKzQlnyqnFpax4rg/sjpJ7Kyomn8+flnySjkToDa
 VH/7OSAe0ewPkiTra6TUNbgl4SfrsmOuJGq0JQba2tlzvDFsGY/P/RPq/1yyjxIX46
 QzjXRJeH3rru6VzMBTBGGy1JV6DkIxGQCktQlV0k1Dh7U4heVQpRczjxQVtG7J/+dH
 94tTcZj7ezySR4iPHucakIyaYZd+/LyEgD6gtb4HdCSBa7fp7BgJZVoBgFYv51V2RV
 t5FmQH/77qbmJCZOciFQvgdhynQxUDDrg0oFZYTcFSDOfL9tbSwFUXaSLlCSRs9W9V
 elxA5zMpzgFIA==
Date: Tue, 22 Aug 2023 14:59:14 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v14 RESEND 5/6] drm/imx: Introduce i.MX8qm/qxp DPU DRM
Message-ID: <22parqvy44hkd2ypkglfwk6bafi5ov4qfhpvd6qnt36us7odec@iebwnwtwvnnf>
References: <20230822085949.816844-1-victor.liu@nxp.com>
 <20230822085949.816844-6-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wky7filj2ecrfgcp"
Content-Disposition: inline
In-Reply-To: <20230822085949.816844-6-victor.liu@nxp.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, tzimmermann@suse.de,
 marcel.ziswiler@toradex.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, linux-imx@nxp.com, laurentiu.palcu@oss.nxp.com,
 guido.gunther@puri.sm, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--wky7filj2ecrfgcp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Aside from the discussion on the binding and the general architecture, I
have some comments there.

On Tue, Aug 22, 2023 at 04:59:48PM +0800, Liu Ying wrote:
> +int dpu_cf_init(struct dpu_soc *dpu, unsigned int index,
> +		unsigned int id, enum dpu_unit_type type,
> +		unsigned long pec_base, unsigned long base)
> +{
> +	struct dpu_constframe *cf;
> +
> +	cf =3D devm_kzalloc(dpu->dev, sizeof(*cf), GFP_KERNEL);
> +	if (!cf)
> +		return -ENOMEM;
> +
> +	dpu->cf_priv[index] =3D cf;

You can't store structures related to KMS in a device managed structure.
The DRM KMS device will stick around (and be accessible from userspace)
after the device has been removed until the last application closed its
file descriptor to the device.

This can be checked by enabling KASAN and manually unbinding the driver
through sysfs.

> +	cf->pec_base =3D devm_ioremap(dpu->dev, pec_base, SZ_16);
> +	if (!cf->pec_base)
> +		return -ENOMEM;
> +
> +	cf->base =3D devm_ioremap(dpu->dev, base, SZ_32);
> +	if (!cf->base)
> +		return -ENOMEM;

For the same reason, you need to protect any access to a device managed
resource (so clocks, registers, regulators, etc.) by a call to
drm_dev_enter/drm_dev_exit and you need to call drm_dev_unplug instead
of drm_dev_unregister.

> +static int dpu_crtc_pm_runtime_get_sync(struct dpu_crtc *dpu_crtc)
> +{
> +	int ret;
> +
> +	ret =3D pm_runtime_get_sync(dpu_crtc->dev->parent);
> +	if (ret < 0) {
> +		pm_runtime_put_noidle(dpu_crtc->dev->parent);
> +		dpu_crtc_err(&dpu_crtc->base,
> +			     "failed to get parent device RPM sync: %d\n", ret);
> +	}
> +
> +	return ret;
> +}

That's pm_runtime_resume_and_get.

> +static int dpu_crtc_pm_runtime_put(struct dpu_crtc *dpu_crtc)
> +{
> +	int ret;
> +
> +	ret =3D pm_runtime_put(dpu_crtc->dev->parent);
> +	if (ret < 0)
> +		dpu_crtc_err(&dpu_crtc->base,
> +			     "failed to put parent device RPM: %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static void dpu_crtc_mode_set_nofb(struct drm_crtc *crtc)
> +{
> +	struct dpu_crtc *dpu_crtc =3D to_dpu_crtc(crtc);
> +	struct drm_display_mode *adj =3D &crtc->state->adjusted_mode;
> +	enum dpu_link_id cf_link;
> +
> +	dpu_crtc_dbg(crtc, "mode " DRM_MODE_FMT "\n", DRM_MODE_ARG(adj));
> +
> +	/* request power-on when we start to set mode for CRTC */
> +	dpu_crtc_pm_runtime_get_sync(dpu_crtc);

=46rom the drm_crtc_helper_funcs documentation:

"""
	 * Note that the display pipe is completely off when this function is
	 * called. Atomic drivers which need hardware to be running before they
	 * program the new display mode (e.g. because they implement runtime PM)
	 * should not use this hook. This is because the helper library calls
	 * this hook only once per mode change and not every time the display
	 * pipeline is suspended using either DPMS or the new "ACTIVE" property.
	 * Which means register values set in this callback might get reset when
	 * the CRTC is suspended, but not restored.  Such drivers should instead
	 * move all their CRTC setup into the @atomic_enable callback.
"""

> +static void dpu_crtc_atomic_enable(struct drm_crtc *crtc,
> +				   struct drm_atomic_state *state)
> +{
> +	struct dpu_crtc *dpu_crtc =3D to_dpu_crtc(crtc);
> +	unsigned long flags;
> +
> +	drm_crtc_vblank_on(crtc);
> +
> +	enable_irq(dpu_crtc->dec_shdld_irq);
> +	enable_irq(dpu_crtc->ed_cont_shdld_irq);
> +	enable_irq(dpu_crtc->ed_safe_shdld_irq);
> +
> +	dpu_fg_enable_clock(dpu_crtc->fg);
> +	dpu_ed_pec_sync_trigger(dpu_crtc->ed_cont);
> +	dpu_ed_pec_sync_trigger(dpu_crtc->ed_safe);
> +	if (crtc->state->gamma_lut)
> +		dpu_crtc_set_gammacor(dpu_crtc);
> +	else
> +		dpu_crtc_disable_gammacor(dpu_crtc);
> +	dpu_fg_shdtokgen(dpu_crtc->fg);
> +
> +	/* don't relinquish CPU until TCON is set to operation mode */
> +	local_irq_save(flags);
> +	preempt_disable();
> +	dpu_fg_enable(dpu_crtc->fg);

That's super fishy. You shouldn't need that, at all. What is going on
there?

> +
> +	/*
> +	 * TKT320590:

Those are NXP internal references as far as as I can tell. They
shouldn't be here.

> +	 * Turn TCON into operation mode as soon as the first dumb
> +	 * frame is generated by DPU(we don't relinquish CPU to ensure
> +	 * this).  This makes DPR/PRG be able to evade the frame.
> +	 */
> +	DPU_CRTC_WAIT_FOR_FRAMEGEN_FRAME_CNT_MOVING(dpu_crtc->fg);
> +	dpu_tcon_set_operation_mode(dpu_crtc->tcon);
> +	local_irq_restore(flags);
> +	preempt_enable();
> +
> +	DPU_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(ed_safe_shdld_done);
> +	DPU_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(ed_cont_shdld_done);
> +	DPU_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_shdld_done);
> +
> +	disable_irq(dpu_crtc->ed_safe_shdld_irq);
> +	disable_irq(dpu_crtc->ed_cont_shdld_irq);
> +	disable_irq(dpu_crtc->dec_shdld_irq);
> +
> +	DPU_CRTC_WAIT_FOR_FRAMEGEN_SECONDARY_SYNCUP(dpu_crtc->fg);

The dance around the interrupts doesn't look great either. This need a
proper description of the problem this was trying to solve. Also, what
happens if any of those interrupts fail to trigger before you timeout?

> +	DPU_CRTC_CHECK_FRAMEGEN_FIFO(dpu_crtc->fg);
> +
> +	dpu_crtc_queue_state_event(crtc);
> +}
> +
> +static void dpu_crtc_atomic_disable(struct drm_crtc *crtc,
> +				    struct drm_atomic_state *state)
> +{
> +	struct dpu_crtc *dpu_crtc =3D to_dpu_crtc(crtc);
> +	struct drm_plane *plane;
> +	struct drm_plane_state *old_plane_state;
> +	struct dpu_plane_state *old_dpstate;
> +	struct dpu_fetchunit *fu;
> +	struct dpu_dprc *dprc;
> +	const struct dpu_fetchunit_ops *fu_ops;
> +	unsigned long flags;
> +	int i;
> +
> +	enable_irq(dpu_crtc->dec_seq_complete_irq);
> +
> +	/* don't relinquish CPU until DPRC repeat_en is disabled */
> +	local_irq_save(flags);
> +	preempt_disable();
> +	/*
> +	 * Sync to FrameGen frame counter moving so that
> +	 * FrameGen can be disabled in the next frame.
> +	 */
> +	DPU_CRTC_WAIT_FOR_FRAMEGEN_FRAME_CNT_MOVING(dpu_crtc->fg);
> +	dpu_fg_disable(dpu_crtc->fg);
> +	/*
> +	 * There is one frame leftover after FrameGen disablement.
> +	 * Sync to FrameGen frame counter moving so that
> +	 * DPRC repeat_en can be disabled in the next frame.
> +	 */
> +	DPU_CRTC_WAIT_FOR_FRAMEGEN_FRAME_CNT_MOVING(dpu_crtc->fg);
> +
> +	for_each_old_plane_in_state(state, plane, old_plane_state, i) {
> +		old_dpstate =3D to_dpu_plane_state(old_plane_state);
> +
> +		if (!old_plane_state->fb)
> +			continue;
> +
> +		if (old_plane_state->crtc !=3D crtc)
> +			continue;
> +
> +		fu =3D old_dpstate->source;
> +
> +		fu_ops =3D dpu_fu_get_ops(fu);
> +
> +		dprc =3D fu_ops->get_dprc(fu);
> +		dpu_dprc_disable_repeat_en(dprc);
> +	}
> +
> +	local_irq_restore(flags);
> +	preempt_enable();
> +
> +	DPU_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_seq_complete_done);
> +
> +	disable_irq(dpu_crtc->dec_seq_complete_irq);
> +
> +	dpu_fg_disable_clock(dpu_crtc->fg);
> +
> +	drm_crtc_vblank_off(crtc);
> +
> +	spin_lock_irq(&crtc->dev->event_lock);
> +	if (crtc->state->event && !crtc->state->active) {
> +		drm_crtc_send_vblank_event(crtc, crtc->state->event);
> +		crtc->state->event =3D NULL;
> +	}
> +	spin_unlock_irq(&crtc->dev->event_lock);
> +
> +	/* request power-off when CRTC is disabled */
> +	dpu_crtc_pm_runtime_put(dpu_crtc);
> +}

Same story than in atomic_enable here.


> +static int legacyfb_depth =3D 32;
> +module_param(legacyfb_depth, uint, 0444);

No custom module parameter

> +static void dpu_atomic_put_plane_state(struct drm_atomic_state *state,
> +				       struct drm_plane *plane)
> +{
> +	int index =3D drm_plane_index(plane);
> +
> +	plane->funcs->atomic_destroy_state(plane, state->planes[index].state);
> +	state->planes[index].ptr =3D NULL;
> +	state->planes[index].state =3D NULL;
> +	state->planes[index].old_state =3D NULL;
> +	state->planes[index].new_state =3D NULL;
> +
> +	drm_modeset_unlock(&plane->mutex);
> +
> +	dpu_plane_dbg(plane, "put state\n");
> +}
> +
> +static void dpu_atomic_put_crtc_state(struct drm_atomic_state *state,
> +				      struct drm_crtc *crtc)
> +{
> +	int index =3D drm_crtc_index(crtc);
> +
> +	crtc->funcs->atomic_destroy_state(crtc, state->crtcs[index].state);
> +	state->crtcs[index].ptr =3D NULL;
> +	state->crtcs[index].state =3D NULL;
> +	state->crtcs[index].old_state =3D NULL;
> +	state->crtcs[index].new_state =3D NULL;
> +
> +	drm_modeset_unlock(&crtc->mutex);
> +
> +	dpu_crtc_dbg(crtc, "put state\n");
> +}
> +
> +static void
> +dpu_atomic_put_possible_states_per_crtc(struct drm_crtc_state *crtc_stat=
e)
> +{
> +	struct drm_atomic_state *state =3D crtc_state->state;
> +	struct drm_crtc *crtc =3D crtc_state->crtc;
> +	struct drm_plane *plane;
> +	struct drm_plane_state *old_plane_state, *new_plane_state;
> +	struct dpu_plane_state *old_dpstate, *new_dpstate;
> +
> +	drm_atomic_crtc_state_for_each_plane(plane, crtc_state) {
> +		old_plane_state =3D drm_atomic_get_old_plane_state(state, plane);
> +		new_plane_state =3D drm_atomic_get_new_plane_state(state, plane);
> +
> +		old_dpstate =3D to_dpu_plane_state(old_plane_state);
> +		new_dpstate =3D to_dpu_plane_state(new_plane_state);
> +
> +		/* Should be enough to check the below HW plane resources. */
> +		if (old_dpstate->stage.ptr !=3D new_dpstate->stage.ptr ||
> +		    old_dpstate->source !=3D new_dpstate->source ||
> +		    old_dpstate->blend !=3D new_dpstate->blend)
> +			return;
> +	}
> +
> +	drm_atomic_crtc_state_for_each_plane(plane, crtc_state)
> +		dpu_atomic_put_plane_state(state, plane);
> +
> +	dpu_atomic_put_crtc_state(state, crtc);
> +}

That's super suspicious too. Are you really going around and dropping
and destroying plane and crtc states in a global state?

At the very least, you need to describe what this addresses and why you
think it's a good solution.

I kind of skimmed over the last part of the driver, but we should really
address these first comments. There's a larger discussion on the fact
that this driver does much more that it should and needs to (especially in
atomic_check, but not only), and this applies to the rest of patch.

Maxime

--wky7filj2ecrfgcp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZOSxIgAKCRDj7w1vZxhR
xRPKAQDfGQujKvGGeiil+w1sRh6m1U2aSqMZHU9v1P2C53IbdgD/ZAf/ThWDMcCL
TM81+DKBwG9rd0p0F0AqOcmmT4N7aw0=
=oLV3
-----END PGP SIGNATURE-----

--wky7filj2ecrfgcp--

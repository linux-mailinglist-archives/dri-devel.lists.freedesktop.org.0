Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5377F99F7F8
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 22:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ABAA10E24E;
	Tue, 15 Oct 2024 20:14:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="N3q2vmdC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 29886 seconds by postgrey-1.36 at gabe;
 Tue, 15 Oct 2024 20:13:56 UTC
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00BC810E24E
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 20:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1729023234; x=1729282434;
 bh=oWZAEWmWn11pICS2WghDTqvtxTlwbis+AKwY8WLaaII=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=N3q2vmdCHEAzWfagD0SM+pZXcpUTWCzquQH0AbCpxZsxZolcyASpe6qALHsApCvzz
 fMmbnbAxPk3OpMQBg5kjZKRlUVT49Kd/Yo08Q9Ny5sUbUV0jX9/xbWDIH3tL8n291d
 GAMWj0pFpnMrQnKbeDuJFNEUkr5rlR5ZRPux5cGyrqkeEjOoHsWKg7p+hWerSWt+iS
 RLx/sOeAee0DWR6ZDooP1b3G1A3Obq6adcwyK8XftOREDpCrmc2x7Ylg2F9IWTRvuB
 NE/ltpZ+2dtazvzEWM4MYLC1UXGVADuQFVyrzLmaUGomvY7xeB1oTT/xo/U4P0Btk5
 rjcTlzl9Bso6Q==
Date: Tue, 15 Oct 2024 20:13:40 +0000
To: Andy Yan <andyshrk@163.com>
From: Piotr Zalewski <pZ010001011111@proton.me>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 Daniel Stone <daniel@fooishbar.org>, Dragan Simic <dsimic@manjaro.org>,
 Diederik de Haas <didi.debian@cknow.org>
Subject: Re:Re:[PATCH v5] rockchip/drm: vop2: add support for gamma LUT
Message-ID: <1974DYrs9gLrQrZ5VwCglFgKDDK686iyqnS_g6uPB-s9wZ_4CqfZXPjmYWihLgrkRu7ptNjpkFeqB0uTt73RFId6cL8FowQ8LFltPmaKCoI=@proton.me>
In-Reply-To: <30940542.b36d.19290215124.Coremail.andyshrk@163.com>
References: <20241014222022.571819-4-pZ010001011111@proton.me>
 <7b45f190.452f.1928e41b746.Coremail.andyshrk@163.com>
 <o_Cyz_ARcHj4zNlovv75MBwslIRhn3YWlscoNrlpLVobh7eWIMEQR5bNv0yhHx2KEx_gbYi_gH-8Y-CdvRZs9lZscz3-lhAbM50GXUdtSKY=@proton.me>
 <30940542.b36d.19290215124.Coremail.andyshrk@163.com>
Feedback-ID: 53478694:user:proton
X-Pm-Message-ID: 932c22f934c19cba4c98a2e1488d80d40e7faf7a
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Hi Andy

On Tuesday, October 15th, 2024 at 2:22 PM, Andy Yan <andyshrk@163.com> wrot=
e:

> > > > + struct vop2_video_port *vp,
> > > > + struct drm_crtc *crtc,
> > > > + struct drm_crtc_state *crtc_state)
> > > > +{
> > > > +
> > > > + if (vop2->lut_regs && crtc_state->color_mgmt_changed) {
> > > > + if (!crtc_state->gamma_lut) {
> > > > + vop2_vp_dsp_lut_disable(vp);
> > > > + return;
> > > > + }
> > > > +
> > > > + if (vop2_supports_seamless_gamma_lut_update(vop2)) {
> > >=20
> > > I think it's bettery to check for rk3568/rk3566 here, the newer soc w=
ill all follow
> > > rk3588 support seamless gamma lut update.
> >=20
> > I will change in the next version.
> >=20
> > > > + vop2_writel(vop2, RK3568_LUT_PORT_SEL, FIELD_PREP(
> > > > + RK3588_LUT_PORT_SEL__GAMMA_AHB_WRITE_SEL,
> > > > + vp->id));
> > > > + vop2_crtc_write_gamma_lut(vop2, crtc);
> > > > + vop2_vp_dsp_lut_enable(vp);
> > > > + vop2_vp_dsp_lut_update_enable(vp);
> > > > + } else {
> > >=20
> > > As for rk3566/68, we should do exclusive check here, because there is=
 only
> > > one gamma , only one VP can use it at a time. See my comments in V3:
> >=20
> > What do you mean exactly by exclusive check in this case.It's true that
> > gamma LUT is shared across video ports in rk356x but, if I correctly
> > understand, this doesn't forbid to reprogram LUT port sel and allow oth=
er
> > VP to use gamma LUT.
>=20
>=20
> Yes, we can reprogram LUT port sel, but we need to make sure the the dsp_=
lut_en bit in VPx is cleared if we
> want reprogram LUT port sel form VPx to VPy.
>=20

Ok I get it now. Is such rework correct? - when gamma LUT for rk356x is
being set, instead of disabling the LUT before the gamma LUT write for the
current CRTC's video port, active video port is selected. Selection is=20
based on if DSP LUT EN bit is set for particular video port. eg:
```
static struct vop2_video_port *vop2_vp_dsp_lut_get_active_vp(struct vop2 *v=
op2)
{
=09struct vop2_video_port *vp;
=09int i;
=09for (i =3D 0; i < vop2->data->nr_vps; i++) {
=09=09vp =3D &vop2->vps[i];

=09=09if (vp->crtc.dev !=3D NULL && vop2_vp_dsp_lut_is_enabled(vp)) {
=09=09=09return vp;
=09=09}
=09}
=09return NULL;
}

(...)

struct vop2_video_port *active_vp =3D vop2_vp_dsp_lut_get_active_vp(vop2);

if (active_vp) {
=09vop2_vp_dsp_lut_disable(active_vp);
=09vop2_cfg_done(active_vp);
=09if (!vop2_vp_dsp_lut_poll_disable(active_vp))
=09=09return;
}

vop2_writel(vop2, RK3568_LUT_PORT_SEL, vp->id);
vop2_crtc_write_gamma_lut(vop2, crtc);
vop2_vp_dsp_lut_enable(vp);
```


> > > >=20
> > > > drm_crtc_helper_add(&vp->crtc, &vop2_crtc_helper_funcs);
> > > > + if (vop2->lut_regs && vp->crtc.dev !=3D NULL) {
> > > > + const struct vop2_video_port_data *vp_data =3D &vop2_data->vp[vp-=
>id];
> > > >=20
> > > > + drm_mode_crtc_set_gamma_size(&vp->crtc, vp_data->gamma_lut_len);
> > > > + drm_crtc_enable_color_mgmt(&vp->crtc, 0, false,
> > > > + vp_data->gamma_lut_len);
> > >=20
> > > It seems that we can keep it in one line, the default limit of linux =
kernel coding style is 100 characters now.
> >=20
> > Thanks. I didn't know, I will amend it.
>=20
>=20
> See bdc48fa11e46("checkpatch/coding-style: deprecate 80-column warning")
>=20

Interesting.

Best regards, Piotr Zalewski

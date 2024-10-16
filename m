Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEF79A02D4
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 09:41:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6276910E2D9;
	Wed, 16 Oct 2024 07:41:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="SWtnfV63";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1F110E2D9
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 07:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=xe6nzfvlircj5kocrctll7wjem.protonmail; t=1729064473; x=1729323673;
 bh=WBqU85m9Ti/DOVK4GDxcS1oYMUigiYcVjnfAVIM/0ts=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=SWtnfV63fxtXTKLvIwzbicYr1PUFnRYswDjgrTQO0juL2Ec0C6JpNnDo0S4OzWt76
 ycXxgN+irOU6imXHocPq4CbHrbBmQ4QBVS/MAS52T6LBLTrKVed4pGgCt5nOIXpkIe
 Ex6e3tmzwEKy+G4WSM1JZh8NE1ZlipYZ9MWeR3y39sj3LaC9e9mT7J2u0DTeggygBQ
 5vSoLGsi9mNcTnM4Ua9PAkqA73IUZiHlpmhWrpkWu0OHDmttf00RfRwsZ3uBBjKJUq
 EP0w23AtlFslgmSmA3NPHLbZq6BlBs01yb2CzKhV/8W/0+cjX0rip04s70Exh/kE/l
 LboyTIAPMuJUg==
Date: Wed, 16 Oct 2024 07:41:09 +0000
To: Andy Yan <andyshrk@163.com>
From: Piotr Zalewski <pZ010001011111@proton.me>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 Daniel Stone <daniel@fooishbar.org>, Dragan Simic <dsimic@manjaro.org>,
 Diederik de Haas <didi.debian@cknow.org>
Subject: Re:Re:Re:[PATCH v5] rockchip/drm: vop2: add support for gamma LUT
Message-ID: <rCXfMQ7epSo6CgnBpBcowcSa1ndRRyfEaDJLFhS4w2-S047bVknK4vU1_qPR7h1ho8SznXj5dYrBHRUmQe-MICdSB0OLm0P-N48lQzgWnfI=@proton.me>
In-Reply-To: <1ae9f15d.e52.19292e05e73.Coremail.andyshrk@163.com>
References: <20241014222022.571819-4-pZ010001011111@proton.me>
 <7b45f190.452f.1928e41b746.Coremail.andyshrk@163.com>
 <o_Cyz_ARcHj4zNlovv75MBwslIRhn3YWlscoNrlpLVobh7eWIMEQR5bNv0yhHx2KEx_gbYi_gH-8Y-CdvRZs9lZscz3-lhAbM50GXUdtSKY=@proton.me>
 <30940542.b36d.19290215124.Coremail.andyshrk@163.com>
 <1974DYrs9gLrQrZ5VwCglFgKDDK686iyqnS_g6uPB-s9wZ_4CqfZXPjmYWihLgrkRu7ptNjpkFeqB0uTt73RFId6cL8FowQ8LFltPmaKCoI=@proton.me>
 <1ae9f15d.e52.19292e05e73.Coremail.andyshrk@163.com>
Feedback-ID: 53478694:user:proton
X-Pm-Message-ID: 7a40e25b17dc013dde54f5a6c09d5b6982929d71
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

Hi Andy,

On Wednesday, October 16th, 2024 at 3:10 AM, Andy Yan <andyshrk@163.com> wr=
ote:

> Hi Piotr,
>=20
> At 2024-10-16 04:13:40, "Piotr Zalewski" pZ010001011111@proton.me wrote:
>=20
> > Hi Andy
> >=20
> > On Tuesday, October 15th, 2024 at 2:22 PM, Andy Yan andyshrk@163.com wr=
ote:
> >=20
> > > > > > + struct vop2_video_port *vp,
> > > > > > + struct drm_crtc *crtc,
> > > > > > + struct drm_crtc_state *crtc_state)
> > > > > > +{
> > > > > > +
> > > > > > + if (vop2->lut_regs && crtc_state->color_mgmt_changed) {
> > > > > > + if (!crtc_state->gamma_lut) {
> > > > > > + vop2_vp_dsp_lut_disable(vp);
> > > > > > + return;
> > > > > > + }
> > > > > > +
> > > > > > + if (vop2_supports_seamless_gamma_lut_update(vop2)) {
> > > > >=20
> > > > > I think it's bettery to check for rk3568/rk3566 here, the newer s=
oc will all follow
> > > > > rk3588 support seamless gamma lut update.
> > > >=20
> > > > I will change in the next version.
> > > >=20
> > > > > > + vop2_writel(vop2, RK3568_LUT_PORT_SEL, FIELD_PREP(
> > > > > > + RK3588_LUT_PORT_SEL__GAMMA_AHB_WRITE_SEL,
> > > > > > + vp->id));
> > > > > > + vop2_crtc_write_gamma_lut(vop2, crtc);
> > > > > > + vop2_vp_dsp_lut_enable(vp);
> > > > > > + vop2_vp_dsp_lut_update_enable(vp);
> > > > > > + } else {
> > > > >=20
> > > > > As for rk3566/68, we should do exclusive check here, because ther=
e is only
> > > > > one gamma , only one VP can use it at a time. See my comments in =
V3:
> > > >=20
> > > > What do you mean exactly by exclusive check in this case.It's true =
that
> > > > gamma LUT is shared across video ports in rk356x but, if I correctl=
y
> > > > understand, this doesn't forbid to reprogram LUT port sel and allow=
 other
> > > > VP to use gamma LUT.
> > >=20
> > > Yes, we can reprogram LUT port sel, but we need to make sure the the =
dsp_lut_en bit in VPx is cleared if we
> > > want reprogram LUT port sel form VPx to VPy.
> >=20
> > Ok I get it now. Is such rework correct? - when gamma LUT for rk356x is
> > being set, instead of disabling the LUT before the gamma LUT write for =
the
> > current CRTC's video port, active video port is selected. Selection is
> > based on if DSP LUT EN bit is set for particular video port. eg:
>=20
>=20
> If the userspace want to set gamma for CRTCx, then that is indeed where t=
hey want to set the
> gamma on=E3=80=82The driver silently sets the gamma on another CRTC, whic=
h is not what the user wants.

Hello maybe there is some misunderstanding, here is full version of my rewo=
rk
```

> I think there are two options=EF=BC=9A
> =EF=BC=881=EF=BC=89return a error if gamma is enable on other CRTC=
=EF=BC=8C this is what we done in our BSP code[1]
> (2) disable the dsp_lut on privious CRTC, then switch to the current CRTC=
 which userspace wants.
>=20
> [1]https://github.com/armbian/linux-rockchip/blob/rk3576-6.1-dev-2024_04_=
19/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c#L3666

Hmm ok in my solution I supposedo

> > ```
> > static struct vop2_video_port *vop2_vp_dsp_lut_get_active_vp(struct vop=
2 *vop2)
> > {
> > struct vop2_video_port *vp;
> > int i;
> > for (i =3D 0; i < vop2->data->nr_vps; i++) {
> > vp =3D &vop2->vps[i];
> >=20
> > if (vp->crtc.dev !=3D NULL && vop2_vp_dsp_lut_is_enabled(vp)) {
> > return vp;
> > }
> > }
> > return NULL;
> > }
> >=20
> > (...)
> >=20
> > struct vop2_video_port *active_vp =3D vop2_vp_dsp_lut_get_active_vp(vop=
2);
> >=20
> > if (active_vp) {
> > vop2_vp_dsp_lut_disable(active_vp);
> > vop2_cfg_done(active_vp);
> > if (!vop2_vp_dsp_lut_poll_disable(active_vp))
> > return;
> > }
> >=20
> > vop2_writel(vop2, RK3568_LUT_PORT_SEL, vp->id);
> > vop2_crtc_write_gamma_lut(vop2, crtc);
> > vop2_vp_dsp_lut_enable(vp);
> > ```

Best Regards, Piotr Zalewski


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1820E93EE48
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 09:16:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB0010E317;
	Mon, 29 Jul 2024 07:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="kTXns9Vm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4027.protonmail.ch (mail-4027.protonmail.ch [185.70.40.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5FCF10E2AD
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 19:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1722023404; x=1722282604;
 bh=sz0+I3FMgInKMnC4PUldoHC9RQA00Jgg7EykCegtURA=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=kTXns9VmMQtlQHgssjajlt624bqaZNSvMY8Ep5Pvu/Xk6Dzxt1ABSCducjIke4QXq
 6IeunaDmzBx8PWe8rhTAIsKxJJIuZZf82MyMMp3SYY4vQU6NiAMAqmxINGL7sgr3KS
 5C2KzFAJY5x5dDu/28hkkLhYT0Ivs1nEigNGlfyCPeJ+czfly9pP6svlmJSVW7oWlj
 NZKfjRtk8OioddpcxxlXaKQNvmY7MhGvpnRC5aIkDZTc3X46aQos3avQtlfVVkyfKC
 rfFjyQIfp/iDuXZkK++qiFpguJk5MSChwtsEuY2Kcau85S8RmJ2Y3PofghB8eBtQzK
 B8FCpm5hhJtXw==
Date: Fri, 26 Jul 2024 19:49:58 +0000
To: Andy Yan <andy.yan@rock-chips.com>
From: Piotr Zalewski <pZ010001011111@proton.me>
Cc: "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "heiko@sntech.de" <heiko@sntech.de>, "hjc@rock-chips.com" <hjc@rock-chips.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
Subject: Re: [PATCH v3] rockchip/drm: vop2: add support for gamma LUT
Message-ID: <KbOjWzFKMM_fwDora8CjaLFBHWypRP1Mk6nPzHkwNAGxFHzJIynx3W8_jyZvbygH99lRAXDdrJmdFEQuY8M2Ao-a8F42zt8no4B1DCBiQIs=@proton.me>
In-Reply-To: <ec283a7c-845b-4c58-8d86-cdd07862a0dc@rock-chips.com>
References: <TkgKVivuaLFLILPY-n3iZo_8KF-daKdqdu-0_e0HP-5Ar_8DALDeNWog2suwWKjX7eomcbGET0KZe7DlzdhK2YM6CbLbeKeFZr-MJzJMtw0=@proton.me>
 <ec283a7c-845b-4c58-8d86-cdd07862a0dc@rock-chips.com>
Feedback-ID: 53478694:user:proton
X-Pm-Message-ID: 2f1479280b5b37543d3358032d84e7dce51906f1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 29 Jul 2024 07:16:05 +0000
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


On Friday, July 26th, 2024 at 10:55 AM, Andy Yan <andy.yan@rock-chips.com> =
wrote:

> Hi Piotr

Hi Andy!

> Thanks for your work.
>=20
> On 7/25/24 06:05, Piotr Zalewski wrote:
>=20
> > Add support for gamma LUT in VOP2 driver. The implementation is based o=
n
> > the one found in VOP driver and modified to be compatible with VOP2. Bl=
ue
> > and red channels in gamma LUT register write were swapped with respect =
to
> > how gamma LUT values are written in VOP. Write of the current video por=
t id
> > to VOP2_SYS_LUT_PORT_SEL register was added before the write of DSP_LUT=
_EN
> > bit. Gamma size is set and drm color management is enabled for each vid=
eo
> > port's CRTC except ones which have no associated device. Tested on RK35=
66
> > (Pinetab2).
> >=20
> > Helped-by: Dragan Simic dsimic@manjaro.org
> > Signed-off-by: Piotr Zalewski pZ010001011111@proton.me
> > ---
> >=20
> > Notes:
> > Changes in v3:
> > - v3 is patch v2 "resend", by mistake the incremental patch were
> > sent in v2
> >=20
> > Changes in v2:
> > - Apply code styling corrections [1]
> > - Move gamma LUT write inside the vop2 lock
> >=20
> > Link to v2: https://lore.kernel.org/linux-rockchip/Hk03HDb6wSSHWtEFZHUy=
e06HR0-9YzP5nCHx9A8_kHzWSZawDrU1o1pjEGkCOJFoRg0nTB4BWEv6V0XBOjF4-0Mj44lp2Tr=
jaQfnytzp-Pk=3D@proton.me/T/#u
> > Link to v1: https://lore.kernel.org/linux-rockchip/9736eadf6a9d8e97eef9=
19c6b3d88828@manjaro.org/T/#t
> >=20
> > [1] https://lore.kernel.org/linux-rockchip/d019761504b540600d9fc7a585d6=
f95f@manjaro.org/
> >=20
> > diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu=
/drm/rockchip/rockchip_drm_vop2.c
> > index 9873172e3fd3..37fcf544a5fd 100644
> > --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > @@ -278,6 +278,15 @@ static u32 vop2_readl(struct vop2 *vop2, u32 offse=
t)
> > return val;
> > }
> >=20
> > +static u32 vop2_vp_read(struct vop2_video_port *vp, u32 offset)
> > +{
> > + u32 val;
> > +
> > + regmap_read(vp->vop2->map, vp->data->offset + offset, &val);
> > +
> > + return val;
> > +}
> > +
> > static void vop2_win_write(const struct vop2_win *win, unsigned int reg=
, u32 v)
> > {
> > regmap_field_write(win->reg[reg], v);
> > @@ -1482,6 +1491,95 @@ static bool vop2_crtc_mode_fixup(struct drm_crtc=
 *crtc,
> > return true;
> > }
> >=20
> > +static bool vop2_vp_dsp_lut_is_enabled(struct vop2_video_port *vp)
> > +{
> > + return (u32) (vop2_vp_read(vp, RK3568_VP_DSP_CTRL) & RK3568_VP_DSP_CT=
RL__DSP_LUT_EN) >
> > + 0;
> > +}
> > +
> > +static void vop2_vp_dsp_lut_enable(struct vop2_video_port *vp)
> > +{
> > + u32 dsp_ctrl =3D vop2_vp_read(vp, RK3568_VP_DSP_CTRL);
> > +
> > + dsp_ctrl |=3D RK3568_VP_DSP_CTRL__DSP_LUT_EN;
> > + vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
> > +}
> > +
> > +static void vop2_vp_dsp_lut_disable(struct vop2_video_port *vp)
> > +{
> > + u32 dsp_ctrl =3D vop2_vp_read(vp, RK3568_VP_DSP_CTRL);
> > +
> > + dsp_ctrl &=3D ~RK3568_VP_DSP_CTRL__DSP_LUT_EN;
> > + vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
> > +}
> > +
> > +static void vop2_crtc_write_gamma_lut(struct vop2 *vop2, struct drm_cr=
tc *crtc)
> > +{
> > + const struct vop2_video_port *vp =3D to_vop2_video_port(crtc);
> > + const struct vop2_video_port_data *vp_data =3D &vop2->data->vp[vp->id=
];
> > +
> > + struct drm_color_lut *lut =3D crtc->state->gamma_lut->data;
> > + unsigned int i, bpc =3D ilog2(vp_data->gamma_lut_len);
> > + u32 word;
> > +
> > + for (i =3D 0; i < crtc->gamma_size; i++) {
> > + word =3D (drm_color_lut_extract(lut[i].blue, bpc) << (2 * bpc)) |
> > + (drm_color_lut_extract(lut[i].green, bpc) << bpc) |
> > + drm_color_lut_extract(lut[i].red, bpc);
> > +
> > + writel(word, vop2->lut_regs + i * 4);
> > + }
> > +}
> > +
> > +static void vop2_crtc_gamma_set(struct vop2 *vop2, struct drm_crtc *cr=
tc,
> > + struct drm_crtc_state *old_state)
> > +{
> > + struct drm_crtc_state *state =3D crtc->state;
> > + struct vop2_video_port *vp =3D to_vop2_video_port(crtc);
> > + u32 dsp_ctrl;
> > + int ret;
> > +
> > + if (!vop2->lut_regs)
> > + return;
> > +
> > + if (!state->gamma_lut) {
>=20
>=20
> What's the purpose of checking !state->gamma_lut here,
>=20
> and you check it again at the end for return.
> This makes me very confused.

I understood it this way - since the vop2 lock is unlocked after disabling
gamma LUT, the CRTC state can change while waiting for DSP_LUT_EN bit to=20
be unset. With the change I sent in response to Daniel's reply, gamma LUT=
=20
state modification should now be fully atomic so there shouldn't be a need=
=20
for the second state check there anymore (if my logic is incorrect please=
=20
explain).

> > + /*
> > + * To disable gamma (gamma_lut is null) or to write
> > + * an update to the LUT, clear dsp_lut_en.
> > + /
> > + vop2_lock(vop2);
> > +
> > + vop2_vp_dsp_lut_disable(vp);
> > +
> > + vop2_cfg_done(vp);
> > + vop2_unlock(vop2);
> > + /
> > + * In order to write the LUT to the internal memory,
> > + * we need to first make sure the dsp_lut_en bit is cleared.
> > + */
> > + ret =3D readx_poll_timeout(vop2_vp_dsp_lut_is_enabled, vp, dsp_ctrl,
> > + !dsp_ctrl, 5, 30 * 1000);
> > +
> > + if (ret) {
> > + DRM_DEV_ERROR(vop2->dev, "display LUT RAM enable timeout!\n");
> > + return;
> > + }
> > +
> > + if (!state->gamma_lut)
> > + return;
> > + }
> > +
> > +
> > + vop2_lock(vop2);
> > + vop2_crtc_write_gamma_lut(vop2, crtc);
> > + vop2_writel(vp->vop2, RK3568_LUT_PORT_SEL, vp->id);
>=20
>=20
> We should select lut_port befor write gamma.
>=20
> And there is one thing to note here is that:
> There is only one gamma for rk3568/rk3566, that means only one
> of the three VPs can exclusively use it at a time, so we need
> a exclusive check for rk3568/rk3566.
>=20
> For rk3588 and the new soc, there is no such limination.
>=20
> The another thing to note is that for rk35588 and other new soc, no need =
to disable dsp_lut before write it.

Thank you for the clarification! I will change my patch according to these
facts.

> > +
> > + vop2_vp_dsp_lut_enable(vp);
> > +
> > + vop2_cfg_done(vp);
> > + vop2_unlock(vop2);
> > +}
> > +
> > static void vop2_dither_setup(struct drm_crtc *crtc, u32 *dsp_ctrl)
> > {
> > struct rockchip_crtc_state *vcstate =3D to_rockchip_crtc_state(crtc->st=
ate);
> > @@ -1925,6 +2023,7 @@ static void vop2_crtc_atomic_enable(struct drm_cr=
tc *crtc,
> > const struct vop2_data *vop2_data =3D vop2->data;
> > const struct vop2_video_port_data *vp_data =3D &vop2_data->vp[vp->id];
> > struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(sta=
te, crtc);
> > + struct drm_crtc_state *old_state =3D drm_atomic_get_old_crtc_state(st=
ate, crtc);
> > struct rockchip_crtc_state *vcstate =3D to_rockchip_crtc_state(crtc->st=
ate);
> > struct drm_display_mode *mode =3D &crtc->state->adjusted_mode;
> > unsigned long clock =3D mode->crtc_clock * 1000;
> > @@ -2060,6 +2159,9 @@ static void vop2_crtc_atomic_enable(struct drm_cr=
tc *crtc,
> > drm_crtc_vblank_on(crtc);
> >=20
> > vop2_unlock(vop2);
> > +
> > + if (crtc->state->gamma_lut)
> > + vop2_crtc_gamma_set(vop2, crtc, old_state);
> > }
> >=20
> > static int vop2_crtc_atomic_check(struct drm_crtc *crtc,
> > @@ -2070,6 +2172,16 @@ static int vop2_crtc_atomic_check(struct drm_crt=
c *crtc,
> > int nplanes =3D 0;
> > struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(sta=
te, crtc);
> >=20
> > + if (vp->vop2->lut_regs && crtc_state->color_mgmt_changed && crtc_stat=
e->gamma_lut) {
> > + unsigned int len =3D drm_color_lut_size(crtc_state->gamma_lut);
> > +
> > + if (len !=3D crtc->gamma_size) {
> > + DRM_DEBUG_KMS("Invalid LUT size; got %d, expected %d\n",
> > + len, crtc->gamma_size);
> > + return -EINVAL;
> > + }
> > + }
> > +
> > drm_atomic_crtc_state_for_each_plane(plane, crtc_state)
> > nplanes++;
> >=20
> > @@ -2459,6 +2571,10 @@ static void vop2_setup_dly_for_windows(struct vo=
p2 *vop2)
> > static void vop2_crtc_atomic_begin(struct drm_crtc *crtc,
> > struct drm_atomic_state *state)
> > {
> > + struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate,
> > + crtc);
> > + struct drm_crtc_state *old_crtc_state =3D drm_atomic_get_old_crtc_sta=
te(state,
> > + crtc);
> > struct vop2_video_port *vp =3D to_vop2_video_port(crtc);
> > struct vop2 *vop2 =3D vp->vop2;
> > struct drm_plane *plane;
> > @@ -2482,6 +2598,9 @@ static void vop2_crtc_atomic_begin(struct drm_crt=
c *crtc,
> > vop2_setup_layer_mixer(vp);
> > vop2_setup_alpha(vp);
> > vop2_setup_dly_for_windows(vop2);
> > +
> > + if (crtc_state->color_mgmt_changed && !crtc_state->active_changed)
> > + vop2_crtc_gamma_set(vop2, crtc, old_crtc_state);
> > }
> >=20
> > static void vop2_crtc_atomic_flush(struct drm_crtc *crtc,
> > @@ -2791,6 +2910,14 @@ static int vop2_create_crtcs(struct vop2 *vop2)
> >=20
> > drm_crtc_helper_add(&vp->crtc, &vop2_crtc_helper_funcs);
> >=20
> > + if (vop2->lut_regs && vp->crtc.dev !=3D NULL) {
> > + const struct vop2_video_port_data *vp_data =3D &vop2_data->vp[vp->id]=
;
> > +
> > + drm_mode_crtc_set_gamma_size(&vp->crtc, vp_data->gamma_lut_len);
> > + drm_crtc_enable_color_mgmt(&vp->crtc, 0, false,
> > + vp_data->gamma_lut_len);
> > + }
> > +
> > init_completion(&vp->dsp_hold_completion);
> > }
> >=20
> > diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu=
/drm/rockchip/rockchip_drm_vop2.h
> > index 615a16196aff..3a58b73fa876 100644
> > --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> > @@ -394,6 +394,7 @@ enum dst_factor_mode {
> > #define RK3568_REG_CFG_DONE__GLB_CFG_DONE_EN BIT(15)
> >=20
> > #define RK3568_VP_DSP_CTRL__STANDBY BIT(31)
> > +#define RK3568_VP_DSP_CTRL__DSP_LUT_EN BIT(28)
> > #define RK3568_VP_DSP_CTRL__DITHER_DOWN_MODE BIT(20)
> > #define RK3568_VP_DSP_CTRL__DITHER_DOWN_SEL GENMASK(19, 18)
> > #define RK3568_VP_DSP_CTRL__DITHER_DOWN_EN BIT(17)

Best regards, Piotr Zalewski

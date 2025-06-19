Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AFFAE0466
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 13:54:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC41910EA09;
	Thu, 19 Jun 2025 11:54:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="km3bVzcH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF5AF10EA09
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 11:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=itb3llscg5chjipokufu5vmc4u.protonmail; t=1750334056; x=1750593256;
 bh=Iz0J/KCDZc0l+Va2OMeieFNBnxG4UEBoIuugIS4vfeQ=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=km3bVzcHZg3BwGBm6/0yFFDtJOgSmPsr9f19NHWXq0rGo4y3zfyTibsiER2DzSDLY
 WvKp9NaQVeqCIcJCibg5Uq9gbO9ebT1w5rN2aj9kWLAxSDBmGzaNfqcrF6PzYFa/WC
 7q1cFaH1q01Eg0bgYeHtDy/Lz1M46EqYwBgireY8v+Vt4kmWTT+low5KxgnPc5nDSJ
 S5rmpHRF4ASOmQ6Pu0quwfRHr3apiuXJsq7CXJmI5pIlyey2WMneugPt3aDL8uAn5G
 lyDbBmvLiBeEu2HKRdwY0Pr1CWIVKxwBNFrbo2Pr08sLW8I6o0Wd0yEB5/u2OdUWnI
 I52n+oMdgtZCA==
Date: Thu, 19 Jun 2025 11:54:12 +0000
To: Andy Yan <andyshrk@163.com>
From: Piotr Zalewski <pZ010001011111@proton.me>
Cc: Diederik de Haas <didi.debian@cknow.org>, hjc@rock-chips.com,
 heiko@sntech.de, andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 Dang Huynh <danct12@riseup.net>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH drm-misc-next] rockchip/drm: vop2: don't check
 color_mgmt_changed in atomic_enable
Message-ID: <oT4pI24an4vFCCysHCInNVi7B-jsgNUVKs4olmiuQ4lWzdd0FS_nwMs-ja40ofjDElVARdad8I_eTG9tRXkgJos48eQmsWo13V5mgc-dXEg=@proton.me>
In-Reply-To: <562b38e5.a496.1975f09f983.Coremail.andyshrk@163.com>
References: <20241206192013.342692-3-pZ010001011111@proton.me>
 <DAI0A1Y753FJ.B0NMT8L5VPEH@cknow.org>
 <4b380a57.8ab2.197591815a8.Coremail.andyshrk@163.com>
 <DAISW8MXEU0G.3AMRSKNYQUJY8@cknow.org>
 <4e600374.6dc7.1975df03a2d.Coremail.andyshrk@163.com>
 <DAJNEG81JCU5.35KVU8KAT5MDU@cknow.org>
 <b25ddc.a29c.1975eea8033.Coremail.andyshrk@163.com>
 <DAJPBG7GPPH2.3BDCMH0U3FU0E@cknow.org>
 <562b38e5.a496.1975f09f983.Coremail.andyshrk@163.com>
Feedback-ID: 53478694:user:proton
X-Pm-Message-ID: 8e2fa2b68f5f05b4114d9aa2c31446fe0646ed33
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

>=20
> The root case for the problem is now clear=E3=80=82
>=20
> Most of the registers in VOP need to write the cfd_done register(call vop=
2_cfg_done)
> after you have configured the registers. Then, they will take effect only=
 when the VSYNC event occurs(It doesn't take effect immediately after you f=
inish writing.).
> This also includes all the VP_DSP_CTRL registers.
>=20
> see the code:
>=20
> vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
>=20
> vop2_crtc_atomic_try_set_gamma(vop2, vp, crtc, crtc_state);
> -->
>=20
> static void vop2_vp_dsp_lut_disable(struct vop2_video_port vp)
> {
> u32 dsp_ctrl =3D vop2_vp_read(vp, RK3568_VP_DSP_CTRL);
>=20
>=20
> When we read this register, we are reading the actual effective value,
> not the one(dsp_ctrl) that was just written in before (it has not yet tak=
en effect)
>=20
> So when we continue to write about this register here, we overwrite the a=
ctual
> value we originally intended to put in.
>=20
>=20
> dsp_ctrl &=3D ~RK3568_VP_DSP_CTRL__DSP_LUT_EN;
> vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
> }
>=20
> I think the correct solution should be similar to the Windows-related reg=
istry settings.
> All the registers related to Video Ports should be set as non-volatile, s=
ee:
>=20
> /
> * The window registers are only updated when config done is written.
> * Until that they read back the old value. As we read-modify-write
> * these registers mark them as non-volatile. This makes sure we read
> * the new values from the regmap register cache.
> */
> static const struct regmap_range vop2_nonvolatile_range[] =3D {
> regmap_reg_range(0x1000, 0x23ff),
> };
>=20
> static const struct regmap_access_table vop2_volatile_table =3D {
> .no_ranges =3D vop2_nonvolatile_range,
> .n_no_ranges =3D ARRAY_SIZE(vop2_nonvolatile_range),
> };

Following your suggestion I added vop2 video port registers as not
volatile and it fixed the issue. I took the values from RK3588 TRM
Part2 V1.1. See the patch below and confirm if it is correct.

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm=
/rockchip/rockchip_drm_vop2.c
index d0f5fea15e21..c5c1910fa5ca 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -2596,6 +2596,7 @@ static int vop2_win_init(struct vop2 *vop2)
  */
 static const struct regmap_range vop2_nonvolatile_range[] =3D {
 =09regmap_reg_range(0x1000, 0x23ff),
+=09regmap_reg_range(0x0C00, 0x0fff),
 };
=20
 static const struct regmap_access_table vop2_volatile_table =3D {


> Actually, there is another question. I still haven't figured out why
> this problem doesn't occur when compiling rockchipdrm=3Dy .

Couldn't reason out why this only happens with drm=3Dm yet
unfortunately.

Best regards, Piotr Zalewski


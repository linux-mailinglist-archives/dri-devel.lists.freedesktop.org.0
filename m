Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C51FAD6238
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 00:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF5FE10E0A0;
	Wed, 11 Jun 2025 22:12:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="Db/FT/FE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 171283 seconds by postgrey-1.36 at gabe;
 Wed, 11 Jun 2025 22:12:19 UTC
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C8CC10E0A0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 22:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1749679937; x=1749939137;
 bh=e7+TKwLiFTgSLhj8SFeUWygx/8rXRPa8q4Cd0wJL3rg=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=Db/FT/FEExCRwvGk1CN8lOHpwtjVSGl3U1GLOPiDQ5Q5hqNNj+rDEC2tXKRgXAIhp
 QxVpLFCbWVlLIc92chKJ+skDN4Z1dQCJ/MAzbw24d7RDMnZwgqKOvRsvdbKeXGffGx
 5koby5t+pb+hMExtOT2jiexTDvw3J9vdTddrzxPeL+1edVzxgGDyE3u8TUWCgxfhtk
 kS8wUX/lQJPcp0V5qoMl5OZNJOqkTRZVRBf4phwWaaGKMLM+L8WNL270xYg4x1seGo
 4I9QaV+p7ZGKXETtuQbV/6ayfj+6zE2rwhDHTkOsc49VC1hW266yjEDfDyhKmcPEQW
 32dB7iSBeorAg==
Date: Wed, 11 Jun 2025 22:12:11 +0000
To: Andy Yan <andyshrk@163.com>
From: Piotr Zalewski <pZ010001011111@proton.me>
Cc: Diederik de Haas <didi.debian@cknow.org>, hjc@rock-chips.com,
 heiko@sntech.de, andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 Dang Huynh <danct12@riseup.net>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH drm-misc-next] rockchip/drm: vop2: don't check
 color_mgmt_changed in atomic_enable
Message-ID: <zJBqdllX3IT9_-h9G49ay_GuU4nVf_n2Daxe1vL7PavA21RmMyH-vOqxdpahIknlp0_lpwwsxZyNyyQrF30rJquCjd6BcUU-FBgO0MM45iA=@proton.me>
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
X-Pm-Message-ID: 02c8703b38a58061d7584929d53a73e3d33835da
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





Hi Andy and Diederik

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
>=20

I'm wondering that perhaps making a separate code path for gamma
LUT enable in atomic enable would fix it? IIUC we set config.=20
earlier in atomic_enable and write dsp_ctrl + cfg_done with proper
configuration but since there wasn't a vsync the read of dsp ctrl
in lut disable is not correct (or we cannot be sure it is correct).
Putting try set gamma LUT before first dsp ctrl write and make it
use the dsp_ctrl value so far written in atomic enable could also
fix the issue because we wouldn't read dsp ctrl value from the=20
register.

> Actually, there is another question. I still haven't figured out why
> this problem doesn't occur when compiling rockchipdrm=3Dy .
>=20

I applied your patch and run a test on both versions. This is what
i got with drm=3Dm, so the same result as diederik.
```
[    8.138482] vop2_crtc_atomic_try_set_gamma  gamma_lut: 0000000000000000
[    8.139093] vop2_vp_dsp_lut_disable dsp_ctrl: 0x0000000f
```
This is what i got with drm=3Dy. So it seems with drm=3Dy read value in=20
the register _is_ what was written earlier in atomic enable i.e value is=20
vaild? Maybe it is just "unfortunate" timing?
```
[    6.646991] vop2_crtc_atomic_try_set_gamma  gamma_lut: 0000000000000000
[    6.647594] vop2_vp_dsp_lut_disable dsp_ctrl: 0x00010000
```

I will have time to spend more on this over the weekend.

Best regards, Piotr Zalewski

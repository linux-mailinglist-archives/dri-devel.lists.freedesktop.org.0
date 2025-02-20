Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D63A3D9E5
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 13:26:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B619A10E954;
	Thu, 20 Feb 2025 12:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WA37wYh2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A2E10E95E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 12:26:36 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-38dcac27bcbso1240267f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 04:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740054395; x=1740659195; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qH3DdgoKEAfwj4iaPXGOxAlwGgUTybVzhqeu1NMzPMo=;
 b=WA37wYh2RH5pTzShmfzXR8uWc0I3vTk8s+2vfo6kF/dgSWuTJRvvZkkhkJZBJmSdlH
 ste72uGM6BVKcaJKHB7bt1zKeD1dTMWBfjiaqZj1Kt58asC/rO5rRlaunfsXu/DGDn85
 /nZf606VKSg2aGB0m7koc/zz3/+wzEW9b0sJKAbG6+HqdQazu770qNk93WOwRDYh/YMH
 jtn0iJ7euElTPpZmZ6AWF3x5Xx8AmNg/yrpqZTrZsb20ri1lRG8st3Pj6E0Oyhpy6pDs
 4+5N6sQ7Yh4E8D38fXVA0s8BxygjvNunCS7DRnm2eDvyHCTjTmRqDvdMX6Ri729ipYmA
 ITpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740054395; x=1740659195;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qH3DdgoKEAfwj4iaPXGOxAlwGgUTybVzhqeu1NMzPMo=;
 b=g7CmwQqeu4h9nYUitsvboxF6CncfGgptCLG3oqy4bIuDAPvrebUPaKstemkADOM9WA
 csWgXbjy5mgrihvW7Xt/XnrfO5u6tfxzxW1vmBNkQHDh80hpqEld/0LgrCNTCV5pl9gD
 0AosT5AwnxWTaUPhLsa6mIQJEKsvSCF8lS9aOSqhamdQu+glCn5qWdtjwqMGiB14JdyZ
 H6KJOPUyAk2M26RHQ8hVklHO/BqbJXfI8K4pbu5khnbKr2bh01dJorejlgmJ2QvAxa6m
 YcDJeKx7jtWjs6HuZ29O0jf5XO6+8cpkZcYmQuu7ogNaD+b1UjdRksq48wOIosOHx40N
 pU9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaNzMD/DYeLJt1ly8zRsb3ZmEZ3edioRI+6SPxGGpvaD7TBZ0RZdxBIUTXFtShsIBAcEVMsw24EcQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRh15FcD7+WsEtGq3mSaeOUFZe4Od1bra2n6GytGbhoTUDKwUy
 h2UDMNLJXOmD3g5WJwzslZeEYmVI84wCwGUtCVqJ3+uy7PeduLUbyJnLmtHBDg45F6Fxg3/WDAl
 CNSJylF62cpeUfeqzgvO9zCN6Gxk=
X-Gm-Gg: ASbGnctQSOpiJ/nqnyakyItLUQVRNhvPKuag1alilKzgmYo05CSMgp5dRLp8QvmX7BB
 N19E+5/Hdmmm0pIshdDHE3fQLbCL701D9Z2MXhwrD18G5gt1RxEhaewNb653GcdmAnlC1nw4LGg
 ==
X-Google-Smtp-Source: AGHT+IEJTUmZHt18x/a4EVaHGfsjiEvSDzeEMYQTsZEr7m09QmHa6Dk5Cu5cXVAh1apSpLSOdMYco8A9NnvUxoKYV4Q=
X-Received: by 2002:a5d:58eb:0:b0:38d:b12f:60d1 with SMTP id
 ffacd0b85a97d-38f61609f19mr2169886f8f.26.1740054394477; Thu, 20 Feb 2025
 04:26:34 -0800 (PST)
MIME-Version: 1.0
References: <20250217140910.108175-1-clamor95@gmail.com>
 <20250217140910.108175-3-clamor95@gmail.com>
 <zmwn3dnnmwhms2qxqwb6ksshx27fcq2i4wujz5utuldaiqs6oz@idvy3dirrmuo>
 <CAPVz0n3bqLhuC0gxXD-=L0ETMmhOv1Ku0PrWUb_Yn09v3UNuOA@mail.gmail.com>
 <hemnpzzz3ddibdbqwkazwuoalmvuc2mekebqxfrnxiod6futni@sgdjgtrbcwza>
 <CAPVz0n24o5yar-0oO5dPb3vLzuK=Ln8+JKuaooSRwPfiaLQ9vA@mail.gmail.com>
 <jo7nnxrzwi43qqii7wtekdbc6vluakkvg4ndw266ajgkpe3y52@whd5nly34nju>
 <CAPVz0n3HsXJeyRJGP=_UMhs7d4OA-P_yXx5B9EQDU7vQCz8qoA@mail.gmail.com>
 <3lms6xzzu3hfhkncikcmvl6btzdcc2cwoh4kwhw53hdakecrij@yqoyl3bqmm5m>
In-Reply-To: <3lms6xzzu3hfhkncikcmvl6btzdcc2cwoh4kwhw53hdakecrij@yqoyl3bqmm5m>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 20 Feb 2025 14:26:22 +0200
X-Gm-Features: AWEUYZnht_Ew12HsnJseDT7TV_6lFwyWBz022uUOwakEZ6gmzeAR7-sBzh9_wRA
Message-ID: <CAPVz0n3YZass3Bns1m0XrFxtAC0DKbEPiW6vXimQx97G243sXw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm: bridge: Add support for Solomon SSD2825
 RGB/DSI bridge
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

=D1=82, 20 =D0=BB=D1=8E=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 13:35 Dmitry Bar=
yshkov <dmitry.baryshkov@linaro.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Feb 20, 2025 at 09:37:18AM +0200, Svyatoslav Ryhel wrote:
> > =D1=81=D1=80, 19 =D0=BB=D1=8E=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 15:34 =
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Tue, Feb 18, 2025 at 04:36:17PM +0200, Svyatoslav Ryhel wrote:
> > > > =D0=B2=D1=82, 18 =D0=BB=D1=8E=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 16=
:20 Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =D0=BF=D0=B8=D1=88=D0=B5=
:
> > > > >
> > > > > On Tue, Feb 18, 2025 at 02:45:19PM +0200, Svyatoslav Ryhel wrote:
> > > > > > =D0=B2=D1=82, 18 =D0=BB=D1=8E=D1=82. 2025=E2=80=AF=D1=80. =D0=
=BE 14:31 Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =D0=BF=D0=B8=D1=88=
=D0=B5:
> > > > > > >
> > > > > > > On Mon, Feb 17, 2025 at 04:09:10PM +0200, Svyatoslav Ryhel wr=
ote:
> > > > > > > > SSD2825 is a cost-effective MIPI Bridge Chip solution targe=
ting mainly
> > > > > > > > smartphones. It can convert 24bit RGB interface into 4-lane=
 MIPI-DSI
> > > > > > > > interface to drive display modules of up to 800 x 1366, whi=
le supporting
> > > > > > > > AMOLED, a-si LCD or LTPS panel technologies for smartphone =
applications.
> > > > > > > >
> > > > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > > > ---
> > > > > > > >  drivers/gpu/drm/bridge/Kconfig   |  14 +
> > > > > > > >  drivers/gpu/drm/bridge/Makefile  |   1 +
> > > > > > > >  drivers/gpu/drm/bridge/ssd2825.c | 824 +++++++++++++++++++=
++++++++++++
> > > > > > > >  3 files changed, 839 insertions(+)
> > > > > > > >  create mode 100644 drivers/gpu/drm/bridge/ssd2825.c
> > > > > > > >
...
> > > > > > >
> > > > > > > From v1:
> > > > > > >
> > > > > > > Most of these flags should be set depending on the
> > > > > > > mipi_dsi_device.mode_flags.
> > > > > > >
> > > > > > > > +             ssd2825_write_reg(priv, SSD2825_PLL_CTRL_REG,=
 0x0001);
> > > > > > > > +             ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, =
0x0000);
> > > > > > >
> > > > > > > Why? Why do you need this special handling for the
> > > > > > > MIPI_DCS_SET_DISPLAY_ON? Why can't it just go to .atomic_enab=
le()?
> > > > > > >
> > > > > >
> > > > > > This has to be called after panel init dsi sequence completes, =
is
> > > > > > atomic_enable called after panel init dsi seq is completed? May=
be you
> > > > > > can suggest where to place it.
> > > > >
> > > > > That depends on a panel. Significant number of panel drivers call=
 all
> > > > > DSI programming in .prepare because some DSI hosts can not transf=
er
> > > > > commands after starting DSI video stream.
> > > > >
> > > > > So these commands should go to your .enable().
> > > > >
> > > >
> > > > This is weird and counter intuitive to send dsi commands in prepare=
,
> > > > there should be smth like enable_post. Oh well, fine, I will try to
> > > > fit this somehow.
> > > >
> >
> > Who had made this cursed framework?
> >
> > Functions are called in the next seq
> >
> > panel_prepare > bridge_pre_enable > bridge_enable > panel_enable
>
> Use drm_bridge.pre_enable_prev_first or drm_panel.prepare_prev_first. I
> think that fixes your order issues.
>

This seems to have no effect. I have set panel.prepare_prev_first =3D
true in the panel probe, which should result in
bridge_atomic_pre_enable be called before panel prepare,
and yet I still have this:

[   45.280653] renesas_r61307_prepare start
[   45.300873] renesas_r61307_prepare end
[   45.301070] ssd2825_bridge_atomic_pre_enable start
[   45.317248] ssd2825_bridge_atomic_pre_enable end
[   45.317287] ssd2825_bridge_atomic_enable start
[   45.331650] ssd2825_bridge_atomic_enable end
[   45.331677] renesas_r61307_enable start
[   45.520959] renesas_r61307_enable end

With or without the flag it is same

> > There is no gap in between bridge_pre_enable and bridge enable, hence
> > I cannot call dsi commands in panel_prepare since bridge is not even
> > pre_enabled, and if I call then in panel_enable, I cannot complete
> > bridge configuration since bridge enable is called before. like WTF!
> >
> > I enclose log with function call seq
> >
> > DSI commands in panel prepare
> > [   75.149700] ssd2825_dsi_host_transfer start  << this is panel prepar=
e
> > [   75.149737] ssd2825 spi0.2: Bridge is not enabled
> > [   75.149750] panel-renesas-r61307 spi0.2.1: Failed to exit sleep mode=
: -19
> > [   75.149779] ssd2825_bridge_atomic_pre_enable start
> > [   75.178518] ssd2825_bridge_atomic_pre_enable end
> > [   75.178552] ssd2825_bridge_atomic_enable start
> > [   75.179026] ssd2825_bridge_atomic_enable end
> >
> > DSI commands in panel enable
> >
> > [  102.821580] ssd2825_bridge_atomic_pre_enable start
> > [  102.852000] ssd2825_bridge_atomic_pre_enable end
> > [  102.852057] ssd2825_bridge_atomic_enable start
> > [  102.852840] ssd2825_bridge_atomic_enable end
> > [  102.852866] ssd2825_dsi_host_transfer start  << panel enable
> > [  102.853876] ssd2825_dsi_host_transfer end
> > [  102.948420] ssd2825_dsi_host_transfer start
> > [  102.949289] ssd2825_dsi_host_transfer end
> > [  102.978389] ssd2825_dsi_host_transfer start
> > [  102.979567] ssd2825_dsi_host_transfer end
> > [  102.980117] ssd2825_dsi_host_transfer start
> > [  102.981248] ssd2825_dsi_host_transfer end
> > [  102.981809] ssd2825_dsi_host_transfer start
> > [  102.982851] ssd2825_dsi_host_transfer end
> > [  102.983537] ssd2825_dsi_host_transfer start
> > [  102.984556] ssd2825_dsi_host_transfer end
> > [  102.986743] ssd2825_dsi_host_transfer start
> > [  102.988078] ssd2825_dsi_host_transfer end
> > [  102.989445] ssd2825_dsi_host_transfer start
> > [  102.990411] ssd2825_dsi_host_transfer end
> > [  102.990912] ssd2825_dsi_host_transfer start
> > [  102.992274] ssd2825_dsi_host_transfer end
> >
> > In both cases there is no gap in between bridge pre_enable and enable
> >
> > > > > But what is the case for these calls? Are you manually implementi=
ng the
> > > > > MIPI_DSI_MODE_LPM flag? What exactly do they do? What happens if =
the
> > > > > panel driver asks for the MIPI_DCS_SET_DISPLAY_ON command after y=
ou've
> > > > > programmed those registers? What happens if the panel asks for th=
e
> > > > > backlight control?
> > > > >
> > > >
> > > > Backlight is externally controlled, at least on my device, so I can=
not
> > > > test other cases. If I configure those registers before dsi sequenc=
e
> > > > is completed panel stays black. If I simply remove those
> > > > configuration, panel stays black.
> > > >

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6AEA3DDEE
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 16:11:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E17E10E985;
	Thu, 20 Feb 2025 15:11:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="K7lW3R07";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F7CC10E985
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 15:11:53 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4398c8c8b2cso10602485e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 07:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740064312; x=1740669112; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1ZzXhdEGSSkZCTHaX2hw4lO1FdZswyNX5r+IEhYfpec=;
 b=K7lW3R07St9zNrLYxlx6L0N38+l0ni1nur9/KN3F2QuEz+p8/SoDRJcG7Wjg/GBAfB
 EDVjg553BIjUxTz/VLLyswWPYCN7Ku1Ag8SiXubs0MiT9FEoBO3f8UBZxZht/WuVnoA+
 Df2DIhBxDqf3gCpJ026JcU74TyzubJfp4vKnioXtT1zaBaQSKkEm1zFI+gNCAKHF/5kR
 0rP0WIRF6RVYBov4Jwozau18gs7+OAtbTY4n1zSfpxe694LhPXrNqOxpBY6aGntXtYhK
 vyIGZmmtYUNNka0/nRJbqECkvgB20O9gm5phyD8xICknvClL7hIMzgD+P/3ctLsu96MY
 BXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740064312; x=1740669112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1ZzXhdEGSSkZCTHaX2hw4lO1FdZswyNX5r+IEhYfpec=;
 b=DkLjHT00AeQrKFiMY+91H4cW9bD4vfCrVXPcsxExBBr72tvllM9YFo5VLy1BiwsAkl
 du5F10PbfkBlVNQUDW9m6gf5q3j3fvo8I3zlwkFJm/el0I5nINKW2AJ3R0i0p4EsL5uP
 AEGc8v2alAEpQsuw3doAayCTgzBtUF+8Pni1GjuWuibQ1aLHAiV92uLeMDKvQvCjLiLm
 g4CtnSntO2ph8GCizc0zcY3pUei3MtQHd3FHz5K3tT0vbvUJ9x5bOBnD02RM7mcJpUjh
 0u7QQcXsGZIrNcWO82kxBX3/QLSEiKwtAWxeXqk2qjY6JfVdXQ7FcHRRGY1ArRhOYSV/
 e9uA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTsKSaoJYu5QOZ9EKGz8TP/AYIj1+hyruF2FTmt9aBF4TomN/VC/ttBy8KUlTlZZn+srNKL6GrtcY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzeuut+x/v4sD03zfjLnKo5KNmkB568yB20uZc46af/YGkkuwOS
 QCbhkxniEr2R54+SpyrQcLEuXN4ZIWmaBQY0SP8k7BRqQCkEFwcbig8/Ai/rnZ6hF3FmEJz40Kb
 yEa1EWFwBCDVKS9N4oD9cnQI9e3U=
X-Gm-Gg: ASbGnctvwOQf22oQdmdhmmv254MFQ+DcC98MVOCCwa8S1TXUCysZZ8Qu8en61HcYQKd
 +uuTVlwkDfCgwUSt0rOGWZaE+y8+jsAcjgmI04tXo+Ge2eaKCN5GiInPwKWJdG3lLA5AVr+AuxA
 ==
X-Google-Smtp-Source: AGHT+IEwoeMX6J12QmDEt5R/RC24PUelKkUWkycdwX0ajlm0bv3hfNZz3IVQDRDCtgAizzn0zwTuxN+WYiZbdKRX/9M=
X-Received: by 2002:a5d:6051:0:b0:38a:2b39:9205 with SMTP id
 ffacd0b85a97d-38f33f39a1bmr20654393f8f.33.1740064311723; Thu, 20 Feb 2025
 07:11:51 -0800 (PST)
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
 <CAPVz0n3YZass3Bns1m0XrFxtAC0DKbEPiW6vXimQx97G243sXw@mail.gmail.com>
 <eard52ujlocxwshi6ynoimmvfyktpx6f5gcwfn2chaxul2l7my@e24kauxjsw2a>
In-Reply-To: <eard52ujlocxwshi6ynoimmvfyktpx6f5gcwfn2chaxul2l7my@e24kauxjsw2a>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 20 Feb 2025 17:11:39 +0200
X-Gm-Features: AWEUYZmsx4vnO4A4WUOKNBHW3jf2mgl2CcCyXot5MfN6b4F3ATdvpJehnSNkALE
Message-ID: <CAPVz0n3p2Zbe44RB5AJmq9Zdpmi0gHPZisB-Kv4L9XA7oc70Gg@mail.gmail.com>
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

=D1=87=D1=82, 20 =D0=BB=D1=8E=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 17:07 Dmit=
ry Baryshkov <dmitry.baryshkov@linaro.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Feb 20, 2025 at 02:26:22PM +0200, Svyatoslav Ryhel wrote:
> > =D1=82, 20 =D0=BB=D1=8E=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 13:35 Dmitry=
 Baryshkov <dmitry.baryshkov@linaro.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Thu, Feb 20, 2025 at 09:37:18AM +0200, Svyatoslav Ryhel wrote:
> > > > =D1=81=D1=80, 19 =D0=BB=D1=8E=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 15=
:34 Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =D0=BF=D0=B8=D1=88=D0=B5=
:
> > > > >
> > > > > On Tue, Feb 18, 2025 at 04:36:17PM +0200, Svyatoslav Ryhel wrote:
> > > > > > =D0=B2=D1=82, 18 =D0=BB=D1=8E=D1=82. 2025=E2=80=AF=D1=80. =D0=
=BE 16:20 Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =D0=BF=D0=B8=D1=88=
=D0=B5:
> > > > > > >
> > > > > > > On Tue, Feb 18, 2025 at 02:45:19PM +0200, Svyatoslav Ryhel wr=
ote:
> > > > > > > > =D0=B2=D1=82, 18 =D0=BB=D1=8E=D1=82. 2025=E2=80=AF=D1=80. =
=D0=BE 14:31 Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =D0=BF=D0=B8=D1=
=88=D0=B5:
> > > > > > > > >
> > > > > > > > > On Mon, Feb 17, 2025 at 04:09:10PM +0200, Svyatoslav Ryhe=
l wrote:
> > > > > > > > > > SSD2825 is a cost-effective MIPI Bridge Chip solution t=
argeting mainly
> > > > > > > > > > smartphones. It can convert 24bit RGB interface into 4-=
lane MIPI-DSI
> > > > > > > > > > interface to drive display modules of up to 800 x 1366,=
 while supporting
> > > > > > > > > > AMOLED, a-si LCD or LTPS panel technologies for smartph=
one applications.
> > > > > > > > > >
> > > > > > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > > > > > ---
> > > > > > > > > >  drivers/gpu/drm/bridge/Kconfig   |  14 +
> > > > > > > > > >  drivers/gpu/drm/bridge/Makefile  |   1 +
> > > > > > > > > >  drivers/gpu/drm/bridge/ssd2825.c | 824 +++++++++++++++=
++++++++++++++++
> > > > > > > > > >  3 files changed, 839 insertions(+)
> > > > > > > > > >  create mode 100644 drivers/gpu/drm/bridge/ssd2825.c
> > > > > > > > > >
> > ...
> > > > > > > > >
> > > > > > > > > From v1:
> > > > > > > > >
> > > > > > > > > Most of these flags should be set depending on the
> > > > > > > > > mipi_dsi_device.mode_flags.
> > > > > > > > >
> > > > > > > > > > +             ssd2825_write_reg(priv, SSD2825_PLL_CTRL_=
REG, 0x0001);
> > > > > > > > > > +             ssd2825_write_reg(priv, SSD2825_VC_CTRL_R=
EG, 0x0000);
> > > > > > > > >
> > > > > > > > > Why? Why do you need this special handling for the
> > > > > > > > > MIPI_DCS_SET_DISPLAY_ON? Why can't it just go to .atomic_=
enable()?
> > > > > > > > >
> > > > > > > >
> > > > > > > > This has to be called after panel init dsi sequence complet=
es, is
> > > > > > > > atomic_enable called after panel init dsi seq is completed?=
 Maybe you
> > > > > > > > can suggest where to place it.
> > > > > > >
> > > > > > > That depends on a panel. Significant number of panel drivers =
call all
> > > > > > > DSI programming in .prepare because some DSI hosts can not tr=
ansfer
> > > > > > > commands after starting DSI video stream.
> > > > > > >
> > > > > > > So these commands should go to your .enable().
> > > > > > >
> > > > > >
> > > > > > This is weird and counter intuitive to send dsi commands in pre=
pare,
> > > > > > there should be smth like enable_post. Oh well, fine, I will tr=
y to
> > > > > > fit this somehow.
> > > > > >
> > > >
> > > > Who had made this cursed framework?
> > > >
> > > > Functions are called in the next seq
> > > >
> > > > panel_prepare > bridge_pre_enable > bridge_enable > panel_enable
> > >
> > > Use drm_bridge.pre_enable_prev_first or drm_panel.prepare_prev_first.=
 I
> > > think that fixes your order issues.
> > >
> >
> > This seems to have no effect. I have set panel.prepare_prev_first =3D
> > true in the panel probe, which should result in
> > bridge_atomic_pre_enable be called before panel prepare,
> > and yet I still have this:
>
> I've cc'ed you on the patch that should fix this behaviour.
>

Thank you. For the fix and suggestions.

> >
> > [   45.280653] renesas_r61307_prepare start
> > [   45.300873] renesas_r61307_prepare end
> > [   45.301070] ssd2825_bridge_atomic_pre_enable start
> > [   45.317248] ssd2825_bridge_atomic_pre_enable end
> > [   45.317287] ssd2825_bridge_atomic_enable start
> > [   45.331650] ssd2825_bridge_atomic_enable end
> > [   45.331677] renesas_r61307_enable start
> > [   45.520959] renesas_r61307_enable end
> >
> > With or without the flag it is same
> >
> > > > There is no gap in between bridge_pre_enable and bridge enable, hen=
ce
> > > > I cannot call dsi commands in panel_prepare since bridge is not eve=
n
> > > > pre_enabled, and if I call then in panel_enable, I cannot complete
> > > > bridge configuration since bridge enable is called before. like WTF=
!
> > > >
> > > > I enclose log with function call seq
> > > >
> > > > DSI commands in panel prepare
> > > > [   75.149700] ssd2825_dsi_host_transfer start  << this is panel pr=
epare
> > > > [   75.149737] ssd2825 spi0.2: Bridge is not enabled
> > > > [   75.149750] panel-renesas-r61307 spi0.2.1: Failed to exit sleep =
mode: -19
> > > > [   75.149779] ssd2825_bridge_atomic_pre_enable start
> > > > [   75.178518] ssd2825_bridge_atomic_pre_enable end
> > > > [   75.178552] ssd2825_bridge_atomic_enable start
> > > > [   75.179026] ssd2825_bridge_atomic_enable end
> > > >
> > > > DSI commands in panel enable
> > > >
> > > > [  102.821580] ssd2825_bridge_atomic_pre_enable start
> > > > [  102.852000] ssd2825_bridge_atomic_pre_enable end
> > > > [  102.852057] ssd2825_bridge_atomic_enable start
> > > > [  102.852840] ssd2825_bridge_atomic_enable end
> > > > [  102.852866] ssd2825_dsi_host_transfer start  << panel enable
> > > > [  102.853876] ssd2825_dsi_host_transfer end
> > > > [  102.948420] ssd2825_dsi_host_transfer start
> > > > [  102.949289] ssd2825_dsi_host_transfer end
> > > > [  102.978389] ssd2825_dsi_host_transfer start
> > > > [  102.979567] ssd2825_dsi_host_transfer end
> > > > [  102.980117] ssd2825_dsi_host_transfer start
> > > > [  102.981248] ssd2825_dsi_host_transfer end
> > > > [  102.981809] ssd2825_dsi_host_transfer start
> > > > [  102.982851] ssd2825_dsi_host_transfer end
> > > > [  102.983537] ssd2825_dsi_host_transfer start
> > > > [  102.984556] ssd2825_dsi_host_transfer end
> > > > [  102.986743] ssd2825_dsi_host_transfer start
> > > > [  102.988078] ssd2825_dsi_host_transfer end
> > > > [  102.989445] ssd2825_dsi_host_transfer start
> > > > [  102.990411] ssd2825_dsi_host_transfer end
> > > > [  102.990912] ssd2825_dsi_host_transfer start
> > > > [  102.992274] ssd2825_dsi_host_transfer end
> > > >
> > > > In both cases there is no gap in between bridge pre_enable and enab=
le
> > > >
> > > > > > > But what is the case for these calls? Are you manually implem=
enting the
> > > > > > > MIPI_DSI_MODE_LPM flag? What exactly do they do? What happens=
 if the
> > > > > > > panel driver asks for the MIPI_DCS_SET_DISPLAY_ON command aft=
er you've
> > > > > > > programmed those registers? What happens if the panel asks fo=
r the
> > > > > > > backlight control?
> > > > > > >
> > > > > >
> > > > > > Backlight is externally controlled, at least on my device, so I=
 cannot
> > > > > > test other cases. If I configure those registers before dsi seq=
uence
> > > > > > is completed panel stays black. If I simply remove those
> > > > > > configuration, panel stays black.
> > > > > >
>
> --
> With best wishes
> Dmitry

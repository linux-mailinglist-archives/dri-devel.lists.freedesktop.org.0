Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACED575C62F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 13:57:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E618B10E662;
	Fri, 21 Jul 2023 11:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
 by gabe.freedesktop.org (Postfix) with ESMTP id 85A3F10E65C
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 11:57:31 +0000 (UTC)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
 by fd01.gateway.ufhost.com (Postfix) with ESMTP id CD5D824DD54;
 Fri, 21 Jul 2023 19:57:25 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 21 Jul
 2023 19:57:25 +0800
Received: from [192.168.60.102] (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 21 Jul
 2023 19:57:25 +0800
Message-ID: <a8c51143-01cb-a95f-bfbd-16827325934e@starfivetech.com>
Date: Fri, 21 Jul 2023 19:57:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 6/9] drm/verisilicon: Add drm crtc funcs
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
 <20230602074043.33872-7-keith.zhao@starfivetech.com>
 <07cc89a5-5200-72e6-f078-694c5820a99a@suse.de>
From: Keith Zhao <keith.zhao@starfivetech.com>
In-Reply-To: <07cc89a5-5200-72e6-f078-694c5820a99a@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS065.cuchost.com (172.16.6.25) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Shengyang
 Chen <shengyang.chen@starfivetech.com>, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Maxime Ripard <mripard@kernel.org>,
 Jagan Teki <jagan@edgeble.ai>, Rob
 Herring <robh+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jack Zhu <jack.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Shawn Guo <shawnguo@kernel.org>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023/6/30 19:55, Thomas Zimmermann wrote:
> Hi
>=20
> Am 02.06.23 um 09:40 schrieb Keith Zhao:
>> Add crtc driver which implements crtc related operation functions.
>>
>> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
>> ---
>> =C2=A0 drivers/gpu/drm/verisilicon/Makefile=C2=A0 |=C2=A0=C2=A0 1 +
>> =C2=A0 drivers/gpu/drm/verisilicon/vs_crtc.c | 388 +++++++++++++++++++=
+++++++
>> =C2=A0 drivers/gpu/drm/verisilicon/vs_crtc.h |=C2=A0 74 +++++
>> =C2=A0 drivers/gpu/drm/verisilicon/vs_type.h |=C2=A0 72 +++++
>> =C2=A0 4 files changed, 535 insertions(+)
>> =C2=A0 create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.c
>> =C2=A0 create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.h
>> =C2=A0 create mode 100644 drivers/gpu/drm/verisilicon/vs_type.h
>>
>> diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/ve=
risilicon/Makefile
>> index 38254dc5d98d..bae5fbab9bbb 100644
>> --- a/drivers/gpu/drm/verisilicon/Makefile
>> +++ b/drivers/gpu/drm/verisilicon/Makefile
>> @@ -1,6 +1,7 @@
>> =C2=A0 # SPDX-License-Identifier: GPL-2.0
>> =C2=A0 =C2=A0 vs_drm-objs :=3D vs_drv.o \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vs_crtc.o \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vs_fb.o \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vs_gem.o
>> =C2=A0 diff --git a/drivers/gpu/drm/verisilicon/vs_crtc.c b/drivers/gp=
u/drm/verisilicon/vs_crtc.c
>> new file mode 100644
>> index 000000000000..a9e742d7bd1a
>> --- /dev/null
>> +++ b/drivers/gpu/drm/verisilicon/vs_crtc.c
>> @@ -0,0 +1,388 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
>> + *
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/debugfs.h>
>> +#include <linux/media-bus-format.h>
>> +
>> +#include <drm/drm_atomic_helper.h>
>> +#include <drm/drm_atomic.h>
>> +#include <drm/drm_crtc.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>> +#include <drm/drm_vblank.h>
>> +#include <drm/vs_drm.h>
>> +
>> +#include "vs_crtc.h"
>> +
>> +void vs_crtc_destroy(struct drm_crtc *crtc)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct vs_crtc *vs_crtc =3D to_vs_crtc(crtc);
>> +
>> +=C2=A0=C2=A0=C2=A0 drm_crtc_cleanup(crtc);
>> +=C2=A0=C2=A0=C2=A0 kfree(vs_crtc);
>> +}
>> +
>> +static void vs_crtc_reset(struct drm_crtc *crtc)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct vs_crtc_state *state;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (crtc->state) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __drm_atomic_helper_crtc_d=
estroy_state(crtc->state);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 state =3D to_vs_crtc_state=
(crtc->state);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kfree(state);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 crtc->state =3D NULL;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 state =3D kzalloc(sizeof(*state), GFP_KERNEL);
>> +=C2=A0=C2=A0=C2=A0 if (!state)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> +
>> +=C2=A0=C2=A0=C2=A0 __drm_atomic_helper_crtc_reset(crtc, &state->base)=
;
>> +
>> +=C2=A0=C2=A0=C2=A0 state->sync_mode =3D VS_SINGLE_DC;
>> +=C2=A0=C2=A0=C2=A0 state->output_fmt =3D MEDIA_BUS_FMT_RBG888_1X24;
>> +=C2=A0=C2=A0=C2=A0 state->encoder_type =3D DRM_MODE_ENCODER_NONE;
>> +}
>> +
>> +static struct drm_crtc_state *
>> +vs_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct vs_crtc_state *ori_state;
>> +=C2=A0=C2=A0=C2=A0 struct vs_crtc_state *state;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (WARN_ON(!crtc->state))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
>=20
> I'd leave this check out. IIRC, crtc->state not supposed to be NULL her=
e. Rather let it crash.
>=20
>> +
>> +=C2=A0=C2=A0=C2=A0 ori_state =3D to_vs_crtc_state(crtc->state);
>> +=C2=A0=C2=A0=C2=A0 state =3D kzalloc(sizeof(*state), GFP_KERNEL);
>> +=C2=A0=C2=A0=C2=A0 if (!state)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
>> +
>> +=C2=A0=C2=A0=C2=A0 __drm_atomic_helper_crtc_duplicate_state(crtc, &st=
ate->base);
>> +
>> +=C2=A0=C2=A0=C2=A0 state->sync_mode =3D ori_state->sync_mode;
>> +=C2=A0=C2=A0=C2=A0 state->output_fmt =3D ori_state->output_fmt;
>> +=C2=A0=C2=A0=C2=A0 state->encoder_type =3D ori_state->encoder_type;
>> +=C2=A0=C2=A0=C2=A0 state->bg_color =3D ori_state->bg_color;
>> +=C2=A0=C2=A0=C2=A0 state->bpp =3D ori_state->bpp;
>> +=C2=A0=C2=A0=C2=A0 state->sync_enable =3D ori_state->sync_enable;
>> +=C2=A0=C2=A0=C2=A0 state->dither_enable =3D ori_state->dither_enable;
>> +=C2=A0=C2=A0=C2=A0 state->underflow =3D ori_state->underflow;
>> +
>> +=C2=A0=C2=A0=C2=A0 return &state->base;
>> +}
>> +
>> +static void vs_crtc_atomic_destroy_state(struct drm_crtc *crtc,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_crtc_state=
 *state)
>> +{
>> +=C2=A0=C2=A0=C2=A0 __drm_atomic_helper_crtc_destroy_state(state);
>> +=C2=A0=C2=A0=C2=A0 kfree(to_vs_crtc_state(state));
>> +}
>> +
>> +static int vs_crtc_atomic_set_property(struct drm_crtc *crtc,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dr=
m_crtc_state *state,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dr=
m_property *property,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t =
val)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct vs_crtc *vs_crtc =3D to_vs_crtc(crtc);
>> +=C2=A0=C2=A0=C2=A0 struct vs_crtc_state *vs_crtc_state =3D to_vs_crtc=
_state(state);
>> +
>> +=C2=A0=C2=A0=C2=A0 if (property =3D=3D vs_crtc->sync_mode)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vs_crtc_state->sync_mode =3D=
 val;
>> +=C2=A0=C2=A0=C2=A0 else if (property =3D=3D vs_crtc->mmu_prefetch)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vs_crtc_state->mmu_prefetc=
h =3D val;
>> +=C2=A0=C2=A0=C2=A0 else if (property =3D=3D vs_crtc->bg_color)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vs_crtc_state->bg_color =3D=
 val;
>> +=C2=A0=C2=A0=C2=A0 else if (property =3D=3D vs_crtc->panel_sync)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vs_crtc_state->sync_enable=
 =3D val;
>> +=C2=A0=C2=A0=C2=A0 else if (property =3D=3D vs_crtc->dither)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vs_crtc_state->dither_enab=
le =3D val;
>> +=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +static int vs_crtc_atomic_get_property(struct drm_crtc *crtc,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const str=
uct drm_crtc_state *state,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dr=
m_property *property,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t =
*val)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct vs_crtc *vs_crtc =3D to_vs_crtc(crtc);
>> +=C2=A0=C2=A0=C2=A0 const struct vs_crtc_state *vs_crtc_state =3D
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 container_of(state, const =
struct vs_crtc_state, base);
>> +
>> +=C2=A0=C2=A0=C2=A0 if (property =3D=3D vs_crtc->sync_mode)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *val =3D vs_crtc_state->sy=
nc_mode;
>> +=C2=A0=C2=A0=C2=A0 else if (property =3D=3D vs_crtc->mmu_prefetch)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *val =3D vs_crtc_state->mm=
u_prefetch;
>> +=C2=A0=C2=A0=C2=A0 else if (property =3D=3D vs_crtc->bg_color)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *val =3D vs_crtc_state->bg=
_color;
>> +=C2=A0=C2=A0=C2=A0 else if (property =3D=3D vs_crtc->panel_sync)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *val =3D vs_crtc_state->sy=
nc_enable;
>> +=C2=A0=C2=A0=C2=A0 else if (property =3D=3D vs_crtc->dither)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *val =3D vs_crtc_state->di=
ther_enable;
>> +=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +static int vs_crtc_late_register(struct drm_crtc *crtc)
>> +{
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +static int vs_crtc_enable_vblank(struct drm_crtc *crtc)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct vs_crtc *vs_crtc =3D to_vs_crtc(crtc);
>> +
>> +=C2=A0=C2=A0=C2=A0 vs_crtc->funcs->enable_vblank(vs_crtc->dev, true);
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +static void vs_crtc_disable_vblank(struct drm_crtc *crtc)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct vs_crtc *vs_crtc =3D to_vs_crtc(crtc);
>> +
>> +=C2=A0=C2=A0=C2=A0 vs_crtc->funcs->enable_vblank(vs_crtc->dev, false)=
;
>> +}
>> +
>> +static const struct drm_crtc_funcs vs_crtc_funcs =3D {
>> +=C2=A0=C2=A0=C2=A0 .set_config=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D drm_atomic_helper_set_config,
>> +=C2=A0=C2=A0=C2=A0 .destroy=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =3D vs_crtc_destroy,
>> +=C2=A0=C2=A0=C2=A0 .page_flip=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =3D drm_atomic_helper_page_flip,
>> +=C2=A0=C2=A0=C2=A0 .reset=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 =3D vs_crtc_reset,
>> +=C2=A0=C2=A0=C2=A0 .atomic_duplicate_state =3D vs_crtc_atomic_duplica=
te_state,
>> +=C2=A0=C2=A0=C2=A0 .atomic_destroy_state=C2=A0=C2=A0=C2=A0 =3D vs_crt=
c_atomic_destroy_state,
>> +=C2=A0=C2=A0=C2=A0 .atomic_set_property=C2=A0=C2=A0=C2=A0 =3D vs_crtc=
_atomic_set_property,
>> +=C2=A0=C2=A0=C2=A0 .atomic_get_property=C2=A0=C2=A0=C2=A0 =3D vs_crtc=
_atomic_get_property,
>> +=C2=A0=C2=A0=C2=A0 .late_register=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D vs_crtc_late_register,
>> +=C2=A0=C2=A0=C2=A0 .enable_vblank=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D vs_crtc_enable_vblank,
>> +=C2=A0=C2=A0=C2=A0 .disable_vblank=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D vs_crtc_disable_vblank,
>> +};
>> +
>> +static u8 cal_pixel_bits(u32 bus_format)
>> +{
>> +=C2=A0=C2=A0=C2=A0 u8 bpp;
>> +
>> +=C2=A0=C2=A0=C2=A0 switch (bus_format) {
>> +=C2=A0=C2=A0=C2=A0 case MEDIA_BUS_FMT_RGB565_1X16:
>> +=C2=A0=C2=A0=C2=A0 case MEDIA_BUS_FMT_UYVY8_1X16:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bpp =3D 16;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>> +=C2=A0=C2=A0=C2=A0 case MEDIA_BUS_FMT_RGB666_1X18:
>> +=C2=A0=C2=A0=C2=A0 case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bpp =3D 18;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>> +=C2=A0=C2=A0=C2=A0 case MEDIA_BUS_FMT_UYVY10_1X20:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bpp =3D 20;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>> +=C2=A0=C2=A0=C2=A0 case MEDIA_BUS_FMT_BGR888_1X24:
>> +=C2=A0=C2=A0=C2=A0 case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
>> +=C2=A0=C2=A0=C2=A0 case MEDIA_BUS_FMT_YUV8_1X24:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bpp =3D 24;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>> +=C2=A0=C2=A0=C2=A0 case MEDIA_BUS_FMT_RGB101010_1X30:
>> +=C2=A0=C2=A0=C2=A0 case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
>> +=C2=A0=C2=A0=C2=A0 case MEDIA_BUS_FMT_YUV10_1X30:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bpp =3D 30;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>> +=C2=A0=C2=A0=C2=A0 default:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bpp =3D 24;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 return bpp;
>> +}
>> +
>> +static bool vs_crtc_mode_fixup(struct drm_crtc *crtc,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_display_mode *mo=
de,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_display_mode *adjusted=
_mode)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct vs_crtc *vs_crtc =3D to_vs_crtc(crtc);
>> +
>> +=C2=A0=C2=A0=C2=A0 return vs_crtc->funcs->mode_fixup(vs_crtc->dev, mo=
de, adjusted_mode);
>> +}
>> +
>> +static void vs_crtc_atomic_enable(struct drm_crtc *crtc,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_atomic_state *state)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct vs_crtc *vs_crtc =3D to_vs_crtc(crtc);
>> +=C2=A0=C2=A0=C2=A0 struct vs_crtc_state *vs_crtc_state =3D to_vs_crtc=
_state(crtc->state);
>> +
>> +=C2=A0=C2=A0=C2=A0 vs_crtc_state->bpp =3D cal_pixel_bits(vs_crtc_stat=
e->output_fmt);
>> +
>> +=C2=A0=C2=A0=C2=A0 vs_crtc->funcs->enable(vs_crtc->dev, crtc);
>> +=C2=A0=C2=A0=C2=A0 drm_crtc_vblank_on(crtc);
>> +}
>> +
>> +static void vs_crtc_atomic_disable(struct drm_crtc *crtc,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_atomic_state *state)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct vs_crtc *vs_crtc =3D to_vs_crtc(crtc);
>> +
>> +=C2=A0=C2=A0=C2=A0 drm_crtc_vblank_off(crtc);
>> +
>> +=C2=A0=C2=A0=C2=A0 vs_crtc->funcs->disable(vs_crtc->dev, crtc);
>> +
>> +=C2=A0=C2=A0=C2=A0 if (crtc->state->event && !crtc->state->active) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_lock_irq(&crtc->dev->=
event_lock);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_crtc_send_vblank_event=
(crtc, crtc->state->event);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock_irq(&crtc->dev=
->event_lock);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 crtc->state->event =3D NUL=
L;
>> +=C2=A0=C2=A0=C2=A0 }
>> +}
>> +
>> +static void vs_crtc_atomic_begin(struct drm_crtc *crtc,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_atomic_state *state)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct drm_crtc_state *crtc_state =3D drm_atomic_g=
et_new_crtc_state(state,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 crtc);
>> +
>> +=C2=A0=C2=A0=C2=A0 struct vs_crtc *vs_crtc =3D to_vs_crtc(crtc);
>> +=C2=A0=C2=A0=C2=A0 struct device *dev =3D vs_crtc->dev;
>> +=C2=A0=C2=A0=C2=A0 struct drm_property_blob *blob =3D crtc->state->ga=
mma_lut;
>> +=C2=A0=C2=A0=C2=A0 struct drm_color_lut *lut;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (crtc_state->color_mgmt_changed) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (blob && blob->length) =
{
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lu=
t =3D blob->data;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vs=
_crtc->funcs->set_gamma(dev, crtc, lut,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 blob->length / sizeof(*lut));
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vs=
_crtc->funcs->enable_gamma(dev, crtc, true);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vs=
_crtc->funcs->enable_gamma(dev, crtc, false);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 }
>> +}
>> +
>> +static void vs_crtc_atomic_flush(struct drm_crtc *crtc,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_atomic_state *state)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct vs_crtc *vs_crtc =3D to_vs_crtc(crtc);
>> +=C2=A0=C2=A0=C2=A0 struct drm_pending_vblank_event *event =3D crtc->s=
tate->event;
>> +
>> +=C2=A0=C2=A0=C2=A0 vs_crtc->funcs->commit(vs_crtc->dev);
>> +
>> +=C2=A0=C2=A0=C2=A0 if (event) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WARN_ON(drm_crtc_vblank_ge=
t(crtc) !=3D 0);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_lock_irq(&crtc->dev->=
event_lock);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_crtc_arm_vblank_event(=
crtc, event);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock_irq(&crtc->dev=
->event_lock);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 crtc->state->event =3D NUL=
L;
>> +=C2=A0=C2=A0=C2=A0 }
>> +}
>> +
>> +static const struct drm_crtc_helper_funcs vs_crtc_helper_funcs =3D {
>> +=C2=A0=C2=A0=C2=A0 .mode_fixup =3D vs_crtc_mode_fixup,
>> +=C2=A0=C2=A0=C2=A0 .atomic_enable=C2=A0=C2=A0=C2=A0 =3D vs_crtc_atomi=
c_enable,
>> +=C2=A0=C2=A0=C2=A0 .atomic_disable =3D vs_crtc_atomic_disable,
>> +=C2=A0=C2=A0=C2=A0 .atomic_begin=C2=A0=C2=A0=C2=A0 =3D vs_crtc_atomic=
_begin,
>> +=C2=A0=C2=A0=C2=A0 .atomic_flush=C2=A0=C2=A0=C2=A0 =3D vs_crtc_atomic=
_flush,
>> +};
>> +
>> +static const struct drm_prop_enum_list vs_sync_mode_enum_list[] =3D {
>> +=C2=A0=C2=A0=C2=A0 { VS_SINGLE_DC,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "single dc mode" },
>> +=C2=A0=C2=A0=C2=A0 { VS_MULTI_DC_PRIMARY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "primary dc for multi dc mode" },
>> +=C2=A0=C2=A0=C2=A0 { VS_MULTI_DC_SECONDARY,=C2=A0=C2=A0=C2=A0 "second=
ary dc for multi dc mode" },
>> +};
>> +
>> +struct vs_crtc *vs_crtc_create(struct drm_device *drm_dev,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vs_dc_info *info)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct vs_crtc *crtc;
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (!info)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
>> +
>> +=C2=A0=C2=A0=C2=A0 crtc =3D kzalloc(sizeof(*crtc), GFP_KERNEL);
>> +=C2=A0=C2=A0=C2=A0 if (!crtc)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D drm_crtc_init_with_planes(drm_dev, &crtc->=
base,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL, NULL, &vs_crtc_funcs,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info->name ? info->name : N=
ULL);
>> +=C2=A0=C2=A0=C2=A0 if (ret)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_free_crtc;
>> +
>> +=C2=A0=C2=A0=C2=A0 drm_crtc_helper_add(&crtc->base, &vs_crtc_helper_f=
uncs);
>> +
>> +=C2=A0=C2=A0=C2=A0 /* Set up the crtc properties */
>> +=C2=A0=C2=A0=C2=A0 if (info->pipe_sync) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 crtc->sync_mode =3D drm_pr=
operty_create_enum(drm_dev, 0,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "SYNC_MODE",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vs_sync_mode_enum_list,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(vs_sync_mode_enum_l=
ist));
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!crtc->sync_mode)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 go=
to err_cleanup_crts;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_object_attach_property=
(&crtc->base.base,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 crtc->syn=
c_mode,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VS_SINGLE=
_DC);
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 if (info->gamma_size) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D drm_mode_crtc_set_=
gamma_size(&crtc->base,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 info->gamma_size);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 go=
to err_cleanup_crts;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_crtc_enable_color_mgmt=
(&crtc->base, 0, false,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info->gam=
ma_size);
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 if (info->background) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 crtc->bg_color =3D drm_pro=
perty_create_range(drm_dev, 0,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "BG_COLOR", 0, 0xffffffff);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!crtc->bg_color)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 go=
to err_cleanup_crts;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_object_attach_property=
(&crtc->base.base, crtc->bg_color, 0);
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 if (info->panel_sync) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 crtc->panel_sync =3D drm_p=
roperty_create_bool(drm_dev, 0, "SYNC_ENABLED");
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!crtc->panel_sync)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 go=
to err_cleanup_crts;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_object_attach_property=
(&crtc->base.base, crtc->panel_sync, 0);
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 crtc->dither =3D drm_property_create_bool(drm_dev,=
 0, "DITHER_ENABLED");
>> +=C2=A0=C2=A0=C2=A0 if (!crtc->dither)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_cleanup_crts;
>> +
>> +=C2=A0=C2=A0=C2=A0 drm_object_attach_property(&crtc->base.base, crtc-=
>dither, 0);
>> +
>> +=C2=A0=C2=A0=C2=A0 crtc->max_bpc =3D info->max_bpc;
>> +=C2=A0=C2=A0=C2=A0 crtc->color_formats =3D info->color_formats;
>> +=C2=A0=C2=A0=C2=A0 return crtc;
>> +
>> +err_cleanup_crts:
>> +=C2=A0=C2=A0=C2=A0 drm_crtc_cleanup(&crtc->base);
>> +
>> +err_free_crtc:
>> +=C2=A0=C2=A0=C2=A0 kfree(crtc);
>> +=C2=A0=C2=A0=C2=A0 return NULL;
>> +}
>> +
>> +void vs_crtc_handle_vblank(struct drm_crtc *crtc, bool underflow)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct vs_crtc_state *vs_crtc_state =3D to_vs_crtc=
_state(crtc->state);
>> +
>> +=C2=A0=C2=A0=C2=A0 drm_crtc_handle_vblank(crtc);
>> +
>> +=C2=A0=C2=A0=C2=A0 vs_crtc_state->underflow =3D underflow;
>> +}
>> diff --git a/drivers/gpu/drm/verisilicon/vs_crtc.h b/drivers/gpu/drm/v=
erisilicon/vs_crtc.h
>> new file mode 100644
>> index 000000000000..33b3b14249ce
>> --- /dev/null
>> +++ b/drivers/gpu/drm/verisilicon/vs_crtc.h
>> @@ -0,0 +1,74 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
>> + */
>> +
>> +#ifndef __VS_CRTC_H__
>> +#define __VS_CRTC_H__
>> +
>> +#include <drm/drm_crtc.h>
>> +#include <drm/drm_crtc_helper.h>
>> +
>> +#include "vs_type.h"
>> +
>> +struct vs_crtc_funcs {
>> +=C2=A0=C2=A0=C2=A0 void (*enable)(struct device *dev, struct drm_crtc=
 *crtc);
>> +=C2=A0=C2=A0=C2=A0 void (*disable)(struct device *dev, struct drm_crt=
c *crtc);
>> +=C2=A0=C2=A0=C2=A0 bool (*mode_fixup)(struct device *dev,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 const struct drm_display_mode *mode,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 struct drm_display_mode *adjusted_mode);
>> +=C2=A0=C2=A0=C2=A0 void (*set_gamma)(struct device *dev, struct drm_c=
rtc *crtc,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 struct drm_color_lut *lut, unsigned int size);
>> +=C2=A0=C2=A0=C2=A0 void (*enable_gamma)(struct device *dev, struct dr=
m_crtc *crtc,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool enable);
>> +=C2=A0=C2=A0=C2=A0 void (*enable_vblank)(struct device *dev, bool ena=
ble);
>> +=C2=A0=C2=A0=C2=A0 void (*commit)(struct device *dev);
>> +};
>=20
> Why is this here? You are reproducing our interface with an internal in=
terface. I know where this leads to: you have multiple chipset revisions =
and each has its own implemenation of these internal interfaces.
>=20
> That will absolutely come back to haunt you in the long rung: the more =
chip revisions you support, the more obscure these internal interfaces an=
d implentations become. And you won't be able to change these callbacks, =
as that affects all revisions. We've seen this with a few drivers. It wil=
l become unmaintainable.
>=20
> A better approach is to treat DRM's atomic callback funcs and atomic he=
lper funcs as your interface for each chip revision. So for each model, y=
ou implement a separate modesetting pipeline. When you add a new chip rev=
ision, you copy the previous chip's code into a new file and adopt it. If=
 you find comon code among individual revisions, you can put it into a sh=
ared helper.=C2=A0 With this design, each chip revision stands on its own=
.
>=20
> I suggest to study the mgag200 driver. It detects the chip revision ver=
y early and builds a chip-specific modesetting pipline. Although each chi=
p is handled separately, a lot of shared code is in helpers. So the size =
of the driver remains small.
>=20
hi Thomas:
I'm trying to understand what you're thinking

1. Different chip ids should have their own independent drm_dev, and shou=
ld not be supported based on a same drm_dev.
2. diff chip id , for example dc8200 , dc9000,

struct vs_crtc_funcs {
	void (*enable)(struct device *dev, struct drm_crtc *crtc);
	void (*disable)(struct device *dev, struct drm_crtc *crtc);
	bool (*mode_fixup)(struct device *dev,
			   const struct drm_display_mode *mode,
			   struct drm_display_mode *adjusted_mode);
	void (*set_gamma)(struct device *dev, struct drm_crtc *crtc,
			  struct drm_color_lut *lut, unsigned int size);
	void (*enable_gamma)(struct device *dev, struct drm_crtc *crtc,
			     bool enable);
	void (*enable_vblank)(struct device *dev, bool enable);
	void (*commit)(struct device *dev);
};

static const struct vs_crtc_funcs vs_dc8200_crtc_funcs =3D {...}
static const struct vs_crtc_funcs vs_dc9200_crtc_funcs =3D {...}

struct vs_drm_private {
	struct drm_device base;
	struct device *dma_dev;
	struct iommu_domain *domain;
	unsigned int pitch_alignment;

	const struct vs_crtc_funcs *funcs;
};
for dc8200 vs_drm_bind  to make  funcs=3D &vs_dc8200_crtc_funcs=20
for dc9000 vs_drm_bind  to make  funcs=3D &vs_dc9200_crtc_funcs=20

so when run dc8200 modesetting pipline
I get drm_dev , get the funcs points ,  then I can call dc8200 internal i=
nterfaces .=20

Welcome to correct my thoughts.
thanks
>> +
>> +struct vs_crtc_state {
>> +=C2=A0=C2=A0=C2=A0 struct drm_crtc_state base;
>> +
>> +=C2=A0=C2=A0=C2=A0 u32 sync_mode;
>> +=C2=A0=C2=A0=C2=A0 u32 output_fmt;
>> +=C2=A0=C2=A0=C2=A0 u32 bg_color;
>> +=C2=A0=C2=A0=C2=A0 u8 encoder_type;
>> +=C2=A0=C2=A0=C2=A0 u8 mmu_prefetch;
>> +=C2=A0=C2=A0=C2=A0 u8 bpp;
>> +=C2=A0=C2=A0=C2=A0 bool sync_enable;
>> +=C2=A0=C2=A0=C2=A0 bool dither_enable;
>> +=C2=A0=C2=A0=C2=A0 bool underflow;
>> +};
>> +
>> +struct vs_crtc {
>> +=C2=A0=C2=A0=C2=A0 struct drm_crtc base;
>> +=C2=A0=C2=A0=C2=A0 struct device *dev;
>=20
> That's stored in base.dev already.
>=20
>> +=C2=A0=C2=A0=C2=A0 struct drm_pending_vblank_event *event;
>=20
> That's in drm_crtc_state.event already.
>=20
>> +=C2=A0=C2=A0=C2=A0 unsigned int max_bpc;
>> +=C2=A0=C2=A0=C2=A0 unsigned int color_formats; /* supported color for=
mat */
>=20
> These come from a vs_dc_info. Why not just store a pointer to the info =
instead?
>=20
>> +
>> +=C2=A0=C2=A0=C2=A0 struct drm_property *sync_mode;
>> +=C2=A0=C2=A0=C2=A0 struct drm_property *mmu_prefetch;
>> +=C2=A0=C2=A0=C2=A0 struct drm_property *bg_color;
>> +=C2=A0=C2=A0=C2=A0 struct drm_property *panel_sync;
>> +=C2=A0=C2=A0=C2=A0 struct drm_property *dither;
>> +
>> +=C2=A0=C2=A0=C2=A0 const struct vs_crtc_funcs *funcs;
>=20
> Please, see my rant why that's not a good idea.
>=20
>> +};
>> +
>> +void vs_crtc_destroy(struct drm_crtc *crtc);
>> +
>> +struct vs_crtc *vs_crtc_create(struct drm_device *drm_dev,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vs_dc_info *info);
>> +void vs_crtc_handle_vblank(struct drm_crtc *crtc, bool underflow);
>> +
>> +static inline struct vs_crtc *to_vs_crtc(struct drm_crtc *crtc)
>> +{
>> +=C2=A0=C2=A0=C2=A0 return container_of(crtc, struct vs_crtc, base);
>> +}
>> +
>> +static inline struct vs_crtc_state *
>> +to_vs_crtc_state(struct drm_crtc_state *state)
>> +{
>> +=C2=A0=C2=A0=C2=A0 return container_of(state, struct vs_crtc_state, b=
ase);
>> +}
>> +#endif /* __VS_CRTC_H__ */
>> diff --git a/drivers/gpu/drm/verisilicon/vs_type.h b/drivers/gpu/drm/v=
erisilicon/vs_type.h
>> new file mode 100644
>> index 000000000000..6f8db65a703d
>> --- /dev/null
>> +++ b/drivers/gpu/drm/verisilicon/vs_type.h
>> @@ -0,0 +1,72 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
>> + */
>> +
>> +#ifndef __VS_TYPE_H__
>> +#define __VS_TYPE_H__
>> +
>> +#include <linux/version.h>
>=20
> Why?
>=20

hi Thomas ,=20

this line should be deleted.=20
Historical reasons It has been compatible with multiple kernel versions

=20

> Best regards
> Thomas
>=20
>> +
>> +#include <drm/drm_plane.h>
>> +#include <drm/drm_plane_helper.h>
>> +
>> +struct vs_plane_info {
>> +=C2=A0=C2=A0=C2=A0 const char *name;
>> +=C2=A0=C2=A0=C2=A0 u8 id;
>> +=C2=A0=C2=A0=C2=A0 enum drm_plane_type type;
>> +=C2=A0=C2=A0=C2=A0 unsigned int num_formats;
>> +=C2=A0=C2=A0=C2=A0 const u32 *formats;
>> +=C2=A0=C2=A0=C2=A0 u8 num_modifiers;
>> +=C2=A0=C2=A0=C2=A0 const u64 *modifiers;
>> +=C2=A0=C2=A0=C2=A0 unsigned int min_width;
>> +=C2=A0=C2=A0=C2=A0 unsigned int min_height;
>> +=C2=A0=C2=A0=C2=A0 unsigned int max_width;
>> +=C2=A0=C2=A0=C2=A0 unsigned int max_height;
>> +=C2=A0=C2=A0=C2=A0 unsigned int rotation;
>> +=C2=A0=C2=A0=C2=A0 unsigned int blend_mode;
>> +=C2=A0=C2=A0=C2=A0 unsigned int color_encoding;
>> +
>> +=C2=A0=C2=A0=C2=A0 /* 0 means no de-gamma LUT */
>> +=C2=A0=C2=A0=C2=A0 unsigned int degamma_size;
>> +
>> +=C2=A0=C2=A0=C2=A0 int min_scale; /* 16.16 fixed point */
>> +=C2=A0=C2=A0=C2=A0 int max_scale; /* 16.16 fixed point */
>> +
>> +=C2=A0=C2=A0=C2=A0 /* default zorder value,
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * and 255 means unsupported zorder capabilit=
y
>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0 u8=C2=A0=C2=A0=C2=A0=C2=A0 zpos;
>> +
>> +=C2=A0=C2=A0=C2=A0 bool watermark;
>> +=C2=A0=C2=A0=C2=A0 bool color_mgmt;
>> +=C2=A0=C2=A0=C2=A0 bool roi;
>> +};
>> +
>> +struct vs_dc_info {
>> +=C2=A0=C2=A0=C2=A0 const char *name;
>> +
>> +=C2=A0=C2=A0=C2=A0 u8 panel_num;
>> +
>> +=C2=A0=C2=A0=C2=A0 /* planes */
>> +=C2=A0=C2=A0=C2=A0 u8 plane_num;
>> +=C2=A0=C2=A0=C2=A0 const struct vs_plane_info *planes;
>> +
>> +=C2=A0=C2=A0=C2=A0 u8 layer_num;
>> +=C2=A0=C2=A0=C2=A0 unsigned int max_bpc;
>> +=C2=A0=C2=A0=C2=A0 unsigned int color_formats;
>> +
>> +=C2=A0=C2=A0=C2=A0 /* 0 means no gamma LUT */
>> +=C2=A0=C2=A0=C2=A0 u16 gamma_size;
>> +=C2=A0=C2=A0=C2=A0 u8 gamma_bits;
>> +
>> +=C2=A0=C2=A0=C2=A0 u16 pitch_alignment;
>> +
>> +=C2=A0=C2=A0=C2=A0 bool pipe_sync;
>> +=C2=A0=C2=A0=C2=A0 bool mmu_prefetch;
>> +=C2=A0=C2=A0=C2=A0 bool background;
>> +=C2=A0=C2=A0=C2=A0 bool panel_sync;
>> +=C2=A0=C2=A0=C2=A0 bool cap_dec;
>> +};
>> +
>> +#endif /* __VS_TYPE_H__ */
>=20

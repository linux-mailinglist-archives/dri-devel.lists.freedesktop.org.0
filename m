Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA80A7D804A
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 12:10:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F1610E79D;
	Thu, 26 Oct 2023 10:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
 by gabe.freedesktop.org (Postfix) with ESMTP id AFD5E10E79D
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 10:10:09 +0000 (UTC)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
 by ex01.ufhost.com (Postfix) with ESMTP id E605124E214;
 Thu, 26 Oct 2023 18:10:00 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 26 Oct
 2023 18:10:01 +0800
Received: from [192.168.60.126] (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 26 Oct
 2023 18:10:00 +0800
Message-ID: <b511bc06-157d-8d8c-3788-a776dc806031@starfivetech.com>
Date: Thu, 26 Oct 2023 18:09:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 5/6] drm/vs: Add KMS crtc&plane
Content-Language: en-US
From: Keith Zhao <keith.zhao@starfivetech.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231025103957.3776-1-keith.zhao@starfivetech.com>
 <20231025103957.3776-6-keith.zhao@starfivetech.com>
 <6db09f77-31e8-4f2e-a987-e3745d0e8c24@linaro.org>
 <ZTlxWiX7-vKeLQsc@intel.com>
 <627a0f60-7da0-6683-a451-42801c513308@starfivetech.com>
In-Reply-To: <627a0f60-7da0-6683-a451-42801c513308@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
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
Cc: Emil Renner
 Berthing <kernel@esmil.dk>, dri-devel@lists.freedesktop.org, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-riscv@lists.infradead.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Shengyang Chen <shengyang.chen@starfivetech.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Maxime Ripard <mripard@kernel.org>,
 Jagan Teki <jagan@edgeble.ai>, linaro-mm-sig@lists.linaro.org,
 Rob Herring <robh+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 christian.koenig@amd.com, Jack Zhu <jack.zhu@starfivetech.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

sorry=20
Dmitry ,accidentally wrote the wrong name
Take no offense

On 2023/10/26 17:42, Keith Zhao wrote:
> hi Ville:
> very glad to receive your feedback
> Some of them are very good ideas.
> Some are not very clear and hope to get your further reply!
>=20
>=20
> On 2023/10/26 3:49, Ville Syrj=C3=A4l=C3=A4 wrote:
>> On Wed, Oct 25, 2023 at 10:28:56PM +0300, Dmitry Baryshkov wrote:
>>> On 25/10/2023 13:39, Keith Zhao wrote:
>>> > add 2 crtcs and 8 planes in vs-drm
>>> >=20
>>> > Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
>>> > ---
>>> >   drivers/gpu/drm/verisilicon/Makefile   |    8 +-
>>> >   drivers/gpu/drm/verisilicon/vs_crtc.c  |  257 ++++
>>> >   drivers/gpu/drm/verisilicon/vs_crtc.h  |   43 +
>>> >   drivers/gpu/drm/verisilicon/vs_dc.c    | 1002 ++++++++++++
>>> >   drivers/gpu/drm/verisilicon/vs_dc.h    |   80 +
>>> >   drivers/gpu/drm/verisilicon/vs_dc_hw.c | 1959 +++++++++++++++++++=
+++++
>>> >   drivers/gpu/drm/verisilicon/vs_dc_hw.h |  492 ++++++
>>> >   drivers/gpu/drm/verisilicon/vs_drv.c   |    2 +
>>> >   drivers/gpu/drm/verisilicon/vs_plane.c |  526 +++++++
>>> >   drivers/gpu/drm/verisilicon/vs_plane.h |   58 +
>>> >   drivers/gpu/drm/verisilicon/vs_type.h  |   69 +
>>> >   11 files changed, 4494 insertions(+), 2 deletions(-)
>>> >   create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.c
>>> >   create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.h
>>> >   create mode 100644 drivers/gpu/drm/verisilicon/vs_dc.c
>>> >   create mode 100644 drivers/gpu/drm/verisilicon/vs_dc.h
>>> >   create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_hw.c
>>> >   create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_hw.h
>>> >   create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.c
>>> >   create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.h
>>> >   create mode 100644 drivers/gpu/drm/verisilicon/vs_type.h
>>> >=20
>>> > diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm=
/verisilicon/Makefile
>>> > index 7d3be305b..1d48016ca 100644
>>> > --- a/drivers/gpu/drm/verisilicon/Makefile
>>> > +++ b/drivers/gpu/drm/verisilicon/Makefile
>>> > @@ -1,7 +1,11 @@
>>> >   # SPDX-License-Identifier: GPL-2.0
>>> >  =20
>>> > -vs_drm-objs :=3D vs_drv.o \
>>> > -		vs_modeset.o
>>> > +vs_drm-objs :=3D vs_dc_hw.o \
>>> > +		vs_dc.o \
>>> > +		vs_crtc.o \
>>> > +		vs_drv.o \
>>> > +		vs_modeset.o \
>>> > +		vs_plane.o
>>> >  =20
>>> >   obj-$(CONFIG_DRM_VERISILICON) +=3D vs_drm.o
>>> >  =20
>>> > diff --git a/drivers/gpu/drm/verisilicon/vs_crtc.c b/drivers/gpu/dr=
m/verisilicon/vs_crtc.c
>>> > new file mode 100644
>>> > index 000000000..8a658ea77
>>> > --- /dev/null
>>> > +++ b/drivers/gpu/drm/verisilicon/vs_crtc.c
>>> > @@ -0,0 +1,257 @@
>>> > +// SPDX-License-Identifier: GPL-2.0
>>> > +/*
>>> > + * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
>>> > + *
>>> > + */
>>> > +
>>> > +#include <linux/clk.h>
>>> > +#include <linux/debugfs.h>
>>> > +#include <linux/media-bus-format.h>
>>> > +
>>> > +#include <drm/drm_atomic_helper.h>
>>> > +#include <drm/drm_atomic.h>
>>> > +#include <drm/drm_crtc.h>
>>> > +#include <drm/drm_gem_atomic_helper.h>
>>> > +#include <drm/drm_vblank.h>
>>> > +#include <drm/vs_drm.h>
>>> > +
>>> > +#include "vs_crtc.h"
>>> > +#include "vs_dc.h"
>>> > +#include "vs_drv.h"
>>> > +
>>> > +static void vs_crtc_reset(struct drm_crtc *crtc)
>>> > +{
>>> > +	struct vs_crtc_state *state;
>>> > +
>>> > +	if (crtc->state) {
>>> > +		__drm_atomic_helper_crtc_destroy_state(crtc->state);
>>> > +
>>> > +		state =3D to_vs_crtc_state(crtc->state);
>>> > +		kfree(state);
>>> > +		crtc->state =3D NULL;
>>> > +	}
>>>=20
>>> You can call your crtc_destroy_state function directly here.
> ok got it !
>>>=20
>>> > +
>>> > +	state =3D kzalloc(sizeof(*state), GFP_KERNEL);
>>> > +	if (!state)
>>> > +		return;
>>> > +
>>> > +	__drm_atomic_helper_crtc_reset(crtc, &state->base);
>>> > +}
>>> > +
>>> > +static struct drm_crtc_state *
>>> > +vs_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
>>> > +{
>>> > +	struct vs_crtc_state *ori_state;
>>>=20
>>> It might be a matter of taste, but it is usually old_state.
>>>=20
>>> > +	struct vs_crtc_state *state;
>>> > +
>>> > +	if (!crtc->state)
>>> > +		return NULL;
>>> > +
>>> > +	ori_state =3D to_vs_crtc_state(crtc->state);
>>> > +	state =3D kzalloc(sizeof(*state), GFP_KERNEL);
>>> > +	if (!state)
>>> > +		return NULL;
>>> > +
>>> > +	__drm_atomic_helper_crtc_duplicate_state(crtc, &state->base);
>>> > +
>>> > +	state->output_fmt =3D ori_state->output_fmt;
>>> > +	state->encoder_type =3D ori_state->encoder_type;
>>> > +	state->bpp =3D ori_state->bpp;
>>> > +	state->underflow =3D ori_state->underflow;
>>>=20
>>> Can you use kmemdup instead?
> ok=20
>>>=20
>>> > +
>>> > +	return &state->base;
>>> > +}
>>> > +
>>> > +static void vs_crtc_atomic_destroy_state(struct drm_crtc *crtc,
>>> > +					 struct drm_crtc_state *state)
>>> > +{
>>> > +	__drm_atomic_helper_crtc_destroy_state(state);
>>> > +	kfree(to_vs_crtc_state(state));
>>> > +}
>>> > +
>>> > +static int vs_crtc_enable_vblank(struct drm_crtc *crtc)
>>> > +{
>>> > +	struct vs_crtc *vs_crtc =3D to_vs_crtc(crtc);
>>> > +	struct vs_dc *dc =3D dev_get_drvdata(vs_crtc->dev);
>>> > +
>>> > +	vs_dc_enable_vblank(dc, true);
>>> > +
>>> > +	return 0;
>>> > +}
>>> > +
>>> > +static void vs_crtc_disable_vblank(struct drm_crtc *crtc)
>>> > +{
>>> > +	struct vs_crtc *vs_crtc =3D to_vs_crtc(crtc);
>>> > +	struct vs_dc *dc =3D dev_get_drvdata(vs_crtc->dev);
>>> > +
>>> > +	vs_dc_enable_vblank(dc, false);
>>> > +}
>>> > +
>>> > +static const struct drm_crtc_funcs vs_crtc_funcs =3D {
>>> > +	.set_config		=3D drm_atomic_helper_set_config,
>>> > +	.page_flip		=3D drm_atomic_helper_page_flip,
>>>=20
>>> destroy is required, see drm_mode_config_cleanup()
> will add destory=20
>>>=20
>>> > +	.reset			=3D vs_crtc_reset,
>>> > +	.atomic_duplicate_state =3D vs_crtc_atomic_duplicate_state,
>>> > +	.atomic_destroy_state	=3D vs_crtc_atomic_destroy_state,
>>>=20
>>> please consider adding atomic_print_state to output driver-specific b=
its.
>>>=20
> will add atomic_print_state  to print my private definitions
>>> > +	.enable_vblank		=3D vs_crtc_enable_vblank,
>>> > +	.disable_vblank		=3D vs_crtc_disable_vblank,
>>> > +};
>>> > +
>>> > +static u8 cal_pixel_bits(u32 bus_format)
>>>=20
>>> This looks like a generic helper code, which can go to a common place=
.
>>>=20
>>> > +{
>>> > +	u8 bpp;
>>> > +
>>> > +	switch (bus_format) {
>>> > +	case MEDIA_BUS_FMT_RGB565_1X16:
>>> > +	case MEDIA_BUS_FMT_UYVY8_1X16:
>>> > +		bpp =3D 16;
>>> > +		break;
>>> > +	case MEDIA_BUS_FMT_RGB666_1X18:
>>> > +	case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
>>> > +		bpp =3D 18;
>>> > +		break;
>>> > +	case MEDIA_BUS_FMT_UYVY10_1X20:
>>> > +		bpp =3D 20;
>>> > +		break;
>>> > +	case MEDIA_BUS_FMT_BGR888_1X24:
>>> > +	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
>>> > +	case MEDIA_BUS_FMT_YUV8_1X24:
>>> > +		bpp =3D 24;
>>> > +		break;
>>> > +	case MEDIA_BUS_FMT_RGB101010_1X30:
>>> > +	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
>>> > +	case MEDIA_BUS_FMT_YUV10_1X30:
>>> > +		bpp =3D 30;
>>> > +		break;
>>> > +	default:
>>> > +		bpp =3D 24;
>>> > +		break;
>>> > +	}
>>> > +
>>> > +	return bpp;
>>> > +}
>>> > +
>>> > +static void vs_crtc_atomic_enable(struct drm_crtc *crtc,
>>> > +				  struct drm_atomic_state *state)
>>> > +{
>>> > +	struct vs_crtc *vs_crtc =3D to_vs_crtc(crtc);
>>> > +	struct vs_dc *dc =3D dev_get_drvdata(vs_crtc->dev);
>>> > +	struct vs_crtc_state *vs_crtc_state =3D to_vs_crtc_state(crtc->st=
ate);
>>> > +
>>> > +	vs_crtc_state->bpp =3D cal_pixel_bits(vs_crtc_state->output_fmt);
>>> > +
>>> > +	vs_dc_enable(dc, crtc);
>>> > +	drm_crtc_vblank_on(crtc);
>>> > +}
>>> > +
>>> > +static void vs_crtc_atomic_disable(struct drm_crtc *crtc,
>>> > +				   struct drm_atomic_state *state)
>>> > +{
>>> > +	struct vs_crtc *vs_crtc =3D to_vs_crtc(crtc);
>>> > +	struct vs_dc *dc =3D dev_get_drvdata(vs_crtc->dev);
>>> > +
>>> > +	drm_crtc_vblank_off(crtc);
>>> > +
>>> > +	vs_dc_disable(dc, crtc);
>>> > +
>>> > +	if (crtc->state->event && !crtc->state->active) {
>>> > +		spin_lock_irq(&crtc->dev->event_lock);
>>> > +		drm_crtc_send_vblank_event(crtc, crtc->state->event);
>>> > +		spin_unlock_irq(&crtc->dev->event_lock);
>>> > +
>>> > +		crtc->state->event =3D NULL;
>>>=20
>>> I think even should be cleared within the lock.
>>=20
>> event_lock doesn't protect anything in the crtc state.
>=20
> how about match like this:
> spin_lock_irq(&crtc->dev->event_lock);
> if (crtc->state->event) {
> 	drm_crtc_send_vblank_event(crtc, crtc->state->event);
> 	crtc->state->event =3D NULL;
> }
> spin_unlock_irq(&crtc->dev->event_lock);
>=20
>>=20
>> But the bigger problem in this code is the prevalent crtc->state
>> usage. That should pretty much never be done, especially in anything
>> that can get called from the actual commit phase where you no longer
>> have the locks held. Instead one should almost always use the
>> get_{new,old}_state() stuff, or the old/new/oldnew state iterators.
>=20
> the prevalent crtc->state usage :
> crtc->state should not be used directly?
> need replace it by get_{new,old}_state()
>=20
> for example:
> drm_crtc_send_vblank_event(crtc, crtc->state->event);
>=20
>=20
> should do like this :
> struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(sta=
te, crtc);
> ...
> drm_crtc_send_vblank_event(crtc, crtc_state->event);
> ...
>=20
> If there is a problem, help further correct
> wish give a example
> Thanks
>=20
>>=20
>>>=20
>>> > +	}
>>> > +}
>>> > +
>>> > +static void vs_crtc_atomic_begin(struct drm_crtc *crtc,
>>> > +				 struct drm_atomic_state *state)
>>> > +{
>>> > +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_sta=
te(state,
>>> > +									  crtc);
>>> > +
>>> > +	struct vs_crtc *vs_crtc =3D to_vs_crtc(crtc);
>>> > +	struct device *dev =3D vs_crtc->dev;
>>> > +	struct drm_property_blob *blob =3D crtc->state->gamma_lut;
>>=20
>> Eg. here you are using drm_atomic_get_new_crtc_state() correctly, but
>> then proceed to directly access crtc->state anyway.
>>=20
> struct drm_property_blob *blob =3D crtc->state->gamma_lut;
> change to=20
> struct drm_property_blob *blob =3D crtc_state ->gamma_lut;
>=20
>>> > +	struct drm_color_lut *lut;
>>> > +	struct vs_dc *dc =3D dev_get_drvdata(dev);
>>> > +
>>> > +	if (crtc_state->color_mgmt_changed) {
>>> > +		if (blob && blob->length) {
>>> > +			lut =3D blob->data;
>>> > +			vs_dc_set_gamma(dc, crtc, lut,
>>> > +					blob->length / sizeof(*lut));
>>> > +			vs_dc_enable_gamma(dc, crtc, true);
>>> > +		} else {
>>> > +			vs_dc_enable_gamma(dc, crtc, false);
>>> > +		}
>>> > +	}
>>> > +}
>>=20

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF8B75C276
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 11:06:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C2E710E1CE;
	Fri, 21 Jul 2023 09:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
 by gabe.freedesktop.org (Postfix) with ESMTP id BDAFC10E1CE
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 09:06:44 +0000 (UTC)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
 by fd01.gateway.ufhost.com (Postfix) with ESMTP id 829F424DED7;
 Fri, 21 Jul 2023 17:06:33 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 21 Jul
 2023 17:06:33 +0800
Received: from [192.168.60.102] (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 21 Jul
 2023 17:06:32 +0800
Message-ID: <af5422e8-c14b-c47c-e699-884ec65bf87f@starfivetech.com>
Date: Fri, 21 Jul 2023 17:06:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 5/9] drm/verisilicon: Add mode config funcs
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
 <20230602074043.33872-6-keith.zhao@starfivetech.com>
 <30008535-8606-fc6d-9c07-23d46f59c957@suse.de>
From: Keith Zhao <keith.zhao@starfivetech.com>
In-Reply-To: <30008535-8606-fc6d-9c07-23d46f59c957@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX061.cuchost.com
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



On 2023/6/21 19:04, Thomas Zimmermann wrote:
> Hi Keith
>=20
> Am 02.06.23 um 09:40 schrieb Keith Zhao:
>> Add mode setting functions for JH7110 SoC.
>>
>> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
>> ---
>> =C2=A0 drivers/gpu/drm/verisilicon/Makefile |=C2=A0=C2=A0 1 +
>> =C2=A0 drivers/gpu/drm/verisilicon/vs_drv.c |=C2=A0=C2=A0 3 +
>=20
>> =C2=A0 drivers/gpu/drm/verisilicon/vs_fb.c=C2=A0 | 181 +++++++++++++++=
++++++++++++
>> =C2=A0 drivers/gpu/drm/verisilicon/vs_fb.h=C2=A0 |=C2=A0 15 +++
>=20
> I'd call these files vs_modeset.{c,h} to be consistent with the rest of=
 the drivers.
>=20
>> =C2=A0 4 files changed, 200 insertions(+)
>> =C2=A0 create mode 100644 drivers/gpu/drm/verisilicon/vs_fb.c
>> =C2=A0 create mode 100644 drivers/gpu/drm/verisilicon/vs_fb.h
>>
>> diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/ve=
risilicon/Makefile
>> index 30360e370e47..38254dc5d98d 100644
>> --- a/drivers/gpu/drm/verisilicon/Makefile
>> +++ b/drivers/gpu/drm/verisilicon/Makefile
>> @@ -1,6 +1,7 @@
>> =C2=A0 # SPDX-License-Identifier: GPL-2.0
>> =C2=A0 =C2=A0 vs_drm-objs :=3D vs_drv.o \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vs_fb.o \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vs_gem.o
>> =C2=A0 =C2=A0 obj-$(CONFIG_DRM_VERISILICON) +=3D vs_drm.o
>> diff --git a/drivers/gpu/drm/verisilicon/vs_drv.c b/drivers/gpu/drm/ve=
risilicon/vs_drv.c
>> index e0a2fc43b55f..d84aacd751bc 100644
>> --- a/drivers/gpu/drm/verisilicon/vs_drv.c
>> +++ b/drivers/gpu/drm/verisilicon/vs_drv.c
>> @@ -30,6 +30,7 @@
>> =C2=A0 #include <drm/drm_vblank.h>
>> =C2=A0 =C2=A0 #include "vs_drv.h"
>> +#include "vs_fb.h"
>> =C2=A0 #include "vs_gem.h"
>> =C2=A0 =C2=A0 #define DRV_NAME=C2=A0=C2=A0=C2=A0 "starfive"
>> @@ -118,6 +119,8 @@ static int vs_drm_bind(struct device *dev)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_mode;
>> =C2=A0 +=C2=A0=C2=A0=C2=A0 vs_mode_config_init(drm_dev);
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D drm_vblank_init(drm_dev, drm_de=
v->mode_config.num_crtc);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_bind;
>> diff --git a/drivers/gpu/drm/verisilicon/vs_fb.c b/drivers/gpu/drm/ver=
isilicon/vs_fb.c
>> new file mode 100644
>> index 000000000000..3e85f7365084
>> --- /dev/null
>> +++ b/drivers/gpu/drm/verisilicon/vs_fb.c
>> @@ -0,0 +1,181 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/version.h>
>> +
>> +#include <drm/drm_damage_helper.h>
>> +#include <drm/drm_fb_helper.h>
>> +#include <drm/drm_crtc.h>
>> +#include <drm/drm_crtc_helper.h>
>> +#include <drm/drm_fourcc.h>
>> +#include <drm/drm_framebuffer.h>
>> +#include <drm/drm_gem.h>
>> +#include <drm/drm_gem_framebuffer_helper.h>
>> +
>> +#include "vs_fb.h"
>> +#include "vs_gem.h"
>> +
>> +#define fourcc_mod_vs_get_type(val) \
>> +=C2=A0=C2=A0=C2=A0 (((val) & DRM_FORMAT_MOD_VS_TYPE_MASK) >> 54)
>> +
>> +static struct drm_framebuffer_funcs vs_fb_funcs =3D {
>> +=C2=A0=C2=A0=C2=A0 .create_handle=C2=A0=C2=A0=C2=A0 =3D drm_gem_fb_cr=
eate_handle,
>> +=C2=A0=C2=A0=C2=A0 .destroy=C2=A0=C2=A0=C2=A0 =3D drm_gem_fb_destroy,
>> +=C2=A0=C2=A0=C2=A0 .dirty=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
 drm_atomic_helper_dirtyfb,
>> +};
>> +
>> +static struct drm_framebuffer *
>> +vs_fb_alloc(struct drm_device *dev, const struct drm_mode_fb_cmd2 *mo=
de_cmd,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vs_gem_object **obj=
, unsigned int num_planes)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct drm_framebuffer *fb;
>> +=C2=A0=C2=A0=C2=A0 int ret, i;
>> +
>> +=C2=A0=C2=A0=C2=A0 fb =3D kzalloc(sizeof(*fb), GFP_KERNEL);
>> +=C2=A0=C2=A0=C2=A0 if (!fb)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ERR_PTR(-ENOMEM);
>> +
>> +=C2=A0=C2=A0=C2=A0 drm_helper_mode_fill_fb_struct(dev, fb, mode_cmd);
>> +
>> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < num_planes; i++)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fb->obj[i] =3D &obj[i]->ba=
se;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D drm_framebuffer_init(dev, fb, &vs_fb_funcs=
);
>> +=C2=A0=C2=A0=C2=A0 if (ret) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev->dev, "Failed =
to initialize framebuffer: %d\n",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
t);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kfree(fb);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ERR_PTR(ret);
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 return fb;
>> +}
>> +
>> +static struct drm_framebuffer *vs_fb_create(struct drm_device *dev,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 str=
uct drm_file *file_priv,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 con=
st struct drm_mode_fb_cmd2 *mode_cmd)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct drm_framebuffer *fb;
>> +=C2=A0=C2=A0=C2=A0 const struct drm_format_info *info;
>> +=C2=A0=C2=A0=C2=A0 struct vs_gem_object *objs[MAX_NUM_PLANES];
>> +=C2=A0=C2=A0=C2=A0 struct drm_gem_object *obj;
>> +=C2=A0=C2=A0=C2=A0 unsigned int height, size;
>> +=C2=A0=C2=A0=C2=A0 unsigned char i, num_planes;
>> +=C2=A0=C2=A0=C2=A0 int ret =3D 0;
>> +
>> +=C2=A0=C2=A0=C2=A0 info =3D drm_get_format_info(dev, mode_cmd);
>> +=C2=A0=C2=A0=C2=A0 if (!info)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ERR_PTR(-EINVAL);
>> +
>> +=C2=A0=C2=A0=C2=A0 num_planes =3D info->num_planes;
>> +=C2=A0=C2=A0=C2=A0 if (num_planes > MAX_NUM_PLANES)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ERR_PTR(-EINVAL);
>> +
>> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < num_planes; i++) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 obj =3D drm_gem_object_loo=
kup(file_priv, mode_cmd->handles[i]);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!obj) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de=
v_err(dev->dev, "Failed to lookup GEM object.\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
t =3D -ENXIO;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 go=
to err;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 height =3D drm_format_info=
_plane_height(info,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mode_cmd->height, i);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size =3D height * mode_cmd=
->pitches[i] + mode_cmd->offsets[i];
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (obj->size < size) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dr=
m_gem_object_put(obj);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
t =3D -EINVAL;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 go=
to err;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 objs[i] =3D to_vs_gem_obje=
ct(obj);
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 fb =3D vs_fb_alloc(dev, mode_cmd, objs, i);
>> +=C2=A0=C2=A0=C2=A0 if (IS_ERR(fb)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D PTR_ERR(fb);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 return fb;
>> +
>> +err:
>> +=C2=A0=C2=A0=C2=A0 for (; i > 0; i--)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_gem_object_put(&objs[i=
 - 1]->base);
>> +
>> +=C2=A0=C2=A0=C2=A0 return ERR_PTR(ret);
>> +}
>> +
>> +struct vs_gem_object *vs_fb_get_gem_obj(struct drm_framebuffer *fb,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned char plane)
>> +{
>> +=C2=A0=C2=A0=C2=A0 if (plane > MAX_NUM_PLANES)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
>> +
>> +=C2=A0=C2=A0=C2=A0 return to_vs_gem_object(fb->obj[plane]);
>> +}
>> +
>> +static const struct drm_format_info vs_formats[] =3D {
>> +=C2=A0=C2=A0=C2=A0 {.format =3D DRM_FORMAT_NV12, .depth =3D 0, .num_p=
lanes =3D 2, .char_per_block =3D { 20, 40, 0 },
>> +=C2=A0=C2=A0=C2=A0=C2=A0 .block_w =3D { 4, 4, 0 }, .block_h =3D { 4, =
4, 0 }, .hsub =3D 2, .vsub =3D 2, .is_yuv =3D true},
>> +=C2=A0=C2=A0=C2=A0 {.format =3D DRM_FORMAT_YUV444, .depth =3D 0, .num=
_planes =3D 3, .char_per_block =3D { 20, 20, 20 },
>> +=C2=A0=C2=A0=C2=A0=C2=A0 .block_w =3D { 4, 4, 4 }, .block_h =3D { 4, =
4, 4 }, .hsub =3D 1, .vsub =3D 1, .is_yuv =3D true},
>> +};
>> +
>> +static const struct drm_format_info *
>> +vs_lookup_format_info(const struct drm_format_info formats[],
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 int num_formats, u32 format)
>> +{
>> +=C2=A0=C2=A0=C2=A0 int i;
>> +
>> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < num_formats; i++) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (formats[i].format =3D=3D=
 format)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn &formats[i];
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 return NULL;
>> +}
>> +
>> +static const struct drm_format_info *
>> +vs_get_format_info(const struct drm_mode_fb_cmd2 *cmd)
>> +{
>> +=C2=A0=C2=A0=C2=A0 if (fourcc_mod_vs_get_type(cmd->modifier[0]) =3D=3D
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_FORMAT_MOD_VS_TYPE_CUS=
TOM_10BIT)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return vs_lookup_format_in=
fo(vs_formats, ARRAY_SIZE(vs_formats),
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
cmd->pixel_format);
>> +=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
>> +}
>> +
>> +static const struct drm_mode_config_funcs vs_mode_config_funcs =3D {
>> +=C2=A0=C2=A0=C2=A0 .fb_create=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D vs_fb_create,
>=20
> Maybe I'm missing something here, but it looks like you can call
> drm_gem_fb_create_with_funcs() to create the framebuffer.
>=20
That's a brilliant suggestion!!!=20


>> +=C2=A0=C2=A0=C2=A0 .get_format_info=C2=A0=C2=A0=C2=A0=C2=A0 =3D vs_ge=
t_format_info,
>> +=C2=A0=C2=A0=C2=A0 .output_poll_changed =3D drm_fb_helper_output_poll=
_changed,
>> +=C2=A0=C2=A0=C2=A0 .atomic_check=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D drm_atomic_helper_check,
>> +=C2=A0=C2=A0=C2=A0 .atomic_commit=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =3D drm_atomic_helper_commit,
>> +};
>> +
>> +static struct drm_mode_config_helper_funcs vs_mode_config_helpers =3D=
 {
>> +=C2=A0=C2=A0=C2=A0 .atomic_commit_tail =3D drm_atomic_helper_commit_t=
ail_rpm,
>> +};
>> +
>> +void vs_mode_config_init(struct drm_device *dev)
>> +{
>=20
> If possible, move the call to drm_mode_config_init() into this function=
.
>=20
move drm_mode_config_init() into vs_mode_config_init.=20
and vs_mode_config_init must be called ahead component_bind_all

like this:
static int vs_drm_bind(struct device *dev)
{
	......

	vs_mode_config_init(drm_dev);

	/* Now try and bind all our sub-components */
	ret =3D component_bind_all(dev, drm_dev);
	if (ret)
		goto err_mode;
	......
}

>> +=C2=A0=C2=A0=C2=A0 dev->mode_config.fb_modifiers_not_supported =3D fa=
lse;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (dev->mode_config.max_width =3D=3D 0 ||
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->mode_config.max_heigh=
t =3D=3D 0) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->mode_config.min_width=
=C2=A0 =3D 0;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->mode_config.min_heigh=
t =3D 0;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->mode_config.max_width=
=C2=A0 =3D 4096;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->mode_config.max_heigh=
t =3D 4096;
>> +=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 dev->mode_config.funcs =3D &vs_mode_config_funcs;
>> +=C2=A0=C2=A0=C2=A0 dev->mode_config.helper_private =3D &vs_mode_confi=
g_helpers;
>> +}
>> diff --git a/drivers/gpu/drm/verisilicon/vs_fb.h b/drivers/gpu/drm/ver=
isilicon/vs_fb.h
>> new file mode 100644
>> index 000000000000..78dda8e42894
>> --- /dev/null
>> +++ b/drivers/gpu/drm/verisilicon/vs_fb.h
>> @@ -0,0 +1,15 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
>> + */
>> +
>> +#ifndef __VS_FB_H__
>> +#define __VS_FB_H__
>> +
>> +#define MAX_NUM_PLANES=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3 /*=
 colour format plane */
>=20
> There's DRM_FORMAT_MAX_PLANES already. Please don't introduce a constan=
t with the same purpose.
>=20
ok good idea=EF=BC=81=20
> Best regards
> Thomas
>=20
>> +
>> +struct vs_gem_object *vs_fb_get_gem_obj(struct drm_framebuffer *fb,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned char plane);
>> +
>> +void vs_mode_config_init(struct drm_device *dev);
>> +#endif /* __VS_FB_H__ */
>=20

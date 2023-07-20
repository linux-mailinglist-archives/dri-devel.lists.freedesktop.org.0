Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C9D75AB98
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 12:00:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A859210E092;
	Thu, 20 Jul 2023 10:00:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4DC5D10E092
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 10:00:41 +0000 (UTC)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
 by ex01.ufhost.com (Postfix) with ESMTP id 7445524E26B;
 Thu, 20 Jul 2023 18:00:30 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 20 Jul
 2023 18:00:30 +0800
Received: from [192.168.60.133] (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 20 Jul
 2023 18:00:29 +0800
Message-ID: <5135e2cc-8a50-700c-25cf-6fd8a564a2b9@starfivetech.com>
Date: Thu, 20 Jul 2023 18:00:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 4/9] drm/verisilicon: Add gem driver for JH7110 SoC
To: Thomas Zimmermann <tzimmermann@suse.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
 <20230602074043.33872-5-keith.zhao@starfivetech.com>
 <09c4c066-6467-57d1-364b-be8964f6b0bb@suse.de>
Content-Language: en-US
From: Keith Zhao <keith.zhao@starfivetech.com>
In-Reply-To: <09c4c066-6467-57d1-364b-be8964f6b0bb@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
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
 Shengyang Chen <shengyang.chen@starfivetech.com>,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Maxime Ripard <mripard@kernel.org>, Jagan Teki <jagan@edgeble.ai>, Rob
 Herring <robh+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jack Zhu <jack.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Shawn Guo <shawnguo@kernel.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023/6/19 21:18, Thomas Zimmermann wrote:
>=20
>=20
> Am 02.06.23 um 09:40 schrieb Keith Zhao:
>> This patch implements gem related APIs for JH7100 SoC.
>>
>> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
>> ---
>> =C2=A0 drivers/gpu/drm/verisilicon/Makefile |=C2=A0=C2=A0 3 +-
>> =C2=A0 drivers/gpu/drm/verisilicon/vs_drv.c |=C2=A0=C2=A0 6 +
>> =C2=A0 drivers/gpu/drm/verisilicon/vs_gem.c | 372 ++++++++++++++++++++=
+++++++
>> =C2=A0 drivers/gpu/drm/verisilicon/vs_gem.h |=C2=A0 72 ++++++
>> =C2=A0 4 files changed, 452 insertions(+), 1 deletion(-)
>> =C2=A0 create mode 100644 drivers/gpu/drm/verisilicon/vs_gem.c
>> =C2=A0 create mode 100644 drivers/gpu/drm/verisilicon/vs_gem.h
>>
>> diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/ve=
risilicon/Makefile
>> index 64ce1b26546c..30360e370e47 100644
>> --- a/drivers/gpu/drm/verisilicon/Makefile
>> +++ b/drivers/gpu/drm/verisilicon/Makefile
>> @@ -1,6 +1,7 @@
>> =C2=A0 # SPDX-License-Identifier: GPL-2.0
>> =C2=A0 -vs_drm-objs :=3D vs_drv.o
>> +vs_drm-objs :=3D vs_drv.o \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vs_gem.o
>> =C2=A0 =C2=A0 obj-$(CONFIG_DRM_VERISILICON) +=3D vs_drm.o
>> =C2=A0 diff --git a/drivers/gpu/drm/verisilicon/vs_drv.c b/drivers/gpu=
/drm/verisilicon/vs_drv.c
>> index 24d333598477..e0a2fc43b55f 100644
>> --- a/drivers/gpu/drm/verisilicon/vs_drv.c
>> +++ b/drivers/gpu/drm/verisilicon/vs_drv.c
>> @@ -30,6 +30,7 @@
>> =C2=A0 #include <drm/drm_vblank.h>
>> =C2=A0 =C2=A0 #include "vs_drv.h"
>> +#include "vs_gem.h"
>> =C2=A0 =C2=A0 #define DRV_NAME=C2=A0=C2=A0=C2=A0 "starfive"
>> =C2=A0 #define DRV_DESC=C2=A0=C2=A0=C2=A0 "Starfive DRM driver"
>> @@ -47,6 +48,7 @@ static const struct file_operations fops =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .compat_ioctl=C2=A0=C2=A0=C2=A0 =3D drm=
_compat_ioctl,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .poll=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D drm_poll,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .read=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D drm_read,
>> +=C2=A0=C2=A0=C2=A0 .mmap=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 =3D vs_gem_mmap,
>> =C2=A0 };
>> =C2=A0 =C2=A0 static struct drm_driver vs_drm_driver =3D {
>> @@ -54,6 +56,10 @@ static struct drm_driver vs_drm_driver =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .lastclose=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =3D drm_fb_helper_lastclose,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .prime_handle_to_fd =3D drm_gem_prime_h=
andle_to_fd,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .prime_fd_to_handle =3D drm_gem_prime_f=
d_to_handle,
>> +=C2=A0=C2=A0=C2=A0 .gem_prime_import=C2=A0=C2=A0=C2=A0 =3D vs_gem_pri=
me_import,
>> +=C2=A0=C2=A0=C2=A0 .gem_prime_import_sg_table =3D vs_gem_prime_import=
_sg_table,
>> +=C2=A0=C2=A0=C2=A0 .gem_prime_mmap=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D vs_gem_prime_mmap,
>> +=C2=A0=C2=A0=C2=A0 .dumb_create=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D vs_gem_dumb_create,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fops=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &fops,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D DRV_NAME,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .desc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D DRV_DESC,
>> diff --git a/drivers/gpu/drm/verisilicon/vs_gem.c b/drivers/gpu/drm/ve=
risilicon/vs_gem.c
>> new file mode 100644
>> index 000000000000..3f963471c1ab
>> --- /dev/null
>> +++ b/drivers/gpu/drm/verisilicon/vs_gem.c
>> @@ -0,0 +1,372 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
>> + */
>> +
>> +#include <linux/dma-buf.h>
>> +#include <linux/of_reserved_mem.h>
>> +#include <drm/drm_gem_dma_helper.h>
>> +
>> +#include "vs_drv.h"
>> +#include "vs_gem.h"
>> +
>> +static const struct drm_gem_object_funcs vs_gem_default_funcs;
>> +
>> +static int vs_gem_alloc_buf(struct vs_gem_object *vs_obj)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct drm_device *dev =3D vs_obj->base.dev;
>> +=C2=A0=C2=A0=C2=A0 unsigned int nr_pages;
>> +=C2=A0=C2=A0=C2=A0 struct sg_table sgt;
>> +=C2=A0=C2=A0=C2=A0 int ret =3D -ENOMEM;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (vs_obj->dma_addr) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_DEV_DEBUG_KMS(dev->dev=
, "already allocated.\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 vs_obj->dma_attrs =3D DMA_ATTR_WRITE_COMBINE | DMA=
_ATTR_FORCE_CONTIGUOUS
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | DMA_ATTR_NO_KERNEL_MAPPING;
>> +
>> +=C2=A0=C2=A0=C2=A0 nr_pages =3D vs_obj->size >> PAGE_SHIFT;
>> +
>> +=C2=A0=C2=A0=C2=A0 vs_obj->pages =3D kvmalloc_array(nr_pages, sizeof(=
struct page *),
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GFP_KERNE=
L | __GFP_ZERO);
>> +=C2=A0=C2=A0=C2=A0 if (!vs_obj->pages) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_DEV_ERROR(dev->dev, "f=
ailed to allocate pages.\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 vs_obj->cookie =3D dma_alloc_attrs(to_dma_dev(dev)=
, vs_obj->size,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &vs_obj->dma_addr, GF=
P_KERNEL,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vs_obj->dma_attrs);
>> +
>> +=C2=A0=C2=A0=C2=A0 if (!vs_obj->cookie) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_DEV_ERROR(dev->dev, "f=
ailed to allocate buffer.\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_free;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 vs_obj->iova =3D vs_obj->dma_addr;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D dma_get_sgtable_attrs(to_dma_dev(dev), &sg=
t,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vs_obj->cookie, vs_obj->dma=
_addr,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vs_obj->size, vs_obj->dma_a=
ttrs);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_DEV_ERROR(dev->dev, "f=
ailed to get sgtable.\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_mem_free;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 if (drm_prime_sg_to_page_array(&sgt, vs_obj->pages=
, nr_pages)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_DEV_ERROR(dev->dev, "i=
nvalid sgtable.\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D -EINVAL;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_sgt_free;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 sg_free_table(&sgt);
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +
>> +err_sgt_free:
>> +=C2=A0=C2=A0=C2=A0 sg_free_table(&sgt);
>> +err_mem_free:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_free_attrs(to_dma_dev(=
dev), vs_obj->size, vs_obj->cookie,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vs_obj->dma_addr, vs_obj->dma_att=
rs);
>> +err_free:
>> +=C2=A0=C2=A0=C2=A0 kvfree(vs_obj->pages);
>> +
>> +=C2=A0=C2=A0=C2=A0 return ret;
>> +}
>> +
>> +static void vs_gem_free_buf(struct vs_gem_object *vs_obj)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct drm_device *dev =3D vs_obj->base.dev;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (!vs_obj->dma_addr) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_DEV_DEBUG_KMS(dev->dev=
, "dma_addr is invalid.\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 dma_free_attrs(to_dma_dev(dev), vs_obj->size, vs_o=
bj->cookie,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 (dma_addr_t)vs_obj->dma_addr,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 vs_obj->dma_attrs);
>> +
>> +=C2=A0=C2=A0=C2=A0 kvfree(vs_obj->pages);
>> +}
>> +
>> +static void vs_gem_free_object(struct drm_gem_object *obj)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct vs_gem_object *vs_obj =3D to_vs_gem_object(=
obj);
>> +
>> +=C2=A0=C2=A0=C2=A0 if (obj->import_attach)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_prime_gem_destroy(obj,=
 vs_obj->sgt);
>> +=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vs_gem_free_buf(vs_obj);
>> +
>> +=C2=A0=C2=A0=C2=A0 drm_gem_object_release(obj);
>> +
>> +=C2=A0=C2=A0=C2=A0 kfree(vs_obj);
>> +}
>> +
>> +static struct vs_gem_object *vs_gem_alloc_object(struct drm_device *d=
ev,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 size_t size)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct vs_gem_object *vs_obj;
>> +=C2=A0=C2=A0=C2=A0 struct drm_gem_object *obj;
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 vs_obj =3D kzalloc(sizeof(*vs_obj), GFP_KERNEL);
>> +=C2=A0=C2=A0=C2=A0 if (!vs_obj)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ERR_PTR(-ENOMEM);
>> +
>> +=C2=A0=C2=A0=C2=A0 vs_obj->size =3D size;
>> +=C2=A0=C2=A0=C2=A0 obj =3D &vs_obj->base;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D drm_gem_object_init(dev, obj, size);
>> +=C2=A0=C2=A0=C2=A0 if (ret)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_free;
>> +
>> +=C2=A0=C2=A0=C2=A0 vs_obj->base.funcs =3D &vs_gem_default_funcs;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D drm_gem_create_mmap_offset(obj);
>> +=C2=A0=C2=A0=C2=A0 if (ret) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_gem_object_release(obj=
);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_free;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 return vs_obj;
>> +
>> +err_free:
>> +=C2=A0=C2=A0=C2=A0 kfree(vs_obj);
>> +=C2=A0=C2=A0=C2=A0 return ERR_PTR(ret);
>> +}
>> +
>> +struct vs_gem_object *vs_gem_create_object(struct drm_device *dev,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t si=
ze)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct vs_gem_object *vs_obj;
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 size =3D PAGE_ALIGN(size);
>> +
>> +=C2=A0=C2=A0=C2=A0 vs_obj =3D vs_gem_alloc_object(dev, size);
>> +=C2=A0=C2=A0=C2=A0 if (IS_ERR(vs_obj))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return vs_obj;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D vs_gem_alloc_buf(vs_obj);
>> +=C2=A0=C2=A0=C2=A0 if (ret) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_gem_object_release(&vs=
_obj->base);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kfree(vs_obj);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ERR_PTR(ret);
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 return vs_obj;
>> +}
>> +
>> +static struct vs_gem_object *vs_gem_create_with_handle(struct drm_dev=
ice *dev,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_file *file,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t size,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int *handle)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct vs_gem_object *vs_obj;
>> +=C2=A0=C2=A0=C2=A0 struct drm_gem_object *obj;
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 vs_obj =3D vs_gem_create_object(dev, size);
>> +=C2=A0=C2=A0=C2=A0 if (IS_ERR(vs_obj))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return vs_obj;
>> +
>> +=C2=A0=C2=A0=C2=A0 obj =3D &vs_obj->base;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D drm_gem_handle_create(file, obj, handle);
>> +
>> +=C2=A0=C2=A0=C2=A0 drm_gem_object_put(obj);
>> +
>> +=C2=A0=C2=A0=C2=A0 if (ret)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ERR_PTR(ret);
>> +
>> +=C2=A0=C2=A0=C2=A0 return vs_obj;
>> +}
>> +
>> +static int vs_gem_mmap_obj(struct drm_gem_object *obj,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 struct vm_area_struct *vma)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct vs_gem_object *vs_obj =3D to_vs_gem_object(=
obj);
>> +=C2=A0=C2=A0=C2=A0 struct drm_device *drm_dev =3D vs_obj->base.dev;
>> +=C2=A0=C2=A0=C2=A0 unsigned long vm_size;
>> +=C2=A0=C2=A0=C2=A0 int ret =3D 0;
>> +
>> +=C2=A0=C2=A0=C2=A0 vm_size =3D vma->vm_end - vma->vm_start;
>> +=C2=A0=C2=A0=C2=A0 if (vm_size > vs_obj->size)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>> +
>> +=C2=A0=C2=A0=C2=A0 vma->vm_pgoff =3D 0;
>> +
>> +=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * We allocated a struct page table for starf=
ive_obj, so clear
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * VM_PFNMAP flag that was set by drm_gem_mma=
p_obj()/drm_gem_mmap().
>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0 vm_flags_mod(vma, VM_IO | VM_DONTEXPAND | VM_DONTD=
UMP, VM_PFNMAP);
>> +
>> +=C2=A0=C2=A0=C2=A0 vma->vm_page_prot =3D pgprot_writecombine(vm_get_p=
age_prot(vma->vm_flags));
>> +=C2=A0=C2=A0=C2=A0 vma->vm_page_prot =3D pgprot_decrypted(vma->vm_pag=
e_prot);
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D dma_mmap_attrs(to_dma_dev(drm_dev), vma, v=
s_obj->cookie,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 vs_obj->dma_addr, vs_obj->size,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 vs_obj->dma_attrs);
>> +
>> +=C2=A0=C2=A0=C2=A0 if (ret)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_gem_vm_close(vma);
>> +
>> +=C2=A0=C2=A0=C2=A0 return ret;
>> +}
>> +
>> +struct sg_table *vs_gem_prime_get_sg_table(struct drm_gem_object *obj=
)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct vs_gem_object *vs_obj =3D to_vs_gem_object(=
obj);
>> +
>> +=C2=A0=C2=A0=C2=A0 return drm_prime_pages_to_sg(obj->dev, vs_obj->pag=
es,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vs_obj->size >> PAGE_=
SHIFT);
>> +}
>> +
>> +int vs_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *m=
ap)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct vs_gem_object *vs_obj =3D to_vs_gem_object(=
obj);
>> +
>> +=C2=A0=C2=A0=C2=A0 void *vaddr =3D vs_obj->dma_attrs & DMA_ATTR_NO_KE=
RNEL_MAPPING ?
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 page_address(vs_obj->cookie) : vs_obj->cookie;
>> +
>> +=C2=A0=C2=A0=C2=A0 iosys_map_set_vaddr(map, vaddr);
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +void vs_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map=
 *map)
>> +{
>> +=C2=A0=C2=A0=C2=A0 /* Nothing to do */
>> +}
>> +
>> +static const struct vm_operations_struct vs_vm_ops =3D {
>> +=C2=A0=C2=A0=C2=A0 .open=C2=A0 =3D drm_gem_vm_open,
>> +=C2=A0=C2=A0=C2=A0 .close =3D drm_gem_vm_close,
>> +};
>> +
>> +static const struct drm_gem_object_funcs vs_gem_default_funcs =3D {
>> +=C2=A0=C2=A0=C2=A0 .free =3D vs_gem_free_object,
>> +=C2=A0=C2=A0=C2=A0 .get_sg_table =3D vs_gem_prime_get_sg_table,
>> +=C2=A0=C2=A0=C2=A0 .vmap =3D vs_gem_prime_vmap,
>> +=C2=A0=C2=A0=C2=A0 .vunmap =3D vs_gem_prime_vunmap,
>> +=C2=A0=C2=A0=C2=A0 .vm_ops =3D &vs_vm_ops,
>> +};
>> +
>> +int vs_gem_dumb_create(struct drm_file *file,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 struct drm_device *dev,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 struct drm_mode_create_dumb *args)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct vs_drm_private *priv =3D dev->dev_private;
>> +=C2=A0=C2=A0=C2=A0 struct vs_gem_object *vs_obj;
>> +=C2=A0=C2=A0=C2=A0 unsigned int pitch =3D DIV_ROUND_UP(args->width * =
args->bpp, 8);
>> +
>> +=C2=A0=C2=A0=C2=A0 if (args->bpp % 10)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 args->pitch =3D ALIGN(pitc=
h, priv->pitch_alignment);
>> +=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* for costum 10bit format=
 with no bit gaps */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 args->pitch =3D pitch;
>> +=C2=A0=C2=A0=C2=A0 args->size =3D PAGE_ALIGN(args->pitch * args->heig=
ht);
>> +=C2=A0=C2=A0=C2=A0 vs_obj =3D vs_gem_create_with_handle(dev, file, ar=
gs->size,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &args->ha=
ndle);
>> +=C2=A0=C2=A0=C2=A0 return PTR_ERR_OR_ZERO(vs_obj);
>> +}
>> +
>> +struct drm_gem_object *vs_gem_prime_import(struct drm_device *dev,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dm=
a_buf *dma_buf)
>> +{
>> +=C2=A0=C2=A0=C2=A0 return drm_gem_prime_import_dev(dev, dma_buf, to_d=
ma_dev(dev));
>> +}
>> +
>> +struct drm_gem_object *
>> +vs_gem_prime_import_sg_table(struct drm_device *dev,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dma_buf_attachment *attach,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct sg_table *sgt)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct vs_gem_object *vs_obj;
>> +=C2=A0=C2=A0=C2=A0 int npages;
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +=C2=A0=C2=A0=C2=A0 struct scatterlist *s;
>> +=C2=A0=C2=A0=C2=A0 u32 i;
>> +=C2=A0=C2=A0=C2=A0 dma_addr_t expected;
>> +=C2=A0=C2=A0=C2=A0 size_t size =3D attach->dmabuf->size;
>> +
>> +=C2=A0=C2=A0=C2=A0 size =3D PAGE_ALIGN(size);
>> +
>> +=C2=A0=C2=A0=C2=A0 vs_obj =3D vs_gem_alloc_object(dev, size);
>> +=C2=A0=C2=A0=C2=A0 if (IS_ERR(vs_obj))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ERR_CAST(vs_obj);
>> +
>> +=C2=A0=C2=A0=C2=A0 expected =3D sg_dma_address(sgt->sgl);
>> +=C2=A0=C2=A0=C2=A0 for_each_sg(sgt->sgl, s, sgt->nents, i) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (sg_dma_address(s) !=3D=
 expected) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DR=
M_ERROR("sg_table is not contiguous");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
t =3D -EINVAL;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 go=
to err;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (sg_dma_len(s) & (PAGE_=
SIZE - 1)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
t =3D -EINVAL;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 go=
to err;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (i =3D=3D 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vs=
_obj->iova =3D sg_dma_address(s);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 expected =3D sg_dma_addres=
s(s) + sg_dma_len(s);
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 vs_obj->dma_addr =3D sg_dma_address(sgt->sgl);
>> +
>> +=C2=A0=C2=A0=C2=A0 npages =3D vs_obj->size >> PAGE_SHIFT;
>> +=C2=A0=C2=A0=C2=A0 vs_obj->pages =3D kvmalloc_array(npages, sizeof(st=
ruct page *),
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GFP_KERNE=
L);
>> +=C2=A0=C2=A0=C2=A0 if (!vs_obj->pages) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D -ENOMEM;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D drm_prime_sg_to_page_array(sgt, vs_obj->pa=
ges, npages);
>> +=C2=A0=C2=A0=C2=A0 if (ret)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_free_page;
>> +
>> +=C2=A0=C2=A0=C2=A0 vs_obj->sgt =3D sgt;
>> +
>> +=C2=A0=C2=A0=C2=A0 return &vs_obj->base;
>> +
>> +err_free_page:
>> +=C2=A0=C2=A0=C2=A0 kvfree(vs_obj->pages);
>> +err:
>> +=C2=A0=C2=A0=C2=A0 vs_gem_free_object(&vs_obj->base);
>> +
>> +=C2=A0=C2=A0=C2=A0 return ERR_PTR(ret);
>> +}
>> +
>> +int vs_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_stru=
ct *vma)
>> +{
>> +=C2=A0=C2=A0=C2=A0 int ret =3D 0;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D drm_gem_mmap_obj(obj, obj->size, vma);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 return vs_gem_mmap_obj(obj, vma);
>> +}
>> +
>> +int vs_gem_mmap(struct file *filp, struct vm_area_struct *vma)
>=20
> This function needs to go away.
>=20
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct drm_gem_object *obj;
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D drm_gem_mmap(filp, vma);
>=20
> Set drm_gem_mmap() as your fops.mmap callback.
>=20
>> +=C2=A0=C2=A0=C2=A0 if (ret)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 obj =3D vma->vm_private_data;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (obj->import_attach)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return dma_buf_mmap(obj->d=
ma_buf, vma, 0);
>> +
>> +=C2=A0=C2=A0=C2=A0 return vs_gem_mmap_obj(obj, vma);
>=20
> Both, dma_buf and regular objects, should be handled in struct drm_gem_=
object_funcs.mmap. drm_gem_mmap() will call it for you. vs_gem_mmap_obj()=
 can then be removed.
>=20
> you can find example code in drm_gem_shmem_helper.c and drm_gem_dma_hel=
per.c on how to write GEM object's mmap function.
>=20

hi Thomas :=20
yes , it is a good idea ,=20
It can largely reuse drm helper interfaces rather than defining its own s=
et of interfaces.

I added=20
.mmap =3D drm_gem_dma_object_mmap,
in my own defineed drm_gem_object_funcs

also use "struct drm_gem_dma_object base;" to replace  "struct drm_gem_ob=
ject base;"
this makes my code more consice!
>=20
>> +}
>> diff --git a/drivers/gpu/drm/verisilicon/vs_gem.h b/drivers/gpu/drm/ve=
risilicon/vs_gem.h
>> new file mode 100644
>> index 000000000000..3a6d7452cb06
>> --- /dev/null
>> +++ b/drivers/gpu/drm/verisilicon/vs_gem.h
>> @@ -0,0 +1,72 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
>> + */
>> +
>> +#ifndef __VS_GEM_H__
>> +#define __VS_GEM_H__
>> +
>> +#include <linux/dma-buf.h>
>> +
>> +#include <drm/drm_gem.h>
>> +#include <drm/drm_prime.h>
>> +
>> +#include "vs_drv.h"
>> +/*
>> + *
>> + * @base: drm gem object.
>> + * @size: size requested from user
>> + * @cookie: cookie returned by dma_alloc_attrs
>> + *=C2=A0=C2=A0=C2=A0 - not kernel virtual address with DMA_ATTR_NO_KE=
RNEL_MAPPING
>> + * @dma_addr: bus address(accessed by dma) to allocated memory region=
.
>> + *=C2=A0=C2=A0=C2=A0 - this address could be physical address without=
 IOMMU and
>> + *=C2=A0=C2=A0=C2=A0 device address with IOMMU.
>> + * @dma_attrs: attribute for DMA API
>> + * @get_pages: flag for manually applying for non-contiguous memory.
>> + * @pages: Array of backing pages.
>> + * @sgt: Imported sg_table.
>> + *
>> + */
>> +struct vs_gem_object {
>> +=C2=A0=C2=A0=C2=A0 struct drm_gem_object=C2=A0=C2=A0=C2=A0 base;
>> +=C2=A0=C2=A0=C2=A0 size_t=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 size;
>> +=C2=A0=C2=A0=C2=A0 void=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 *cookie;
>> +=C2=A0=C2=A0=C2=A0 dma_addr_t=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 dma_addr;
>> +=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iova;
>> +=C2=A0=C2=A0=C2=A0 unsigned long=C2=A0=C2=A0=C2=A0 dma_attrs;
>> +=C2=A0=C2=A0=C2=A0 bool=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 get_pages;
>> +=C2=A0=C2=A0=C2=A0 struct page=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 **pages;
>> +=C2=A0=C2=A0=C2=A0 struct sg_table *sgt;
>> +};
>> +
>> +static inline
>> +struct vs_gem_object *to_vs_gem_object(struct drm_gem_object *obj)
>> +{
>> +=C2=A0=C2=A0=C2=A0 return container_of(obj, struct vs_gem_object, bas=
e);
>> +}
>> +
>> +struct vs_gem_object *vs_gem_create_object(struct drm_device *dev,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t si=
ze);
>> +
>> +int vs_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *m=
ap);
>> +void vs_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map=
 *map);
>=20
>=20
>=20
>> +
>> +int vs_gem_prime_mmap(struct drm_gem_object *obj,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 struct vm_area_struct *vma);
>> +
>> +int vs_gem_dumb_create(struct drm_file *file_priv,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 struct drm_device *drm,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 struct drm_mode_create_dumb *args);
>> +
>> +int vs_gem_mmap(struct file *filp, struct vm_area_struct *vma);
>> +
>> +struct sg_table *vs_gem_prime_get_sg_table(struct drm_gem_object *obj=
);
>> +
>> +struct drm_gem_object *vs_gem_prime_import(struct drm_device *dev,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dm=
a_buf *dma_buf);
>> +struct drm_gem_object *
>> +vs_gem_prime_import_sg_table(struct drm_device *dev,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dma_buf_attachment *attach,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct sg_table *sgt);
>> +
>> +#endif /* __VS_GEM_H__ */
>=20

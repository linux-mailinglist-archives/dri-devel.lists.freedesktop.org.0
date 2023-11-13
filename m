Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 709557E9BEB
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 13:12:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D5410E35D;
	Mon, 13 Nov 2023 12:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4BAE810E35D
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 12:11:55 +0000 (UTC)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
 by ex01.ufhost.com (Postfix) with ESMTP id BE3EA24E23E;
 Mon, 13 Nov 2023 20:11:43 +0800 (CST)
Received: from EXMBX161.cuchost.com (172.16.6.71) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 13 Nov
 2023 20:11:43 +0800
Received: from [192.168.1.115] (180.164.60.184) by EXMBX161.cuchost.com
 (172.16.6.71) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 13 Nov
 2023 20:11:42 +0800
Message-ID: <4f37d075-9b3a-4222-8124-1bb3983ea00b@starfivetech.com>
Date: Mon, 13 Nov 2023 20:11:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] drm/vs: Add hdmi driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
References: <20231025103957.3776-1-keith.zhao@starfivetech.com>
 <20231025103957.3776-7-keith.zhao@starfivetech.com>
 <70805ff2-56a8-45e1-a31c-ffb0e84749e5@linaro.org>
Content-Language: en-US
From: Keith Zhao <keith.zhao@starfivetech.com>
In-Reply-To: <70805ff2-56a8-45e1-a31c-ffb0e84749e5@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX161.cuchost.com
 (172.16.6.71)
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
Cc: Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Emil Renner Berthing <kernel@esmil.dk>, christian.koenig@amd.com,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <andersson@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Maxime Ripard <mripard@kernel.org>, Jagan Teki <jagan@edgeble.ai>,
 Jack Zhu <jack.zhu@starfivetech.com>, Rob
 Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Shengyang
 Chen <shengyang.chen@starfivetech.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Shawn Guo <shawnguo@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023/10/26 6:23, Dmitry Baryshkov wrote:
> On 25/10/2023 13:39, Keith Zhao wrote:
>> add hdmi driver as encoder and connect
>>
>> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
>> ---
>> =C2=A0 drivers/gpu/drm/verisilicon/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +-
>> =C2=A0 drivers/gpu/drm/verisilicon/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
>> =C2=A0 drivers/gpu/drm/verisilicon/starfive_hdmi.c | 949 +++++++++++++=
+++++++
>> =C2=A0 drivers/gpu/drm/verisilicon/starfive_hdmi.h | 295 ++++++
>> =C2=A0 drivers/gpu/drm/verisilicon/vs_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +
>> =C2=A0 drivers/gpu/drm/verisilicon/vs_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +
>> =C2=A0 6 files changed, 1261 insertions(+), 1 deletion(-)
>> =C2=A0 create mode 100644 drivers/gpu/drm/verisilicon/starfive_hdmi.c
>> =C2=A0 create mode 100644 drivers/gpu/drm/verisilicon/starfive_hdmi.h
>>
>> diff --git a/drivers/gpu/drm/verisilicon/Kconfig b/drivers/gpu/drm/ver=
isilicon/Kconfig
>> index 3a361f8c8..122c786e3 100644
>> --- a/drivers/gpu/drm/verisilicon/Kconfig
>> +++ b/drivers/gpu/drm/verisilicon/Kconfig
>> @@ -12,4 +12,10 @@ config DRM_VERISILICON
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 setting and buffer manageme=
nt. It does not
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 provide 2D or 3D accelerati=
on.
>> =C2=A0 -
>> +config DRM_VERISILICON_STARFIVE_HDMI
>> +=C2=A0=C2=A0=C2=A0 bool "Starfive HDMI extensions"
>> +=C2=A0=C2=A0=C2=A0 depends on DRM_VERISILICON
>> +=C2=A0=C2=A0=C2=A0 help
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This selects support for StarFiv=
e soc specific extensions
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for the Innosilicon HDMI driver.=
 If you want to enable
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 HDMI on JH7110 based soc, you sh=
ould select this option.
>> diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/ve=
risilicon/Makefile
>> index 1d48016ca..08350f25b 100644
>> --- a/drivers/gpu/drm/verisilicon/Makefile
>> +++ b/drivers/gpu/drm/verisilicon/Makefile
>> @@ -7,5 +7,6 @@ vs_drm-objs :=3D vs_dc_hw.o \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vs_modeset.o \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vs_plane.o
>> =C2=A0 +vs_drm-$(CONFIG_DRM_VERISILICON_STARFIVE_HDMI) +=3D starfive_h=
dmi.o
>> =C2=A0 obj-$(CONFIG_DRM_VERISILICON) +=3D vs_drm.o
>> =C2=A0 diff --git a/drivers/gpu/drm/verisilicon/starfive_hdmi.c b/driv=
ers/gpu/drm/verisilicon/starfive_hdmi.c
>> new file mode 100644
>> index 000000000..d296c4b71
>> --- /dev/null
>> +++ b/drivers/gpu/drm/verisilicon/starfive_hdmi.c
>> @@ -0,0 +1,949 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2023 StarFive Technology Co., Ltd.
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/component.h>
>> +#include <linux/delay.h>
>> +#include <linux/err.h>
>> +#include <linux/hdmi.h>
>> +#include <linux/i2c.h>
>> +#include <linux/irq.h>
>> +#include <linux/media-bus-format.h>
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/of_device.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/reset.h>
>> +
>> +#include <drm/bridge/dw_hdmi.h>
>> +#include <drm/drm_atomic_helper.h>
>> +#include <drm/drm_edid.h>
>> +#include <drm/drm_managed.h>
>> +#include <drm/drm_of.h>
>> +#include <drm/drm_probe_helper.h>
>> +#include <drm/drm_simple_kms_helper.h>
>> +
>> +#include "starfive_hdmi.h"
>> +#include "vs_drv.h"
>> +#include "vs_crtc.h"
>> +
>> +static struct starfive_hdmi *encoder_to_hdmi(struct drm_encoder *enco=
der)
>> +{
>> +=C2=A0=C2=A0=C2=A0 return container_of(encoder, struct starfive_hdmi,=
 encoder);
>> +}
>> +
>> +static struct starfive_hdmi *connector_to_hdmi(struct drm_connector *=
connector)
>> +{
>> +=C2=A0=C2=A0=C2=A0 return container_of(connector, struct starfive_hdm=
i, connector);
>> +}
>> +
>> +struct starfive_hdmi_i2c {
>> +=C2=A0=C2=A0=C2=A0 struct i2c_adapter adap;
>> +
>> +=C2=A0=C2=A0=C2=A0 u8 ddc_addr;
>> +=C2=A0=C2=A0=C2=A0 u8 segment_addr;
>> +=C2=A0=C2=A0=C2=A0 /* protects the edid data when use i2c cmd to read=
 edid */
>> +=C2=A0=C2=A0=C2=A0 struct mutex lock;
>> +=C2=A0=C2=A0=C2=A0 struct completion cmp;
>> +};
>> +
>> +static const struct pre_pll_config pre_pll_cfg_table[] =3D {
>> +=C2=A0=C2=A0=C2=A0 { 25175000,=C2=A0 25175000, 1,=C2=A0 100, 2, 3, 3,=
 12, 3, 3, 4, 0, 0xf55555},
>> +=C2=A0=C2=A0=C2=A0 { 25200000,=C2=A0 25200000, 1,=C2=A0 100, 2, 3, 3,=
 12, 3, 3, 4, 0, 0},
>> +=C2=A0=C2=A0=C2=A0 { 27000000,=C2=A0 27000000, 1,=C2=A0 90, 3, 2, 2, =
10, 3, 3, 4, 0, 0},
>=20
> Such data structures are usually pretyt limited and hard to handle. Cou=
ld you please replace it with the runtime calculations of
>=20
>> +=C2=A0=C2=A0=C2=A0 { 27027000,=C2=A0 27027000, 1,=C2=A0 90, 3, 2, 2, =
10, 3, 3, 4, 0, 0x170a3d},
>> +=C2=A0=C2=A0=C2=A0 { 28320000,=C2=A0 28320000, 1,=C2=A0 28, 2, 1, 1,=C2=
=A0 3, 0, 3, 4, 0, 0x51eb85},
>> +=C2=A0=C2=A0=C2=A0 { 30240000,=C2=A0 30240000, 1,=C2=A0 30, 2, 1, 1,=C2=
=A0 3, 0, 3, 4, 0, 0x3d70a3},
>> +=C2=A0=C2=A0=C2=A0 { 31500000,=C2=A0 31500000, 1,=C2=A0 31, 2, 1, 1,=C2=
=A0 3, 0, 3, 4, 0, 0x7fffff},
>> +=C2=A0=C2=A0=C2=A0 { 33750000,=C2=A0 33750000, 1,=C2=A0 33, 2, 1, 1,=C2=
=A0 3, 0, 3, 4, 0, 0xcfffff},
>> +=C2=A0=C2=A0=C2=A0 { 36000000,=C2=A0 36000000, 1,=C2=A0 36, 2, 1, 1,=C2=
=A0 3, 0, 3, 4, 0, 0},
>> +=C2=A0=C2=A0=C2=A0 { 40000000,=C2=A0 40000000, 1,=C2=A0 80, 2, 2, 2, =
12, 2, 2, 2, 0, 0},
>> +=C2=A0=C2=A0=C2=A0 { 46970000,=C2=A0 46970000, 1,=C2=A0 46, 2, 1, 1,=C2=
=A0 3, 0, 3, 4, 0, 0xf851eb},
>> +=C2=A0=C2=A0=C2=A0 { 49500000,=C2=A0 49500000, 1,=C2=A0 49, 2, 1, 1,=C2=
=A0 3, 0, 3, 4, 0, 0x7fffff},
>> +=C2=A0=C2=A0=C2=A0 { 49000000,=C2=A0 49000000, 1,=C2=A0 49, 2, 1, 1,=C2=
=A0 3, 0, 3, 4, 0, 0},
>> +=C2=A0=C2=A0=C2=A0 { 50000000,=C2=A0 50000000, 1,=C2=A0 50, 2, 1, 1,=C2=
=A0 3, 0, 3, 4, 0, 0},
>> +=C2=A0=C2=A0=C2=A0 { 54000000,=C2=A0 54000000, 1,=C2=A0 54, 2, 1, 1,=C2=
=A0 3, 0, 3, 4, 0, 0},
>> +=C2=A0=C2=A0=C2=A0 { 54054000,=C2=A0 54054000, 1,=C2=A0 54, 2, 1, 1,=C2=
=A0 3, 0, 3, 4, 0, 0x0dd2f1},
>> +=C2=A0=C2=A0=C2=A0 { 57284000,=C2=A0 57284000, 1,=C2=A0 57, 2, 1, 1,=C2=
=A0 3, 0, 3, 4, 0, 0x48b439},
>> +=C2=A0=C2=A0=C2=A0 { 58230000,=C2=A0 58230000, 1,=C2=A0 58, 2, 1, 1,=C2=
=A0 3, 0, 3, 4, 0, 0x3ae147},
>> +=C2=A0=C2=A0=C2=A0 { 59341000,=C2=A0 59341000, 1,=C2=A0 59, 2, 1, 1,=C2=
=A0 3, 0, 3, 4, 0, 0x574bc6},
>> +=C2=A0=C2=A0=C2=A0 { 59400000,=C2=A0 59400000, 1,=C2=A0 99, 3, 1, 1,=C2=
=A0 1, 3, 3, 4, 0, 0},
>> +=C2=A0=C2=A0=C2=A0 { 65000000,=C2=A0 65000000, 1, 130, 2, 2, 2,=C2=A0=
 12, 0, 2, 2, 0, 0},
>> +=C2=A0=C2=A0=C2=A0 { 68250000,=C2=A0 68250000, 1, 68,=C2=A0 2, 1, 1,=C2=
=A0 3,=C2=A0 0, 3, 4, 0, 0x3fffff},
>> +=C2=A0=C2=A0=C2=A0 { 71000000,=C2=A0 71000000, 1,=C2=A0 71, 2, 1, 1,=C2=
=A0 3, 0, 3,=C2=A0 4, 0, 0},
>> +=C2=A0=C2=A0=C2=A0 { 74176000,=C2=A0 74176000, 1,=C2=A0 98, 1, 2, 2,=C2=
=A0 1, 2, 3, 4, 0, 0xe6ae6b},
>> +=C2=A0=C2=A0=C2=A0 { 74250000,=C2=A0 74250000, 1,=C2=A0 99, 1, 2, 2,=C2=
=A0 1, 2, 3, 4, 0, 0},
>> +=C2=A0=C2=A0=C2=A0 { 75000000,=C2=A0 75000000, 1,=C2=A0 75, 2, 1, 1,=C2=
=A0 3, 0, 3, 4, 0, 0},
>> +=C2=A0=C2=A0=C2=A0 { 78750000,=C2=A0 78750000, 1,=C2=A0 78, 2, 1, 1,=C2=
=A0 3, 0, 3, 4, 0, 0xcfffff},
>> +=C2=A0=C2=A0=C2=A0 { 79500000,=C2=A0 79500000, 1,=C2=A0 79, 2, 1, 1,=C2=
=A0 3, 0, 3, 4, 0, 0x7fffff},
>> +=C2=A0=C2=A0=C2=A0 { 83500000,=C2=A0 83500000, 2, 167, 2, 1, 1,=C2=A0=
 1, 0, 0,=C2=A0 6, 0, 0},
>> +=C2=A0=C2=A0=C2=A0 { 83500000, 104375000, 1, 104, 2, 1, 1,=C2=A0 1, 1=
, 0,=C2=A0 5, 0, 0x600000},
>> +=C2=A0=C2=A0=C2=A0 { 84858000,=C2=A0 84858000, 1,=C2=A0 85, 2, 1, 1,=C2=
=A0 3, 0, 3,=C2=A0 4, 0, 0xdba5e2},
>> +=C2=A0=C2=A0=C2=A0 { 85500000,=C2=A0 85500000, 1,=C2=A0 85, 2, 1, 1,=C2=
=A0 3, 0, 3,=C2=A0 4, 0, 0x7fffff},
>> +=C2=A0=C2=A0=C2=A0 { 85750000,=C2=A0 85750000, 1,=C2=A0 85, 2, 1, 1,=C2=
=A0 3, 0, 3,=C2=A0 4, 0, 0xcfffff},
>> +=C2=A0=C2=A0=C2=A0 { 85800000,=C2=A0 85800000, 1,=C2=A0 85, 2, 1, 1,=C2=
=A0 3, 0, 3,=C2=A0 4, 0, 0xcccccc},
>> +=C2=A0=C2=A0=C2=A0 { 88750000,=C2=A0 88750000, 1,=C2=A0 88, 2, 1, 1,=C2=
=A0 3, 0, 3,=C2=A0 4, 0, 0xcfffff},
>> +=C2=A0=C2=A0=C2=A0 { 89910000,=C2=A0 89910000, 1,=C2=A0 89, 2, 1, 1,=C2=
=A0 3, 0, 3, 4, 0, 0xe8f5c1},
>> +=C2=A0=C2=A0=C2=A0 { 90000000,=C2=A0 90000000, 1,=C2=A0 90, 2, 1, 1,=C2=
=A0 3, 0, 3, 4, 0, 0},
>> +=C2=A0=C2=A0=C2=A0 {101000000, 101000000, 1, 101, 2, 1, 1,=C2=A0 3, 0=
, 3, 4, 0, 0},
>> +=C2=A0=C2=A0=C2=A0 {102250000, 102250000, 1, 102, 2, 1, 1,=C2=A0 3, 0=
, 3, 4, 0, 0x3fffff},
>> +=C2=A0=C2=A0=C2=A0 {106500000, 106500000, 1, 106, 2, 1, 1,=C2=A0 3, 0=
, 3, 4, 0, 0x7fffff},
>> +=C2=A0=C2=A0=C2=A0 {108000000, 108000000, 1,=C2=A0 90, 3, 0, 0,=C2=A0=
 5, 0, 2,=C2=A0 2, 0, 0},
>> +=C2=A0=C2=A0=C2=A0 {119000000, 119000000, 1, 119, 2, 1, 1,=C2=A0 3, 0=
, 3,=C2=A0 4, 0, 0},
>> +=C2=A0=C2=A0=C2=A0 {131481000, 131481000, 1,=C2=A0 131, 2, 1, 1,=C2=A0=
 3, 0, 3,=C2=A0 4, 0, 0x7b22d1},
>> +=C2=A0=C2=A0=C2=A0 {135000000, 135000000, 1,=C2=A0 135, 2, 1, 1,=C2=A0=
 3, 0, 3, 4, 0, 0},
>> +=C2=A0=C2=A0=C2=A0 {136750000, 136750000, 1,=C2=A0 136, 2, 1, 1,=C2=A0=
 3, 0, 3, 4, 0, 0xcfffff},
>> +=C2=A0=C2=A0=C2=A0 {147180000, 147180000, 1,=C2=A0 147, 2, 1, 1,=C2=A0=
 3, 0, 3, 4, 0, 0x2e147a},
>> +=C2=A0=C2=A0=C2=A0 {148352000, 148352000, 1,=C2=A0 98, 1, 1, 1,=C2=A0=
 1, 2, 2, 2, 0, 0xe6ae6b},
>> +=C2=A0=C2=A0=C2=A0 {148500000, 148500000, 1,=C2=A0 99, 1, 1, 1,=C2=A0=
 1, 2, 2, 2, 0, 0},
>> +=C2=A0=C2=A0=C2=A0 {154000000, 154000000, 1, 154, 2, 1, 1,=C2=A0 3, 0=
, 3, 4, 0, 0},
>> +=C2=A0=C2=A0=C2=A0 {156000000, 156000000, 1, 156, 2, 1, 1,=C2=A0 3, 0=
, 3, 4, 0, 0},
>> +=C2=A0=C2=A0=C2=A0 {157000000, 157000000, 1, 157, 2, 1, 1,=C2=A0 3, 0=
, 3, 4, 0, 0},
>> +=C2=A0=C2=A0=C2=A0 {162000000, 162000000, 1, 162, 2, 1, 1,=C2=A0 3, 0=
, 3, 4, 0, 0},
>> +=C2=A0=C2=A0=C2=A0 {174250000, 174250000, 1, 145, 3, 0, 0,=C2=A0 5, 0=
, 2, 2, 0, 0x355555},
>> +=C2=A0=C2=A0=C2=A0 {174500000, 174500000, 1, 174, 2, 1, 1,=C2=A0 3, 0=
, 3, 4, 0, 0x7fffff},
>> +=C2=A0=C2=A0=C2=A0 {174570000, 174570000, 1, 174, 2, 1, 1,=C2=A0 3, 0=
, 3, 4, 0, 0x91eb84},
>> +=C2=A0=C2=A0=C2=A0 {175500000, 175500000, 1, 175, 2, 1, 1,=C2=A0 3, 0=
, 3, 4, 0, 0x7fffff},
>> +=C2=A0=C2=A0=C2=A0 {185590000, 185590000, 1, 185, 2, 1, 1,=C2=A0 3, 0=
, 3, 4, 0, 0x970a3c},
>> +=C2=A0=C2=A0=C2=A0 {187000000, 187000000, 1, 187, 2, 1, 1,=C2=A0 3, 0=
, 3, 4, 0, 0},
>> +=C2=A0=C2=A0=C2=A0 {241500000, 241500000, 1, 161, 1, 1, 1,=C2=A0 4, 0=
, 2,=C2=A0 2, 0, 0},
>> +=C2=A0=C2=A0=C2=A0 {241700000, 241700000, 1, 241, 2, 1, 1,=C2=A0 3, 0=
, 3,=C2=A0 4, 0, 0xb33332},
>> +=C2=A0=C2=A0=C2=A0 {262750000, 262750000, 1, 262, 2, 1, 1,=C2=A0 3, 0=
, 3,=C2=A0 4, 0, 0xcfffff},
>> +=C2=A0=C2=A0=C2=A0 {296500000, 296500000, 1, 296, 2, 1, 1,=C2=A0 3, 0=
, 3,=C2=A0 4, 0, 0x7fffff},
>> +=C2=A0=C2=A0=C2=A0 {296703000, 296703000, 1,=C2=A0 98, 0, 1, 1,=C2=A0=
 1, 0, 2,=C2=A0 2, 0, 0xe6ae6b},
>> +=C2=A0=C2=A0=C2=A0 {297000000, 297000000, 1,=C2=A0 99, 0, 1, 1,=C2=A0=
 1, 0, 2,=C2=A0 2, 0, 0},
>> +=C2=A0=C2=A0=C2=A0 {594000000, 594000000, 1,=C2=A0 99, 0, 2, 0,=C2=A0=
 1, 0, 1,=C2=A0 1, 0, 0},
>> +=C2=A0=C2=A0=C2=A0 {0, 0, 0,=C2=A0 0, 0, 0, 0,=C2=A0 0, 0, 0,=C2=A0 0=
, 0, 0},
>> +};
>> +
>> +static const struct post_pll_config post_pll_cfg_table[] =3D {
>> +=C2=A0=C2=A0=C2=A0 {25200000,=C2=A0=C2=A0=C2=A0 1, 80, 13, 3, 1},
>> +=C2=A0=C2=A0=C2=A0 {27000000,=C2=A0=C2=A0=C2=A0 1, 40, 11, 3, 1},
>> +=C2=A0=C2=A0=C2=A0 {33750000,=C2=A0=C2=A0=C2=A0 1, 40, 11, 3, 1},
>> +=C2=A0=C2=A0=C2=A0 {49000000,=C2=A0=C2=A0=C2=A0 1, 20, 1, 3, 3},
>> +=C2=A0=C2=A0=C2=A0 {241700000, 1, 20, 1, 3, 3},
>> +=C2=A0=C2=A0=C2=A0 {297000000, 4, 20, 0, 0, 3},
>> +=C2=A0=C2=A0=C2=A0 {594000000, 4, 20, 0, 0, 0},
>> +=C2=A0=C2=A0=C2=A0 { /* sentinel */ }
>> +};
>> +
>> +inline u8 hdmi_readb(struct starfive_hdmi *hdmi, u16 offset)
>> +{
>> +=C2=A0=C2=A0=C2=A0 return readl_relaxed(hdmi->regs + (offset) * 0x04)=
;
>> +}
>> +
>> +inline void hdmi_writeb(struct starfive_hdmi *hdmi, u16 offset, u32 v=
al)
>> +{
>> +=C2=A0=C2=A0=C2=A0 writel_relaxed(val, hdmi->regs + (offset) * 0x04);
>> +}
>> +
>> +inline void hdmi_modb(struct starfive_hdmi *hdmi, u16 offset,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 msk, u32 val)
>> +{
>> +=C2=A0=C2=A0=C2=A0 u8 temp =3D hdmi_readb(hdmi, offset) & ~msk;
>> +
>> +=C2=A0=C2=A0=C2=A0 temp |=3D val & msk;
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, offset, temp);
>> +}
>> +
>> +static int starfive_hdmi_enable_clk_deassert_rst(struct device *dev, =
struct starfive_hdmi *hdmi)
>> +{
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D clk_prepare_enable(hdmi->sys_clk);
>> +=C2=A0=C2=A0=C2=A0 if (ret) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, "Cannot enabl=
e HDMI sys clock: %d\n", ret);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D clk_prepare_enable(hdmi->mclk);
>> +=C2=A0=C2=A0=C2=A0 if (ret) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, "Cannot enabl=
e HDMI mclk clock: %d\n", ret);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_mclk;
>> +=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 ret =3D clk_prepare_enable(hdmi->bclk);
>=20
> This code begs to use clk_bulk instead.
>=20
>> +=C2=A0=C2=A0=C2=A0 if (ret) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, "Cannot enabl=
e HDMI bclk clock: %d\n", ret);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_bclk;
>> +=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 ret =3D reset_control_deassert(hdmi->tx_rst);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, "failed to de=
assert tx_rst\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_rst;
>> +=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +
>> +err_rst:
>> +=C2=A0=C2=A0=C2=A0 clk_disable_unprepare(hdmi->bclk);
>> +err_bclk:
>> +=C2=A0=C2=A0=C2=A0 clk_disable_unprepare(hdmi->mclk);
>> +err_mclk:
>> +=C2=A0=C2=A0=C2=A0 clk_disable_unprepare(hdmi->sys_clk);
>> +=C2=A0=C2=A0=C2=A0 return ret;
>> +}
>> +
>> +static void starfive_hdmi_disable_clk_assert_rst(struct device *dev, =
struct starfive_hdmi *hdmi)
>> +{
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D reset_control_assert(hdmi->tx_rst);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, "failed to as=
sert tx_rst\n");
>> +
>> +=C2=A0=C2=A0=C2=A0 clk_disable_unprepare(hdmi->sys_clk);
>> +=C2=A0=C2=A0=C2=A0 clk_disable_unprepare(hdmi->mclk);
>> +=C2=A0=C2=A0=C2=A0 clk_disable_unprepare(hdmi->bclk);
>> +}
>> +
>> +#ifdef CONFIG_PM_SLEEP
>> +static int hdmi_system_pm_suspend(struct device *dev)
>> +{
>> +=C2=A0=C2=A0=C2=A0 return pm_runtime_force_suspend(dev);
>> +}
>> +
>> +static int hdmi_system_pm_resume(struct device *dev)
>> +{
>> +=C2=A0=C2=A0=C2=A0 return pm_runtime_force_resume(dev);
>> +}
>> +#endif
>> +
>> +#ifdef CONFIG_PM
>> +static int hdmi_runtime_suspend(struct device *dev)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct starfive_hdmi *hdmi =3D dev_get_drvdata(dev=
);
>> +
>> +=C2=A0=C2=A0=C2=A0 starfive_hdmi_disable_clk_assert_rst(dev, hdmi);
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +static int hdmi_runtime_resume(struct device *dev)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct starfive_hdmi *hdmi =3D dev_get_drvdata(dev=
);
>> +
>> +=C2=A0=C2=A0=C2=A0 return starfive_hdmi_enable_clk_deassert_rst(dev, =
hdmi);
>> +}
>> +#endif
>> +
>> +static void starfive_hdmi_tx_phy_power_down(struct starfive_hdmi *hdm=
i)
>> +{
>> +=C2=A0=C2=A0=C2=A0 hdmi_modb(hdmi, HDMI_SYS_CTRL, m_POWER, v_PWR_OFF)=
;
>> +}
>> +
>> +static void starfive_hdmi_tx_phy_power_on(struct starfive_hdmi *hdmi)
>> +{
>> +=C2=A0=C2=A0=C2=A0 hdmi_modb(hdmi, HDMI_SYS_CTRL, m_POWER, v_PWR_ON);
>=20
> It looks like one can inline these two helpers w/o too much troubles.
>=20
>> +}
>> +
>> +static void starfive_hdmi_config_pll(struct starfive_hdmi *hdmi)
>> +{
>> +=C2=A0=C2=A0=C2=A0 u32 val;
>> +=C2=A0=C2=A0=C2=A0 u8 reg_1ad_value =3D hdmi->post_cfg->post_div_en ?
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hdmi->post_cfg->post=
div : 0x00;
>> +=C2=A0=C2=A0=C2=A0 u8 reg_1aa_value =3D hdmi->post_cfg->post_div_en ?
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0e : 0x02;
>> +
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, STARFIVE_PRE_PLL_CONTROL, STARFI=
VE_PRE_PLL_POWER_DOWN);
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, STARFIVE_POST_PLL_DIV_1,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ST=
ARFIVE_POST_PLL_POST_DIV_ENABLE |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ST=
ARFIVE_POST_PLL_REFCLK_SEL_TMDS |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ST=
ARFIVE_POST_PLL_POWER_DOWN);
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, STARFIVE_PRE_PLL_DIV_1, STARFIVE=
_PRE_PLL_PRE_DIV(hdmi->pre_cfg->prediv));
>> +
>> +=C2=A0=C2=A0=C2=A0 val =3D STARFIVE_SPREAD_SPECTRUM_MOD_DISABLE | STA=
RFIVE_SPREAD_SPECTRUM_MOD_DOWN;
>> +=C2=A0=C2=A0=C2=A0 if (!hdmi->pre_cfg->fracdiv)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val |=3D STARFIVE_PRE_PLL_=
FRAC_DIV_DISABLE;
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, STARFIVE_PRE_PLL_DIV_2,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ST=
ARFIVE_PRE_PLL_FB_DIV_11_8(hdmi->pre_cfg->fbdiv) | val);
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, STARFIVE_PRE_PLL_DIV_3,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ST=
ARFIVE_PRE_PLL_FB_DIV_7_0(hdmi->pre_cfg->fbdiv));
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, STARFIVE_PRE_PLL_DIV_4,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ST=
ARFIVE_PRE_PLL_TMDSCLK_DIV_C(hdmi->pre_cfg->tmds_div_c) |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ST=
ARFIVE_PRE_PLL_TMDSCLK_DIV_A(hdmi->pre_cfg->tmds_div_a) |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ST=
ARFIVE_PRE_PLL_TMDSCLK_DIV_B(hdmi->pre_cfg->tmds_div_b));
>> +
>> +=C2=A0=C2=A0=C2=A0 if (hdmi->pre_cfg->fracdiv) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, STARFIVE=
_PRE_PLL_FRAC_DIV_L,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 STARFIVE_PRE_PLL_FRAC_DIV_7_0(hdmi->pre_cfg->fracdi=
v));
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, STARFIVE=
_PRE_PLL_FRAC_DIV_M,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 STARFIVE_PRE_PLL_FRAC_DIV_15_8(hdmi->pre_cfg->fracd=
iv));
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, STARFIVE=
_PRE_PLL_FRAC_DIV_H,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 STARFIVE_PRE_PLL_FRAC_DIV_23_16(hdmi->pre_cfg->frac=
div));
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, STARFIVE_PRE_PLL_DIV_5,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ST=
ARFIVE_PRE_PLL_PCLK_DIV_A(hdmi->pre_cfg->pclk_div_a) |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ST=
ARFIVE_PRE_PLL_PCLK_DIV_B(hdmi->pre_cfg->pclk_div_b));
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, STARFIVE_PRE_PLL_DIV_6,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ST=
ARFIVE_PRE_PLL_PCLK_DIV_C(hdmi->pre_cfg->pclk_div_c) |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ST=
ARFIVE_PRE_PLL_PCLK_DIV_D(hdmi->pre_cfg->pclk_div_d));
>> +
>> +=C2=A0=C2=A0=C2=A0 /*pre-pll power down*/
>> +=C2=A0=C2=A0=C2=A0 hdmi_modb(hdmi, STARFIVE_PRE_PLL_CONTROL, STARFIVE=
_PRE_PLL_POWER_DOWN, 0);
>> +
>> +=C2=A0=C2=A0=C2=A0 hdmi_modb(hdmi, STARFIVE_POST_PLL_DIV_2, STARFIVE_=
POST_PLL_Pre_DIV_MASK,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 STARFIVE_POST_=
PLL_PRE_DIV(hdmi->post_cfg->prediv));
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, STARFIVE_POST_PLL_DIV_3, hdmi->p=
ost_cfg->fbdiv & 0xff);
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, STARFIVE_POST_PLL_DIV_4, reg_1ad=
_value);
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, STARFIVE_POST_PLL_DIV_1, reg_1aa=
_value);
>> +}
>> +
>> +static void starfive_hdmi_tmds_driver_on(struct starfive_hdmi *hdmi)
>> +{
>> +=C2=A0=C2=A0=C2=A0 hdmi_modb(hdmi, STARFIVE_TMDS_CONTROL,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 STARFIVE_TMDS_=
DRIVER_ENABLE, STARFIVE_TMDS_DRIVER_ENABLE);
>> +}
>> +
>> +static void starfive_hdmi_sync_tmds(struct starfive_hdmi *hdmi)
>> +{
>> +=C2=A0=C2=A0=C2=A0 /*first send 0 to this bit, then send 1 and keep 1=
 into this bit*/
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, HDMI_SYNC, 0x0);
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, HDMI_SYNC, 0x1);
>> +}
>> +
>> +static void starfive_hdmi_i2c_init(struct starfive_hdmi *hdmi)
>> +{
>> +=C2=A0=C2=A0=C2=A0 int ddc_bus_freq;
>> +
>> +=C2=A0=C2=A0=C2=A0 ddc_bus_freq =3D (clk_get_rate(hdmi->sys_clk) >> 2=
) / HDMI_SCL_RATE;
>> +
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, DDC_BUS_FREQ_L, ddc_bus_freq & 0=
xFF);
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, DDC_BUS_FREQ_H, (ddc_bus_freq >>=
 8) & 0xFF);
>> +
>> +=C2=A0=C2=A0=C2=A0 /* Clear the EDID interrupt flag and mute the inte=
rrupt */
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, HDMI_INTERRUPT_MASK1, 0);
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, HDMI_INTERRUPT_STATUS1, m_INT_ED=
ID_READY);
>> +}
>> +
>> +static const
>> +struct pre_pll_config *starfive_hdmi_phy_get_pre_pll_cfg(struct starf=
ive_hdmi *hdmi,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long rate)
>> +{
>> +=C2=A0=C2=A0=C2=A0 const struct pre_pll_config *cfg =3D pre_pll_cfg_t=
able;
>> +
>> +=C2=A0=C2=A0=C2=A0 rate =3D (rate / 1000) * 1000;
>> +=C2=A0=C2=A0=C2=A0 for (; cfg->pixclock !=3D 0; cfg++)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (cfg->tmdsclock =3D=3D =
rate && cfg->pixclock =3D=3D rate)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 br=
eak;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (cfg->pixclock =3D=3D 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ERR_PTR(-EINVAL);
>> +
>> +=C2=A0=C2=A0=C2=A0 return cfg;
>> +}
>> +
>> +static int starfive_hdmi_phy_clk_set_rate(struct starfive_hdmi *hdmi)
>> +{
>> +=C2=A0=C2=A0=C2=A0 hdmi->post_cfg =3D post_pll_cfg_table;
>> +
>> +=C2=A0=C2=A0=C2=A0 hdmi->pre_cfg =3D starfive_hdmi_phy_get_pre_pll_cf=
g(hdmi, hdmi->tmds_rate);
>> +=C2=A0=C2=A0=C2=A0 if (IS_ERR(hdmi->pre_cfg))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return PTR_ERR(hdmi->pre_c=
fg);
>> +
>> +=C2=A0=C2=A0=C2=A0 for (; hdmi->post_cfg->tmdsclock !=3D 0; hdmi->pos=
t_cfg++)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (hdmi->tmds_rate <=3D h=
dmi->post_cfg->tmdsclock)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 br=
eak;
>> +
>> +=C2=A0=C2=A0=C2=A0 starfive_hdmi_config_pll(hdmi);
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +static int starfive_hdmi_config_video_timing(struct starfive_hdmi *hd=
mi,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 struct drm_display_mode *mode)
>> +{
>> +=C2=A0=C2=A0=C2=A0 int value;
>> +=C2=A0=C2=A0=C2=A0 /* Set detail external video timing */
>> +=C2=A0=C2=A0=C2=A0 value =3D mode->htotal;
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, HDMI_VIDEO_EXT_HTOTAL_L, value &=
 0xFF);
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, HDMI_VIDEO_EXT_HTOTAL_H, (value =
>> 8) & 0xFF);
>=20
> As you have hdmi_writeb already, adding hdmi_writew will help here.
>=20
>> +
>> +=C2=A0=C2=A0=C2=A0 value =3D mode->htotal - mode->hdisplay;
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, HDMI_VIDEO_EXT_HBLANK_L, value &=
 0xFF);
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, HDMI_VIDEO_EXT_HBLANK_H, (value =
>> 8) & 0xFF);
>> +
>> +=C2=A0=C2=A0=C2=A0 value =3D mode->htotal - mode->hsync_start;
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, HDMI_VIDEO_EXT_HDELAY_L, value &=
 0xFF);
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, HDMI_VIDEO_EXT_HDELAY_H, (value =
>> 8) & 0xFF);
>> +
>> +=C2=A0=C2=A0=C2=A0 value =3D mode->hsync_end - mode->hsync_start;
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, HDMI_VIDEO_EXT_HDURATION_L, valu=
e & 0xFF);
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, HDMI_VIDEO_EXT_HDURATION_H, (val=
ue >> 8) & 0xFF);
>> +
>> +=C2=A0=C2=A0=C2=A0 value =3D mode->vtotal;
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, HDMI_VIDEO_EXT_VTOTAL_L, value &=
 0xFF);
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, HDMI_VIDEO_EXT_VTOTAL_H, (value =
>> 8) & 0xFF);
>> +
>> +=C2=A0=C2=A0=C2=A0 value =3D mode->vtotal - mode->vdisplay;
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, HDMI_VIDEO_EXT_VBLANK, value & 0=
xFF);
>> +
>> +=C2=A0=C2=A0=C2=A0 value =3D mode->vtotal - mode->vsync_start;
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, HDMI_VIDEO_EXT_VDELAY, value & 0=
xFF);
>> +
>> +=C2=A0=C2=A0=C2=A0 value =3D mode->vsync_end - mode->vsync_start;
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, HDMI_VIDEO_EXT_VDURATION, value =
& 0xFF);
>> +
>> +=C2=A0=C2=A0=C2=A0 /* Set detail external video timing polarity and i=
nterlace mode */
>> +=C2=A0=C2=A0=C2=A0 value =3D v_EXTERANL_VIDEO(1);
>> +=C2=A0=C2=A0=C2=A0 value |=3D mode->flags & DRM_MODE_FLAG_PHSYNC ?
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v_HSYNC_POLARITY(1) : v_HS=
YNC_POLARITY(0);
>> +=C2=A0=C2=A0=C2=A0 value |=3D mode->flags & DRM_MODE_FLAG_PVSYNC ?
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v_VSYNC_POLARITY(1) : v_VS=
YNC_POLARITY(0);
>> +=C2=A0=C2=A0=C2=A0 value |=3D mode->flags & DRM_MODE_FLAG_INTERLACE ?
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v_INETLACE(1) : v_INETLACE=
(0);
>> +
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, HDMI_VIDEO_TIMING_CTL, value);
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +static int starfive_hdmi_setup(struct starfive_hdmi *hdmi,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_display_mode *mode)
>> +{
>> +=C2=A0=C2=A0=C2=A0 hdmi_modb(hdmi, STARFIVE_BIAS_CONTROL, STARFIVE_BI=
AS_ENABLE, STARFIVE_BIAS_ENABLE);
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, STARFIVE_RX_CONTROL, STARFIVE_RX=
_ENABLE);
>> +=C2=A0=C2=A0=C2=A0 hdmi->hdmi_data.vic =3D drm_match_cea_mode(mode);
>> +
>> +=C2=A0=C2=A0=C2=A0 hdmi->tmds_rate =3D mode->clock * 1000;
>> +=C2=A0=C2=A0=C2=A0 starfive_hdmi_phy_clk_set_rate(hdmi);
>> +
>> +=C2=A0=C2=A0=C2=A0 while (!(hdmi_readb(hdmi, STARFIVE_PRE_PLL_LOCK_ST=
ATUS) & 0x1))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue;
>> +=C2=A0=C2=A0=C2=A0 while (!(hdmi_readb(hdmi, STARFIVE_POST_PLL_LOCK_S=
TATUS) & 0x1))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue;
>=20
> Please use read_iopoll_timeout here.
>=20
>> +
>> +=C2=A0=C2=A0=C2=A0 /*turn on LDO*/
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, STARFIVE_LDO_CONTROL, STARFIVE_L=
DO_ENABLE);
>> +=C2=A0=C2=A0=C2=A0 /*turn on serializer*/
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, STARFIVE_SERIALIER_CONTROL, STAR=
FIVE_SERIALIER_ENABLE);
>> +
>> +=C2=A0=C2=A0=C2=A0 starfive_hdmi_tx_phy_power_down(hdmi);
>> +=C2=A0=C2=A0=C2=A0 starfive_hdmi_config_video_timing(hdmi, mode);
>> +=C2=A0=C2=A0=C2=A0 starfive_hdmi_tx_phy_power_on(hdmi);
>> +
>> +=C2=A0=C2=A0=C2=A0 starfive_hdmi_tmds_driver_on(hdmi);
>> +=C2=A0=C2=A0=C2=A0 starfive_hdmi_sync_tmds(hdmi);
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +static void starfive_hdmi_encoder_mode_set(struct drm_encoder *encode=
r,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dr=
m_display_mode *mode,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dr=
m_display_mode *adj_mode)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct starfive_hdmi *hdmi =3D encoder_to_hdmi(enc=
oder);
>> +
>> +=C2=A0=C2=A0=C2=A0 drm_mode_copy(&hdmi->previous_mode, adj_mode);
>=20
> Why do you need it?
>=20
>> +}
>> +
>> +static void starfive_hdmi_encoder_enable(struct drm_encoder *encoder)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct starfive_hdmi *hdmi =3D encoder_to_hdmi(enc=
oder);
>> +=C2=A0=C2=A0=C2=A0 struct drm_display_mode *mode =3D &encoder->crtc->=
state->adjusted_mode;
>> +=C2=A0=C2=A0=C2=A0 int ret, idx;
>> +=C2=A0=C2=A0=C2=A0 struct drm_device *drm =3D hdmi->connector.dev;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (drm && !drm_dev_enter(drm, &idx))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D pm_runtime_get_sync(hdmi->dev);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> +=C2=A0=C2=A0=C2=A0 mdelay(10);
>> +=C2=A0=C2=A0=C2=A0 starfive_hdmi_setup(hdmi, mode);
>> +
>> +=C2=A0=C2=A0=C2=A0 if (drm)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_dev_exit(idx);
>> +}
>> +
>> +static void starfive_hdmi_encoder_disable(struct drm_encoder *encoder=
)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct starfive_hdmi *hdmi =3D encoder_to_hdmi(enc=
oder);
>> +
>> +=C2=A0=C2=A0=C2=A0 int idx;
>> +=C2=A0=C2=A0=C2=A0 struct drm_device *drm =3D hdmi->connector.dev;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (drm && !drm_dev_enter(drm, &idx))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> +
>> +=C2=A0=C2=A0=C2=A0 pm_runtime_put(hdmi->dev);
>> +
>> +=C2=A0=C2=A0=C2=A0 if (drm)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_dev_exit(idx);
>> +}
>> +
>> +static int
>> +starfive_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_crtc_state *crtc_state=
,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_connector_state *conn_=
state)
>> +{
>> +=C2=A0=C2=A0=C2=A0 bool valid =3D false;
>> +=C2=A0=C2=A0=C2=A0 struct drm_display_mode *mode =3D &crtc_state->adj=
usted_mode;
>> +=C2=A0=C2=A0=C2=A0 struct vs_crtc_state *vs_crtc_state =3D to_vs_crtc=
_state(crtc_state);
>> +
>> +=C2=A0=C2=A0=C2=A0 vs_crtc_state->encoder_type =3D encoder->encoder_t=
ype;
>> +=C2=A0=C2=A0=C2=A0 vs_crtc_state->output_fmt =3D MEDIA_BUS_FMT_RGB888=
_1X24;
>> +
>> +=C2=A0=C2=A0=C2=A0 const struct pre_pll_config *cfg =3D pre_pll_cfg_t=
able;
>> +=C2=A0=C2=A0=C2=A0 int pclk =3D mode->clock * 1000;
>> +
>> +=C2=A0=C2=A0=C2=A0 for (; cfg->pixclock !=3D 0; cfg++) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pclk =3D=3D cfg->pixcl=
ock) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 (pclk > 297000000)
>=20
> Magic value.
>=20
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 continue;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 va=
lid =3D true;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 br=
eak;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 return (valid) ? 0 : -EINVAL;
>> +}
>> +
>> +static const struct drm_encoder_helper_funcs starfive_hdmi_encoder_he=
lper_funcs =3D {
>> +=C2=A0=C2=A0=C2=A0 .enable=C2=A0=C2=A0=C2=A0=C2=A0 =3D starfive_hdmi_=
encoder_enable,
>> +=C2=A0=C2=A0=C2=A0 .disable=C2=A0=C2=A0=C2=A0 =3D starfive_hdmi_encod=
er_disable,
>> +=C2=A0=C2=A0=C2=A0 .mode_set=C2=A0=C2=A0 =3D starfive_hdmi_encoder_mo=
de_set,
>> +=C2=A0=C2=A0=C2=A0 .atomic_check =3D starfive_hdmi_encoder_atomic_che=
ck,
>> +};
>> +
>> +static enum drm_connector_status
>> +starfive_hdmi_connector_detect(struct drm_connector *connector, bool =
force)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct starfive_hdmi *hdmi =3D connector_to_hdmi(c=
onnector);
>> +=C2=A0=C2=A0=C2=A0 struct drm_device *drm =3D hdmi->connector.dev;
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +=C2=A0=C2=A0=C2=A0 int idx;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (drm && !drm_dev_enter(drm, &idx))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return connector_status_di=
sconnected;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D pm_runtime_get_sync(hdmi->dev);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D (hdmi_readb(hdmi, HDMI_STATUS) & m_HOTPLUG=
) ?
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connector_status_connected=
 : connector_status_disconnected;
>> +=C2=A0=C2=A0=C2=A0 pm_runtime_put(hdmi->dev);
>> +
>> +=C2=A0=C2=A0=C2=A0 if (drm)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_dev_exit(idx);
>> +
>> +=C2=A0=C2=A0=C2=A0 return ret;
>> +}
>> +
>> +static int starfive_hdmi_connector_get_modes(struct drm_connector *co=
nnector)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct starfive_hdmi *hdmi =3D connector_to_hdmi(c=
onnector);
>> +=C2=A0=C2=A0=C2=A0 struct edid *edid;
>> +=C2=A0=C2=A0=C2=A0 int ret =3D 0;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (!hdmi->ddc)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> +=C2=A0=C2=A0=C2=A0 ret =3D pm_runtime_get_sync(hdmi->dev);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 edid =3D drm_get_edid(connector, hdmi->ddc);
>> +=C2=A0=C2=A0=C2=A0 if (edid) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hdmi->hdmi_data.sink_is_hd=
mi =3D drm_detect_hdmi_monitor(edid);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hdmi->hdmi_data.sink_has_a=
udio =3D drm_detect_monitor_audio(edid);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_connector_update_edid_=
property(connector, edid);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D drm_add_edid_modes=
(connector, edid);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kfree(edid);
>> +=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 pm_runtime_put(hdmi->dev);
>=20
> Can you use drm_connector_helper_get_modes_from_ddc() here? And then dr=
m_display_info.is_hdmi and .has_audio.
>=20
>> +
>> +=C2=A0=C2=A0=C2=A0 return ret;
>> +}
>> +
>> +static enum drm_mode_status
>> +starfive_hdmi_connector_mode_valid(struct drm_connector *connector,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_display_mode *mode)
>> +{
>> +=C2=A0=C2=A0=C2=A0 const struct pre_pll_config *cfg =3D pre_pll_cfg_t=
able;
>> +=C2=A0=C2=A0=C2=A0 int pclk =3D mode->clock * 1000;
>> +=C2=A0=C2=A0=C2=A0 bool valid =3D false;
>> +
>> +=C2=A0=C2=A0=C2=A0 for (; cfg->pixclock !=3D 0; cfg++) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pclk =3D=3D cfg->pixcl=
ock) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 (pclk > 297000000)
>=20
> magic value
>=20
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 continue;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 va=
lid =3D true;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 br=
eak;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 return (valid) ? MODE_OK : MODE_BAD;
>> +}
>> +
>> +static int
>> +starfive_hdmi_probe_single_connector_modes(struct drm_connector *conn=
ector,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 maxX,=
 u32 maxY)
>> +{
>> +=C2=A0=C2=A0=C2=A0 return drm_helper_probe_single_connector_modes(con=
nector, 3840, 2160);
>> +}
>> +
>> +static const struct drm_connector_funcs starfive_hdmi_connector_funcs=
 =3D {
>> +=C2=A0=C2=A0=C2=A0 .fill_modes =3D starfive_hdmi_probe_single_connect=
or_modes,
>> +=C2=A0=C2=A0=C2=A0 .detect =3D starfive_hdmi_connector_detect,
>> +=C2=A0=C2=A0=C2=A0 .reset =3D drm_atomic_helper_connector_reset,
>> +=C2=A0=C2=A0=C2=A0 .atomic_duplicate_state =3D drm_atomic_helper_conn=
ector_duplicate_state,
>> +=C2=A0=C2=A0=C2=A0 .atomic_destroy_state =3D drm_atomic_helper_connec=
tor_destroy_state,
>> +};
>> +
>> +static struct drm_connector_helper_funcs starfive_hdmi_connector_help=
er_funcs =3D {
>> +=C2=A0=C2=A0=C2=A0 .get_modes =3D starfive_hdmi_connector_get_modes,
>> +=C2=A0=C2=A0=C2=A0 .mode_valid =3D starfive_hdmi_connector_mode_valid=
,
>> +};
>> +
>> +static int starfive_hdmi_register(struct drm_device *drm, struct star=
five_hdmi *hdmi)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct drm_encoder *encoder =3D &hdmi->encoder;
>> +=C2=A0=C2=A0=C2=A0 struct device *dev =3D hdmi->dev;
>> +
>> +=C2=A0=C2=A0=C2=A0 encoder->possible_crtcs =3D drm_of_find_possible_c=
rtcs(drm, dev->of_node);
>> +
>> +=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * If we failed to find the CRTC(s) which thi=
s encoder is
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * supposed to be connected to, it's because =
the CRTC has
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * not been registered yet.=C2=A0 Defer probi=
ng, and hope that
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * the required CRTC is added later.
>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0 if (encoder->possible_crtcs =3D=3D 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EPROBE_DEFER;
>> +
>> +=C2=A0=C2=A0=C2=A0 drm_encoder_helper_add(encoder, &starfive_hdmi_enc=
oder_helper_funcs);
>> +
>> +=C2=A0=C2=A0=C2=A0 hdmi->connector.polled =3D DRM_CONNECTOR_POLL_HPD;
>> +
>> +=C2=A0=C2=A0=C2=A0 drm_connector_helper_add(&hdmi->connector,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 &starfive_hdmi_connector_helper_funcs);
>> +=C2=A0=C2=A0=C2=A0 drmm_connector_init(drm, &hdmi->connector,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 &starfive_hdmi_connector_funcs,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 DRM_MODE_CONNECTOR_HDMIA,
>=20
> On an embedded device one can not be so sure. There can be MHL or HDMI =
Alternative Mode. Usually we use drm_bridge here and drm_bridge_connector=
.
>=20
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 hdmi->ddc);
>> +
>> +=C2=A0=C2=A0=C2=A0 drm_connector_attach_encoder(&hdmi->connector, enc=
oder);
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +static irqreturn_t starfive_hdmi_i2c_irq(struct starfive_hdmi *hdmi)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct starfive_hdmi_i2c *i2c =3D hdmi->i2c;
>> +=C2=A0=C2=A0=C2=A0 u8 stat;
>> +
>> +=C2=A0=C2=A0=C2=A0 stat =3D hdmi_readb(hdmi, HDMI_INTERRUPT_STATUS1);
>> +=C2=A0=C2=A0=C2=A0 if (!(stat & m_INT_EDID_READY))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return IRQ_NONE;
>> +
>> +=C2=A0=C2=A0=C2=A0 /* Clear HDMI EDID interrupt flag */
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, HDMI_INTERRUPT_STATUS1, m_INT_ED=
ID_READY);
>> +
>> +=C2=A0=C2=A0=C2=A0 complete(&i2c->cmp);
>> +
>> +=C2=A0=C2=A0=C2=A0 return IRQ_HANDLED;
>> +}
>> +
>> +static irqreturn_t starfive_hdmi_hardirq(int irq, void *dev_id)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct starfive_hdmi *hdmi =3D dev_id;
>> +=C2=A0=C2=A0=C2=A0 irqreturn_t ret =3D IRQ_NONE;
>> +=C2=A0=C2=A0=C2=A0 u8 interrupt;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (hdmi->i2c)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D starfive_hdmi_i2c_=
irq(hdmi);
>> +
>> +=C2=A0=C2=A0=C2=A0 interrupt =3D hdmi_readb(hdmi, HDMI_STATUS);
>> +=C2=A0=C2=A0=C2=A0 if (interrupt & m_INT_HOTPLUG) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hdmi_modb(hdmi, HDMI_STATU=
S, m_INT_HOTPLUG, m_INT_HOTPLUG);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D IRQ_WAKE_THREAD;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 return ret;
>> +}
>> +
>> +static irqreturn_t starfive_hdmi_irq(int irq, void *dev_id)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct starfive_hdmi *hdmi =3D dev_id;
>> +
>> +=C2=A0=C2=A0=C2=A0 drm_connector_helper_hpd_irq_event(&hdmi->connecto=
r);
>> +
>> +=C2=A0=C2=A0=C2=A0 return IRQ_HANDLED;
>> +}
>> +
>> +static int starfive_hdmi_i2c_read(struct starfive_hdmi *hdmi, struct =
i2c_msg *msgs)
>> +{
>> +=C2=A0=C2=A0=C2=A0 int length =3D msgs->len;
>> +=C2=A0=C2=A0=C2=A0 u8 *buf =3D msgs->buf;
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D wait_for_completion_timeout(&hdmi->i2c->cm=
p, HZ / 10);
>=20
> read_poll_timeout
Hi Dmitry:
I think using wait_for_completion_timeout here is a bit clearer than read=
_poll_timeout logic
I2c_read has hardware interrupt dependency. so need wait the interrupt co=
mpletion.
also it comes with timeout detection.

>=20
>> +=C2=A0=C2=A0=C2=A0 if (!ret)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EAGAIN;
>> +
>> +=C2=A0=C2=A0=C2=A0 while (length--)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *buf++ =3D hdmi_readb(hdmi=
, HDMI_EDID_FIFO_ADDR);
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +static int starfive_hdmi_i2c_write(struct starfive_hdmi *hdmi, struct=
 i2c_msg *msgs)
>> +{
>> +=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * The DDC module only support read EDID mess=
age, so
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * we assume that each word write to this i2c=
 adapter
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * should be the offset of EDID word address.
>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0 if (msgs->len !=3D 1 ||
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (msgs->addr !=3D DDC_ADDR =
&& msgs->addr !=3D DDC_SEGMENT_ADDR))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>> +
>> +=C2=A0=C2=A0=C2=A0 reinit_completion(&hdmi->i2c->cmp);
>> +
>> +=C2=A0=C2=A0=C2=A0 if (msgs->addr =3D=3D DDC_SEGMENT_ADDR)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hdmi->i2c->segment_addr =3D=
 msgs->buf[0];
>> +=C2=A0=C2=A0=C2=A0 if (msgs->addr =3D=3D DDC_ADDR)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hdmi->i2c->ddc_addr =3D ms=
gs->buf[0];
>> +
>> +=C2=A0=C2=A0=C2=A0 /* Set edid fifo first addr */
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, HDMI_EDID_FIFO_OFFSET, 0x00);
>> +
>> +=C2=A0=C2=A0=C2=A0 /* Set edid word address 0x00/0x80 */
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, HDMI_EDID_WORD_ADDR, hdmi->i2c->=
ddc_addr);
>> +
>> +=C2=A0=C2=A0=C2=A0 /* Set edid segment pointer */
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, HDMI_EDID_SEGMENT_POINTER, hdmi-=
>i2c->segment_addr);
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +static int starfive_hdmi_i2c_xfer(struct i2c_adapter *adap,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct i2c_msg *msgs, int num)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct starfive_hdmi *hdmi =3D i2c_get_adapdata(ad=
ap);
>> +=C2=A0=C2=A0=C2=A0 struct starfive_hdmi_i2c *i2c =3D hdmi->i2c;
>> +=C2=A0=C2=A0=C2=A0 int i, ret =3D 0;
>> +
>> +=C2=A0=C2=A0=C2=A0 mutex_lock(&i2c->lock);
>> +
>> +=C2=A0=C2=A0=C2=A0 /* Clear the EDID interrupt flag and unmute the in=
terrupt */
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, HDMI_INTERRUPT_MASK1, m_INT_EDID=
_READY);
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, HDMI_INTERRUPT_STATUS1, m_INT_ED=
ID_READY);
>> +
>> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < num; i++) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_DEV_DEBUG(hdmi->dev,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "xfer: num: %d/%d, len: %d, flags: %#x\=
n",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i + 1, num, msgs[i].len, msgs[i].flags)=
;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (msgs[i].flags & I2C_M_=
RD)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
t =3D starfive_hdmi_i2c_read(hdmi, &msgs[i]);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
t =3D starfive_hdmi_i2c_write(hdmi, &msgs[i]);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 br=
eak;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 if (!ret)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D num;
>> +
>> +=C2=A0=C2=A0=C2=A0 /* Mute HDMI EDID interrupt */
>> +=C2=A0=C2=A0=C2=A0 hdmi_writeb(hdmi, HDMI_INTERRUPT_MASK1, 0);
>> +
>> +=C2=A0=C2=A0=C2=A0 mutex_unlock(&i2c->lock);
>> +
>> +=C2=A0=C2=A0=C2=A0 return ret;
>> +}
>> +
>> +static u32 starfive_hdmi_i2c_func(struct i2c_adapter *adapter)
>> +{
>> +=C2=A0=C2=A0=C2=A0 return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
>> +}
>> +
>> +static const struct i2c_algorithm starfive_hdmi_algorithm =3D {
>> +=C2=A0=C2=A0=C2=A0 .master_xfer=C2=A0=C2=A0=C2=A0 =3D starfive_hdmi_i=
2c_xfer,
>> +=C2=A0=C2=A0=C2=A0 .functionality=C2=A0=C2=A0=C2=A0 =3D starfive_hdmi=
_i2c_func,
>> +};
>> +
>> +static struct i2c_adapter *starfive_hdmi_i2c_adapter(struct starfive_=
hdmi *hdmi)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct i2c_adapter *adap;
>> +=C2=A0=C2=A0=C2=A0 struct starfive_hdmi_i2c *i2c;
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 i2c =3D drmm_kzalloc(hdmi->drm_dev, sizeof(*i2c), =
GFP_KERNEL);
>> +=C2=A0=C2=A0=C2=A0 if (!i2c)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ERR_PTR(-ENOMEM);
>> +
>> +=C2=A0=C2=A0=C2=A0 mutex_init(&i2c->lock);
>> +=C2=A0=C2=A0=C2=A0 init_completion(&i2c->cmp);
>> +
>> +=C2=A0=C2=A0=C2=A0 adap =3D &i2c->adap;
>> +=C2=A0=C2=A0=C2=A0 adap->class =3D I2C_CLASS_DDC;
>> +=C2=A0=C2=A0=C2=A0 adap->owner =3D THIS_MODULE;
>> +=C2=A0=C2=A0=C2=A0 adap->dev.parent =3D hdmi->dev;
>> +=C2=A0=C2=A0=C2=A0 adap->algo =3D &starfive_hdmi_algorithm;
>> +=C2=A0=C2=A0=C2=A0 strscpy(adap->name, "Starfive HDMI", sizeof(adap->=
name));
>> +=C2=A0=C2=A0=C2=A0 i2c_set_adapdata(adap, hdmi);
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D devm_i2c_add_adapter(hdmi->dev, adap);
>> +=C2=A0=C2=A0=C2=A0 if (ret) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_warn(hdmi->drm_dev, "c=
annot add %s I2C adapter\n", adap->name);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ERR_PTR(ret);
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 hdmi->i2c =3D i2c;
>> +
>> +=C2=A0=C2=A0=C2=A0 drm_info(hdmi->drm_dev, "registered %s I2C bus dri=
ver success\n", adap->name);
>> +
>> +=C2=A0=C2=A0=C2=A0 return adap;
>> +}
>> +
>> +static int starfive_hdmi_get_clk_rst(struct device *dev, struct starf=
ive_hdmi *hdmi)
>> +{
>> +=C2=A0=C2=A0=C2=A0 hdmi->sys_clk =3D devm_clk_get(dev, "sysclk");
>> +=C2=A0=C2=A0=C2=A0 if (IS_ERR(hdmi->sys_clk)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, "Unable to ge=
t HDMI sysclk clk\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return PTR_ERR(hdmi->sys_c=
lk);
>> +=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 hdmi->mclk =3D devm_clk_get(dev, "mclk");
>> +=C2=A0=C2=A0=C2=A0 if (IS_ERR(hdmi->mclk)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, "Unable to ge=
t HDMI mclk clk\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return PTR_ERR(hdmi->mclk)=
;
>> +=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 hdmi->bclk =3D devm_clk_get(dev, "bclk");
>> +=C2=A0=C2=A0=C2=A0 if (IS_ERR(hdmi->bclk)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, "Unable to ge=
t HDMI bclk clk\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return PTR_ERR(hdmi->bclk)=
;
>> +=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 hdmi->tx_rst =3D devm_reset_control_get_by_index(d=
ev, 0);
>> +=C2=A0=C2=A0=C2=A0 if (IS_ERR(hdmi->tx_rst)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, "failed to ge=
t tx_rst reset\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return PTR_ERR(hdmi->tx_rs=
t);
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +static int starfive_hdmi_bind(struct device *dev, struct device *mast=
er,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *data)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct platform_device *pdev =3D to_platform_devic=
e(dev);
>> +=C2=A0=C2=A0=C2=A0 struct drm_device *drm =3D dev_get_drvdata(master)=
;
>> +=C2=A0=C2=A0=C2=A0 struct starfive_hdmi *hdmi;
>> +=C2=A0=C2=A0=C2=A0 struct resource *iores;
>> +=C2=A0=C2=A0=C2=A0 int irq;
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 hdmi =3D drmm_kzalloc(drm, sizeof(*hdmi), GFP_KERN=
EL);
>> +=C2=A0=C2=A0=C2=A0 if (!hdmi)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
>> +
>> +=C2=A0=C2=A0=C2=A0 hdmi =3D drmm_simple_encoder_alloc(drm, struct sta=
rfive_hdmi,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 encoder, DRM_MODE_ENC=
ODER_TMDS);
>> +
>> +=C2=A0=C2=A0=C2=A0 hdmi->dev =3D dev;
>> +=C2=A0=C2=A0=C2=A0 hdmi->drm_dev =3D drm;
>> +=C2=A0=C2=A0=C2=A0 dev_set_drvdata(dev, hdmi);
>> +
>> +=C2=A0=C2=A0=C2=A0 iores =3D platform_get_resource(pdev, IORESOURCE_M=
EM, 0);
>> +=C2=A0=C2=A0=C2=A0 hdmi->regs =3D devm_ioremap_resource(dev, iores);
>=20
> This should go to probe
>=20
>> +=C2=A0=C2=A0=C2=A0 if (IS_ERR(hdmi->regs))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return PTR_ERR(hdmi->regs)=
;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D starfive_hdmi_get_clk_rst(dev, hdmi);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>=20
> And this
>=20
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D devm_pm_runtime_enable(dev);
>> +=C2=A0=C2=A0=C2=A0 if (ret)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D pm_runtime_resume_and_get(dev);
>> +=C2=A0=C2=A0=C2=A0 if (ret)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 irq =3D platform_get_irq(pdev, 0);
>=20
> And this
>=20
>> +=C2=A0=C2=A0=C2=A0 if (irq < 0) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D irq;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_put_runtime_pm;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 hdmi->ddc =3D starfive_hdmi_i2c_adapter(hdmi);
>> +=C2=A0=C2=A0=C2=A0 if (IS_ERR(hdmi->ddc)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D PTR_ERR(hdmi->ddc)=
;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hdmi->ddc =3D NULL;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_put_runtime_pm;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 starfive_hdmi_i2c_init(hdmi);
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D starfive_hdmi_register(drm, hdmi);
>> +=C2=A0=C2=A0=C2=A0 if (ret)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_put_adapter;
>> +
>> +=C2=A0=C2=A0=C2=A0 /* Unmute hotplug interrupt */
>> +=C2=A0=C2=A0=C2=A0 hdmi_modb(hdmi, HDMI_STATUS, m_MASK_INT_HOTPLUG, v=
_MASK_INT_HOTPLUG(1));
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D devm_request_threaded_irq(dev, irq, starfi=
ve_hdmi_hardirq,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 starfive_hdmi_irq, IRQF_SHA=
RED,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_name(dev), hdmi);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_put_adapter;
>> +
>> +=C2=A0=C2=A0=C2=A0 pm_runtime_put_sync(dev);
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +
>> +err_put_adapter:
>> +=C2=A0=C2=A0=C2=A0 i2c_put_adapter(hdmi->ddc);
>> +err_put_runtime_pm:
>> +=C2=A0=C2=A0=C2=A0 pm_runtime_put_sync(dev);
>> +
>> +=C2=A0=C2=A0=C2=A0 return ret;
>> +}
>> +
>> +static const struct component_ops starfive_hdmi_ops =3D {
>> +=C2=A0=C2=A0=C2=A0 .bind=C2=A0=C2=A0=C2=A0 =3D starfive_hdmi_bind,
>> +};
>> +
>> +static int starfive_hdmi_probe(struct platform_device *pdev)
>> +{
>> +=C2=A0=C2=A0=C2=A0 return component_add(&pdev->dev, &starfive_hdmi_op=
s);
>> +}
>> +
>> +static int starfive_hdmi_remove(struct platform_device *pdev)
>> +{
>> +=C2=A0=C2=A0=C2=A0 component_del(&pdev->dev, &starfive_hdmi_ops);
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +static const struct dev_pm_ops hdmi_pm_ops =3D {
>> +=C2=A0=C2=A0=C2=A0 SET_RUNTIME_PM_OPS(hdmi_runtime_suspend, hdmi_runt=
ime_resume, NULL)
>> +=C2=A0=C2=A0=C2=A0 SET_LATE_SYSTEM_SLEEP_PM_OPS(hdmi_system_pm_suspen=
d, hdmi_system_pm_resume)
>> +};
>> +
>> +static const struct of_device_id starfive_hdmi_dt_ids[] =3D {
>> +=C2=A0=C2=A0=C2=A0 { .compatible =3D "starfive,jh7110-inno-hdmi",},
>> +=C2=A0=C2=A0=C2=A0 {},
>> +};
>> +MODULE_DEVICE_TABLE(of, starfive_hdmi_dt_ids);
>> +
>> +struct platform_driver starfive_hdmi_driver =3D {
>> +=C2=A0=C2=A0=C2=A0 .probe=C2=A0 =3D starfive_hdmi_probe,
>> +=C2=A0=C2=A0=C2=A0 .remove =3D starfive_hdmi_remove,
>> +=C2=A0=C2=A0=C2=A0 .driver =3D {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D "starfive-hdmi",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .of_match_table =3D starfi=
ve_hdmi_dt_ids,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .pm =3D &hdmi_pm_ops,
>> +=C2=A0=C2=A0=C2=A0 },
>> +};
>> +
>> +MODULE_AUTHOR("StarFive Corporation");
>> +MODULE_DESCRIPTION("Starfive HDMI Driver");
>> diff --git a/drivers/gpu/drm/verisilicon/starfive_hdmi.h b/drivers/gpu=
/drm/verisilicon/starfive_hdmi.h
>> new file mode 100644
>> index 000000000..1b9a11bca
>> --- /dev/null
>> +++ b/drivers/gpu/drm/verisilicon/starfive_hdmi.h
>> @@ -0,0 +1,295 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (C) 2023 StarFive Technology Co., Ltd.
>> + */
>> +
>> +#ifndef __STARFIVE_HDMI_H__
>> +#define __STARFIVE_HDMI_H__
>> +
>> +#include <drm/bridge/dw_hdmi.h>
>> +#include <drm/drm_atomic_helper.h>
>> +#include <drm/drm_edid.h>
>> +#include <drm/drm_of.h>
>> +#include <drm/drm_probe_helper.h>
>> +#include <drm/drm_simple_kms_helper.h>
>> +#include <linux/bitfield.h>
>> +#include <linux/bits.h>
>> +
>> +#define DDC_SEGMENT_ADDR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x=
30
>> +
>> +#define HDMI_SCL_RATE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 (100 * 1000)
>> +#define DDC_BUS_FREQ_L=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0x4b
>> +#define DDC_BUS_FREQ_H=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0x4c
>> +
>> +#define HDMI_SYS_CTRL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0x00
>> +#define m_RST_ANALOG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BIT(6)
>> +#define v_RST_ANALOG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0
>> +#define v_NOT_RST_ANALOG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BI=
T(6)
>> +#define m_RST_DIGITAL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 BIT(5)
>> +#define v_RST_DIGITAL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0
>> +#define v_NOT_RST_DIGITAL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 B=
IT(5)
>> +#define m_REG_CLK_INV=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 BIT(4)
>> +#define v_REG_CLK_NOT_INV=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0
>> +#define v_REG_CLK_INV=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 BIT(4)
>> +#define m_VCLK_INV=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BIT(3)
>> +#define v_VCLK_NOT_INV=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0
>> +#define v_VCLK_INV=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BIT(3)
>> +#define m_REG_CLK_SOURCE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BI=
T(2)
>> +#define v_REG_CLK_SOURCE_TMDS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0
>> +#define v_REG_CLK_SOURCE_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 BIT(2)
>> +#define m_POWER=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(1)
>> +#define v_PWR_ON=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 0
>> +#define v_PWR_OFF=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 BIT(1)
>> +#define m_INT_POL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 BIT(0)
>> +#define v_INT_POL_HIGH=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 1
>> +#define v_INT_POL_LOW=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0
>> +
>> +#define HDMI_AV_MUTE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0x05
>> +#define m_AVMUTE_CLEAR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 BIT(7)
>> +#define m_AVMUTE_ENABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 BIT(6)
>> +#define m_AUDIO_MUTE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BIT(1)
>> +#define m_VIDEO_BLACK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 BIT(0)
>> +#define v_AVMUTE_CLEAR(n)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (=
(n) << 7)
>> +#define v_AVMUTE_ENABLE(n)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
((n) << 6)
>> +#define v_AUDIO_MUTE(n)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ((n) << 1)
>> +#define v_VIDEO_MUTE(n)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ((n) << 0)
>> +
>> +#define HDMI_VIDEO_TIMING_CTL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x08
>> +#define v_VSYNC_POLARITY(n)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ((n) << 3)
>> +#define v_HSYNC_POLARITY(n)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ((n) << 2)
>> +#define v_INETLACE(n)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ((n) << 1)
>> +#define v_EXTERANL_VIDEO(n)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ((n) << 0)
>> +
>> +#define HDMI_VIDEO_EXT_HTOTAL_L=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x09
>> +#define HDMI_VIDEO_EXT_HTOTAL_H=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x0a
>> +#define HDMI_VIDEO_EXT_HBLANK_L=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x0b
>> +#define HDMI_VIDEO_EXT_HBLANK_H=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x0c
>> +#define HDMI_VIDEO_EXT_HDELAY_L=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x0d
>> +#define HDMI_VIDEO_EXT_HDELAY_H=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x0e
>> +#define HDMI_VIDEO_EXT_HDURATION_L=C2=A0=C2=A0=C2=A0 0x0f
>> +#define HDMI_VIDEO_EXT_HDURATION_H=C2=A0=C2=A0=C2=A0 0x10
>> +#define HDMI_VIDEO_EXT_VTOTAL_L=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x11
>> +#define HDMI_VIDEO_EXT_VTOTAL_H=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x12
>> +#define HDMI_VIDEO_EXT_VBLANK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x13
>> +#define HDMI_VIDEO_EXT_VDELAY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x14
>> +#define HDMI_VIDEO_EXT_VDURATION=C2=A0=C2=A0=C2=A0 0x15
>> +
>> +#define HDMI_EDID_SEGMENT_POINTER=C2=A0=C2=A0=C2=A0 0x4d
>> +#define HDMI_EDID_WORD_ADDR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x4e
>> +#define HDMI_EDID_FIFO_OFFSET=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x4f
>> +#define HDMI_EDID_FIFO_ADDR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x50
>> +
>> +#define HDMI_INTERRUPT_MASK1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0xc0
>> +#define HDMI_INTERRUPT_STATUS1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0xc1
>> +#define=C2=A0=C2=A0=C2=A0 m_INT_ACTIVE_VSYNC=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BIT(5)
>> +#define m_INT_EDID_READY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BI=
T(2)
>> +
>> +#define HDMI_STATUS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0xc8
>> +#define m_HOTPLUG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 BIT(7)
>> +#define m_MASK_INT_HOTPLUG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
BIT(5)
>> +#define m_INT_HOTPLUG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 BIT(1)
>> +#define v_MASK_INT_HOTPLUG(n)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 (((n) & 0x1) << 5)
>=20
> It is untypical to have field defines which start with lowercase letter=
.
>=20
>> +
>> +#define HDMI_SYNC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0xce
>> +
>> +#define UPDATE(x, h, l)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FIELD_=
PREP(GENMASK(h, l), x)
>> +
>> +/* REG: 0x1a0 */
>> +#define STARFIVE_PRE_PLL_CONTROL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1a0
>> +#define STARFIVE_PCLK_VCO_DIV_5_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(1)
>> +#define STARFIVE_PCLK_VCO_DIV_5(x)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UPDATE(x, 1, 1)
>> +#define STARFIVE_PRE_PLL_POWER_DOWN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(0)
>> +
>> +/* REG: 0x1a1 */
>> +#define STARFIVE_PRE_PLL_DIV_1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1a1
>> +#define STARFIVE_PRE_PLL_PRE_DIV_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GENMASK(5, 0)
>> +#define STARFIVE_PRE_PLL_PRE_DIV(x)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UPDATE(x, 5, 0)
>> +
>> +/* REG: 0x1a2 */
>> +#define STARFIVE_PRE_PLL_DIV_2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1a2
>> +#define STARFIVE_SPREAD_SPECTRUM_MOD_DOWN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 BIT(7)
>> +#define STARFIVE_SPREAD_SPECTRUM_MOD_DISABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BIT(6)
>> +#define STARFIVE_PRE_PLL_FRAC_DIV_DISABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 UPDATE(3, 5, 4)
>> +#define STARFIVE_PRE_PLL_FB_DIV_11_8_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 GENMASK(3, 0)
>> +#define STARFIVE_PRE_PLL_FB_DIV_11_8(x)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UPDATE((x) >> 8, 3, 0)
>> +
>> +/* REG: 0x1a3 */
>> +#define STARFIVE_PRE_PLL_DIV_3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1a3
>> +#define STARFIVE_PRE_PLL_FB_DIV_7_0(x)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UPDATE(x, 7, 0)
>> +
>> +/* REG: 0x1a4*/
>> +#define STARFIVE_PRE_PLL_DIV_4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1a4
>> +#define STARFIVE_PRE_PLL_TMDSCLK_DIV_C_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 GENMASK(1, 0)
>> +#define STARFIVE_PRE_PLL_TMDSCLK_DIV_C(x)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 UPDATE(x, 1, 0)
>> +#define STARFIVE_PRE_PLL_TMDSCLK_DIV_B_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 GENMASK(3, 2)
>> +#define STARFIVE_PRE_PLL_TMDSCLK_DIV_B(x)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 UPDATE(x, 3, 2)
>> +#define STARFIVE_PRE_PLL_TMDSCLK_DIV_A_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 GENMASK(5, 4)
>> +#define STARFIVE_PRE_PLL_TMDSCLK_DIV_A(x)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 UPDATE(x, 5, 4)
>> +
>> +/* REG: 0x1a5 */
>> +#define STARFIVE_PRE_PLL_DIV_5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1a5
>> +#define STARFIVE_PRE_PLL_PCLK_DIV_B_SHIFT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 5
>> +#define STARFIVE_PRE_PLL_PCLK_DIV_B_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 GENMASK(6, 5)
>> +#define STARFIVE_PRE_PLL_PCLK_DIV_B(x)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UPDATE(x, 6, 5)
>> +#define STARFIVE_PRE_PLL_PCLK_DIV_A_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 GENMASK(4, 0)
>> +#define STARFIVE_PRE_PLL_PCLK_DIV_A(x)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UPDATE(x, 4, 0)
>> +
>> +/* REG: 0x1a6 */
>> +#define STARFIVE_PRE_PLL_DIV_6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1a6
>> +#define STARFIVE_PRE_PLL_PCLK_DIV_C_SHIFT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 5
>> +#define STARFIVE_PRE_PLL_PCLK_DIV_C_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 GENMASK(6, 5)
>> +#define STARFIVE_PRE_PLL_PCLK_DIV_C(x)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UPDATE(x, 6, 5)
>> +#define STARFIVE_PRE_PLL_PCLK_DIV_D_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 GENMASK(4, 0)
>> +#define STARFIVE_PRE_PLL_PCLK_DIV_D(x)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UPDATE(x, 4, 0)
>> +
>> +/* REG: 0x1a9 */
>> +#define STARFIVE_PRE_PLL_LOCK_STATUS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1a9
>> +
>> +/* REG: 0x1aa */
>> +#define STARFIVE_POST_PLL_DIV_1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1aa
>> +#define STARFIVE_POST_PLL_POST_DIV_ENABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 GENMASK(3, 2)
>> +#define STARFIVE_POST_PLL_REFCLK_SEL_TMDS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 BIT(1)
>> +#define STARFIVE_POST_PLL_POWER_DOWN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(0)
>> +#define STARFIVE_POST_PLL_FB_DIV_8(x)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UPDATE(((x) >> 8) << 4, 4, 4)
>> +
>> +/* REG:0x1ab */
>> +#define STARFIVE_POST_PLL_DIV_2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1ab
>> +#define STARFIVE_POST_PLL_Pre_DIV_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GENMASK(5, 0)
>> +#define STARFIVE_POST_PLL_PRE_DIV(x)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UPDATE(x, 5, 0)
>> +
>> +/* REG: 0x1ac */
>> +#define STARFIVE_POST_PLL_DIV_3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1ac
>> +#define STARFIVE_POST_PLL_FB_DIV_7_0(x)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UPDATE(x, 7, 0)
>> +
>> +/* REG: 0x1ad */
>> +#define STARFIVE_POST_PLL_DIV_4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1ad
>> +#define STARFIVE_POST_PLL_POST_DIV_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GENMASK(2, 0)
>> +#define STARFIVE_POST_PLL_POST_DIV_2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0
>> +#define STARFIVE_POST_PLL_POST_DIV_4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1
>> +#define STARFIVE_POST_PLL_POST_DIV_8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x3
>> +
>> +/* REG: 0x1af */
>> +#define STARFIVE_POST_PLL_LOCK_STATUS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1af
>> +
>> +/* REG: 0x1b0 */
>> +#define STARFIVE_BIAS_CONTROL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1b0
>> +#define STARFIVE_BIAS_ENABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(2)
>> +
>> +/* REG: 0x1b2 */
>> +#define STARFIVE_TMDS_CONTROL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1b2
>> +#define STARFIVE_TMDS_CLK_DRIVER_EN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(3)
>> +#define STARFIVE_TMDS_D2_DRIVER_EN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(2)
>> +#define STARFIVE_TMDS_D1_DRIVER_EN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(1)
>> +#define STARFIVE_TMDS_D0_DRIVER_EN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(0)
>> +#define STARFIVE_TMDS_DRIVER_ENABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (STARFIVE_TMDS_CLK_DRIVER_EN | \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 STARFIVE_TMDS_D2_DRIVER_EN | \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 STARFIVE_TMDS_D1_DRIVER_EN | \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 STARFIVE_TMDS_D0_DRIVER_EN)
>> +
>> +/* REG: 0x1b4 */
>> +#define STARFIVE_LDO_CONTROL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1b4
>> +#define STARFIVE_LDO_D2_EN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(2)
>> +#define STARFIVE_LDO_D1_EN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(1)
>> +#define STARFIVE_LDO_D0_EN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(0)
>> +#define STARFIVE_LDO_ENABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (STARFIVE_LDO_D2_EN | \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 STARFIVE_LDO_D1_EN | \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 STARFIVE_LDO_D0_EN)
>> +
>> +/* REG: 0x1be */
>> +#define STARFIVE_SERIALIER_CONTROL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1be
>> +#define STARFIVE_SERIALIER_D2_EN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(6)
>> +#define STARFIVE_SERIALIER_D1_EN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(5)
>> +#define STARFIVE_SERIALIER_D0_EN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(4)
>> +#define STARFIVE_SERIALIER_EN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(0)
>> +
>> +#define STARFIVE_SERIALIER_ENABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (STARFIVE_SERIALIER_D2_EN | \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 STARFIVE_SERIALIER_D1_EN | \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 STARFIVE_SERIALIER_D0_EN | \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 STARFIVE_SERIALIER_EN)
>> +
>> +/* REG: 0x1cc */
>> +#define STARFIVE_RX_CONTROL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1cc
>> +#define STARFIVE_RX_EN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(3)
>> +#define STARFIVE_RX_CHANNEL_2_EN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(2)
>> +#define STARFIVE_RX_CHANNEL_1_EN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(1)
>> +#define STARFIVE_RX_CHANNEL_0_EN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(0)
>> +#define STARFIVE_RX_ENABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (STARFIVE_RX_EN | \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 STARFIVE_RX_CHANNEL_2_EN | \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 STARFIVE_RX_CHANNEL_1_EN | \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 STARFIVE_RX_CHANNEL_0_EN)
>> +
>> +/* REG: 0x1d1 */
>> +#define STARFIVE_PRE_PLL_FRAC_DIV_H=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1d1
>> +#define STARFIVE_PRE_PLL_FRAC_DIV_23_16(x)=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 UPDATE((x) >> 16, 7, 0)
>> +/* REG: 0x1d2 */
>> +#define STARFIVE_PRE_PLL_FRAC_DIV_M=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1d2
>> +#define STARFIVE_PRE_PLL_FRAC_DIV_15_8(x)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 UPDATE((x) >> 8, 7, 0)
>> +/* REG: 0x1d3 */
>> +#define STARFIVE_PRE_PLL_FRAC_DIV_L=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1d3
>> +#define STARFIVE_PRE_PLL_FRAC_DIV_7_0(x)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 UPDATE(x, 7, 0)
>> +
>> +struct pre_pll_config {
>> +=C2=A0=C2=A0=C2=A0 unsigned long pixclock;
>> +=C2=A0=C2=A0=C2=A0 unsigned long tmdsclock;
>> +=C2=A0=C2=A0=C2=A0 u8 prediv;
>> +=C2=A0=C2=A0=C2=A0 u16 fbdiv;
>> +=C2=A0=C2=A0=C2=A0 u8 tmds_div_a;
>> +=C2=A0=C2=A0=C2=A0 u8 tmds_div_b;
>> +=C2=A0=C2=A0=C2=A0 u8 tmds_div_c;
>> +=C2=A0=C2=A0=C2=A0 u8 pclk_div_a;
>> +=C2=A0=C2=A0=C2=A0 u8 pclk_div_b;
>> +=C2=A0=C2=A0=C2=A0 u8 pclk_div_c;
>> +=C2=A0=C2=A0=C2=A0 u8 pclk_div_d;
>> +=C2=A0=C2=A0=C2=A0 u8 vco_div_5_en;
>> +=C2=A0=C2=A0=C2=A0 u32 fracdiv;
>> +};
>> +
>> +struct post_pll_config {
>> +=C2=A0=C2=A0=C2=A0 unsigned long tmdsclock;
>> +=C2=A0=C2=A0=C2=A0 u8 prediv;
>> +=C2=A0=C2=A0=C2=A0 u16 fbdiv;
>> +=C2=A0=C2=A0=C2=A0 u8 postdiv;
>> +=C2=A0=C2=A0=C2=A0 u8 post_div_en;
>> +=C2=A0=C2=A0=C2=A0 u8 version;
>> +};
>> +
>> +struct phy_config {
>> +=C2=A0=C2=A0=C2=A0 unsigned long=C2=A0=C2=A0=C2=A0 tmdsclock;
>> +=C2=A0=C2=A0=C2=A0 u8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regs[=
14];
>> +};
>> +
>> +struct hdmi_data_info {
>> +=C2=A0=C2=A0=C2=A0 int vic;
>> +=C2=A0=C2=A0=C2=A0 bool sink_is_hdmi;
>> +=C2=A0=C2=A0=C2=A0 bool sink_has_audio;
>> +=C2=A0=C2=A0=C2=A0 unsigned int enc_in_format;
>> +=C2=A0=C2=A0=C2=A0 unsigned int enc_out_format;
>> +=C2=A0=C2=A0=C2=A0 unsigned int colorimetry;
>> +};
>> +
>> +struct starfive_hdmi {
>> +=C2=A0=C2=A0=C2=A0 struct device *dev;
>> +=C2=A0=C2=A0=C2=A0 struct drm_device *drm_dev;
>> +=C2=A0=C2=A0=C2=A0 struct drm_encoder=C2=A0=C2=A0=C2=A0 encoder;
>> +=C2=A0=C2=A0=C2=A0 struct drm_connector=C2=A0=C2=A0=C2=A0 connector;
>> +
>> +=C2=A0=C2=A0=C2=A0 struct starfive_hdmi_i2c *i2c;
>> +
>> +=C2=A0=C2=A0=C2=A0 int irq;
>> +=C2=A0=C2=A0=C2=A0 struct clk *sys_clk;
>> +=C2=A0=C2=A0=C2=A0 struct clk *mclk;
>> +=C2=A0=C2=A0=C2=A0 struct clk *bclk;
>> +=C2=A0=C2=A0=C2=A0 struct reset_control *tx_rst;
>> +=C2=A0=C2=A0=C2=A0 void __iomem *regs;
>> +
>> +=C2=A0=C2=A0=C2=A0 struct i2c_adapter *ddc;
>> +
>> +=C2=A0=C2=A0=C2=A0 unsigned long tmds_rate;
>> +
>> +=C2=A0=C2=A0=C2=A0 struct hdmi_data_info=C2=A0=C2=A0=C2=A0 hdmi_data;
>> +=C2=A0=C2=A0=C2=A0 struct drm_display_mode previous_mode;
>> +=C2=A0=C2=A0=C2=A0 const struct pre_pll_config=C2=A0=C2=A0=C2=A0 *pre=
_cfg;
>> +=C2=A0=C2=A0=C2=A0 const struct post_pll_config=C2=A0=C2=A0=C2=A0 *po=
st_cfg;
>> +};
>> +
>> +#endif /* __STARFIVE_HDMI_H__ */
>> diff --git a/drivers/gpu/drm/verisilicon/vs_drv.c b/drivers/gpu/drm/ve=
risilicon/vs_drv.c
>> index 3cd533cfa..9669354bd 100644
>> --- a/drivers/gpu/drm/verisilicon/vs_drv.c
>> +++ b/drivers/gpu/drm/verisilicon/vs_drv.c
>> @@ -126,6 +126,11 @@ static const struct component_master_ops vs_drm_o=
ps =3D {
>> =C2=A0 static struct platform_driver *drm_sub_drivers[] =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &dc_platform_driver,
>> =C2=A0 +=C2=A0=C2=A0=C2=A0 /* connector + encoder*/
>> +#ifdef CONFIG_DRM_VERISILICON_STARFIVE_HDMI
>> +=C2=A0=C2=A0=C2=A0 &starfive_hdmi_driver,
>> +#endif
>> +
>> =C2=A0 };
>> =C2=A0 =C2=A0 static struct component_match *vs_drm_match_add(struct d=
evice *dev)
>> diff --git a/drivers/gpu/drm/verisilicon/vs_drv.h b/drivers/gpu/drm/ve=
risilicon/vs_drv.h
>> index 369ad22d6..e90723419 100644
>> --- a/drivers/gpu/drm/verisilicon/vs_drv.h
>> +++ b/drivers/gpu/drm/verisilicon/vs_drv.h
>> @@ -24,4 +24,8 @@ to_vs_drm_private(const struct drm_device *dev)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return container_of(dev, struct vs_drm_=
device, base);
>> =C2=A0 }
>> =C2=A0 +#ifdef CONFIG_DRM_VERISILICON_STARFIVE_HDMI
>> +extern struct platform_driver starfive_hdmi_driver;
>> +#endif
>> +
>> =C2=A0 #endif /* __VS_DRV_H__ */
>=20

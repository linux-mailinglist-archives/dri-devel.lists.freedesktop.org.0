Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC8BA26209
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 19:15:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B4A10E55A;
	Mon,  3 Feb 2025 18:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="kZVOld9g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F3710E546
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 18:15:31 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250203181529euoutp014b460865fa29f9ebde29838786ca0965~gxW1X4urA1224112241euoutp01j
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 18:15:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250203181529euoutp014b460865fa29f9ebde29838786ca0965~gxW1X4urA1224112241euoutp01j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1738606529;
 bh=ATRNQs6SQiqxwbM6TyjeaiZ5EawcP5XuH486iMNuXfk=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=kZVOld9gDGb8Z9yOiq2i9P6DPWanYHOIW6ZTCEj2e5QJyGja+jXgB0bfTvKXTcYh4
 i+Frs5DMNpv+kYWbCT2Y/oprUklUnzP6oJMsQbV1gG5WKS8D8cWd1X7+zCQ7iJ4avx
 OOSgcRDSc2Y7/+v4K5gnZLb/yKmBd3WO9LQDOhR4=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250203181529eucas1p162b3f6c0f0bb11198ae02ab87752c66a~gxW0_pNMu0360103601eucas1p1w;
 Mon,  3 Feb 2025 18:15:29 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 16.E0.20409.0C701A76; Mon,  3
 Feb 2025 18:15:29 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250203181528eucas1p27f4712431fefc748f14fd3cf3742d7fb~gxW0elRn51342213422eucas1p26;
 Mon,  3 Feb 2025 18:15:28 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250203181528eusmtrp1d757fdba67749e13da1fcec5959b38f4~gxW0dvEnE0856408564eusmtrp1l;
 Mon,  3 Feb 2025 18:15:28 +0000 (GMT)
X-AuditID: cbfec7f4-c39fa70000004fb9-ff-67a107c0809b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 0D.49.19654.0C701A76; Mon,  3
 Feb 2025 18:15:28 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250203181527eusmtip17aa0a76e29f9235fb4fda073c6a3229b~gxWzHlurr2008520085eusmtip1N;
 Mon,  3 Feb 2025 18:15:27 +0000 (GMT)
Message-ID: <e83ea320-23f0-41ed-934c-2f1687b55ec1@samsung.com>
Date: Mon, 3 Feb 2025 19:15:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/18] reset: thead: Add TH1520 reset controller driver
To: Matt Coster <Matt.Coster@imgtec.com>, "mturquette@baylibre.com"
 <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "drew@pdp7.com" <drew@pdp7.com>, "guoren@kernel.org" <guoren@kernel.org>,
 "wefu@redhat.com" <wefu@redhat.com>, "jassisinghbrar@gmail.com"
 <jassisinghbrar@gmail.com>, "paul.walmsley@sifive.com"
 <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, Frank Binns
 <Frank.Binns@imgtec.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
 "jszhang@kernel.org" <jszhang@kernel.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "m.szyprowski@samsung.com"
 <m.szyprowski@samsung.com>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <816db99d-7088-4c1a-af03-b9a825ac09dc@imgtec.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfVBUVRjG59y9e+9la/Gyq3JaMBwEzaZYQseO5jiRNnMZpgb6hya/2PLO
 YrCgu2yWk4qBCLR8ipOsFstKsEMQiLALyEq7MCy0SXwJCPKhUbIEErEuhgPFcqn47/e85znv
 e553DsUT3SIk1PH4RFYZL4vzJwS4sfWvjlctZJE8+HEVhtr69RiqfaYlUbm5A0OFLR18NNJd
 g6HeJzME+v7XThJNmM/jqM/wNYmSWysJ5NCOEGhWM8JHPQ3XCDSX2QKQcS6FQBUtwyQqmq3F
 UXFdA0Cp6SV81PXj22h4pA1Hjh4ND6Vq16G/G+tItNR3A0dXHzeRqGYql49sFVEopSkff3MT
 MzNwgWSmHA6caU5zkozZpcOZeu0wyWjqfwJMdVk6wdzvaySYb9ojmdEvbRhzs/gck1LRijHZ
 i8HMzO27BJNVUwaY7uR+MkL0gWDvMTbu+CesUrovWhDzi23ribaIT03WG2QSuBOaATwoSO+E
 1VkOIgMIKBFtAFD/e+6qcALovPcFzok5AAeTbbwMQK1cqSzZyNVLASwx/ww4Mb0sJgeA2ySk
 90Gjbr97BE4HQOfQEuZmIe0F2wvGcTdvoP3g6OAV0s1iOgL2PNXx3H3W0yYKZt0cXTng0Uk8
 mJZzlmNvODheuNKIoEPgWGkh380ey7Pm780CzuMHTdPXVhpB+q4AujKrSC7oAWhtc/I4FsNJ
 W81q3RfaL2lwjhPgWO2fq57PYb3GtspvwPsdC4Q7GI/eDisbpFw5FP5hmMS5pXjCgWkv7gme
 MM/41equhDAtVcS5t8LLmsz/hnYYjFgO8Neu2Yp2TUjtmjDa/+fqAF4GvFm1SiFnVSHx7Kkg
 lUyhUsfLgz5KUFSD5f9tX7I560Dp5GyQFWAUsAJI8fzXC+0mnVwkPCb77DSrTDiqVMexKivw
 oXB/b6G+6YJcRMtliWwsy55glf+eYpSHJAk7Vbaj4mi45Ug/a5JsueWT/qFkJLg3UnymKTBH
 EWuVpiVvaPC53m6Tejh7w9/ZDCMPd+7Xx5059Ew40XzVJ5A5sjCw2ei5GBne/kp54kHLw4DX
 v43e4/m+XldYGZu4+7Jc9PC6C8xsVL+n2zM/mN9pl7676w7KkIYENY86N+X2mYmCHyxvDb3Q
 AtYF/PZSnl/2xUVFV1D36XO7dly8oqO2H6BD2C09zb18daM4r4qacu1+OhT9pHubw1dsan4w
 Nm4vN8+PHZSEaTolhwoeZb94+8HJjy/tLHq+/tFzoVELhijF3vjA8fOMlyZf2UmfPCud8I3R
 u74Lk4JtFkXx4TCyy+WPq2Jkr73MU6pk/wAJ4+3NTgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDKsWRmVeSWpSXmKPExsVy+t/xu7oH2BemG8y5L2Vx4voiJoutv2ex
 W6zZe47JYv6Rc6wW9y5tYbK48vU9m8W6pxfYLV7sbWSxuLZiLrtF87H1bBYvZ91js/jYc4/V
 4vKuOWwWn3uPMFps+9zCZrH2yF12i4Uft7JYLNmxi9GirXMZq8XFU64Wd++dYLF4ebmH2aJt
 Fr/F/z072C3+XdvIYjH73X52iy1vJrJaHF8bbtGyfwqLg6zH+xut7B5vXr5k8Tjc8YXdY++3
 BSweO2fdZffo2XmG0WPTqk42jzvX9rB5zDsZ6HG/+ziTx+Yl9R4ta48xefT/NfB4v+8qm0ff
 llWMHpear7MHCEXp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSW
 pRbp2yXoZTw+rlZwIqBi+6GN7A2MZx27GDk4JARMJNYvE+ti5OIQEljKKHF8wz7mLkZOoLiM
 xLXulywQtrDEn2tdbCC2kMBrRokTE0NAenkF7CS2LXAGCbMIqEh8uf2PCcTmFRCUODnzCVir
 qIC8xP1bM9hByoUF/CTmrTIAWSUisJdDYteNnywgDrNAA7PEqtk3mCGO+McoMe/XDLBJzALi
 EreezAez2QSMJB4sn88KYnMCLf5+8yMjyFRmAXWJ9fOEIMrlJba/ncM8gVFoFpI7ZiGZNAuh
 YxaSjgWMLKsYRVJLi3PTc4uN9IoTc4tL89L1kvNzNzECk9W2Yz+37GBc+eqj3iFGJg7GQ4wS
 HMxKIrynty9IF+JNSaysSi3Kjy8qzUktPsRoCgyLicxSosn5wHSZVxJvaGZgamhiZmlgamlm
 rCTOy3blfJqQQHpiSWp2ampBahFMHxMHp1QD05yG+esjrxXf/tY9ffsLC6GkezU1i+va+JWd
 T+97/WpWhKnZk+v2s6tc19y++vn+HJu9e/a0Bz80cK3c2vmw7IN7TnqHzXdvT24tp4VKXeqH
 anYoR524rbP91wnhkImb8rvXRew4r12RYfB6kZzxgQthuwrkPpxb4bdQ7Me3o5M/PT0vMH9X
 5KKutl+xZy+vX91dMOWAcIua/8wdc7dwGOhH+3t7HFouwxp+f3LXdx35VTUem99w8AgzhV74
 4Xtk5a1AgdTamLsbU0M3dbZ8TD977iqfZJfZxHlpDcYvFlYu4dqhfp6jRauAr0cg/X38km9P
 9eT27+1/dPp1omB5l6radqNHfhOX71fjr4q48kqJpTgj0VCLuag4EQCvoNaN3wMAAA==
X-CMS-MailID: 20250203181528eucas1p27f4712431fefc748f14fd3cf3742d7fb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250128194836eucas1p151c4fc83a17173fd1b79bfc959976301
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250128194836eucas1p151c4fc83a17173fd1b79bfc959976301
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <CGME20250128194836eucas1p151c4fc83a17173fd1b79bfc959976301@eucas1p1.samsung.com>
 <20250128194816.2185326-10-m.wilczynski@samsung.com>
 <816db99d-7088-4c1a-af03-b9a825ac09dc@imgtec.com>
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



On 1/31/25 16:39, Matt Coster wrote:
> On 28/01/2025 19:48, Michal Wilczynski wrote:
>> Add reset controller driver for the T-HEAD TH1520 SoC that manages
>> hardware reset lines for various subsystems. The driver currently
>> implements support for GPU reset control, with infrastructure in place
>> to extend support for NPU and Watchdog Timer resets in future updates.
>>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  MAINTAINERS                  |   1 +
>>  drivers/reset/Kconfig        |  10 ++
>>  drivers/reset/Makefile       |   1 +
>>  drivers/reset/reset-th1520.c | 178 +++++++++++++++++++++++++++++++++++
>>  4 files changed, 190 insertions(+)
>>  create mode 100644 drivers/reset/reset-th1520.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index b4e21d814481..d71b8c68ae48 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -20352,6 +20352,7 @@ F:	drivers/mailbox/mailbox-th1520.c
>>  F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
>>  F:	drivers/pinctrl/pinctrl-th1520.c
>>  F:	drivers/pmdomain/thead/
>> +F:	drivers/reset/reset-th1520.c
>>  F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
>>  F:	include/dt-bindings/power/thead,th1520-power.h
>>  F:	include/dt-bindings/reset/thead,th1520-reset.h
>> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
>> index 5b3abb6db248..fa0943c3d1de 100644
>> --- a/drivers/reset/Kconfig
>> +++ b/drivers/reset/Kconfig
>> @@ -272,6 +272,16 @@ config RESET_SUNXI
>>  	help
>>  	  This enables the reset driver for Allwinner SoCs.
>>  
>> +config RESET_TH1520
>> +	tristate "T-HEAD 1520 reset controller"
>> +	depends on ARCH_THEAD || COMPILE_TEST
>> +	select REGMAP_MMIO
>> +	help
>> +	  This driver provides support for the T-HEAD TH1520 SoC reset controller,
>> +	  which manages hardware reset lines for SoC components such as the GPU.
>> +	  Enable this option if you need to control hardware resets on TH1520-based
>> +	  systems.
>> +
>>  config RESET_TI_SCI
>>  	tristate "TI System Control Interface (TI-SCI) reset driver"
>>  	depends on TI_SCI_PROTOCOL || (COMPILE_TEST && TI_SCI_PROTOCOL=n)
>> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
>> index 677c4d1e2632..d6c2774407ae 100644
>> --- a/drivers/reset/Makefile
>> +++ b/drivers/reset/Makefile
>> @@ -35,6 +35,7 @@ obj-$(CONFIG_RESET_SIMPLE) += reset-simple.o
>>  obj-$(CONFIG_RESET_SOCFPGA) += reset-socfpga.o
>>  obj-$(CONFIG_RESET_SUNPLUS) += reset-sunplus.o
>>  obj-$(CONFIG_RESET_SUNXI) += reset-sunxi.o
>> +obj-$(CONFIG_RESET_TH1520) += reset-th1520.o
>>  obj-$(CONFIG_RESET_TI_SCI) += reset-ti-sci.o
>>  obj-$(CONFIG_RESET_TI_SYSCON) += reset-ti-syscon.o
>>  obj-$(CONFIG_RESET_TI_TPS380X) += reset-tps380x.o
>> diff --git a/drivers/reset/reset-th1520.c b/drivers/reset/reset-th1520.c
>> new file mode 100644
>> index 000000000000..48afbc9f1cdd
>> --- /dev/null
>> +++ b/drivers/reset/reset-th1520.c
>> @@ -0,0 +1,178 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2024 Samsung Electronics Co., Ltd.
>> + * Author: Michal Wilczynski <m.wilczynski@samsung.com>
>> + */
>> +
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/reset-controller.h>
>> +#include <linux/regmap.h>
>> +
>> +#include <dt-bindings/reset/thead,th1520-reset.h>
>> +
>> + /* register offset in VOSYS_REGMAP */
>> +#define TH1520_GPU_RST_CFG		0x0
>> +#define TH1520_GPU_RST_CFG_MASK		GENMASK(2, 0)
>> +
>> +/* register values */
>> +#define TH1520_GPU_SW_GPU_RST		BIT(0)
>> +#define TH1520_GPU_SW_CLKGEN_RST	BIT(1)
>> +
>> +struct th1520_reset_priv {
>> +	struct reset_controller_dev rcdev;
>> +	struct regmap *map;
>> +	struct mutex gpu_seq_lock;  /* protects gpu assert/deassert sequence */
>> +};
>> +
>> +static inline struct th1520_reset_priv *
>> +to_th1520_reset(struct reset_controller_dev *rcdev)
>> +{
>> +	return container_of(rcdev, struct th1520_reset_priv, rcdev);
>> +}
>> +
>> +static void th1520_rst_gpu_enable(struct regmap *reg,
>> +				  struct mutex *gpu_seq_lock)
>> +{
>> +	int val;
>> +
>> +	mutex_lock(gpu_seq_lock);
>> +
>> +	/* if the GPU is not in a reset state it, put it into one */
>> +	regmap_read(reg, TH1520_GPU_RST_CFG, &val);
>> +	if (val)
>> +		regmap_update_bits(reg, TH1520_GPU_RST_CFG,
>> +				   TH1520_GPU_RST_CFG_MASK, 0x0);
>> +
>> +	/* rst gpu clkgen */
>> +	regmap_set_bits(reg, TH1520_GPU_RST_CFG, TH1520_GPU_SW_CLKGEN_RST);
> 
> Do you know what this resets? From our side, the GPU only has a single
> reset line (which I assume to be GPU_RESET).

This is clock generator reset, as described in the manual 5.4.2.6.1
GPU_RST_CFG. It does reside in the same register as the GPU reset line.

I think this is required because the MEM clock gate is somehow broken
and marked as 'reserved' in manual, so instead as a workaround, since we
can't reliably enable the 'mem' clock it's a good idea to reset the
whole CLKGEN of the GPU.

> 
>> +
>> +	/*
>> +	 * According to the hardware manual, a delay of at least 32 clock
>> +	 * cycles is required between de-asserting the clkgen reset and
>> +	 * de-asserting the GPU reset. Assuming a worst-case scenario with
>> +	 * a very high GPU clock frequency, a delay of 1 microsecond is
>> +	 * sufficient to ensure this requirement is met across all
>> +	 * feasible GPU clock speeds.
>> +	 */
>> +	udelay(1);
> 
> I don't love that this procedure appears in the platform reset driver.
> I appreciate it may not be clear from the SoC TRM, but this is the
> standard reset procedure for all IMG Rogue GPUs. The currently
> supported TI SoC handles this in silicon, when power up/down requests
> are sent so we never needed to encode it in the driver before.
> 
> Strictly speaking, the 32 cycle delay is required between power and
> clocks being enabled and the reset line being deasserted. If nothing
> here touches power or clocks (which I don't think it should), the delay
> could potentially be lifted to the GPU driver.

Yeah you're making excellent points here, I think it would be a good    
idea to place the delay in the GPU driver, since this is specific to the
whole family of the GPU's not the SoC itself.

> 
> Is it expected that if a device exposes a reset in devicetree that it
> can be cleanly reset without interaction with the device driver itself?
> I.E. in this case, is it required that the reset driver alone can cleanly
> reset the GPU?

I'm not sure what the community as a whole thinks about that, so maybe
someone else can answer this, but I would code SoC specific stuff in the
reset driver for the SoC, and the GPU specific stuff (like the delay) in
the GPU driver code. I wasn't sure whether the delay was specific to the
SoC or the GPU so I've put it here.

> 
> Cheers,
> Matt
> 
>> +
>> +	/* rst gpu */
>> +	regmap_set_bits(reg, TH1520_GPU_RST_CFG, TH1520_GPU_SW_GPU_RST);
>> +
>> +	mutex_unlock(gpu_seq_lock);
>> +}
>> +
>> +static void th1520_rst_gpu_disable(struct regmap *reg,
>> +				   struct mutex *gpu_seq_lock)
>> +{
>> +	mutex_lock(gpu_seq_lock);
>> +
>> +	regmap_update_bits(reg, TH1520_GPU_RST_CFG, TH1520_GPU_RST_CFG_MASK, 0x0);
>> +
>> +	mutex_unlock(gpu_seq_lock);
>> +}
>> +
>> +static int th1520_reset_assert(struct reset_controller_dev *rcdev, unsigned long id)
>> +{
>> +	struct th1520_reset_priv *priv = to_th1520_reset(rcdev);
>> +
>> +	switch (id) {
>> +	case TH1520_RESET_ID_GPU:
>> +		th1520_rst_gpu_disable(priv->map, &priv->gpu_seq_lock);
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int th1520_reset_deassert(struct reset_controller_dev *rcdev, unsigned long id)
>> +{
>> +	struct th1520_reset_priv *priv = to_th1520_reset(rcdev);
>> +
>> +	switch (id) {
>> +	case TH1520_RESET_ID_GPU:
>> +		th1520_rst_gpu_enable(priv->map, &priv->gpu_seq_lock);
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int th1520_reset_xlate(struct reset_controller_dev *rcdev,
>> +			      const struct of_phandle_args *reset_spec)
>> +{
>> +	unsigned int index = reset_spec->args[0];
>> +
>> +	/* currently, only GPU reset is implemented in this driver */
>> +	if (index == TH1520_RESET_ID_GPU)
>> +		return index;
>> +
>> +	return -EOPNOTSUPP;
>> +}
>> +
>> +static const struct reset_control_ops th1520_reset_ops = {
>> +	.assert	= th1520_reset_assert,
>> +	.deassert = th1520_reset_deassert,
>> +};
>> +
>> +static const struct regmap_config th1520_reset_regmap_config = {
>> +	.reg_bits = 32,
>> +	.val_bits = 32,
>> +	.reg_stride = 4,
>> +	.fast_io = true,
>> +};
>> +
>> +static int th1520_reset_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct th1520_reset_priv *priv;
>> +	void __iomem *base;
>> +
>> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	base = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(base))
>> +		return PTR_ERR(base);
>> +
>> +	priv->map = devm_regmap_init_mmio(dev, base,
>> +					  &th1520_reset_regmap_config);
>> +	if (IS_ERR(priv->map))
>> +		return PTR_ERR(priv->map);
>> +
>> +	mutex_init(&priv->gpu_seq_lock);
>> +
>> +	priv->rcdev.owner = THIS_MODULE;
>> +	priv->rcdev.nr_resets = 1;
>> +	priv->rcdev.ops = &th1520_reset_ops;
>> +	priv->rcdev.of_node = dev->of_node;
>> +	priv->rcdev.of_xlate = th1520_reset_xlate;
>> +	priv->rcdev.of_reset_n_cells = 1;
>> +
>> +	return devm_reset_controller_register(dev, &priv->rcdev);
>> +}
>> +
>> +static const struct of_device_id th1520_reset_match[] = {
>> +	{ .compatible = "thead,th1520-reset" },
>> +	{ /* sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, th1520_reset_match);
>> +
>> +static struct platform_driver th1520_reset_driver = {
>> +	.driver = {
>> +		.name = "th1520-reset",
>> +		.of_match_table = th1520_reset_match,
>> +	},
>> +	.probe = th1520_reset_probe,
>> +};
>> +module_platform_driver(th1520_reset_driver);
>> +
>> +MODULE_AUTHOR("Michal Wilczynski <m.wilczynski@samsung.com>");
>> +MODULE_DESCRIPTION("T-HEAD TH1520 SoC reset controller");
>> +MODULE_LICENSE("GPL");
> 

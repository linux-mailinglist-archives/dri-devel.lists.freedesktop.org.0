Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A017B96D0A
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 18:26:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A377910E200;
	Tue, 23 Sep 2025 16:25:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="J6tiLrum";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 795E810E1FE
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 16:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1758644755;
 bh=XiJSY4VpfoA9npebks4XLo2QLPdZ8erhnCgVvcpi0Bk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=J6tiLrumLDgXvSvOiuvJJJPolADtg8e9Vq9TIZ73U+r/eEeNcrWWPwgTbYel8ygcx
 5u51UNbI2pPo1zLeQtXvkIT21Y7hyPt5vfke7h+HJMttDNNkzTHeF0cpt6AFnQK1B2
 fKipsu3ZSbSrPMq7xHM645d1muPocDldkJoojA90ccc9PGKsBAQbLQIjtilMmASFX5
 RR1lYZuhB7x7Z2SYo0HUHRTPhVF1s89dSEqIZJZuEM2EU2cXY3SQfZkteumuXuBJ5/
 7YE+Wc8nSsQoz9qxtgNxmLibE78RBuzcOyxGoOOYuZcTwsDexPHwlrQPxZnHcvN/ym
 Y1l47J4bGxRjg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 513BA17E132A;
 Tue, 23 Sep 2025 18:25:54 +0200 (CEST)
Message-ID: <673af008-04a8-432d-9517-ca2255e6b35f@collabora.com>
Date: Tue, 23 Sep 2025 18:25:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] pmdomain: mediatek: Add support for MFlexGraphics
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Chia-I Wu <olvaffe@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-hardening@vger.kernel.org, linux-pm@vger.kernel.org
References: <20250923-mt8196-gpufreq-v4-0-6cd63ade73d6@collabora.com>
 <20250923-mt8196-gpufreq-v4-8-6cd63ade73d6@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250923-mt8196-gpufreq-v4-8-6cd63ade73d6@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Il 23/09/25 13:40, Nicolas Frattaroli ha scritto:
> Various MediaTek SoCs use GPU integration silicon named "MFlexGraphics"
> by MediaTek. On the MT8196 and MT6991 SoCs, interacting with this
> integration silicon is required to power on the GPU.
> 
> This glue silicon is in the form of an embedded microcontroller running
> special-purpose firmware, which autonomously adjusts clocks and
> regulators.
> 
> Implement a driver, modelled as a pmdomain driver with a
> set_performance_state operation, to support these SoCs.
> 
> The driver also exposes the actual achieved clock rate, as read back
> from the MCU, as common clock framework clocks, by acting as a clock
> provider as well.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>   drivers/pmdomain/mediatek/Kconfig            |  16 +
>   drivers/pmdomain/mediatek/Makefile           |   1 +
>   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c | 928 +++++++++++++++++++++++++++
>   3 files changed, 945 insertions(+)
> 
> diff --git a/drivers/pmdomain/mediatek/Kconfig b/drivers/pmdomain/mediatek/Kconfig
> index 0e34a517ab7d5a867bebaab11c0d866282a15e45..2abf78c85d017b1e3526b41c81f274f78d581fd0 100644
> --- a/drivers/pmdomain/mediatek/Kconfig
> +++ b/drivers/pmdomain/mediatek/Kconfig
> @@ -26,6 +26,22 @@ config MTK_SCPSYS_PM_DOMAINS
>   	  Control Processor System (SCPSYS) has several power management related
>   	  tasks in the system.
>   
> +config MTK_MFG_PM_DOMAIN
> +	tristate "MediaTek MFlexGraphics power domain"
> +	default ARCH_MEDIATEK
> +	depends on PM
> +	depends on OF
> +	depends on COMMON_CLK
> +	select PM_GENERIC_DOMAINS
> +	imply MTK_GPUEB_MBOX
> +	help
> +	  Say y or m here to enable the power domains driver for MediaTek
> +	  MFlexGraphics. This driver allows for power and frequency control of
> +	  GPUs on MediaTek SoCs such as the MT8196 or MT6991.
> +
> +	  This driver is required for the Mali GPU to work at all on MT8196 and
> +	  MT6991.
> +
>   config AIROHA_CPU_PM_DOMAIN
>   	tristate "Airoha CPU power domain"
>   	default ARCH_AIROHA
> diff --git a/drivers/pmdomain/mediatek/Makefile b/drivers/pmdomain/mediatek/Makefile
> index 18ba92e3c418154e1d428dbc6b59b97b26056d98..b424f1ed867604393b3ff96364855363aedaa40c 100644
> --- a/drivers/pmdomain/mediatek/Makefile
> +++ b/drivers/pmdomain/mediatek/Makefile
> @@ -1,4 +1,5 @@
>   # SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_MTK_MFG_PM_DOMAIN)		+= mtk-mfg-pmdomain.o
>   obj-$(CONFIG_MTK_SCPSYS)		+= mtk-scpsys.o
>   obj-$(CONFIG_MTK_SCPSYS_PM_DOMAINS) 	+= mtk-pm-domains.o
>   obj-$(CONFIG_AIROHA_CPU_PM_DOMAIN) 	+= airoha-cpu-pmdomain.o
> diff --git a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c b/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..3148796a6b8aea9958c424f695efb7d8af23b7ce
> --- /dev/null
> +++ b/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
> @@ -0,0 +1,928 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Driver for MediaTek MFlexGraphics Devices
> + *
> + * Copyright (C) 2025, Collabora Ltd.
> + */
> +
> +#include <linux/completion.h>
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/container_of.h>
> +#include <linux/iopoll.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_platform.h>
> +#include <linux/overflow.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/pm_opp.h>
> +#include <linux/regulator/consumer.h>
> +
> +#define GPR_LP_STATE		0x0028
> +#define   EB_ON_SUSPEND		0x0
> +#define   EB_ON_RESUME		0x1
> +#define GPR_IPI_MAGIC		0x34
> +
> +#define RPC_PWR_CON		0x0504
> +#define   PWR_ACK_M		GENMASK(31, 30)
> +#define RPC_DUMMY_REG_2		0x0658
> +#define RPC_GHPM_CFG0_CON	0x0800
> +#define   GHPM_ENABLE_M		BIT(0)
> +#define   GHPM_ON_SEQ_M		BIT(2)
> +#define RPC_GHPM_RO0_CON	0x09A4
> +#define   GHPM_STATE_M		GENMASK(7, 0)
> +#define   GHPM_PWR_STATE_M	BIT(16)
> +
> +#define GF_REG_MAGIC			0x0000
> +#define GF_REG_GPU_OPP_IDX		0x0004
> +#define GF_REG_STK_OPP_IDX		0x0008
> +#define GF_REG_GPU_OPP_NUM		0x000c
> +#define GF_REG_STK_OPP_NUM		0x0010
> +#define GF_REG_GPU_OPP_SNUM		0x0014
> +#define GF_REG_STK_OPP_SNUM		0x0018
> +#define GF_REG_POWER_COUNT		0x001c
> +#define GF_REG_BUCK_COUNT		0x0020
> +#define GF_REG_MTCMOS_COUNT		0x0024
> +#define GF_REG_CG_COUNT			0x0028 /* CG = Clock Gate? */
> +#define GF_REG_ACTIVE_COUNT		0x002C
> +#define GF_REG_TEMP_RAW			0x0030
> +#define GF_REG_TEMP_NORM_GPU		0x0034
> +#define GF_REG_TEMP_HIGH_GPU		0x0038
> +#define GF_REG_TEMP_NORM_STK		0x003C
> +#define GF_REG_TEMP_HIGH_STK		0x0040
> +#define GF_REG_FREQ_CUR_GPU		0x0044
> +#define GF_REG_FREQ_CUR_STK		0x0048
> +#define GF_REG_FREQ_OUT_GPU		0x004C /* Guess: actual achieved freq */
> +#define GF_REG_FREQ_OUT_STK		0x0050 /* Guess: actual achieved freq */
> +#define GF_REG_FREQ_METER_GPU		0x0054 /* Seems unused, always 0 */
> +#define GF_REG_FREQ_METER_STK		0x0058 /* Seems unused, always 0 */
> +#define GF_REG_VOLT_CUR_GPU		0x005C /* in tens of microvolts */
> +#define GF_REG_VOLT_CUR_STK		0x0060 /* in tens of microvolts */
> +#define GF_REG_VOLT_CUR_GPU_SRAM	0x0064
> +#define GF_REG_VOLT_CUR_STK_SRAM	0x0068
> +#define GF_REG_VOLT_CUR_GPU_REG		0x006C /* Seems unused, always 0 */
> +#define GF_REG_VOLT_CUR_STK_REG		0x0070 /* Seems unused, always 0 */
> +#define GF_REG_VOLT_CUR_GPU_REG_SRAM	0x0074
> +#define GF_REG_VOLT_CUR_STK_REG_SRAM	0x0078
> +#define GF_REG_PWR_CUR_GPU		0x007C /* in milliwatts */
> +#define GF_REG_PWR_CUR_STK		0x0080 /* in milliwatts */
> +#define GF_REG_PWR_MAX_GPU		0x0084 /* in milliwatts */
> +#define GF_REG_PWR_MAX_STK		0x0088 /* in milliwatts */
> +#define GF_REG_PWR_MIN_GPU		0x008C /* in milliwatts */
> +#define GF_REG_PWR_MIN_STK		0x0090 /* in milliwatts */
> +#define GF_REG_LEAKAGE_RT_GPU		0x0094 /* Unknown */
> +#define GF_REG_LEAKAGE_RT_STK		0x0098 /* Unknown */
> +#define GF_REG_LEAKAGE_RT_SRAM		0x009C /* Unknown */
> +#define GF_REG_LEAKAGE_HT_GPU		0x00A0 /* Unknown */
> +#define GF_REG_LEAKAGE_HT_STK		0x00A4 /* Unknown */
> +#define GF_REG_LEAKAGE_HT_SRAM		0x00A8 /* Unknown */
> +#define GF_REG_VOLT_DAC_LOW_GPU		0x00AC /* Seems unused, always 0 */
> +#define GF_REG_VOLT_DAC_LOW_STK		0x00B0 /* Seems unused, always 0 */
> +#define GF_REG_OPP_CUR_CEIL		0x00B4
> +#define GF_REG_OPP_CUR_FLOOR		0x00B8
> +#define GF_REG_OPP_CUR_LIMITER_CEIL	0x00BC
> +#define GF_REG_OPP_CUR_LIMITER_FLOOR	0x00C0
> +#define GF_REG_OPP_PRIORITY_CEIL	0x00C4
> +#define GF_REG_OPP_PRIORITY_FLOOR	0x00C8
> +#define GF_REG_PWR_CTL			0x00CC
> +#define GF_REG_ACTIVE_SLEEP_CTL		0x00D0
> +#define GF_REG_DVFS_STATE		0x00D4
> +#define GF_REG_SHADER_PRESENT		0x00D8
> +#define GF_REG_ASENSOR_ENABLE		0x00DC
> +#define GF_REG_AGING_LOAD		0x00E0
> +#define GF_REG_AGING_MARGIN		0x00E4
> +#define GF_REG_AVS_ENABLE		0x00E8
> +#define GF_REG_AVS_MARGIN		0x00EC
> +#define GF_REG_CHIP_TYPE		0x00F0
> +#define GF_REG_SB_VERSION		0x00F4
> +#define GF_REG_PTP_VERSION		0x00F8
> +#define GF_REG_DBG_VERSION		0x00FC
> +#define GF_REG_KDBG_VERSION		0x0100
> +#define GF_REG_GPM1_MODE		0x0104
> +#define GF_REG_GPM3_MODE		0x0108
> +#define GF_REG_DFD_MODE			0x010C
> +#define GF_REG_DUAL_BUCK		0x0110
> +#define GF_REG_SEGMENT_ID		0x0114
> +#define GF_REG_POWER_TIME_H		0x0118
> +#define GF_REG_POWER_TIME_L		0x011C
> +#define GF_REG_PWR_STATUS		0x0120
> +#define GF_REG_STRESS_TEST		0x0124
> +#define GF_REG_TEST_MODE		0x0128
> +#define GF_REG_IPS_MODE			0x012C
> +#define GF_REG_TEMP_COMP_MODE		0x0130
> +#define GF_REG_HT_TEMP_COMP_MODE	0x0134
> +#define GF_REG_PWR_TRACKER_MODE		0x0138
> +#define GF_REG_OPP_TABLE_GPU		0x0314
> +#define GF_REG_OPP_TABLE_STK		0x09A4
> +#define GF_REG_OPP_TABLE_GPU_S		0x1034
> +#define GF_REG_OPP_TABLE_STK_S		0x16c4
> +#define GF_REG_LIMIT_TABLE		0x1d54
> +#define GF_REG_GPM3_TABLE		0x223C
> +
> +#define MFG_MT8196_E2_ID		0x101
> +#define GPUEB_SLEEP_MAGIC		0x55667788UL
> +#define GPUEB_SRAM_MAGIC		0xBABADADAUL
> +
> +#define GPUEB_TIMEOUT_US		10000UL
> +#define GPUEB_POLL_US			50
> +
> +#define MAX_OPP_NUM			70
> +
> +#define GPUEB_MBOX_MAX_RX_SIZE		32 /* in bytes */
> +
> +/*
> + * This enum is part of the ABI of the GPUEB firmware. Don't change the
> + * numbering, as you would wreak havoc.
> + */
> +enum mtk_mfg_ipi_cmd {
> +	CMD_INIT_SHARED_MEM		= 0,
> +	CMD_GET_FREQ_BY_IDX		= 1,
> +	CMD_GET_POWER_BY_IDX		= 2,
> +	CMD_GET_OPPIDX_BY_FREQ		= 3,
> +	CMD_GET_LEAKAGE_POWER		= 4,
> +	CMD_SET_LIMIT			= 5,
> +	CMD_POWER_CONTROL		= 6,
> +	CMD_ACTIVE_SLEEP_CONTROL	= 7,
> +	CMD_COMMIT			= 8,
> +	CMD_DUAL_COMMIT			= 9,
> +	CMD_PDCA_CONFIG			= 10,
> +	CMD_UPDATE_DEBUG_OPP_INFO	= 11,
> +	CMD_SWITCH_LIMIT		= 12,
> +	CMD_FIX_TARGET_OPPIDX		= 13,
> +	CMD_FIX_DUAL_TARGET_OPPIDX	= 14,
> +	CMD_FIX_CUSTOM_FREQ_VOLT	= 15,
> +	CMD_FIX_DUAL_CUSTOM_FREQ_VOLT	= 16,
> +	CMD_SET_MFGSYS_CONFIG		= 17,
> +	CMD_MSSV_COMMIT			= 18,
> +	CMD_NUM				= 19,

I don't really like seeing index assignments to enumeration, especially when there
are no holes... and you have also clearly written that this is ABI-do-not-touch so
I'm not sure that having those numbers here is improving anything.

I also haven't got strong opinions about that, anyway.

> +};
> +
> +/*
> + * This struct is part of the ABI of the GPUEB firmware. Changing it, or
> + * reordering fields in it, will break things, so don't do it. Thank you.
> + */
> +struct __packed mtk_mfg_ipi_msg {
> +	__le32 magic;
> +	__le32 cmd;
> +	__le32 target;
> +	/*
> +	 * Downstream relies on the compiler to implicitly add the following
> +	 * padding, as it declares the struct as non-packed.
> +	 */
> +	__le32 reserved;
> +	union {
> +		s32 __bitwise oppidx;
> +		s32 __bitwise return_value;
> +		__le32 freq;
> +		__le32 volt;
> +		__le32 power;
> +		__le32 power_state;
> +		__le32 mode;
> +		__le32 value;
> +		struct {
> +			__le64 base;
> +			__le32 size;
> +		} shared_mem;
> +		struct {
> +			__le32 freq;
> +			__le32 volt;
> +		} custom;
> +		struct {
> +			__le32 limiter;
> +			s32 __bitwise ceiling_info;
> +			s32 __bitwise floor_info;
> +		} set_limit;
> +		struct {
> +			__le32 target;
> +			__le32 val;
> +		} mfg_cfg;
> +		struct {
> +			__le32 target;
> +			__le32 val;
> +		} mssv;
> +		struct {
> +			s32 __bitwise gpu_oppidx;
> +			s32 __bitwise stack_oppidx;
> +		} dual_commit;
> +		struct {
> +			__le32 fgpu;
> +			__le32 vgpu;
> +			__le32 fstack;
> +			__le32 vstack;
> +		} dual_custom;
> +	} u;
> +};
> +
> +struct __packed mtk_mfg_ipi_sleep_msg {
> +	__le32 event;
> +	__le32 state;
> +	__le32 magic;
> +};
> +
> +/**
> + * struct mtk_mfg_opp_entry - OPP table entry from firmware
> + * @freq_khz: The operating point's frequency in kilohertz
> + * @voltage_core: The operating point's core voltage in tens of microvolts
> + * @voltage_sram: The operating point's SRAM voltage in tens of microvolts
> + * @posdiv: exponent of base 2 for PLL frequency divisor used for this OPP
> + * @voltage_margin: Number of tens of microvolts the voltage can be undershot
> + * @power_mw: estimate of power usage at this operating point, in milliwatts
> + *
> + * This struct is part of the ABI with the EB firmware. Do not change it.
> + */
> +struct __packed mtk_mfg_opp_entry {
> +	__le32 freq_khz;
> +	__le32 voltage_core;
> +	__le32 voltage_sram;
> +	__le32 posdiv;
> +	__le32 voltage_margin;
> +	__le32 power_mw;
> +};
> +
> +struct mtk_mfg_mbox {
> +	struct mbox_client cl;
> +	struct completion rx_done;
> +	struct mtk_mfg *mfg;
> +	struct mbox_chan *ch;
> +	void *rx_data;
> +};
> +
> +struct mtk_mfg {
> +	struct generic_pm_domain pd;
> +	struct platform_device *pdev;
> +	struct clk *clk_eb;
> +	struct clk_bulk_data *gpu_clks;
> +	struct clk_hw clk_core_hw;
> +	struct clk_hw clk_stack_hw;
> +	struct regulator_bulk_data *gpu_regs;
> +	void __iomem *rpc;
> +	void __iomem *gpr;
> +	void __iomem *sram;
> +	phys_addr_t sram_phys;
> +	unsigned int sram_size;
> +	unsigned int ghpm_en_reg;

u16 ghpm_en_reg ?

> +	u32 ipi_magic;

> +	unsigned int num_opps;
> +	unsigned int num_unique_gpu_opps;

(num_opps, num_unique_gpu_opps) -> unsigned short?

> +	struct dev_pm_opp_data *gpu_opps;
> +	struct mtk_mfg_mbox *gf_mbox;
> +	struct mtk_mfg_mbox *slp_mbox;
> +	int last_opp;
> +	const struct mtk_mfg_variant *variant;
> +};
> +
> +struct mtk_mfg_variant {
> +	const char *const *clk_names;
> +	unsigned int num_clks;
> +	const char *const *regulator_names;
> +	unsigned int num_regulators;
> +	/** @turbo_below: opp indices below this value are considered turbo */
> +	unsigned int turbo_below;
> +	int (*init)(struct mtk_mfg *mfg);
> +};
> +
> +static inline struct mtk_mfg *mtk_mfg_from_genpd(struct generic_pm_domain *pd)
> +{
> +	return container_of(pd, struct mtk_mfg, pd);
> +}
> +
> +static inline void mtk_mfg_update_reg_bits(void __iomem *addr, u32 mask, u32 val)
> +{
> +	writel((readl(addr) & ~mask) | (val & mask), addr);
> +}
> +
> +static unsigned long mtk_mfg_recalc_rate_gpu(struct clk_hw *hw,
> +					     unsigned long parent_rate)
> +{
> +	struct mtk_mfg *mfg = container_of(hw, struct mtk_mfg, clk_core_hw);
> +
> +	return readl(mfg->sram + GF_REG_FREQ_OUT_GPU) * 1000UL;

#include <linux/units.h>

	return readl(mfg->sram + GF_REG_FREQ_OUT_GPU) * HZ_PER_KHZ;

> +}
> +
> +static unsigned long mtk_mfg_recalc_rate_stack(struct clk_hw *hw,
> +					       unsigned long parent_rate)
> +{
> +	struct mtk_mfg *mfg = container_of(hw, struct mtk_mfg, clk_stack_hw);
> +
> +	return readl(mfg->sram + GF_REG_FREQ_OUT_STK) * 1000UL;

same

> +}
> +
> +static const struct clk_ops mtk_mfg_clk_gpu_ops = {
> +	.recalc_rate = mtk_mfg_recalc_rate_gpu,
> +};
> +
> +static const struct clk_ops mtk_mfg_clk_stack_ops = {
> +	.recalc_rate = mtk_mfg_recalc_rate_stack,
> +};
> +
> +static const struct clk_init_data mtk_mfg_clk_gpu_init = {
> +	.name = "gpu-core",
> +	.ops = &mtk_mfg_clk_gpu_ops,
> +	.flags = CLK_GET_RATE_NOCACHE,
> +};
> +
> +static const struct clk_init_data mtk_mfg_clk_stack_init = {
> +	.name = "gpu-stack",
> +	.ops = &mtk_mfg_clk_stack_ops,
> +	.flags = CLK_GET_RATE_NOCACHE,
> +};
> +
> +static int mtk_mfg_eb_on(struct mtk_mfg *mfg)
> +{
> +	struct device *dev = &mfg->pdev->dev;
> +	u32 val;
> +	int ret;
> +
> +	/*
> +	 * If MFG is already on from e.g. the bootloader, we should skip doing
> +	 * the power-on sequence, as it wouldn't work without powering it off
> +	 * first.
> +	 */
> +	if ((readl(mfg->rpc + RPC_PWR_CON) & PWR_ACK_M) == PWR_ACK_M)
> +		return 0;
> +
> +	ret = readl_poll_timeout(mfg->rpc + RPC_GHPM_RO0_CON, val,
> +				 !(val & (GHPM_PWR_STATE_M | GHPM_STATE_M)),
> +				 GPUEB_POLL_US, GPUEB_TIMEOUT_US);
> +	if (ret) {
> +		dev_err(dev, "timed out waiting for EB to power on\n");
> +		return ret;
> +	}
> +
> +	mtk_mfg_update_reg_bits(mfg->rpc + mfg->ghpm_en_reg, GHPM_ENABLE_M,
> +				GHPM_ENABLE_M);
> +
> +	mtk_mfg_update_reg_bits(mfg->rpc + RPC_GHPM_CFG0_CON, GHPM_ON_SEQ_M, 0);
> +	mtk_mfg_update_reg_bits(mfg->rpc + RPC_GHPM_CFG0_CON, GHPM_ON_SEQ_M,
> +				GHPM_ON_SEQ_M);
> +
> +	mtk_mfg_update_reg_bits(mfg->rpc + mfg->ghpm_en_reg, GHPM_ENABLE_M, 0);
> +
> +
> +	ret = readl_poll_timeout(mfg->rpc + RPC_PWR_CON, val,
> +				 (val & PWR_ACK_M) == PWR_ACK_M,
> +				 GPUEB_POLL_US, GPUEB_TIMEOUT_US);
> +	if (ret) {
> +		dev_err(dev, "timed out waiting for EB power ack, val = 0x%X\n",
> +			val);
> +		return ret;
> +	}
> +
> +	ret = readl_poll_timeout(mfg->gpr + GPR_LP_STATE, val,
> +				 (val == EB_ON_RESUME),
> +				 GPUEB_POLL_US, GPUEB_TIMEOUT_US);
> +	if (ret) {
> +		dev_err(dev, "timed out waiting for EB to resume, status = 0x%X\n", val);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mtk_mfg_eb_off(struct mtk_mfg *mfg)
> +{
> +	struct device *dev = &mfg->pdev->dev;
> +	struct mtk_mfg_ipi_sleep_msg msg = {

Can this be constified?

> +		.event = 0,
> +		.state = 0,
> +		.magic = GPUEB_SLEEP_MAGIC
> +	};
> +	u32 val;
> +	int ret;
> +
> +	ret = mbox_send_message(mfg->slp_mbox->ch, &msg);
> +	if (ret < 0) {
> +		dev_err(dev, "Cannot send sleep command: %pe\n", ERR_PTR(ret));
> +		return ret;
> +	}
> +
> +	ret = readl_poll_timeout(mfg->rpc + RPC_PWR_CON, val,
> +				 !(val & PWR_ACK_M), GPUEB_POLL_US,
> +				 GPUEB_TIMEOUT_US);
> +
> +	if (ret)
> +		dev_err(dev, "timed out waiting for EB to power off, val=0x%08X\n",
> +			val);

90 columns is fine, one line please.

> +
> +	return ret;
> +}
> +
> +static int mtk_mfg_send_ipi(struct mtk_mfg *mfg, struct mtk_mfg_ipi_msg *msg)
> +{
> +	struct device *dev = &mfg->pdev->dev;
> +	unsigned long wait;
> +	int ret;
> +
> +	msg->magic = mfg->ipi_magic;
> +
> +	ret = mbox_send_message(mfg->gf_mbox->ch, msg);
> +	if (ret < 0) {
> +		dev_err(dev, "Cannot send GPUFreq IPI command: %pe\n", ERR_PTR(ret));
> +		return ret;
> +	}
> +
> +	wait = wait_for_completion_timeout(&mfg->gf_mbox->rx_done, msecs_to_jiffies(500));
> +	if (!wait)
> +		return -ETIMEDOUT;
> +
> +	msg = mfg->gf_mbox->rx_data;
> +
> +	if (msg->u.return_value < 0) {
> +		dev_err(dev, "IPI return: %d\n", msg->u.return_value);
> +		return -EPROTO;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mtk_mfg_init_shared_mem(struct mtk_mfg *mfg)
> +{
> +	struct device *dev = &mfg->pdev->dev;
> +	struct mtk_mfg_ipi_msg msg = {};
> +	int ret;
> +
> +	dev_dbg(dev, "clearing GPUEB sram, 0x%X bytes\n", mfg->sram_size);
> +	memset_io(mfg->sram, 0, mfg->sram_size);
> +
> +	msg.cmd = CMD_INIT_SHARED_MEM;
> +	msg.u.shared_mem.base = mfg->sram_phys;
> +	msg.u.shared_mem.size = mfg->sram_size;
> +
> +	ret = mtk_mfg_send_ipi(mfg, &msg);
> +	if (ret)
> +		return ret;
> +
> +	if (readl(mfg->sram) != GPUEB_SRAM_MAGIC) {
> +		dev_err(dev, "EB did not initialise SRAM correctly\n");
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mtk_mfg_power_control(struct mtk_mfg *mfg, bool enabled)
> +{
> +	struct mtk_mfg_ipi_msg msg = {};
> +
> +	msg.cmd = CMD_POWER_CONTROL;
> +	msg.u.power_state = enabled ? 1 : 0;
> +
> +	return mtk_mfg_send_ipi(mfg, &msg);
> +}
> +
> +static int mtk_mfg_set_oppidx(struct mtk_mfg *mfg, unsigned int opp_idx)
> +{
> +	struct mtk_mfg_ipi_msg msg = {};
> +	int ret;
> +
> +	if (opp_idx >= mfg->num_opps)
> +		return -EINVAL;
> +
> +	if (mfg->last_opp == opp_idx)
> +		return 0;
> +
> +	msg.cmd = CMD_FIX_TARGET_OPPIDX;
> +	msg.u.oppidx = opp_idx;
> +
> +	ret = mtk_mfg_send_ipi(mfg, &msg);
> +	if (ret) {
> +		dev_err(&mfg->pdev->dev, "Failed to set OPP %u: %pe\n",
> +			opp_idx, ERR_PTR(ret));
> +		return ret;
> +	}
> +
> +	mfg->last_opp = opp_idx;
> +
> +	return 0;
> +}
> +
> +static int mtk_mfg_read_opp_tables(struct mtk_mfg *mfg)
> +{
> +	struct device *dev = &mfg->pdev->dev;
> +	struct mtk_mfg_opp_entry e = {};
> +	unsigned int i;
> +	unsigned long long last_freq;
> +
> +	mfg->num_opps = readl(mfg->sram + GF_REG_GPU_OPP_NUM);
> +
> +	if (mfg->num_opps > MAX_OPP_NUM || mfg->num_opps == 0) {
> +		dev_err(dev, "OPP count (%u) out of range %u >= count > 0\n",
> +			mfg->num_opps, MAX_OPP_NUM);
> +		return -EINVAL;
> +	}
> +
> +	mfg->gpu_opps = devm_kcalloc(dev, mfg->num_opps,
> +				     sizeof(struct dev_pm_opp_data), GFP_KERNEL);
> +	if (!mfg->gpu_opps)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < mfg->num_opps; i++) {
> +		memcpy_fromio(&e, mfg->sram + GF_REG_OPP_TABLE_GPU + i * sizeof(e),
> +			      sizeof(e));
> +		if (mem_is_zero(&e, sizeof(e))) {
> +			dev_err(dev, "ran into an empty GPU OPP at index %u\n",
> +				i);
> +			return -EINVAL;
> +		}
> +		mfg->gpu_opps[i].freq = e.freq_khz * 1000ULL;

mfg->gpu_opps[i].freq = e.freq_khz * HZ_PER_KHZ;

> +		mfg->gpu_opps[i].u_volt = e.voltage_core * 10;
> +		mfg->gpu_opps[i].level = i;
> +		if (i < mfg->variant->turbo_below)
> +			mfg->gpu_opps[i].turbo = true;
> +
> +		if (!last_freq || mfg->gpu_opps[i].freq != last_freq)
> +			mfg->num_unique_gpu_opps++;
> +
> +		last_freq = mfg->gpu_opps[i].freq;
> +	}
> +
> +	return 0;
> +}
> +
> +static const char *const mtk_mfg_mt8196_clk_names[] = {
> +	"core",
> +	"stack0",
> +	"stack1",
> +};
> +
> +static const char *const mtk_mfg_mt8196_regulators[] = {
> +	"core",
> +	"stack",
> +	"sram",
> +};
> +
> +static int mtk_mfg_mt8196_init(struct mtk_mfg *mfg)
> +{
> +	void __iomem *e2_base;
> +
> +	e2_base = devm_platform_ioremap_resource_byname(mfg->pdev, "hw-revision");
> +	if (IS_ERR(e2_base))
> +		return dev_err_probe(&mfg->pdev->dev, PTR_ERR(e2_base),
> +				     "Couldn't get hw-revision register\n");
> +
> +	if (readl(e2_base) == MFG_MT8196_E2_ID)
> +		mfg->ghpm_en_reg = RPC_DUMMY_REG_2;
> +	else
> +		mfg->ghpm_en_reg = RPC_GHPM_CFG0_CON;
> +
> +	return 0;
> +};
> +
> +static const struct mtk_mfg_variant mtk_mfg_mt8196_variant = {
> +	.clk_names = mtk_mfg_mt8196_clk_names,
> +	.num_clks = ARRAY_SIZE(mtk_mfg_mt8196_clk_names),
> +	.regulator_names = mtk_mfg_mt8196_regulators,
> +	.num_regulators = ARRAY_SIZE(mtk_mfg_mt8196_regulators),
> +	.turbo_below = 7,
> +	.init = mtk_mfg_mt8196_init,
> +};
> +
> +static void mtk_mfg_mbox_rx_callback(struct mbox_client *cl, void *mssg)
> +{
> +	struct mtk_mfg_mbox *mb = container_of(cl, struct mtk_mfg_mbox, cl);
> +
> +	if (mb->rx_data)
> +		mb->rx_data = memcpy(mb->rx_data, mssg, GPUEB_MBOX_MAX_RX_SIZE);
> +	complete(&mb->rx_done);
> +}
> +
> +static int mtk_mfg_attach_dev(struct generic_pm_domain *pd, struct device *dev)
> +{
> +	struct mtk_mfg *mfg = mtk_mfg_from_genpd(pd);
> +	struct dev_pm_opp_data *opps = mfg->gpu_opps;
> +	int i, ret;
> +
> +	for (i = mfg->num_opps - 1; i >= 0; i--) {
> +		if ((i == mfg->num_opps - 1) || (opps[i].freq != opps[i + 1].freq)) {

		/* Add a comment here, because you're using a trick, and it's not
		 * very fast to read, as in, if you skim through that, you're most
		 * probably losing the fact that the first OPP is always added
		 * regardless of anything.
		 */
		if ((i != mfg->num_opps - 1) || (opps[i].freq == opps[i + 1].freq))
			continue;

		/* Reduced indentation :-) */
		ret = dev_pm_opp_add_dynamic(.....) etc


> +			ret = dev_pm_opp_add_dynamic(dev, &opps[i]);
> +			if (ret) {
> +				dev_err(dev, "Failed to add OPP level %u from PD %s\n",
> +					opps[i].level, pd->name);
> +				dev_pm_opp_remove_all_dynamic(dev);
> +				return ret;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void mtk_mfg_detach_dev(struct generic_pm_domain *pd, struct device *dev)
> +{
> +	dev_pm_opp_remove_all_dynamic(dev);
> +}
> +
> +static int mtk_mfg_set_performance(struct generic_pm_domain *pd,
> +				   unsigned int state)
> +{
> +	struct mtk_mfg *mfg = mtk_mfg_from_genpd(pd);
> +
> +	/*
> +	 * Occasionally, we're asked to set OPPs when we're off. This will fail,

Occasionally, a request to set OPPs may come while the domain is off, and
that is expected to fail. When we fail, we return success, because ... well..

> +	 * so don't do it at all. We do foo != GENPD_STATE_ON instead of !foo
> +	 * as to not depend on the actual value of the enum.
> +	 */
> +	if (mfg->pd.status != GENPD_STATE_ON)
> +		return 0;

...because.. why?

Feels like there needs to be one more restriction - is there a specific pattern
in this? When the domain is OFF, is the OPPIDX always lower (low freq) compared
to the currently set one?

Think about the case in which the power domain is never enabled because of a bug
somewhere (api or driver) and the set_performance() call is supposed to not fail.

> +
> +	return mtk_mfg_set_oppidx(mfg, state);
> +}
> +
> +static int mtk_mfg_power_on(struct generic_pm_domain *pd)
> +{
> +	struct mtk_mfg *mfg = mtk_mfg_from_genpd(pd);
> +	int ret;
> +
> +	ret = regulator_bulk_enable(mfg->variant->num_regulators,
> +				    mfg->gpu_regs);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_prepare_enable(mfg->clk_eb);
> +	if (ret)
> +		goto err_disable_regulators;
> +
> +	ret = clk_bulk_prepare_enable(mfg->variant->num_clks, mfg->gpu_clks);
> +	if (ret)
> +		goto err_disable_eb_clk;
> +
> +	ret = mtk_mfg_eb_on(mfg);
> +	if (ret)
> +		goto err_disable_clks;
> +
> +	ret = mtk_mfg_power_control(mfg, true);
> +	if (ret)
> +		goto err_eb_off;
> +
> +	return 0;
> +
> +err_eb_off:
> +	mtk_mfg_eb_off(mfg);
> +err_disable_clks:
> +	clk_bulk_disable_unprepare(mfg->variant->num_clks, mfg->gpu_clks);
> +err_disable_eb_clk:
> +	clk_disable_unprepare(mfg->clk_eb);
> +err_disable_regulators:
> +	regulator_bulk_disable(mfg->variant->num_regulators, mfg->gpu_regs);
> +
> +	return ret;
> +}
> +
> +static int mtk_mfg_power_off(struct generic_pm_domain *pd)
> +{
> +	struct mtk_mfg *mfg = mtk_mfg_from_genpd(pd);
> +	struct device *dev = &mfg->pdev->dev;
> +	int ret;
> +
> +	ret = mtk_mfg_power_control(mfg, false);
> +	if (ret) {
> +		dev_err(dev, "power_control failed: %pe\n", ERR_PTR(ret));
> +		return ret;
> +	}
> +	ret = mtk_mfg_eb_off(mfg);
> +	if (ret) {
> +		dev_err(dev, "eb_off failed: %pe\n", ERR_PTR(ret));
> +		return ret;
> +	}
> +	mfg->last_opp = -1;
> +	clk_bulk_disable_unprepare(mfg->variant->num_clks, mfg->gpu_clks);
> +	clk_disable_unprepare(mfg->clk_eb);
> +	ret = regulator_bulk_disable(mfg->variant->num_regulators, mfg->gpu_regs);
	if (ret)
		return ret;

	return 0;

> +
> +	return ret;
> +}
> +
> +static int mtk_mfg_init_mbox(struct mtk_mfg *mfg)
> +{
> +	struct device *dev = &mfg->pdev->dev;
> +	struct mtk_mfg_mbox *gf;
> +	struct mtk_mfg_mbox *slp;
> +
> +	gf = devm_kzalloc(dev, sizeof(*gf), GFP_KERNEL);
> +	if (!gf)
> +		return -ENOMEM;
> +
> +	slp = devm_kzalloc(dev, sizeof(*slp), GFP_KERNEL);
> +	if (!slp)
> +		return -ENOMEM;
> +
> +	gf->mfg = mfg;
> +	init_completion(&gf->rx_done);
> +	gf->cl.dev = dev;
> +	gf->cl.rx_callback = mtk_mfg_mbox_rx_callback;
> +	gf->cl.tx_tout = GPUEB_TIMEOUT_US / USEC_PER_MSEC;
> +	gf->rx_data = devm_kzalloc(dev, GPUEB_MBOX_MAX_RX_SIZE, GFP_KERNEL);
> +	if (!gf->rx_data)
> +		return -ENOMEM;
> +	gf->ch = mbox_request_channel_byname(&gf->cl, "gpufreq");
> +	if (IS_ERR(gf->ch))
> +		return PTR_ERR(gf->ch);
> +
> +	mfg->gf_mbox = gf;
> +
> +	slp->mfg = mfg;
> +	init_completion(&slp->rx_done);
> +	slp->cl.dev = dev;
> +	slp->cl.tx_tout = GPUEB_TIMEOUT_US / USEC_PER_MSEC;
> +	slp->cl.tx_block = true;
> +	slp->ch = mbox_request_channel_byname(&slp->cl, "sleep");
> +	if (IS_ERR(slp->ch))
> +		return PTR_ERR(slp->ch);
> +
> +	mfg->slp_mbox = slp;
> +
> +	return 0;
> +}
> +
> +static int mtk_mfg_init_clk_provider(struct mtk_mfg *mfg)
> +{
> +	struct device *dev = &mfg->pdev->dev;
> +	struct clk_hw_onecell_data *clk_data;
> +	int ret;
> +
> +	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, 2), GFP_KERNEL);
> +	if (!clk_data)
> +		return -ENOMEM;
> +
> +	clk_data->num = 2;
> +
> +	mfg->clk_core_hw.init = &mtk_mfg_clk_gpu_init;
> +	mfg->clk_stack_hw.init = &mtk_mfg_clk_stack_init;
> +
> +	ret = devm_clk_hw_register(dev, &mfg->clk_core_hw);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Couldn't register GPU core clock\n");
> +
> +	ret = devm_clk_hw_register(dev, &mfg->clk_stack_hw);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Couldn't register GPU stack clock\n");
> +
> +	clk_data->hws[0] = &mfg->clk_core_hw;
> +	clk_data->hws[1] = &mfg->clk_stack_hw;
> +
> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Couldn't register clock provider\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id mtk_mfg_of_match[] = {
> +	{ .compatible = "mediatek,mt8196-gpufreq", .data = &mtk_mfg_mt8196_variant },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, mtk_mfg_of_match);

Please move the of_device_id array after the probe function.

> +
> +static int mtk_mfg_probe(struct platform_device *pdev)
> +{
> +	struct device_node *shmem __free(device_node);
> +	struct mtk_mfg *mfg;
> +	struct device *dev = &pdev->dev;
> +	const struct mtk_mfg_variant *data = of_device_get_match_data(dev);
> +	struct resource res;
> +	int ret, i;
> +
> +	mfg = devm_kzalloc(dev, sizeof(*mfg), GFP_KERNEL);
> +	if (!mfg)
> +		return -ENOMEM;
> +
> +	mfg->pdev = pdev;
> +	mfg->variant = data;
> +
> +	dev_set_drvdata(dev, mfg);
> +
> +	mfg->gpr = devm_platform_ioremap_resource_byname(pdev, "gpr");

Just do it by index please. You can enforce the mmio index with the bindings.

> +	if (IS_ERR(mfg->gpr))
> +		return dev_err_probe(dev, PTR_ERR(mfg->gpr),
> +				     "Could not retrieve GPR MMIO registers\n");
> +
> +	mfg->rpc = devm_platform_ioremap_resource_byname(pdev, "rpc");
> +	if (IS_ERR(mfg->rpc))
> +		return dev_err_probe(dev, PTR_ERR(mfg->rpc),
> +				     "Could not retrieve RPC MMIO registers\n");
> +
> +	mfg->clk_eb = devm_clk_get(dev, "eb");

> +	if (IS_ERR(mfg->clk_eb))
> +		return dev_err_probe(dev, PTR_ERR(mfg->clk_eb),
> +				     "Could not get 'eb' clock\n");
> +
> +	mfg->gpu_clks = devm_kcalloc(dev, data->num_clks, sizeof(*mfg->gpu_clks),
> +				     GFP_KERNEL);
> +	if (!mfg->gpu_clks)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < data->num_clks; i++)
> +		mfg->gpu_clks[i].id = data->clk_names[i];
> +
> +	ret = devm_clk_bulk_get(dev, data->num_clks, mfg->gpu_clks);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "couldn't get GPU clocks\n");
> +
> +	mfg->gpu_regs = devm_kcalloc(dev, data->num_regulators,
> +				     sizeof(*mfg->gpu_regs), GFP_KERNEL);
> +	if (!mfg->gpu_regs)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < data->num_regulators; i++)
> +		mfg->gpu_regs[i].supply = data->regulator_names[i];
> +
> +	ret = devm_regulator_bulk_get(dev, data->num_regulators, mfg->gpu_regs);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "couldn't get GPU regulators\n");
> +
> +	shmem = of_parse_phandle(dev->of_node, "shmem", 0);
> +	if (!shmem)
> +		return dev_err_probe(dev, -ENODEV, "Could not get 'shmem'\n");

I'm not sure, but a doubt just came to my mind.

See the following coreboot table:

  0. 0000000000100000-0000000000106fff: RAMSTAGE
  1. 0000000000108000-000000000010bfff: RAMSTAGE
  2. 0000000080000000-00000000800fffff: RAM
  3. 0000000080100000-0000000080443fff: RAMSTAGE
  4. 0000000080444000-00000000804fffff: RAM
  5. 0000000080500000-00000000854fffff: RESERVED
  6. 0000000085500000-00000000945fffff: RAM
  7. 0000000094600000-00000000947fffff: BL31
  8. 0000000094800000-000000009fffffff: RAM
  9. 00000000a0000000-00000000a01fffff: RESERVED
10. 00000000a0200000-00000000ffec2fff: RAM
11. 00000000ffec3000-00000000ffffffff: CONFIGURATION TABLES
12. 0000000100000000-000000047fffffff: RAM

...and see the following information:

sync rank num:2, rank0_size:0x200000000, rank1_size:0x200000000

[INFO ]  Mapping address range [0x80000000:0x480000000) as     cacheable | 
read-write | non-secure | normal
[INFO ]  Mapping address range [0x80000000:0x80100000) as non-cacheable | 
read-write | non-secure | normal
[DEBUG]  Backing address range [0x80000000:0xc0000000) with new page table @0x00104000
[DEBUG]  Backing address range [0x80000000:0x80200000) with new page table @0x00105000


This means that the GPUEB memory, which is at 0xa0000000 and is 0x200000 long
is indeed placed in RAM.

At this point, I think it'd be best if you use reserved-memory instead, as that
is not SRAM, but really a (system) DRAM carveout that is reserved to the EB
firmware. That would give a correct representation of this memory in devicetree.

Cool thing is, that would also make the code shorter in this case as the calls
to of_parse_phandle() -> of_address_to_resource() would become simply

ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);

and instead of having a "shmem" property, you'd have the standard "memory-region"
one, which then fits perfectly.
> +
> +	ret = of_address_to_resource(shmem, 0, &res);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to get GPUEB shared memory\n");
> +
> +	mfg->sram = devm_ioremap(dev, res.start, resource_size(&res));
> +	if (!mfg->sram)
> +		return dev_err_probe(dev, -EADDRNOTAVAIL,
> +				     "failed to ioremap GPUEB sram\n");
> +	mfg->sram_size = resource_size(&res);
> +	mfg->sram_phys = res.start;
> +
> +	if (data->init) {
> +		ret = data->init(mfg);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Variant init failed\n");
> +	}
> +
> +	mfg->pd.name = dev_name(dev);
> +	mfg->pd.attach_dev = mtk_mfg_attach_dev;
> +	mfg->pd.detach_dev = mtk_mfg_detach_dev;
> +	mfg->pd.power_off = mtk_mfg_power_off;
> +	mfg->pd.power_on = mtk_mfg_power_on;
> +	mfg->pd.set_performance_state = mtk_mfg_set_performance;
> +	mfg->pd.flags = GENPD_FLAG_OPP_TABLE_FW;
> +	pm_genpd_init(&mfg->pd, NULL, false);

The pm_genpd_init() function may fail. Error check please.

> +
> +	ret = clk_prepare_enable(mfg->clk_eb);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to turn on EB clock\n");

What happens if the `gpu_regs` regulator(s) is/are not enabled at boot?

I am guessing that the EB doesn't depend at all on these being enabled, as it
should be powered by the internal vscp or sspm - but still asking to make sure
that this wasn't an overlook.

> +	mfg->ipi_magic = readl(mfg->gpr + GPR_IPI_MAGIC);
> +	/* Downstream does this, don't know why. */

Preventing reinitialization?
Did you try to avoid that write? What happens in that case?

Also, if you unload this module and reload it, are you able to reinitialize the EB,
or are you reading zero in GPR_IPI_MAGIC (preventing you from correctly reinit this
driver again)?

> +	writel(0x0, mfg->gpr + GPR_IPI_MAGIC);
> +
> +	ret = mtk_mfg_init_mbox(mfg);
> +	if (ret) {
> +		ret = dev_err_probe(dev, ret, "Couldn't initialise mailbox\n");
> +		goto out;
> +	}
> +
> +	mfg->last_opp = -1;
> +
> +	ret = mtk_mfg_power_on(&mfg->pd);
> +	clk_disable_unprepare(mfg->clk_eb);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to power on MFG\n");
> +
> +	ret = mtk_mfg_init_shared_mem(mfg);
> +	if (ret) {
> +		dev_err(dev, "Couldn't initialize EB SRAM: %pe\n", ERR_PTR(ret));
> +		goto out;
> +	}
> +
> +	ret = mtk_mfg_read_opp_tables(mfg);
> +	if (ret) {
> +		dev_err(dev, "Error reading OPP tables from EB: %pe\n",
> +			ERR_PTR(ret));
> +		goto out;
> +	}
> +
> +	ret = mtk_mfg_init_clk_provider(mfg);
> +	if (ret)
> +		goto out;
> +
> +	ret = of_genpd_add_provider_simple(pdev->dev.of_node, &mfg->pd);
> +	if (ret) {
> +		ret = dev_err_probe(dev, ret, "Failed to add pmdomain provider\n");
> +		goto out;
> +	}
> +
> +	return 0;
> +
> +out:
> +	mtk_mfg_power_off(&mfg->pd);
> +	return ret;
> +}

static void mtk_mfg_remove(struct platform_device *pdev)
{
	struct mtk_mfg *mfg = dev_get_drvdata(&pdev->dev);

	of_genpd_del_provider(....)

	pm_genpd_remove(....)

	mtk_mfg_power_off(...)

	mbox_free_channel(mfg->gf_mbox->ch);
	mfg->gf_mbox->ch = NULL;

	mbox_free_channel(mfg->slp_mbox->ch);
	mfg->slp_mbox->ch = NULL;


}

> +
> +static struct platform_driver mtk_mfg_driver = {
> +	.driver = {
> +		.name = "mtk-mfg-pmdomain",
> +		.of_match_table = mtk_mfg_of_match,
> +	},
> +	.probe = mtk_mfg_probe,

	.remove = mtk_mfg_remove,

> +};
> +module_platform_driver(mtk_mfg_driver);
> +
> +MODULE_AUTHOR("Nicolas Frattaroli <nicolas.frattaroli@collabora.com>");
> +MODULE_DESCRIPTION("MediaTek MFlexGraphics Power Domain Driver");
> +MODULE_LICENSE("GPL");
> 

There might be more, but for now, I'm done with this review round :-)

Cheers,
Angelo

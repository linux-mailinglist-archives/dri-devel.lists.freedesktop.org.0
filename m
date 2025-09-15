Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D895B5763D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 12:28:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D3B10E3E9;
	Mon, 15 Sep 2025 10:28:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="X3iCwxJd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F85D10E3E6
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 10:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757932090;
 bh=N4QXkd6R5yTmUtteF0BYPurLsA2Ne3rOGf3Eo9uzVe8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=X3iCwxJdquTP1Zuw9PS57dPCzhQd5C2KG3gV/X3vSoIDldeSESQF+NKtsFBnXuMBE
 vTCttvCvbiNPJ8WZzsDn8oHe42dmyjmfk/OIXXOfx1ztBooHPgZWxMxoujprUAx+Uy
 x/hJOsPy3SLP2v0Nm1Kb2xlHtbNago+Yxggv69XoQ7tlA5FovwP1XaXalLnR+/vew5
 TD2AVLrp2uzXHsfYOjnU5FlpPre38laSBQtH/cC61CvXXC5WvldaocHofWumQekkco
 9sdUY4Q8aMSk6872Xe70gJ+2pZAjps0ACEEX3YgneXwZ9jfi2G4feti1emK6VGVS6K
 IFpnVyodlhasQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 932C217E0109;
 Mon, 15 Sep 2025 12:28:09 +0200 (CEST)
Message-ID: <ae482072-c13f-4cb4-be26-50592b086fe6@collabora.com>
Date: Mon, 15 Sep 2025 12:28:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/10] drm/panthor: add support for MediaTek
 MFlexGraphics
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20250912-mt8196-gpufreq-v2-0-779a8a3729d9@collabora.com>
 <20250912-mt8196-gpufreq-v2-10-779a8a3729d9@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250912-mt8196-gpufreq-v2-10-779a8a3729d9@collabora.com>
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

Il 12/09/25 20:37, Nicolas Frattaroli ha scritto:
> MediaTek uses some glue logic to control frequency and power on some of
> their GPUs. This is best exposed as a devfreq driver, as it saves us
> from having to hardcode OPPs into the device tree, and can be extended
> with additional devfreq-y logic like more clever governors that use the
> hardware's GPUEB MCU to set frame time targets and power limits.
> 
> Add this driver to the panthor subdirectory. It needs to live here as it
> needs to call into panthor's devfreq layer, and panthor for its part
> also needs to call into this driver during probe to get a devfreq device
> registered. Solving the cyclical dependency by having mediatek_mfg live
> without knowledge of what a panthor is would require moving the devfreq
> provider stuff into a generic devfreq subsystem solution, which I didn't
> want to do.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>   drivers/gpu/drm/panthor/Kconfig        |   13 +
>   drivers/gpu/drm/panthor/Makefile       |    2 +
>   drivers/gpu/drm/panthor/mediatek_mfg.c | 1053 ++++++++++++++++++++++++++++++++
>   3 files changed, 1068 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/Kconfig b/drivers/gpu/drm/panthor/Kconfig
> index 55b40ad07f3b0779e0c434469ddc874ff74fde27..c4d2599c05df9e0e009b8e99b3d29c220269ca0d 100644
> --- a/drivers/gpu/drm/panthor/Kconfig
> +++ b/drivers/gpu/drm/panthor/Kconfig
> @@ -21,3 +21,16 @@ config DRM_PANTHOR
>   
>   	  Note that the Mali-G68 and Mali-G78, while Valhall architecture, will
>   	  be supported with the panfrost driver as they are not CSF GPUs.
> +
> +config DRM_PANTHOR_MEDIATEK_MFG
> +	tristate "MediaTek MFlexGraphics Extensions for Panthor"
> +	depends on (DRM_PANTHOR && ARCH_MEDIATEK) || COMPILE_TEST
> +	select DEVFREQ_GOV_SIMPLE_ONDEMAND
> +	select PM_DEVFREQ
> +	select MTK_GPUEB_MBOX
> +	help
> +	  Support for power and clock control in Panthor for MediaTek
> +	  MFlexGraphics devices, such as the GPU on the MT8196 or MT6991 SoCs.
> +
> +	  These extensions are required for the GPU to work on these platforms,
> +	  as they control the glue logic that powers on the GPU.
> diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
> index 02db21748c125688d2ef20ed254b5ebd7ff642e4..e0ebfdfb20bd78e0003c860c86c040746248fb89 100644
> --- a/drivers/gpu/drm/panthor/Makefile
> +++ b/drivers/gpu/drm/panthor/Makefile
> @@ -12,4 +12,6 @@ panthor-y := \
>   	panthor_mmu.o \
>   	panthor_sched.o
>   
> +obj-$(CONFIG_DRM_PANTHOR_MEDIATEK_MFG) += mediatek_mfg.o
> +
>   obj-$(CONFIG_DRM_PANTHOR) += panthor.o
> diff --git a/drivers/gpu/drm/panthor/mediatek_mfg.c b/drivers/gpu/drm/panthor/mediatek_mfg.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..e06a1d5d8cbf81ac276b521df4b04c81b4c75f0b
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/mediatek_mfg.c
> @@ -0,0 +1,1053 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Driver for MediaTek MFlexGraphics Devices
> + *
> + * Copyright (C) 2025, Collabora Ltd.
> + */
> +
> +#include <linux/atomic.h>
> +#include <linux/completion.h>
> +#include <linux/clk.h>
> +#include <linux/container_of.h>
> +#include <linux/devfreq.h>
> +#include <linux/iopoll.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_opp.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <drm/drm_managed.h>
> +
> +#include "panthor_devfreq.h"
> +#include "panthor_device.h"

..snip..

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
> +	__le32 padding_lol;

__le32 reserved; <- looks way better.

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
> +	struct platform_device *pdev;
> +	struct panthor_device *ptdev;
> +	struct clk *clk_eb;
> +	struct clk_bulk_data *gpu_clks;
> +	struct regulator_bulk_data *gpu_regs;
> +	void __iomem *rpc;
> +	void __iomem *gpr;
> +	void __iomem *sram;
> +	phys_addr_t sram_phys;
> +	unsigned int sram_size;
> +	unsigned int ghpm_en_reg;
> +	u32 ipi_magic;
> +	unsigned int num_opps;
> +	unsigned int num_unique_gpu_opps;
> +	struct dev_pm_opp_data *gpu_opps;
> +	struct dev_pm_opp_data *stack_opps;
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
> +	int (*init)(struct mtk_mfg *mfg);
> +};
> +
> +static inline void mtk_mfg_update_reg_bits(void __iomem *addr, u32 mask, u32 val)
> +{
> +	writel((readl(addr) & ~mask) | (val & mask), addr);
> +}
> +
> +static inline unsigned long mtk_mfg_read_gpu_freq(struct mtk_mfg *mfg)
> +{
> +	return readl(mfg->sram + GF_REG_FREQ_CUR_GPU) * 1000UL;
> +}
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

I wonder if you can check how much time does the GPUEB really take to poweron,
just so that we might be able to reduce delay_us here.

> +	if (ret) {
> +		dev_err(dev, "timed out waiting for EB power ack, val = 0x%X\n",
> +			val);
> +		return ret;
> +	}
> +
> +	ret = readl_poll_timeout(mfg->gpr + GPR_LP_STATE, val,
> +				 (val == EB_ON_RESUME),
> +				 GPUEB_POLL_US, GPUEB_TIMEOUT_US);

Same here - and I think this one is more critical, as I can see this suspend/resume
control being used more extensively in the future.

Specifically, I'm wondering if we could add runtime PM ops that will request EB
suspend/resume - and also if doing so would make any sense.

I am guessing that the "suspend" LP_STATE stops the internal state machine, making
the EB MCU to either go in a low-power state or to anyway lower its power usage by
at least suspending the iterations.

Of course - here I mean that we could have
1. System suspend ops that powers off the EB completely like you're doing here and
2. Runtime PM op that may be called (very) aggressively

...this would obviously not be feasible if the EB suspend/resume (without complete
poweron/off) takes too much time to actually happen.

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

struct device *dev = &mfg->pdev->dev;

> +	struct mtk_mfg_ipi_sleep_msg msg = {
> +		.event = 0,
> +		.state = 0,
> +		.magic = GPUEB_SLEEP_MAGIC
> +	};
> +	u32 val;
> +	int ret;
> +
> +	ret = mbox_send_message(mfg->slp_mbox->ch, &msg);
> +	if (ret < 0) {
> +		dev_err(&mfg->pdev->dev, "failure in mbox comms: %pe\n",
> +			ERR_PTR(ret));

Not sure why you're not simply doing

dev_err(dev, "Cannot send sleep command: %d\n", ret);
return ret;

> +		return ret;
> +	}
> +
> +	ret = readl_poll_timeout(mfg->rpc + RPC_PWR_CON, val,
> +				 !(val & PWR_ACK_M), GPUEB_POLL_US,
> +				 GPUEB_TIMEOUT_US);
> +
> +	if (ret) {
> +		dev_err(&mfg->pdev->dev,
> +			"timed out waiting for EB to power off, val=0x%08X\n",
> +			val);
> +	}
> +
> +	return ret;
> +}
> +
> +static int mtk_mfg_send_ipi(struct mtk_mfg *mfg, struct mtk_mfg_ipi_msg *msg)
> +{
> +	int ret;
> +
> +	msg->magic = mfg->ipi_magic;
> +
> +	ret = mbox_send_message(mfg->gf_mbox->ch, msg);
> +	if (ret < 0) {
> +		dev_err(&mfg->pdev->dev, "error from mailbox subsystem: %pe\n",
> +			ERR_PTR(ret));
> +		return ret;
> +	}
> +
> +	wait_for_completion(&mfg->gf_mbox->rx_done);
> +
> +	memcpy(msg, mfg->gf_mbox->rx_data, sizeof(*msg));
> +
> +	if (msg->u.return_value < 0) {
> +		dev_err(&mfg->pdev->dev, "IPI return: %d\n",
> +			msg->u.return_value);
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
> +	dev_info(dev, "clearing GPUEB sram, 0x%X bytes\n", mfg->sram_size);

Is this message really giving all that great information?
I'd go for dev_dbg() for both of the info msgs in this function.

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
> +	if (readl(mfg->sram) != 0xBABADADA) {

#define SOMETHING 0xBABADADA (call it however you want)

if (readl(mfg->sram) != SOMETHING) .....

> +		dev_err(dev, "EB did not initialise SRAM correctly\n");
> +		return -EIO;
> +	}
> +
> +	dev_info(dev, "initialised mem at phys 0x%016llX\n", mfg->sram_phys);

I don't like exposing addresses in kmsg. Please just don't.

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
> +static int mtk_mfg_set_oppidx(struct mtk_mfg *mfg, int opp_idx)
> +{
> +	struct mtk_mfg_ipi_msg msg = {};
> +	int ret;
> +
> +	if (!mfg->gpu_opps || !mfg->stack_opps)
> +		return 0;
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
> +	if (ret)
> +		return ret;
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
> +	if (mfg->num_opps != readl(mfg->sram + GF_REG_STK_OPP_NUM)) {
> +		dev_err(dev, "OPP count of GPU and Stack differ, %u vs. %u\n",
> +			mfg->num_opps, readl(mfg->sram + GF_REG_STK_OPP_NUM));
> +		return -EINVAL;
> +	}
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
> +	mfg->stack_opps = devm_kcalloc(dev, mfg->num_opps,
> +				       sizeof(struct dev_pm_opp_data), GFP_KERNEL);
> +	if (!mfg->stack_opps)
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
> +		mfg->gpu_opps[i].u_volt = e.voltage_core * 10;
> +
> +		if (!last_freq || mfg->gpu_opps[i].freq != last_freq)
> +			mfg->num_unique_gpu_opps++;
> +
> +		last_freq = mfg->gpu_opps[i].freq;
> +	}
> +
> +	/* Why do I even bother? */

Cleanup this comment, or make it so that people can actually understand what you
mean without reading the whole file.

> +	for (i = 0; i < mfg->num_opps; i++) {
> +		memcpy_fromio(&e, mfg->sram + GF_REG_OPP_TABLE_STK + i * sizeof(e),
> +			      sizeof(e));
> +		if (mem_is_zero(&e, sizeof(e))) {
> +			dev_err(dev, "ran into an empty GPU OPP at index %u\n",
> +				i);
> +			return -EINVAL;
> +		}
> +		mfg->stack_opps[i].freq = e.freq_khz * 1000ULL;
> +		mfg->stack_opps[i].u_volt = e.voltage_core * 10;
> +	}
> +
> +	return 0;
> +}
> +
> +static inline bool mtk_mfg_opp_idx_match(struct mtk_mfg *mfg, int idx,
> +					 unsigned long rate)
> +{
> +	if ((idx == mfg->num_opps - 1) && mfg->gpu_opps[idx].freq >= rate)
> +		return true;
> +
> +	if (mfg->gpu_opps[idx].freq >= rate && mfg->gpu_opps[idx + 1].freq < rate)
> +		return true;
> +
> +	return false;
> +}
> +
> +/**
> + * mtk_mfg_get_closest_opp_idx - find OPP index for desired GPU frequency
> + * @mfg: pointer to a &struct mtk_mfg driver instance
> + * @gpu_rate: desired rate of the GPU core in Hz
> + *
> + * Given a desired target frequency for the GPU core, find the index of a
> + * matching OPP, or the next higher OPP if no exact match is found, or the
> + * maximum OPP for frequencies exceeding the maximum OPP's frequency.
> + *
> + * For duplicate OPP entries, chooses the highest OPP index, as in, the one
> + * closest to the next lower frequency OPP.
> + *
> + * Returns -EINVAL on error, or the OPP index on success.
> + */
> +static int mtk_mfg_get_closest_opp_idx(struct mtk_mfg *mfg, unsigned long gpu_rate)
> +{

int r = mfg->num_opps - 1;
int l = 0;
int m;

> +	int l = 0;
> +	int r = mfg->num_opps - 1;
> +	int m;
> +
> +	if (!mfg->gpu_opps)
> +		return -EINVAL;
> +
> +	if (mfg->gpu_opps[0].freq <= gpu_rate)
> +		return 0;
> +
> +	while (l <= r) {
> +		m = l + (r - l) / 2;
> +		if (mtk_mfg_opp_idx_match(mfg, m, gpu_rate)) {
> +			return m;

If the above is returning, you don't need an else, do you.

if (mtk_mfg_opp_idx_match(..))
	return m;

if (mfg->gpu_opps[m].freq >= gpu_rate)
	l = ++m;
else
	r = --m;

(or m + 1 and m - 1 are also fine, I don't really care how that's written)


> +		} else if (mfg->gpu_opps[m].freq >= gpu_rate) /* >= for dupes */
> +			l = m + 1;
> +		else
> +			r = m - 1;
> +	}
> +
> +	return -EINVAL;
> +}
> +

Cheers,
Angelo

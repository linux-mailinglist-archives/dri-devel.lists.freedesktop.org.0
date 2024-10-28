Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 932149B2F6B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 12:56:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C71710E48A;
	Mon, 28 Oct 2024 11:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wxuxphu7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3697510E48A
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 11:56:55 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2fb5111747cso37470691fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 04:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730116613; x=1730721413; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tvMWFrVKS/K8J9alstqeHSdcE+paAJrvIm24J/o/2Ek=;
 b=wxuxphu7WEAs82bkWUUVqUbPYzDL412cMDV3PvbnjAmddE0X90ofIZiXQTO026aJlJ
 rXTpKGS4Y1+6vnwa/56jPbi1Rym/EvrtT4wmMRMKeggMBXmqzZVyEPE3z38yW2kxyG8i
 jnm2cegesHdPaVU9UEuoF4nt/WyeakDAU6W+zyw0cyYx8xvOVka7XBAz2WuvciNAkX7F
 Y+ihVA7rHHrZBcfLBUbmbuBkmdX/LKYZ1LhDyO380EVpiT3zBgX9aQaChT3/uxAaIUVK
 2ai4VtUf9V7PjanqZfsTEaFe5RKs2wMHFFDA2PiUF+zzowCs+leJWzxwqEIt2qT7I0bH
 xlzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730116613; x=1730721413;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tvMWFrVKS/K8J9alstqeHSdcE+paAJrvIm24J/o/2Ek=;
 b=ml+ecReSI28KuWZgMU4zaPuTGM6IIHIQgGjcFarsujCUn75iZzoPDxVyFf9bzRTald
 rmcOsAQFkF4EN04UDQwQVWe8AXbR5Yi6sDzTVbNPZOvUE/Tpu7hlNE5N9FwkfWjuXA5J
 OlFWZ3UVE+KiGODbWxnrrT9KvSLFXwKbmt8u+xgxqmnJeAnsPj1m/nOo6ZJGMdf8OvJU
 PBYoVgVmeeU9jzhMmfz2WFotcLSQcSk5Km+vOBMgzk0DQLbpYlH+ZxUpq8IqqkwFW668
 BPPgsGqt9YE8kTGEUxTLsQRi16lAkF6vLe4jXm40npIem8ZJGOBGaGqhB24BIXJUiXPI
 c59g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWb3zQ+dlwXfMFdbavzqMd/ZSoSb/9DGvomumdnaoRQgNu+HPGrccQy1tI52PY05gO02BV8W0w0oCs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTMcV4sQKuX19XsZ3/TFt1Jsf0ZBuw4h6O7mgqvk/YFRrwKVWo
 3szMIlCTCOLi46EbodWrOdMMYZGvyEq6AYu/TXsj+YO/x9xDfR/+frn5SwXzn38=
X-Google-Smtp-Source: AGHT+IFJDp2snJD+pK85necN51JB9gPyDhEQ+Om3K9zwrZmg1cxbCvahYrcBmI7lf2t/08DwRF7c/g==
X-Received: by 2002:a2e:e11:0:b0:2fb:4bee:47ec with SMTP id
 38308e7fff4ca-2fcbe066b71mr25303451fa.33.1730116613056; 
 Mon, 28 Oct 2024 04:56:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fcb4507c44sm11541851fa.19.2024.10.28.04.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 04:56:51 -0700 (PDT)
Date: Mon, 28 Oct 2024 13:56:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 drm-dp 1/4] drm/hisilicon/hibmc: add dp aux in hibmc
Message-ID: <wu2kwdqce7jovidzxhublmpgdhzq4uby65quo7ks44tfjhtgd2@qtfogva3exyg>
References: <20241022124148.1952761-1-shiyongbang@huawei.com>
 <20241022124148.1952761-2-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022124148.1952761-2-shiyongbang@huawei.com>
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

On Tue, Oct 22, 2024 at 08:41:45PM +0800, Yongbang Shi wrote:
> From: baihan li <libaihan@huawei.com>
> 
> Add dp aux read/write functions. They are basic functions
> and will be used later.
> 
> Signed-off-by: baihan li <libaihan@huawei.com>
> ---
> ChangeLog:
> v1 -> v2:
>   - using drm_dp_aux frame implement dp aux read and write functions, suggested by Jani Nikula.
>   - using drm dp header files' dp macros instead, suggested by Andy Yan.
>   v1:https://lore.kernel.org/all/20240930100610.782363-1-shiyongbang@huawei.com/
> ---
>  drivers/gpu/drm/hisilicon/hibmc/Makefile     |   3 +-
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c  | 162 +++++++++++++++++++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.h  |  31 ++++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h |  74 +++++++++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h  |  76 +++++++++
>  5 files changed, 345 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
>  create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.h
>  create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
>  create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/Makefile b/drivers/gpu/drm/hisilicon/hibmc/Makefile
> index d25c75e60d3d..8770ec6dfffd 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/Makefile
> +++ b/drivers/gpu/drm/hisilicon/hibmc/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -hibmc-drm-y := hibmc_drm_drv.o hibmc_drm_de.o hibmc_drm_vdac.o hibmc_drm_i2c.o
> +hibmc-drm-y := hibmc_drm_drv.o hibmc_drm_de.o hibmc_drm_vdac.o hibmc_drm_i2c.o \
> +	       dp/dp_aux.o
>  
>  obj-$(CONFIG_DRM_HISI_HIBMC) += hibmc-drm.o
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
> new file mode 100644
> index 000000000000..0078cafdf86d
> --- /dev/null
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
> @@ -0,0 +1,162 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright (c) 2024 Hisilicon Limited.
> +
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/minmax.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_print.h>
> +#include "dp_comm.h"
> +#include "dp_reg.h"
> +#include "dp_aux.h"
> +
> +#define DP_MIN_PULSE_NUM 0x9
> +
> +static void dp_aux_reset(const struct dp_dev *dp)
> +{
> +	dp_write_bits(dp->base + DP_DPTX_RST_CTRL, DP_CFG_AUX_RST_N, 0x0);
> +	usleep_range(10, 15);
> +	dp_write_bits(dp->base + DP_DPTX_RST_CTRL, DP_CFG_AUX_RST_N, 0x1);
> +}
> +
> +static void dp_aux_read_data(struct dp_dev *dp, u8 *buf, u8 size)
> +{
> +	u32 reg_num;
> +	u32 value;
> +	u32 num;
> +	u8 i, j;
> +
> +	reg_num = round_up(size, AUX_4_BYTE) / AUX_4_BYTE;
> +	for (i = 0; i < reg_num; i++) {
> +		/* number of bytes read from a single register */
> +		num = min(size - i * AUX_4_BYTE, AUX_4_BYTE);
> +		value = readl(dp->base + DP_AUX_RD_DATA0 + i * AUX_4_BYTE);
> +		/* convert the 32-bit value of the register to the buffer. */
> +		for (j = 0; j < num; j++)
> +			buf[i * AUX_4_BYTE + j] = value >> (j * AUX_8_BIT);
> +	}
> +}
> +
> +static void dp_aux_write_data(struct dp_dev *dp, u8 *buf, u8 size)
> +{
> +	u32 reg_num;
> +	u32 value;
> +	u8 i, j;
> +	u32 num;
> +
> +	reg_num = round_up(size, AUX_4_BYTE) / AUX_4_BYTE;
> +	for (i = 0; i < reg_num; i++) {
> +		/* number of bytes written to a single register */
> +		num = min_t(u8, size - i * AUX_4_BYTE, AUX_4_BYTE);
> +		value = 0;
> +		/* obtain the 32-bit value written to a single register. */
> +		for (j = 0; j < num; j++)
> +			value |= buf[i * AUX_4_BYTE + j] << (j * AUX_8_BIT);
> +		/* writing data to a single register */
> +		writel(value, dp->base + DP_AUX_WR_DATA0 + i * AUX_4_BYTE);
> +	}
> +}
> +
> +static u32 dp_aux_build_cmd(const struct drm_dp_aux_msg *msg)
> +{
> +	u32 aux_cmd = msg->request;
> +
> +	if (msg->size)
> +		aux_cmd |= (msg->size - 1) << AUX_CMD_REQ_LEN_S;
> +	else
> +		aux_cmd |= 1 << AUX_CMD_I2C_ADDR_ONLY_S;
> +
> +	aux_cmd |= msg->address << AUX_CMD_ADDR_S;
> +
> +	return aux_cmd;
> +}
> +
> +/* ret >= 0 ,ret is size; ret < 0, ret is err code */
> +static int dp_aux_parse_xfer(struct dp_dev *dp, struct drm_dp_aux_msg *msg)
> +{
> +	u32 buf_data_cnt;
> +	u32 aux_status;
> +	int ret = 0;
> +
> +	aux_status = readl(dp->base + DP_AUX_STATUS);
> +	msg->reply = FIELD_GET(DP_CFG_AUX_STATUS, aux_status);
> +
> +	if (aux_status & DP_CFG_AUX_TIMEOUT)
> +		return -ETIMEDOUT;
> +
> +	/* only address */
> +	if (!msg->size)
> +		return 0;
> +
> +	if (msg->reply != DP_AUX_NATIVE_REPLY_ACK)
> +		return 0;
> +
> +	buf_data_cnt = FIELD_GET(DP_CFG_AUX_READY_DATA_BYTE, aux_status);
> +
> +	switch (msg->request) {
> +	case DP_AUX_NATIVE_WRITE:
> +		ret = msg->size;
> +		break;
> +	case DP_AUX_I2C_WRITE | DP_AUX_I2C_MOT:
> +		if (buf_data_cnt == AUX_I2C_WRITE_SUCCESS)
> +			ret = msg->size;
> +		else if (buf_data_cnt == AUX_I2C_WRITE_PARTIAL_SUCCESS)
> +			ret = FIELD_GET(DP_CFG_AUX, aux_status);
> +		break;
> +	case DP_AUX_NATIVE_READ:
> +	case DP_AUX_I2C_READ | DP_AUX_I2C_MOT:
> +		buf_data_cnt--;
> +		/* only the successful part of data is read */
> +		if (buf_data_cnt != msg->size) {
> +			ret = -EBUSY;
> +		} else { /* all data is successfully read */
> +			dp_aux_read_data(dp, msg->buffer, msg->size);
> +			ret = msg->size;
> +		}
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
> +/* ret >= 0 ,ret is size; ret < 0, ret is err code */
> +static ssize_t dp_aux_xfer(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
> +{
> +	struct dp_dev *dp = container_of(aux, struct dp_dev, aux);
> +	u32 aux_cmd;
> +	int ret;
> +	u32 val; /* val will be assigned at the beginning of readl_poll_timeout function */
> +
> +	writel(0, dp->base + DP_AUX_WR_DATA0);
> +	writel(0, dp->base + DP_AUX_WR_DATA1);
> +	writel(0, dp->base + DP_AUX_WR_DATA2);
> +	writel(0, dp->base + DP_AUX_WR_DATA3);
> +
> +	dp_aux_write_data(dp, msg->buffer, msg->size);
> +
> +	aux_cmd = dp_aux_build_cmd(msg);
> +	writel(aux_cmd, dp->base + DP_AUX_CMD_ADDR);
> +
> +	/* enable aux transfer */
> +	dp_write_bits(dp->base + DP_AUX_REQ, DP_CFG_AUX_REQ, 0x1);
> +	ret = readl_poll_timeout(dp->base + DP_AUX_REQ, val, !(val & DP_CFG_AUX_REQ), 50, 5000);
> +	if (ret) {
> +		dp_aux_reset(dp);
> +		return ret;
> +	}
> +
> +	return dp_aux_parse_xfer(dp, msg);
> +}
> +
> +void dp_aux_init(struct dp_dev *dp)
> +{
> +	dp_write_bits(dp->base + DP_AUX_REQ, DP_CFG_AUX_SYNC_LEN_SEL, 0x0);
> +	dp_write_bits(dp->base + DP_AUX_REQ, DP_CFG_AUX_TIMER_TIMEOUT, 0x1);
> +	dp_write_bits(dp->base + DP_AUX_REQ, DP_CFG_AUX_MIN_PULSE_NUM, DP_MIN_PULSE_NUM);
> +
> +	dp->aux.transfer = dp_aux_xfer;
> +	dp->aux.is_remote = 0;
> +	drm_dp_aux_init(&dp->aux);
> +}
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.h
> new file mode 100644
> index 000000000000..6f95a3750d60
> --- /dev/null
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/* Copyright (c) 2024 Hisilicon Limited. */
> +
> +#ifndef DP_AUX_H
> +#define DP_AUX_H
> +
> +#include <linux/bitops.h>
> +#include "dp_comm.h"
> +
> +#define AUX_I2C_WRITE_SUCCESS		0x1
> +#define AUX_I2C_WRITE_PARTIAL_SUCCESS	0x2
> +
> +#define EQ_MAX_RETRY			5

unused

> +
> +#define DP_CFG_AUX_S			17
> +#define DP_CFG_AUX_STATUS_S		4

Both are unused

> +
> +#define AUX_4_BYTE			4
> +#define AUX_4_BIT			4
> +#define AUX_8_BIT			8

AUX_4_BIT is unused. For other defines I think it's better to provide
sensible names. BITS_IN_U32, BYTES_IN_U32

> +
> +#define AUX_READY_DATA_BYTE_S		12

unused

> +
> +/* aux_cmd_addr register shift */
> +#define AUX_CMD_REQ_LEN_S		4
> +#define AUX_CMD_ADDR_S			8
> +#define AUX_CMD_I2C_ADDR_ONLY_S		28

Please use FIELD_PREP instead of definig shifts (and shift is usally
_SHIFT, not _S)

> +
> +void dp_aux_init(struct dp_dev *dp);
> +
> +#endif
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
> new file mode 100644
> index 000000000000..26d97929dc06
> --- /dev/null
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
> @@ -0,0 +1,74 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/* Copyright (c) 2024 Hisilicon Limited. */
> +
> +#ifndef DP_COMM_H
> +#define DP_COMM_H
> +
> +#include <linux/types.h>
> +#include <linux/bitops.h>
> +#include <linux/errno.h>
> +#include <linux/mutex.h>
> +#include <linux/kernel.h>
> +#include <linux/bitfield.h>
> +#include <linux/io.h>
> +
> +#include <drm/display/drm_dp_helper.h>
> +
> +#define REG_LENGTH 32
> +
> +static inline u32 dp_read_bits(void __iomem *addr, u32 bit_mask)
> +{
> +	u32 reg_val;
> +
> +	reg_val = readl(addr);
> +
> +	return (reg_val & bit_mask) >> __ffs(bit_mask);

FIELD_GET

> +}
> +
> +static inline void dp_write_bits(void __iomem *addr, u32 bit_mask, u32 val)
> +{
> +	u32 reg_val;
> +
> +	reg_val = readl(addr);
> +	reg_val &= ~bit_mask;
> +	reg_val |= (val << __ffs(bit_mask)) & bit_mask;

FIELD_PREP

> +	writel(reg_val, addr);

How is this protected from concurrent RMW cycles?

> +}
> +
> +enum dpcd_revision {
> +	DPCD_REVISION_10 = 0x10,
> +	DPCD_REVISION_11,
> +	DPCD_REVISION_12,
> +	DPCD_REVISION_13,
> +	DPCD_REVISION_14,

Any reason for ignoring defines in drm_dp.h?

> +};
> +
> +struct link_status {
> +	bool clock_recovered;
> +	bool channel_equalized;
> +	u8 cr_done_lanes;
> +};
> +
> +struct link_cap {
> +	enum dpcd_revision rx_dpcd_revision;
> +	u8 link_rate;
> +	u8 lanes;
> +	bool is_tps3;
> +	bool is_tps4;
> +};
> +
> +struct hibmc_dp_link {
> +	struct link_status status;
> +	u8 *train_set;
> +	struct link_cap cap;
> +};
> +
> +struct dp_dev {
> +	struct hibmc_dp_link link;
> +	struct drm_dp_aux aux;
> +	struct drm_device *dev;
> +	void __iomem *base;
> +	u8 dpcd[DP_RECEIVER_CAP_SIZE];
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
> new file mode 100644
> index 000000000000..3dcb847057a4
> --- /dev/null
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
> @@ -0,0 +1,76 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/* Copyright (c) 2024 Hisilicon Limited. */
> +
> +#ifndef DP_REG_H
> +#define DP_REG_H
> +
> +#define DP_AUX_CMD_ADDR			0x50
> +#define DP_AUX_WR_DATA0			0x54
> +#define DP_AUX_WR_DATA1			0x58
> +#define DP_AUX_WR_DATA2			0x5c
> +#define DP_AUX_WR_DATA3			0x60
> +#define DP_AUX_RD_DATA0			0x64
> +#define DP_AUX_REQ			0x74
> +#define DP_AUX_STATUS			0x78
> +#define DP_PHYIF_CTRL0			0xa0
> +#define DP_VIDEO_CTRL			0x100
> +#define DP_VIDEO_CONFIG0		0x104
> +#define DP_VIDEO_CONFIG1		0x108
> +#define DP_VIDEO_CONFIG2		0x10c
> +#define DP_VIDEO_CONFIG3		0x110
> +#define DP_VIDEO_PACKET			0x114
> +#define DP_VIDEO_MSA0			0x118
> +#define DP_VIDEO_MSA1			0x11c
> +#define DP_VIDEO_MSA2			0x120
> +#define DP_VIDEO_HORIZONTAL_SIZE	0X124
> +#define DP_TIMING_GEN_CONFIG0		0x26c
> +#define DP_TIMING_GEN_CONFIG2		0x274
> +#define DP_TIMING_GEN_CONFIG3		0x278
> +#define DP_HDCP_CFG			0x600
> +#define DP_INTR_ENABLE			0x720
> +#define DP_INTR_ORIGINAL_STATUS		0x728
> +#define DP_DPTX_RST_CTRL		0x700
> +#define DP_DPTX_CLK_CTRL		0x704
> +#define DP_DPTX_GCTL0			0x708
> +#define DP_TIMING_MODEL_CTRL		0x884
> +#define DP_TIMING_SYNC_CTRL		0xFF0
> +
> +#define DP_CFG_AUX_SYNC_LEN_SEL			BIT(1)
> +#define DP_CFG_AUX_TIMER_TIMEOUT		BIT(2)
> +#define DP_CFG_STREAM_FRAME_MODE		BIT(6)
> +#define DP_CFG_AUX_MIN_PULSE_NUM		GENMASK(13, 9)
> +#define DP_CFG_LANE_DATA_EN			GENMASK(11, 8)
> +#define DP_CFG_PHY_LANE_NUM			GENMASK(2, 1)
> +#define DP_CFG_AUX_REQ				BIT(0)
> +#define DP_CFG_AUX_RST_N			BIT(4)
> +#define DP_CFG_AUX_TIMEOUT			BIT(0)
> +#define DP_CFG_AUX_READY_DATA_BYTE		GENMASK(16, 12)
> +#define DP_CFG_AUX				GENMASK(24, 17)
> +#define DP_CFG_AUX_STATUS			GENMASK(11, 4)
> +#define DP_CFG_SCRAMBLE_EN			BIT(0)
> +#define DP_CFG_PAT_SEL				GENMASK(7, 4)
> +#define DP_CFG_TIMING_GEN0_HACTIVE		GENMASK(31, 16)
> +#define DP_CFG_TIMING_GEN0_HBLANK		GENMASK(15, 0)
> +#define DP_CFG_TIMING_GEN0_VACTIVE		GENMASK(31, 16)
> +#define DP_CFG_TIMING_GEN0_VBLANK		GENMASK(15, 0)
> +#define DP_CFG_TIMING_GEN0_VFRONT_PORCH		GENMASK(31, 16)
> +#define DP_CFG_STREAM_HACTIVE			GENMASK(31, 16)
> +#define DP_CFG_STREAM_HBLANK			GENMASK(15, 0)
> +#define DP_CFG_STREAM_HSYNC_WIDTH		GENMASK(15, 0)
> +#define DP_CFG_STREAM_VACTIVE			GENMASK(31, 16)
> +#define DP_CFG_STREAM_VBLANK			GENMASK(15, 0)
> +#define DP_CFG_STREAM_VFRONT_PORCH		GENMASK(31, 16)
> +#define DP_CFG_STREAM_VSYNC_WIDTH		GENMASK(15, 0)
> +#define DP_CFG_STREAM_VSTART			GENMASK(31, 16)
> +#define DP_CFG_STREAM_HSTART			GENMASK(15, 0)
> +#define DP_CFG_STREAM_VSYNC_POLARITY		BIT(8)
> +#define DP_CFG_STREAM_HSYNC_POLARITY		BIT(7)
> +#define DP_CFG_STREAM_RGB_ENABLE		BIT(1)
> +#define DP_CFG_STREAM_VIDEO_MAPPING		GENMASK(5, 2)
> +#define DP_CFG_PIXEL_NUM_TIMING_MODE_SEL1	GENMASK(31, 16)
> +#define DP_CFG_STREAM_TU_SYMBOL_SIZE		GENMASK(5, 0)
> +#define DP_CFG_STREAM_TU_SYMBOL_FRAC_SIZE	GENMASK(9, 6)
> +#define DP_CFG_STREAM_HTOTAL_SIZE		GENMASK(31, 16)
> +#define DP_CFG_STREAM_HBLANK_SIZE		GENMASK(15, 0)
> +
> +#endif
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE6E50ACA5
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 02:10:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCCB510ED86;
	Fri, 22 Apr 2022 00:10:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 966D310EA3B
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 22:01:10 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id h3so6327337lfu.8
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 15:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stargateuniverse.net; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BHQrbaa/8Rjslj718qjz2Xo3aWzmg7iAozySdIlZ2dw=;
 b=ZG1ZNG6cZ93d2o/qZOHbKfiIDq15KyGGXMLjlNFCW/FaLpi3MAx+CTA70dTgZmX3Gw
 /96cGu69Q2Yy4OshFX5MVXZzu5psMTTeuuFVX2O7s48VU8IgvJMXVM/TUQIYs+lE43uV
 vVKes5uL6aS7bexMX7N/y3eHnatifOEICFi8MFT82W0l43QzGu8YZkK+lT/dfcw5HrHk
 EjSLtDQnSkoI/P/XY3OKQjuhUi50uFUfYLEqn+4jkVk1r8+gDC9GcIfxmaIqQOZvFfYf
 ut+Rg/Ga850owHoJMgkTssDy6qG2mlTATTwftnu5VPA+eOMNbzklA5qWelVrk83XafgG
 P1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BHQrbaa/8Rjslj718qjz2Xo3aWzmg7iAozySdIlZ2dw=;
 b=4ICnS90z2G5Tc77PZbhUvINqKtdtIIOR/xAEnMYM/LuQ1gwwMoV9c63OOBzTvq/hD0
 QLYSY6wUceqxn5Jf8hUK84WhUvQI0S370oovFeYmSXLn9XoUbawALDfM0NwQpMdyQsgg
 X6y5FzpXyRIYTzqzuWL+0tEP3yAXtNe1wsqYHbNBbHQSKw4IeZjG4MvdPUoLVzvTrZVs
 7/DX8Kff30Yg5eFuEnb0mXY0b0qGao2z4n8dp5qBpW0TZZg2X5hmN8wF3ZtHb1S8pbVY
 WUHenzxF7z+LUX5v/FoFeHnyeTfq6P+2NiIVGfUP4ROv8tygz4hyZMbSQ6qOM7775aEy
 9jxA==
X-Gm-Message-State: AOAM532rBGXu5Ia1ir4EPwn0sZTSMVY3g1vepp/U33rEgBWr9YJhRr/6
 xmgNSbLayGlh0lyLs/x4wA/S+A==
X-Google-Smtp-Source: ABdhPJyb/gL4JvmW7ap9rNCR69U0P4KSfeb85aDDFnlVBtrqLnvhEZw+k2HMP25FqH9QnhuApEo3wA==
X-Received: by 2002:ac2:47f1:0:b0:46d:1317:aa0d with SMTP id
 b17-20020ac247f1000000b0046d1317aa0dmr1035070lfp.164.1650578468663; 
 Thu, 21 Apr 2022 15:01:08 -0700 (PDT)
Received: from ?IPV6:2001:14ba:9cae:8c00:9682:e720:334f:2fac?
 (dxw3k4yf2tnxwyp6sg02y-3.rev.dnainternet.fi.
 [2001:14ba:9cae:8c00:9682:e720:334f:2fac])
 by smtp.gmail.com with ESMTPSA id
 bn38-20020a05651c17a600b0024b507c5cebsm11295ljb.126.2022.04.21.15.01.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 15:01:08 -0700 (PDT)
Message-ID: <0fa9ab41-c18e-a569-e6fe-a0e9d965905e@stargateuniverse.net>
Date: Fri, 22 Apr 2022 01:01:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/2] drm/nvdla: Add driver support for NVDLA
Content-Language: en-US
To: Cai Huoqing <cai.huoqing@linux.dev>
References: <20220419135908.39606-1-cai.huoqing@linux.dev>
 <20220419135908.39606-3-cai.huoqing@linux.dev>
From: Kari Argillander <kari.argillander@stargateuniverse.net>
In-Reply-To: <20220419135908.39606-3-cai.huoqing@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 22 Apr 2022 00:10:53 +0000
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is just quick look up. I basically check some style issues and did
some basic static analyzing.

I have run
  - cppcheck (which found couple mistakes)
  - flawfinder (did not found anything to my eyes)
  - codespell (did find couple typo)

You can run these yourself also or check below.

Couple common things which you can ignore or not	.
- Usually in this code there is goto exit and it is just return. Maybe
   use just return straight away. No need to jump.
- Some comments start capital others not. Maybe all should start
   capital. Very small nit, but makes nice touch to the code.
- Lot of oneline comments are unneccessary three line comments.

On 19.4.2022 16.59, Cai Huoqing wrote:
> The NVIDIA Deep Learning Accelerator (NVDLA) is an open source IP
> which is integrated into NVIDIA Jetson AGX Xavier,
> so add driver support for this accelerator.
> 
> Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>

... snip

> diff --git a/drivers/gpu/drm/nvdla/nvdla_bdma.c b/drivers/gpu/drm/nvdla/nvdla_bdma.c
> new file mode 100644
> index 000000000000..225613f27acf
> --- /dev/null
> +++ b/drivers/gpu/drm/nvdla/nvdla_bdma.c

... snip

> +static int32_t
> +processor_bdma_program_slot(struct dla_engine *engine,
> +							struct dla_bdma_surface_desc *bdma_surface,
> +							struct dla_bdma_transfer_desc *transfer)
> +{
> +	int32_t ret = 0;
> +	uint64_t source_addr = 0;
> +	uint64_t destination_addr = 0;
> +	uint32_t high, low, reg;
> +	uint8_t  bdma_free_slots = 0;
> +
> +	/* make sure there're enough free slots */
> +	if (bdma_free_slots <= 0) {

This is always true right now.

> +		do {
> +			reg = bdma_reg_read(engine, STATUS);
> +			reg = (reg & MASK(BDMA_STATUS_0, FREE_SLOT)) >>
> +					SHIFT(BDMA_STATUS_0, FREE_SLOT);
> +		} while (reg == 0);
> +		bdma_free_slots = (uint8_t)reg;
> +	}
> +
> +	dla_get_dma_address(engine->driver_context, engine->task->task_data,
> +						transfer->source_address,
> +						(void *)&source_addr,
> +						DESTINATION_DMA);
> +	dla_get_dma_address(engine->driver_context, engine->task->task_data,
> +						transfer->destination_address,
> +						(void *)&destination_addr,
> +						DESTINATION_DMA);
> +
> +	ASSERT_GOTO((transfer->line_repeat <= 8192),
> +				ret, -EINVAL, exit);
> +	ASSERT_GOTO((transfer->surface_repeat <= 8192),
> +				ret, -EINVAL, exit);
> +	ASSERT_GOTO((transfer->line_size % 32) == 0,
> +				ret, -EINVAL, exit);
> +	ASSERT_GOTO(transfer->source_line >= transfer->line_size,
> +				ret, -EINVAL, exit);
> +	ASSERT_GOTO(transfer->destination_line >= transfer->line_size,
> +				ret, -EINVAL, exit);
> +	ASSERT_GOTO(transfer->source_surface >=
> +			(transfer->source_line * transfer->line_repeat),
> +				ret, -EINVAL, exit);
> +	ASSERT_GOTO(transfer->destination_surface >=
> +			(transfer->destination_line * transfer->line_repeat),
> +				ret, -EINVAL, exit);
> +
> +	/* config registers */
> +	high = upper_32_bits(source_addr);
> +	low = lower_32_bits(source_addr);
> +	bdma_reg_write(engine, CFG_SRC_ADDR_LOW, low);
> +	bdma_reg_write(engine, CFG_SRC_ADDR_HIGH, high);
> +	high = upper_32_bits(destination_addr);
> +	low = lower_32_bits(destination_addr);
> +	bdma_reg_write(engine, CFG_DST_ADDR_LOW, low);
> +	bdma_reg_write(engine, CFG_DST_ADDR_HIGH, high);
> +	bdma_reg_write(engine, CFG_LINE, (transfer->line_size >> 5) - 1);
> +	reg = (map_mem[bdma_surface->source_type] <<
> +				SHIFT(BDMA_CFG_CMD_0, SRC_RAM_TYPE)) |
> +		(map_mem[bdma_surface->destination_type] <<
> +				SHIFT(BDMA_CFG_CMD_0, DST_RAM_TYPE));
> +	bdma_reg_write(engine, CFG_CMD, reg);
> +	bdma_reg_write(engine, CFG_LINE_REPEAT, transfer->line_repeat - 1);
> +	bdma_reg_write(engine, CFG_SRC_LINE, transfer->source_line);
> +	bdma_reg_write(engine, CFG_DST_LINE, transfer->destination_line);
> +	bdma_reg_write(engine, CFG_SURF_REPEAT, transfer->surface_repeat - 1);
> +	bdma_reg_write(engine, CFG_SRC_SURF, transfer->source_surface);
> +	bdma_reg_write(engine, CFG_DST_SURF, transfer->destination_surface);
> +	bdma_reg_write(engine, CFG_OP, FIELD_ENUM(BDMA_CFG_OP_0, EN, ENABLE));
> +
> +exit:
> +	return ret;
> +}

... snip

> diff --git a/drivers/gpu/drm/nvdla/nvdla_cache.c b/drivers/gpu/drm/nvdla/nvdla_cache.c
> new file mode 100644
> index 000000000000..f8bd7b514aab
> --- /dev/null
> +++ b/drivers/gpu/drm/nvdla/nvdla_cache.c
> @@ -0,0 +1,215 @@
> +// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0
> +/*
> + * Copyright (C) 2017-2018 NVIDIA CORPORATION
> + * Copyright (C) 2022 Cai Huoqing
> + */
> +
> +#include "nvdla_common.h"
> +#include "nvdla_drm.h"
> +#include "nvdla_reg.h"
> +#include "nvdla_engine.h"
> +
> +#define DLA_OP_CACHE_SIZE (DLA_NUM_GROUPS * ((DLA_OP_NUM + 2) * 2))
> +
> +static struct dla_common_op_desc desc_cache[DLA_OP_NUM][DLA_OP_CACHE_SIZE];
> +static int32_t desc_refcount[DLA_OP_NUM][DLA_OP_CACHE_SIZE];
> +
> +void
> +dla_get_refcount(struct dla_common_op_desc *op_desc)
> +{
> +	int32_t i;
> +	struct dla_common_op_desc *desc = NULL;
> +
> +	if (op_desc == NULL)
> +		return;
> +
> +	if (op_desc->index == -1)
> +		return;
> +
> +	desc = &desc_cache[op_desc->op_type][0];
> +
> +	for (i = 0; i < DLA_OP_CACHE_SIZE; i++, desc++) {
> +		if (desc->index == op_desc->index &&
> +				desc->roi_index == op_desc->roi_index) {

reverse if

		if (desc->index != op_desc->index)
			continue;
		if (desc->roi_index != op_desc->roi_index)
			continue;

> +			desc_refcount[op_desc->op_type][i]++;
> +			return;
> +		}
> +	}
> +}
> +
> +struct dla_common_op_desc *
> +dla_get_op_desc(struct dla_engine *engine,
> +				struct dla_task *task, int16_t index,
> +				uint8_t op_type, uint8_t roi_index)
> +{
> +	int32_t i;
> +	int32_t ret;
> +	uint64_t op_base;
> +	uint64_t dep_graph_addr;
> +	struct dla_common_op_desc *desc = NULL;
> +
> +	if (index == -1) {
> +		pr_debug("no desc get due to index==-1\n");
> +		goto exit;
> +	}
> +
> +	dep_graph_addr = (sizeof(struct dla_common_op_desc) *
> +				engine->network->num_operations * roi_index);
> +
> +	desc = &desc_cache[op_type][0];
> +
> +	for (i = 0; i < DLA_OP_CACHE_SIZE; i++, desc++) {
> +		if (desc->index == index && desc->roi_index == roi_index) {
> +			if (desc->op_type != op_type) {
> +				pr_err("op_cache[op=%u] contains incorrect entry of op[%u]\n",
> +					   op_type, desc->op_type);
> +				continue;
> +			}

reverse if so this will be pretty clean

		if (desc->index != index)
			continue;
		if (desc->roi_index != roi_index)
			continue;
		if (desc->op_type != op_type) {
			pr_err("op_cache[op=%u] contains incorrect entry of op[%u]\n",
					op_type, desc->op_type);
			continue;
		}


> +			desc_refcount[op_type][i]++;
> +			goto exit;
> +		}
> +	}
> +
> +	desc = &desc_cache[op_type][0];
> +
> +	for (i = 0; i < DLA_OP_CACHE_SIZE; i++, desc++) {
> +		if (desc->index == -1) {

reverse if
		if (desc->index != -1)
			continue;

> +			op_base = dep_graph_addr +
> +					(sizeof(struct dla_common_op_desc) *
> +					(uint64_t)index);
> +			ret = dla_data_read(engine->driver_context,
> +					task->task_data,
> +					task->dependency_graph_addr,
> +					(void *)(desc),
> +					sizeof(struct dla_common_op_desc),
> +					op_base);
> +			if (ret) {
> +				desc = NULL;
> +				goto exit;
> +			}
> +
> +			if (op_type != desc->op_type) {
> +				/*
> +				 * op_type of entry read from DRAM should not
> +				 * mismatch with given op_type. If they
> +				 * mismatches, then wrong entry is fetched, so
> +				 * report this issue by throwing error.
> +				 */
> +				pr_err("Fetched [op_type=%u] from DRAM doesn't match with op_type[%u]\n",
> +					   desc->op_type, op_type);
> +				desc->op_type = op_type;
> +				desc->index = -1;
> +				desc->roi_index = -1;
> +				desc = NULL;
> +				goto exit;
> +			}
> +
> +			desc->index = index;
> +			desc->roi_index = roi_index;
> +
> +			desc_refcount[op_type][i]++;
> +			goto exit;
> +		}
> +	}
> +
> +exit:
> +	return desc;
> +}
> +
> +static void
> +dla_free_op_desc(struct dla_engine *engine, struct dla_common_op_desc *op_desc)
> +{
> +	uint64_t op_base;
> +	uint64_t dep_graph_addr;
> +	struct dla_task *task;
> +
> +	pr_debug("Enter: %s op desc index %u ROI %d\n", __func__,
> +				op_desc->index, op_desc->roi_index);

Possiple null pointer dereference

> +	task = engine->task;
> +	dep_graph_addr = (sizeof(struct dla_common_op_desc) *
> +				engine->network->num_operations *
> +				op_desc->roi_index);
> +
> +	if (op_desc->index == -1)
> +		goto exit;

Possiple null pointer dereference

> +	if (op_desc == NULL)
> +		goto exit;

Or this is unnecessary.

> +
> +	/**
> +	 * TODO: keeping the depth value hardcoded as 0 for now,
> +	 * need to replace it once corresponding implementation is done.
> +	 */
> +	op_base = (dep_graph_addr +
> +			(sizeof(struct dla_common_op_desc) *
> +			(uint64_t)op_desc->index));
> +
> +	/**
> +	 * Flush descriptor to DRAM
> +	 */
> +	dla_data_write(engine->driver_context,
> +			task->task_data,
> +			(void *)op_desc,
> +			task->dependency_graph_addr,
> +			sizeof(struct dla_common_op_desc),
> +			op_base);
> +
> +	/**
> +	 * Release it
> +	 */
> +	op_desc->index = -1;
> +	op_desc->roi_index = -1;
> +exit:
> +	return;
> +}
> +
> +void
> +dla_put_op_desc(struct dla_engine *engine, struct dla_common_op_desc *op_desc)
> +{
> +	int32_t i;
> +	struct dla_common_op_desc *desc;
> +
> +	if (op_desc == NULL)
> +		return;
> +
> +	if (op_desc->index == -1)
> +		return;
> +
> +	desc = &desc_cache[op_desc->op_type][0];
> +
> +	for (i = 0; i < DLA_OP_CACHE_SIZE; i++, desc++) {
> +		if (desc->index == op_desc->index &&
> +				desc->roi_index == op_desc->roi_index) {

Reverse if.

		if (desc->index != op_desc->index)
			continue;
		if (desc->roi_index != op_desc->roi_index)
			continue;

> +
> +			desc_refcount[op_desc->op_type][i]--;
> +
> +			/**
> +			 * Free desc if refcount is 0
> +			 */
Pretty useless comment and totally not needed three line for this.

> +			if (desc_refcount[op_desc->op_type][i] == 0)
> +				dla_free_op_desc(engine, op_desc);
> +
> +			return;
> +		}
> +	}
> +}
> +
> +void
> +dla_init_op_cache(struct dla_engine *engine)
> +{
> +	int32_t i, j;
> +	struct dla_common_op_desc *desc = &desc_cache[0][0];
> +
> +	memset((uint8_t *)&desc_cache[0][0], 0, sizeof(desc_cache));
> +	memset((uint8_t *)&desc_refcount[0][0], 0, sizeof(desc_refcount));
> +
> +	for (i = 0; i < DLA_OP_NUM; i++) {
> +		for (j = 0; j < DLA_OP_CACHE_SIZE; j++) {
> +			desc->index = -1;
> +			desc->roi_index = -1;
> +			desc->op_type = (uint8_t)i;
> +			desc++;
> +		}
> +	}
> +}

... snip

> diff --git a/drivers/gpu/drm/nvdla/nvdla_common.h b/drivers/gpu/drm/nvdla/nvdla_common.h
> new file mode 100644
> index 000000000000..38cf43246890
> --- /dev/null
> +++ b/drivers/gpu/drm/nvdla/nvdla_common.h
> @@ -0,0 +1,835 @@

... snip

> +struct dla_conv_op_desc {
> +	/* Performance parameters */
> +
> +	/* dla_conv_mode */
> +	uint8_t conv_mode;
> +	uint8_t data_reuse;
> +	uint8_t weight_reuse;
> +	uint8_t skip_data_rls;
> +
> +	uint8_t skip_weight_rls;
> +	uint8_t reserved0;
> +	uint16_t entry_per_slice;
> +
> +	/* dla_data_format */
> +	uint8_t data_format;
> +	/* dla_pixel_mapping */
> +	uint8_t pixel_mapping;
> +	/* number of free slices before fetch */
> +	uint16_t fetch_grain;
> +
> +	uint8_t reserved_b[8];
> +
> +	/* batch_num */
> +	uint8_t batch;
> +	/* dla_weight_format */
> +	uint8_t weight_format;
> +	uint8_t data_bank;
> +	uint8_t weight_bank;
> +
> +	/* the offset in bytes of each data cube in a batch */
> +	uint32_t batch_stride;
> +
> +	uint8_t post_extension;
> +	uint8_t pixel_override;
> +	/* number of slices need to be released */
> +	uint16_t release;
> +
> +	 /* The input cube dimension for CSC */
> +	uint16_t input_width_csc;
> +	uint16_t input_height_csc;
> +
> +	uint16_t input_channel_csc;
> +	uint16_t kernel_width_csc;
> +
> +	uint16_t kernel_height_csc;
> +	uint16_t kernel_channel_csc;
> +
> +	/* The input cube dimension for CMAC */
> +	uint16_t input_width_cmac;
> +	uint16_t input_height_cmac;
> +
> +	/* actual size in bytes */
> +	uint32_t bytes_per_kernel;
> +
> +	/* Algorithm parameters */
> +
> +	int16_t mean_ry; /* mean value for red in RGB or Y in YUV */
> +	int16_t mean_gu; /* mean value for green in RGB or U in YUV */
> +
> +	int16_t mean_bv; /* mean value for blue in RGB or V in YUV */
> +	int16_t mean_ax;
> +
> +	uint8_t mean_format; /* dla_mean_format */
> +	uint8_t conv_stride_x;
> +	uint8_t conv_stride_y;
> +	uint8_t pad_x_left;
> +
> +	uint8_t pad_x_right;
> +	uint8_t pad_y_top;
> +	uint8_t pad_y_bottom;
> +	uint8_t dilation_x;
> +
> +	uint8_t dilation_y;
> +	uint8_t reserved2[2];
> +
> +	/* Precision parameters */
> +	uint8_t pra_truncate;
> +
> +	uint8_t in_precision;
> +	/* The output precision from CONV, it's the MAC processing precison */

./nvdla_common.h:428: precison ==> precision

> +	uint8_t out_precision;
> +	int16_t pad_val;
> +
> +	/* input converter parameters */
> +	struct dla_cvt_param in_cvt;
> +	/* output converter parameters, support truncate only */
> +	struct dla_cvt_param out_cvt;
> +
> +} __packed __aligned(4);
> +
> +struct dla_conv_stat_desc {
> +	uint32_t data_read_stall;
> +	uint32_t weight_read_stall;
> +	uint32_t data_read_latency;
> +	uint32_t weight_read_latency;
> +	uint32_t saturation_count;
> +	uint32_t nan_data_num;
> +	uint32_t nan_weight_num;
> +	uint32_t inf_data_num;
> +	uint32_t inf_weight_num;
> +} __packed __aligned(4);
> +
> +/**
> + * @ingroup SDP
> + * @name Activation functions
> + * @brief Activation functions supported in SDP
> + * @{
> + */
> +#define ACTIVATION_NONE		0
> +#define ACTIVATION_RELU		1
> +#define ACTIVATION_LUT		2
> +#define ACTIVATION_PRELU	3
> +/** @} */
> +
> +/**
> + * @ingroup LUT
> + * @name LUT size
> + * @brief LUT sizes for linear and exponentila LUT
> + * @{
> + */
> +#define LUT_LINEAR_EXP_TABLE_ENTRY_LOG2		6
> +#define LUT_LINEAR_ONLY_TABLE_ENTRY_LOG2	8
> +/** @} */
> +
> +/**
> + * @ingroup LUT
> + * @name LUT types
> + * @brief DLA supports two types of LUT, linear and exonential
> + * @{
> + */
> +#define LUT_LINEAR_EXP_TABLE		0
> +#define LUT_LINEAR_ONLY_TABLE		1
> +/** @} */
> +
> +/**
> + * @ingroup LUT
> + * @name LUT methods
> + * @brief DLA supports two types of LUT, linear and exonential
> + * @{
> + */
> +#define LUT_METHOD_EXPONENTIAL		0
> +#define LUT_METHOD_LINEAR		1
> +/** @} */
> +
> +/**
> + * @ingroup LUT
> + * @name LUT
> + * @brief DLA supports two types of LUT, linear and exonential
> + * @{
> + */
> +#define LUT_PRI_LINEAR_EXP		0
> +#define LUT_PRI_LINEAR_ONLY		1
> +/** @} */
> +
> +union dla_lut_offset {
> +	/**
> +	 * Number should be substracted on log domain before look up

./nvdla_common.h:505: substracted ==> subtracted

> +	 * exponetial table it has the same definition as hardware

./nvdla_common.h:506: exponetial ==> exponential

> +	 * thus input scaling should also take into account when
> +	 * set this field.
> +	 */
> +	int8_t exp_offset;
> +	/**
> +	 * Number of bits should be right shift before looking
> +	 * up linear table
> +	 */
> +	int8_t frac_bits;
> +	uint16_t reserved0;
> +};

... snip

> diff --git a/drivers/gpu/drm/nvdla/nvdla_drm.c b/drivers/gpu/drm/nvdla/nvdla_drm.c
> new file mode 100644
> index 000000000000..9217eee1de3b
> --- /dev/null
> +++ b/drivers/gpu/drm/nvdla/nvdla_drm.c
> @@ -0,0 +1,695 @@
> +// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0
> +/*
> + * Copyright (C) 2017-2018 NVIDIA CORPORATION
> + * Copyright (C) 2022 Cai Huoqing
> + */
> +
> +#include <linux/dma-buf.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/fs.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/printk.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/time.h>
> +#include <linux/uaccess.h>
> +#include <linux/types.h>
> +
> +#include "nvdla_drm.h"
> +#include "nvdla_ioctl.h"
> +#include "nvdla_engine.h"
> +
> +static struct nvdla_config nvdla_config_os_initial = {
> +	.atom_size = 32,
> +	.bdma_enable = true,
> +	.rubik_enable = true,
> +	.weight_compress_support = true,
> +};
> +
> +static struct nvdla_config nvdla_config_small = {
> +	//.atom_size = 8,
> +	.atom_size = 32,  // nv_large config
> +	.bdma_enable = false,
> +	.rubik_enable = false,
> +	.weight_compress_support = false,
> +};
> +
> +int64_t dla_get_time_us(void)

Funtion is never used.

> +{
> +	return ktime_get_ns() / NSEC_PER_USEC;
> +}
> +
> +void dla_reg_write(void *driver_context, uint32_t addr, uint32_t reg)
> +{
> +	struct nvdla_device *nvdla_dev =
> +			(struct nvdla_device *)driver_context;
> +
> +	if (!nvdla_dev)
> +		return;
> +
> +	writel(reg, nvdla_dev->base + addr);
> +}
> +
> +uint32_t dla_reg_read(void *driver_context, uint32_t addr)
> +{
> +	struct nvdla_device *nvdla_dev =
> +			(struct nvdla_device *)driver_context;
> +
> +	if (!nvdla_dev)
> +		return 0;
> +
> +	return readl(nvdla_dev->base + addr);
> +}
> +
> +static irqreturn_t nvdla_engine_isr(int32_t irq, void *data)
> +{
> +	unsigned long flags;
> +	uint32_t mask;
> +	uint32_t reg;
> +	struct dla_processor *processor = NULL;
> +	struct dla_processor_group *group;
> +	struct dla_engine *engine;
> +	struct nvdla_device *nvdla_dev = (struct nvdla_device *)data;
> +
> +	if (!nvdla_dev)
> +		return IRQ_NONE;
> +
> +	engine = nvdla_dev->engine_context;
> +	spin_lock_irqsave(&nvdla_dev->nvdla_lock, flags);
> +
> +	mask = glb_reg_read(engine, S_INTR_MASK);

Never used. It would be nice so that static analyzer will not complain
these anymore, but your choice what you want to do.

> +	reg = glb_reg_read(engine, S_INTR_STATUS);
> +
> +	if (reg & MASK(GLB_S_INTR_STATUS_0, CACC_DONE_STATUS0)) {
> +		processor = &engine->processors[DLA_OP_CONV];
> +		group = &processor->groups[0];
> +		group->events |= (1 << DLA_EVENT_OP_COMPLETED);
> +	}
> +	if (reg & MASK(GLB_S_INTR_STATUS_0, CACC_DONE_STATUS1)) {
> +		processor = &engine->processors[DLA_OP_CONV];
> +		group = &processor->groups[1];
> +		group->events |= (1 << DLA_EVENT_OP_COMPLETED);
> +	}
> +	if (reg & MASK(GLB_S_INTR_STATUS_0, SDP_DONE_STATUS0)) {
> +		processor = &engine->processors[DLA_OP_SDP];
> +		group = &processor->groups[0];
> +		group->events |= (1 << DLA_EVENT_OP_COMPLETED);
> +	}
> +	if (reg & MASK(GLB_S_INTR_STATUS_0, SDP_DONE_STATUS1)) {
> +		processor = &engine->processors[DLA_OP_SDP];
> +		group = &processor->groups[1];
> +		group->events |= (1 << DLA_EVENT_OP_COMPLETED);
> +	}
> +	if (reg & MASK(GLB_S_INTR_STATUS_0, CDP_DONE_STATUS0)) {
> +		processor = &engine->processors[DLA_OP_CDP];
> +		group = &processor->groups[0];
> +		group->events |= (1 << DLA_EVENT_OP_COMPLETED);
> +	}
> +	if (reg & MASK(GLB_S_INTR_STATUS_0, CDP_DONE_STATUS1)) {
> +		processor = &engine->processors[DLA_OP_CDP];
> +		group = &processor->groups[1];
> +		group->events |= (1 << DLA_EVENT_OP_COMPLETED);
> +	}
> +	if (reg & MASK(GLB_S_INTR_STATUS_0, RUBIK_DONE_STATUS0)) {
> +		processor = &engine->processors[DLA_OP_RUBIK];
> +		group = &processor->groups[0];
> +		group->events |= (1 << DLA_EVENT_OP_COMPLETED);
> +	}
> +	if (reg & MASK(GLB_S_INTR_STATUS_0, RUBIK_DONE_STATUS1)) {
> +		processor = &engine->processors[DLA_OP_RUBIK];
> +		group = &processor->groups[1];
> +		group->events |= (1 << DLA_EVENT_OP_COMPLETED);
> +	}
> +	if (reg & MASK(GLB_S_INTR_STATUS_0, PDP_DONE_STATUS0)) {
> +		processor = &engine->processors[DLA_OP_PDP];
> +		group = &processor->groups[0];
> +		group->events |= (1 << DLA_EVENT_OP_COMPLETED);
> +	}
> +	if (reg & MASK(GLB_S_INTR_STATUS_0, PDP_DONE_STATUS1)) {
> +		processor = &engine->processors[DLA_OP_PDP];
> +		group = &processor->groups[1];
> +		group->events |= (1 << DLA_EVENT_OP_COMPLETED);
> +	}
> +	if (reg & MASK(GLB_S_INTR_STATUS_0, BDMA_DONE_STATUS0)) {
> +		processor = &engine->processors[DLA_OP_BDMA];
> +		group = &processor->groups[0];
> +		group->events |= (1 << DLA_EVENT_OP_COMPLETED);
> +	}
> +	if (reg & MASK(GLB_S_INTR_STATUS_0, BDMA_DONE_STATUS1)) {
> +		processor = &engine->processors[DLA_OP_BDMA];
> +		group = &processor->groups[1];
> +		group->events |= (1 << DLA_EVENT_OP_COMPLETED);
> +	}
> +	if (reg & MASK(GLB_S_INTR_STATUS_0, CDMA_DAT_DONE_STATUS0)) {
> +		processor = &engine->processors[DLA_OP_CONV];
> +		group = &processor->groups[0];
> +		group->events |= (1 << DLA_EVENT_CDMA_DT_DONE);
> +	}
> +	if (reg & MASK(GLB_S_INTR_STATUS_0, CDMA_DAT_DONE_STATUS1)) {
> +		processor = &engine->processors[DLA_OP_CONV];
> +		group = &processor->groups[1];
> +		group->events |= (1 << DLA_EVENT_CDMA_DT_DONE);
> +	}
> +	if (reg & MASK(GLB_S_INTR_STATUS_0, CDMA_WT_DONE_STATUS0)) {
> +		processor = &engine->processors[DLA_OP_CONV];
> +		group = &processor->groups[0];
> +		group->events |= (1 << DLA_EVENT_CDMA_WT_DONE);
> +	}
> +	if (reg & MASK(GLB_S_INTR_STATUS_0, CDMA_WT_DONE_STATUS1)) {
> +		processor = &engine->processors[DLA_OP_CONV];
> +		group = &processor->groups[1];
> +		group->events |= (1 << DLA_EVENT_CDMA_WT_DONE);
> +	}
> +
> +	glb_reg_write(engine, S_INTR_STATUS, reg);
> +	mask = glb_reg_read(engine, S_INTR_MASK);

Never used

> +	reg = glb_reg_read(engine, S_INTR_STATUS);

Never used.

> +
> +	complete(&nvdla_dev->event_notifier);
> +	spin_unlock_irqrestore(&nvdla_dev->nvdla_lock, flags);
> +
> +	return IRQ_HANDLED;
> +}

... snip

> diff --git a/drivers/gpu/drm/nvdla/nvdla_gem.c b/drivers/gpu/drm/nvdla/nvdla_gem.c
> new file mode 100644
> index 000000000000..cccf6d01a564
> --- /dev/null
> +++ b/drivers/gpu/drm/nvdla/nvdla_gem.c

... snip

> +static const struct drm_ioctl_desc nvdla_drm_ioctls[] = {
> +	DRM_IOCTL_DEF_DRV(NVDLA_SUBMIT, nvdla_submit, DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(NVDLA_GEM_CREATE, nvdla_gem_create, DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(NVDLA_GEM_MMAP, nvdla_gem_map_offset, DRM_RENDER_ALLOW),
> +	/* use DRM_IOCTL_MODE_DESTROY_DUMB to destory */

./nvdla_gem.c:347: destory ==> destroy

> +};

... snip

> diff --git a/drivers/gpu/drm/nvdla/nvdla_scheduler.c b/drivers/gpu/drm/nvdla/nvdla_scheduler.c
> new file mode 100644
> index 000000000000..b814077478c6
> --- /dev/null
> +++ b/drivers/gpu/drm/nvdla/nvdla_scheduler.c

... snip

> +static int
> +dla_update_dependency(struct dla_engine *engine,
> +					  struct dla_consumer *consumer,
> +					  struct dla_common_op_desc *op_desc,
> +					  uint8_t event, uint8_t roi_index)
> +{
> +	int32_t ret = 0;
> +	struct dla_processor *processor;
> +
> +	if (consumer->index == -1)
> +		goto exit;
> +
> +	/* Update dependency only if event matches */
> +	if (event != consumer->event)
> +		goto exit;
> +
> +	/**
> +	 * If consumer index is valid but op desc is NULL means
> +	 * op desc for consumer was not pre-fetched
> +	 */
> +	if (op_desc == NULL) {
> +		ret = -EINVAL;
> +		pr_err("Operation descriptor is NULL, consumer index %d",
> +				consumer->index);
> +		goto exit;
> +	}
> +
> +	pr_debug("Update dependency operation index %d ROI %d DEP_COUNT=%d\n",
> +					op_desc->index, op_desc->roi_index,
> +					op_desc->dependency_count);
> +	op_desc->dependency_count--;
> +
> +	if (op_desc->dependency_count == 0) {
> +		processor = &engine->processors[op_desc->op_type];
> +		pr_debug("enable %s in %s as depdency are resolved\n",

./nvdla_scheduler.c:455: depdency ==> dependency

> +			processor->name, __func__);
> +
> +		ret = dla_enable_operation(engine, processor, op_desc);
> +		if (ret)
> +			goto exit;
> +	}
> +exit:
> +	return ret;
> +}

... snip

> +int
> +dla_process_events(struct dla_engine *engine, uint32_t *task_complete)
> +{
> +	int32_t i;
> +	int32_t ret = 0;
> +
> +	for (i = 0; i < DLA_OP_NUM; i++) {
> +		struct dla_processor *processor;
> +
> +		processor = &engine->processors[i];
> +		ret = dla_handle_events(engine, processor);
> +		/**
> +		 * Incase engine status is non-zero, then don't

./nvdla_scheduler.c:905: Incase ==> In case

> +		 * update the engine status. We should keep its
> +		 * status for later cleaning of engine.
> +		 */
> +		if (!engine->status)
> +			engine->status = ret;
> +	}
> +
> +	if (engine->network->num_operations == engine->num_proc_hwl)
> +		*task_complete = 1;
> +
> +	return ret;
> +}

... snip

   Argillander

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA88D0FE07
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jan 2026 22:01:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10FD010E1FD;
	Sun, 11 Jan 2026 21:01:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SKpld/4/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E322110E00E;
 Sun, 11 Jan 2026 21:01:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C423243F0A;
 Sun, 11 Jan 2026 21:01:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DA75C4CEF7;
 Sun, 11 Jan 2026 21:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768165303;
 bh=yo91uooYjm2kbrZjM7ydRXcE0hTl7M1mRt1OMMsbyOw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SKpld/4/oIJHZIwJnlGOkmJZsezgcxfmyer1iFUcuaPbOfqSWYsiUQaU8JU5WFmK+
 FLXKk6nGsQviBrVv79GnGHWw9g+8jWDzdlC6YzV/gNeuOrQIWlVtF/lNJVgqvOv+M0
 9z7gWNV2Xz4aE1SWZGbEWsRhJRwr8WOUJ7+7I3RLdzLA7SLeO760sRU2FbF2gzudbE
 DwJKGW/7rBvl7E0j8b45d8iqNSE9JOVBkCV48Utkdd0vVjJolwUwQuLkCQE/Y+DfVS
 dXXwZJ7UWKAnu35IQ75fG50ntLDpbRwuRszDAGOT14AqAEJyh2/ZpvdF/l0au+R3SX
 OsMQ5z7349cNA==
Message-ID: <1cb9a665-d15f-4328-818c-ca719cc65ef4@kernel.org>
Date: Sun, 11 Jan 2026 21:01:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] media: iris: retrieve UBWC platform configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <biHZo-h3V1_UxtKn9k9Pu2vs0QJ-7r7jF8EQoDiitfBb8fUMjVcDORQvnOZZwPXJ7MAdipbqysNe_mA0kSMFOg==@protonmail.internalid>
 <20260110-iris-ubwc-v1-3-dd70494dcd7b@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20260110-iris-ubwc-v1-3-dd70494dcd7b@oss.qualcomm.com>
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

On 10/01/2026 19:37, Dmitry Baryshkov wrote:
> Specifying UBWC data in each driver doesn't scale and is prone to
> errors. Request UBWC data from the central database in preparation to
> using it through the rest of the driver.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/Kconfig      | 1 +
>   drivers/media/platform/qcom/iris/iris_core.h  | 4 ++++
>   drivers/media/platform/qcom/iris/iris_probe.c | 5 +++++
>   3 files changed, 10 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
> index 3c803a05305a..39b06de6c3e6 100644
> --- a/drivers/media/platform/qcom/iris/Kconfig
> +++ b/drivers/media/platform/qcom/iris/Kconfig
> @@ -5,6 +5,7 @@ config VIDEO_QCOM_IRIS
>           select V4L2_MEM2MEM_DEV
>           select QCOM_MDT_LOADER if ARCH_QCOM
>           select QCOM_SCM
> +        select QCOM_UBWC_CONFIG
>           select VIDEOBUF2_DMA_CONTIG
>           help
>             This is a V4L2 driver for Qualcomm iris video accelerator
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index fb194c967ad4..d10a03aa5685 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -30,6 +30,8 @@ enum domain_type {
>   	DECODER	= BIT(1),
>   };
> 
> +struct qcom_ubwc_cfg_data;
> +
>   /**
>    * struct iris_core - holds core parameters valid for all instances
>    *
> @@ -52,6 +54,7 @@ enum domain_type {
>    * @resets: table of iris reset clocks
>    * @controller_resets: table of controller reset clocks
>    * @iris_platform_data: a structure for platform data
> + * @ubwc_cfg: UBWC configuration for the platform
>    * @state: current state of core
>    * @iface_q_table_daddr: device address for interface queue table memory
>    * @sfr_daddr: device address for SFR (Sub System Failure Reason) register memory
> @@ -95,6 +98,7 @@ struct iris_core {
>   	struct reset_control_bulk_data		*resets;
>   	struct reset_control_bulk_data		*controller_resets;
>   	const struct iris_platform_data		*iris_platform_data;
> +	const struct qcom_ubwc_cfg_data		*ubwc_cfg;
>   	enum iris_core_state			state;
>   	dma_addr_t				iface_q_table_daddr;
>   	dma_addr_t				sfr_daddr;
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 9bc9b34c2576..85e531b35ecf 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -10,6 +10,7 @@
>   #include <linux/pm_opp.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/reset.h>
> +#include <linux/soc/qcom/ubwc.h>
> 
>   #include "iris_core.h"
>   #include "iris_ctrls.h"
> @@ -248,6 +249,10 @@ static int iris_probe(struct platform_device *pdev)
> 
>   	core->iris_platform_data = of_device_get_match_data(core->dev);
> 
> +	core->ubwc_cfg = qcom_ubwc_config_get_data();
> +	if (IS_ERR(core->ubwc_cfg))
> +		return PTR_ERR(core->ubwc_cfg);
> +
>   	ret = devm_request_threaded_irq(core->dev, core->irq, iris_hfi_isr,
>   					iris_hfi_isr_handler, IRQF_TRIGGER_HIGH, "iris", core);
>   	if (ret)
> 
> --
> 2.47.3
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

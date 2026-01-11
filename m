Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E06D0FE58
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jan 2026 22:07:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A7610E264;
	Sun, 11 Jan 2026 21:07:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aQc1UAiD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AA2610E27F;
 Sun, 11 Jan 2026 21:06:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0F8C643F3A;
 Sun, 11 Jan 2026 21:06:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D72C4CEF7;
 Sun, 11 Jan 2026 21:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768165618;
 bh=e0/sNEQAtuyYWVbM8PITHUUQVWLzsuYaXId9q2Wnd2s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aQc1UAiD5K+o4hF8HhOYvQc7QTUcnNQggsy9mgC85df0YkMBkQ4dtTpOM5hSmVs62
 tCTkpygxrbSar40QqY2xJoqrJ3vrojjj+ShEcDRt+rzPHK4OeOEaLcEs6z2tzPk7AP
 ThTgek8J1y6tNJvg/AZTwPCx7kRtLMNcDqSbjmpa/euekC7wa1MsHvFHkaDKRnCOs5
 TjmoEzFnS0nTNeTxnNdRVdzSaOMmB6g8TQwcDewFosn+rysvFi7niNcwkBt/ELKhIF
 Z9gNZbf8cViAafgBVFsdgZEJJGu0b/jElVb13FnNWPvFrPhpUHqPxpSWQMuv6d99hk
 BVT7FkVCCmu5Q==
Message-ID: <d8f6969f-a58c-4a02-a59d-f608e1a95ba7@kernel.org>
Date: Sun, 11 Jan 2026 21:06:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] media: iris: don't specify min_acc_length in the
 source code
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
 <i1eMEm9fSpXb30tw6zP_FKeXfJr4sD7bS88njLCMUniDy_QNsOiVn5w41aA0zXnLaVRNFLaLrHgr73Yo2XV5lQ==@protonmail.internalid>
 <20260110-iris-ubwc-v1-4-dd70494dcd7b@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20260110-iris-ubwc-v1-4-dd70494dcd7b@oss.qualcomm.com>
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
> The min_acc length can be calculated from the platform UBWC
> configuration. Use the freshly introduced helper and calculate min_acc
> length based on the platform UBWC configuration instead of specifying it
> directly in the source.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 5 ++++-
>   drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
>   drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
>   3 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> index d77fa29f44fc..878e61aa77c3 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> @@ -3,6 +3,8 @@
>    * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>    */
> 
> +#include <linux/soc/qcom/ubwc.h>
> +
>   #include "iris_hfi_common.h"
>   #include "iris_hfi_gen2.h"
>   #include "iris_hfi_gen2_packet.h"
> @@ -120,6 +122,7 @@ static void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr, u32 pkt_typ
> 
>   void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_header *hdr)
>   {
> +	const struct qcom_ubwc_cfg_data *ubwc = core->ubwc_cfg;
>   	u32 payload = 0;
> 
>   	iris_hfi_gen2_create_header(hdr, 0, core->header_id++);
> @@ -146,7 +149,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>   				    &payload,
>   				    sizeof(u32));
> 
> -	payload = core->iris_platform_data->ubwc_config->mal_length;
> +	payload = qcom_ubwc_min_acc_length_64b(ubwc) ? 64 : 32;
>   	iris_hfi_gen2_create_packet(hdr,
>   				    HFI_PROP_UBWC_MAL_LENGTH,
>   				    HFI_HOST_FLAGS_NONE,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 8d8cdb56a3c7..3c5f3f68b722 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -73,7 +73,6 @@ struct tz_cp_config {
> 
>   struct ubwc_config_data {
>   	u32	max_channels;
> -	u32	mal_length;
>   	u32	highest_bank_bit;
>   	u32	bank_swzl_level;
>   	u32	bank_swz2_level;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index c1989240c248..c70cfc2fc553 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -633,7 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
> 
>   static struct ubwc_config_data ubwc_config_sm8550 = {
>   	.max_channels = 8,
> -	.mal_length = 32,
>   	.highest_bank_bit = 16,
>   	.bank_swzl_level = 0,
>   	.bank_swz2_level = 1,
> 
> --
> 2.47.3
> 
> 

This code is fine but, I still suggest changing the 64b postfix in 
qcom_ubwc_min_acc_length_64b and just having the function return the 
size for the platform as _that_ is the more sustainable way.

Up to you.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C26FED0FE87
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jan 2026 22:09:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B3C10E285;
	Sun, 11 Jan 2026 21:09:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SsQHCNuO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6392B10E285;
 Sun, 11 Jan 2026 21:09:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5777460165;
 Sun, 11 Jan 2026 21:09:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B933EC4CEF7;
 Sun, 11 Jan 2026 21:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768165741;
 bh=2JYsoP/eV3h32LTildoY/7IEvkyzEPNOMadmy8Yckws=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SsQHCNuOYvySVfkYxnTY5SPx2RMUAIS6ZIF57w1wpDALoJ/XL/5mMjNz2jLNDwQKP
 nbUfemNOTEL+Ojecy4OkX2wOlD1Rd+mX7PETy+BdCZmuapHSBWxD5ScztPNv5mCO38
 SH1W12YDUWTopiCK0mHTv7FdDc7FpMjjTEDg5tUXiAmO0U2q+s/i0vnlN2lC9/J7xl
 CO/tnosm0+IsBweH1EYSk5l0d5ZoSUs214fMU1oODLjg+Mun+MLIwqVrV4MO6yfWem
 WfDn809OMk+tqs0/gN98gJ2Tn9SkLDtZgV3QZngBICQuS+xfj1txpIz+I81YJg5VWg
 n5mz0kMQE51kA==
Message-ID: <d204ad46-46b0-4b65-960e-ff63c98f3505@kernel.org>
Date: Sun, 11 Jan 2026 21:08:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] media: iris: don't specify ubwc_swizzle in the
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
 <kK4SZcvZX-W32fTTc8iF22EfFp_sMd2anQI0XQbVtUxUtgJ3EX9Pazy4CPYfEn88UqmZ2oSHyAUGfKC2yoeXTQ==@protonmail.internalid>
 <20260110-iris-ubwc-v1-6-dd70494dcd7b@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20260110-iris-ubwc-v1-6-dd70494dcd7b@oss.qualcomm.com>
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
> The UBWC swizzle is specified both in the Iris driver and in the
> platform UBWC config. Use the platform UBWC configuration instead of
> specifying it directly in the source.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 6 +++---
>   drivers/media/platform/qcom/iris/iris_platform_common.h | 3 ---
>   drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 3 ---
>   3 files changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> index a4e60e9d32a4..a880751107c7 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> @@ -169,7 +169,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>   				    &payload,
>   				    sizeof(u32));
> 
> -	payload = core->iris_platform_data->ubwc_config->bank_swzl_level;
> +	payload = !!(ubwc->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL1);
>   	iris_hfi_gen2_create_packet(hdr,
>   				    HFI_PROP_UBWC_BANK_SWZL_LEVEL1,
>   				    HFI_HOST_FLAGS_NONE,
> @@ -179,7 +179,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>   				    &payload,
>   				    sizeof(u32));
> 
> -	payload = core->iris_platform_data->ubwc_config->bank_swz2_level;
> +	payload = !!(ubwc->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL2);
>   	iris_hfi_gen2_create_packet(hdr,
>   				    HFI_PROP_UBWC_BANK_SWZL_LEVEL2,
>   				    HFI_HOST_FLAGS_NONE,
> @@ -189,7 +189,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>   				    &payload,
>   				    sizeof(u32));
> 
> -	payload = core->iris_platform_data->ubwc_config->bank_swz3_level;
> +	payload = !!(ubwc->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL3);
>   	iris_hfi_gen2_create_packet(hdr,
>   				    HFI_PROP_UBWC_BANK_SWZL_LEVEL3,
>   				    HFI_HOST_FLAGS_NONE,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 8421711dbe60..9f9ee67e4732 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -73,9 +73,6 @@ struct tz_cp_config {
> 
>   struct ubwc_config_data {
>   	u32	max_channels;
> -	u32	bank_swzl_level;
> -	u32	bank_swz2_level;
> -	u32	bank_swz3_level;
>   	u32	bank_spreading;
>   };
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 5ae996d19ffd..0f06066d814a 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -633,9 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
> 
>   static struct ubwc_config_data ubwc_config_sm8550 = {
>   	.max_channels = 8,
> -	.bank_swzl_level = 0,
> -	.bank_swz2_level = 1,
> -	.bank_swz3_level = 1,
>   	.bank_spreading = 1,
>   };
> 
> 
> --
> 2.47.3
> 
> 

Nice.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

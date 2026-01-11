Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2235FD0FE9D
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jan 2026 22:09:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC4710E290;
	Sun, 11 Jan 2026 21:09:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pBbcYic4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3E910E28B;
 Sun, 11 Jan 2026 21:09:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4241C41906;
 Sun, 11 Jan 2026 21:09:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0E00C4CEF7;
 Sun, 11 Jan 2026 21:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768165794;
 bh=evt7Ag7Q9d8aZ/ZISRuru4052MUIwKG4sjvVktf3fDc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=pBbcYic4lN69UdNR7vC3HOiUWR44F1IbsbLJxT8oEX9lB9d+0axm1tYkNZxY0VnVn
 ByLgkhl5AbnsgClpilH/KvbNj8URxAvv59JTm6qek84n0KSNSQFglGLSIo7KWl7zJm
 KkTXO3jn408S+o/r902OoAlzokGGJHM5x+LtX7ELIr7flwW9ZAiQbQTpruYx7ZmPkB
 v7CZQolYdNRUbsfFCuFqfYd6GHV+hwrSY95pZaYjcOHzrehbqfEsRYzVgQd5XDPxAH
 njPY9ddirHRKUQ5sv/tBZzB5va9SAPDGJusoLeLO5OmDLwkEr3sMrvjKrJRCrIh4UL
 EhmsCPI9+mt2g==
Message-ID: <658b4273-f4ce-4d9e-a7e0-d2a61371a37a@kernel.org>
Date: Sun, 11 Jan 2026 21:09:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] media: iris: don't specify max_channels in the
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
 <1n2csnpGsoDM0B5Y26jLEt42O1LiT-1qhJLOq6SZv6v_riV0MiVw1p0TsRrBWw4kY3NKpldSR6mw_KUz7CPb7w==@protonmail.internalid>
 <20260110-iris-ubwc-v1-8-dd70494dcd7b@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20260110-iris-ubwc-v1-8-dd70494dcd7b@oss.qualcomm.com>
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

On 10/01/2026 19:38, Dmitry Baryshkov wrote:
> The UBWC max_channels spreading is specified in the Iris driver, but it
> also can be calculated from the platform UBWC config. Use the platform
> UBWC configuration instead of specifying it directly in the source.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
>   drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
>   drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
>   3 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> index 9945c939cd29..91dbea4c6664 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> @@ -139,7 +139,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>   				    &payload,
>   				    sizeof(u32));
> 
> -	payload = core->iris_platform_data->ubwc_config->max_channels;
> +	payload = ubwc->macrotile_mode ? 8 : 4;
>   	iris_hfi_gen2_create_packet(hdr,
>   				    HFI_PROP_UBWC_MAX_CHANNELS,
>   				    HFI_HOST_FLAGS_NONE,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index f99fcbb8fced..4abaf4615cea 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -72,7 +72,6 @@ struct tz_cp_config {
>   };
> 
>   struct ubwc_config_data {
> -	u32	max_channels;
>   };
> 
>   struct platform_inst_caps {
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index c967db452dec..e78cda7e307d 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -632,7 +632,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
>   };
> 
>   static struct ubwc_config_data ubwc_config_sm8550 = {
> -	.max_channels = 8,
>   };
> 
>   static struct tz_cp_config tz_cp_config_sm8550 = {
> 
> --
> 2.47.3
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

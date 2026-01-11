Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 295E3D0FD92
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jan 2026 21:58:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0F5910E07B;
	Sun, 11 Jan 2026 20:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="o2nxf9ay";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E0C210E00E;
 Sun, 11 Jan 2026 20:58:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A01F5409D6;
 Sun, 11 Jan 2026 20:58:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 454A2C4CEF7;
 Sun, 11 Jan 2026 20:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768165133;
 bh=I7BYBfTWV+ZrdQOUpX190/GGNn42UH6XtvpMHQmYu+0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=o2nxf9ayDDsNuHZp4o/VYCiEK1krS6c0fZGdYtCXyVqhXq8RlNPd7PHggdwVdN2vR
 kt7TqHeRAZF2UMVQyBoPc42cIdcYsgR81j9HrsTk8nKFBhfYEat7zSqijVk+V47IZi
 PKvKHEoHSi6eQtMePzT8LLM/KczJKhwsCuNKMX1c2YLerV5vaEIWGKSE6gy597uSYJ
 lPieP4I9EXmjGbuoghpuoe4vaWD3UIWbX8Qc7BAQo+CvLd6NTF+uchEqseS0zuyHP8
 8pvbsIqrMWCBORVAbekB/JOaPXpUzvJ9iptnOw6kzRWbEmeUKTXogn4KUCpliIfsTP
 GOiVD+1/BEVWw==
Message-ID: <db61a94f-c24f-453b-ba0f-68a1ca55f787@kernel.org>
Date: Sun, 11 Jan 2026 20:58:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] soc: qcom: ubwc: add missing include
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
 <qI842TAdbRfELK9X6o_rrqcG72Pmql8uUc_nFchh5O5-tLvUxCNuyVGA50PkT9yCjJBnR9zi3eancJe2g-WCHQ==@protonmail.internalid>
 <20260110-iris-ubwc-v1-1-dd70494dcd7b@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20260110-iris-ubwc-v1-1-dd70494dcd7b@oss.qualcomm.com>
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
> The header has a function which calls pr_err(). Don't require users of
> the header to include <linux/printk.h> and include it here.
> 
> Fixes: 87cfc79dcd60 ("drm/msm/a6xx: Resolve the meaning of UBWC_MODE")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   include/linux/soc/qcom/ubwc.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
> index 0a4edfe3d96d..f052e241736c 100644
> --- a/include/linux/soc/qcom/ubwc.h
> +++ b/include/linux/soc/qcom/ubwc.h
> @@ -8,6 +8,7 @@
>   #define __QCOM_UBWC_H__
> 
>   #include <linux/bits.h>
> +#include <linux/printk.h>
>   #include <linux/types.h>
> 
>   struct qcom_ubwc_cfg_data {
> 
> --
> 2.47.3
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

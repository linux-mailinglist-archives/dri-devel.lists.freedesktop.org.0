Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 293BA6CF72F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 01:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8E810E01F;
	Wed, 29 Mar 2023 23:31:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61EE810E1F5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 23:31:51 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id c29so22334745lfv.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 16:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680132709;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uWJdsWldsc640792OBi+zRWRy0BJIGGz1A1rf+B8cUc=;
 b=TNtGURSW0FeUCVJHy+WnX4VJ6p4WTzy7IwTT7JipjTJKiTU8JB1WdWnrtzZXTWKjti
 ymd2LMQ74gXntm6TBwJJsNpBNDj18TqdI8PXCroIheLkZXHEi0czGsz4g1MTQZhAHP+T
 GvXnb8ANIacoS+P/5rKSxfSt3ZSq94EoNelfzboSknrNzIVreYefM2b1IRg3VX1cwZwi
 fc9AYla3r55zF8YlYEGSBWc/cFh2PN1dNlGA34MCupbvMTIdNZBMYazoJl0+H5PxFbPG
 F/sLaWGj3G1oPMMYXKeemYzmQ2T7MYO77LPN+uMwtdiWe8U/Pu+J6+abwhM3MwFnQBhp
 Airw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680132709;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uWJdsWldsc640792OBi+zRWRy0BJIGGz1A1rf+B8cUc=;
 b=1O4n7UyTJnHcyoW1NugD2wkKnSivEIfClC38lFsDgraJlUgPiy1NS0azSiscCgmrBA
 CSeSq3/S3evUBxbGZEUVwdWqwPK5JT7wmQQaDpNpo0uuwf5213RPFE2p/ZhO5kOEFvO8
 mFR/3qLALOtS3lRq9ZJzEJOQdJJFbGT6Ku5n0UOmIPFDdxEirUVzvgTSA9SPG/2VfWM/
 SHZcX0rnSVRLzdqgQmCrTR64hGfAjVX+dEwj+hF6S5tZIy7hT9itYc1KsBXtMqxgNZ2A
 bOmaRGIhiRGw6YunAu7P5Z5pcjermynQDKNJqVr5CcGhQ/TwPRUTxHbeV9nvjEkbvlZA
 ihhA==
X-Gm-Message-State: AAQBX9cV4cGHLNn9CUN+JsxVqQEcvDsaHTZ/lFlBG1wtSPY4WSbfcZ2F
 Wbky5QzipGs3ObjNrSFVnF5huQ==
X-Google-Smtp-Source: AKy350Zm5RPFgwDl0ZDjGiqnsvgGsLLZJqSj1PNi0yeREAOszwge8aikOn67MJotwpGT/y9C+qBiRg==
X-Received: by 2002:ac2:4c95:0:b0:4e7:fa8a:886e with SMTP id
 d21-20020ac24c95000000b004e7fa8a886emr7047635lfl.51.1680132709374; 
 Wed, 29 Mar 2023 16:31:49 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a19ad08000000b004a9b9ccfbe6sm5668365lfc.51.2023.03.29.16.31.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 16:31:48 -0700 (PDT)
Message-ID: <4e12cc50-cd34-e1a1-3a91-0da369b785c1@linaro.org>
Date: Thu, 30 Mar 2023 02:31:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC 3/5] drm/msm/dpu: Use DRM DSC helper for
 det_thresh_flatness
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230329-rfc-msm-dsc-helper-v1-0-f3e479f59b6d@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v1-3-f3e479f59b6d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v1-3-f3e479f59b6d@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/03/2023 02:18, Jessica Zhang wrote:
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> index 619926da1441..648c530b5d05 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> @@ -3,6 +3,8 @@
>    * Copyright (c) 2020-2022, Linaro Limited
>    */
>   
> +#include <drm/display/drm_dsc_helper.h>
> +
>   #include "dpu_kms.h"
>   #include "dpu_hw_catalog.h"
>   #include "dpu_hwio.h"
> @@ -102,7 +104,7 @@ static void dpu_hw_dsc_config(struct dpu_hw_dsc *hw_dsc,
>   	data |= dsc->final_offset;
>   	DPU_REG_WRITE(c, DSC_DSC_OFFSET, data);
>   
> -	det_thresh_flatness = 7 + 2 * (dsc->bits_per_component - 8);
> +	det_thresh_flatness = drm_dsc_calculate_det_thresh_flatness(dsc);

But this changes the value! Compare:

bpc | old | new
8   | 7   | 2
10  | 11  | 8
12  | 15  | 256

If this is intentional, please state so and maybe add a Fixes tag.


>   	data = det_thresh_flatness << 10;
>   	data |= dsc->flatness_max_qp << 5;
>   	data |= dsc->flatness_min_qp;
> 

-- 
With best wishes
Dmitry


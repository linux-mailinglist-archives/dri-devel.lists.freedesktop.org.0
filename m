Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 006006D05C7
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 15:02:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C113210E324;
	Thu, 30 Mar 2023 13:02:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F3A710E324
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 13:02:48 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id h11so17439247lfu.8
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 06:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680181366;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/RogR8ZtUdYcPzRFUIOedkEYrZnCY91rWR6PUijMp9w=;
 b=Wj5qVClm841JfzOvn+lHpe+yD29RVv/Bbo4uyLJMWDUvTgwYgKGeFAqhFGWs9LK/4/
 Yl3KmG1ywQbTxaWiOyWtQaGy6HoDTwGqJbGlWPGGy7DTDwHtCObA5W5TlmfVUY1wuzFH
 PImdar5kbb2hLkf7LlHrPSuwJ/wPlaJtsisQgrv4/ZrCLHz0Y4oHjHnSPKxHKE4QoNDs
 iUm9W0gSPJOzIQbdRPE4bpp1bXUCcS8JY67uNEYm+Je4dKMSkItyMUhgrVyQ0wEXZvQO
 qP7vF+s/mdZS4PLzwF4fxl3+B2j2OIIptwnhYKjsKVvsZyzC85R7RyzphPtK9orp2JjD
 vujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680181366;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/RogR8ZtUdYcPzRFUIOedkEYrZnCY91rWR6PUijMp9w=;
 b=CA3h+OxA7jk+IBTDCzEbv+SjDzJKYwBqFgz/5p904FDH4Y1GEklPiRSGbozkkJAGnw
 bxbw5poy2/CkvYgfuOYb1ua/3//A7oDNNXhXnIVo2PTgPseQmlVGX0MLpy7qtAQMCfj0
 3q2kOgPmMgWD+8MmeNdMD/IdhSmfq0u3Z9xumtPKckEP6H2ffTJY9HbC9rLH1RB4kqgM
 RxK5LCCOG7pes3Z1esxTZFB3Hj14fSkB6gTNrdwbPCQbrgbwViMz1wX6YNpLBQscnYIs
 o9pw9uAwqH+sVoJAtQan2lkE1hprpo3m44Z34dWDv98PhJ/kBEoUVBddhx8sJWfRCvpJ
 Uogw==
X-Gm-Message-State: AAQBX9fqtBK9ckrWJOZjGbstd0SBt2TPLffXwlzr5P2+glpkqxR9kpAV
 xqfkcth3ZmyxP1DxqDe/J8QWdQ==
X-Google-Smtp-Source: AKy350ZE66LJBidcIElElvytvyzs2f2PP7ea9oW2Wa2PSznpmDFh+tOxxGD3LeOAnHozCixEeTt3ag==
X-Received: by 2002:ac2:5288:0:b0:4eb:2d47:602 with SMTP id
 q8-20020ac25288000000b004eb2d470602mr269159lfm.59.1680181366173; 
 Thu, 30 Mar 2023 06:02:46 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 d20-20020ac244d4000000b004e9aabe94a3sm5063026lfm.151.2023.03.30.06.02.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 06:02:45 -0700 (PDT)
Message-ID: <ca0ccc96-09e8-9d6a-0317-df8c192f6fab@linaro.org>
Date: Thu, 30 Mar 2023 15:02:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,44/50] drm/msm/dpu: drop unused macros from hw catalog
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-45-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211231259.1308718-45-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12.02.2023 00:12, Dmitry Baryshkov wrote:
> Drop the version comparison macros from dpu_hw_catalog.h, they are
> unused.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 16 ----------------
>  1 file changed, 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 5355a6c5aaac..8490e5e58469 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -23,14 +23,6 @@
>  		((MINOR & 0xFFF) << 16)  |\
>  		(STEP & 0xFFFF))
>  
> -#define DPU_HW_MAJOR(rev)		((rev) >> 28)
> -#define DPU_HW_MINOR(rev)		(((rev) >> 16) & 0xFFF)
> -#define DPU_HW_STEP(rev)		((rev) & 0xFFFF)
> -#define DPU_HW_MAJOR_MINOR(rev)		((rev) >> 16)
> -
> -#define IS_DPU_MAJOR_MINOR_SAME(rev1, rev2)   \
> -	(DPU_HW_MAJOR_MINOR((rev1)) == DPU_HW_MAJOR_MINOR((rev2)))
> -
>  #define DPU_HW_VER_170	DPU_HW_VER(1, 7, 0) /* 8996 v1.0 */
>  #define DPU_HW_VER_171	DPU_HW_VER(1, 7, 1) /* 8996 v2.0 */
>  #define DPU_HW_VER_172	DPU_HW_VER(1, 7, 2) /* 8996 v3.0 */
> @@ -52,14 +44,6 @@
>  #define DPU_HW_VER_810	DPU_HW_VER(8, 1, 0) /* sm8450 */
>  #define DPU_HW_VER_900	DPU_HW_VER(9, 0, 0) /* sm8550 */
>  
> -#define IS_MSM8996_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_170)
> -#define IS_MSM8998_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_300)
> -#define IS_SDM845_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_400)
> -#define IS_SDM670_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_410)
> -#define IS_SDM855_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_500)
> -#define IS_SC7180_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_620)
> -#define IS_SC7280_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_720)
> -
>  #define DPU_HW_BLK_NAME_LEN	16
>  
>  #define MAX_IMG_WIDTH 0x3fff

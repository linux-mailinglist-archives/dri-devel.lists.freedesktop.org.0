Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B5B6DE12E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 18:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE8A10E105;
	Tue, 11 Apr 2023 16:43:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC57810E5A8
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 16:43:09 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id bx15so7212233ljb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 09:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681231387;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f+Yn3w4i6ERhJRbEalDkX81nXU5W6d0rrV0jXP7xE40=;
 b=QFgUdLSiBrEwNbHQ04X1boTAoorIGTiF6sCjmJuNEhDh5YRYplW2HFsR/8qPj/zRH6
 bFS+gA3Kcbkf5sO/PY5yrQ2o2ENpG6g4z5qxUGFRBvtZSFGdmi6K/UO+W6AEXlEjWD31
 Pr50qHaLDkwLcPVUVVGO/FK9xlZ+qAwk6dBMFFp5pmfikoC8gr1g29K6Didkx5KkdYsJ
 OEgBDmqZ1qAXNZ9EcusjJDJ1R9zA76y0Nngb0ZJtx7apwCfRD8zhizpFLAj5q31eZXl2
 qWAXXNYtMDXsNjdtbojR9WBVyRNxyw2y2pbxV3Sb2WrvPyD17LGjevDRBLeTLq0tDcp9
 c1Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681231387;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f+Yn3w4i6ERhJRbEalDkX81nXU5W6d0rrV0jXP7xE40=;
 b=V0g0qWGM764N9zsqP6pcfT167glpFQcuGi0Bvkn0oPBcnN55JKSRVzPxF+OCwrmUiA
 MWYjhwe5Gn5FzKLsCzX/wkWKTLKQK6rzLrjpEHWPMGAP4yvYBJ3Q7Qp0933SF6BBbXzK
 aT3P5xEAUuAkYUL5yfu7nVkRZYHModmwzuPDo8n1tOEjtY2/6hHOhibaG5AIcnAtv0Cy
 0dzUB/0AtqbXPidqOMk4I/AvxA44M4DXT7yiRgRjTmHk0Tc/z79BlX2K1UIyqXZMUR4r
 nOynkSLGeEA+P/iM68GsvMOkQHbmG2jA9sSZFwcsNezffGsHxTMlr2AvxRLnu2SajLOR
 IjRA==
X-Gm-Message-State: AAQBX9ftHucZ8zmoHvfDmGvOMz7AtY7oU0P4C10nEUWi8vxjTmAUGZsJ
 PdD5EEP/izeE9ExtU5bMu3lBZw==
X-Google-Smtp-Source: AKy350bMk4SkskVqv2ia31J+GxA0ArmyEzCNBnop1DJ9H7MWNk8XMD336eB/RYppFHgASDqtT8IemQ==
X-Received: by 2002:a2e:82ce:0:b0:2a2:ca91:a99e with SMTP id
 n14-20020a2e82ce000000b002a2ca91a99emr4943313ljh.39.1681231387322; 
 Tue, 11 Apr 2023 09:43:07 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 x28-20020ac25ddc000000b004e8017a2510sm2606561lfq.183.2023.04.11.09.43.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 09:43:06 -0700 (PDT)
Message-ID: <90f32378-fa1c-a23e-2db2-2e83a42fd45e@linaro.org>
Date: Tue, 11 Apr 2023 19:43:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/msm/dpu: Delete a variable initialisation before a
 null pointer check in two functions
Content-Language: en-GB
To: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Archit Taneja <architt@codeaurora.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Jeykumar Sankaran <jsanka@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Vinod Koul <vkoul@kernel.org>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <13566308-9a80-e4aa-f64e-978c02b1406d@web.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <13566308-9a80-e4aa-f64e-978c02b1406d@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/04/2023 19:38, Markus Elfring wrote:
> Date: Tue, 11 Apr 2023 18:24:24 +0200
> 
> The address of a data structure member was determined before
> a corresponding null pointer check in the implementation of
> the functions “dpu_hw_pp_enable_te” and “dpu_hw_pp_get_vsync_info”.
> 
> Thus avoid the risk for undefined behaviour by removing extra
> initialisations for the variable “c” (also because it was already
> reassigned with the same value behind this pointer check).
> 
> This issue was detected by using the Coccinelle software.
> 
> Fixes: 25fdd5933e4c0f5fe2ea5cd59994f8ac5fbe90ef ("drm/msm: Add SDM845 DPU support")

Plese follow the format for the Fixes tags and limit the hash to 12 
chars. Proper tag:

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")

Other than that LGTM.

> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> index 0fcad9760b6f..870ab3ebbc94 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> @@ -176,7 +176,7 @@ static int dpu_hw_pp_enable_te(struct dpu_hw_pingpong *pp, bool enable)
>   static int dpu_hw_pp_connect_external_te(struct dpu_hw_pingpong *pp,
>   		bool enable_external_te)
>   {
> -	struct dpu_hw_blk_reg_map *c = &pp->hw;
> +	struct dpu_hw_blk_reg_map *c;
>   	u32 cfg;
>   	int orig;
> 
> @@ -221,7 +221,7 @@ static int dpu_hw_pp_get_vsync_info(struct dpu_hw_pingpong *pp,
> 
>   static u32 dpu_hw_pp_get_line_count(struct dpu_hw_pingpong *pp)
>   {
> -	struct dpu_hw_blk_reg_map *c = &pp->hw;
> +	struct dpu_hw_blk_reg_map *c;
>   	u32 height, init;
>   	u32 line = 0xFFFF;
> 
> --
> 2.40.0
> 

-- 
With best wishes
Dmitry


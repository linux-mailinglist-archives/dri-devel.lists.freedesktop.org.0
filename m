Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F368B67E805
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 15:19:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8352210E99F;
	Fri, 27 Jan 2023 14:19:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C5BC10E99F
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 14:19:45 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id br9so8389983lfb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 06:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yHpKCLd1feAFHzqVAkS1vVRJl7DA2D26atGO1hDsoMU=;
 b=uJMfkMrjEAbLTER4mfP9PuiszncnQvqaRMAAqRosN1Xz61KPw8Hf0ARqC8V4atUinN
 9ZdRFzGTnD8o5xyYxPUdAPL+YzD9HBdTjk+1BdXCSh1w/w4g6yWSczwADg/BuM8QoRcF
 VDt57VQ5CAUepFDV3Vxs9xiuC95aOJGdeHgHtdEpbMcXMLYuHtpjefd6Z7iix+M55WAu
 lweP2upZXm+uBnpqw1JKvZEHHPmu4tvv+mgg32Qli+RPxw1vU4Ng3dpUb6JFXqotRBFa
 xZvkRbOzHzYb0YYmJ1+RPHmD9HwpnjBCxfCVnqhUPWRGHJMrkVfQQCLJAmQL6NExwc6r
 F5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yHpKCLd1feAFHzqVAkS1vVRJl7DA2D26atGO1hDsoMU=;
 b=r/87TFABLLH6hIyVnCAMbXO3Lb+jGoVFOuzeK5IWmm1l72OIdrbElPTH3+iEX6k48R
 +1ndm8pW6JN3QD2u7UiUjRSop2pzu4Fw3wDEpGN/kL+lrpEpDvYb+U+ugW0R10aJ2oou
 5W98F2j7JmKrbewSPmFO4GHLrFt2fPyjBEt4cnaJx0+UZNELwu3KP6vTjlDzP0ZcBI89
 twHD8iXPRueT4RbeGbNlOn+kgf/mO1iA8Ba39V/k+EIqKVqYKNp2i92RCqCjrXHcNpyt
 JJkXIeAgcE5h/A1en4MAKwpZPOCwkGzSegnNMIw2f3ybPqDJQ/gXFQBIfPLmynr/hBD3
 JDXw==
X-Gm-Message-State: AFqh2kq/7YF502UY3wtDmW9yNvoMcD0PjrszgOVc5ojhuLVRAn+nwQLp
 5V7BhuoA7LCzoREc1dWxJkaUPA==
X-Google-Smtp-Source: AMrXdXv+fg8npKTMHLNTGLHU3PfRZ616QaZ5JiAO5ASXHDUq00NZrclsBNuAfXPddsQ0VsFM0gTj2A==
X-Received: by 2002:a05:6512:1108:b0:4b5:b87a:3262 with SMTP id
 l8-20020a056512110800b004b5b87a3262mr12248951lfg.28.1674829183700; 
 Fri, 27 Jan 2023 06:19:43 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 d14-20020ac2544e000000b004b56bebdc4esm272241lfn.14.2023.01.27.06.19.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 06:19:43 -0800 (PST)
Message-ID: <c8d9d5f0-dab8-4dca-5a32-1f4e11ecc964@linaro.org>
Date: Fri, 27 Jan 2023 16:19:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 13/14] drm/msm/a6xx: Add A619_holi speedbin support
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org, krzysztof.kozlowski@linaro.org
References: <20230126151618.225127-1-konrad.dybcio@linaro.org>
 <20230126151618.225127-14-konrad.dybcio@linaro.org>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230126151618.225127-14-konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/01/2023 17:16, Konrad Dybcio wrote:
> A619_holi is implemented on at least two SoCs: SM4350 (holi) and SM6375
> (blair). This is what seems to be a first occurrence of this happening,
> but it's easy to overcome by guarding the SoC-specific fuse values with
> of_machine_is_compatible(). Do just that to enable frequency limiting
> on these SoCs.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 31 +++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 452ba32699b2..89990bec897f 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2091,6 +2091,34 @@ static u32 a618_get_speed_bin(u32 fuse)
>   	return UINT_MAX;
>   }
>   
> +static u32 a619_holi_get_speed_bin(u32 fuse)
> +{
> +	/*
> +	 * There are (at least) two SoCs implementing A619_holi: SM4350 (holi)
> +	 * and SM6375 (blair). Limit the fuse matching to the corresponding
> +	 * SoC to prevent bogus frequency setting (as improbable as it may be,
> +	 * given unexpected fuse values are.. unexpected! But still possible.)
> +	 */
> +
> +	if (fuse == 0)
> +		return 0;
> +
> +	if (of_machine_is_compatible("qcom,sm4350")) {
> +		if (fuse == 138)
> +			return 1;
> +		else if (fuse == 92)
> +			return 2;
> +	} else if (of_machine_is_compatible("qcom,sm6375")) {
> +		if (fuse == 190)
> +			return 1;
> +		else if (fuse == 177)
> +			return 2;
> +	} else
> +		pr_warn("Unknown SoC implementing A619_holi!\n");

I think, we might be better to introduce "qcom,SoC-adreno" compat string 
instead, ignore it in the bindings and only care about it here. This 
might seem an overkill thinking from the single Adreno version. However 
this issue also affects other revisions.

For example, for the A618 there are at least three platforms which use 
the same Adreno version: SC7180, SM7125 and SM7150. Only first one is 
supported (thus the speed_bin function is simple). However according to 
the vendor dts files all three platforms use different fuse values to 
specify the speed bin.

> +
> +	return UINT_MAX;
> +}
> +
>   static u32 a619_get_speed_bin(u32 fuse)
>   {
>   	if (fuse == 0)
> @@ -2150,6 +2178,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
>   	if (adreno_cmp_rev(ADRENO_REV(6, 1, 8, ANY_ID), rev))
>   		val = a618_get_speed_bin(fuse);
>   
> +	else if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, 1), rev))
> +		val = a619_holi_get_speed_bin(fuse);
> +

Are we sure that SM6350, the unholi A619 user, doesn't use patchid .1? 
(note I do not know a thing about Adreno patch ids and its usage between 
different platforms).

>   	else if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, ANY_ID), rev))
>   		val = a619_get_speed_bin(fuse);
>   

-- 
With best wishes
Dmitry


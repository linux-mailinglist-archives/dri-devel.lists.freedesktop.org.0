Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D15CC226B8
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 22:29:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8760910EA3E;
	Thu, 30 Oct 2025 21:29:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nB5i1vu0";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WOp8kxRm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A6E10EA3F
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 21:29:48 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59UFHMjl102840
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 21:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tzlUFB86mAlTUURMeKWMWkUk71VirJXlKOjLKibgrMs=; b=nB5i1vu0NdPS2wPx
 eoVqkrmQogyhWYaOs20hxamRBiclaCE1rJP/ANv1/v66gfysCp87g8B0X6yAfDVG
 tBBv5x0wietJnBXQMZaMn+xUcUikSp7wzsR09UlMBuxFz7ND/5jjoxg8Ji1d/jeT
 f1Ibr1HMacj/mYR0bk+n+P1NWw0B9BteWOemHdm4KlMW5Q5M44k8dNVDXt1V22GI
 r3y0rOO2pK2Xb0sJsM+NII+umkQUahqhzai6A3uf06FGHWZAmDtd0rjjERqwrHIF
 bIpb3G5Bsy+ppJpefCSyQAhCKnYZ9nRwuiX2UaEG2P7WGW9N1d3H1MsaDyTm2JP2
 VIc9JA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ahdh1sb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 21:29:47 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-7810289cd5eso3781054b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 14:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761859787; x=1762464587;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tzlUFB86mAlTUURMeKWMWkUk71VirJXlKOjLKibgrMs=;
 b=WOp8kxRm/mVGxWxYmx3AMXJJkVz8ZVkrcyEf1O260nrKTtQvmUluD2QOsZd14XFE2R
 KONmu0osnTXsng/Si7jqiLOPDBLJL0eYPAihyaWqEVAXM0nsFEQEOoiW1p5t0U5hHJK+
 9fdW5Sf681evhbTC/Il2Wz9H7ZFPNVPiyte5tRLgWoFpxjkYp5lZx6Ep2uWi5ekTCpEN
 t7WlMlrVe2Y3MAeaghAYnNIMtng1+vMSQIdDFkNAJ72kQcj6FZxbuQfTMWWv5JBNMoFw
 qEsIYEmA4iQggkiItVgId6d9Af6/zezpN+5fSLpCJ9/T01v8N05RGpbLCuKsIXA3fBDj
 AJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761859787; x=1762464587;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tzlUFB86mAlTUURMeKWMWkUk71VirJXlKOjLKibgrMs=;
 b=Rd5K5F3KY2sLt1yHy2gS90GbMwizDidjpcA7oxO2Hr/iDaoFDvB3ELKp0tHe9pdhEY
 6BWxM8SWGxQnecjievR6dMCPBdEadNLGl8yXVorKhQNUTSKWxxavVMCc4GO8aRwp1R0L
 3AjXRecsRvpA9BVgwu3I/UwOOk9HylbxHaxeBgwxgdxKUWU4k9Sk5dNedCzlLlg/OHPW
 C2UVAXf+WPlZ4Un0g9UjYlHIkNMzbYDmylQBuqexG597e3z/Ra3UI0oDg2Dxps7dfw2D
 AFdUvqJXKZgFMCvRTjUJ144GB9Aa8y67aCU6oahO1LmRQfzuYyfO2sWLgxcThKHHn4nP
 JbPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQgnghVYdZlkoqbWX6OYmbGntOYVQOMcnmtKxlBTffBtH77ac7qVZe/bxGgTz2tROzWmp5NDUTJTo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYjKTgurjDhvwSppmpZTax8o2IrU0dX7QdxgDFTVc7TQpAY+cX
 WckHkAYsjuhrjBlNChxvbQt2uijQLtpwaWNnc0ewzomFxxVePBstEiRFg5s6PRBfxiPy49uMucj
 g+ZoZUu/DcDVu/mdBrZ/BDeLIv3At5Efz/ugYIAweH/HcAJIk7TeEh1uOjCzexnIJTAS1q0Q=
X-Gm-Gg: ASbGncv5NPAt2CvYqeg+CsAv2USTqRtGTx9wWXA8+A1o0kLFLRqRFcGpqW+ROBP/OFY
 y1w7eh0tFQ/X/Wfm711YJySFUGANblW50Lohq2Dk0BN84CZPEb7LJRwuumfUfLg1Kh9bEvJSyzk
 oK8WoYtwAVRcbcF8z2s4zOOcRm6GaqSEy9C72DS4nChAktzuApa5a+VbSWfxwQQBpsf63qgV3Li
 m9n6gQNSNQg5S38UmIfWcC68vh73KL4RBOPAx/JehnfAlMnIkyvuo/FviYHYXpMTmQSo2sGOV4F
 MrYywzMTG2Z2s2O2QU4CP7o2TmTTEwknwNGCVA3ygUQOfezyI/uNWT8hc2lTkC7Bl5Lr7ybksJs
 wt+g6d1q/ul/nphQjyZ5dPyA=
X-Received: by 2002:a05:6a00:8d1:b0:7a2:7bdd:cbf4 with SMTP id
 d2e1a72fcca58-7a77a9ca32dmr956523b3a.27.1761859787078; 
 Thu, 30 Oct 2025 14:29:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7gJS7A8SHkbq5oKF6sDj7A6I6fhFxuB0Lxorh9exZXB3/O9HNGHkmZRZA8yyMj7usEqcVoQ==
X-Received: by 2002:a05:6a00:8d1:b0:7a2:7bdd:cbf4 with SMTP id
 d2e1a72fcca58-7a77a9ca32dmr956495b3a.27.1761859786477; 
 Thu, 30 Oct 2025 14:29:46 -0700 (PDT)
Received: from [192.168.1.6] ([106.222.233.132])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a414012d13sm19972568b3a.9.2025.10.30.14.29.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 14:29:46 -0700 (PDT)
Message-ID: <c8058713-b126-461b-8ae6-19c4574a8105@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 02:59:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: Re: [PATCH RFC RFT] drm/msm: adreno: attach the GMU device to a driver
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20251022-topic-adreno-attach-gmu-to-driver-v1-1-999037f7c83e@linaro.org>
Content-Language: en-US
In-Reply-To: <20251022-topic-adreno-attach-gmu-to-driver-v1-1-999037f7c83e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE4MSBTYWx0ZWRfX8m+JS6Ft/m0X
 l8PFpAslXEp46HMnUhgM7GEm74ZOoVY4SRh2zQtC+uqAU7E5qubxUIPEvhW6iPyNjgaoLJmQIMK
 WFIlKLJSAb1/c0pDiuLOVptGs+trgi4GrSvYVzbnWLbwklS6pqoIIRUKCfofyJRD+fxYJC4AvQo
 MUu4aRvQAKciZdbzEUR663xvCBg2jf6mTg5oEJLqn/G7jep+rIH1Dnh/XuLGLjsX7+QG8BVPHge
 KzvV049djE4iMKbjZNoXL53qA2+cipuVllvEAqBPKmTrE5xMz1OP5S04Id2MD3jOZ8hUXKloA/w
 H4Nr3lUFA3lOcQwHYsqtwDIMUArrwRO4oCVKRNwcSzOnr6IlJX5oo9zEFGnwtWwPIIbJLQcR1e/
 xSFuqdfb1kr15ucT8HS1jfMiJuhbrw==
X-Proofpoint-GUID: 7cJuJ-zjAGe7I_0mX7F9dF3ndfDdzgxz
X-Authority-Analysis: v=2.4 cv=TsnrRTXh c=1 sm=1 tr=0 ts=6903d8cb cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=rTtKBu4o5onlnI9juXDqsQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=ZJ4cUMe89lpGfuoIxrAA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 7cJuJ-zjAGe7I_0mX7F9dF3ndfDdzgxz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_07,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300181
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

On 10/22/2025 6:14 PM, Neil Armstrong wrote:
> Due to the sync_state is enabled by default in pmdomain & CCF since v6.17,
> the GCC and GPUCC sync_state would stay pending, leaving the resources in
> full performance:
> gcc-x1e80100 100000.clock-controller: sync_state() pending due to 3d6a000.gmu
> gpucc-x1e80100 3d90000.clock-controller: sync_state() pending due to 3d6a000.gmu
> 
> In order to fix this state and allow the GMU to be properly
> probed, let's add a proper driver for the GMU and add it to
> the MSM driver components.
> 
> Only the proper GMU has been tested since I don't have
> access to hardware with a GMU wrapper.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 354 ++++++++++++++---------------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |   6 -
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |   3 -
>  drivers/gpu/drm/msm/adreno/adreno_device.c |   4 +
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   4 +
>  drivers/gpu/drm/msm/msm_drv.c              |  16 +-
>  6 files changed, 192 insertions(+), 195 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index fc62fef2fed8..6e7c3e627509 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1859,11 +1859,14 @@ void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu)
>  	pm_runtime_put(&gpu->pdev->dev);
>  }
>  
> -void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
> +static void a6xx_gmu_unbind(struct device *dev, struct device *master, void *data)
>  {

I feel we should keep gmu and gmu_wrapper implementations separate. It
is already overloaded. How about adding a separate gmu_wrapper_bind_ops
and keep it in the match data?

> -	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct msm_drm_private *priv = dev_get_drvdata(master);
> +	struct msm_gpu *gpu = priv->gpu;

<< snip >>

>  static inline uint32_t get_wptr(struct msm_ringbuffer *ring)
>  {
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 7e977fec4100..0618da7e8b40 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -998,18 +998,30 @@ static const struct of_device_id msm_gpu_match[] = {
>  	{ },
>  };
>  
> +static const struct of_device_id msm_gmu_match[] = {
> +	{ .compatible = "qcom,adreno-gmu" },
> +	{ .compatible = "qcom,adreno-gmu-wrapper" },
> +	{ },
> +};
> +
>  static int add_gpu_components(struct device *dev,
>  			      struct component_match **matchptr)
>  {
> -	struct device_node *np;
> +	struct device_node *np, *gmu;
>  
>  	np = of_find_matching_node(NULL, msm_gpu_match);
>  	if (!np)
>  		return 0;
>  
> -	if (of_device_is_available(np) && adreno_has_gpu(np))
> +	if (of_device_is_available(np) && adreno_has_gpu(np)) {
>  		drm_of_component_match_add(dev, matchptr, component_compare_of, np);
>  
> +		gmu = of_find_matching_node(NULL, msm_gmu_match);

Instead of this, we can probably use the gmu phandle from "qcom,gmu"
property? That is quicker and also doesn't assume that there is only a
single GPU.

> +		if (of_device_is_available(gmu))
> +			drm_of_component_match_add(dev, matchptr, component_compare_of, gmu);
> +		of_node_put(gmu);
I think you missed the recently added headless support. Please check
separate_gpu_kms modparam and msm_gpu_probe().

-Akhil

> +	}
> +
>  	of_node_put(np);
>  
>  	return 0;
> 
> ---
> base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
> change-id: 20251022-topic-adreno-attach-gmu-to-driver-e47025fd7ebb
> 
> Best regards,

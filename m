Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5025CBFCCBD
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 17:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 925BC10E7E5;
	Wed, 22 Oct 2025 15:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VesLKiOR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F6F10E7E5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 15:13:30 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M7cMub012317
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 15:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AtOPiC6l9BljB6aQ9rnOst9XuL/E0zhfUfs2IkZsLyo=; b=VesLKiORCVMrQ7GS
 14L63ABO0Np/2mo+V3ZHRiAAcI5h6Qo2xbbMhqTOTHZzUol66uQ+RzffZYpA7/ra
 zAUo4MmZUiRwNnuF+JdbcWeXK/i+KJhUYfg6+mJjSF1o4vebYWuFAgFCg+zYlwpL
 wk1L6Dd4gyCkGlPizScFg0RYu/erxPBtU/LtV/3IrsC42Djkr0BR2FWOPIEsTGtP
 hC55ihaIUhzZmCmm0MczwdGSLUkv4BWeo+WdoXLwIp9t4siyvXmD0OfHYiSfYtsj
 0UxAzp1nJPotu4qrBl/CCwrF1PVaDwAIVE0b1ka+e3353q131VRCRS9TeT7ZFdmF
 HvQ3/g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0jy99-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 15:13:29 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-87c1d388a94so23022986d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 08:13:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761146009; x=1761750809;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AtOPiC6l9BljB6aQ9rnOst9XuL/E0zhfUfs2IkZsLyo=;
 b=YnCZXvZHxAsIsTDhVoVZ2XzkQMRg5LQHvBe3XUUkmppWxOzHFFIT2HtzGzTCj9MQ/V
 U/wqE7f0tQC+sKJk6aCpXf/oADRNw0VaZWO9KhR0MiMj8jZuNUDXIMM2C/n9n5AHqRYX
 M+IEFunqU/A/x+bb0x9ekXs9+waOeSD634i57c3pz4iedh1fpsplFheUzdvr9LFecZGe
 yL1emjvikw2qPixiwa6M+OvlkIqtcHoTUtHdT9gaTmpAVomLcvTrn4e2pXpJx7ma4Z99
 Xx4A50KIbFTVi5IYyNpvrBwlpg1MEYv/Hb4fQiqw4c4RqTi2lGDk++v9vn4C8VzMjgvQ
 yLIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuF6v5AzJ+0oh72N3OtzOa1qrLLMBrIdd/oi5XxgmnahQqnudW3F26rNkhpjLMl7OQB/5VsYRQ+QY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8QeeqmThJNImvoS3MLSU5E7wNQErtEFCG76s2/7zhipAXReWS
 JRoj+TpgbCej4Gy0uEdKkWq9umwc92nWDO2kB/vH5V0GRVJG0DxIK3+6bzfjwioakW/TkVpekU9
 +26JtHiLdsDrIUNJu2jDqzPCdlF3n0MYHhVb8aOOIvknSj841L94igjyNa0nU+fgzdS90xH0=
X-Gm-Gg: ASbGncvqC8G391PNx2eJ5jwcvXXpnycV/0rbPLK/1JWQdIexcemsVdzLkPsyeVn3TX9
 RJaMzrjXd+eXOQKl7/NkwigSCoRgR9A/xtDHqXsdjD+eP9jT5vbAAN3cRLN7NC67Iea4OddUe6Z
 y5yFU6yS/sfuGcosGIjrQQ2M/pnVhMMVQ5i2qTHqXl3N1P1Wec7bCnRrIiG6nLTIts1p537Q0Ax
 v2IIy1096MmmwD3ahTAFgSvQ+K5PwFd/ICJVOPwCnfv/NqhWaE/Mt/YcumvPW7QRRmhAV8Jg6jq
 t4bUGkvA5bHWw5y27lv8YKiETJLeK2rvZL7dZRiUT6kQx6BrjigeuX9J0T+A/H9NiOWNnTXgXxP
 qPEbEzlCW5KiO6iynqdhXBLjTa6Jd5MpPOFEtRT0XT9peoxLDcLkgd24o
X-Received: by 2002:a05:622a:199a:b0:4e8:a9f6:359 with SMTP id
 d75a77b69052e-4ea1178251cmr61449911cf.10.1761146008747; 
 Wed, 22 Oct 2025 08:13:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEierfzFT+Ehux93IgCTLHvl2L0VFHL4qLUlUPHsnWhN8MQCEyk8V77qdJ6+vl24wozTMkFJw==
X-Received: by 2002:a05:622a:199a:b0:4e8:a9f6:359 with SMTP id
 d75a77b69052e-4ea1178251cmr61449171cf.10.1761146008174; 
 Wed, 22 Oct 2025 08:13:28 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65eb036846sm1378295966b.54.2025.10.22.08.13.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 08:13:27 -0700 (PDT)
Message-ID: <44ff81bf-8970-475c-a4f5-c03220bc8c3f@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 17:13:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/msm/a6xx: Add support for Adreno 612
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
 <20251017-qcs615-spin-2-v1-1-0baa44f80905@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251017-qcs615-spin-2-v1-1-0baa44f80905@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfX/vKYCMn09W8S
 QcI1bhmpCFHWW4xQEnv+Dh2XyQmkoAQ4IUEO5GEJUuUWREaseEex+oi6WycXT6ajqm1wp+PYvMN
 x1Rkza0KUYkFUq1G6V4ENT7iYgXR3PlWYNlPdku0pIXa9LziAITwuPjuvdTklyi+D+90iqjC+d/
 RKsLhG0AhVK3Igc/X3ht1kui5Ad8M3q6BuKn2xSeHI1Rr4DcZoQRWr3rFKej8ZPiS0PC01X40O/
 2gi9oCZPAJUppHI2akNMQp/OZx71Ru+JzznT2wTsupqyV25AinzY7B0q+OrTrk+9je40vYgdaDJ
 b648SiT9i7nJoghD4ZBEvZTdJmsgQNkIBJiEvnmjE5nDkSBXEHbUs6h2cmfR/U87MwRG0wfhh4x
 yBdJ/uN+M7jLbBuneQsH/p0KTcIuqg==
X-Proofpoint-ORIG-GUID: E2NUVr_vXDtBbEX6fTdQqUWh_jEUasiJ
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68f8f499 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=NFg73xRieO-LzbxsZPIA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: E2NUVr_vXDtBbEX6fTdQqUWh_jEUasiJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167
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

On 10/17/25 7:08 PM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add support for Adreno 612 GPU found in SM6150/QCS615 chipsets.
> A612 falls under ADRENO_6XX_GEN1 family and is a cut down version
> of A615 GPU.
> 
> A612 has a new IP called Reduced Graphics Management Unit or RGMU
> which is a small state machine which helps to toggle GX GDSC
> (connected to CX rail) to implement IFPC feature. It doesn't support
> any other features of a full fledged GMU like clock control, resource
> voting to rpmh etc. So we need linux clock driver support like other
> gmu-wrapper implementations to control gpu core clock and gpu GX gdsc.
> This patch skips RGMU core initialization and act more like a
> gmu-wrapper case.
> 
> Co-developed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> @@ -350,12 +350,18 @@ static const struct a6xx_gmu_oob_bits a6xx_gmu_oob_bits[] = {
>  /* Trigger a OOB (out of band) request to the GMU */
>  int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
>  {
> +	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
> +	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>  	int ret;
>  	u32 val;
>  	int request, ack;
>  
>  	WARN_ON_ONCE(!mutex_is_locked(&gmu->lock));
>  
> +	/* Skip OOB calls since RGMU is not enabled */

"RGMU doesn't handle OOB calls"

[...]

> +int a6xx_rgmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
> +{
> +	struct platform_device *pdev = of_find_device_by_node(node);
> +	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
> +	int ret;
> +
> +	if (!pdev)
> +		return -ENODEV;
> +
> +	gmu->dev = &pdev->dev;
> +
> +	ret = of_dma_configure(gmu->dev, node, true);
> +	if (ret)
> +		return ret;
> +
> +	pm_runtime_enable(gmu->dev);
> +
> +	/* Mark legacy for manual SPTPRAC control */
> +	gmu->legacy = true;
> +
> +	/* RGMU requires clocks */
> +	ret = devm_clk_bulk_get_all(gmu->dev, &gmu->clocks);
> +	if (ret < 1)
> +		return ret;

Simply add this clock detail to a6xx_gmu_wrapper_init and use _optional

[...]

>  	/* Enable fault detection */
>  	if (adreno_is_a730(adreno_gpu) ||
> -	    adreno_is_a740_family(adreno_gpu))
> +	    adreno_is_a740_family(adreno_gpu) || adreno_is_a612(adreno_gpu))

Sorting this would be neat

[...]

> +static int a6xx_rgmu_pm_resume(struct msm_gpu *gpu)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
> +	unsigned long freq = gpu->fast_rate;
> +	struct dev_pm_opp *opp;
> +	int ret;
> +
> +	gpu->needs_hw_init = true;
> +
> +	trace_msm_gpu_resume(0);
> +
> +	opp = dev_pm_opp_find_freq_ceil(&gpu->pdev->dev, &freq);
> +	if (IS_ERR(opp))
> +		return PTR_ERR(opp);
> +
> +	dev_pm_opp_put(opp);
> +
> +	/* Set the core clock and bus bw, having VDD scaling in mind */
> +	dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
> +
> +	pm_runtime_resume_and_get(gmu->dev);
> +	pm_runtime_resume_and_get(gmu->gxpd);
> +
> +	ret = clk_bulk_prepare_enable(gmu->nr_clocks, gmu->clocks);
> +	if (ret)
> +		goto err_rpm_put;
> +
> +	ret = clk_bulk_prepare_enable(gpu->nr_clocks, gpu->grp_clks);
> +	if (ret)
> +		goto err_bulk_clk;

Add this as-is to a6xx_pm_resume(), nr_clocks==0 is valid, similarly
for _suspend

Konrad

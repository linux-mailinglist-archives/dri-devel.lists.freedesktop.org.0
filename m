Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B31C8C03BA6
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 00:57:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED3B10E634;
	Thu, 23 Oct 2025 22:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VLbPC+fp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D05810E975
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 22:57:53 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NDwJwR015917
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 22:57:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yqaz483n1KlNxsCkKCJ5vTgJQhaR4GIj6IStln/zk3U=; b=VLbPC+fpwkd+9Fkh
 +TB12p1c6fUHnVViku03JJypYW6sJS2Cn/JO9EBfHCt+RuOIozk/wV/M29BDrX3g
 4SaUjT7jwFc53hi0AdTevzdTtpgWy7W+2OBUP04TexnxRTlM5NP4FWIbK+Dr/54i
 MAGNIl/WsBpVGV5jjpGGy1mLDHXiBmXsDcNWcXcNb5ygYS2FEoxxQ+AIoXBTnqGY
 6QbjatJVoh3eLICt9B4WooFVi4r9uVvUzmFYDf5lsHm+CU7a/ox+/qLly6BXOG7S
 A3JZWhyaB9/0KV8hUMtsju9zoU5YswolLoK7JgjOtda7WoHySaDaloraKKPAQuWs
 yEtH7Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0r433-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 22:57:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-26983c4d708so10528875ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 15:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761260271; x=1761865071;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yqaz483n1KlNxsCkKCJ5vTgJQhaR4GIj6IStln/zk3U=;
 b=TBRfnNhJisy4rVjvmjII4M8Ndpk1PhfDazktMbP++8JLFDxuSPzH6Hym5lyK2o//ll
 k837YmU2o7xNaqHJnJRcX9Fg6J0U9P/1YvCKXzb6dmrP6xu/8k44Yen7Sa9OpLX5opfA
 y5X17Sl2cxM5YfRhgu23JgyhTPe1caKC984LxvwUfGuoA0QgnOlVjLax2WBS625+Uc4Z
 qFwHL5nIr8MucE3yFInB2oYOzlY7DyRsAsfCJjWZcSZ5N3p5QOmm2GFweMpFyOys8FSM
 8UY2ZoqEHZyyqI6Iuw2lvt2pHrp2Q6hzQngrrgKf3LPdIPVq41lD5O+DGpWvwv7I7omd
 nkcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFeR0Mp5lv4zTpkonz2mVe+cHmgTmII6BaDado4YcZatDmFBjCSBE/nVjL8/N6Uqaks1YD5MfBn9s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7Xn2Y4LnIu5bf6oDqSTXIjJyR8vMwSnVXIbCIhsj+7WlvUav/
 damIqFk4vBxDIPcXIN1N9W9EUyhZez2iIoHrvnXCX3UxTOScf/spx/ip0aH4oJwQTN4akmtDnrx
 h44gBXPmSy+uDesVrIIWSURO2otvOgugKN4HSnQR4fJntYzmzsyeve0fBBBz+VnOjfAaOL8A=
X-Gm-Gg: ASbGncs4tQF5HQGU7j/RIIajCdaJG2UcyZwXcAQ87GJXFeFrKvuaJALY9AR4Ovnqn72
 02D5eiNU2XvW3Sw7EQJUqqkvcuyWwElxHH839cXKMCKXWEAy03QJLhcv8tiroXXo5mH1vaM9hR4
 pMFZhXLZph3la3Wp/kgBIjIOJt/1UhU20ieBCoFU7j4lvIR58mpxNB5FSi0RPYszcyc77MFo23w
 b/vYxbPre1IJKPJagYkzfMXFr5hKMFIDxC5a3K6a9KS4aIfnmScDW2Tb9DmUcP0YOvtt+wOXSFe
 LSmhX64VMn1BwFg2G04qjiEJfXNVqJLk09HcKZNxYmUYsOgXGdqrqirolYdPTpte16Ba1ERKQQ/
 qF91umH2U3tpZ4+wDwXClMXQ=
X-Received: by 2002:a17:903:138a:b0:28e:c9f6:867b with SMTP id
 d9443c01a7336-290c9cd4adbmr305413325ad.23.1761260271037; 
 Thu, 23 Oct 2025 15:57:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHh6V4ZfvJsZGGaazZtGFR+31ad7iDZirAZP401lR3dDyWD/UCXocgWwsTkcU7pnidQWx55TQ==
X-Received: by 2002:a17:903:138a:b0:28e:c9f6:867b with SMTP id
 d9443c01a7336-290c9cd4adbmr305413105ad.23.1761260270488; 
 Thu, 23 Oct 2025 15:57:50 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.232.102])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2946ded7c8bsm34844225ad.22.2025.10.23.15.57.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 15:57:50 -0700 (PDT)
Message-ID: <97aeb6a1-fda2-440f-b14b-2f3dbc2d7e8e@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 04:27:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/msm/a6xx: Add support for Adreno 612
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <44ff81bf-8970-475c-a4f5-c03220bc8c3f@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <44ff81bf-8970-475c-a4f5-c03220bc8c3f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfX2cRqS5pfq4Sk
 sY/a6/iMZS8OZDt5xT7QqmuQr27wTwOGJA+Q/6snyVdB4bSpv6vaDhQtY0F5dgJqLVJw63/7njR
 lYrVnp2xX1Tgpjx6aXYN/D/dIczohgqOYP0j4jvp3CsblES40HcI/+FMvgswYpNKqn8G7vzyLvG
 xeclcRcmjWwty7D2H06YJK+K9Az1hWG1LSIu/HUvzRXKSdH5WpGmf5Agd6DSn1vWQrgEykvWe2a
 0xGYoz6HoKYb27QHi+aLXbMA/bQQGi2o0CEp5MI1AqyUr2o7ZoERNQuDBbNRvNL2CcOjxTHEM0e
 dIN96zAs/ymQnmJj3HARctiP5vkx8q1plhO/wm6Hg0H3rN3ii5G8ps7oLeGpr2QpKikqouE+bTm
 5FZqsAlet/XI4zCPr2n52qbCAfRkYw==
X-Proofpoint-ORIG-GUID: RRNuDvEqp-sJMMKqGH7MK_30ARinMyTt
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68fab2f0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=OORdEvYNKPdDRPFHMUl15A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=QKnce7zJJDl700h9doIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: RRNuDvEqp-sJMMKqGH7MK_30ARinMyTt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
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

On 10/22/2025 8:43 PM, Konrad Dybcio wrote:
> On 10/17/25 7:08 PM, Akhil P Oommen wrote:
>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>
>> Add support for Adreno 612 GPU found in SM6150/QCS615 chipsets.
>> A612 falls under ADRENO_6XX_GEN1 family and is a cut down version
>> of A615 GPU.
>>
>> A612 has a new IP called Reduced Graphics Management Unit or RGMU
>> which is a small state machine which helps to toggle GX GDSC
>> (connected to CX rail) to implement IFPC feature. It doesn't support
>> any other features of a full fledged GMU like clock control, resource
>> voting to rpmh etc. So we need linux clock driver support like other
>> gmu-wrapper implementations to control gpu core clock and gpu GX gdsc.
>> This patch skips RGMU core initialization and act more like a
>> gmu-wrapper case.
>>
>> Co-developed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> @@ -350,12 +350,18 @@ static const struct a6xx_gmu_oob_bits a6xx_gmu_oob_bits[] = {
>>  /* Trigger a OOB (out of band) request to the GMU */
>>  int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
>>  {
>> +	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>> +	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>>  	int ret;
>>  	u32 val;
>>  	int request, ack;
>>  
>>  	WARN_ON_ONCE(!mutex_is_locked(&gmu->lock));
>>  
>> +	/* Skip OOB calls since RGMU is not enabled */
> 
> "RGMU doesn't handle OOB calls"

Technically RGMU can handle OOB calls. But we are not initializing rgmu.

> 
> [...]
> 
>> +int a6xx_rgmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>> +{
>> +	struct platform_device *pdev = of_find_device_by_node(node);
>> +	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>> +	int ret;
>> +
>> +	if (!pdev)
>> +		return -ENODEV;
>> +
>> +	gmu->dev = &pdev->dev;
>> +
>> +	ret = of_dma_configure(gmu->dev, node, true);
>> +	if (ret)
>> +		return ret;
>> +
>> +	pm_runtime_enable(gmu->dev);
>> +
>> +	/* Mark legacy for manual SPTPRAC control */
>> +	gmu->legacy = true;
>> +
>> +	/* RGMU requires clocks */
>> +	ret = devm_clk_bulk_get_all(gmu->dev, &gmu->clocks);
>> +	if (ret < 1)
>> +		return ret;
> 
> Simply add this clock detail to a6xx_gmu_wrapper_init and use _optional

Hmm. It looks like devm_clk_bulk_get_all() returns 0 if there are no
clocks. Will squash.

> 
> [...]
> 
>>  	/* Enable fault detection */
>>  	if (adreno_is_a730(adreno_gpu) ||
>> -	    adreno_is_a740_family(adreno_gpu))
>> +	    adreno_is_a740_family(adreno_gpu) || adreno_is_a612(adreno_gpu))
> 
> Sorting this would be neat

Ack

> 
> [...]
> 
>> +static int a6xx_rgmu_pm_resume(struct msm_gpu *gpu)
>> +{
>> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>> +	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>> +	unsigned long freq = gpu->fast_rate;
>> +	struct dev_pm_opp *opp;
>> +	int ret;
>> +
>> +	gpu->needs_hw_init = true;
>> +
>> +	trace_msm_gpu_resume(0);
>> +
>> +	opp = dev_pm_opp_find_freq_ceil(&gpu->pdev->dev, &freq);
>> +	if (IS_ERR(opp))
>> +		return PTR_ERR(opp);
>> +
>> +	dev_pm_opp_put(opp);
>> +
>> +	/* Set the core clock and bus bw, having VDD scaling in mind */
>> +	dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
>> +
>> +	pm_runtime_resume_and_get(gmu->dev);
>> +	pm_runtime_resume_and_get(gmu->gxpd);
>> +
>> +	ret = clk_bulk_prepare_enable(gmu->nr_clocks, gmu->clocks);
>> +	if (ret)
>> +		goto err_rpm_put;
>> +
>> +	ret = clk_bulk_prepare_enable(gpu->nr_clocks, gpu->grp_clks);
>> +	if (ret)
>> +		goto err_bulk_clk;
> 
> Add this as-is to a6xx_pm_resume(), nr_clocks==0 is valid, similarly
> for _suspend

The other difference is a6xx_llc_activate/deactivate(). Looks to me that
we can unconditionally add that too to a6xx_pm_resume().

-Akhil

> 
> Konrad


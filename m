Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A650A12BD1
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 20:37:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499AC10E516;
	Wed, 15 Jan 2025 19:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="WHF1GUT6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6783B10E516;
 Wed, 15 Jan 2025 19:37:39 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50FGn75K028629;
 Wed, 15 Jan 2025 19:37:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VMX1N/aUdcAoeeC7nJbcJsZQLuf4pYhg20bDkei+AFs=; b=WHF1GUT6yuSgUVFV
 4jA98xnaaJiq+fn7YbwHm0sbDXBwdXOdQ7OGV+EJcrddfblNGcKujD4+8rP0t+fD
 E8tfGNfrEJItVBvXfer/cDMXgAsFg640RtbAdCZoa1oC9Ud+67+Dec5eloW7A1sj
 CFCt5HcNYW52L2Wix5j3r3B2HPkTHDNfAclIwBiNmf2TtUI+lD+6YuDZBqLRhA79
 HFe9ji1meEsUVcsdUxkHbxa074MzOH785WjWfjME4/i9+E7BxWOpSRazDs9MX0ik
 Mq6PhjivakslzH3sHZcdlV732SpgHOZPVjZt4cTC7P169wBaa/EOg8unzOt/h3pI
 BeZTXw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 446fgm0mfj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jan 2025 19:37:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50FJbRn5013137
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jan 2025 19:37:27 GMT
Received: from [10.216.6.163] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 15 Jan
 2025 11:37:21 -0800
Message-ID: <837602a7-bbd5-4436-ab9f-2b101bdcaac2@quicinc.com>
Date: Thu, 16 Jan 2025 01:07:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/4] drm/msm/adreno: Add speedbin support for X1-85
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Konrad Dybcio
 <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
References: <20250109-x1e-speedbin-b4-v1-0-009e812b7f2a@quicinc.com>
 <20250109-x1e-speedbin-b4-v1-1-009e812b7f2a@quicinc.com>
 <356986fa-e66c-4e78-ab92-2593b037ab9a@oss.qualcomm.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
In-Reply-To: <356986fa-e66c-4e78-ab92-2593b037ab9a@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: sz5wgI1OCVZRQTIWSHcuOf3JVE7IGo0q
X-Proofpoint-ORIG-GUID: sz5wgI1OCVZRQTIWSHcuOf3JVE7IGo0q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_09,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=986 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501150142
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

On 1/9/2025 7:27 PM, Konrad Dybcio wrote:
> On 8.01.2025 11:42 PM, Akhil P Oommen wrote:
>> Adreno X1-85 has an additional bit which is at a non-contiguous
>> location in qfprom. Add support for this new "hi" bit along with
>> the speedbin mappings.
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  5 +++++
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.c   | 15 ++++++++++++++-
>>  2 files changed, 19 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> index 0c560e84ad5a53bb4e8a49ba4e153ce9cf33f7ae..e2261f50aabc6a2f931d810f3637dfdba5695f43 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> @@ -1412,6 +1412,11 @@ static const struct adreno_info a7xx_gpus[] = {
>>  			.gmu_cgc_mode = 0x00020202,
>>  		},
>>  		.address_space_size = SZ_256G,
>> +		.speedbins = ADRENO_SPEEDBINS(
>> +			{ 0,   0 },
>> +			{ 263, 1 },
>> +			{ 315, 0 },
>> +		),
>>  		.preempt_record_size = 4192 * SZ_1K,
>>  	}, {
>>  		.chip_ids = ADRENO_CHIP_IDS(0x43051401), /* "C520v2" */
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> index 75f5367e73caace4648491b041f80b7c4d26bf89..7b31379eff444cf3f8ed0dcfd23c14920c13ee9d 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> @@ -1078,7 +1078,20 @@ void adreno_gpu_ocmem_cleanup(struct adreno_ocmem *adreno_ocmem)
>>  
>>  int adreno_read_speedbin(struct device *dev, u32 *speedbin)
>>  {
>> -	return nvmem_cell_read_variable_le_u32(dev, "speed_bin", speedbin);
>> +	u32 hi_bits = 0;
>> +	int ret;
>> +
>> +	ret = nvmem_cell_read_variable_le_u32(dev, "speed_bin", speedbin);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Some chipsets have MSB bits (BIT(8) and above) at a non-contiguous location */
>> +	ret = nvmem_cell_read_variable_le_u32(dev, "speed_bin_hi", &hi_bits);
>> +	if (ret != -ENOENT)
>> +		return ret;
>> +
>> +	*speedbin |= (hi_bits << 8);
> 
> Now that we're overwriting speedbin, we should probably have some checks in
> order to make sure somebody passing a too-wide cell to one of these won't
> result in cripplingly-untraceable value corruption
> 
> I guess we could just introduce nvmem_cell_read_variable_le_u8() and call it
> a day?

X1E is an outlier here, because this was fixed from the next chipset
onward. For newer chipsets, we can use just the "speed_bin" node, which
represents a contiguous 9 bits. So, just do a "WARN_ON(fls(speedbin) >
8)" here?

-Akhil.

> 
> Konrad


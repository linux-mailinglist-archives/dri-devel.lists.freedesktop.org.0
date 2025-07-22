Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C60DBB0E56B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 23:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9384210E062;
	Tue, 22 Jul 2025 21:27:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="i4eGadaE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB3410E062
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 21:27:25 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MKUFMF008748
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 21:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vIRMyOj74xnjmIGlTF15NUrmR7tJtt8RXTZi6qjqdK4=; b=i4eGadaETKA8GevF
 g8LS9pXNQYd23p8bX+ldZHKJhcWlL0d9ept+1FFmaI16n26+pTn70oeXSPxM9sIR
 Em97/j9i2N4yKGsEJJiqMywPr/SUMwkLTAmEXUtW3X9I2/zDd1nSMi7ymebV+jT2
 Cmc2o5GNsQV82LFrBdfl6ZRfMnfL8Bzd1efodvqBGWbX/TVEuLjZj5Rc15wRbXyA
 9RohE6+kzgVD+zk/I0+KSI8XXobWqva7rVhs4v/AnOOqj2UVOlRXwfpvoFZXeV+U
 RRY15cEverwJvj6I7hF0OtYUHHNbOQpDhKIahlgEzwK0WktqRvjJgYmDN1XENsRP
 LOIX/A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044djrjb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 21:27:24 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-74943a7cd9aso8925071b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 14:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753219644; x=1753824444;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vIRMyOj74xnjmIGlTF15NUrmR7tJtt8RXTZi6qjqdK4=;
 b=Ht8VBgIwF0eCuMm3VDSZFD4nbG/0I5mYxuBTTMkMFaFRcakDpoW+5Jmpeff3TP6wYe
 8vMJ1mpEMmLkCqcRoWp4wf71pl9/5uSaoDjOeHrVk2RQi/syA7BuSBg3D05icED/8Bvh
 7r5J7ulOP/T1mBjP8sX+nIJrnDvTmPnXB3waypY9c3lWU79a7gKzq1ptjJZA6eRlwIaj
 FGCzMC+a/DE7LuMBFtcFQwdjUtAcPyt8w4EIE/LS+NZ7NM3KBfELA4ulfX5+b1COQw0Z
 cAurAygFKOCTXxo5fSY8UKng9TA1A+qBodGk/TC0XozP/m6BN/nZXSMHDCcmU6BH7j1i
 ZB6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUa5tADqghzc/Sjr8tPBWgMmfBvQFulMq9vkSwFTLKgQViI7Lns9/OxywhuhTX4hGETAIdCPSHZ9Sc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywqAsPCA9f40ZKlz38QORNj9G1ETcGCnzGGAuM8PJ7uabiyBx7
 ar/hPUgWYaWh5Ii9QZC6DJVmKph5V9ngIpco5zhcThjtt/lGqbcDvjEsqkPZeLJYHa+1HizBAPz
 CcPerhcWt9/sVvA9nm/Tnw8fVPIVX+tjqJITg5ZaTNtyUH5Obb3Jj5cbuFb4HsXQw/en++b0=
X-Gm-Gg: ASbGncsRmqIUGJA5VD0pSXlrQpv05ZRtE+P7rhckajbc98wJIBM3IZkyiDMuLYAu5rB
 T1J/cwrUe1bQsV4Lls5dgm844TeQCU+nQJGsl5eOOP2ENOHQP6HTzDFr0jnQn8bMLhomePWgDU6
 ziREdZxoDjAK0Ag6eJRhIosD6NnVJHfMdG3rJvuG5/K6k7AwIqpaEBArb3jWLb436OMBSwoOB+E
 7E0lvhXyq7XzoP6llFyi5ixChHRdosi9U0BVip9Uv1OyKAVcgV2C9XmYeMgg8WzNwIzsiWBfWoA
 H2h6u4qPdIXAfL8lVbwFQ0AHA12WPzEg5h3fz46zQJOeF3QYuKQI91SxpqojuXvT
X-Received: by 2002:a05:6a00:39a0:b0:748:f365:bedd with SMTP id
 d2e1a72fcca58-760356fc150mr908988b3a.17.1753219643649; 
 Tue, 22 Jul 2025 14:27:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbz6+fLhPKRFEyCulAvdJ+UL97bOqbxq7BvDDpud4yaUJ+lg5oggjWeRZLsXDpbvO5CSBbxA==
X-Received: by 2002:a05:6a00:39a0:b0:748:f365:bedd with SMTP id
 d2e1a72fcca58-760356fc150mr908961b3a.17.1753219643161; 
 Tue, 22 Jul 2025 14:27:23 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.235.133])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cbc6aab8sm8078213b3a.157.2025.07.22.14.27.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 14:27:22 -0700 (PDT)
Message-ID: <6472bc1a-9546-4cb1-85b9-d826f76ba9f4@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 02:57:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/17] drm/msm: Add support for IFPC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-11-9347aa5bcbd6@oss.qualcomm.com>
 <k653qq6a4xkvwadeum5kbr7cheje773vobehpzq33ec44vyxjj@vi3ekv4jwext>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <k653qq6a4xkvwadeum5kbr7cheje773vobehpzq33ec44vyxjj@vi3ekv4jwext>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=6880023d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=4dphQItTPUswyQvINXrzgA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=JnQl59jAsqm81Bwny3IA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: Uve5S7i17LZrHOAd15pNNRNfTPrRlwKa
X-Proofpoint-ORIG-GUID: Uve5S7i17LZrHOAd15pNNRNfTPrRlwKa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE4NSBTYWx0ZWRfX7QsQMRDjZZPX
 IUzNPN4hHxKYOOxo4BjKVbZbOIQFUb2NpkojOa5Rv8m9uLEChkYdZ+rZZaUD6jsCy3FRaJkuxOn
 +LuXBq8/Ozog7Khedtq6ejGpfU8sCJzSktggyfFyO6abprcWE5grHy8C3r8YUwrw5HgX9RWgP1B
 SSTdP81dHz4FhRepLfhFw5/QWwav/FxQ4O7hvyiGZv3eZ0HCobnaAv6HNeVYwnai8kTSPWPUd8A
 D3AEwDirPAJmw5iLQrPoPJGkong0FjGXkokhy5xGZ+2goZjzauWmCQJHqhWrLBiOENPnSmnmXHO
 jmOkhRtQY3qEFdqjcdsk1gOWILnOnQWDZfUPXDW7scqJc6FRxgRJG9GaGfPeORfTx5xLgnA0IM8
 b7nxX1arodj03R51JXPimwleanhUcM9IW3triK8H3OQZhtrfv2PvrXA0RgAlEBXgJJqhPaAu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_03,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220185
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

On 7/22/2025 7:19 PM, Dmitry Baryshkov wrote:
> On Sun, Jul 20, 2025 at 05:46:12PM +0530, Akhil P Oommen wrote:
>> Add a new quirk to denote IFPC (Inter-Frame Power Collapse) support
>> for a gpu. Based on this flag send the feature ctrl hfi message to
>> GMU to enable IFPC support.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c   |  5 +++--
>>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c   | 33 +++++++++++++++++++++++++++------
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
>>  3 files changed, 31 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index 4d6c70735e0892ed87d6a68d64f24bda844e5e16..3bbcc78179c1cf1bfa21ff097e9350eb2f554011 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -1961,8 +1961,9 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>>  	if (ret)
>>  		return ret;
>>  
>> -	/* Fow now, don't do anything fancy until we get our feet under us */
>> -	gmu->idle_level = GMU_IDLE_STATE_ACTIVE;
>> +	/* Set GMU idle level */
>> +	gmu->idle_level = (adreno_gpu->info->quirks & ADRENO_QUIRK_IFPC) ?
>> +		GMU_IDLE_STATE_IFPC : GMU_IDLE_STATE_ACTIVE;
>>  
>>  	pm_runtime_enable(gmu->dev);
>>  
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> index 8e69b1e8465711837151725c8f70e7b4b16a368e..20ade6b0558b016b581078f5cf7377e7e7c57f8e 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> @@ -21,6 +21,7 @@ static const char * const a6xx_hfi_msg_id[] = {
>>  	HFI_MSG_ID(HFI_H2F_MSG_PERF_TABLE),
>>  	HFI_MSG_ID(HFI_H2F_MSG_TEST),
>>  	HFI_MSG_ID(HFI_H2F_MSG_START),
>> +	HFI_MSG_ID(HFI_H2F_FEATURE_CTRL),
>>  	HFI_MSG_ID(HFI_H2F_MSG_CORE_FW_START),
>>  	HFI_MSG_ID(HFI_H2F_MSG_GX_BW_PERF_VOTE),
>>  	HFI_MSG_ID(HFI_H2F_MSG_PREPARE_SLUMBER),
>> @@ -765,23 +766,39 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>>  		NULL, 0);
>>  }
>>  
>> +static int a6xx_hfi_feature_ctrl_msg(struct a6xx_gmu *gmu, u32 feature, u32 enable, u32 data)
>> +{
>> +	struct a6xx_hfi_msg_feature_ctrl msg = {
>> +		.feature = feature,
>> +		.enable = enable,
>> +		.data = data,
>> +	};
>> +
>> +	return a6xx_hfi_send_msg(gmu, HFI_H2F_FEATURE_CTRL, &msg, sizeof(msg), NULL, 0);
>> +}
>> +
>> +#define HFI_FEATURE_IFPC 9
> 
> Can we please have an enum or at least a set of defines rather than
> havign them scattered through the code?

Ack

> 
>> +
>> +static int a6xx_hfi_enable_ifpc(struct a6xx_gmu *gmu)
>> +{
>> +	if (gmu->idle_level != GMU_IDLE_STATE_IFPC)
>> +		return 0;
>> +
>> +	return a6xx_hfi_feature_ctrl_msg(gmu, HFI_FEATURE_IFPC, 1, 0x1680);
> 
> magic number?
> 

Let me check.

-Akhil

>> +}
>> +
>>  #define HFI_FEATURE_ACD 12
>>  
>>  static int a6xx_hfi_enable_acd(struct a6xx_gmu *gmu)
>>  {
>>  	struct a6xx_hfi_acd_table *acd_table = &gmu->acd_table;
>> -	struct a6xx_hfi_msg_feature_ctrl msg = {
>> -		.feature = HFI_FEATURE_ACD,
>> -		.enable = 1,
>> -		.data = 0,
>> -	};
>>  	int ret;
>>  
>>  	if (!acd_table->enable_by_level)
>>  		return 0;
>>  
>>  	/* Enable ACD feature at GMU */
>> -	ret = a6xx_hfi_send_msg(gmu, HFI_H2F_FEATURE_CTRL, &msg, sizeof(msg), NULL, 0);
>> +	ret = a6xx_hfi_feature_ctrl_msg(gmu, HFI_FEATURE_ACD, 1, 0);
>>  	if (ret) {
>>  		DRM_DEV_ERROR(gmu->dev, "Unable to enable ACD (%d)\n", ret);
>>  		return ret;
>> @@ -898,6 +915,10 @@ int a6xx_hfi_start(struct a6xx_gmu *gmu, int boot_state)
>>  	if (ret)
>>  		return ret;
>>  
>> +	ret = a6xx_hfi_enable_ifpc(gmu);
>> +	if (ret)
>> +		return ret;
>> +
>>  	ret = a6xx_hfi_send_core_fw_start(gmu);
>>  	if (ret)
>>  		return ret;
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> index bc063594a359ee6b796381c5fd2c30e2aa12a26d..1135beafac464f3162a3a61938a7de0c7920455a 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> @@ -58,6 +58,7 @@ enum adreno_family {
>>  #define ADRENO_QUIRK_HAS_CACHED_COHERENT	BIT(4)
>>  #define ADRENO_QUIRK_PREEMPTION			BIT(5)
>>  #define ADRENO_QUIRK_4GB_VA			BIT(6)
>> +#define ADRENO_QUIRK_IFPC			BIT(7)
>>  
>>  /* Helper for formating the chip_id in the way that userspace tools like
>>   * crashdec expect.
>>
>> -- 
>> 2.50.1
>>
> 


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17696B2641C
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 13:21:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A23B10E851;
	Thu, 14 Aug 2025 11:21:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="euaRl9WN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87B810E851
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 11:21:44 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E9xknl024412
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 11:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BLzSrsvlz1k7U0IApR8xjk7JKOJ6PPWdleXZ1uW1ptM=; b=euaRl9WNX9NsW8OO
 /OnDGUTHnSJqOcIpM+ERPAffH9ircd+a1aV16KBhMT4nLYU3IUTZYcFK2Ba5wX3X
 JiGFsECAxEv2/+2SMItlzqgRzBVwLMjhLmjSTkal6gbFNc4CQADVf6ROuggcLd8H
 C95uH1jq3v48osVuu4V/eFVQ7KRqdQS3IRkJOSiu8sZkSKEPQ3b4IyWbAWYYYaHc
 3p8+495wNoO9fTXi3CLZX0xvipyJunroaaSz5rtcqhL2p+WCYNhHV1eMTHJdxMGn
 oR35uXiO0w/6UjeYURysgxKlSVUY70W6bUJMChqPC93F+cdmTYBpOjzewNWysabv
 bSnDWQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48gr9rv4hc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 11:21:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b109c38249so1919671cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 04:21:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755170503; x=1755775303;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BLzSrsvlz1k7U0IApR8xjk7JKOJ6PPWdleXZ1uW1ptM=;
 b=CPUw1FNjiuH/qdu8fCsDZilodHY2rPnyC4stgz8JW+MA/MCrAPJr3BnvjGDZl87rgp
 0mTW7djOJODdTv7cUVc7ZkpjQ2PUnjJznD523tUNZZ7M24kSd03DZ6EQKsUjRVB/BIYG
 lfiYVNYDL2M53zLeFPh9if7f+v9NFvFm+Yje437BtpetjYsL2wtXuFC6kSaFboQp+K1c
 ohUorH1MdseqbPzzv7hhXH9WluYOLnjZchUkn2IwBvGGul4EE9cHnYdlaCbLd+UG+hKs
 u0Be7blnSndWdLbEvWI8BAEGRqySO6n0wAL6pRAhSDtBB/3NWoHDWZAh1prBHxXhj2TV
 RG5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrC8dPpxXPgtv8sTUzT30ZHRh56qOy+u8rXaB0Bjp1E6+2nSZaz8CbzUuMcgwfxJ6RCd2VcQcQxiU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKL1RWBL+QulXVJn6xdYGcsAISRxbHyIhRF9EGE4A5XlhY+esC
 y/cFVVBXm4hsUfeQBoxw0RrJXhjaGUWne6S2c9T3oJBiYqS3xXT/bdqRrBUB5LavnqhUnIha09t
 2x3m6E52jPkHX+BV4/GigdJ60n9+2ufdtKKbFEWOSpOEcneDgV8lCUy4G13Mh4twzntkMeMQ=
X-Gm-Gg: ASbGncsGXIQ/n2Jb1XCAdPHWizD7sllEHo6iKeWTgwUlSyiaL32XtITfw0nl+z3I8R1
 OpntZO0TE7tgNN3PB7G0l3I1WNvmCH6d9R13jHcR/dLQAahEQtafyVZ6Vb1jXd1kBwVvZCTQuQt
 hcPyu/ZR3RiHnCErmJlrmJFewgrz9eU4Rcer1Q4Z/UY2HwxZ4AQnkSubP2yXdRNqecZCh778LSY
 avdTAAW7+gFKYjLOwnPwNrnaRJc/KauaS6tPxvKm9fqF57cmV8OOlZvxA66nHjyvPefCcBz1wtl
 iKNPD3Nv2JyC9GpdCUDcWeXiFCBkxfpKKKXkj9ExzQ1vEvanpSWXsPago2YBLBmaLSNtVBoVTir
 3KoVkNsfVhIiX045hVg==
X-Received: by 2002:ac8:5a0d:0:b0:4ab:723e:fba7 with SMTP id
 d75a77b69052e-4b10aa82b70mr16850371cf.7.1755170502735; 
 Thu, 14 Aug 2025 04:21:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGvtOWlrpuz/iNQTwiGREwfxnYm+3vQJfqpP9BRWhj2V2vfmiGGO6FJVbo4wdvgDfBPNzUHQ==
X-Received: by 2002:ac8:5a0d:0:b0:4ab:723e:fba7 with SMTP id
 d75a77b69052e-4b10aa82b70mr16850081cf.7.1755170502199; 
 Thu, 14 Aug 2025 04:21:42 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a1e6cecsm2578916266b.70.2025.08.14.04.21.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 04:21:41 -0700 (PDT)
Message-ID: <33442cc4-a205-46a8-a2b8-5c85c236c8d4@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 13:21:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: adreno: a6xx: enable GMU bandwidth voting for
 x1e80100 GPU
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250725-topic-x1e80100-gpu-bwvote-v2-1-58d2fbb6a127@linaro.org>
 <e7ddfe18-d2c7-4201-a271-81be7c814011@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e7ddfe18-d2c7-4201-a271-81be7c814011@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDA5NCBTYWx0ZWRfXzpZTGsniRAjj
 FAo88pirX5JnxbUEfzZ3izxRY3j+xZje/FMNbr1xiUmJUKTNQ17TSbKqhNFyrXJfmRHbuMK2euV
 rM1LQd4I2YyY6c9FtdyLrtadg4gBxzQoURZ05emhTNOhrp2o10/HcAuP57QaiYGLfxOWx1zQ6hX
 xJFf+xDRlj9mrLO8U70GW7VvDIrV7XQtPUhbQTHEYxnwphUlYi7meuVXfnS6LvYlPnA1Axv9gfB
 IS0CgF2S3A565sR2mbSkUXnIQifD8cC0+2xJ5wtGfEZv5V+2vw51lLqTqlfSA48M9YWfoZVHO3D
 zqYfmAD2n9Wv/DiHGnqrBQGBieiQtzD/OGBB8u1NteOZBZK7O8N0vDNf42JaAloiMUDCpG0XTqc
 ejhTG+en
X-Authority-Analysis: v=2.4 cv=NIrV+16g c=1 sm=1 tr=0 ts=689dc6c8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=vBWWQJBIfp5UPC7yhvoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 1M53nXCrvVTv0RUqjfP52b5QHwRXxhqa
X-Proofpoint-GUID: 1M53nXCrvVTv0RUqjfP52b5QHwRXxhqa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508130094
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

On 7/31/25 12:19 PM, Konrad Dybcio wrote:
> On 7/25/25 10:35 AM, Neil Armstrong wrote:
>> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth along
>> the Frequency and Power Domain level, but by default we leave the
>> OPP core scale the interconnect ddr path.
>>
>> Declare the Bus Control Modules (BCMs) and the corresponding parameters
>> in the GPU info struct to allow the GMU to vote for the bandwidth.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>> Changes in v2:
>> - Used proper ACV perfmode bit/freq
>> - Link to v1: https://lore.kernel.org/r/20250721-topic-x1e80100-gpu-bwvote-v1-1-946619b0f73a@linaro.org
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> index 00e1afd46b81546eec03e22cda9e9a604f6f3b60..892f98b1f2ae582268adebd758437ff60456cdd5 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> @@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
>>  			.pwrup_reglist = &a7xx_pwrup_reglist,
>>  			.gmu_chipid = 0x7050001,
>>  			.gmu_cgc_mode = 0x00020202,
>> +			.bcms = (const struct a6xx_bcm[]) {
>> +				{ .name = "SH0", .buswidth = 16 },
>> +				{ .name = "MC0", .buswidth = 4 },
>> +				{
>> +					.name = "ACV",
>> +					.fixed = true,
>> +					.perfmode = BIT(3),
>> +					.perfmode_bw = 16500000,
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Actually no, BIT(3) is for the CPU (OS), GPU should use BIT(2)

Konrad

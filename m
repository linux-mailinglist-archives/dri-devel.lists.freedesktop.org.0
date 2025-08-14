Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CD9B26424
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 13:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD1810E0EB;
	Thu, 14 Aug 2025 11:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GGcXKh22";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A25F410E0EB
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 11:23:02 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E947xC021036
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 11:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hQ5Wn1+6Fv1oHRCInTDg/1OC1hdkSifC03+smNxA01M=; b=GGcXKh22d5t6Y/hu
 Vnko01d0Da6qxSaAjur0KGPPQda6XnxoR7i+LibZQajlTvkayG5Wc7HFJ1yjfmFd
 P+W/841Ql8xanTNz3ENCTyRRifmykpfzP6oB3e4yFIADz5Nh5j7V/uK4JBNsgTk9
 juvSCflvG6GmuryIbM0ogM84mVsle2Am5+lNiVtNpMIk0CTCbnEhm+ZOXdCjghLv
 VSBKbFJqR3J0FRxNTW5iKOBWTXA9CAHqzDmgdmuDh5kApFQOSYbrXGSDOp1gNsZY
 KDuPH1v/y9ZayTBIgPT0coD5MU592ju6lWDtjG4e7ezbn9488KW3+f8h21L4Vz4i
 G7mnLw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g5hmff77-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 11:23:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b109cb7ca0so2567441cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 04:23:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755170581; x=1755775381;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hQ5Wn1+6Fv1oHRCInTDg/1OC1hdkSifC03+smNxA01M=;
 b=okFRvcwwFMbh98+K1eLskoSaKZXhMdlcCQqZXlgwz+hxLKK7m3D3DeryhvbZ3AQNQV
 +2TFokH5fO05wUC9Lk8bIW7dxsyOpQ6MxZ8PH7CPqZLlUovtbyGbLp3OgfRaqXWvXJ8W
 zkGBeXx+QzxD4E3iSOpj+7JHXcOoWCaCWj3SvN51j6qljaxiT8/7pDgWKC7qJjDGpjIX
 JZIhPnxVaaBGuqiDEJNmdoL4NMPrgRCRnOOMIfXwbA6xiq6uYN0LkLty8rwM/eHn4Gvx
 Av6g4zAiKDuXZzZG/wENkXOjcESdI2iudlkFXNcPA3XMcWPs1EGS+o92P+w2ra+8k9Dg
 mWDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVt0gO5eb5vDvo0FJQpt+JkxwRkjWvIG/9fIMll/l9AU0KsrBr6GsyGyFFUt7X1FLHeMnvLpxxd7nU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHqGon6b1VNngu7JZAv90M+Zs92VZQ9K+D7yRIkZV9GlkN/3VN
 /iNyDS0RTJ/v+PhFRFDv2kLg1GqktGaAzaq/P5kRz/wFvkDqo5sDR1aa3lLXS8CjubPKoMTz0R/
 HD9Llu6aAFVRj/0HcKiGaWo8+USz9qC/9pAa6MOdk6uyDiCqsd0Jx+wahb5Ho4Q7nUN1Mxlo3f+
 sUsTs=
X-Gm-Gg: ASbGncugDNkdw+zHRnq1CptNfIPFsur+LFSoP8KgdzF7TE/801dtoRVYFIWz1eMJqmn
 co1TeFKvRIWvdG4O2b61Z4I/AhnOU+pP+JlDI8Oq7IRMtjoVqgPNFOLIBDjlYBz1yTx4lvymndE
 yBFfQwUcOQGBON4/E+MMGeSp93ejF55zxHhdG+iqtsp8ScQWPV53hgYeYIs8uybUnwFBLGsBz1V
 +81bcPE0+DEIQeVFOAgSbh5ISvUF6ii0RwxH3xlRKlMiERp9FhM1h14AvVgexrolT2KmVoNGGOB
 rHUucYqhNAsg7LAl30sLKM0X5neN6KBzPZxwL4Ze41hMcWJe/dJsv8baAuov53Q7PXwwKHBCtPV
 Od6g4xsgLORn35AJaBQ==
X-Received: by 2002:ac8:574a:0:b0:4ab:6d02:c061 with SMTP id
 d75a77b69052e-4b10aa79245mr17184331cf.6.1755170580415; 
 Thu, 14 Aug 2025 04:23:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBEqH1INBenomIkNEpLsnsD1vmfMViwj5vT13W7Lz3WQ/KCQYzoIaA6pCulkVk2wkfvE/B5Q==
X-Received: by 2002:ac8:574a:0:b0:4ab:6d02:c061 with SMTP id
 d75a77b69052e-4b10aa79245mr17183881cf.6.1755170579781; 
 Thu, 14 Aug 2025 04:22:59 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8fe7995sm22946026a12.36.2025.08.14.04.22.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 04:22:59 -0700 (PDT)
Message-ID: <b4f283ce-5be1-4d2f-82e2-e9c3be22a37f@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 13:22:57 +0200
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
 <33442cc4-a205-46a8-a2b8-5c85c236c8d4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <33442cc4-a205-46a8-a2b8-5c85c236c8d4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDExOSBTYWx0ZWRfXyHIm88C/ipo0
 HSrAyz8KNWRWFLw0CfnKTdcGvIg4+Kysq0JWNcic5bFf6rGFpKIIKqlTT1YAuvXvaDt6W7rIAj0
 /OG8xzLwzCQpoP16oPi/+c7Cncd18gqRJPTHh6Lb0AEJT4cpYZQWJqh4LqqjOtu5GORf/kMJXp6
 ASZ8guFanAftBrUZ/njjYXu/1vcvFvQf4VUXpaBzwu9ZzHzKQsD+ZnD+69y6L/rys/nyWN+dIR/
 uCdev5CQO2Vi9UDufH2uQiNP7YOzZFKXsXPXgefBnpfAqshwaJ5eMTURx6suoP7fytE3hpy/XyY
 yjnv6MTi6yX2KpUB8fHWhS3gtvQlCJHp23lhsq5R/hLFkXSQ4bMq01a4TOFwDQHToXIbmw0g6pn
 lUWFSZdJ
X-Proofpoint-GUID: UzBcVitJS-xSF6WLIP09dOs0xILnEVc8
X-Proofpoint-ORIG-GUID: UzBcVitJS-xSF6WLIP09dOs0xILnEVc8
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=689dc715 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=w8v9NIqJ3aMQWT92luIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120119
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

On 8/14/25 1:21 PM, Konrad Dybcio wrote:
> On 7/31/25 12:19 PM, Konrad Dybcio wrote:
>> On 7/25/25 10:35 AM, Neil Armstrong wrote:
>>> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth along
>>> the Frequency and Power Domain level, but by default we leave the
>>> OPP core scale the interconnect ddr path.
>>>
>>> Declare the Bus Control Modules (BCMs) and the corresponding parameters
>>> in the GPU info struct to allow the GMU to vote for the bandwidth.
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>> Changes in v2:
>>> - Used proper ACV perfmode bit/freq
>>> - Link to v1: https://lore.kernel.org/r/20250721-topic-x1e80100-gpu-bwvote-v1-1-946619b0f73a@linaro.org
>>> ---
>>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
>>>  1 file changed, 11 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> index 00e1afd46b81546eec03e22cda9e9a604f6f3b60..892f98b1f2ae582268adebd758437ff60456cdd5 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> @@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
>>>  			.pwrup_reglist = &a7xx_pwrup_reglist,
>>>  			.gmu_chipid = 0x7050001,
>>>  			.gmu_cgc_mode = 0x00020202,
>>> +			.bcms = (const struct a6xx_bcm[]) {
>>> +				{ .name = "SH0", .buswidth = 16 },
>>> +				{ .name = "MC0", .buswidth = 4 },
>>> +				{
>>> +					.name = "ACV",
>>> +					.fixed = true,
>>> +					.perfmode = BIT(3),
>>> +					.perfmode_bw = 16500000,
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Actually no, BIT(3) is for the CPU (OS), GPU should use BIT(2)

This is *very* platform-dependent, goes without saying..

I see BIT(2) is also valid for X1P4

Konrad

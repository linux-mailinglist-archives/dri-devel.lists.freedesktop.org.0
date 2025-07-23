Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5E2B0FAEC
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 21:28:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651EB10E186;
	Wed, 23 Jul 2025 19:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="elUwVCTn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1601810E010
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 19:28:17 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NDxPj6002922
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 19:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dEPpLzKeqJu3UReNaIbyKoLWpwho+WecEv4aP5Gr93U=; b=elUwVCTnep5AeAwR
 IfdVXJzHyJ2j2YgDwvf1rBvHu/pxSLcxLziXZCTqqiJ9dI/AT6ToBgaOshOrpn+L
 txNNOcZj3Y3xqR7XHI7Pahh2yCvF9jgxjw1i1SoNbHBXMsy7SFFjaeyXAn6k4BKN
 Su2tXNx9Nw4tyrJmd1mNtBbILBr41h+t8Z99oUwGFeANTHrhxnytVFqduPV5eVZ5
 2o2odGpxZb7gDxdBDTp4Q8RGJewtZNPx27ZxxQmQ4an6kXeN65b2TB2i/t5N3OlV
 8AJxOh+HLUTcgLhF53DVLiOa6Y/JsbFPT3hYNkcHTc98NDBkrx1dwLuY+Sw1hgGx
 xhibXw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48313kgy21-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 19:28:16 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-75ab147e0a3so360596b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 12:28:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753298895; x=1753903695;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dEPpLzKeqJu3UReNaIbyKoLWpwho+WecEv4aP5Gr93U=;
 b=KzyPxW9XNo1bLsjCSwECRuZUV6yaQ/1TzwXEYfYWCaEq4nRzhES6gfvZe+7ijySfpE
 yMVTjIZJz4SSS7ySlYKBtgt9oMn7sV0Uurs0oxTbd5s5sDwkam5eUHgdgnHCUonpRimR
 Ur7m97pE2Sy5IB0OFcWSQ5OwWJG0643kxYWhQtqCGeNPf+R+kkDW+U8q779D1puer+zK
 nX/QJV5kXZ0+2So05xsVdkq4oBa6n/H0mqpxPAU6kGeIZrFYYW2URoXZFZLof5/w8rC/
 tknqGwvloM5vl62WaInS2LuJV/FUY/RFzgPJyaF69jHz07YvI50VcqyRn2C/wOU1IQoh
 4m5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1+TkGyZrUutspbHUR14rnx1R5gqZo8Eh/ydtnLDOSP/ankznksTP5YBCniQcxBi/HEPKzqSO9CNc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSWjvXy12uixpRlmzE9HRTE4Z4Fw7zn72FXBz543lVvl/dpobE
 HOlVcSEtdPqN4rIvqpTiCbZw+zWdX6wHZMhMN8rEvB8NiS1RbQJlsRunp6vQE8TCW00nTROsbKE
 xedE4ILaThTOyt+Cf9wlEJ6ONw3Yh6oXEyvuKM1KFxgUYIaWV6oz8SAQnwBv+8tvbl5YdzeM=
X-Gm-Gg: ASbGncuyRzRMALJ0dLA0JmtKnch8Cc2MpBmLJVG6j3sb/8BthydGtdXc5f2JoLq0c2O
 67JZLPSVORW34y4cwjaNrxd93nmhJOrLe6upEmWsv4E510FS0PnhC5Ax7ni2JCVFJij2+iIcukM
 OapK2p6JAleeJJ0IVpZfUyJWmaOk5dayiCPzGvKXcQ2+oAmJ3Du+Ff8OJawvKV5EDRi1CTXZvBw
 aJkzhgDmnipOk27tTbfEYoGhPklXndMXD6UUUpqPX3bzrEiX3WOP/GdDmKS1vHajfI3/L6Db9fa
 UGMuMODR+LP4yRnbeOJw8AFA1Mwi9DcAChskBI2uvSfdtazIQaY4WSAf1IAew1AU
X-Received: by 2002:a05:6a00:92a7:b0:736:31cf:2590 with SMTP id
 d2e1a72fcca58-760353f2759mr5979855b3a.16.1753298894788; 
 Wed, 23 Jul 2025 12:28:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1De95jDWxBiK1YfH4dGSVrP8HoJa9rCXrriSg+jAMFq+zrcKp1RL82O1tROQaZFGCKLlpkQ==
X-Received: by 2002:a05:6a00:92a7:b0:736:31cf:2590 with SMTP id
 d2e1a72fcca58-760353f2759mr5979825b3a.16.1753298894278; 
 Wed, 23 Jul 2025 12:28:14 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.235.133])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb974ca5sm9973140b3a.131.2025.07.23.12.28.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 12:28:13 -0700 (PDT)
Message-ID: <002eb889-87cb-4b8c-98fb-6826c6977868@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 00:58:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/17] drm/msm/a6xx: Poll additional DRV status
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-4-9347aa5bcbd6@oss.qualcomm.com>
 <9778efad-e9a8-4934-9b70-b0429bcfe63e@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <9778efad-e9a8-4934-9b70-b0429bcfe63e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE2NSBTYWx0ZWRfX8hrRnJpR6Krb
 HpPyW5akUQFi3DkGEGo7A3E4ro6zptCwtOiCUd3hIHNbyp8+RRccmxTdCpQqvJzG599QAtn3PCZ
 VJ6jflBewu6xqN+j/Rd0j2Xy5b6GHfMMh1OkfzIu73GmPFVzPr1TrvCdKb5A4B3wT7RNIAtoHnr
 kuYHjkccKkITxLsIIKDikmKLWCeowsil9Lv+CPOBmC9A8y4JuZd7OQtX4nUiFLac5ipStFFKzaL
 BD8B3nzErse6vg+8xL1nrdlwafR4BTBO149Ps5RH5VFJOqQuPpfREqn/GnEQtTFyYnmi6WYvXfX
 9KF6kuYtfG1jGSXT9le2WTmJyAQlu8hGG2MbSXjNY8gFuR1HxhdBwCLqUorNahTQfw2WC9PZQtO
 yBJ9chrDrMU69wH+0rGvUN2/UWgro59GMAs9sGcPtaV8lswULmjlUms3MRe3qcqGv+134bGg
X-Proofpoint-ORIG-GUID: UlYTYMoPN8VHlSkI8-jfN-00uRbUfNe_
X-Proofpoint-GUID: UlYTYMoPN8VHlSkI8-jfN-00uRbUfNe_
X-Authority-Analysis: v=2.4 cv=C/TpyRP+ c=1 sm=1 tr=0 ts=688137d0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=4dphQItTPUswyQvINXrzgA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=f35hG6qQLWE-6-FZ_2MA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 mlxscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230165
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

On 7/23/2025 3:31 PM, Konrad Dybcio wrote:
> On 7/20/25 2:16 PM, Akhil P Oommen wrote:
>> A7XX_GEN2 generation has additional TCS slots. Poll the respective
>> DRV status registers before pm suspend.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index 790ef2f94a0b0cd40433d7edb6a89e4f04408bf5..3bebb6dd7059782ceca29f2efd2acee24d3fc930 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -987,6 +987,22 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
>>  		val, (val & 1), 100, 10000);
>>  	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS + seqmem_off,
>>  		val, (val & 1), 100, 1000);

1000us here is a typo and I copied the same mistake below. I will update
all of these timeout values to a common 10000us in the next revision.

>> +
>> +	if (!adreno_is_a740_family(adreno_gpu))
>> +		return;
>> +
>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS4_DRV0_STATUS + seqmem_off,
>> +		val, (val & 1), 100, 10000);
>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS5_DRV0_STATUS + seqmem_off,
>> +		val, (val & 1), 100, 10000);
>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS6_DRV0_STATUS + seqmem_off,
>> +		val, (val & 1), 100, 10000);
>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS7_DRV0_STATUS + seqmem_off,
>> +		val, (val & 1), 100, 1000);
>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS8_DRV0_STATUS + seqmem_off,
>> +		val, (val & 1), 100, 10000);
>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS9_DRV0_STATUS + seqmem_off,
>> +		val, (val & 1), 100, 1000);
> 
> FWIW there are places downstream where it polls for 1 ms
> (gen7_gmu_pwrctrl_suspend) / 2 ms (gen7_gmu_power_off) ms (as opposed
> to 1 or 10 ms here), but the timeouts are all the same across registers
> (unlike TCS3 and TCS9 above)
> 
> Ultimately it's a timeout, so a value too big shouldn't matter, but
> let's make sure the other threshold is ok

They are fine. We can try to reduce the timeout 2ms in a separate patch
outside of this series.

-Akhil.

> 
> Konrad


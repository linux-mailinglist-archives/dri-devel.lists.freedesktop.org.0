Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CF0B494E4
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 18:15:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE01810E18B;
	Mon,  8 Sep 2025 16:15:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YGR+v37m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 185B210E55C
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 16:15:44 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588FxPv2002481
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 16:15:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 W+lj6aPfl5dZoF2x7IkapYfFT13SWsFtQnlB9wrJWSQ=; b=YGR+v37mAwfyFLEH
 Q83puvX9IsZF23SzkmHh9E+TQPhJU0gl1gbDB8JchzRVG19xB1z2u9kEBwbhBqdP
 DiKdmftSYEPBSdwiMtFdv4WduYNk/KNwqdZRqns3oqAr49I2maswNVw3HXKYtuJc
 3A7A50ZUpoVni/CqgeutrJ7RLj0J48pHKlJVLKzk8a4OiqXKcQUfmrZDkhtUPH+J
 yeOlFB8k5UGhOw7XmbpTM43WChS/ESBav/5YEa+PbVQvDDiR9yA+CbSPMfFxKHkI
 tzU6NIDmTFSPuG731azwV5UDqGAyesSyn3v7M98pUcJeJ7Ikj4udPOX9dIa0xbJn
 vvRXUw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8d7r7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 16:15:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-32b58eeb874so4296709a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 09:15:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757348142; x=1757952942;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W+lj6aPfl5dZoF2x7IkapYfFT13SWsFtQnlB9wrJWSQ=;
 b=VHDT1rHiHHrQy8zHDhUZN/mgkqukR+DgxMl/Ae0Mk3t+GtWKPgsTop1t27ONElL65z
 qpH6RvR8pjJ0fBKtg5zzpB09oJjMyqINS5i1Sluf5453DcPgr416vjqwFpzq0dDHhMOG
 F4WgVJzn+uhQg45f+7xAXdphcP6BVq6cLlIi4Et6c+HpDx3LTquMs40+jFQuW2uiVDXb
 cHXgmipLuT0yEKS5UdyIH/CDRVsyI8AjVOGrOG5eSClhRFd444fH9KYt+11mZCsSN7hJ
 qcddXpT+6CZuRlX5uH91539zkMD9JSCU6QAW2c/UG2A97AFUm7shcbaqi+AKw3Z500w0
 oyyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbF1Lo2+7MY/QETfFTnnM+qMJRf13KaOTLgL5AWLnXZFubeMH4aw8Izjb1Rz00wfUrhV/HNG2JB+I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUsJ0p/5FJrPh7ISGM0HF+cRIZiisOwRLy1bDI6iRsOw2RauqT
 pCrBHQLNI/gNaXd65q5ePFcubViysINr9MnbBVybwPfzWc9i1plvpnO1LArUtrl7RBLPtcfT/hL
 II84VY6hFsyu5tOAYUpe+dQkdj3c0fdHvHUlVXWeV3NtZmdoS6l4Ejis/1fT7QjfsrCPLAsJmen
 54sdA=
X-Gm-Gg: ASbGncsPsl9rKf4IIA/46e1lFUDZiogXEzzy69h0IWKtiXY5OGQuZ9kuc8nYnMEnk2B
 yo7uO96mXMgPMQckeADkqO1a/EQ5BJeRywKK6BnTFnfSbeAYsD+XcSoyVNeAPuu8CZVyxTgYGlA
 +WVPheTxaulJtLVCat8GZeX/+kketynp5gMNHmpG+hEVdLbmiW2LoTkKAkzXZ35v2L+YRAVgImo
 AM2TiqFLKxIocpNgaBRgUXuUcDmLb029Det1ym7UsS1TxLer9ICjW4uYAV1SwtP7GQfuXf72iED
 l3SFdYZRp6T57kBHZM3G0kLgJA4GS30CtFHdakudyO9i7Sa6HXak4BdTvpkVlg==
X-Received: by 2002:a17:90b:48d2:b0:32b:cba3:6361 with SMTP id
 98e67ed59e1d1-32d43f76b78mr10340167a91.26.1757348141351; 
 Mon, 08 Sep 2025 09:15:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZF1OPxZnSURBZkaB/X4pj0b/Fs/TUocy/fiORRAwfDENjJPxq3DAYNP2im4uK6ps4zcHOGQ==
X-Received: by 2002:a17:90b:48d2:b0:32b:cba3:6361 with SMTP id
 98e67ed59e1d1-32d43f76b78mr10340134a91.26.1757348140791; 
 Mon, 08 Sep 2025 09:15:40 -0700 (PDT)
Received: from [10.91.118.43] ([202.46.23.19])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32b948d5471sm6213558a91.3.2025.09.08.09.15.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 09:15:40 -0700 (PDT)
Message-ID: <ae32a704-025d-443f-bc03-fd8c6e5d3acd@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 21:45:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/16] drm/msm/adreno: Add fenced regwrite support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
 <20250908-ifpc-support-v2-7-631b1080bf91@oss.qualcomm.com>
 <59ac7827-6258-4268-8b71-4cbcbad859db@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <59ac7827-6258-4268-8b71-4cbcbad859db@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX7n9D36XH2gNz
 5cs3i2r+T1STknoYbDDEUsxcUe4GzkwzivD1B6mFtd4/7myKjMa0nAL5FunVX7SqU0Hn/0sKaks
 b75ACdbz8UU+kXazT36YCI0Ze7HF4UQ6VlG7OLaBc5lHW3GoqNbEnYL+2NzTYblRRSuwmU3FhAa
 KBZvlOQKYsHGQoqAmJ+TSHA2P+7ebPwIeEJZWibff3Y9kc3QSrTtfhaEd39DcNU+Gu66if53R7n
 Vm4eLxBDd/GOymS3mukmIYKSY9fGftpiYDbz7Ud2AaQN7c1i/gZnFIcAUObXHL28wTbmNGfLLH1
 wtRrY4L3+w7VyC+DVrX15LHbRlX52HQQCD9s0fcvObzLVV2sYH3hU15IVrt7/gv/QFIx6oxmWRQ
 kqiNcmvb
X-Proofpoint-ORIG-GUID: Qp_jRwXyNJe9NSSTRWmT4JCQSwdLBDDv
X-Proofpoint-GUID: Qp_jRwXyNJe9NSSTRWmT4JCQSwdLBDDv
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68bf012f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Npwa9MXoYRiG9O3kBDcA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031
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

On 9/8/2025 9:07 PM, Konrad Dybcio wrote:
> On 9/8/25 10:27 AM, Akhil P Oommen wrote:
>> There are some special registers which are accessible even when GX power
>> domain is collapsed during an IFPC sleep. Accessing these registers
>> wakes up GPU from power collapse and allow programming these registers
>> without additional handshake with GMU. This patch adds support for this
>> special register write sequence.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 80 ++++++++++++++++++++++++++++++-
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 20 ++++----
>>  3 files changed, 90 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 45dd5fd1c2bfcb0a01b71a326c7d95b0f9496d99..a63dad80ef461da45d5c41a042ed4f19d8282ef5 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -16,6 +16,84 @@
>>  
>>  #define GPU_PAS_ID 13
>>  
>> +static bool fence_status_check(struct msm_gpu *gpu, u32 offset, u32 value, u32 status, u32 mask)
>> +{
>> +	/* Success if !writedropped0/1 */
>> +	if (!(status & mask))
>> +		return true;
>> +
>> +	udelay(10);
>> +
>> +	/* Try to update fenced register again */
>> +	gpu_write(gpu, offset, value);
>> +
>> +	/* We can't do a posted write here because the power domain could be
>> +	 * in collapse state. So use the heaviest barrier instead
>> +	 */
>> +	mb();
>> +	return false;
>> +}
>> +
>> +static int fenced_write(struct a6xx_gpu *a6xx_gpu, u32 offset, u32 value, u32 mask)
>> +{
>> +	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>> +	struct msm_gpu *gpu = &adreno_gpu->base;
>> +	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>> +	u32 status;
>> +
>> +	gpu_write(gpu, offset, value);
>> +
>> +	/* Nothing else to be done in the case of no-GMU */
>> +	if (adreno_has_gmu_wrapper(adreno_gpu))
>> +		return 0;
>> +
>> +	/* We can't do a posted write here because the power domain could be
>> +	 * in collapse state. So use the heaviest barrier instead
>> +	 */
> 
> I'm not sure I follow - what's the relationship between the write being
> posted and the power domain being collapsed (i.e. the hw not being
> powered on)?
> 
> Are you trying to get rid of the delay that could happen between this
> write leaving the CPU and arriving at the GPU (which would then be
> woken up), so that the 1ms poll below has greater chance to succeed
> because of how these "special registers" work?

We should strictly ensure that the GX register write is posted first (it
could be posted to the hw or dropped by the fence hw). Otherwise the
fence status register (in CX domain) might incorrectly report that the
register write went through. Ideally, we should do a posted write here,
but we can't do that due to IFPC. A full barrier (DSB SY) will ensure
this ordering requirement.

Another motivation here is to align closely with the downstream sequence
which uses a similar barrier. It will be a super painful debug if this
sequence miss a register write.

-Akhil.

> 
> Konrad


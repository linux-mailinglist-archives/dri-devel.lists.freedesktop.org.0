Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19121B0EF10
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 12:01:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7923610E787;
	Wed, 23 Jul 2025 10:01:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="do/DoECD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC1A10E785
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 10:01:12 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9SGrX016061
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 10:01:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 02eNwnQSdZOrbqRzgnYfd2i6lrz8eYPVvEuITuHkMEA=; b=do/DoECDOeN90vpB
 KzWf4ibiN6N8XYYoDuyxMYCU5SUsmJVZcS3mPpqQsslsJjjplu5j8q7IRQBnT60P
 KOYIIKqpdpGL6d2hg71FmLCmxC7463Sstr1BHNgmXoQHZlfGLW3Rxf1KZ2ophO+2
 47olr6vATftjGZWXDIsUtTNNCu+qknvwkxbfm6YLpY1aEAjJkbX7mLhjp4DtDUZR
 mTKz2f96lME6KjCHSlkO+Yi7OqICekdFpbhIR2GlcvHPllDazIOBNM4zkCM9Hx1w
 2UZg9XUSGubuX1zWLjrykqkdTf9Z3cYBZHbNNTS7BEUs6XlCFuKBo3+6bUs9/q8O
 mwCCuw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048vb1sy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 10:01:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7e33e133f42so28383385a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 03:01:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753264870; x=1753869670;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=02eNwnQSdZOrbqRzgnYfd2i6lrz8eYPVvEuITuHkMEA=;
 b=kgrAG8lkIsX6J7xEifIfRhCZ60KVXB0Qz6zOXnSrxSesxgaC38eCpniJobkeloD/Yv
 TkscTtX+qsa7DS1JB1f0i6tQmsF7vXZeegI2O1tq2S1dBrhCt2EiyaZKEaxybZA6WeLL
 KtViLieRdShNSx5WhiyVguvZomFBfmERrtvuus5E3CcFnM4AYtQxSSARwTNdjAJo+asF
 HHzJWyTpPOWpKftcpyAPRp6DJ8DcLWvkYhL0hDrJ2kzV/vfDwJWpMYL/va5foKDsoQE9
 5OAhx16bCNFWznk75wCH+Ujm/yzPT9p0xchLNCf2GNio0GjFD4Cjm4z6lYIl3K7akVG/
 +UjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCULsJDrxE0TTuV3bQz7DN62s0GEYEovPgmRtPeNeBn2Mptsl4wzTnLI66QFsQUGBu5bcJSpD59+gGM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylzewGAXvfSoQASB6VBtyoUdRGEybdCIDeX+3NkVCj4F7Xghy6
 FhknHESGlyuSQYTTYTXhjXBmGezbP6DJRD7jQmj/DAannMFKqfROyrufzS5L8Z6quuwXpL1rRzJ
 wfmD2BgXnf/7e3hJau//EPnHDzHnkwWb1LojJJtis8VPr7vGrmUgwtMJy6/nVI29BsYe9OIg=
X-Gm-Gg: ASbGnctmwJSDeEXQeXN/g4btq05KNB1wI5q4lY+A7Rh9/nrgi5pCIVziuv/6OGZ43as
 3+jEDhOtC3+pvy3ap+vBUHodV7gmsUv2DYb6kV0gt6ngw6pGBLS9CxjKCSfI4R8SSjo5Qx0vMnE
 n8fR2B/Ec/FMOnedTetkBOzacTKrB0lDVEBl2bT0dSMs0E6YMcE4fTnIWr1OCLzahEkeHCa7IFX
 0gVymM+nULIHkFqz7R4sAOzPy8g8aQghspKHpxq2qbW6lCWVCZjzSlPhI3uw1YRelRoAckK0Nrz
 0kGow883Cw2Shf39xN37IwENrLU7gmNw0b3a4t8OjpV4z+MwEFCqCc4YX3y6kYnkgaK+Hx9gUHr
 6sD5HfZCVYW1Crsb6TQ==
X-Received: by 2002:a05:620a:9633:b0:7e3:3029:44c with SMTP id
 af79cd13be357-7e62a112c00mr102520085a.7.1753264869961; 
 Wed, 23 Jul 2025 03:01:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpCoJV9xj9Gc/I7a8P3qXIdiRSdG1vduKGp1cHjyO1PBWiyVBdxvbjxKAxdAdhWKfRMhgQ7A==
X-Received: by 2002:a05:620a:9633:b0:7e3:3029:44c with SMTP id
 af79cd13be357-7e62a112c00mr102517085a.7.1753264869322; 
 Wed, 23 Jul 2025 03:01:09 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6ca3005bsm1020602266b.88.2025.07.23.03.01.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 03:01:08 -0700 (PDT)
Message-ID: <9778efad-e9a8-4934-9b70-b0429bcfe63e@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 12:01:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/17] drm/msm/a6xx: Poll additional DRV status
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-4-9347aa5bcbd6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Cu5Dl2trijCwOveWZRV_s10W3P-qSJX9
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=6880b2e7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=45tQodLAf9T1fsO_g0QA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA4NCBTYWx0ZWRfX7sgjFYliZvkg
 x4q8AWy1a5pFyijkqejqBY/HPP2lqExB6LZ4bfKedQSzGe7pRIFeD6S0+doQeIKBNgtvWbUpYse
 kBYZawB3caYWCqBK5yt7Y1eaoaAmeFSakiteSt1iqKH7QXHCeEKeT7WVBP9ooPdemkIfW3WGyr5
 cnZywLdR1keuV3JRDYTK1mVnPoV5QKwR60G6+DnfxNF+fEQts15tfI2MS4+cNAURIAG/PNcEOYm
 tFN644ghvrjxyOEVpILz4KCc6GSe9fso/Ewea3a7ldv++5W2+k+BT6EU9aFTyhwlqiNAyG5GXWM
 TBg3dKQ1Ki15bIq4iaoH+wnlSx6g7/JiqECXIVXnNJCidDQo1jEe9LkDShv7T5PWUEHNaDZu60c
 p1O/bC/xAaPHXiGKFLgyUb1NDyKlMH59qOy2rvz1HV+Qn4j6+uV18uZLpVolyVdHNANlb1eg
X-Proofpoint-ORIG-GUID: Cu5Dl2trijCwOveWZRV_s10W3P-qSJX9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230084
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

On 7/20/25 2:16 PM, Akhil P Oommen wrote:
> A7XX_GEN2 generation has additional TCS slots. Poll the respective
> DRV status registers before pm suspend.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 790ef2f94a0b0cd40433d7edb6a89e4f04408bf5..3bebb6dd7059782ceca29f2efd2acee24d3fc930 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -987,6 +987,22 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
>  		val, (val & 1), 100, 10000);
>  	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS + seqmem_off,
>  		val, (val & 1), 100, 1000);
> +
> +	if (!adreno_is_a740_family(adreno_gpu))
> +		return;
> +
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS4_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 10000);
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS5_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 10000);
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS6_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 10000);
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS7_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 1000);
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS8_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 10000);
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS9_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 1000);

FWIW there are places downstream where it polls for 1 ms
(gen7_gmu_pwrctrl_suspend) / 2 ms (gen7_gmu_power_off) ms (as opposed
to 1 or 10 ms here), but the timeouts are all the same across registers
(unlike TCS3 and TCS9 above)

Ultimately it's a timeout, so a value too big shouldn't matter, but
let's make sure the other threshold is ok

Konrad

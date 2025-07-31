Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7776B16F56
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 12:19:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0960210E76C;
	Thu, 31 Jul 2025 10:19:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ptXNcbtm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A3B10E765
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 10:19:39 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V9fQaL027409
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 10:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gqP/D2mc8RmNlu9TpE5LUCbh7vx3tqZxEc4lxFUC8fM=; b=ptXNcbtm+uFqCgIr
 KbwxU6cwl7758BB/NFhsiopEmc1Tl8rGk3fQDYNV3ifl+UskRiMaJDv/i9nCmrUH
 rWmYZungI+4tH7ewQmuw3+ZHfsG9VxGjJsXWDkJ6SqhG/QyPJALZANk3ueBQwFqW
 Hjo4pfYOkMtEcIX6oOYSI2jlBUZdppqlhk00o3UlJVSqyZ7zwmx+UV1mQwMa7DrE
 8ihsj0DXQ1QuQ7tPEAaW3gVQwBJSZVn9CcH4+ARBxaNCP6mGWkW5khE58h1u3ln2
 h4WZsd88a88L6WL4wGSNEeHrNmoq/boYX+0VLCROGlMfEiH42uZFo27iTeBFnqoU
 mpPxmg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484mcrfh9j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 10:19:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7e2ced79f97so21763885a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 03:19:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753957178; x=1754561978;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gqP/D2mc8RmNlu9TpE5LUCbh7vx3tqZxEc4lxFUC8fM=;
 b=jSn7wpyikT1Rkv5EWDtbktfDGXXZxmoe7wcIYYb031/9HECif6g+p4ua01ryvTTCNB
 GCOOk7sIy1vFSAqOOIh0JahJs0Bszl/0HnahPjNMgtT4Xg1GVTdRYx69p2ucFAAvM319
 2tbCOaY49HB/NAA2wtNQcPv322GwXINWcwIH2TRK3f8hmakMRa4qkhEklxgvC553Tnc9
 DzJ51SS+5eHenhXLygAjCqsLcd0HJl9JdehTKRJhNKgHZ0iSZeNU5ZYx2DeUza8d8yuz
 v959FL7H9QGgjLbMM3i5KJwR3UdonAWuFfo0rZ14GN58F5oKnxLsFKywOmp0T4+4Xe76
 oB5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyejUvqkhA1QiPsXL1UV72ZRl5S/e3vqLNWzhcmV3ZLRzr6YFtLasIH4cM9qnwcSi4ZyhxHwcIvuM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWi28sAJxGYvkBioS3z7KLeNOoPIAIFViBCFdKKfcXE82KGSf3
 LQX5P3yK6yIJGqPdJzQhOcuR787vP1KUkpERmbyIF2/piZf+leQFZaGZk8F/s1jWJ64+khPoXs7
 P7eQEZwhMXgF4s79PdcFXU++7rCCM0jsce7UbE35cDlZuehU4Dic6wkKtZ7b+b1cpbq0OfOI=
X-Gm-Gg: ASbGncsXmMN8XAy9cYkRuD319ddOwvQC76HcZhBvNwzauKyPuq008UaLhvnL0Uv2BTg
 E+w75MeQEe8KMuaABBKo48shslptY8fMPpiCAI4INqk4ryfzzBFCFxDuSsjcbnnpY/8P8yi/5I5
 HaWnj5pqtpWcVy2Kay3exfgwEzGoqaxVUO3xsFEl28iKnPOciSoJV15o+O3/LlzUsUyIbYPB69c
 jPR+cRiAI5XCNuGBw7Z/4bmi10dU6aWcUbBzZxk0CmY3H35btCHA+Q6zz1ArK1enX/uthT8EBwd
 4H0R4BM+nzKsOu9hXMefeJnAB76+inTdj2BuFyoKtrGwwChss7PQWKtHEESFPLR+OVSW4azerQy
 4mGKivVLCGDCZw27rgw==
X-Received: by 2002:a05:620a:3908:b0:7d4:5cdc:81e2 with SMTP id
 af79cd13be357-7e66f372189mr499710585a.13.1753957177813; 
 Thu, 31 Jul 2025 03:19:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxnVmrpW4543srRHthGrkNrWHw3gNj9WsEk2mKRTDtWtwh5cLKN5XiE5eDu2MaiRmkZuh3Fw==
X-Received: by 2002:a05:620a:3908:b0:7d4:5cdc:81e2 with SMTP id
 af79cd13be357-7e66f372189mr499707385a.13.1753957177212; 
 Thu, 31 Jul 2025 03:19:37 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a2436c2sm84867466b.141.2025.07.31.03.19.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 03:19:36 -0700 (PDT)
Message-ID: <e7ddfe18-d2c7-4201-a271-81be7c814011@oss.qualcomm.com>
Date: Thu, 31 Jul 2025 12:19:34 +0200
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250725-topic-x1e80100-gpu-bwvote-v2-1-58d2fbb6a127@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDA3MCBTYWx0ZWRfX5+nf1GyElEwT
 c9l/tt7bW9OpzZXEeU5jqncQ5eayoacX5znbA78K2zs03qSGtIkwN8PXXjsLm8Aoz4NXch3EDdQ
 GUeeHow/x66OhoQUvPV6x8BuCgP5nWtDeAmSD9P3ahoweo+u09MeuKuy2hleDiE67wtKASMOcOj
 kwJIVUppE+3i7sr2BzrGt4LIsJOhrPqeLO/9WlA3akguQ9CwI7+Z0O5g0G9XwHYPTHVVKWw3Kcv
 6LVhqnmnv22g4IzlM/hNRuO4Dm4toeGAcAoygg8u82Mdqg6ZanPXixlDktLBaShmALMqMjs8Vyf
 vovNfeEYDGG6OkpdftpUbSehk2EDO4BbC4VBho8qezkQIBffhZUHGt/gkLdMawi7slG4IEf8kvR
 ZzVnu8HBDt6LrXEh/RxGzsahixkA5lSZzCO8rQWeuDFBuZWR+5FSU0k/wpjHIgi8MBlrbf7N
X-Authority-Analysis: v=2.4 cv=Hth2G1TS c=1 sm=1 tr=0 ts=688b433a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=1B6o04Z4kyHWbw-D5gsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 4FLQ3NHf2Fm6Vw78Om9E4o0Lyu7UP2Uy
X-Proofpoint-ORIG-GUID: 4FLQ3NHf2Fm6Vw78Om9E4o0Lyu7UP2Uy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-31_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507310070
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

On 7/25/25 10:35 AM, Neil Armstrong wrote:
> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth along
> the Frequency and Power Domain level, but by default we leave the
> OPP core scale the interconnect ddr path.
> 
> Declare the Bus Control Modules (BCMs) and the corresponding parameters
> in the GPU info struct to allow the GMU to vote for the bandwidth.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Changes in v2:
> - Used proper ACV perfmode bit/freq
> - Link to v1: https://lore.kernel.org/r/20250721-topic-x1e80100-gpu-bwvote-v1-1-946619b0f73a@linaro.org
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 00e1afd46b81546eec03e22cda9e9a604f6f3b60..892f98b1f2ae582268adebd758437ff60456cdd5 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
>  			.pwrup_reglist = &a7xx_pwrup_reglist,
>  			.gmu_chipid = 0x7050001,
>  			.gmu_cgc_mode = 0x00020202,
> +			.bcms = (const struct a6xx_bcm[]) {
> +				{ .name = "SH0", .buswidth = 16 },
> +				{ .name = "MC0", .buswidth = 4 },
> +				{
> +					.name = "ACV",
> +					.fixed = true,
> +					.perfmode = BIT(3),
> +					.perfmode_bw = 16500000,

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

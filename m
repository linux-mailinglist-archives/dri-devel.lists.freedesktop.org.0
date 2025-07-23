Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D633B0EF98
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 12:19:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0398610E166;
	Wed, 23 Jul 2025 10:19:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RnAwaWWL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB6710E166
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 10:19:16 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9LxiY025705
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 10:19:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 V17Z+d0hImGw2HvJRpGbhQVJAXUpjz394Odn/ptEGBw=; b=RnAwaWWLrHfE57XP
 nhj6x2QQPoD0TcW84iojwQf4BBA2WEsS5cttmXK2FdIjSA+riCntCZiCKC2vg1Js
 IpksfbZV7Ad6pToZP+t7Mw2fJ6MvMvmZh/BWcwE8yqrp3yanbkkYeNryATXoHcHk
 dfBBeLCnTVuEww5C9k+w2xGmx3sn9YEIyrUJSwilwzEDrwhqthlc7sNRhCe5GWTw
 ZfL0SCHyrQXLXXmd56ZetbyAG0cqU8JcELt2s4jX67XLkIgqWe/T2sv3SqCAg1Pn
 S/59z4TzwKKSUo8n4cn9YWzVxSfth1i2SR32ErWs1bokUchZPyw/6bE1sWhv/gaz
 kaxmeA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044dmkk8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 10:19:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4abdc49ce0dso5025171cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 03:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753265955; x=1753870755;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V17Z+d0hImGw2HvJRpGbhQVJAXUpjz394Odn/ptEGBw=;
 b=IkPgRp1q3SFhBJjBqDZ8zV1NqFB2JVtXgnoPotrjWfptP+bKPZ8dl1DKYMq8kvZp6b
 i674TvtIYlxhUVta2Vtotfr10s3zhCR6Odb4S6w/6FsV+STQCwjFmjheLak+z46HnKnp
 d7lQtEdKUhVrScSNXmyjgOXSbdnRY7etvuNAGLK49aUORT7n1f/9qrA40xJrB8xwu7xy
 MvVFw72mSBePjWKx814xKKf23g0u0Tls4MBKnpcdZ8J9AD5LOK6YUX8neDOkPYx3CF5Q
 njSnprXKG995VhJNk9AbI5Tsy1DsZC4KP04bx8+l3TBY2/1+goStOxvUDrN1Y6lPRoet
 g5Ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrxP/EFZ2qQyoXreXdD3Yz+Or5cRk6twxbE/z0twSb90K3oz2lGb1Ywx2T5JTGZID3nFEhMwALhiw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8jlaEWfkkhoUpQx57dvyrS0zHgl0k57xgdTk2y6ZWqKBZ+AYG
 JPXfiJnG1ClIhbPNNceoopol2XrGgc9jPhvw7xNX6H9E4mT150NB5qpyWAUQBwnCbb2bRRoqzZt
 MpYdRndo0grO4MBZo//CCG8fy6WBbaN93AxqOgaJKzI+BerTI5hevGlUorUY9XJcdBalpEaY=
X-Gm-Gg: ASbGncuQ5X8/RhQYvOp2Hc9MCo4Ihi8C5D76pubNNh362267+lXJcuppBSThOiwKq7u
 M1EhUdn133Z+RxB/WsUOF2kxe/9R8y2nApKUHEBG7kHzkMuaI5NyX5BEVBIrJbkCTvJGerW8P/X
 gDZ0Uyag2mgRO0ebv2bpj/cXZdYwTXg+MvcHPFs5bmENqL4pp4E39udlsA4StQWyQSPxOVPVnGf
 /4nZ3RK+a+ANZeCY9SHq0hSK76APtc5FKIBZ6lojwKP3Sk1rz3FywoxhSQSrfoxlD0hEFhqVSGi
 tBJzsfdbX+irtqIou2npxTl82c6M4EvZ5ulazEP8kW0scqkKUQqChg5/CLCTFmTT28wcAIbXSnB
 8XeyKTTgUZnLzV7rXBA==
X-Received: by 2002:ac8:7d13:0:b0:4ab:5d40:6f80 with SMTP id
 d75a77b69052e-4ae6dc82f5cmr14375771cf.0.1753265954963; 
 Wed, 23 Jul 2025 03:19:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFby7S9+brNY6voLnyjlEtGVWjDtOvm42SqEKk7jFypebfRo0SRww046lz8A9ap0ikYoNWxlg==
X-Received: by 2002:ac8:7d13:0:b0:4ab:5d40:6f80 with SMTP id
 d75a77b69052e-4ae6dc82f5cmr14375521cf.0.1753265954448; 
 Wed, 23 Jul 2025 03:19:14 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6c795282sm1025387166b.6.2025.07.23.03.19.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 03:19:13 -0700 (PDT)
Message-ID: <0a2188e7-3919-48f7-b5c1-8f779f617f28@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 12:19:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/17] drm/msm/a6xx: Switch to GMU AO counter
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
 <20250720-ifpc-support-v1-9-9347aa5bcbd6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-9-9347aa5bcbd6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=6880b724 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=oovjfIWShZiszQ5o9iAA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: JRCZfIbPxoE3S9xeoNyfs3CKm7KYSihp
X-Proofpoint-ORIG-GUID: JRCZfIbPxoE3S9xeoNyfs3CKm7KYSihp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA4NyBTYWx0ZWRfX24LgzU80T4Xx
 wAATIYYHiDA8gW4SjcXJpWVMdVQAkwFzl4cVfpwC2oucp0LjODjZaKcpO7hMUkm2uxB02a6vP2N
 mGqzy338XcIxgzo1+J3w7Bu8LHT7nvQ/ldB/OntUSB9dIAcEY0LbCChBFVoMOIMFntb371lZrkx
 fCr0UGwfYljbpR80qeD3KCwmNJL/Tujs/JazTLB0RXOPt3v8JFhzQHYuDoG8+tirU3gkvx6bC0F
 SZeYgZLohPqTAplVXwl2FNyQLpY0j7M6spzMCa8+hkH01X1DJhyl/2+fliXCqiEsA+NrJeHwyOD
 D4anR40n8Ju8vX3lziB2uNObRcHulc641tib07fZ6dqyP6VaPI8T54S+xEM4o7scwefRSexxP4d
 HZbjjJUrlssDdNqc+hlqHVR46y0S+6a5CPWLfc4e9oAzaFQs9HCMoZNDVOfgeNe5lWzi6aGn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230087
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
> CP_ALWAYS_ON counter falls under GX domain which is collapsed during
> IFPC. So switch to GMU_ALWAYS_ON counter for any CPU reads since it is
> not impacted by IFPC. Both counters are clocked by same xo clock source.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 30 ++++++++++++++++--------------
>  1 file changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 6770f0363e7284e4596b1188637a4615d2c0779b..f000915a4c2698a85b45bd3c92e590f14999d10d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -16,6 +16,19 @@
>  
>  #define GPU_PAS_ID 13
>  
> +static u64 read_gmu_ao_counter(struct a6xx_gpu *a6xx_gpu)
> +{
> +	u64 count_hi, count_lo, temp;
> +
> +	do {
> +		count_hi = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
> +		count_lo = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_L);
> +		temp = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
> +	} while (count_hi != temp);

The original logic is as follows:

static u64 gen7_read_alwayson(struct adreno_device *adreno_dev)
{
        struct kgsl_device *device = KGSL_DEVICE(adreno_dev);
        u32 lo = 0, hi = 0, tmp = 0;

        /* Always use the GMU AO counter when doing a AHB read */
        gmu_core_regread(device, GEN7_GMU_ALWAYS_ON_COUNTER_H, &hi);
        gmu_core_regread(device, GEN7_GMU_ALWAYS_ON_COUNTER_L, &lo);

        /* Check for overflow */
        gmu_core_regread(device, GEN7_GMU_ALWAYS_ON_COUNTER_H, &tmp);

        if (hi != tmp) {
                gmu_core_regread(device, GEN7_GMU_ALWAYS_ON_COUNTER_L,
                                &lo);
                hi = tmp;
        }

        return (((u64) hi) << 32) | lo;
}

Doing this in a while-loop almost looks like you want a lot of time to
pass - REG_WIDTH(u32?)/19.2 MHz

Konrad

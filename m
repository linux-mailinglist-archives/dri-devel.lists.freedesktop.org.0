Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2F0B0DE9B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 16:30:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE47610E6A1;
	Tue, 22 Jul 2025 14:30:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RxG/FZr4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA81B10E6A1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 14:30:23 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MA53B2016262
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 14:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 x/SZ0lHFoJHSAX7MLV7k/Qc97OKQJ9c7d2vsYjpczs4=; b=RxG/FZr4xEQeY5vn
 qX0sSrMzgTq88IcR0hMrfzu1DG7zz++O/Lr4qUiZ4BpYMf1H1giGoptn5fgASdYu
 1ObLnGbCwr1ZmFHNUcOOmgpWZl25DwCALBpE2u5ybbdzbmO1VPC05IU2x5xntwY2
 9LvZmsMFtEBiobzrI4UnwVd5wAWazVZpkFS0un7Gj8j2sF23onazRJsScif5oee+
 DdN63Eqg1ZaLwfSLz8/hoH5rdt49Rib7jtZxL+HW5gCDDYuHT42RWz2axWsv5Sru
 YnJ56uXovMXv+pKNUgcbcA0r8R+R+h2H+krvNdnxXN4vapRvF8XVPE9IGygnMAZy
 +oeBJg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048s1t7w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 14:30:22 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f539358795so19551456d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:30:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753194622; x=1753799422;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x/SZ0lHFoJHSAX7MLV7k/Qc97OKQJ9c7d2vsYjpczs4=;
 b=ecWaQ6/qUIFlFK6U9HkucGSLz5LHjkJ29ssMEUYDRAdXOvN7pQ7G21FA++ZYJCFpwE
 n5kl6rE/ge/5mX1habN/2VxuZ7cCldQ1okiqvbpVWHRFLRJ/fg+g2MiajFNRJLcNXInk
 A3kketM1eFLZYkedEnbSbiKIQvt49yAotdUoGoBv9r/PNhHZ72sZWf79tW0zp8ET8ocX
 dkq7HFZjn8/ogi+vVWaZbkCySS2X/U1DAgzHP87FL/U6tNcf+g6Tjj5WhC70/2nZebyF
 lagtvRM78wCLzbsohi1K2qRVhnv4K0AEZHmrRbPrc8v+TcZW7Mtjj6Ah3ewTttJNmfTo
 gPOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0UZfalKSpL5bOUYNVmqukw8t2waEUJLwFzao+d/noSILuBZgHXPR+IXKxhpzgXKPhWoJPxjeYp/g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8D/8cyYWykf8l7AaMXKhROqcQO/9vdQT9jztwdAVbU98mSDgz
 siIrxCSeZ+dXklt/if2xiJB4Kkm7NgSEELloINg9N5RmvElMTqQgrVJXu9vyZQ7AlgYc8KN24Xf
 BrNkONucTgQxKbaKjrlNbRa8M6jREiKIfXkypPwXHpbt6qYmrKR8ZxCz5temspv7AA/7H+HE=
X-Gm-Gg: ASbGncsyll+UQ644maEqTN/yAYYGe48flzOdnI798XyyrOFcynLVpyTPbCr7C6iGyW9
 Jd18HUjtz6s3GJ6UAefy/2WTeV4Gpv78yYs+KOoUCPxDZuGUDA31r3KZ7UdSmR0TpCYSIL9H1RF
 wcLv66lSyF8VvElLBS1OlAsd6x4m/J2+9O2ZqAbPTWe90/ZnjJZMhRDV+gu2XFBZnl9tQ/rvCcF
 k4WsnvcrxzOHAaHUCy+ZZ5lPyiMwTpVCFplqI80sHxGZrnZ1oVeFsvAmxEnB0nE/jPj1Z05OmGa
 73ccZQXw6aW+/Zw5zHpwSQZ/+uUiURuubsVQuE4oVU1xHqNjajZ5C39BhMZqAajdNlouCWQypGg
 HUFe/N/HU0MZjG//fSjlD
X-Received: by 2002:a05:620a:a48b:b0:7e6:2435:b6a4 with SMTP id
 af79cd13be357-7e62435bac5mr97899685a.12.1753194621264; 
 Tue, 22 Jul 2025 07:30:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELIFe7dttYXlWKLb8+yk+ojhPQpxXLFbOGTgUNnufmtAMzR7XiOb6CgD79dyMxVD6171XqNg==
X-Received: by 2002:a05:620a:a48b:b0:7e6:2435:b6a4 with SMTP id
 af79cd13be357-7e62435bac5mr97890885a.12.1753194619840; 
 Tue, 22 Jul 2025 07:30:19 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aeefb091e4dsm486326866b.12.2025.07.22.07.30.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 07:30:19 -0700 (PDT)
Message-ID: <d4b46652-c4d0-44b4-aef5-e8bcf606de06@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 16:30:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/17] drm/msm: a6xx: Refactor a6xx_sptprac_enable()
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
 <20250720-ifpc-support-v1-2-9347aa5bcbd6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-2-9347aa5bcbd6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEyMCBTYWx0ZWRfX5oxKmnrOjARk
 sPxRBZKNdA/LBoYI4rPRvCHzn+ETzzSD/bHDK36Qy00nIy9v0UETdRqdU2zpj8jas4EjWaJiyWN
 denTvCjJ/5DGjDF8ZHm711J3/ZoeEbIuLy8QFY+ovy3AhUnl7qK96/mFK5PIqLYKonNx0VBp36s
 d+n4vc2ZhYwwwqOGMUdjU1k+MuXNhXbmqFCT5WVWQeRJExQFKbWboI7KWcLIEMbggq0JjyvxIkG
 I/CuVzyaJOpTVMvKQ71+lfs1miCgVxqD3Sd+2kt4KdtFuu3gPzqLkTE9Oh4XE8pNIPGktlR+f+/
 qEh5XUQUFZ5WxkOm6i2rGNknc9Qkunc9ImMr6Ihf8iwgAbxnQnbtdMKWjZfswLOw9ehvO0DVSBN
 piABaCTgfR1QuQKqISBtabmBz4GjM9a5HZVKZw4ecpZlbqJ0STGVcI7qQClwvXXIlXpL0Vh/
X-Proofpoint-ORIG-GUID: rQ4tuHhxCQ9psPeWTzcJU8fmEfFJkRte
X-Proofpoint-GUID: rQ4tuHhxCQ9psPeWTzcJU8fmEfFJkRte
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=687fa07e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=68B5CXoyvkL1tjfyVhIA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 mlxlogscore=898 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220120
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
> A minor refactor to combine the subroutines for legacy a6xx GMUs under
> a single check. This helps to avoid an unnecessary check and return
> early from the subroutine for majority of a6xx gpus.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 38c0f8ef85c3d260864541d83abe43e49c772c52..41129692d127b70e9293b82bea5ccb6b911b0bfb 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -403,7 +403,10 @@ int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
>  	int ret;
>  	u32 val;
>  
> -	if (!gmu->legacy)
> +	WARN_ON(!gmu->legacy);
> +
> +	/* Nothing to do if GMU does the power management */
> +	if (gmu->idle_level > GMU_IDLE_STATE_ACTIVE)

This isn't quite a no-op, but I can't seem to find what the '1' value
would map to, even in 845 kernel sources. Do we have to worry about it?

Konrad

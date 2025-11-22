Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1B4C7D1BB
	for <lists+dri-devel@lfdr.de>; Sat, 22 Nov 2025 14:39:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 697D710E0BB;
	Sat, 22 Nov 2025 13:39:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jAKXcywd";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DqwA+qnl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB4D310E0BB
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Nov 2025 13:38:59 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AMDOhKS2785537
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Nov 2025 13:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 T1kiOU7zHHRfCpTkZ1/m/6Ad+XotlTWnDzTmokj1Uqs=; b=jAKXcywd+z1jj0E7
 cnufw1sRGGRNMz92E4JJxBl7kO1YoZ70KqpuVvC3OYLq3lRD8ZyBUV/6pAA0+qlr
 iETqzThzad9+bhApzcezGOWDBcAimalgE0dDmtu7dR/oUQPFIojT0gGoO6NJIJjV
 8+iMWQEoIBOseCS1vnX1Tw1VzR/EPQFHxrlzVTshJkvscowyRPoNLCbDK+J5i731
 4qo6eHLu3mHnvJgvqCH4hn1OSrZ4KBKQqpWo2zPVCC5gv+S5WgXYD+LJYpytDXVs
 iwdGVO5LQ+W4Edglz2U1cFb8m5/e6l3Kbjw8r3vEUBoDSh9ltHefOrwWmm/1XPMN
 EmxEsw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak6cdrq78-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Nov 2025 13:38:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ee07f794fcso9970171cf.2
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Nov 2025 05:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763818738; x=1764423538;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T1kiOU7zHHRfCpTkZ1/m/6Ad+XotlTWnDzTmokj1Uqs=;
 b=DqwA+qnlJS3/Vh9SzAR0WNX1xXLt5lP00SucYQpVATUxkugjBviU1p0gRJlCTHOFet
 Xu33vo6IviOH2X1S2mTAv0hebZzLChvWeNCXiKZoGRTzdmJ/LzSiyczF8I1of2ykl/gQ
 43nYrv9s+rqNop9QsaKaUovrmHiRRN1gFMFJbMTyA9uq3R612FKCqcvFJLOEfqQjVFnj
 AZjihl3kiwj4D2i+IPpaebJ38aL7ZrF2ObnAA5Rjj8g6cuhhvXzDWhT3gTMXcil2vSIC
 OLVmoyzGV1Ycb0VWu5BZglK+QJjQeyYKxziJK06TWctUikTACF86YmoO3GyAt8/GdLqJ
 cqSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763818738; x=1764423538;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T1kiOU7zHHRfCpTkZ1/m/6Ad+XotlTWnDzTmokj1Uqs=;
 b=OXhwtVqFgrHMpwcygt60bFMwLg1uGp+aRre/JzakDf0EvdDewWFmnDjBNcwJ3oEv//
 QoxL3shFj1n3oQtaNrkHigmD2+XUzwbdtvnl+9B/4zqTSSB0WhAX2KThZB48AHjsDQxU
 E8Bs+hpbpUqEu3ck6DRp32+DGYooX6tL7AriQQz33FsYWi8y4IrD020srAJAsH1E4Fhq
 scCVPdE73kmEYjQN1w8bXo4fhYGUTXEJMTlK3fMDC+syw4r9X31KX8bympclQhHOAmd3
 v7BAuAmYT62wfMe6OyjqUxYy8ZVXTkPRQ/mkEBfUD8uUGPn3b5fyaBCxGt/jRYP896pQ
 v1Qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRvzae+q+sbFP5l+KKHVr4Du/NVyWsc8vbVNOm/XzLV2CaITzESWumdVOd3rS9BUJuodo/j/GwOws=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz91pYcFldz8Fz/zqAI0L5lTbAl7f6Cm3YyXlAt1+MR7IyZbjlY
 9EnUecGZXszLVpUgLXQlBqZ+qq/W4Iudaa+nGxoLZIWqtbm0i6PwMzUfLSgC/yVB8xZh1lV/MrH
 gvi7uYbe8XEqw72JWmocIrupBCipNYTitu6I1XccgPDVtl5XUj6stRrUVGiFZZ2/otW3EDhE=
X-Gm-Gg: ASbGnctlc0jIlQO8PdtdUEwxnORPVZ2iZidI6yvRDFp/RJOfw2NSuECET8bZrP3ifPI
 GC+KOLzAVq9OTyKabOcd0S30ptjkVO7GlRNlPA/G8Z+ZiMKkeYqFzLUy38soyvF8n4nv/+fn2ne
 GU/yNEDMixIeKMlA9oh612mEgxFvwYvgSSOLAsae/lc8eGcdL+FMq15dThwAZY/oWdnXtIgrh2+
 g+Ea5ugA4KBeuuaOfblvvbSStEXy4wV5m+BQBr/bJ2B5sRpOxrSHXU525w+qriKGzfojeF6PkUt
 MIp2VheCZCgAzp00UPdT6v5FNpdAOb7sJKvT2Gn+0JfJfq36ea1hmGFANUnYDSU41xPXXZgINiQ
 G+zXjfvdvH9e0Jhi+yX3tRrOi0WR1SieOJb7KsymMbjUPV8B7lB7f9AHQcjfPHVCbfrw=
X-Received: by 2002:ac8:7c48:0:b0:4ee:1e95:af63 with SMTP id
 d75a77b69052e-4ee5894e4camr57436931cf.10.1763818738342; 
 Sat, 22 Nov 2025 05:38:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2lPPngRjH98213/0iV6w7rCFVvGxRvqEr5IE7cDS/Bmlf93oCCzqTQwYTweMRgaNxHpWPVg==
X-Received: by 2002:ac8:7c48:0:b0:4ee:1e95:af63 with SMTP id
 d75a77b69052e-4ee5894e4camr57436521cf.10.1763818737837; 
 Sat, 22 Nov 2025 05:38:57 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654fd4e51sm735525466b.42.2025.11.22.05.38.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Nov 2025 05:38:57 -0800 (PST)
Message-ID: <9cc55934-6980-4673-8501-2d1efe2f816e@oss.qualcomm.com>
Date: Sat, 22 Nov 2025 14:38:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] drm/msm/a6xx: Retrieve gmu core range by index
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-1-9f4d4c87f51d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251122-qcs615-spin-2-v3-1-9f4d4c87f51d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bsdBxUai c=1 sm=1 tr=0 ts=6921bcf2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=S4gWedWR7TB3ctbtemkA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: FvUoTaDtTG6lkd0PwzOtgsQPh8rqQVBu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDExMSBTYWx0ZWRfXyYln2ezr7j3n
 AAqiMx/hLwcQravjcu9aa6MbODrhbejLB1k+S2lw6UFUltTopufD/zE3GbK6GqI0agQF4IDe5nw
 p90ZDU+RryxFNwhj8S5hlk37AfOkwTan8U2psouM4yBnUqfNOxg6VA/YuZ0Ko6375hNktu1tW9y
 SG/Hl5H5Ww+d0uWORbK7tA6n0OX3wCEXUUYeK4DPSzgHadiHdSxTXETDNRsuQhv9OBrMfM32m+d
 IQgFCt0iQEBiZkwGaP4bWdpMd375XMVQcOJOMecADqV55GQjw1OCLRs7LtnejPeMXz8pWqtel8V
 piuo1Bre9DL1BeQ6rUkfdl2pGijiTydPvAdioARstlDqY+aZoDrP7qILHYDp6pwPZPvPpklhXQx
 mfk9SIG+/mqytZtrBdLYIdz1GXZ5VA==
X-Proofpoint-GUID: FvUoTaDtTG6lkd0PwzOtgsQPh8rqQVBu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511220111
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

On 11/21/25 10:52 PM, Akhil P Oommen wrote:
> Some GPUs like A612 doesn't use a named register range resource. This
> is because the reg-name property is discouraged when there is just a
> single resource.
> 
> To address this, retrieve the 'gmu' register range by its index. It is
> always guaranteed to be at index 0.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 5903cd891b49..9662201cd2e9 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -2029,21 +2029,19 @@ static int cxpd_notifier_cb(struct notifier_block *nb,
>  	return 0;
>  }
>  
> -static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
> -		const char *name, resource_size_t *start)
> +static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev, resource_size_t *start)

Can we drop this and just use devm_platform_get_and_ioremap_resource()?

Konrad

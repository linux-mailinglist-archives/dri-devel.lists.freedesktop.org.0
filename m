Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3861EAD0FA9
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jun 2025 22:14:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027F210E431;
	Sat,  7 Jun 2025 20:14:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aWBtNL/w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84ECB10E422
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jun 2025 20:14:29 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557IURXL020866
 for <dri-devel@lists.freedesktop.org>; Sat, 7 Jun 2025 20:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=neSEr4Vb10TXp2iyqI1V1pKk
 tA2cv81JEUUM8szWa8Q=; b=aWBtNL/wBLh7CzJ6ADsTcd6RZes+GaWM9LycJcLq
 C7Jz4+8RJe8RokAt8cHhZbC99Sc4sCvW25ZKoTUthmsXUo486GQvgMCGpPNJs7OD
 eOdlhGb4RgKYbOexm82vfpwVDVH8b2VVGEHf97jUZBd2fbtVw2g42uLrUiSdUxxA
 X1N1yxLutj18RPuwltXnToYvs9w8ZI5B5g/fh4+DlEooQepkt3AxS/0FvPHux1XW
 CRWYhppRcI6mFcB930+ZjmYG5eRtMJkCYiitb1pxlJahvDvTV3FROEWZMnz3SotO
 aaXj1Z64Xt4i7x6ECtaPNKIzwQEh2HjpoRnI0PP4e4d89w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn610uy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jun 2025 20:14:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7caef20a528so763835785a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jun 2025 13:14:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749327267; x=1749932067;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=neSEr4Vb10TXp2iyqI1V1pKktA2cv81JEUUM8szWa8Q=;
 b=gjh6IU0dUn1U/YeHQfkoy+Ip3zkqyte2gmhRhJYtSqbfrnwu9HLwt6do/+mz1OCYPP
 1DHH00nMU+qHQftjE+ECMVGfGGIr4ELnQm9qlfLggUjwORk+p7HxKIqOVM0DQP2DRX8t
 8+sGqbhujgGruluEdfFEue6qY0GhZfY4v8jMM1oLEDhPbwdvLt+Qwd6yWje2Cvkawei1
 x29CV9O4rbmNS2nj3T/KeiIRHvp7KV57jwqZNXbpgf2c/p9ONpdRlU+n2p1ebK2+/x9b
 /55VzzEWEkb4uhiBMansn7YHDoRVt0Xs1bH9sI/uvocymaBJHopP68m/mIJGMUOnw0LM
 hB4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbslUhwpMRErbN3MOoGBx1Sk6EWMpSbDChHoIVy/1AuAy2bKEXQKztLPTh1hBoCjHFC22JyEkZdwQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUiM426Y16BISwzHNKKSz3fHNwiP4fhDN5TmBo1Kl3gE7Mi6aS
 x2bxjcbKXn6GFpP23yvRCnBU80Sm9v7GTFLO2/hA0ty91TnJhoTOajDw65KFdEbfwfTczjJKakD
 qoh31jXr4W8mHFrQVX1t9GE1oL0uWM/+8I495J/LQVDjc2y1WxWeQ2sMdo8yi3bqsBPjRw08=
X-Gm-Gg: ASbGncsp3bzx1zsAh8RvpMEpgXA8oEmqsbCc5rj1dugAK4Q8UBc2twv4+0M8VyK03Oc
 u27nkQ8M9z2Nwr3Cgq3mJBr4fiLvFhVh876F0ZN89YMI7KbE1AsAhwmhAVMSlANAXnnPqS2MzZm
 GNxqUGdcOao0Nbn5fgAcTZ4LJ7+fX9VecyvMThGTbQHIxNIvojT66xCOtVwNfs6nCd8QK+xzV2Y
 r2/JyDp1a8nxAZrkpXwdz49+afAFyKIlzftN0N+xg0g88LAP/WoDxhq/naiHeZ/jSB1oT5dtN8y
 6ZNcmAA729uhvJRsf3XbR7a55K3lIr3ivIbhP6DRROEEpI48Phs5xbM04DRfbUA8VnB06htsneE
 =
X-Received: by 2002:a05:620a:244f:b0:7ce:d95e:8d9a with SMTP id
 af79cd13be357-7d229895ca3mr1050769385a.28.1749327267611; 
 Sat, 07 Jun 2025 13:14:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCuag0taTHrzm6R/+ZyR5VGeUYcsVJcuUbo2+TlgX3IAKr2Foit53gWXRD7B4X3LAeA0xVTA==
X-Received: by 2002:a05:620a:244f:b0:7ce:d95e:8d9a with SMTP id
 af79cd13be357-7d229895ca3mr1050767785a.28.1749327267232; 
 Sat, 07 Jun 2025 13:14:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32ae1b0cf7fsm5606531fa.12.2025.06.07.13.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jun 2025 13:14:25 -0700 (PDT)
Date: Sat, 7 Jun 2025 23:14:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] drm/msm/adreno: Add Adreno X1-45 support
Message-ID: <5xb35clc3wnnwpdnmqfminl4z6ok6nhoxg65hwgyxegxguby5d@fuks7fc2n3pf>
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
 <20250607-x1p-adreno-v1-2-a8ea80f3b18b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250607-x1p-adreno-v1-2-a8ea80f3b18b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDE0NyBTYWx0ZWRfX1w0qedeb/yzC
 Z8y12MIAN/pn/eUhWJPlKILh05WBGMcnoRSzOt0t/52KIwm0oPN9qWKGE9POHInJ/aCFAiNpyHZ
 6FnX3/k6aXSHMk+9E4vjwzrew8oGE7DXm/yvSMSTnNmgF8GQJjhsEbJz2b9R2SZR/4d6u7+Ejwr
 n8FBwAZEKvAn8IOYW4jlTB1/effuT0I5yfid9ROPgGga18vd1wJpMnJ8ItdI0PAUQdOKGMa07Qs
 td2SzXXdb0kITYNuz9ibIqM74S/qKb+CgkrhkxaCvAuMXM5UHdKn9tP0ouppYeW+zcK9O27GEEW
 z9pfES+efWHggG2bPN0WaNzoxXaZ0tphMR5a8HwZ6XmXuvXt+Jg47LdWqK5j2SGEyijAVtFymIq
 WzOeCfJ+odNK/COHlJjsueLko6tMVTtCSDlOcOFjIE/HamQMfeJJMoXVW8VNycrxSKrjfJlF
X-Proofpoint-GUID: 9YnOaWHvbxIUobCzrFUM-MUqXZl7w7x9
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=68449da4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=K9QtY5NQ_aNozdUEqbgA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 9YnOaWHvbxIUobCzrFUM-MUqXZl7w7x9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_09,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506070147
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

On Sat, Jun 07, 2025 at 07:45:00PM +0530, Akhil P Oommen wrote:
> Add support for Adreno X1-45 GPU present Snapdragon X1P42100
> series of compute chipsets. This GPU is a smaller version of
> X1-85 GPU with lower core count and smaller internal memories.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 38 +++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 70f7ad806c34076352d84f32d62c2833422b6e5e..2db748ce7df57a9151ed1e7f1b025a537bb5f653 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1474,6 +1474,44 @@ static const struct adreno_info a7xx_gpus[] = {
>  			},
>  		},
>  		.preempt_record_size = 3572 * SZ_1K,
> +	}, {
> +		.chip_ids = ADRENO_CHIP_IDS(0x43030c00),
> +		.family = ADRENO_7XX_GEN2,
> +		.fw = {
> +			[ADRENO_FW_SQE] = "gen71500_sqe.fw",
> +			[ADRENO_FW_GMU] = "gen71500_gmu.bin",

Any chance of getting these and ZAP into linux-firmware?


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

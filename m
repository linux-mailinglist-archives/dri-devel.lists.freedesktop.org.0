Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E57D7BFCB27
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 16:54:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8402810E7D9;
	Wed, 22 Oct 2025 14:54:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="H7m6lo4b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD23D10E7DA
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 14:54:01 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MA60WB018763
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 14:54:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 i1D55EkVM9ROmsSy8YnVa/jnMbgKIG284477dKPaODQ=; b=H7m6lo4bJ9+Nvn6z
 ct5jbWjwmzbAOzaCstoLQBztO6WF6xC5WIt6ihDUfRccP6V/DKONApuU/GEsLr+I
 L77XyOkHno3F5887p+xcGVd5uBBjjW8CPCpQajeMbNlH7WhiG+KVPrMOQC6JJpaG
 0eUEl4QQ7rJKK1esggRU99FZHlXSqjl9Imok3MxVzqle3HdMF6LNaflLPAl9kwdU
 98n0CIA/4TvadIKNkA8uq7obz/SCmk1iZmLfcBhoEXIgNbtFnkg5sJ4CNepyfK+P
 ei05QVnTU6Ko8YsXUU/+NFE+5o6NIre4GfZ6y4q1ftPp+RMF8OaePEWaj+ogxRhK
 yOmeIQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v469n0s9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 14:54:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4e8aab76050so4470981cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 07:54:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761144840; x=1761749640;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i1D55EkVM9ROmsSy8YnVa/jnMbgKIG284477dKPaODQ=;
 b=BMGQxVdXdts6bDnv/eymQEZ8tJUD8o8qg81puOy4b+A3fSgLIERJmKqPHrXFx1TmMk
 MFbXfGjh7a8Ije9gmYbsCV3g0Px5JxODurzW1nReN2PJuCoihKGu08C1jy/+s+xMcwbY
 hI+etWfhGy9VcQRf7y0nuUGn9/ya1X4wi5B7wwcVriFnIxxjf1cd+tQYMIVxLUfw1KH8
 sP5WJ9+y5NAMxudOjyoUE7qEiHW3egwh0QIksSX0z7ZDNCvzdai2jwSp/dNOfOy3HEVI
 ndxdGQYE41CJsZospwYJDIp0cqLs2WBjPlfp2gQwzXQrugiIKA8gvk3i2wXUIEJKFAke
 YGZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxjvZ8nsfPQZAqEtj8QCd9EteNy0D+ksKFfbcj1xWMfAsgbpOgIB8mBAYPFAqTOu4RjTAjvG3Oqeg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUhBQovfXCbcvh+0qa9CKmH6rgJWfFxod7EL/40q2lqoKpCvt+
 D0TrR+x0Tm79FLJXKqsIcWG3cpO0nvcdqVnGgxPuOqF69xr5mKN0Qt6i3Vhmlx3PKv8JXR9S8gi
 7TED5DyRn2+WJhoTcm2c+3Z6dyrHcFFYfxqOrwMJQkUhylDtX0iydOeiXBgf7DPR4OF8JCB0=
X-Gm-Gg: ASbGnctDtVkEZvj8Du/nThp3KIuCLQSHhYfLfa4bMxtjFUJo3eawlsutKKb9E8dU134
 8Mo63c2pQ0/UBaqR2Oy4CcV3Sb4LDcQADn+Y9F9k/I5rldWWH1Ot4u0yxAqXnLv7pf/s63n1cA2
 qdetMalz4XvHsDlFtlMD/8yVKPZ2Tj5NXgOW0MBcGxwXXNEmZimcB4RzIS3lQLbeLPzhGOtNC8o
 GrVNnm/GETipYwEL83BmWFsP5w9cztUsErpJxmB9MMyZkOqZZc3Vq2BN0Bb0Xk0fzGQ4UuDyslw
 cYRA65NCDm2PkMpOmbs6bCcdptkVykMRavpPgIaXkR/FW41y6OoxG8RBhV8YammBGoBgZwHmIEg
 t/6cy9b/8M1mdvp3OaexDHx8oFQovdWr5zJCKqUEdty5hihyRAXZ8z+NZ
X-Received: by 2002:a05:622a:20a:b0:4e8:9ed2:78fa with SMTP id
 d75a77b69052e-4ea116a2337mr58384771cf.1.1761144839859; 
 Wed, 22 Oct 2025 07:53:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYvZrPUqnLoE15E4DKPCHcqL6kLKjuVsKLcLPIxjePxERoJWVvHeMNwix7xgXgKYhV7otIeg==
X-Received: by 2002:a05:622a:20a:b0:4e8:9ed2:78fa with SMTP id
 d75a77b69052e-4ea116a2337mr58384401cf.1.1761144839366; 
 Wed, 22 Oct 2025 07:53:59 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d3fb6a63csm25808766b.29.2025.10.22.07.53.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 07:53:57 -0700 (PDT)
Message-ID: <59592a3d-447a-4c99-8654-d3cb9b9f9a58@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 16:53:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: Add DisplayPort and QMP USB3DP
 PHY for SM6150
To: xiangxu.yin@oss.qualcomm.com, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251021-add-displayport-support-to-qcs615-devicetree-v5-0-92f0f3bf469f@oss.qualcomm.com>
 <20251021-add-displayport-support-to-qcs615-devicetree-v5-2-92f0f3bf469f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251021-add-displayport-support-to-qcs615-devicetree-v5-2-92f0f3bf469f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sdsr45h896F9h0uYnepuQcgmEQCbUbPF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMiBTYWx0ZWRfX1saeUGY/JAqa
 OveloqfUgxZUwkEzLVa753Vy7+iko8rJn/EYSF9c3Ru5nRV3ygrmf+Oz0Vwu7E8RKdElcLpzASG
 a1cCVnR4AmIlsvx7pQzIJR/jnTztHucNrdI2NkRLYV/iQa2bDdJ6P2QQfhA6aihF76UVOYhMWQa
 57u4p/lcazgwtS+ZGI+hY7MJg9w3AEdJrNVkyH4KAn72L9DgfgWC8gZlfpRjloo2GVNCYFua9hm
 N4yUy99c5FQfi5BJQqG2KdtXp3awj8k2BgoMu4DNW4x4gAnUbsEL0tmGUWwVMX0VSUhm5OMAPIQ
 68Gadd9y8FVM93GEyGPdDRPwH2vNh8UsAbW3sFh1Q8OOcVWloUg5p+nCFJ4Q4aWOeaYJHdd6H/v
 WTUcCn/AY6miJhgprOkwoYYmzdY6qw==
X-Authority-Analysis: v=2.4 cv=U8qfzOru c=1 sm=1 tr=0 ts=68f8f009 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Qc9Wp3Nav7UuNmgFpJYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: sdsr45h896F9h0uYnepuQcgmEQCbUbPF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180032
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

On 10/21/25 5:18 AM, Xiangxu Yin via B4 Relay wrote:
> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> 
> Introduce DisplayPort controller node and associated QMP USB3-DP PHY
> for SM6150 SoC. Add data-lanes property to the DP endpoint and update
> clock assignments for proper DP integration.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---

[...]

> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						mdss_dp0_in: endpoint {
> +							remote-endpoint = <&dpu_intf0_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						mdss_dp0_out: endpoint {

Ideally there should be a \n between the last property and
the following subnode

other than that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

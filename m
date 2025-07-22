Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE8EB0DFAC
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 16:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FBF510E6C9;
	Tue, 22 Jul 2025 14:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QcfPf5cg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73FF10E6C9
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 14:55:55 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56ME385q009227
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 14:55:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 C0hlxJyA1IJ9h6I+V+ie87W0rqn0HSylQG7JgAg/IlM=; b=QcfPf5cgQ5enNMgB
 P5Jir3+SM7xsRHoRsYLCP7SeEg5OUvk46GS/jNhYJaMwxPIbzcmzPYlmdkyUm2FM
 Mq14j5LID/7xsk7g5zwP2V6WkEy4P8EWYDhJMRRL5OZrV1TUrhwbOdR7ZYPOvG6t
 5fw3TVNOGOpQXCgBl9glQoQNcvlQii3bWU7l40PkDXN6HVaQztBM4dtimAryAWwo
 ObNfrd944+6O64maA1Ss8cjyPjXoIXRyfVzEA4cyWVln6L6xElKxBQ7/pOcskAnp
 dZWUa5gBjqDn4sHGavri3Mz5+t6bJb6Pebraf+x1n7P89eOdwIfZ0l0cLGlCZdq2
 IFoluQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045w07je-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 14:55:55 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-7047de9a9b1so1320566d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:55:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753196154; x=1753800954;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C0hlxJyA1IJ9h6I+V+ie87W0rqn0HSylQG7JgAg/IlM=;
 b=bi/NBJwjSPG2wAnlZ87R3YvhmHuVoMv4jwxqDZi5tJ5N/LPWhgMcAk2tqVhIPA766A
 W2FO4b//nfL3WtEqQ5AQeY73Du2GRYnH79SL/aQWVNF+JQQMg8P0if3BiHIsVJfcm3wh
 r832DsIlL78j46dIvbgQM6ST4cW714o5JlQ7o3A/bN8zItCif4jwmVdKZyegEHYRDhkM
 djFfpUC0e5WF9FjK3h4+z5kBXp6UZHhDZB7f+Jnx0EvSZx63PzzgtrHiNctc/+eI21Bp
 oWEvIV/uWLQ9zfyutjzBC3WrkirmkWGbWYCFAJDnxM8rm1cJiatJ6429C9JP82RemeMt
 aTYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW847fZO/ZZ/RbPUZkEiHky+Mbwl1TFeT6rjhx7XJNP4npQB13567NvcrXEwe5dQHmGi80UHK2X0wk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPa0sTNA1/cyF4vPTpVyERcBkYjbSq4+rNxOyuZQk2tKgq0sDR
 reZyl65Comp4gQ7FmkZY4yzoe02ncFhNJniM6IyGoi+T9tb5UgED2BYX4dw8ri8YVwLTaMt9IBx
 bWCKF0iQ+woS5GQtDpsYVS9HOVLoEwMi/4XFsrf0kEelfZg2Hh4uv2zAsOXYqMS35JaE42CE=
X-Gm-Gg: ASbGnct2h7xem8I6Yj/I8ripL7n1oceDYvaxjREQaa9XXy47q0NNO1a7lClqos280+l
 m2XoNYJrP4VO6yGdU8jQn84TQbi2n1TfnbYoo/0WBILdW4rBPEG5tphh/G0isU1N6yLuy70uNqO
 7g9vcwoWfZPJ6lFxddUqPTBXHbyasb5r8MtKPxHmKeqcYN+uh1KcCw8/zzlNpD2r3DNgXm9s54j
 l0rV0bmaPDIIzqmu0Ic2vkJbPtdUDZLbd3Of5/yUk/RGYxIeU72dTCknpxRScauRTJjcbyt15wf
 GVpHWotFEnPg14ZxoabZFKAZRjwHV0Klf027rkW6xN4YJXn8BpDrwTRhmJ6EZZN72x7Vgceq0jx
 1UlqFZb+HW+53mctSd8Dw
X-Received: by 2002:a05:620a:4586:b0:7e1:79eb:18a3 with SMTP id
 af79cd13be357-7e342b3fcbemr1355050785a.10.1753196153035; 
 Tue, 22 Jul 2025 07:55:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnVBwZCXiywWrdb3FDM9RN4tirxT5EabZ2Ai1SNmjP7E/TXKdb3AzhUWjSu0iEK7NCe3JGkg==
X-Received: by 2002:a05:620a:4586:b0:7e1:79eb:18a3 with SMTP id
 af79cd13be357-7e342b3fcbemr1355047085a.10.1753196151593; 
 Tue, 22 Jul 2025 07:55:51 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af22f6fa6afsm73454166b.120.2025.07.22.07.55.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 07:55:51 -0700 (PDT)
Message-ID: <38100984-df2c-4a15-a192-7f38b8671145@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 16:55:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/17] drm/msm/a6xx: Enable IFPC on Adreno X1-85
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
 <20250720-ifpc-support-v1-16-9347aa5bcbd6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-16-9347aa5bcbd6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LL1mQIW9 c=1 sm=1 tr=0 ts=687fa67b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=eUh3tnNZifY16eYFU8cA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: -VgHQbMHXYh4tStLS5tiXYkMW4Uoim3D
X-Proofpoint-ORIG-GUID: -VgHQbMHXYh4tStLS5tiXYkMW4Uoim3D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEyNCBTYWx0ZWRfX3yKwR3KFcyOh
 IYke8OyjGDWCmPgF5BN84Tl4eHSYjWpnEKOkI1kvwUQ5vVswjtIxTERMyF/pd/US0/6KnQmsYXJ
 G2XtDWdvAvzMoiQcz9Cm8f2CB8ILk4Lm7h+yb1NGftxkeri/QlBKAjwgPcoZAhfuUhvH4aKZ0Ap
 rssw71+NkrL98wzTlgw0Gxh+q9yrjxzv6ZSX7It3xgSR4ho+UxJXolqelAc7gtuts/l4PY9xwZI
 x8FH/gh2ha46EGWdVHwP843h9zfJsmJEJbbIxde0QxC+qdYxBZbythe7dfuAJm1rLmKFXFs6z5Y
 V343d9NyNdS4X8tp0oYgZmIigikMqcTcO89w3gvOgOYa5KtUch1p4ukbkl+wsGR6PKLUQ5oD9F1
 xdr1YJQ0WW0S8tJBAKMEg8ThqQ1LC3ebAfARMgeQPdKyT/I7aCbwbZI4jIXfvr8iBZrPYE2i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=726 clxscore=1015 mlxscore=0 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220124
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
> Add the IFPC restore register list and enable IFPC support on Adreno
> X1-85 gpu.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 67 ++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 15 +++++--
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>  3 files changed, 78 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 70f7ad806c34076352d84f32d62c2833422b6e5e..07fcabed472c3b9ca47faf1a8b3f7cf580801981 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1343,6 +1343,69 @@ static const uint32_t a7xx_pwrup_reglist_regs[] = {
>  
>  DECLARE_ADRENO_REGLIST_LIST(a7xx_pwrup_reglist);
>  
> +/* Applicable for X185, A750 */
> +static const u32 a750_ifpc_reglist_regs[] = {
> +	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0,
> +	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
> +	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_2,
> +	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_3,
> +	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_4,
> +	REG_A6XX_TPL1_NC_MODE_CNTL,
> +	REG_A6XX_SP_NC_MODE_CNTL,
> +	REG_A6XX_CP_DBG_ECO_CNTL,
> +	REG_A6XX_CP_PROTECT_CNTL,
> +	REG_A6XX_CP_PROTECT(0),
> +	REG_A6XX_CP_PROTECT(1),

Is it fair to assume that we'd like to saverestore all CP_PROT
registers on all SKUs, always? We can save some space in .rodata
this way..

Konrad

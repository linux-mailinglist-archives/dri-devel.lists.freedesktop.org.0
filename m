Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0DBAC103B
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 17:46:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91FE610E17B;
	Thu, 22 May 2025 15:46:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="i4jD6gdE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB75D10E17B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 15:46:48 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7j9Qp029111
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 15:46:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vWH7onf239ZUhCvBgW9a4VrfEgn51qWDTJhjgDm0SmE=; b=i4jD6gdEJ9HXL739
 s2fI831eZbaqIWgJeZ8VfOl1N4Imau/kqBVFJs3wtBvPrXIeMSNcAY4kb9c+n2K0
 iTuyJnQo4uYtMTNKX32Zlah+oR5Qoj8BS9dukqiXPS7jgClET8r4CrzAFqGVwW5t
 3rp5XEdH9VCa6vfLYis0j9oSapua4WWQ/O5dLPJ84pVFu9gvcLIsNeV7z9JI2IZF
 WjCxU2hqqDozwaYvHPKkF8VSjM6dL+74Q5oB56uG+PJJLrGwO/NpOY7vRpc7nO0D
 8MAOIXQDIyxTPLh0ua2aKhn6sbQtoEhw1ca0l8usADkUOZ4iFey/mr0CpcjjfQ0g
 LkP3Ig==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf46ybq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 15:46:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c547ab8273so143876385a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 08:46:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747928806; x=1748533606;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vWH7onf239ZUhCvBgW9a4VrfEgn51qWDTJhjgDm0SmE=;
 b=dRh2a6I9nDppENcYlmF55j+crD0osbCgpsLdat2Qk5MHMcANTPtEKFDYHd52OiuxpW
 iZ4un2XuvWKRK9ou8tsaVoEWbdFsLP4B2l7iYKjGN47Sd42QDTu0PMOwW6Ud8OEipV20
 EEkBfkZ2hjgC9xOwGUfqlOqx0k1E76Y7OMffKc40KeRWwPv4NzEg9qi+D4aBQBrs7JJN
 eUGGOu1yT94d06WzeS8i6PD4Cfat+iIT5uM+rKm9rDTgUxdfUA1fDVezEzlzVmawPRqA
 1x7JsaQs63PfnDufLepXFl7laU5XiuHOp/8CAdmvOrPOLbwldVh6tdh4MOo9zrtG4SIs
 D6IA==
X-Gm-Message-State: AOJu0YwqTX8NqCrIKbWhqUYLuvG/m0fLxey3FUe9Wl1lJnpAcNK75nbk
 XCVS9TH1+apfKCJ48RCvDwi8kCwNOodVbxyGTfMhSMqL3rXyNNKqRumWoU7g8bgoOzcB/us9qtK
 pnzD/aDlOfnd6vnUGfA+vvwdiK2d+RFkVmN9Cuzoj5cRN3etUxMRszpu2TUaLFrSb285PQTs=
X-Gm-Gg: ASbGncvTfmlqRMKBDoWS0imLJEuq8e1OnqVAy2qDSkVuiNnedbGilUON8AuvR2aT7+v
 QH1Xc115iMKGLLjP8enCuFGJ4w2BsVqqaHjwdglLd4YTnHI7VUjsC+rJwr+q1jVqhW51XdG7xGE
 oylc1VFpk54vBKjcl/Z2Tf+Y/nfdQ7kj65EABfSxNuDDDRZ7xA0X78N9FRp0djEPGSL8hY+ALhB
 F8lohyfzM+iWlrBAFZAdrFaZUr+YypVnYNK2uHE29ISQqEFBcIO2XqFkWa1w3ug/guLzRytizI9
 wPLC53WPlyBs2hEbX1fa+kOSzWDlz1wDdeM9GDFZAE9vIh6HK/rV1xOoahR/IaKW5A==
X-Received: by 2002:a05:620a:6602:b0:7c5:8f36:fbeb with SMTP id
 af79cd13be357-7cd467c4007mr1513812985a.12.1747928805778; 
 Thu, 22 May 2025 08:46:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiKRSbbD41irVGLfYtLkKbe4C9B7uKvwVHMUiBaO4TNnpjcbWsYp9E2jR7CrcfZnNxWdaYfg==
X-Received: by 2002:a05:620a:6602:b0:7c5:8f36:fbeb with SMTP id
 af79cd13be357-7cd467c4007mr1513811485a.12.1747928805416; 
 Thu, 22 May 2025 08:46:45 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6004d4f1c7esm10621613a12.14.2025.05.22.08.46.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 08:46:44 -0700 (PDT)
Message-ID: <1d615331-2d60-415b-8f53-0d3a7b5d5fe4@oss.qualcomm.com>
Date: Thu, 22 May 2025 17:46:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/msm/a7xx: Call CP_RESET_CONTEXT_STATE
To: Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250520-msm-reset-context-state-v1-0-b738c8b7d0b8@gmail.com>
 <20250520-msm-reset-context-state-v1-2-b738c8b7d0b8@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250520-msm-reset-context-state-v1-2-b738c8b7d0b8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE2MCBTYWx0ZWRfX7ywO4CcmoQVX
 DeImJl7V/XaHbYHnGsiVwdSMHE0CsHO9wtb7T/RrHrk3i1OwWcLUlgfWY9/yMjQe9qblYTFlzdF
 R3PYEblnlSLV5VtmWiB5dtHs9RpGyFdymKw+ncPialQeE3XHIN+GX135VfdqEjRbLrM78CB67wu
 mDevn9JTKaxbHcKPcg6iHGl9KmBUGOhRdhAXhgqGtyIdzxMS4WpzCLmEbvQAz3lkb3fSHGd6i65
 qlsRq4kivD8bKJ8f1l6U0HT/vgrvuRzW63XTIHrRr6skh+PJVABacYFKv6mrALjdhakkl88oXw/
 qJku6b5Rfgve+6PrmLxasoOY1vYrj4/h8PFXbPiLwNlkeulbqWAZD01+dow8UgNCqGfEUKuMpV0
 /CINKLFMpsuSB0J2Gbl3Y2gTEzbxXjj7wiWsFC4uccqqB3rkOhpwRs5Vw3emWuXZtiPbmF17
X-Proofpoint-GUID: Ps-LNwf-BazMge51Jq4WYtmnMx36kSOQ
X-Authority-Analysis: v=2.4 cv=Ws8rMcfv c=1 sm=1 tr=0 ts=682f46e7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=pGLkceISAAAA:8 a=F6mO5DdtRwjxTSMArB8A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Ps-LNwf-BazMge51Jq4WYtmnMx36kSOQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220160
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

On 5/21/25 12:28 AM, Connor Abbott wrote:
> Calling this packet is necessary when we switch contexts because there
> are various pieces of state used by userspace to synchronize between BR
> and BV that are persistent across submits and we need to make sure that
> they are in a "safe" state when switching contexts. Otherwise a
> userspace submission in one context could cause another context to
> function incorrectly and hang, effectively a denial of service (although
> without leaking data). This was missed during initial a7xx bringup.
> 
> Fixes: af66706accdf ("drm/msm/a6xx: Add skeleton A7xx support")
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..f776e9ce43a7cdbb4ef769606ec851909b0c4cdd 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -130,6 +130,20 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
>  		OUT_RING(ring, lower_32_bits(rbmemptr(ring, fence)));
>  		OUT_RING(ring, upper_32_bits(rbmemptr(ring, fence)));
>  		OUT_RING(ring, submit->seqno - 1);
> +
> +		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
> +		OUT_RING(ring, CP_SET_THREAD_BOTH);

Downstream does CP_SYNC_THREADS | CP_SET_THREAD_BOTH, fwiw

Konrad

> +
> +		/* Reset state used to synchronize BR and BV */
> +		OUT_PKT7(ring, CP_RESET_CONTEXT_STATE, 1);
> +		OUT_RING(ring,
> +			 CP_RESET_CONTEXT_STATE_0_CLEAR_ON_CHIP_TS |
> +			 CP_RESET_CONTEXT_STATE_0_CLEAR_RESOURCE_TABLE |
> +			 CP_RESET_CONTEXT_STATE_0_CLEAR_BV_BR_COUNTER |
> +			 CP_RESET_CONTEXT_STATE_0_RESET_GLOBAL_LOCAL_TS);
> +
> +		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
> +		OUT_RING(ring, CP_SET_THREAD_BR);
>  	}
>  
>  	if (!sysprof) {
> 

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5C7AFB26A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 13:39:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC99F10E44C;
	Mon,  7 Jul 2025 11:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="X4i5fxSy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3786A10E443
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 11:39:06 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5679Bhvv017130
 for <dri-devel@lists.freedesktop.org>; Mon, 7 Jul 2025 11:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rRPwK/HpHQQyKqdyDpdRFDSGLrIeafNrEDSUmy9NFH8=; b=X4i5fxSyp46KSI99
 V2EiRuQvPOjvULnaHqZ+39V/fqhpQcRfmQoyPhCY4JBc+SF5y+IsVSemm4ElsnF6
 bKpLBnZsYR0kD9tf6m67lhEg+e8a57vywOQKuXk7g0KKXdGwgUM96xQprDEpMEA9
 YnmbmWcuV1Hvc/J05bxGbwxC+AyfqBm6ocol2IgxhoQEoycVkFS7SxZ4xSfaFLTW
 DKnLYd1mHpASlc4bl/J4dAua4KuwDKcw/nfmnMfK1BA+E1aFfcJPPqPJMwGJtPCZ
 Kq9kY/CYM4aGAA0IaukaC9k51XeN8/K7CALjG5Ueq/5xt7u0trNXHlJk+Es46XTZ
 /Us1+g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7qc866-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jul 2025 11:39:05 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6facbe71504so15036816d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jul 2025 04:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751888344; x=1752493144;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rRPwK/HpHQQyKqdyDpdRFDSGLrIeafNrEDSUmy9NFH8=;
 b=mee2fNQv+nXWDYLaUdbRmjNPcQzE272Wd9R8q9BwpWFC1BtHIANdzg5I99avoNBpvp
 yur5u2u69vDtV5AyNoYE/sv3NzSqH1YZOQxYA4ZVPA0H009X/2NfWVKcnTI5HRsyeELM
 m5DX49jpVpRA3DfmtfSU3l9RSdxMMAi+2H36L3SLDtXPZtrX3hiNnLVsmgNOiCAN5BhZ
 MxPWpjLAJzJDobXagN3+fs1RFU35CmnUDDo60QbturGhFXFXKskheuem23DNOzgXbhcS
 v9gziicyw9smLjYDKWZrXb8xkst0rliq13vi8Gcgrpa0nn/YF+sMnmpaFrCbLsNMTZqC
 6m0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjO95eJOgN1Ke1m13EROk00RwlFLiNfQ9cQaActYloyPEBr7YzMeAsfG0UzyJ5zY9ViUZa8eGRcZk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpD00hGGe/A9QGTSKX1Do+rhJPMcBwqQFQ6AMiSP9LSEmlExvz
 60JsRId3nyUTF1nv8V8zfzn4FCw51zFx8Qx1VXCcYtwUKCxWcNg03leaoL5eoNo0NI4m3Kn3Zct
 LOb1fJxOrmkTGDizoMoy9qKhpIJHUSDBU9GcqMwyim12dsbM73RdNjOBnR1K3H1DFN9kE7QY=
X-Gm-Gg: ASbGncvY001bS8w+MFPNedsGo0i/vdQPTCk/By2or+6Idy9Knh5WFhOrItGo1go7Nd4
 XPxxXCywQ2N3KZNQzdvsecdfMqFPiUh2Ix4lKwIQrhRGeJ9LMmK3U4YSwnB1TZjQYcv10BNqzkA
 3kyyg3ajLRJB3OTUxO/YrW+V5jx2VyyRhtELexIQzBdXgwFKBY2hrJXh9ymQ581P00z0QRolt+s
 5P7elYJO4gPt5gdxsx7raVhRhJzWkU0FNQsFNi7yD/Kh406A5eqwLW7nfphWa1GBS9xfwd+Dmso
 WgoszVpe0apqB9EN8ryGpEB88v51EYH5YonWxZyCtPxkj68siNcgPPwa5E9Ws+P13FpDpJ3RsEt
 hR1U=
X-Received: by 2002:a05:620a:27c4:b0:7c0:b3cd:9be0 with SMTP id
 af79cd13be357-7d5ddc71ca6mr618520085a.10.1751888343979; 
 Mon, 07 Jul 2025 04:39:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqlBB2pZnjJvy4s0xbnO8kJfhSozJw3RWVxbenXq2SUi3yJy4FIatJ/itKV8hIZ8ggcPhrWw==
X-Received: by 2002:a05:620a:27c4:b0:7c0:b3cd:9be0 with SMTP id
 af79cd13be357-7d5ddc71ca6mr618516885a.10.1751888343540; 
 Mon, 07 Jul 2025 04:39:03 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60fcb0ffdb7sm5366403a12.53.2025.07.07.04.39.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jul 2025 04:39:02 -0700 (PDT)
Message-ID: <c7ecbdfe-fee1-4299-9998-387d61d333a1@oss.qualcomm.com>
Date: Mon, 7 Jul 2025 13:39:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/msm: stop supporting no-IOMMU configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250706-msm-no-iommu-v1-0-9e8274b30c33@oss.qualcomm.com>
 <20250706-msm-no-iommu-v1-2-9e8274b30c33@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250706-msm-no-iommu-v1-2-9e8274b30c33@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA2NyBTYWx0ZWRfXzGf60k9g4Ffh
 feKwTkjZQlrJeqm4q1SBk4nz4pZldTUSafcsxmScwq+1NDa0kG8Pq+3mhnynKtur/bV/m5kNyZ3
 +y0VdP4eOflSwecTD7OTrCDoxdRrJQ75x2jFT5VrjCACXUnU0tXUiursRqPPpcViPw3mL2u3d0j
 WGykOQ6kjGydpfTEz1t63rQbZUc8KK+I+XBH+Mq/YM91MRhp6Ufb9oqSzJkeZAQlzrzBVvR8bDg
 e6De5f8e+NwOaQhWExz0jLuJ4OgnuwwMIGAHvCrboRnpIIbSIkX8qz4uCkS0ZdC1IYmR+ABE/eI
 gdiZZXy7NCdaT0kH3rauIyy4tEDv/N+30MlsWbX30NgwUs+CX/U56MlZzOSFDok+63HLh1bpQAf
 2+jKLZ/7FO3YDoP8+TU89mPyJyb2edAmoFFE98srSwaTqDmxYbWviK8mKGpi3Bm2nIyhCsAD
X-Proofpoint-GUID: BXegqDj4-P7pn_as0Up0R2zOlZ7rcwb4
X-Proofpoint-ORIG-GUID: BXegqDj4-P7pn_as0Up0R2zOlZ7rcwb4
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=686bb1d9 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=HBZm8QPBBmupa505GRoA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507070067
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

On 7/6/25 12:50 PM, Dmitry Baryshkov wrote:
> With the switch to GPUVM the msm driver no longer supports the no-IOMMU
> configurations (even without the actual GPU). Return an error in case we
> face the lack of the IOMMU for an MDP4 device.
> 
> Fixes: 111fdd2198e6 ("drm/msm: drm_gpuvm conversion")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_kms.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
> index 6889f1c1e72121dcc735fa460ea04cdab11c6705..2e2ab93b0f6f6a462e99d54b33da6dc21b1e8435 100644
> --- a/drivers/gpu/drm/msm/msm_kms.c
> +++ b/drivers/gpu/drm/msm/msm_kms.c
> @@ -201,8 +201,8 @@ struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev)
>  		return ERR_CAST(mmu);
>  
>  	if (!mmu) {
> -		drm_info(dev, "no IOMMU, fallback to phys contig buffers for scanout\n");
> -		return NULL;
> +		drm_info(dev, "no IOMMU configuration is no longer supported\n");

"Couldn't IOMMU-map buffers, bailing out"?

I don't think we need to assume the user has knowledge of the driver history

Konrad



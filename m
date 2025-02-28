Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A853A49ADE
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 14:45:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D7DF10ECA4;
	Fri, 28 Feb 2025 13:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UXkX3BIf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 511A010ECAC
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 13:45:54 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51SAXJhl031961
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 13:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ElMZp3aj8XCvzAukLCtSsmNgNkzLrnbLNXvaEBzIL4g=; b=UXkX3BIfY/8M396a
 UjCat4hwQmhGG02/WSx8S+HWbe4kRMf4khRfSnMsd4Fq5yu7g32oYs60fGFhDZNW
 DDx0fix8cntcU7/vxKYpaliQblncMDiwdZjs03hXXdYwQ60t4BAv5UdCbvm9tU7f
 IqjHLJd2Y1XziwX9z1Zo1Gk3THuxtoBVUT9APaTEpBx7bop6IXvFrxzVtmHbbcT2
 fWbq8WSVUAyfRPSS5Km+KC3onj9zrfMBH+encQAd1pRLSELGiGcVu0YPYNgDuo6F
 gqrQYwsK1ziqnjVhDR0FqVbeF51BfdMTkyhWCIkxegLrbNUzp/O+o3ZKXs4IysLc
 0zy03A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prksmnm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 13:45:53 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e249d117b7so2500296d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 05:45:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740750352; x=1741355152;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ElMZp3aj8XCvzAukLCtSsmNgNkzLrnbLNXvaEBzIL4g=;
 b=KgZ4sGFB8mdDzjo7mF3fd02fIZzHn7hQN4xm5HcL/kRsUpb+xyGGBKuxnVMknPrDPP
 UhjgCsi/1G9+kc0pdQEwVC80hyJf+qi9Vy4sOwt96Kw81Y2j2hYHDpm03VG7B6fs+Ypw
 cbS6rw+ys9lZ9TY9Eagt5vp1MHSI6hf7wvFd1KZhukf4rUdupDZqlAWgMtDrKe7wgipW
 t2k3iN7K/ZFOdXPXtaPNNJ+TDDlznnDEDjjUwwrNwuQAuL7y6SrJSd85SBkbCR9IErss
 wLcGKrtp60XOIQ0cOMZfHk2igfbnEG3a6MMMiyZGyTY05L5umwvFLp2rVm3Uao3BPDeN
 ug4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvM7rPQKbgqEzpXcgBI4kIZoPwC0NyeI8VULSTNWYtRJrsGlTTODYlD/8z1kiCu+1HSwSxrLtSu8Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPSfSiTZNT2W2j4aIiUxrRKQT7iOgqkz+UtesM/PNTPUPpYFRm
 mTXPaiZig21MSxciakxMvgt6Etbj9pJAteE8lV7O4iRl7QkoeoFFUdCogBOuK36xpZ2oDjUfd/3
 dqvYqwpGnx8q5FXL3Cb/hLMohENG3Eizh8lRab9CIChTU9mNnpn8Roma63Gn9/1MIncc=
X-Gm-Gg: ASbGncvi2/uQDzmcmnXRbuaONCwgsNP7rIaqny8YOyK/ieSEPT/CfvDxd1SXyv0w3JV
 gZ5EmZw4l1fNncp8yCKZeUc0oq0uC9jlVZP1yQqImhuu0tbhjjRrGNvJ3Joa0Am4f/EHAfgTHTy
 3l0fZIesr5+XXMi5gfAzQ0BXCiUXpVjBfYey5lVR9pxjnhIJ7IzrSO4zG5qH0DS3R0ZwY5IDXXh
 83z724dj6P4yG/te1PsLYbV/biYup/JlSb1meV1iYa8Aag5wlzSaWqjAfGciTjYP3kWC6BpCvl8
 2npEZ/acgJqBd4PLJLAcnwwNJ3PDWlrtIssU+yYrWk1CA7IB7FBn23xHurz9t6ezmh2AhQ==
X-Received: by 2002:ad4:5f87:0:b0:6d9:2fe3:bf0c with SMTP id
 6a1803df08f44-6e8a0d390bdmr16624706d6.4.1740750352302; 
 Fri, 28 Feb 2025 05:45:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/oCApv/Y5ObRZE/KFXdLu0bmSyua0FoUMda3K2Tbcj+Kjc3wCxjh+pxAlMy7QurbrRXWsqw==
X-Received: by 2002:ad4:5f87:0:b0:6d9:2fe3:bf0c with SMTP id
 6a1803df08f44-6e8a0d390bdmr16624436d6.4.1740750351841; 
 Fri, 28 Feb 2025 05:45:51 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e4c3b6d702sm2484342a12.17.2025.02.28.05.45.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Feb 2025 05:45:51 -0800 (PST)
Message-ID: <602c58bd-ae4b-4af9-acd1-ef4f1bde5f70@oss.qualcomm.com>
Date: Fri, 28 Feb 2025 14:45:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/msm/dpu: remove DSC feature bit for PINGPONG on
 SDM630
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250228-dpu-fix-catalog-v1-0-b05d22fbc2b4@linaro.org>
 <20250228-dpu-fix-catalog-v1-4-b05d22fbc2b4@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250228-dpu-fix-catalog-v1-4-b05d22fbc2b4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qUEZ0PPJvOtQnubUwd-_Ws2kumz2TQaT
X-Proofpoint-ORIG-GUID: qUEZ0PPJvOtQnubUwd-_Ws2kumz2TQaT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-28_03,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 adultscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502280100
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

On 28.02.2025 3:40 AM, Dmitry Baryshkov wrote:
> The MSM8937 platform doesn't have DSC blocks nor does have it DSC
> registers in the PINGPONG block. Drop the DPU_PINGPONG_DSC feature bit
> from the PINGPONG's feature mask, replacing PINGPONG_SDM845_MASK and
> PINGPONG_SDM845_TE2_MASK with proper bitmasks.
> 
> Fixes: 7204df5e7e68 ("drm/msm/dpu: add support for SDM660 and SDM630 platforms")
> Reported-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
> index df01227fc36468f4945c03e767e1409ea4fc0896..4fdc9c19a74a0c52ae502b77fb8697a53bef0f97 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
> @@ -115,14 +115,15 @@ static const struct dpu_pingpong_cfg sdm630_pp[] = {
>  	{
>  		.name = "pingpong_0", .id = PINGPONG_0,
>  		.base = 0x70000, .len = 0xd4,
> -		.features = PINGPONG_SDM845_TE2_MASK,
> +		.features = BIT(DPU_PINGPONG_DITHER) |
> +			    BIT(DPU_PINGPONG_TE2),

Neither are advertised downstream

Konrad

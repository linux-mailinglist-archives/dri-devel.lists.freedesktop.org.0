Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DF2B2F54E
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 12:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 314BE10E911;
	Thu, 21 Aug 2025 10:28:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CivwUtCh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F7A10E92A
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 10:28:25 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9bFOt013120
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 10:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Bo/sYYeMVH8ubDzUgHDxT88A
 ZENWIvmqdh74NivXn0w=; b=CivwUtChF8i1DNVsez1ALO1+qJB3ve2S7jUeT5r0
 LmxxdTJx0OVqCVRcTyLKGsbXHvHx6R9XKyQSmuQ28t5VE+9cvH9k5FaBInfMjnX0
 JjIqEP5+hxHNuYO66Vh+J3/M7t2XWQVpobj7hYSEoPV5z8PS7/352vy5bEOJckEr
 j0Z41snS1EXDZREWJ4+PF5WR73VUhgppFNzy7yR90sS6M+wancgB6Z5trIm9FjT/
 FjYX0qLcKjBMgVO2gVZStG8Ub/DbnXz4MhGXYFm7nOLgnVGPqaUKqIqE2zV/Zqlz
 fMtLIqeVo/HOMKQlH/lIya/tBWp37D+snFXNoibYywITOw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52dn0gw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 10:28:24 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-70a928da763so18410546d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 03:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755772103; x=1756376903;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bo/sYYeMVH8ubDzUgHDxT88AZENWIvmqdh74NivXn0w=;
 b=RZObeNwFq9ULhwwF8LiTdBhnFbfDykjW0Ik3gmPq1F9HQZsctWnH+ge7XPPkQVzvhV
 TQRT0DsQM5wr7R4sfD4c+C/hmXo4zA+RJWRQinPix01pyvzo6YucfI8KNfTAjx2LOl27
 KkrC5toD0DDgFkH1F17Rg9Qev6yWxtEeAIq/kD+wHE6NoySR9QMFFflAaby8FNcMRLzW
 yAVEXLITwX4EnYEYpfQdSPT/FxKndamPWsDLu/FKFC5g7C9KFx+KmUsh+B06sEl2cLyl
 Xqv2Vb+DrTAv1acVSFFwf/plUvAD151rOaofKYIaT3DzJpwlZR4owBSqP/vh19ZQKiwB
 7C5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWl7m6wkuqB2Du7lzCmzgvtjz6cIR66UdOVd/Mi8KKq0bAV3fdZgtL38qjrEbBf2vtOT2r0VYJwNzM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyoKSa8Z4Ro8tlhe7klC0fU2KrckgrN2DYPjkyXt3zwJn7nTsOJ
 CpTEbT+EBzshxxS0qq6nUvHyTQBSFIrbOPNMxw1r1wAaDKyNMgWrfQ9B1rmj4u8OrAb87V75ZLA
 uTR89NrBY0qPFPyMsamzFG7Shpu4+JwvxkTJhU/xxZBcZ3Dx5MyROwvyLTJK+rxMVjuYlG/0=
X-Gm-Gg: ASbGncvdZyXCMJA1r/pT4YoDmMqK2EcDtiGTu9UerBlDLAh5EX0eNCVfyRxwPDHHyjx
 Y/pRvDCcVwbCbcBBGtR+L3Q0cr4LHG7sjGa5ufeoegjDVV/OT//Gm3XrXwTTYgnymUIgtAyxiVg
 sM0cxLS1a8JsIJPe55RGNrkvJNWxoAgOSPvkulanODPPit6wGT48zxNFbhNlyTpS15icqruMFdO
 Zin9JJ840AIFlHNV8ZuMTtjoUWZNVIe5CIuezcNGdQMfgR3FYgzLuSYkBUjeV388zGi+o5Fl6ot
 fSgsgVeeD7tj8TVoXoj9Ww1ilN3rHF+7YYslO2bxorLHwk0eOglcC8JUyQwUHENIPYbToHXRYFR
 ZM08VfDdl3BmgE0csZcykzpRfnMG7TbtT1rGCU/tMI36BxltsskXr
X-Received: by 2002:a05:6214:21c2:b0:709:31f8:fd96 with SMTP id
 6a1803df08f44-70d88e96a7dmr16543956d6.20.1755772103369; 
 Thu, 21 Aug 2025 03:28:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwYF+lZ1f8liHpI39C8YmGl+9DTxpGYR/3aTWLPUKxMN0WxZXjU48KYaq6jDvJjEnbHvlfEw==
X-Received: by 2002:a05:6214:21c2:b0:709:31f8:fd96 with SMTP id
 6a1803df08f44-70d88e96a7dmr16543666d6.20.1755772102918; 
 Thu, 21 Aug 2025 03:28:22 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef3cc9c7sm3038380e87.71.2025.08.21.03.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 03:28:22 -0700 (PDT)
Date: Thu, 21 Aug 2025 13:28:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
Message-ID: <3ws6xfmmrnjybn4umbbnzjdksqberzuxslz6uxpabtsz2yzyss@jwblshilyx4p>
References: <20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com>
 <20250821-qcs8300_mdss-v8-2-e9be853938f9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-qcs8300_mdss-v8-2-e9be853938f9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX+gje6o/aS46L
 Fb2k7l3zj4xfmkMu16Bc3Xa6URe46zU0uricUCDENISmMbZDqS/LoLAy6vea3AUkcdSAG81N7Mk
 JsZZbWP5IHp1oYfTq6LQJjnJWqU/YPEC2vzaZOuOyhJk5mszYO4OB960F/8wrPuWoq0qkVEvOUJ
 w8zj0PDXmqU8ZI1hIATIUNIzG7UFyEbDpP0FqJuFne27DIaHv4ZLqsIXa/+XtPpFhO4VXxquQxQ
 Gocm02GEsDcn7hyDWvt2tJwBIt1WYexXyngOLIaUk9V3AzuTf/+HSTyTFg7x1P1SMk481dKzqrD
 CyeiYEFX4JyAzLmMUoGsYekeCePVrxYrylXXzDOJRciGTBjAU5LTRUAVi8JHCsfxK4/B4u32pVG
 5rmtjGwnepfG1Lq4UIvOfesHM6ujfA==
X-Proofpoint-ORIG-GUID: 5iHHgvt3mkHYe_vGL53RN_57c_WFU_nk
X-Proofpoint-GUID: 5iHHgvt3mkHYe_vGL53RN_57c_WFU_nk
X-Authority-Analysis: v=2.4 cv=SoXJKPO0 c=1 sm=1 tr=0 ts=68a6f4c8 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=WnZbLXWYNgm-BG77tk8A:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

On Thu, Aug 21, 2025 at 11:35:57AM +0800, Yongxing Mou wrote:
> Add compatible string for the DisplayPort controller found on the
> Qualcomm QCS8300 SoC.
> 
> The Qualcomm QCS8300 platform comes with one DisplayPort controller
> with same base offset as SM8650. It requires new compatible string
> because QCS8300 controller supports 4 MST streams. And 4 MST streams
> support will be enabled as part of MST feature support. Currently, using
> SM8650 data structure to enable SST on QCS8300 in the driver.

Bindings describe the hardware. There is no point in discussing the
driver here.

> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 68a6fd27506fda004e53174db5bcc88a29e8d2a6..ac44abfdd2853393ae199387c9ae2c37e1c48f52 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -18,6 +18,7 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - qcom,qcs8300-dp
>            - qcom,sa8775p-dp
>            - qcom,sc7180-dp
>            - qcom,sc7280-dp
> @@ -179,6 +180,7 @@ allOf:
>            compatible:
>              contains:
>                enum:
> +                - qcom,qcs8300-dp
>                  - qcom,sa8775p-dp
>                  - qcom,x1e80100-dp
>        then:
> @@ -217,8 +219,9 @@ allOf:
>            compatible:
>              contains:
>                enum:
> -                # some of SA8775P DP controllers support 4 streams MST,
> +                # SA8775P DP0 and QCS8300 DP controllers support 4 streams MST,
>                  # others just 2 streams MST

QCS8300 has only one DP. As such, it doesn't belong to this clause.

> +                - qcom,qcs8300-dp
>                  - qcom,sa8775p-dp
>        then:
>          properties:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

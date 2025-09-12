Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC67FB54B54
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 13:46:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FBA910EC1E;
	Fri, 12 Sep 2025 11:46:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FLd+2XvC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA1210EC1E
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:46:10 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58CBBBHo017151
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:46:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=9R/kPch3W5Cml6FifUegM7lF
 XoROZHqulO4RRRDKQxA=; b=FLd+2XvCvSN+zewfv4IgufacPZN8XrDTtIGPVMb6
 L+NKOG2DDaKsU3DaTzamqqlGdcZnuEAUkMVzfkttkTIo0o5gEsCm1fv6hiP3xvWh
 W2ViqQ1sNFI6A+wtPdDEaj1oC6rVZrmfDJYWLr02dhmqiNuIO6inWeIi9pH74azs
 eFDUpEEAuTJWBfY6R4iO6IKbwPUpILpPOoN5s+/7kh4LvPfiCF15IZFTrPdGmYjZ
 XSWzcLL5Qp+XNlwjOmQhtJfPVaQrQlPbNN7RJ104Z8gAQjTnOq1MYmqK/TwFpp/Z
 lJjDAN1B20YuM6UkW+B2CcHfaJyKKS3C2UEOtQfZt4iQTQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494jdx02ym-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:46:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b5ee6cd9a3so39125381cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 04:46:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757677569; x=1758282369;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9R/kPch3W5Cml6FifUegM7lFXoROZHqulO4RRRDKQxA=;
 b=H2idEb1kZ/TEiqdLc0obJiG0jGIBPlrF9bDezTXXTMzk9f9YkqUVzjPzLmcvPHwkp8
 eeTMyocrMMze8A0yowF4hG+HN2bgnTXhdaIQV1OA41j9Aa5kKH/MCGL+zNdLsauc/Yz6
 wGHjsrRG+u+hUeeQg7BIsH5RBw3ZYo3eHszenZfS3C3LO794VBXVhzEq8QGK/jyu6PZw
 xfp1qKBXDveyS5ovgoloUlzTtEloeyonWlBxHlMacSdvkwabTNqeA95FYDRYIIX22jiK
 8UnC3y2zw0mGEXi3+Fq+hbKmuDpm7NKXeHsR85wYOhBAs/D5kFX/rco2rENU2FeGApOW
 04Yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKwU6xd1guF7dSQlaHs41ZXST9LfjoWl4FQQpU5XHC9bCcr9E2b0qjjVLiMCcxcFlrC5apVkdsaY8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZWgkYns7ltQ84LGgVDBNTzihTAGUhbCNJq6LNHK9RWfv0c2DZ
 nOyuaj6gTLHPT49eHQeMMX4Dy66eRptCfCbh6p2DWDpYQgTFRW4vxgqf1kY/8aCh73Uz0OOwzgL
 A8iu6bYf67LyO7Mpj24kmCjpYce9aKaMN83x0MLMbzQmlpyXaK0VI5QBSZ28+qD7jAGDH/lc=
X-Gm-Gg: ASbGncsB9h9NAlVS28f2Pc4WtVTyN2jq9f6bruZRCZJYlnMaX/zZ9OqWvX9no09+NDP
 qG/QCxw+Z8eRftBE3tpDa0WbZXPbEzAdwc8OR1iFqKo3SIYq8NjZvRcUCNsdicTWAxqGXldbtDC
 cbJaJ1gNSn9hLz2F43OoONoErjEXjG+CquArjFoDeq/sgnSNIc0+7VbDY6rWVh0mcMs95fY5Yyg
 sDvl4sxgK/pXqyL5bxH1Yi27oCzFDOHy4FK/oxR/A1fkB+KSH5i+hkAcH2KR7AdV7EL480fbWOO
 c2jtCd22QU3fLCLXDgMSSWWq6UFbaDafbI/CAQQOIAPeuZlGHMv9B2plFmj8t5NHN9gv0XJ6mWJ
 pHESyglnQjDGTkD9b6QioKbeVHUAc+TaloqawvLT996a2MGVIJ5x2
X-Received: by 2002:a05:622a:3cd:b0:4b5:e606:dc14 with SMTP id
 d75a77b69052e-4b77d17bbe0mr26549751cf.72.1757677569057; 
 Fri, 12 Sep 2025 04:46:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdVs3SKgOxiIfzvO/EkGuSuQowx0IqMmkOv8Q4BBfV0cg+8bLLR4jRDO1o8cJV0pjYZeiqPg==
X-Received: by 2002:a05:622a:3cd:b0:4b5:e606:dc14 with SMTP id
 d75a77b69052e-4b77d17bbe0mr26549321cf.72.1757677568463; 
 Fri, 12 Sep 2025 04:46:08 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e63c63d43sm1104326e87.91.2025.09.12.04.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 04:46:07 -0700 (PDT)
Date: Fri, 12 Sep 2025 14:46:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
Subject: Re: [PATCH 1/2] dt-bindings: display/msm: dp-controller: Add SM6150
Message-ID: <sx64y6vfov4yag46erckpbl7avwmqlsqt3siebckn76m6jqxjh@f5lueyih6n3q>
References: <20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com>
 <20250912-add-dp-controller-support-for-sm6150-v1-1-02b34b7b719d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912-add-dp-controller-support-for-sm6150-v1-1-02b34b7b719d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDEwNiBTYWx0ZWRfXwrlED7FOKoAI
 fCG1ifBSdP6Id0Y1opZVlzFbAedPNB71FqqnjaVYVvFxZCPnsrqDWinbwoXrA+dTumsIrJD4Z0d
 NtAgU4jmTrfpi3zBIo20mIgrHoD7GvQKk3MzXbiVhLZ5otJKq9GSxCsxOI1+H1eEfJ79vHblvHC
 6I/BUINWACX7boiOB9BHNHsBabL3i+uCgtvF1n6adW5IKrfQDvTv/924tWCvDZ15eUfYTB2kDEh
 JjrgWc9N4GzXAFhtV60vvlFG4yhnV6pvMLypKKiXDa0dBw9NSIJ+YlTYt1GmuFUBLnSPUNLy6lo
 1DD4HcQDdxlvCiQKlDf6nF0rac45XYXREh1m8J1HUmeaFETzAie04lUF422l+gpzvlz/X1dY6uV
 sWZw9yIX
X-Proofpoint-GUID: px1WNF0TI9zTnN5KqEfbxRhpcYtmE-ag
X-Authority-Analysis: v=2.4 cv=JMM7s9Kb c=1 sm=1 tr=0 ts=68c40802 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=EjQU334iH38qswJM8_UA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: px1WNF0TI9zTnN5KqEfbxRhpcYtmE-ag
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509120106
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

On Fri, Sep 12, 2025 at 07:39:16PM +0800, Xiangxu Yin wrote:
> Add DisplayPort controller for Qualcomm SM6150 SoC.
> SM6150 shares the same configuration as SM8350, its hardware capabilities
> differ about HBR3. Explicitly listing it ensures clarity and avoids
> potential issues if SM8350 support evolves in the future.

The controller is exactly the same as the one present on SM8150. HBR3 is
a property of the PHY.

> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index aeb4e4f36044a0ff1e78ad47b867e232b21df509..2bebc182ffe348fd37c215a6bf0becea11e5ac15 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -46,6 +46,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,sar2130p-dp
> +              - qcom,sm6150-dp
>                - qcom,sm7150-dp
>                - qcom,sm8150-dp
>                - qcom,sm8250-dp
> @@ -261,6 +262,7 @@ allOf:
>              enum:
>                - qcom,sc8180x-dp
>                - qcom,sdm845-dp
> +              - qcom,sm6150-dp
>                - qcom,sm8350-dp
>                - qcom,sm8650-dp
>      then:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

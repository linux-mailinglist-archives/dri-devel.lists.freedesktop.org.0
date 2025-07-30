Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE9EB165F6
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 20:04:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E56CA10E37D;
	Wed, 30 Jul 2025 18:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="p9IMoYYt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B78210E37D
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 18:04:51 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UCb864017597
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 18:04:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=I/8jBayyhvVLDAZPoDLRfHEl
 UvAYchL2u6ScDXnQkcQ=; b=p9IMoYYtbltFngmzBsxUuR//FzXgU6tAT0ENf7n9
 RMdxhSr+BHgJ6wfkZjLrkqZ41ENbDxo6AFcwcAXHb/18bDTKHsm2Mz5po1ry2zRN
 yItzjGckbaVR20805iPqgwoaFQDa+SbQn8Ms+ja3u1GxrIBRERUr9gMcQnh/I2te
 LIWAaYDGhBPZx+ee1U965UNkOrwbpxskiwVzi2E3ViDdM6vCLeB4WywwwB/OrgK2
 YjdgId6OzlrxwhosEdxmy/bxHzHr1jeyBOou7kkMCSi2OOJnOZx32uEhyj2TKoHh
 ehcnv7bnTpITx83ryUudM5Zw10g96LKDGS/OZUClemzYSw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qda4r3s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 18:04:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e2e237fb4eso19893985a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 11:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753898689; x=1754503489;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I/8jBayyhvVLDAZPoDLRfHElUvAYchL2u6ScDXnQkcQ=;
 b=gECzXFnH1l7VC9O3D2kFp4EcJxtljxgM08c/fCCZsKZ4FFVzE9GpRJtfT2PdVt2pbu
 Y/aSTOjq77AamRxZxXHjTSrCA3qszuSNdtZW6H4TlBnFBfAycSxsMRD8sFunIt5n98Yy
 SHmpwZkLevg3Aw0lz2xO0NI0vhl2fC8ABO9fwylzuu8KzhtcJxNucprhHtt2smdpLGPZ
 xHRx3fIT257FomEiJyF8ip193Yr50S6qXotf9AJAGr2Px1j2ChLXmkcprQhtz0uxxoRR
 yKceK0uiTD1QhsEmEVj60DgHDs00CLq+FjMpm+uH9+B7hdpJP2znIKO7jX1yC8RpU1z/
 4YCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8ezArUvSiIcOiVPLTmhYW5loCa6wY8em85kG2GUNqIhyAwGiB/1VYVjorxEbCgKX04LHiQmexxUg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBSKmV923+HrilrQuzyaqmmY2sNE5CYEtSvmazLwNfCkDiy5ef
 NyF2RRa44P9cBdkeLkKqakyou3D5H59LyTVwQ3W9HC6GJ1eJ87WZ0O365DeISiZhoje99lNFZ/o
 rk7QaJ2IuICXeqyZrZrZaQky1Dh4eZjNjChFBXimZUJw8vs/cRsdeX0TGMFQYAMFnQwiCcD8=
X-Gm-Gg: ASbGncukPUerIqvAEXlhFaTNRFWkuc22SCeliSFWtgrBb3N/3kzv6tB0NMIDOxsJ5at
 xX4/6bITK3D+lc8nf3t+/un3Do8Xm4a2ERpFnG1jIvpaDMHmu3t4e+AynmXv2CSKKE2hiBFNjvt
 DJC+kiWfH4BYnnSe61a2V3Wymkvy/xSGmCB7LDK2kmtwa4YB+Bd+z8iFk0ZxeCA/KHgjEp6AxHX
 dcz3rohm7GVB3jF1jV08xQijg61wfCRKQTx+8yOvdejAwAdd0Ddvhy6DXM91Ue3I8jXNj/z72oK
 DoBhMzwIFpadmV/FSuSLur59jwi2m+gmDNpNUeZHsQKe4ZCEmTu8rvY7n64fljNaQU3K4CrhEMh
 hEiErl7IygNqO0sDHhHlXz7YvXg7jyCYO0JS/hQb/cDUwLHvuMlkV
X-Received: by 2002:a05:620a:3954:b0:7e3:3288:8ec3 with SMTP id
 af79cd13be357-7e66f356727mr495187385a.32.1753898688997; 
 Wed, 30 Jul 2025 11:04:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkOwzT89t02FAAwhQoy8CKlO1y04DetSnNnh59BpmdEzw5MvIIAzdTos7aUbXT9mMSFhlv6A==
X-Received: by 2002:a05:620a:3954:b0:7e3:3288:8ec3 with SMTP id
 af79cd13be357-7e66f356727mr495176085a.32.1753898688034; 
 Wed, 30 Jul 2025 11:04:48 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b6316d9bbsm2237982e87.9.2025.07.30.11.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 11:04:47 -0700 (PDT)
Date: Wed, 30 Jul 2025 21:04:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
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
Subject: Re: [PATCH v5 2/5] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
Message-ID: <yhgdibfxtv3w7t7strxd2ywy7gustrff5tbjtlpeh34m2bkhkm@xosfinmgbkui>
References: <20250730-mdssdt_qcs8300-v5-0-bc8ea35bbed6@quicinc.com>
 <20250730-mdssdt_qcs8300-v5-2-bc8ea35bbed6@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730-mdssdt_qcs8300-v5-2-bc8ea35bbed6@quicinc.com>
X-Proofpoint-ORIG-GUID: 4PMvXehIgKVJRbbgSEcUkZmZCzR5G3YJ
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=688a5ec2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=WvbujaHHVq_kfgFs6tQA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 4PMvXehIgKVJRbbgSEcUkZmZCzR5G3YJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDEzMSBTYWx0ZWRfX1OHnsMmn/vSP
 emnkwRCfse1vmRysVnI7jO4vmsYb2Y1X4muNBYhghFqwC5xxb3YAU8EmCVdspP1x+nxvTk6TjWO
 /EDkqQDQinhuEMBfWSUr0tDB3wrupxrmDRj1L18rrWwbBzmGQNGirdkYBCgTTd9cesB9E7b5lK1
 1vPw4xArvAQ5n2Ss7eN3hmuOgFNSjpzMjTCUrJZecGhHndTQUsgkX0Qxng+64dt/zOSWT02xwiV
 Livo0PietpLzUUrAfPhXDsTAsvudArnduxztmjvS7Ydn4nFE8OKy2FNJR7V/Nv+8GszoTHZC1Bo
 t7mWQjZYIKcqpLxhxEPJopfpA74ojqZM21udg7xMshAJi9O4q1Udsh1dLwAMuH7v7xHzb/of4fr
 TpDqst+9d42speUN7WtcZL0RqnNJnEjc/awXMCgdVoTraqn+sWeAyPwMgAgTHpR8z9Ro6LBq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_05,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300131
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

On Wed, Jul 30, 2025 at 05:42:27PM +0800, Yongxing Mou wrote:
> Add compatible string for the DisplayPort controller found on the
> Qualcomm QCS8300 SoC, which uses the same DPU as the SA8775P. While
> DP0 supports 4 MST streams, DP1 has been removed at the silicon level,
> so SA8775P/SM8650 cannot be used as fallback compatibles.

"It uses the same DPU as SA8775P, but we can not use SA8775P's DP
compatible". There is some logic issue there. Please rewrite to speak
only about DP.

Moreover, removing of DP1 should not affect DP0 being compatible or
incompatible with other platforms.

> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 2893f097df826a5f941fbb754fb4a96a1e410a70..f5930f29c91ec95e9182c7b8ee83c0549c6657cc 100644
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
> @@ -186,6 +187,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,qcs8300-dp
>                - qcom,sa8775p-dp
>                - qcom,sc7280-dp
>                - qcom,sc8180x-dp
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

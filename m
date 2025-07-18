Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3881B09EDC
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 11:15:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F7310E139;
	Fri, 18 Jul 2025 09:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OhLM6j0v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB3E10E12D
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 09:15:14 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I1B0J5016516
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 09:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=BfoCIwxi0joR0bjBqMAXz1jJ
 wD9YiSTEZ3Usavq7MyQ=; b=OhLM6j0vd4LIIfOucB7WsJtO1v2pS7O/26isGjGN
 mxxOau+u8FgH8gq8f1S43MaOJZu/RHFCI+L+OZqYLfz0go1GD3wIAjwli9BB9yT8
 1V7IsWquneI/hKPIGywR1IQ2+qQ0xvx90uvn0WB6koX/gJTSwYECV1w2MoPzx69+
 Q8Lqj9VcbQb+1dLDJa8SqiHDyIfgpb7m9RBsFsUf228q55hhBw2Zgxvz9EpW6dL2
 9r9QVO5Sdm7TUodjY9nCv0/CKXCpLuBKrSexwxPk2TWlKQg4Rzx7R7531C53vXso
 g+ruwBfmlXsbfuODjW/w69CEAAIqy6OuiUGV/O8QpvJaIA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47y3tc2rtd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 09:15:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7da0850c9e5so284364085a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 02:14:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752830097; x=1753434897;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BfoCIwxi0joR0bjBqMAXz1jJwD9YiSTEZ3Usavq7MyQ=;
 b=lC02fBVPL5m3lTDkwJRqXjXjHTld28TMk2775lvsmZq2krIwAo2eRL6NiR8Ou2XQFK
 C2ZmoPxURHoX2CrdpJjpCKztaPogmuv6wHsYeMlj/QKA9I28OpeAioyr8G7ex3ppFmCL
 TxZxiXYcPhIyzJdRxDJUPZDNYqEFvtbsQd54adpBP9nTOm6QmV2+3JpYtimv8Fh6PXNw
 YeJxiRUJ1/MV21eaJax7JicWPecFIfOcs9j1r+NTC/EORj4KEiIBKP2QOr92s66fGIgJ
 wDt2FiaGoqrCXP7IjIwGMFKeNEn+g2AGTsH4fWwuZJiAMBzoRnAlxlmOuWMSuY6mqj1I
 g2rQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+RlcKhp/KTnHq6JK1B/iF6Y5M8W0zYwWQ7r7BP79ddrd4bskRYN/kR1jmV/Jeq0M8bkmbiorlMuM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyu1JHp0UUxZcvpS2oKL7YK2l0xJMJCZYpYKHkBx82zZZ9bNXDe
 b/svR/7cXM6QwMti2ZGBhzciEsxm9bX/1PSR3wu512/22WFowwj5LyM53+BUmC7DO/dMr4alR04
 MZiQSksZSsVcIFBz0IACEIIlzOxSeluPbAFUtcxeDTJwaKLbVCeR3wLY54lf5xBUgUMO9pRw=
X-Gm-Gg: ASbGnctg5OAWII/8Gfmz3YdExQfLmbLW4q3D7zqq7M0Edh+yhHqdfkltROUC23bUBUa
 cGIbm60UNx19mMRAUfiRaXOtdKeoz9LBdg96BBnLg/0rLQRm40pxgIxrhwS+KoGbiK3xev2BKqM
 5Fi1o0oG17SAeplUg2HCW9m7UKbZ3e71fwIbM9cpRkAPIA8rwMNUz+jxeNPYqxyWQDVG/UmH1No
 OfVW/w7ixJdZhovlMZpsA6rL5W6FvIYDv5pebMoILqiQDi3ujQPqU68hJl2d+zsSkSSWWGeg34U
 WbDHhOEyxFMcxJ/vyOg2dotS4yNK0MmR2TBRQ7zuYB6bOXZlbvVW3L4U7Dx+Aw9lApecjfi3peb
 pPXf/WF8pVWvoHmR/qdN+Y3JNHoF/3ATXFdV/NK3IDdJ+PbFwNdo/
X-Received: by 2002:a05:620a:4505:b0:7d4:653a:e9a8 with SMTP id
 af79cd13be357-7e342b72cb3mr1422085285a.48.1752830096288; 
 Fri, 18 Jul 2025 02:14:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHekjEeOU1Lcp1E8DvurFzQuWe4WR22an0r1uchoUx++aHCtsJv4VB/D7whiQmgv+B7WWZ5/g==
X-Received: by 2002:a05:620a:4505:b0:7d4:653a:e9a8 with SMTP id
 af79cd13be357-7e342b72cb3mr1422080985a.48.1752830095640; 
 Fri, 18 Jul 2025 02:14:55 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31d7c569sm181412e87.103.2025.07.18.02.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 02:14:54 -0700 (PDT)
Date: Fri, 18 Jul 2025 12:14:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Danila Tikhonov <danila@jiaxyga.com>, cros-qcom-dts-watchers@chromium.org,
 Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH v3 4/5] dt-bindings: display/msm: add stream pixel clock
 bindings for MST
Message-ID: <dkgt4t3ooivdp4d73aj4sbtheypcioqmvrtzxuw2uck33sose6@orwlg4m47tew>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <20250717-dp_mst_bindings-v3-4-72ce08285703@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717-dp_mst_bindings-v3-4-72ce08285703@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Z5PsHGRA c=1 sm=1 tr=0 ts=687a10a2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=s_08DJon4HIwgivb4r0A:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: pm94bwUIny58PkxOKJcYr-NLXuxscFZ_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA3MiBTYWx0ZWRfX5NZURM2ccVK/
 sL+2GZQN6Rien+5KBopzBV0kLugK4RVudrWGIvG2fyIWHn76p8hcUBhHyal5+D1xNoOvbKWr0ao
 KU+/Ty0JnWwx3VMPEfo9aiAGKkt5708xHWd9vcuxEtcLgwulubyL6zJ4Actoe1PQfOxh9X5T5J2
 yLVeMxrCn+j6s2TktDWo4ycLTbZMbAzrw+1fF/taTcwFfb0wf+Ns/GK5Uf2wdZnmHBfKjfG0goR
 N1uHqjqvBJ7UujrtEFOpB3rgd03lrpG1WOP34mA160IjIY7B7y0R+8ymhQlljiXI4R6nwem7bNb
 vRFcDf2yPfW4Hf3mG5pZ/Ypgiod3qqiDv+MJNAer8sufv9q4S31fpvtI+QKJkcluuZ0Wujlghkk
 cWzlpJun7R9iu8mTNXiQWQvDAmFMcw3KiTQod82y75wJMFuXxnFHxzyZk47tjTY8TyrMsvGx
X-Proofpoint-GUID: pm94bwUIny58PkxOKJcYr-NLXuxscFZ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180072
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

On Thu, Jul 17, 2025 at 04:28:46PM -0700, Jessica Zhang wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> On some chipsets such as qcom,sa8775p-dp, qcom,sm8650-dp and some more,
> the display port controller can support more than one pixel stream
> (multi-stream transport).
> 
> These chipsets can support up to 4 stream pixel clocks for display port
> controller. To support MST on these platforms, add the appropriate
> stream pixel clock bindings
> 
> Since this mode is not supported on all chipsets, add exception
> rules and min/max items to clearly mark which chipsets support
> only SST mode (single stream) and which ones support MST.
> 
> Note: On chipsets that do support MST, the number of streams supported
> can vary between controllers. For example, SA8775P supports 4 MST
> streams on mdss_dp0 but only 2 streams on mdss_dp1.
> 
> In addition, many chipsets depend on the "sm8350-dp" compatibility
> string but not all (ex. SM6350) support MST. Because of these reasons,
> the min/maxItem for MST-supported platforms is a range of 5-8.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dp-controller.yaml        | 36 +++++++++++++++++++++-
>  .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 10 ++++--
>  .../bindings/display/msm/qcom,sar2130p-mdss.yaml   |  6 ++--
>  .../bindings/display/msm/qcom,sc7280-mdss.yaml     |  6 ++--
>  .../bindings/display/msm/qcom,sm8750-mdss.yaml     |  6 ++--
>  .../bindings/display/msm/qcom,x1e80100-mdss.yaml   |  6 ++--
>  6 files changed, 59 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index d8d94f62c102..2893f097df82 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -58,20 +58,28 @@ properties:
>      maxItems: 1
>  
>    clocks:
> +    minItems: 5
>      items:
>        - description: AHB clock to enable register access
>        - description: Display Port AUX clock
>        - description: Display Port Link clock
>        - description: Link interface clock between DP and PHY
> -      - description: Display Port Pixel clock
> +      - description: Display Port stream 0 Pixel clock
> +      - description: Display Port stream 1 Pixel clock
> +      - description: Display Port stream 2 Pixel clock
> +      - description: Display Port stream 3 Pixel clock
>  
>    clock-names:
> +    minItems: 5
>      items:
>        - const: core_iface
>        - const: core_aux
>        - const: ctrl_link
>        - const: ctrl_link_iface
>        - const: stream_pixel
> +      - const: stream_1_pixel
> +      - const: stream_2_pixel
> +      - const: stream_3_pixel
>  
>    phys:
>      maxItems: 1
> @@ -173,6 +181,32 @@ allOf:
>        required:
>          - "#sound-dai-cells"
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sa8775p-dp
> +              - qcom,sc7280-dp
> +              - qcom,sc8180x-dp
> +              - qcom,sc8280xp-dp
> +              - qcom,sc8280xp-edp
> +              - qcom,sm8150-dp
> +              - qcom,sm8350-dp
> +              - qcom,sm8650-dp
> +              - qcom,x1e80100-dp
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 5
> +          maxItems: 8

The hardware can't have variable list of clocks. Please describe the
hardware here, specifying exact number of clocks to be used.

> +
> +    else:
> +      properties:
> +        clocks:
> +          minItems: 5
> +          maxItems: 5
> +
>  additionalProperties: false
>  
>  examples:

-- 
With best wishes
Dmitry

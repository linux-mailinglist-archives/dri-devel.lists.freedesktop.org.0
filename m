Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC10B43D81
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 15:44:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3537010EA52;
	Thu,  4 Sep 2025 13:43:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SfLBNwul";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A1E10EA54
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 13:43:57 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849XN6P032388
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Sep 2025 13:43:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=2glEwf25BhBn22EfU2RgmB2K
 pr+UPvjpjFbd0WLfYLk=; b=SfLBNwulePti93rH0/aneWsCdnYXKsLO6rjNRc3a
 l296k5oxt2aEN724wrVb3e3YyMKdw7rqbuEmEyaDn4kIitFBuv5DNIbjywYVoTOi
 o6Kt/Ev5RGQtuLn5rTcIoG3AJZCWWP9f/HSfWlu+TAI8xxTyaAKEdejbi17hNp7h
 dguK3cZNUKWyfbE58+O60e7x6ghUMes7H9Eg3Bj7iWx95qJ+eS9UkUnPa1g72+AD
 FyCh5Is+I5tB3OPZ0q1zQtbCtALUCL2ITkPlyLuvkslaOYnlkSjDvzQYRF2j4G8t
 xD6e8XawIvSEig2bPgVjks3vMZ1PyYNc+0gXlGIiSFJB0w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpfse7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 13:43:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b339e7d107so23823181cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 06:43:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756993436; x=1757598236;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2glEwf25BhBn22EfU2RgmB2Kpr+UPvjpjFbd0WLfYLk=;
 b=Bd2RB2E3AJYJNVtENFqF9jMKBuOXA9r+B3tU0GW9e89pvnXjwGea8dRzpeFsPm/JIj
 RU91L4CZXFpYiK3hDqBRjSMZqsW3m1i9OJmyxvD1Ni5r6cVsMrEXygQ8v0Xl6OynZsHx
 QVpxtxO4oXJXaFuxJfCwhXfjOsXQ8PRa65qQvTVkPzKgzNlcYgxaCZrkRwJ6U9UeMWyP
 Gqno38IwX5JxPwq/rHviPZrTw1tUmRBcJfS+IMhbI/coYHlcjVD3KDUk0gGrtu4OY9al
 I08Dxuf9Bjx82nuIurYHxB3ZynQ25VJAEiLrgdyf7piPVARkcA76tz8C7tSm9DUlMYGQ
 nT+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5fMk+QMEeN87OVuA9fh0cbtCvutQKaHwCDBQi1ae5TbGeUbqqfuH1sTiijw1KSOT8j67M0lQbQME=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjrrUGrLmWXQIDkFthAQSV5YzxwBHBUGdQzUrxGN4XXDQ7A1XN
 I5d+CkEnGMO2WH24rBHuF2dh9KQ0Zcv8lw+JC/7eu+9VKKCMGYF01c/WAJC02rlDF6fTahpOPUI
 0YbRRaXlrPAwnuROjrZXPBzni017W1jene3WAsKYHqERLYfpyVEczwG3GZF1iKQHToNUmPUs=
X-Gm-Gg: ASbGncvOX2//uMTwF151GhRRXrfHG/zHWwfBQbwaw+S3mzDPJGzj31viCJ8GDQst/3G
 JaTdOjwjfn1fKFheZrkKZkedHtT+fUegdijSIVsxnRtmNSrxhsElbhzcPKyBOmGc23N/C9njzbI
 KM29nplqkACh7f6zNbjjp2HO0DLHwENLyQlfNQjf5lisUYKV1qeF4ymrNM7Hxhep9SSFv6lLnfd
 Vi7QWpqRr1B6UNdXzCAL7XpkvgNaSbZdEr6V6+bhJMsbEXNpcmFPawunAstdu4bpGe8m+q/srIH
 G1UZyiyjgWcpLtZ5vCxWDpXcdv2A7T9vYnEk17HvNAGnH2zN/8s1tLcQ3BRfFffE+wXmt1jQ2yf
 ByDc3tcZUncPfdkZEHocWXr1CjyHsV18GTz+O5JVjq7lEoGTM/ufJ
X-Received: by 2002:a05:622a:8c9:b0:4b2:a8d9:8683 with SMTP id
 d75a77b69052e-4b31dcd66e8mr252983101cf.53.1756993435608; 
 Thu, 04 Sep 2025 06:43:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH390JIg6ufBo3mdh8M7wnVIbtdqeUgFOXqUz/fvQ0dn7b22yTZGY91BOUB7sk585pcqQx+eA==
X-Received: by 2002:a05:622a:8c9:b0:4b2:a8d9:8683 with SMTP id
 d75a77b69052e-4b31dcd66e8mr252982531cf.53.1756993434991; 
 Thu, 04 Sep 2025 06:43:54 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ace81a7sm1199096e87.74.2025.09.04.06.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 06:43:54 -0700 (PDT)
Date: Thu, 4 Sep 2025 16:43:52 +0300
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
Subject: Re: [PATCH v11 2/6] dt-bindings: display/msm: dp-controller:
 document QCS8300 compatible
Message-ID: <p2okyfwfl23bip65koaqezlvhyo3z47bnugojcieuspr37xc7b@s3qwgbqmts4l>
References: <20250904-qcs8300_mdss-v11-0-bc8761964d76@oss.qualcomm.com>
 <20250904-qcs8300_mdss-v11-2-bc8761964d76@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904-qcs8300_mdss-v11-2-bc8761964d76@oss.qualcomm.com>
X-Proofpoint-GUID: F_ieI5222gjlWJ0rSCkatk2R-ZWZlzV3
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b9979c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=EGIftIUl1-O6pfvt0j4A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: F_ieI5222gjlWJ0rSCkatk2R-ZWZlzV3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX2xB8f2lbsTlb
 Pezqz3+hZumHcYa+8dGAgNz5L8MtYw/nK+TZlmGBVwAveZe4zRzSwVxkTscvbhakBQG+1Ux/TDT
 tdeVlOMSE7DNcNOTEpLt1knOVjU5jbViRiSsZkOuKww1CfTpwcJt/pXUpkjY4Rw0DLaNyW6++2M
 1+lgJoYlJBN9elqIsXvuieavoZtA9oRu0iDKu42fVPHCL9dXBpoN0UsrArWpxLNcobYhJRUaT40
 yDnPXTi+qot9s0E+a42YGOmwWk+qvM2iqLh2T++Msz06Ekm+laZr+eVYBTX3L0ntwD3osgn0NuH
 fV1dvrDJBVff7f+4VZpcXcwZYoR3jzkAcIyROEAHBgur7fhACtvGtq6nPLX9VgDFib4u7xcidxd
 rtPXqRbE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001
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

On Thu, Sep 04, 2025 at 03:22:37PM +0800, Yongxing Mou wrote:
> Add compatible string for the DisplayPort controller found on the
> Qualcomm QCS8300 SoC.
> 
> The Qualcomm QCS8300 platform comes with one DisplayPort controller
> that supports 4 MST streams.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dp-controller.yaml        | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index aeb4e4f36044a0ff1e78ad47b867e232b21df509..ad08fd11588c45698f7e63ecc3218a749fc8ca67 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -18,6 +18,7 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - qcom,qcs8300-dp

Can we use fallback to qcom,sa8775p-dp instead of declaring a completely
new one?

>            - qcom,sa8775p-dp
>            - qcom,sc7180-dp
>            - qcom,sc7280-dp
> @@ -195,6 +196,7 @@ allOf:
>            compatible:
>              contains:
>                enum:
> +                - qcom,qcs8300-dp
>                  - qcom,sa8775p-dp
>                  - qcom,x1e80100-dp
>        then:
> @@ -295,6 +297,26 @@ allOf:
>            minItems: 6
>            maxItems: 8
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              # QCS8300 only has one DP controller that supports 4
> +              # streams MST.
> +              - qcom,qcs8300-dp
> +    then:
> +      properties:
> +        reg:
> +          minItems: 9
> +          maxItems: 9
> +        clocks:
> +          minItems: 8
> +          maxItems: 8
> +        clocks-names:
> +          minItems: 8
> +          maxItems: 8
> +
>  additionalProperties: false
>  
>  examples:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

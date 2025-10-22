Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1087EBFCC5D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 17:07:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 001FE10E7E0;
	Wed, 22 Oct 2025 15:07:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VAMgLndq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B0FB10E7DD
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 15:07:47 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M9SGQw020413
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 15:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=AizstXEr7j+qbEZcyP2bfp+P
 4ZNYzI2uQPOCe7cb9eE=; b=VAMgLndq5aZabdDcknWnnVTZSyxEm3BZHhfkYEdy
 8LbwqLs0IjtwkctqPa7y47YKvZo1zWhXPJW0IP6opR8rTmllLnwLMfx7UcLCvJeS
 EwQ3lRLiYfRg/yOYDCI+oUsAkmGmqdRVFZR9v57weOQvxjR9aZleUhi2aoR7JZT9
 16/zxlyDDV0nBEgIOy5P1vUBA1TZeOlJ15dHPIsVdxyKSQX+ucwRYwRHrcv+fT7G
 e/8lpDtKqTNZ5ncYm+HQY0dkitQzRI94G9DIOnDS+r7AV2ZgN8XY0gB+tbZNXRRN
 6to9VhqF823AB4K+14koNECPB4gi0jINzr0M29Bc8s198A==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v34453v2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 15:07:46 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id
 71dfb90a1353d-54a7c3c3157so3169479e0c.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 08:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761145662; x=1761750462;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AizstXEr7j+qbEZcyP2bfp+P4ZNYzI2uQPOCe7cb9eE=;
 b=nhFz6WraEYKebQizX+QVrFgbn65Bqz+MfF/8DkdqmBOmDE+eg/opIazwi2mFv1TIbg
 2h6lz03Pt3I3BpphAxN49oRAOe/1Xfd0lgbw8fyTrOMnCvAZyZTo7KddccdsX3BowVjJ
 1G4YA/p+rifRQJOmGjnaZQNgMdFlxCktKC+TLo79gchi5MXPeNaaUn8M6OWjCQvqSMrH
 xM+qudOMVu5YgsOAmRSMVXvYwLlBSQEdfsW/eqhQicrEpd5IaHTmH1s6Y8jmSPU/ESXz
 8zdON7NuMGwppA5PnEn3CGF+/nroWbfEHOwpdcfOvwPQdyGT+qw1XoIDuZ9VwUZUiwHh
 Al7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgcTq1JkdZTOv7X7QlGFrQQsaSdP7fVVSXoLOIeia8FoeDWUElia3xtWgRXqgCSwHW51WwW0k3j1g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwiGupU33XfscREmJkbY/UFkQnXP9MxyXMqlIrV0EirbJLI7dIx
 XV2vrTFS8FG6upSAOc+ETAFCwvOdJhR8JYhGG7y6ZcsANGSbYDqNu7oqzPBnxv5XwxvBuIt0Eom
 EYTFnrRxBwowDci0Kw6TA9azwZGtuKWEg3pewoCt5LFegyUqJ8Y9mcmGGI7/bU2rEKsJ/7bg=
X-Gm-Gg: ASbGncsePs74iS3YN3fTsJsn+ChqlYX38QP7zJ20PclY1JdqKwjCqShRFSlR0FnAl88
 qp92rhpvkzAiEOPMoQOOJUNuU3sPI8fN6szljijcgf8rkN/evp3IN/CA5rSnCHdvbDHZwMA8BeU
 OuyGHIskxYyaWIdm7d5wBUW7Ds+pE9h5I+hYQ1JddRAvUphrdzZ6IM9xKVqRKf6TKDTV1lcNF6B
 EyZPFGJKq2S3TjaV5igC7YeKqfmCQTtuB+KFHHsF8FbYQxJhh0RvIE5WLamo2FMvh13hWomit3b
 sbvypx4jOdlnXJPWoBeqJxcsSuXoJnNMB9lDCWccozpB4SEeWU21NnHKZiPAZJ5jdoKy+MXBrZG
 LhDOhRLi/bcDUCcwhev2yHmsoDqcSRyxTrP+QpQDlRsWJJPDoSrBWUUbx4eoapw8cI9Pjwz8inw
 HOpAmlRVdZ2T4=
X-Received: by 2002:a05:6122:3412:b0:556:745f:6a06 with SMTP id
 71dfb90a1353d-556745f6b89mr3111970e0c.10.1761145661938; 
 Wed, 22 Oct 2025 08:07:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFXovL3a0V22gWge+cpQKP3S8k4AeqKhy/tySq4N0wYr3JuPRxNPuz/9nahs3f/axhVrCdrQ==
X-Received: by 2002:a05:6122:3412:b0:556:745f:6a06 with SMTP id
 71dfb90a1353d-556745f6b89mr3111877e0c.10.1761145661262; 
 Wed, 22 Oct 2025 08:07:41 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-377a9586b2dsm39381791fa.46.2025.10.22.08.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 08:07:39 -0700 (PDT)
Date: Wed, 22 Oct 2025 18:07:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: xiangxu.yin@oss.qualcomm.com
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
Subject: Re: [PATCH v5 1/3] dt-bindings: display/msm: Add SM6150 DisplayPort
 controller
Message-ID: <fh7daiy5p5taaz7ifymbivfktjqngs5oashhd3osrtzspsac2z@nswaeyh3kkhi>
References: <20251021-add-displayport-support-to-qcs615-devicetree-v5-0-92f0f3bf469f@oss.qualcomm.com>
 <20251021-add-displayport-support-to-qcs615-devicetree-v5-1-92f0f3bf469f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021-add-displayport-support-to-qcs615-devicetree-v5-1-92f0f3bf469f@oss.qualcomm.com>
X-Proofpoint-GUID: cehGR2Me_Mf_UOx5EBEf73dfdJI0EF5S
X-Proofpoint-ORIG-GUID: cehGR2Me_Mf_UOx5EBEf73dfdJI0EF5S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX4dCQ1HvF54fO
 edM5IBW+ihdGDPfwTimeisU8ANrbd/Z0ITy6GszeZmwaffa2MkEJQ0thV9palwm2c/T3+ZoKp8L
 M22Pg2CjuKEy/Ir/8GqMRn7B+E4L6V4VnsUN0yfVKnExri3KHTcb6YmURvlBVQdH6/t/4qUeTlu
 ilYurL2qHLB/12qeh24bQt6yoGCWLKrYH3vPu18YyZg8z5VSxEn1kM7LkTBfC9m8zqvf6CZAo9M
 470CbPihhzNCqRgfWuWKMt/GHrwpV2ZooTgvFAfWq2XZZExCrf1heFZCfs5GeDJZ6gfmklwbvHS
 6fvVbKk7HmxdoMtlfWL1Eh5YRB8qaDV+x3Or5fjmhVxP5KOTCX9+0mGvFtHu9lZwPxZN29LkueC
 0Crt2L2SZ+KxmWpCJZoiRAo02coNJw==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68f8f342 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=I67Lji_zawwbCJgw2PAA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023
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

On Tue, Oct 21, 2025 at 11:18:07AM +0800, Xiangxu Yin via B4 Relay wrote:
> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> 
> SM6150 uses the same DisplayPort controller as SM8150, which is already
> compatible with SM8350. Add the SM6150-specific compatible string and
> update the binding example accordingly.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml   | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> index 9ac24f99d3ada1c197c9654dc9babebccae972ed..89852af70de97a9025079107b838de578778c049 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> @@ -51,6 +51,16 @@ patternProperties:
>        compatible:
>          const: qcom,sm6150-dpu
>  
> +  "^displayport-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,sm6150-dp
> +          - const: qcom,sm8150-dp
> +          - const: qcom,sm8350-dp
> +
>    "^dsi@[0-9a-f]+$":
>      type: object
>      additionalProperties: true
> @@ -132,13 +142,14 @@ examples:
>                  port@0 {
>                    reg = <0>;
>                    dpu_intf0_out: endpoint {
> +                    remote-endpoint = <&mdss_dp0_in>;

Why?

>                    };
>                  };
>  
>                  port@1 {
>                    reg = <1>;
>                    dpu_intf1_out: endpoint {
> -                      remote-endpoint = <&mdss_dsi0_in>;
> +                    remote-endpoint = <&mdss_dsi0_in>;

Why?

>                    };
>                  };
>              };
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry

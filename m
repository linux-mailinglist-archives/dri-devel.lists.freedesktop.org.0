Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF36B49BA6
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 23:14:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA7710E207;
	Mon,  8 Sep 2025 21:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IV5j6zDZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F073210E207
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 21:14:45 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588Hog5J008162
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 21:14:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=gGFqDPUT3FFdS1GHQLN/aMib
 +ITPMyd8yB8R5vRfLy0=; b=IV5j6zDZg1Tozh4mtrTUk91Pr/3XOjeFLYI+/c8Y
 e1unaMz5dXDEKp3qW7SNnu/cKVsjZXDvgBP8bX3fFsY1DqwHkqeQIDlw8vLlBmf/
 cuiRawgBccD+zL5fU+XDbI/StBHngxyzHRvsWZXkwC5gO1ciYoYBnYgPJESBh6rR
 mlOD28sM6WzFV3EQfZXkTcqhZB1fmR0VALWrEdK0ZUddzLU5m7cBUJI8Ix4Izt07
 EXD/FpK31o/TTI8oriCpoLbaAPCFOQ97nenKfrhZNT5kvsJXg34/3bWgkU+02vbK
 9vdN0s8Lgr+4wUDa18ZNBeuj6sLQ3OaoPs/7tgeOz743Ww==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0ny63-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 21:14:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b5e91fb101so141872441cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 14:14:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757366084; x=1757970884;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gGFqDPUT3FFdS1GHQLN/aMib+ITPMyd8yB8R5vRfLy0=;
 b=RbGCo67ZQn1GZmswpNmQ8XvFLm7UwLoVvYztXH1AJyVrvscnNsvNi0oKP8rxHUghDc
 weNspHu1nGnYXAWwXiCE5SsU2HYNHHFCBnIzggNc2H5j/rhhjNONFwOt4+RyRRE2Ky94
 uSjdMUaAYwvqX0Naw57wM/R6+woAfz5f/mzqn4kV9PWJMezg+5ggjZTjG43IKPwc9KcQ
 bmwe/zxwPRkP8lRTq/4Q1Cj2/K0wgNFfHLhwftG0LCkCxy31dmls5ieMKOqMYQyLtYRk
 BWrIbqTvqWTGqAEWqqVCgCVRzettxiuQQ5/UA9kVHvAE3lRt/Lj1LgnpbpJsC6kmfuTH
 gHIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtMf7FJU3Dmlr1Cx6zky515Cd5yhCxa8iK26EjEcdKIz/KBqMz3cnUOzHTGmgiDo0NkDf4RUdqpus=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3wVYNbMG0Txc9FOj8Ui3zxj0F3xfVyLYIIThOTql2Qq8GpjOS
 XLmU2NCP5XUSeOmhJc4mfEL4XnqX3QwWNfC1YQeN1TyV96sBvQy0zrunX+RIns8PW4SZjK3KyVp
 O8ZQdhB7KkXkjU/zDHP0xK0YQYad5W3TDIvHPDX6x7zEpcC9fJSQIj/4eAZ7dZ7UTpS/tI+0=
X-Gm-Gg: ASbGnct4IR0wDU+Cax0wcRS8Ymn70TTbziDcruqQXraRsVA2ZpRwKdHOaiTLh8YL0iD
 AxgPV59aHONWKvs227uZ7DzcLyXoafnBfG90vutBQbU18Rv4ELnNsq8R/S61tfXIfm2CPd6JCPI
 ul9iNXizaCzdmpFbMTZEtYPE6ofIQvk3x8LmhrX10XHbj9zm095/vHYhEhR69y1mTZdHb0CFsHI
 5gfstRNob1sEEuxuyMzlIvPl9kB0Jv+q+hQstZEE66zMwComYcMAiKridTHFReYssyVF7TYPNk5
 zVKyO0LLlO5HVODmoa7id3yZqZXDmnGUpXC8CewahEHAB1Im8mGed1r1RnFJjSQVhDlmjNl1bHr
 SscrZ2WVF5q0vL4qYpusHmztHVS+agZblNsB/P6y7DVbSqbQ5znbp
X-Received: by 2002:a05:622a:48a:b0:4b3:552:27a9 with SMTP id
 d75a77b69052e-4b5f84650aemr96693281cf.58.1757366084153; 
 Mon, 08 Sep 2025 14:14:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0oVHFI5EIDxHYHpoWD6bO+otPWX2dmEW+dVE7ydmDEbNxbxrGRzABsbieuc3+w78vdOnHmg==
X-Received: by 2002:a05:622a:48a:b0:4b3:552:27a9 with SMTP id
 d75a77b69052e-4b5f84650aemr96693011cf.58.1757366083658; 
 Mon, 08 Sep 2025 14:14:43 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5681795da99sm21668e87.76.2025.09.08.14.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 14:14:42 -0700 (PDT)
Date: Tue, 9 Sep 2025 00:14:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 3/5] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Document lanes mapping when not using in USB-C complex
Message-ID: <7dzfcuvr45h4iailtjutqjev7lofoqu7w6ob77gehgmy7mctpk@k7oob4wj3c7a>
References: <20250908-topic-x1e80100-hdmi-v3-0-c53b0f2bc2fb@linaro.org>
 <20250908-topic-x1e80100-hdmi-v3-3-c53b0f2bc2fb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908-topic-x1e80100-hdmi-v3-3-c53b0f2bc2fb@linaro.org>
X-Proofpoint-ORIG-GUID: kWaDLSXFIqZkaarQDvfPHnVUxvRO6sSz
X-Proofpoint-GUID: kWaDLSXFIqZkaarQDvfPHnVUxvRO6sSz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfXzSOYY8LZW94D
 IMSLviy65mD8bicBRTIeoVEpSsU+t9liyyk/ED+gwFdK0uQzXyb+g67T0AZbBr3zuIpl9Ai0bn/
 51eCNLm0gVXudOIU+Pynlrp5QKyfmM3OtORQpdlZs/D/hM6cdlog+Hv/KGCdCoRJyOBzLFewEi5
 VWMVgNYE2I2YRknqq0+J87rATYgyXjbZl7tCrtjGSFgPxgOXapJlfg7R+4kQvPTYrBiZH+TL0Jx
 dEY9D9O1uzBGHo+qSbmjJvVmGYGsRXcg41EcuZw8fFlK5QsT4mqyYLxqu0HnRXFdD7ID1+k+dZ8
 Kls5FPlMYTslKSoEDbh9XV8s5sP4jb14dGkpmNtt+/+fUSX53YAlekzh7aVkpVSPcR6IX9x9WnE
 f+C1srpC
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68bf4745 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=MealuuOmK2OQarRwPrkA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024
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

On Mon, Sep 08, 2025 at 03:04:20PM +0200, Neil Armstrong wrote:
> The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
> of a combo glue to route either lanes to the 4 shared physical lanes.
> 
> The routing of the lanes can be:
> - 2 DP + 2 USB3
> - 4 DP
> - 2 USB3
> 
> The layout of the lanes was designed to be mapped and swapped
> related to the USB-C Power Delivery negociation, so it supports
> a finite set of mappings inherited by the USB-C Altmode layouts.
> 
> Nevertheless those QMP Comby PHY can be used to drive a DisplayPort
> connector, DP->HDMI bridge, USB3 A Connector, etc... without
> an USB-C connector and no PD events.
> 
> Document the data-lanes on numbered port@0 out endpoints,
> allowing us to document the lanes mapping to DisplayPort
> and/or USB3 connectors/peripherals.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 59 +++++++++++++++++++++-
>  1 file changed, 58 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> index 5005514d7c3a1e4a8893883497fd204bc04e12be..51e0d0983091af0b8a5170ac34a05ab0acc435a3 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> @@ -81,10 +81,67 @@ properties:
>  
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
> +
>      properties:
>        port@0:
> -        $ref: /schemas/graph.yaml#/properties/port
> +        $ref: /schemas/graph.yaml#/$defs/port-base
>          description: Output endpoint of the PHY
> +        unevaluatedProperties: false
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +            unevaluatedProperties: false
> +
> +          endpoint@0:
> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +            description: Display Port Output lanes of the PHY when used with static mapping
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                $ref: /schemas/types.yaml#/definitions/uint32-array
> +                minItems: 2

Nit: DP can work in a 1-lane mode. Do we nned to support that in the PHY?

> +                maxItems: 4
> +                oneOf:
> +                  - items: # DisplayPort 2 lanes, normal orientation
> +                      - const: 0
> +                      - const: 1
> +                  - items: # DisplayPort 2 lanes, flipped orientation
> +                      - const: 3
> +                      - const: 2
> +                  - items: # DisplayPort 4 lanes, normal orientation
> +                      - const: 0
> +                      - const: 1
> +                      - const: 2
> +                      - const: 3
> +                  - items: # DisplayPort 4 lanes, flipped orientation
> +                      - const: 3
> +                      - const: 2
> +                      - const: 1
> +                      - const: 0
> +            required:
> +              - data-lanes
> +
> +          endpoint@1:
> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +            description: USB Output lanes of the PHY when used with static mapping
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                $ref: /schemas/types.yaml#/definitions/uint32-array
> +                minItems: 2
> +                oneOf:
> +                  - items: # USB3, normal orientation
> +                      - const: 1
> +                      - const: 0
> +                  - items: # USB3, flipped orientation
> +                      - const: 2
> +                      - const: 3
> +
> +            required:
> +              - data-lanes
>  
>        port@1:
>          $ref: /schemas/graph.yaml#/properties/port
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

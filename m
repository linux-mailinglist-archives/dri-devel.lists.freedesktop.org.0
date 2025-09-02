Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0248B3FA67
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:30:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C708B10E615;
	Tue,  2 Sep 2025 09:30:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ogeea3Kb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 638EF10E615
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:30:39 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822SaMu030840
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 09:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=jA18KHak3xEuH/pG/ByyPr54
 rqvVPspGXhnOl9P369I=; b=Ogeea3KbBKvZAmnR6hReYKQ20SGd+Kjeo6dawV4y
 mgFQFWWbQlVO/hmrq+rvFuzd17svyADjmJkKjmiGNQt3OcLOhR/dPfV0y7wPMseS
 LeC31ZQ9EQT/rix/tKEKoOmlwy9uWqLdTArgauq/XIdrmyAPdRBAqbb/yrGCkP8c
 coNen6GhHRsGK2N9JyiuVbLe5NrNg9ZQ2rjmSMCi1zGMZNF2KUV9UtMC80hergkn
 cGa0HyKoAGI+FdF4UKElq6b+uSy2wLtbcg7IIUZUAizjMBaK1OQIv3LDFhcnOFZE
 K+wMq5vT/BCzll+DACmOZwpRGkPhI0KUuLEm0mp5naBNCw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8q8se-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 09:30:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b3316dd5d0so45139641cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 02:30:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756805437; x=1757410237;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jA18KHak3xEuH/pG/ByyPr54rqvVPspGXhnOl9P369I=;
 b=g5TrTZtvWxHkAeF08LA0XFbA9ceFiJlEqR/+aPcHFcIs4Vo1C++tpd0W5WEoTq8lK6
 E8sf90VmMza9d0e+7ikDlkxAgsiAjwBN5aXZXHZA4Bp1Sa03QNFd8Q4opjomSui2ufJp
 6XbpxYUFoSf89az+0OhkIpmhMMxGwCPC7zg3GFNT/s7bu8WqyaEAicLRF1duxIzNdZuT
 gm3HjFkUr987nLolhDxoOoZ2JcXep2HIJ2/v6MdlmeMf8cqjOKy5TGAksRXxiru4Lwo7
 X8GHjrupxoCTnxx6/YmKGBQAMmGrVGAGAcnCvXVLY9T7rIB6sA9ofq0Wi/8X5h7u1u96
 ziXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2izKkW4UtVEhk3USSqQ4h7MOcT6Hrz590dkWqpmv/vsrYUlFBu6eVr6l8XrjUB22kcb8hpJsQMDo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQWVa2I6zkm2E2eHrQ2oXYzUJBK3qkExoOJrG77m87oEhj+Q3x
 9qhmKuckSnFVgn+aOnJs/5DUay3Wi/NIL24yyoewrbaEDJI31irAKmdDMQ7UrLoryh2UGilNB2g
 pPHLHJfs+ySo22dZHeFtY2ozivFwI9AIkHxJQywl2vHeMaUtB/jr7EYuK5ncm8kpmCZd8Wto=
X-Gm-Gg: ASbGncsoClNSCWjfKOVKG7u5wpVflhKCQB8kNjqWIxGrMfcyKzgsKp8VhUqbQWm3hro
 x2njYqYL5yiFyDsJ3lgxlqY3WqXslwss4ouOWTBg3CSk+bydn2AAHJfST9IiXMpw+JYFWgqE1Ir
 NzHBar+LG9cTxEPiX0lShWx4nObsf2i/9d6g/24N3eSa16Zbs8nNaE6duxuu6oV07KVQ+j4QcYu
 4IXZ3if1Y2XTVyV+ZpDqytny+nL1NXVHRnhP3ZzicYDiB5KZqZyBT3uBHvmhI0h3x9bWayV1Q51
 BhCV7ISJYDzsM3M5GT209I5vd2eL0jIEL2hqxb9kbWImscOQ8kuflUu3ju8EfGt1+63nubk6bUR
 9FE5zLF9qLZqhvB2Q0dF0tB0RqiggqR5huPSuzUnjJFRepfW7aJZo
X-Received: by 2002:a05:622a:2609:b0:4b2:8e41:1aed with SMTP id
 d75a77b69052e-4b31da37e70mr123618831cf.50.1756805437300; 
 Tue, 02 Sep 2025 02:30:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3B2sMY6mhuzZQ9BKM05I6HOCeVfKyCF2/fNLRfgWKFDFDuw/uEv61rjhN5aI6FvZLt8UIZQ==
X-Received: by 2002:a05:622a:2609:b0:4b2:8e41:1aed with SMTP id
 d75a77b69052e-4b31da37e70mr123618381cf.50.1756805436682; 
 Tue, 02 Sep 2025 02:30:36 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608279d2cesm541552e87.112.2025.09.02.02.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 02:30:35 -0700 (PDT)
Date: Tue, 2 Sep 2025 12:30:33 +0300
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
Subject: Re: [PATCH v2 3/5] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Document static lanes mapping
Message-ID: <slgu2d4iv6ef76f43gvwaelcl5ymymsvhokyunalq7z3l2ht3j@t7pko4rtqvgm>
References: <20250902-topic-x1e80100-hdmi-v2-0-f4ccf0ef79ab@linaro.org>
 <20250902-topic-x1e80100-hdmi-v2-3-f4ccf0ef79ab@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902-topic-x1e80100-hdmi-v2-3-f4ccf0ef79ab@linaro.org>
X-Proofpoint-ORIG-GUID: qpWtsOTOR0M3Xj9F16XnoGW4Z6vFGVLh
X-Proofpoint-GUID: qpWtsOTOR0M3Xj9F16XnoGW4Z6vFGVLh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX2GaFHcNdmDhf
 pxJVl72eaEX9KiGj+rCmevRFBfNX5vm4I36SW2q+ciTGUeCMyIT6hJplwDeZ8hfdoHzgM0KXJDg
 P7YupIzwsniyFc+/MKEstZZHRWB7p7xAcvdtsi+rEIqgIZ4qgsYbx6POSBabN3FR0wATpu7rCt5
 KL2dPYhF5C9+jBIcte7F21YSGownm8jkUtOGvJ4DYJXMA6cpxy2J6mXtxFjQ1VkJMFcY/UbPXTz
 +IxpdtwwfGqPUXvPgATOUyhC63lhPNFmww3qNVHMu5292ojzViKujUhQiJ8I9IdT4x2m/i6qhNv
 0FPRoMIRMmS7is8/oq5996K4Saw3jRPBVT9fql7UF72BNXOZCM7COg4lXeQJVUXlAs0sHFpd0Q/
 xGk3QuGF
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b6b93e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=h5iY_YrdyxaDv9g1vm0A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020
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

On Tue, Sep 02, 2025 at 11:00:30AM +0200, Neil Armstrong wrote:
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
> Nevertheless those QMP Comby PHY can be statically used to
> drive a DisplayPort connector, DP->HDMI bridge, USB3 A Connector,
> etc... without an USB-C connector and no PD events.
> 
> Add a property that documents the static lanes mapping to
> each underlying PHY to allow supporting boards directly
> connecting USB3 and DisplayPort lanes to the QMP Combo
> lanes.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> index c8bc512df08b5694c8599f475de78679a4438449..12511a462bc6245e0b82726d053d8605148c5047 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> @@ -76,6 +76,35 @@ properties:
>    mode-switch: true
>    orientation-switch: true
>  
> +  qcom,static-lanes-mapping:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 4
> +    items:
> +      enum:
> +        - 0 # Unconnected (PHY_NONE)
> +        - 4 # USB3 (PHY_TYPE_USB3)
> +        - 6 # DisplayPort (PHY_TYPE_DP)
> +    description:
> +      Describes the static mapping of the Combo PHY lanes, when not used
> +      a in a Type-C dynamic setup using USB-C PD Events to change the mapping.
> +      The 4 lanes can either routed to the underlying DP PHY or the USB3 PHY.
> +      Only 2 of the lanes can be connected to the USB3 PHY, but the 4 lanes can
> +      be connected to the DP PHY.

It feels like this significantly duplicates existing data-lanes
definitions. Can we use that property to express the same semantics?


> +      The numbers corresponds to the PHY Type the lanes are connected to.
> +      The possible combinations are
> +        <0 0 0 0> when none are connected
> +        <4 4 0 6> USB3 and DP single lane
> +        <4 4 6 6> USB3 and DP
> +        <6 6 4 4> DP and USB3
> +        <6 0 4 4> DP and USB3 single lane
> +        <4 4 0 0> USB3 Only
> +        <0 0 4 4> USB3 Only
> +        <6 0 0 0> DP single lane
> +        <0 0 0 6> DP single lane
> +        <6 6 0 0> DP 2 lanes
> +        <0 0 6 6> DP 2 lanes
> +        <6 6 6 6> DP 4 lanes
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>      properties:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

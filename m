Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9FFB3FE62
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 13:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32BFD10E67A;
	Tue,  2 Sep 2025 11:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nybMVs+E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C0310E67A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 11:50:37 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582B6DIQ022015
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 11:50:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5EB/XrOSwrBg61UCKv90VdlyE8eMUv62GQ7Noo3Ndow=; b=nybMVs+EeKRJq3LU
 bPFyv0XreWU751FtGKaUNSSqfxImrsxXGm4HO76Rs8IjceRiN/7h1BfWakmZhaMW
 ik3zINYG+NTEQPwfetg2GfiA18kcbVoNTKxE8b50RWjPZGZ28QKZqqHr4gahKllq
 qXFnBR02M7R2ksQyqUwFVjQA5ASDMJbYVNMrHdcjxejP6ogAKHXU6Ot+Mj7ghEqe
 UOMNbwX4bgnM2n80mbKA7spzXNa97mkMgE7HHybsXNuwBpbSPZYXAsydbcfIdvWI
 Cky99Dw1803sPo7Z89Ps/TubwD1L+wTkm5qFuo7rx+Pisn49zb+De5Qcc1jGiFBo
 TZGceg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnp7t7t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 11:50:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b3037bd983so28881271cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 04:50:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756813836; x=1757418636;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5EB/XrOSwrBg61UCKv90VdlyE8eMUv62GQ7Noo3Ndow=;
 b=qQCWGngYaMj60uVh7fx2jR812AeDnvdqicuGIQtIGQHS6WZiYsDGz5qiKuCLmYrV/l
 myxAG3Y41KUVDQI27uHmYeBVoByPCS9PlX8PTYmAG3FR87hc7Xdxa2w0ex/jHgxD9qAX
 dCNMPfSV2IsW6I2zQ3UdGn3z6dA3eb+jFVNB5P8q74YUHGimwPwKyeitvJUHfG0d3hgG
 5nDEQhZzNVC6rgkhEqccbg7Wpa/AUYFL+V0eIh1enl+U9SvdErG0H41aaDYQzcGyPdsU
 tDATe4HHZvoDz6cG1/Hi51SyXDH34WPgDW9NQFRQOEHzq0dm+vK/JQ4av7JEbsgSonaR
 Jo9w==
X-Gm-Message-State: AOJu0Yz41i4uHGmMoqv2KVG61bQ/eY+zBQwYfMqQORm/RaxKEL5T9zcY
 mL3CdLhNet0SE3aPlU7UgthzKnOrfNQyJmwrA79zFrdpwqPdpYbr19Kb6YzqvWzoJLt0kwyiuF+
 Io/Ucr1ervyDwxW6JWN44zo1v9+xxp0RkATPaBIsHFVFxfFhp3q6vsOIMx/6kQCNGv0xQDmE=
X-Gm-Gg: ASbGnct3McDtBlowwRvlFBOaN3HEnMd660AeXTJ/Wn05NFMnXy7nyoKc380VHheTbE/
 m9xkJA+DbNwzhfxv7LbCz6ogS5S2ykk05sKqVQy80pVx/3j+phGrNReQXvL9r//hbJqlh4SKHYH
 Vh4p0kXLVhaas7UdEor2D3CTEcDY+ANRwdQKD2nzDfUZNAtWgSJQ+GUYCzEhU9U2kO4i4jBn+iz
 kt5gMSne7WYWnE94KvMNNeddEC1sXpwPVKJCr6rzlL6bqZ22N3ePB3DjClDDbSHm/7S+xqajopm
 0JGGaPQQ9nHkCk6VMdc0kEOikWuX1zQXOdAqKkM/UlCpJ3NzG0gf2f5iFPp9wjHiYCJSLL9Revi
 7FtWxDuJnCsZoOE83YJMTfQ==
X-Received: by 2002:ac8:5ad3:0:b0:494:b722:141a with SMTP id
 d75a77b69052e-4b313fb8f60mr107758191cf.13.1756813836178; 
 Tue, 02 Sep 2025 04:50:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+rzTco+7fQp7WZWydorG6/Vw8s23rOxW1SECVccT+ronOW4dFkZRBskA4ygd4Rv1M9i7TYQ==
X-Received: by 2002:ac8:5ad3:0:b0:494:b722:141a with SMTP id
 d75a77b69052e-4b313fb8f60mr107757911cf.13.1756813835705; 
 Tue, 02 Sep 2025 04:50:35 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b04132c77d9sm665564666b.20.2025.09.02.04.50.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 04:50:35 -0700 (PDT)
Message-ID: <4dff9cc2-2152-48a0-b8ab-eea57ce2ace2@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 13:50:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Document static lanes mapping
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
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
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20250902-topic-x1e80100-hdmi-v2-0-f4ccf0ef79ab@linaro.org>
 <20250902-topic-x1e80100-hdmi-v2-3-f4ccf0ef79ab@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250902-topic-x1e80100-hdmi-v2-3-f4ccf0ef79ab@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9k1d-YucNF2KR7O7QMEd28qgbixGcw8j
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b6da0d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=TNrL9Qa0OoqJGZUcVMkA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 9k1d-YucNF2KR7O7QMEd28qgbixGcw8j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX+YowbGwWE+pP
 pWlrWguBpHiJGC14jXDeeRNSbqh2z3ZFydlQnxG304OJbJJoSsELVxVN/eFMWaBAtSRTch/fBP4
 QyUXruICj18GOvOFHnF/CG/OijbxFbge/JJJX+j6PhxqczXO4YTpoLHc8nF0gySOiV+jc//T28Y
 N6iJrRc26/sDLtEAtTu94DUKT2Q5ioYN2Tp2wrQYh0gf3dcwhmZS3CMCIM4wt6hlBAvAQ60i+u5
 So9B1g7MnrJjAGSuTInb+UWlOOOTT57545IZQ2Y6sxwW/BRejpE8q54Cb8x45sv3DR2NRS209Ih
 ZQcPy+aPnXVdj6Z2hNY2TwDbJIrjjUao0MBpEwzuC25vHK3xgUHAEhWKAfmTCEx0L3nNxVxNTVu
 0SIcpe/l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
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

On 9/2/25 11:00 AM, Neil Armstrong wrote:
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

Would

oneOf:
  - [0, 0, 0, 0]
  - ...

or something similar work here?

Konrad

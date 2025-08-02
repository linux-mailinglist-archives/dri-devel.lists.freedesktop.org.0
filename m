Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B81B18DD9
	for <lists+dri-devel@lfdr.de>; Sat,  2 Aug 2025 11:56:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF91210E3E4;
	Sat,  2 Aug 2025 09:56:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eOMTQSLa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2750810E3E4
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Aug 2025 09:56:30 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5725f1Qc007562
 for <dri-devel@lists.freedesktop.org>; Sat, 2 Aug 2025 09:56:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=tgapHTEIyirK94bcuh79Jkb2
 NHYVIyca+jtZheFWZ+c=; b=eOMTQSLaaM+CPoqDc2v/btTMTF1q7UxFxQ959aCg
 IqSx3thWCL0zZ6fNRr9MUFDd1ykMheaBZd0IkF+rgaMjUPeWsYb0OxQtqPX33UBY
 tshAm3VwA8ldYiXAkkfB0ydBgxnpciOwqiLGSsN/wdDWkSHcEcKY39zjUE1BxJTf
 MBuftNk2bjbjyw9LKC6R3YbxUF/mVOP6K5tqY8SfReM24BTNx7cesNrFDjjYBDQd
 qD8EPrhwCpV29BZO6Qp394fdKPI/6EmG6oU009mRqptUAoEvyKlnFnrxLsle+kvo
 /H9HzMdErvwxNxudQi7/D95NKVPml/8r4OfZJUHfOQ0LCw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4899mvrpm5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Aug 2025 09:56:29 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-7073cd24febso14660736d6.0
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Aug 2025 02:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754128588; x=1754733388;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tgapHTEIyirK94bcuh79Jkb2NHYVIyca+jtZheFWZ+c=;
 b=bQO7YOUiz/7wPNYN+HXjS9zMkzk3YEuB7j8oFTAJ18PLD1w1VXlcf8yScguyr762Kx
 rq7MijEB051uXGWrgAwZfgYknUTfGpuI08QeuCrer4ZZ/aL25W3PGNsER6eBoEXAiuU6
 jdWHt4pRCB2CDmGWL5a/yc+lGu+bDYSKQoVR0nt/IkcNQdGO4W14/rUVr747XhA2ms4R
 dxcD3gwcWud0HUwtXFthxWtN0TN4TinxQY8SJMOj3YWg76x+XgiWRFNGKwtrMWmUIZSv
 d5ImzYezk20XM6FNUcUVYbIKL9Tc9P2nEi6KeNDZ9BXKAX0cW8onz6dvJpwZ+LrAnKwc
 GUXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMvsBBwlq7diXMkupR7O7XgZL8vx7as9g8HoDiig1k3AvP2J5LpEBKx3FSTUtIW+oNBwu94V0zMoM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIiSEaw54IzuwcA9a5cUxm30S4uaI/Xao/6ynQSRL0qUD1kz4O
 NDOWh88wRMOXHxM3F55vRUOBqSc8WzVa37AfsUcv+7kzMRur7wXYiUIjqm3fWVh05Gysk1eVo4l
 Khdsypg5pZMNdM+JwQ1tRtP2nM0C/m7RuJKu8LoOOP1aB7Pon2x11XRe2YlctUFxkMKl+DSI=
X-Gm-Gg: ASbGnctXvOFv0rF3kED8gac3t7zU64j8GXpYa9Y/uw0q83THUwvc7HyJ6lLCBGD1hJY
 oxSBwPdcVeNWYcgqq94snvbwjYL3P+VEyVBRsqr8cnSabWQwWTmXQN0rE+mnK7Np1kUbe5u0jP5
 SbV7vzKJWGs3kTnrqpX2cMeo5v1NGeEayHZ1b1YqEdV9JDd2nyjrQF1DBUi0xsAMjVWjE3lFYT/
 g3lhgjY0iYk3O7iJ2DmH9RdnacYMAav8M7xT7sf/wDowWUCrqfZYkBS5pZj8frdpqKko8ZwBGO7
 8m6KQvnL7thEmu81uY/1fRXV2Z3uhjBLjF+0/vP/iF86WsgBCo1p4Nb178DSy/+u3fcucv0nL03
 J1uY+LVfUZ3lfU11BKyhJKvIDGge7u7UzCUXCbAPIjf/ROWIDKxQh
X-Received: by 2002:a05:6214:124c:b0:707:452e:1e9b with SMTP id
 6a1803df08f44-709363276c0mr30228516d6.44.1754128588141; 
 Sat, 02 Aug 2025 02:56:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWmPmGi7bSzZLL/ufth6B1UYrxlQ6n2myVT51dGj1PWD8ll7fyJ3i928JLrowb7W4FELQxbw==
X-Received: by 2002:a05:6214:124c:b0:707:452e:1e9b with SMTP id
 6a1803df08f44-709363276c0mr30228296d6.44.1754128587672; 
 Sat, 02 Aug 2025 02:56:27 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-332388fb356sm9193871fa.61.2025.08.02.02.56.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 02:56:25 -0700 (PDT)
Date: Sat, 2 Aug 2025 12:56:24 +0300
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
Subject: Re: [PATCH v5 3/5] dt-bindings: display/msm: Document MDSS on QCS8300
Message-ID: <deefg7w3ot6cd3woexfwagetmkg4nvu37f66h4ulbdqegdgi3u@plj6puxcsil4>
References: <20250730-mdssdt_qcs8300-v5-0-bc8ea35bbed6@quicinc.com>
 <20250730-mdssdt_qcs8300-v5-3-bc8ea35bbed6@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730-mdssdt_qcs8300-v5-3-bc8ea35bbed6@quicinc.com>
X-Proofpoint-ORIG-GUID: RReNahyrWHJ4-8hvl38oWUpOkqItV-6L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAyMDA4MyBTYWx0ZWRfXxXPMYDZxO3Xq
 /FykZU3Bq79AAI3PFa7SMuPQbbtgqMk0A+AoSZCgMieZSC+rjNwWjrs4pxSByewbbPIC3NhzxTo
 uTIppWMgMigE9CFju1EymBv43FkbV7/8UjptEtIVNzfVzIzRoThy3E9FAiNd8xGkiEvWIf7ptqh
 enOFOtAAA/f485k0WCAiwHC0uXBwRQalz+dicZO/vQLKNilOyG4NgIgMPzsp0hwWr5ENT7WwQj0
 lY7kCGk6SxP3aW/hEIm1RhvWswO+XCISpxfh76QyQCw5jWht7V8KEp6VVLhZFoZL0/CEGTTlYVH
 113EW/rrNj1F2q+MJILd45o1lfWlofVN8CVPtBQfiFQitMj4gC0YS0g7DeftDPfJ49PW71cn/zp
 hUnvF11N+/+DBrraYOFe4LiAGutTHBMinPh6BnIMqRGEm9QL+S0pwvjiVxH+cslJ0m10IgMF
X-Authority-Analysis: v=2.4 cv=duXbC0g4 c=1 sm=1 tr=0 ts=688de0cd cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=BQMJ-ZqQIgEHPhERFsAA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: RReNahyrWHJ4-8hvl38oWUpOkqItV-6L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_08,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 spamscore=0
 phishscore=0 clxscore=1015 malwarescore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508020083
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

On Wed, Jul 30, 2025 at 05:42:28PM +0800, Yongxing Mou wrote:
> Document the MDSS hardware found on the Qualcomm QCS8300 platform.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 284 +++++++++++++++++++++
>  1 file changed, 284 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..ae4bc16395326bffd6c9eff92778d9f207209526
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
> @@ -0,0 +1,284 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/qcom,qcs8300-mdss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. QCS8300 Display MDSS
> +
> +maintainers:
> +  - Yongxing Mou <quic_yongmou@quicinc.com>
> +
> +description:
> +  QCS8300 MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks like
> +  DPU display controller, DP interfaces and EDP etc.
> +
> +$ref: /schemas/display/msm/mdss-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,qcs8300-mdss
> +
> +  clocks:
> +    items:
> +      - description: Display AHB
> +      - description: Display hf AXI
> +      - description: Display core
> +
> +  iommus:
> +    maxItems: 1
> +
> +  interconnects:
> +    maxItems: 3
> +
> +  interconnect-names:
> +    maxItems: 3
> +
> +patternProperties:
> +  "^display-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,qcs8300-dpu
> +          - const: qcom,sa8775p-dpu

Use contains: instead of listing both of them

> +
> +  "^displayport-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,qcs8300-dp
> +
> +  "^phy@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,qcs8300-edp-phy
> +          - const: qcom,sa8775p-edp-phy

Use contains: instead of listing both of them

> +
> +required:
> +  - compatible
> +
> +unevaluatedProperties: false
> +

-- 
With best wishes
Dmitry

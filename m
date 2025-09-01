Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2D1B3E355
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 14:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D2610E44B;
	Mon,  1 Sep 2025 12:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WkV3fYSI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F1F710E44A
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 12:39:07 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 581B44vn025467
 for <dri-devel@lists.freedesktop.org>; Mon, 1 Sep 2025 12:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ag+uc2sfSISlJdM0Nw82xpwB7MNtUR0GdzbeqIRcIGA=; b=WkV3fYSIlVrcFM2Q
 IZe+oZy7wvsT7uLcQpkSKNJpdIfj5VXYmI5Bf4jwrwSjZHOZLvxx283DBy8YoJ5Z
 o5N0LHt97jEiriRn8qt/G/apE6Bxg5XEHB2DXDp83U/EM6jhzeDSDyB+9+AIww6X
 Db0gDmfkYh7DR1QWBFvD3iOrTmLTzBbYWHKBB9eDNFilJcur074t5jsncIa4Pf8g
 17uq7FUtQ4KvRqMv/9TJUvWwW6DlcVAmFcQl1zWcoCpCVRvlQrzmapq2D7zhD4j+
 e1S5WXiIubJsugnSCXjw7PiipAnBrcEIzuFIW3gTi1+x7NrByEIeRTscDdb5JcPq
 SqPptQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urvyvsyc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 12:39:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-244580538c3so11582405ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 05:39:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756730345; x=1757335145;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Ag+uc2sfSISlJdM0Nw82xpwB7MNtUR0GdzbeqIRcIGA=;
 b=cDMRmtBHRLops2VrrT0cpe83DlNPMWNauOHcVZU+CdQsXN2uxd4uQqnUlYHZe4iPNL
 +OMgxMTHhmSWZ31d4Ix+/BBEQX8/islTwCarHJgn9xw3yCr1ugOqYwO/TAsZkxKxQeg4
 zdVTkecyra1xjrhVtEOTtCOFArTis7bk89iHDdztW5aOYteF/JAXJ0Z8wawBHRHqHkcw
 9jpiGV2dPiLaCVXYm/IFc3jW4PkZrrs9N7uPUrsFyQtytptF8bCS/01oDJZ/iIJoPGhc
 JGW8mjNopN4miKQiyxVo/tx8EmtTDXVqg9PI/NdrHrPom8ZzxKPyca+GO9++lyKyvK4W
 KGFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZugqnZV3HDJhs3FktgE59ehC787mOCmIRV40ML9O9skaLOv+1+g8kQOKS7bTY5u1L4gAlYUFz5tw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdYYWx2caOad/LxfVQ8BuvfnXR3F1696ADfp8IsI31P1Zht/nn
 RrYeuM2H+OuoUeYT4UEVwmoC+WonEVZALFy/UbvEiYE5vuDa/M4Iy4ZtXHhwqoryUZbRyMP0lVI
 /Y7cdIhAyBgSdsZSH0pq8U8WbaRwvwXnLjIZqetI/QHcwwWYWFV/cE7nftdypMYinidyZ/uM=
X-Gm-Gg: ASbGncunsVSz4tI/rWJOnmONTw3DEde0EkqU0QNKVawO4Do5sQw741pkBzfb8MpyJqB
 30Ph9lLW/4dfU7CiX7q0EOe+3lvPXhVgYuRt1axSmulyXUgRK20mzPHrYsxU7DcMtgp/VAWvgZI
 4V0zT/uDOOAMKa07LYUei8qx7DUSdEeC+ex8K0iKy3aj3ZO6SMhlpspwi75KjZ0crrljrHU2eIe
 calVnlMZSwWeVWM+xuha1RN2iJWcX2XrFv0F5jb7oALS43FstG4WgzxqW76wwLJ0Cv3B+SFdvFv
 kHQMxgEjbfpU088MfI0iHsXt63WSw3YvG3qHcR6w97Ia4c9WmiEBQQNUgZb5ThmV5cSnyIBQLjK
 3HFA9xz1ESzKYfEHOUB1BOFd/2R0zQA==
X-Received: by 2002:a17:902:d488:b0:248:ff48:8779 with SMTP id
 d9443c01a7336-2491e1ed5d2mr67830975ad.2.1756730345017; 
 Mon, 01 Sep 2025 05:39:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGenErKxO5/yYfNFbGUt4G6q+mh/TfyItFjo8JNUx5mpoIN5ZQtB3b2C6jXNrrW8UUGRc9ZyA==
X-Received: by 2002:a17:902:d488:b0:248:ff48:8779 with SMTP id
 d9443c01a7336-2491e1ed5d2mr67830675ad.2.1756730344486; 
 Mon, 01 Sep 2025 05:39:04 -0700 (PDT)
Received: from [10.133.33.251] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2490658999fsm101472765ad.112.2025.09.01.05.38.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 05:39:04 -0700 (PDT)
Message-ID: <04549ce5-fa14-440d-b5b9-f8ff059f632a@oss.qualcomm.com>
Date: Mon, 1 Sep 2025 20:38:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/14] dt-bindings: phy: Add QMP USB3+DP PHY for QCS615
To: Rob Herring <robh@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-2-a43bd25ec39c@oss.qualcomm.com>
 <20250822142230.GA3591699-robh@kernel.org>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <20250822142230.GA3591699-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pRHaI3Sd9kTgu8o5DJ349OZjJfXiXPy7
X-Proofpoint-ORIG-GUID: pRHaI3Sd9kTgu8o5DJ349OZjJfXiXPy7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX1MXdgRwQ+ZUx
 k439sctuKDQG5fHbRHVkbHSVuH53iAxEP0XQD1DwwSOct4yTe0ISb3ct9YWF3bvLbWMUCbwOgXg
 VyoM+zq5qURbVF2PM1X11ZQi1qfon2BA3R9JQ63tvCoGj3NguyWmBiIJfGowPFzhDRHV5cvmAkJ
 3wmOfpbqN/kp2qLQKM6qsxPpK6dbPDhKKwwbBFPBMRpmegnAO5j3AjYDSwIBG5NYgqSwzojlcU0
 SiUnSdIcPVxyC6CEzPjtFlLnyBSJO5m0FGxHEMDj8Sq6xBAGKHbJaAS4efdgxsBkPy2e+eUWiqW
 EH7HqNBSI5T0jj3oNtsow7AeinUBzRITKOKyY3yqhWuDkf9BfAJK/sHrqX+IwwX2PLjzSpdtg3P
 2XH+CCCS
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b593ea cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=mavVfetI76m9BAqSKQsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027
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


On 8/22/2025 10:22 PM, Rob Herring wrote:
> On Wed, Aug 20, 2025 at 05:34:44PM +0800, Xiangxu Yin wrote:
>> Add device tree binding documentation for the Qualcomm QMP USB3+DP PHY
>> on QCS615 Platform. This PHY supports both USB3 and DP functionality
>> over USB-C, with PHY mode switching capability. It does not support
>> combo mode.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml   | 108 +++++++++++++++++++++
>>  1 file changed, 108 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..c2b1fbab2930f0653f4ddb95f7b54d8fe994f92d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
>> @@ -0,0 +1,108 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/phy/qcom,qcs615-qmp-usb3dp-phy.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm QMP USB3-DP PHY controller (DP, QCS615)
>> +
>> +maintainers:
>> +  - Vinod Koul <vkoul@kernel.org>
> No, this should be someone who has the h/w.


I have discussed with Bjorn offline. In the next version, I’ll update myself as
the maintainer for this dt-binding.


>> +
>> +description:
>> +  The QMP PHY controller supports physical layer functionality for both
>> +  USB3 and DisplayPort over USB-C. While it enables mode switching
>> +  between USB3 and DisplayPort, but does not support combo mode.
> Wrap at 80 chars.


Ok, will update next patch.


>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,qcs615-qmp-usb3-dp-phy
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    items:
>> +      - const: cfg_ahb
>> +      - const: ref
>> +
>> +  resets:
>> +    maxItems: 2
>> +
>> +  reset-names:
>> +    items:
>> +      - const: phy_phy
> phy_phy?
>
>> +      - const: dp_phy
>> +
>> +  vdda-phy-supply: true
>> +
>> +  vdda-pll-supply: true
>> +
>> +  "#clock-cells":
>> +    const: 1
>> +    description:
>> +      See include/dt-bindings/phy/phy-qcom-qmp.h
>> +
>> +  "#phy-cells":
>> +    const: 1
>> +    description:
>> +      See include/dt-bindings/phy/phy-qcom-qmp.h
>> +
>> +  qcom,tcsr-reg:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    items:
>> +      - items:
>> +          - description: phandle to TCSR hardware block
>> +          - description: offset of the VLS CLAMP register
>> +      - items:
>> +          - description: phandle to TCSR hardware block
>> +          - description: offset of the DP PHY mode register
>> +    description: Clamp and PHY mode register present in the TCSR
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +  - reset-names
>> +  - vdda-phy-supply
>> +  - vdda-pll-supply
>> +  - "#clock-cells"
>> +  - "#phy-cells"
>> +  - qcom,tcsr-reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
>> +    #include <dt-bindings/clock/qcom,rpmh.h>
>> +
>> +    phy@88e8000 {
>> +      compatible = "qcom,qcs615-qmp-usb3-dp-phy";
>> +      reg = <0x88e8000 0x2000>;
>> +
>> +      clocks = <&gcc GCC_AHB2PHY_WEST_CLK>,
>> +               <&gcc GCC_USB3_SEC_CLKREF_CLK>;
>> +      clock-names = "cfg_ahb",
>> +                    "ref";
>> +
>> +      resets = <&gcc GCC_USB3PHY_PHY_SEC_BCR >,
>> +               <&gcc GCC_USB3_DP_PHY_SEC_BCR>;
>> +      reset-names = "phy_phy",
>> +                    "dp_phy";
>> +
>> +      vdda-phy-supply = <&vreg_l11a>;
>> +      vdda-pll-supply = <&vreg_l5a>;
>> +
>> +      #clock-cells = <1>;
>> +      #phy-cells = <1>;
>> +
>> +      qcom,tcsr-reg = <&tcsr 0xbff0>,
>> +                      <&tcsr 0xb24c>;
>> +    };
>>
>> -- 
>> 2.34.1
>>

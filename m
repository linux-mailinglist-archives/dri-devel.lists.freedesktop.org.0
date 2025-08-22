Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2F7B30F7F
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 08:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F232810EA6D;
	Fri, 22 Aug 2025 06:48:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mKgQV9n1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D1010EA6C
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 06:48:41 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M6HAxe010551
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 06:48:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wt7rxN5hrf2QPuy6mxcJXvWkksap7MeXMIyW8r0g2eE=; b=mKgQV9n1vTRZQ6/l
 ZmTEHvaDDWuplAmg+x+xQzrZWj7Q23cyJFazU3pCcvmYGX3IWW6xyIVNx2OKHBGb
 jWBWFhvfckHXnOrvurHn4GQ7DbqrMgwYADmJKhhAo+dvBvhD5tN6S5Dcme12cG1y
 QADsZ0sb66OXBbG923zTVl10ni7Jx7Fb+S4J8ezHu0hPd9FY3gOGcOmWJDhAprrq
 9WAY9zYCrTC8DPW2Pv7lLhDwEqVA7Mqj9nCcP/NmTZ1w9nr+rvyYO2r9dx4NeHzf
 CLum0i0zw+iX+nSY99LC2lg/gYa+TSC+OrgR2xy0pqXn6Hd/cNP2UA0gGT1uNzn5
 7w0iYQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngt8dx1k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 06:48:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-245fbdc2546so5593615ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 23:48:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755845319; x=1756450119;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=wt7rxN5hrf2QPuy6mxcJXvWkksap7MeXMIyW8r0g2eE=;
 b=e1jlFNz3mtpyGd4Kd3/yM4wnl/VgU5kmBSRyA0m+nQmBKHdvWpAVGZUa+URzgj541R
 iYf3niOiJpSVHJ77aZVgEf7P9WW4kImgX2vXjZ0QfG/zoSshlB2rD7Rj0rTXrXaRN+Ni
 W+t4o7cgvS4lD+VJQl66ZIjmibG2ek060S7w9tvPtNBQDKaE4byYb7gz5WihuQbuJofM
 PhoVzTrUSDFK3oDWrayD0Uvs7iYnmEqqlEonV6qOJ7QqNb4iI1tpJjcOXU9UfKdAOtvM
 NaRq4N44pY7YUjEsMREVxqsZHki2IU6TJ0Y2hK7wIRX6bI9Yeuq3RbIyTclCqiyBa5MG
 Ownw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMUD+akRlLYvOtAEIQ7NpglQjYUUrCRQp7fe8Jxo5QygVT7uwil9jrSzV1GlhCd7tXGArvojMOT5w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyK01jSBGxxXEZMD/qfwGx1A1HWtN9vA19kicPL++BCC45EdCNJ
 YZjqKd0fFc9mLqV7g7YHyIIbetpj0/79C8EOnbKyJBOP2A7FcyY1Td2Q94AARgZwXn2Mjqp38Eo
 5eQCgdjC+rxWLmKll23geVyY+X33TB1x0zTrH0Ni3QwMVjQ201SL5IcXSrSukHDfbu+8JUlA=
X-Gm-Gg: ASbGnctA15FpcePSnZ4HcEuAGxhaUI9wmNYcniV6tb5zSmVFPSoTgWSWsUNKjDi9GO2
 6OPMFv1Lih25cN8SeMiQoP3d5xytj+PpmrQWrCl9XB3cj/+P1jPu7PmrYzrvRQXs3IwQllHBbKe
 6IOGsR0idprTS6OsOcySMeUUYyLbGvZ53Az0yAsjCPFhdT+BN7XarksUQy3FbhOkuYResjUExRL
 oXUWAClbuJPgr3ufNBayO14DVtG/Vzlx7cYkPyBOK+6nwVTO1wG87taA3vOIMwJiw5VDhh0glhW
 5DzCRJkQzKWK+wpIDCo0Jv2N6A5rd43MGQzrSHcp8qxL+Uqyb579F1ZOen6Y9ZDYv03YGyH34T4
 hCWBEN2uG7ZWAIzbUWhG4WklLNppBgw==
X-Received: by 2002:a17:903:189:b0:242:d237:e20b with SMTP id
 d9443c01a7336-2462ee3033amr16554245ad.4.1755845318697; 
 Thu, 21 Aug 2025 23:48:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH61Dg+R7H0dG6DmZ19hrTFC03VFv8xBO0r6XYbjTLMp1iwo0A+Wvhyyylwysjt+0wtsntd1w==
X-Received: by 2002:a17:903:189:b0:242:d237:e20b with SMTP id
 d9443c01a7336-2462ee3033amr16553585ad.4.1755845316681; 
 Thu, 21 Aug 2025 23:48:36 -0700 (PDT)
Received: from [10.133.33.119] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed51c027sm74231315ad.148.2025.08.21.23.48.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 23:48:36 -0700 (PDT)
Message-ID: <dd3c9cc4-3b4a-4321-88ab-933909b6da87@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 14:48:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/14] dt-bindings: phy: Add QMP USB3+DP PHY for QCS615
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-2-a43bd25ec39c@oss.qualcomm.com>
 <tlilctwavwqw6oy46l5fote2pa6f4hdy2im6meo56cjaawba3a@a42bwbbfnsuw>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <tlilctwavwqw6oy46l5fote2pa6f4hdy2im6meo56cjaawba3a@a42bwbbfnsuw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNCBTYWx0ZWRfXw4yZDKdnJKOs
 cc6WQNQfMDyyWgd9349etb+ChyWmeAmaFp41pHky4yzjuNwYGJLsxGU2KTjZFcWQ/7pdhClzDEY
 sKV1dbjd1CcsfWR3jrGzuC/K1j2OTsdHcztqCs601UeXjNleBHcGiBHIx13D59QVb/mab9JeocH
 MxUhi2chiEtIfxVk7OLRv9IvjyEjBO2cxhnGgd2yuCarzBQS05tQDGyEU6PbvepYvPGoxtBPCkP
 85pR7CKhWUaBvEUz9ADy/8RRFkTfXiRHT7KX7PwNpvO3NAS4Nw1CaGMrfbRzp/FYqteGfPbt9va
 aRviakegIhakFDv35EFBCgEAJbZjh27ue4uauMss4nxeb1/1TaKhwEQT3upS/UuKNg/jSlzyhKC
 5ZbSO/d+T1LvV/HTc2wCsgCJ+coUxA==
X-Authority-Analysis: v=2.4 cv=c/fygR9l c=1 sm=1 tr=0 ts=68a812c8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=bGlgfQEnYdfhEoguRucA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: NIbYnvIkBKjmXsXmDCgBPY8JHjJ1yhAO
X-Proofpoint-ORIG-GUID: NIbYnvIkBKjmXsXmDCgBPY8JHjJ1yhAO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200134
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


On 8/20/2025 7:37 PM, Dmitry Baryshkov wrote:
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
>> +
>> +description:
>> +  The QMP PHY controller supports physical layer functionality for both
>> +  USB3 and DisplayPort over USB-C. While it enables mode switching
>> +  between USB3 and DisplayPort, but does not support combo mode.
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
> Missing GCC_USB2_SEC_PHY_AUX_CLK and GCC_USB2_SEC_PHY_PIPE_CLK


Ok, will fix in next patch.


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

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDFBB0D8E5
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 14:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEC1A10E66C;
	Tue, 22 Jul 2025 12:05:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cQ3mzrxN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9951510E669
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 12:05:19 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7fhvH012829
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 12:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iyIbCMFrlPdmkgoKqjBfMM2i4HyJIcVeeKjewThJMrU=; b=cQ3mzrxNu4xA2qQl
 15LSXW1qN4oae5WXWOBB3WKRr0CFk0URXkVWpuv8FyM3dDfrh1enzJIjYxsz1Nw5
 C+uTK+VtUmdGuo0uI2ojVSs8csmJvW5dPwV79wAH8Sxyz3mtsXWfXiBtb2kXZjfr
 MtF83WGtuMThSBrpjkvSjGFdNbzBfz8m5s9xpQ/mzXMkcWYqKx8v+YpQ/z9manIv
 wKE0UO8Z7FDY6XTjii8KQlLk0KgjDIKRH4P2HjWEYzZWPRzuLMUdloGJRKZdUyMM
 129Et38wqLP+ex0G+B3BfAGPQFZR5sGQESMY6IorZlseTIgDAgcXjOblYigbiiJM
 uyeibQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3em4m0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 12:05:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-23c8f16343eso17437695ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 05:05:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753185918; x=1753790718;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=iyIbCMFrlPdmkgoKqjBfMM2i4HyJIcVeeKjewThJMrU=;
 b=fdiLa1y5N4IG/gL8rlKzCVK30cuHjGzHKaW7q2RdTVkVWqLVZwPr3CYLBm6yewBzGw
 0FAowH+Qiq6y7pF9T+x6Rh7ZDpkRnVAFHZfvRdVzDXA57ohP/Dy8C6W1rxHJ98uQMkSl
 zzH4+t4OQSW+ZZsjRfhWuktQjatlE2LNUk8+9Bk9JIbXDTmdRp+IYsccVCP0mAyvfOez
 tS8bLkO9EFoV2IIFGexeSO+h6JG0W5/5qZdMANfT1vUWSsvvSieDfMnyxeodbpB4o+sv
 cBi8xsYgTERSVqc9cMX60Yr39VEteD/tLOsuUQUcSHmWhmbYHFelBITji9aiLVAG5Gnd
 DGvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsgdrODjmGTpzWYsJufX8Q0JBJi3onPYxWuTmqb9VYz0XtzZXjF6FtGhbqgH9fRmMdouawEU6CQf0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySrDj5g7M2b8MOaWKbxf/bBp1IKO0gbGybqiNuFUW3LaWXvDiQ
 WJmb0Q0ZWJC/BPBed6FbPotZqbjX2S3OoRTQx50cMl6nLEN1VSVw6qRwLjV41WeCDxZPFffC27R
 tiMZCdhVID3Wnr46F8Q48MqYEKpVBKdMAGArIMr1ntP/FEb2zYQ6X2w92+07Q/e4K4KQAtuU=
X-Gm-Gg: ASbGnctRdKaDctBkTmmhgqHr3ZftFGn88wVD5aGXdvPPxjSdIGMsAipRU7Zn8Cy5iYl
 5zPCollrfU3NRXInT5B1gktdd2Z3I+CxrVYXji3GfOw0iLKS5M7aYiNLy3xBGJ4C91QjNSbB7oJ
 7po0NnrtdHjnLM0qD30a8FlWgytBAKmBAXnDgekHMQuoGHEZJDVOCd4Nb5l3t2czW5T1k3mOeqj
 jUvb9l5kX4xQU7NegKss2DqB4kN61YmPxHtKA181VQb3pvhfO4tZSz/xMmiyz9izbQ2itOPY9TZ
 IQ3kDq7s00FZP9au9L7jd9Xtj+Z+fVj9mCWf5R7mDv7WvDZbLOd+NpAu2WGf/rTwN0ILoEPaw6H
 s/ppqrPW4nOHRMah5VlblKPniNkXc
X-Received: by 2002:a05:6a00:4fc9:b0:736:559f:eca9 with SMTP id
 d2e1a72fcca58-756e99fe5afmr14912572b3a.3.1753185917391; 
 Tue, 22 Jul 2025 05:05:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoGJCKiTPaM45TrN+M/E5LCa63vjhB/iRPsOdQ17RiEy//OhqN7LQOTuKba6p+/2B4x4JuLw==
X-Received: by 2002:a05:6a00:4fc9:b0:736:559f:eca9 with SMTP id
 d2e1a72fcca58-756e99fe5afmr14912493b3a.3.1753185915178; 
 Tue, 22 Jul 2025 05:05:15 -0700 (PDT)
Received: from [10.133.33.17] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f2fe8dc8fsm6980846a12.28.2025.07.22.05.05.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 05:05:14 -0700 (PDT)
Message-ID: <e673a3a3-6924-49db-9040-e34b82199a43@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 20:05:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/13] dt-bindings: phy: Add binding for QCS615
 standalone QMP DP PHY
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
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 konrad.dybcio@oss.qualcomm.com, fange.zhang@oss.qualcomm.com,
 quic_lliu6@quicinc.com, quic_yongmou@quicinc.com
References: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
 <20250722-add-displayport-support-for-qcs615-platform-v2-2-42b4037171f8@oss.qualcomm.com>
 <jemfu5sy7k4a2iar55im5bhyhxzlrwpftmpqmps3b2tco7r6a2@oodls7gi45yy>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <jemfu5sy7k4a2iar55im5bhyhxzlrwpftmpqmps3b2tco7r6a2@oodls7gi45yy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: g1D4_5N1juuD-J0HVL8mFA6_1kxjGTTA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA5OCBTYWx0ZWRfX1YGfY5im2G8N
 egHV4PuSQCj43DYS8g+7by9LSdEiLXhVrSO3NvHjepLmYy/ENCcMgYREG44JqKHA8nSw1KJvx5J
 iTfeYm072mBfbvjsfZ2gd/90VsLfo6QGk1qY0QR0sbY//MVfGf11NXr6WE9EFNkJXQBUdwZM9iF
 6Upn+bpu7pIG1u4OGMilj5cAj8MTajLO7Th87iHYnnW8i/JmObMp+58bqW7ZowphKrOQOaW1eWu
 1uYi2eBrNL3oE6H+75eiASv6atBS1FZ/N+dNdvbKyzS+d8INWDfGSSr78hIQ8Fccvpk2KZZvaMK
 WXIUXIPVNNdiQanVfPVmBh5k1NmXRpyXMDNGILEAFvJDreCQZ5YQIdfKZTqWTO78hIqCyLYQY7N
 R8hKWRqAxmGJ8I10BqbHV7jDGtIwsCmnbxjOLUVwDx02qlUuZxL0PxgdphRkK8We4sMaCdB+
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=687f7e7e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=Oh2cFVv5AAAA:8 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=cRT8ne84DSJdP7yTid4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=7KeoIwV6GZqOttXkcoxL:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: g1D4_5N1juuD-J0HVL8mFA6_1kxjGTTA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220098
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


On 7/22/2025 4:38 PM, Dmitry Baryshkov wrote:
> On Tue, Jul 22, 2025 at 03:22:03PM +0800, Xiangxu Yin wrote:
>> Introduce device tree binding documentation for the Qualcomm QMP DP PHY
>> on QCS615 SoCs. This PHY supports DisplayPort functionality and is
>> designed to operate independently from the USB3 PHY.
>>
>> Unlike combo PHYs found on other platforms, the QCS615 DP PHY is
>> standalone and does not support USB/DP multiplexing. The binding
>> describes the required clocks, resets, TCSR configuration, and clock/PHY
>> cells for proper integration.
> Simply put: no, this is not correct. Even if you go to the SM6150 block
> diagram, it points out that DP uses the USB3 PHY, not a separate DP PHY.
>
> I thought that we have discussed it beforehand.
>
> I can quote my comment from the previous thread:
>
>>> No. It means replacing extending existing entries with bigger reg and
>>> #phy-cells = <1>. The driver must keep working with old node definitions
>>> as is to ensure backwards compatibility. New nodes should make it
>>> register two PHYs (USB3 and DP). On the driver side modify generic code
>>> paths, all platforms supported by the driver should be able to support
>>> USB3+DP combination.
> Looking at the hardware memory maps:
>
> MSM8998: USB3 PHY regs at 0xc010000, DP PHY regs at 0xc011000
> SDM660: USB3 PHY regs at 0xc010000, DP PHY regs at 0xc011000
> QCM2290: USB3 PHY regs at 0x1615000, DP PHY regs at 0x1616000
> SM6115: USB3 PHY regs at 0x1615000, DP PHY regs at 0x1616000
>
> Now:
> SM6150: USB3 PHY regs at 0x88e6000
>         USB3 PHY regs at 0x88e8000, DP PHY regs at 0x88e9000
>
> I do not know, why msm-4.14 didn't describe second USB3 PHY. Maybe you
> can comment on it.
>
> But based on that list, the only special case that we need to handle is
> the first USB3 PHY, which doesn't have a corresponding DP PHY block. But
> it will be handled anyway by the code that implements support for the
> existing DT entries. All other hardware blocks are combo USB+DP PHYs.
>
> Having all of that in mind, please, for v3 patchset implement USB+DP
> support in the phy-qcom-qmp-usbc driver and add the following logic
> that also was requested in v1 review:
>
>>> Not quite. Both USB3 and DP drivers should be calling power_on / _off.
>>> If USB3 is on, powering on DP PHY should fail. Vice versa, if DP is on,
>>> powering on USB should fail.
> I think our understanding might not be fully aligned. 
> Perhaps this is because I didn’t accurately update the mutual exclusion relationships and test results for the different PHYs. 
> Let me clarify my latest findings and explain why I believe these are separate PHYs that require mutual exclusion via TCSR.
>
> 1. About the TCSR DP_PHYMODE Registers
>
> MSM8998/SDM660:
> 	Only one TCSR_USB3_DP_PHYMODE register at 0x1FCB248.
> QCM2290/SM6115:
> 	TCSR_USB3_0_DP_PHYMODE at 0x3CB248
> 	TCSR_USB3_1_DP_PHYMODE at 0x3CB24C
> SM6150:
> 	TCSR_USB3_0_DP_PHYMODE at 0x1FCB248
> 	TCSR_USB3_1_DP_PHYMODE at 0x1FCB24C
> Even though MSM8998, SDM660, QCM2290, and SM6115 all have one USB3 PHY and one DP PHY, the TCSR DP_PHYMODE register configuration is different on each platform.
>
> Additionally, I found some interesting register documentation for QCM2290/SM6115:
> 	TCSR_USB3_0_DP_PHYMODE: “In kamorta this one is for mobile usb. DP not supported.”
> 	TCSR_USB3_1_DP_PHYMODE: “DP mode supported for Auto usb in kamorta.”
> I think the reason for having two different TCSR registers is to allow both the USB3.0 and DP PHYs to be useds at the same time in certain product configurations.
>
> 2. SM6150 Test Results
> When TCSR_DP_PHYMODE_0 is switched to DP, the USB3 primary PHY cannot work, and the DP PHY is also not functional (possibly due to clock lack or other configuration mismatch with this TCSR setting).
> When TCSR_DP_PHYMODE_1 is switched to DP, both the USB3 primary PHY and the DP PHY work normally.
> I think "why msm-4.14 didn't describe second USB3 PHY", because TCSR_DP_PHYMODE_1 always works in DP mode.
> https://android.googlesource.com/kernel/msm/+/af03eef7d4c3cbd1fe26c67d4f1915b05d0c1488/drivers/gpu/drm/msm/dp/dp_catalog_v200.c
>
> Based on these info, I believe these are separate PHYs, and only the TCSR DP_PHYMODE registers determine which USB3/DP PHYs are paired or mutually exclusive. This is why I have maintained separate private data for each PHY and implemented Power on mutex control via TCSR, rather than using a qmp_combo-like structure.
>
> Given the above, do you think we still need to force USB and DP to be strictly bound together like a combo PHY?
>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  .../bindings/phy/qcom,qcs615-qmp-dp-phy.yaml       | 111 +++++++++++++++++++++
>>  1 file changed, 111 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-dp-phy.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..17e37c1df7b61dc2f7aa35ee106fd94ee2829c5f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-dp-phy.yaml
>> @@ -0,0 +1,111 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/phy/qcom,qcs615-qmp-dp-phy.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm QMP PHY controller (DP, QCS615)
>> +
>> +maintainers:
>> +  - Vinod Koul <vkoul@kernel.org>
>> +
>> +description:
>> +  The QMP DP PHY controller supports DisplayPort physical layer functionality
>> +  on Qualcomm QCS615 SoCs. This PHY is independent from USB3 PHY and does not
>> +  support combo mode.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,qcs615-qmp-dp-phy
>> +
>> +  reg:
>> +    maxItems: 4
>> +
>> +  clocks:
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    items:
>> +      - const: cfg_ahb
>> +      - const: ref
>> +
>> +  clock-output-names:
>> +    maxItems: 2
>> +    description:
>> +      Names of the clocks provided by the PHY.
>> +
>> +  qcom,tcsr-reg:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    items:
>> +      - items:
>> +          - description: phandle to TCSR hardware block
>> +          - description: offset of the DP PHY moode register
>> +    description:
>> +      DP PHY moode register present in the TCSR
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  reset-names:
>> +    items:
>> +      - const: phy
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
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - clock-output-names
>> +  - qcom,tcsr-reg
>> +  - resets
>> +  - reset-names
>> +  - vdda-phy-supply
>> +  - vdda-pll-supply
>> +  - "#clock-cells"
>> +  - "#phy-cells"
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
>> +    #include <dt-bindings/clock/qcom,rpmh.h>
>> +
>> +    phy@88e9000 {
>> +      compatible = "qcom,qcs615-qmp-dp-phy";
>> +      reg = <0x088e9000 0x200>,
>> +            <0x088e9400 0x10c>,
>> +            <0x088e9800 0x10c>,
>> +            <0x088e9c00 0x200>;
>> +
>> +      clocks = <&gcc GCC_AHB2PHY_WEST_CLK>,
>> +               <&gcc GCC_USB3_SEC_CLKREF_CLK>;
>> +      clock-names = "cfg_ahb", "ref";
>> +      clock-output-names = "dp_phy_link_clk", "dp_phy_vco_div_clk";
>> +
>> +      qcom,tcsr-reg = <&tcsr 0xb24c>;
>> +
>> +      resets = <&gcc GCC_USB3_DP_PHY_SEC_BCR>;
>> +      reset-names = "phy";
>> +
>> +      vdda-phy-supply = <&vreg_l11a>;
>> +      vdda-pll-supply = <&vreg_l5a>;
>> +
>> +      #clock-cells = <1>;
>> +      #phy-cells = <1>;
>> +    };
>>
>> -- 
>> 2.34.1
>>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C2FB27AE4
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 10:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0217210E24B;
	Fri, 15 Aug 2025 08:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="W1t5KgYc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE1A10E24B
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 08:25:56 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EIbiC7025642
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 08:25:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NUp9id380DZ/OObz+oDgJw+5UIsJFHPyVrQSjaIg6Ws=; b=W1t5KgYcqdcplNA4
 +D82pGSLq3f6/jEw27m8UaioPHPr5G0p56AbZj8pd/ObiLuCLZtHBBkrYhVFtRUp
 +F/NSRM/ZTFYeiXX57+JgQcIQoDKrSrLDmH4tcxoF8+gFapaaDONaUWtHMAy7pR9
 4CziGzqTrHUqJGg13hwGUJfAVKPp6XdA86OuwVE6XvP+zyuCrLudrV2ufFnkMmOd
 k5RrWiYxKwEVbN13T3ynLEH+idGR4d1d3+NY9LPlaMbpd1FxRvviBZ1G5jqHMQDg
 yllh8mrD3zg7QkmZsTW9ZPxubBe5sfvCjmFWLGn/tDzr0aiodKs75icaFxS++avr
 yZ2wEQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3gjds6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 08:25:55 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b47174c4345so22924a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 01:25:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755246355; x=1755851155;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NUp9id380DZ/OObz+oDgJw+5UIsJFHPyVrQSjaIg6Ws=;
 b=vYTlHM2e2PMiZYcmBic3X7tFqvEc+229sbcsIuUjuqB+MTOPJcRNOBYD+4zaE+FBff
 IkJQe1wewH5P8CZkItad4WcshhtkKdlN0OrVN3FGdzMRKA61+OAnm+fsqoh++17PhMek
 bI01WJOVUYA4X2WA+erCVLRgpB6+dFrHgD09h51WOKKI1LkJR9e01brmD/iH2Gu2X65r
 3qizHWLwg/1WBViG4URZdxb7xjOJeqrxSJmFnXu7PlRraNlouUblkhP2DCSD0GZx8H2/
 y5lsuIJ/49paySPcw9eoOrgIHSqFV2GooNPvQV1W2H/6JJHMPEWDVB8WjaP2k55R9UtU
 6wPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAIjgSYHBf++eojdXKoMGIP+mMEWQdSIPt02KKvQYCFq3EeTv8QQahN5zW86lNvyb8GRpQLaYb63w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTA76yn7Br/IjaLvrQR1maWx18EOaGUbftGRYrL27JRtsBAd5G
 qbDGWGQFTUeD8TXce4hfb8bex8Xgg5Ia0RjH/fYZtWSx8RMa5qnVKTRdvY/oYyzSzxiRS43fSI7
 LFWOEKEoJwy3CwRng37KyGoSjXUu3bWrySZe1B1GydsmCXXgiAXAQsajJK4wHU97pV/k9Bsc=
X-Gm-Gg: ASbGncuioUcSW0ZtlS1uW9YAlLInP5jCeAWWqNqVTf9LVA1ojhX86HjryIKdL9z4PqU
 ieVZduw0j8gIxHHNWwDepbF3JDEOSghyJCWcdUdja9cO6sPhABMqO/pbkm1kDcoFvad1i6moj6h
 16zeP4T1ZKFDsXYWeCOIHFKDRsIxa+8D0cWRd29GVd8df6y/hAuWGytHxwQXuGXnQVSubLiEE4k
 sxNxhb5kJs8MqyaSuvGS/5bDMQheaoh1+FEVLsCdeMC334fjv1DhySy1Wk6F7OIdzVA09/qXHwF
 wpQmcYtSIh+cFo+Fbq6oBg0mSsXTEBxMGiBY+jpNUfEqhRTqghPrP+VzTxHsAReOsXD2VvBFpDy
 Y9QKLl+djs/PoIxheFWuV/XJnATdg
X-Received: by 2002:a05:6a00:1393:b0:76b:cf2b:18ab with SMTP id
 d2e1a72fcca58-76e446b43d3mr731568b3a.1.1755246354735; 
 Fri, 15 Aug 2025 01:25:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlOGconyNmSJveNt3MkVQqNUPji6K3KxwQpbezFFRgXr8JkSt+WNcYJk1eoULrcB7MfzyFyg==
X-Received: by 2002:a05:6a00:1393:b0:76b:cf2b:18ab with SMTP id
 d2e1a72fcca58-76e446b43d3mr731532b3a.1.1755246354054; 
 Fri, 15 Aug 2025 01:25:54 -0700 (PDT)
Received: from [10.133.33.10] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e4558a81asm629191b3a.83.2025.08.15.01.25.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Aug 2025 01:25:53 -0700 (PDT)
Message-ID: <661789d6-5fbe-4915-b70a-5ff2466c7a26@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 16:25:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/13] dt-bindings: phy: Add binding for QCS615
 standalone QMP DP PHY
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
 fange.zhang@oss.qualcomm.com, quic_lliu6@quicinc.com,
 quic_yongmou@quicinc.com
References: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
 <20250722-add-displayport-support-for-qcs615-platform-v2-2-42b4037171f8@oss.qualcomm.com>
 <0c94206c-f70f-4bed-81ec-bb2870748121@kernel.org>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <0c94206c-f70f-4bed-81ec-bb2870748121@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689eef13 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=P-IC7800AAAA:8 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=0gnJL556ed7yCVVD25sA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX35g1PZcGQZfE
 6PiOvF3KgyO+51RkKPKs1Ncr84/qSxPqHqDxZaDcOGsrt0u0RWZEI58/+fYacBQGme4+FFLk61a
 IMl4kBLQ1vziyIFQuu5WI7grbRzJwdIl8+/ip3IJdcBsMnS4FEi+QZpQ6yklebhZbq48Hajr8X2
 8JhHNNmkB1Znm7Q9nLxaeyDOe1GrUrtYG6Ga2JwbHakLTjcyH/Le+LG9MMv9x81CatLX7fkXWlh
 U3BktthyyOvygDhBj01IpX8wDdAXquICG2e1PoQVAiQdvHZyIXyhICD8E/ax8qGysCIOecMGarc
 D8NnIXX/oEQ1iHk1QibsgnoPk8oeL/N8WXIF2GQfTbwjgObL5pybhZbWN0qAHfmVwm+nX5nxIit
 XOzpvBMT
X-Proofpoint-GUID: 82hKscCrQHFSBi0MsR41XEBeraMQqFB6
X-Proofpoint-ORIG-GUID: 82hKscCrQHFSBi0MsR41XEBeraMQqFB6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031
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


On 7/22/2025 5:18 PM, Krzysztof Kozlowski wrote:
> On 22/07/2025 09:22, Xiangxu Yin wrote:
>> Introduce device tree binding documentation for the Qualcomm QMP DP PHY
>> on QCS615 SoCs. This PHY supports DisplayPort functionality and is
>> designed to operate independently from the USB3 PHY.
> A nit, subject: drop second/last, redundant "binding for". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

Ok, will update subject in next patch.

>> Unlike combo PHYs found on other platforms, the QCS615 DP PHY is
>> standalone and does not support USB/DP multiplexing. The binding
>> describes the required clocks, resets, TCSR configuration, and clock/PHY
>> cells for proper integration.
>>
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
> That's too vague title. You are not adding here Qualcomm QMP PHY
> controllers.

Will update to 'Qualcomm QMP USB3-DP PHY controller (DP, QCS615)' in next patch.

>
>> +
>> +maintainers:
>> +  - Vinod Koul <vkoul@kernel.org>
> Hm? Why?


I referred to the definitions in qcom,msm8998-qmp-usb3-phy.yaml and qcom,sc8280xp-qmp-usb43dp-phy.yaml.

I also found that Vinod Koul is listed as the maintainer of the GENERIC PHY FRAMEWORK in linux-next/MAINTAINERS.

Did I misunderstand anything here?


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
> I don't understand what you are doing here. Why previous patch evolved
> into this? Where is any reasoning for that in the changelog? You said:
>
> "- Add new binding qcom,qcs615-qmp-dp-phy.yaml for QCS615 standalone DP
> [Krzysztof]"
>
> but you must say WHY you are doing things...
>
> Anyway, missing constraints. Look at other Qualcomm bindings.


I misunderstood your earlier comment in '20241129-add-displayport-support-for-qcs615-platform-v1-2-09a4338d93ef@quicinc.com' and mistakenly included "[Krzysztof]" in the commit message as if it were a quote. 

Apologies for the confusion and will drop this part in cover letter in next patch.

In next patch, the address regions will be consolidated into a single range, similar to other QMP PHYs, and |maxItems| will be updated to |1|.


>
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
> Drop description, redundant. It cannot be anything else.


Ok, will drop it.


>
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
> Drop reset-names, useless.


In next patch, this config will be updated to USB or DP PHY binding with two resets: 'phy_phy' for USB and 'dp_phy' for DP.
Shall I keep 'reset-names' prop here?

>
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
> Why introducing completely different order? See existing binding and DTS
> coding style.
>
> Best regards,
> Krzysztof


Ok, will update to follow the existing order.

compatible
reg
clocks
clock-names
resets
reset-names
vdda-phy-supply
vdda-pll-supply
#clock-cells
#phy-cells
qcom,tcsr-reg


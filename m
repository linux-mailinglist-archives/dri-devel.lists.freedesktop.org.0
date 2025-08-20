Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35235B2D9B7
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 12:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FEBF10E6DF;
	Wed, 20 Aug 2025 10:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YmwPi891";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A7C10E6DF
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 10:09:45 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K9fHUr011382
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 10:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ZzyoXjeixwKONwz/qTB0oBJK
 sSvE0kt0Ll8kNycredI=; b=YmwPi891MF9yI/eE9XHNxDGzZXiEBlcE8USI/+mj
 sJuh4fyQf9+6VxY40cJQnz7OCMH/t2x+K7wS4rBP6rcOzkxzzt9BSskD5T6g9EHC
 HuuDdUJBnAlYeTsNlJr6NdwT1gnRYaum6Pf/RRs/JsNNR3ruQe/pP4s3quHbescH
 2uijlbvytgVZ/ExVCW3neaiKd9Uz+mvfH06/Otw1bUck/7TvlPbHH7JEjIrg7a2D
 97OweyxTjdKHhqOdbWkpAD/g+PMI6HxqozGdt9pFJ9FID06rTlGbMGeoe3MSwPfE
 xhfjtdomv2rcZNr+u8jgyixSQuRrNGXiYi4LKlp/pZPcbw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52bhbfv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 10:09:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b10ab0062aso169324481cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 03:09:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755684579; x=1756289379;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZzyoXjeixwKONwz/qTB0oBJKsSvE0kt0Ll8kNycredI=;
 b=MfEbvlPe/fuTi2AcbCI4u7CF32nBenE0AOdixsYLugBoIU8R7kkDBwXYkhPIm7Tg4/
 9SKcPAA5rikubOVf8jw/bec4yGfTw23mVVIkdMTgeC8qUcwVCiNrIrqJhhwQtgTms7SA
 D8cQakvVSr8+5FTHZmM1r/Rm1oJZID4IE9qgkqPb5vuv07kOX8qtJrKVsVFTvcajTbvK
 w4cAwTIf6LPYxiQC/5HiaMP0pQH8gpqw4H1TJ4hksyRFnYcXj5USLLKhqJVkXPvqS3ss
 KJ/H20xsNRFkD0HhnUFXJDHxj5gEqhe/rlBs6CS3UFCs4/DpdvVhFp6OGH3xl1cuEgqz
 95oQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWO7OBwZI7kIcDs3XnlsrCJVi4kAnM1Zqs1qh+4xMihYyR14vgBk9SnnacmtPC34H0FRpRvmq83Tmk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsSRQqlxQgH6LEdLhBObDeXiQGohlg/quO8RXUCVLnEnDmKI6e
 T6reOVU0qGQxaPnBrTgf0f+EZwmLTHYPGSZAJOFRiRFKZ3RBQts6+IH9AcILfV1DpxiU8zZD9nM
 MZx8kUFzEExD3vMAlNFWbQK3uKNjjltY92dgYH/ng9l2FLqIt6DfivJ0kH96Tc7RoskRVyUs=
X-Gm-Gg: ASbGnct38PuVAHc5dYKH3BS6Y3hRlnR0oaTp2xzjZfEZ1JTntv2+YEOsoqTIjHGeX1/
 qOut0wTgHq1PoAQnBU3SfIdsblvu2D7yzDsQe7UtLLZllvGXTMjj8DhfLwmKWGcCJBMR/sU9lIL
 KuTvA1mXZsRtRGQAW6zu6nwEIaVT+e5nA5pJrJmGG1jj1am6ui7/bxgYl6Qu+5f4l3nMiRBT9Ns
 KTrKk1i68/sNx3/J35+8thUtm7oLYFZp2I/WToE8Ith6lI6J22tvdbbK24blygKdv+rMCNCR6P6
 D2q5K2vWWrjFI/T6YwWuV9KHp159LfGh+9aQ36l8e2Mqy+93Ou50bULbDILAQMECODIlda6WhdR
 hjBDyeXc+iAEON6o+uzFRUyaszfpmFe+L+upZXgmhs7zfvkUoViuw
X-Received: by 2002:a05:622a:4c8a:b0:4a4:2c4c:ccb3 with SMTP id
 d75a77b69052e-4b291baeb33mr28831691cf.38.1755684579209; 
 Wed, 20 Aug 2025 03:09:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFO+07cDalcclEJz4U7wwfw/PcTiuXWte6zf1fXyIS6NX7XUcddZp81APEIdTIESPROsNMifg==
X-Received: by 2002:a05:622a:4c8a:b0:4a4:2c4c:ccb3 with SMTP id
 d75a77b69052e-4b291baeb33mr28831181cf.38.1755684578661; 
 Wed, 20 Aug 2025 03:09:38 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef35f11csm2524249e87.51.2025.08.20.03.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 03:09:37 -0700 (PDT)
Date: Wed, 20 Aug 2025 13:09:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
Subject: Re: [PATCH v3 02/14] dt-bindings: phy: Add QMP USB3+DP PHY for QCS615
Message-ID: <3lodaz4t72vsxnstfe2msooo3dnwbqy6hxzdshcmyrgb3fbjnv@2afo5atezt24>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-2-a43bd25ec39c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-2-a43bd25ec39c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX0WR6R1gYmRQ5
 3k96CM4WmBSaezFgIJag+2Vvf6A3zmCaoxAxUZPTY+XKHICOSl9FfD2cIhzvOdKafIWQgOqKc3n
 vjBLC3i8vm9mQllrsmH0Sl1AgGJvh9aGHAz++3hu0eILEIlzBUluhauEa9IZdBnV/mylVoIcAny
 Gkahzwm6cWCTQ7SOtfgG4605sscbXT3Y+LVLZazA2KjecTCBuKY5DYVTx3A07Flx/h0fmDOXnNb
 8y/X0RUt7oHHi8RusJqsoF7Aeg5lPmm+E1vZ5ZFu0p20/W3lNbq+8EezZA1n/ttGTkWVti0i3Hg
 ZamLCHeG1f12uCIx7V8F6Tjc8q323Ax207r6yOLcNIWBbmkrGgCpXWndS8PZ9quMmaqLKct3VjL
 GlPM8CRRoUSSD6XiMBn7qeXlyeVcwg==
X-Authority-Analysis: v=2.4 cv=cr3CU14i c=1 sm=1 tr=0 ts=68a59ee4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=x0hJR-vgZ_cmirHItZUA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: rioprfq5Pk6URTXunRyUcY5pDSG9-Lfj
X-Proofpoint-ORIG-GUID: rioprfq5Pk6URTXunRyUcY5pDSG9-Lfj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

On Wed, Aug 20, 2025 at 05:34:44PM +0800, Xiangxu Yin wrote:
> Add device tree binding documentation for the Qualcomm QMP USB3+DP PHY
> on QCS615 Platform. This PHY supports both USB3 and DP functionality
> over USB-C, with PHY mode switching capability. It does not support
> combo mode.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml   | 108 +++++++++++++++++++++
>  1 file changed, 108 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..c2b1fbab2930f0653f4ddb95f7b54d8fe994f92d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
> @@ -0,0 +1,108 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,qcs615-qmp-usb3dp-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm QMP USB3-DP PHY controller (DP, QCS615)
> +
> +maintainers:
> +  - Vinod Koul <vkoul@kernel.org>
> +
> +description:
> +  The QMP PHY controller supports physical layer functionality for both
> +  USB3 and DisplayPort over USB-C. While it enables mode switching
> +  between USB3 and DisplayPort, but does not support combo mode.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,qcs615-qmp-usb3-dp-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: cfg_ahb
> +      - const: ref
> +
> +  resets:
> +    maxItems: 2
> +
> +  reset-names:
> +    items:
> +      - const: phy_phy
> +      - const: dp_phy
> +
> +  vdda-phy-supply: true
> +
> +  vdda-pll-supply: true
> +
> +  "#clock-cells":
> +    const: 1
> +    description:
> +      See include/dt-bindings/phy/phy-qcom-qmp.h
> +
> +  "#phy-cells":
> +    const: 1
> +    description:
> +      See include/dt-bindings/phy/phy-qcom-qmp.h
> +
> +  qcom,tcsr-reg:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to TCSR hardware block
> +          - description: offset of the VLS CLAMP register
> +      - items:
> +          - description: phandle to TCSR hardware block

Why do we need two phandles?

> +          - description: offset of the DP PHY mode register

s/DP PHY/PHY/

> +    description: Clamp and PHY mode register present in the TCSR
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - vdda-phy-supply
> +  - vdda-pll-supply
> +  - "#clock-cells"
> +  - "#phy-cells"
> +  - qcom,tcsr-reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +
> +    phy@88e8000 {
> +      compatible = "qcom,qcs615-qmp-usb3-dp-phy";
> +      reg = <0x88e8000 0x2000>;
> +
> +      clocks = <&gcc GCC_AHB2PHY_WEST_CLK>,
> +               <&gcc GCC_USB3_SEC_CLKREF_CLK>;
> +      clock-names = "cfg_ahb",
> +                    "ref";
> +
> +      resets = <&gcc GCC_USB3PHY_PHY_SEC_BCR >,
> +               <&gcc GCC_USB3_DP_PHY_SEC_BCR>;
> +      reset-names = "phy_phy",
> +                    "dp_phy";
> +
> +      vdda-phy-supply = <&vreg_l11a>;
> +      vdda-pll-supply = <&vreg_l5a>;
> +
> +      #clock-cells = <1>;
> +      #phy-cells = <1>;
> +
> +      qcom,tcsr-reg = <&tcsr 0xbff0>,
> +                      <&tcsr 0xb24c>;
> +    };
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

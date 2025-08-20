Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDE6B2DB2B
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 13:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 397BB10E707;
	Wed, 20 Aug 2025 11:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="I/khlice";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9FF910E703
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 11:37:09 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KA4EOR024833
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 11:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=kG5EvtRUaQfCBV/YBpEi6527
 Mm9dhLGyA7HIWyFmk/A=; b=I/khliceukaDzXQ4a8TO8U8d64C7c9DcfnKPgEeI
 MMsXt7NdF862BBfRS+lSt2wt+/vskLgWr1umAzOsSxswVBPai8z0YCfJYyvnOCT9
 Ypygujq0WaGH8GRWYcmBe9HZeySZTPrQ/DjBhYRdAHf7alncQvu3s3OXFDmRIPhS
 0sfrPgtsH7V4ng8jaxFIqTUfdoY3lvQjdZjMHkvB5kNhUmnbov2elZvLSBaWY0sH
 dSudDwJQwoL99/4IT9IVXYTcisHes0jI2f7FtdbS7JZf0lPoqWCvl0X9bCVS5yP2
 OnxWbSZ8bXMKzmhFnEFdp8LsbChMmrv1TptxzocLl9jQAA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5291jcc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 11:37:09 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70a9f562165so226422646d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 04:37:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755689828; x=1756294628;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kG5EvtRUaQfCBV/YBpEi6527Mm9dhLGyA7HIWyFmk/A=;
 b=BZGnwGCo5TW4N+mlm/f7+x+Ld9uDRXfKz4xHA+w7HgpT89KbFshvvSkavovGBjazzD
 gCyFrfiAKzW/5Zqzv5AUpbnW0st9f0uKJSGPBkN0840WNepUuR6YHSY8eGUQ0aeszoWV
 ABUz1gmDEmKU3mSLCKZYP4DlOc4od5ZVPOQG/LoknC1WiP6HCa7RtCn+FnH6ecC+zaTH
 HCYOTtelQHVhXzLHwxCcioMXfpm9CNAievm9/PXC1tbed4345P8afPUdfKu+1A7ccbyl
 loPf1R1puK31Ioqnm+WClT3TTQAmK/AjyZaFtRruVUqlzl1gw1RH/Buip1cM1ppnkFfy
 QNwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWq5AYBDO94O7/KH80DDFUQmsb9v7i4maGdd/tHorPIIygxf1BVXw57JYLEuYnKIy3G/4a7KpnibuM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5LyMZ0X3gGQX7fsB084UHZu5nddchnVkMAdgxSFyP4nGtGpXu
 5/u/kzd+EVYAki5GqZ+XVO55qteHedXTyokDdmuFSRkDbmuK/NoDWcFCNxKa1uCg1Y5QS2Q8Kew
 BrE/5Di3ucF2eSIRKtZqxpReY2ig1G/JFmT+b3PmkxQvlkK7Bw+acVHa8zU019Afx1cQRE6c=
X-Gm-Gg: ASbGncvUxK6hydXRj/VmmeylLou9cKEuoTth5N1nSLObINzTm6oIgmz46woEA23heLh
 9Mi0sah5WCfumsZI40QOHKa8MjUpAqCsbagUoM14FdTgbbllxfgrW2iHwyr2ipmOGtqg+y/pxoB
 iC2psiYgVDvTiBCvFbu+q2K8EX09M4twrxsNHcuYVB5drQEe8rEkS2tLiYvyFBgltOdDGz7KoM3
 uAFJFVp8jwLqZ+dgp2Puh1diVgH8kS3DTMGXCNdowf2PPB6qEPa7yJ8aX6ZDtXkbXXgEeWX8z2S
 8cksJgA2O7D1xO+WKHWv2WEGm0PxWu6cRolTt8wFFYCvrqK56rfV3i+5PViy0WTQikNjLjFUEjc
 Ca/QFQ4EsBM+oERQ8wjlewZ9KkVt3xT2ebqi4Glp0+eqhtifXmNd5
X-Received: by 2002:a05:6214:c28:b0:70b:af39:8596 with SMTP id
 6a1803df08f44-70d76fae59cmr27616536d6.28.1755689827703; 
 Wed, 20 Aug 2025 04:37:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHF8uDY/KF39ETwmmHdeKUKsc98VcWiJ/Iu9zjHm6WFS5DWcH3CpZlDmrVqK45d2lN37i/9GQ==
X-Received: by 2002:a05:6214:c28:b0:70b:af39:8596 with SMTP id
 6a1803df08f44-70d76fae59cmr27613786d6.28.1755689823518; 
 Wed, 20 Aug 2025 04:37:03 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3340a41e3cfsm27543291fa.6.2025.08.20.04.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 04:37:02 -0700 (PDT)
Date: Wed, 20 Aug 2025 14:37:00 +0300
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
Message-ID: <tlilctwavwqw6oy46l5fote2pa6f4hdy2im6meo56cjaawba3a@a42bwbbfnsuw>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-2-a43bd25ec39c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-2-a43bd25ec39c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ZJKOWX7b c=1 sm=1 tr=0 ts=68a5b365 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=7souUVsdAZ2KeZQVA08A:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: qHjpU8A9UK4IvKRBe3qF7sKSL42PD_ec
X-Proofpoint-GUID: qHjpU8A9UK4IvKRBe3qF7sKSL42PD_ec
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX57q/tzA3nMdQ
 YGzOnf7E/0e2bi/MrEMS4GNTvnRRF5RloYICQm64O1UX9MvNs0vG/jZdHtmqpZeFcseEiz1/39W
 vRyKkWMMfrKTHevIj7+rw/xXTfOtGIIQDa3ClL6/nDt0KGbndK05+dUXQuGZM3Z+Ox8tJVshKEC
 aS+KXMhhkGZb9spDC8V/4HNVJLH4qjduhoWrCdStHSzBU2jYJYLtZGXhKgrhlyduNAGN5fhVbbZ
 PqKklQranAWNMLi0EQWDwC1YNzg91AgK2R0lCjXXd6K6MrwqVT85iaJag4MMFNtEkElpS5RjrLZ
 L4tr8e+rwBPMrXTGkdJlgWhCatnvFHX9GpA7r+/qGh4k1xNbJpPDtnoOJPBFO2xcTFXB4F7JerN
 RHl0pxr0pYaOSI5dDc6aQs+jt4HbFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
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

Missing GCC_USB2_SEC_PHY_AUX_CLK and GCC_USB2_SEC_PHY_PIPE_CLK

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
> +          - description: offset of the DP PHY mode register
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

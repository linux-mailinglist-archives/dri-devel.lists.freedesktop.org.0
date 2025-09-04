Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3E7B42FB3
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 04:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE44210E0B5;
	Thu,  4 Sep 2025 02:22:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XxpUJ52f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E686110E0B5
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 02:22:02 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583N5iVf007669
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Sep 2025 02:22:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=UqDA79vMuQ4DioUE8hancjBP
 t/X6lnrlS8udMgPwyC4=; b=XxpUJ52fovBMOcvGzxoFCaL4Ohs8e6Fe5+id3dKW
 86M1mZdhiZPYEak4mTHcUmJDAnr/5Ja48YnpdAjqlxO927h/MyuNmhU2ZA0TuhQc
 Uf63oew1YSVi84L+sJ1BhpygvuYIM25U+a9Grj/ZchhrwahYPh9Ac665IaK12Ian
 9UOcpCybB8mnqo/gNgUSi8B6oJQJgJhVWqm215j3dx6h8E7Lc0gMwfa/V5tVtGan
 HOrzAf/ZQFeblPUjGDaUhbPX41G3X/bxP5twah3x6tB2MfF4WwIPzbGUa2R3KhaI
 SU9sIXSNHQVkj511Ognmwfy3qxO+krWzAQs/tAzQMZD5vw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy9r17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 02:22:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b4980c96c3so18270281cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 19:22:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756952521; x=1757557321;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UqDA79vMuQ4DioUE8hancjBPt/X6lnrlS8udMgPwyC4=;
 b=QmRK71YYbZLf1wlY8lFyCmVR9IzUVH4tYJQ8aVqB0NFwcehFeGMCAnLHQUanpCb6aW
 xFLfWf9Gw2DmIN8H+NTuCgd2t4udNPtlssHqWiIU/YLj4U2LtxhRRwxQrc2GxwAChLLM
 O0P3w9PtIA1gewlepB/D5CwiPZWzcXEOfA2408wSp4SEZdiNoP8Zf+AapN2PjEgH8ofR
 Li6NCpkqZWzbHt/b4WGyx8mSE+vp07/GLkAWaVixhxqZjeZj/qQ7pnFGFSVHtMD42r2E
 r7Tm8dm9zZu1eWvAtLaBZF7mWc3SBMqQmO3hWDWkIsC/WoHZtBEbb2OveqFAjKotfa1b
 LzXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXy4X1enF35A/Tq1+PLy0sJtQytus4aKfRmA+kFl8NQ3oAS74Km2kopKUC0DewoIS6uGhXYG5VfISU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJg9WOnZlhHtbkEtvm01TPx9iaqmNXbX+WO338UFRbVfREkdkG
 sqKXBJTXMmL1AcEFNkQpb6l0+tkumz7ZreYrppP4vIEXEvt1sMlRji5+C0ivbkzljUtOm7hR4nB
 audXIEqv1HTaDBV8Bb0GDy8XHIuaq8ECcZdRRUpfAnv0XnwZOuuhUOdKO6i2bhf7QIZHKO+QksC
 oKrus=
X-Gm-Gg: ASbGncsht2Xk8ZPaK67Ay6Cw1Wr2UYACOMAob0kCIDZ6bOUK0NDMrQzbmWwVcnY+nu2
 FojfjgVOOJyZhe5f2OV+75F0KuP61WcdU8k/IkLW4iPp8Cam/w0A1hejo9xjG4mAsrArprJyUGH
 LZlhXBQ3Ge/b3eyw5TN+ebOarJPYl7hvecqV2fDzF/EVVGp7/2l1BNL+FBtMZuhggu0Clfk8FXE
 UTWdvSyqJy1CAmjWCD7xjMfIZnRM91QG9p/hvPF36V4BGo20Z2fFbf4UTwPz4vBAvMALgKVRDeC
 BmZpNS2RO3W5zJp/CL6CD7C0pKOWVNNkfZKEAlOSdmy5EPFXg12TGXs2OSQD/cYH5nynYJf2ROT
 ggS43kbyb/3DMYJ8n2Fym/FM42uVx0uqZ3jOHko2nXXbG8Bf8bGe2
X-Received: by 2002:a05:622a:8c9:b0:4b2:8ac5:27c4 with SMTP id
 d75a77b69052e-4b31dd7ab57mr235391641cf.79.1756952520692; 
 Wed, 03 Sep 2025 19:22:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTGQK4o8JOfJXm8YdRgThRFbgc3hvhYcbAu5TkwFenQldv2fSoa+WwUY/vg70G3SHonyTuLw==
X-Received: by 2002:a05:622a:8c9:b0:4b2:8ac5:27c4 with SMTP id
 d75a77b69052e-4b31dd7ab57mr235391361cf.79.1756952520189; 
 Wed, 03 Sep 2025 19:22:00 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ad5027esm880943e87.149.2025.09.03.19.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 19:21:59 -0700 (PDT)
Date: Thu, 4 Sep 2025 05:21:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: syyang <syyang@lontium.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 yangsunyun1993@gmail.com
Subject: Re: [PATCH v1 1/2] This patch adds a new device tree binding
 documentation.
Message-ID: <lcyori44rm5p35wykk2rb54zbrrpft5c7uibi376jihemkb67w@px3nj72a5hx4>
References: <20250903123825.1721443-1-syyang@lontium.com>
 <20250903123825.1721443-2-syyang@lontium.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903123825.1721443-2-syyang@lontium.com>
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b8f7c9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=gEfo2CItAAAA:8 a=Kz8-B0t5AAAA:8 a=VwQbUJbxAAAA:8
 a=zoi4mhQgz1elOlvs71MA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-GUID: DWszsm4WcFRSTv8w-IOOyn6TAs5KYp27
X-Proofpoint-ORIG-GUID: DWszsm4WcFRSTv8w-IOOyn6TAs5KYp27
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfXwwISuFg4uZkN
 jySTq8yRBW6A6Bb7LTqlGsetJVjq9N71/lqtiNPgXzmKOW/EpkLimDLLL4KOjd3LDJmY59RI4PI
 N7d9Yn8BN0tOFuqTYiZHMuKNBL1wI7SXgCWCsBYgkLJ8YH185RuwrP1hfAhssqN3uhI0ytbnNmI
 rG4kjXCWs4txqywfxDHej4gkFUQkHbF3o//AgMphEUx2AVKAN0LdT1r4EMA/dqAZ3kHG/g6LhtG
 0YPnxcSwkeGizMHzQWlUTfestVTirI5+8C8DZ+a62/WIMAgywFDfBWAi/QZ5kPh+FNEAA1OBdf9
 0GG/rddIdiG952enlS2LTDunZRKu53EmWBviP/3bjYcfd1ZqHW4llMhw4M/QL+KtY3bvlyqAyr3
 837XbLtv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101
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

On Wed, Sep 03, 2025 at 05:38:24AM -0700, syyang wrote:
> - New device tree binding documentation at
>   Documentation/devicetree/bindings/display/bridge/lontium,lt9611c.yaml
> 
> Signed-off-by: syyang <syyang@lontium.com>

Please fix your Git setup and use your full name in SoB tag and author
metadata.

> ---
>  .../display/bridge/lontium,lt9611c.yaml       | 123 ++++++++++++++++++
>  1 file changed, 123 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt9611c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611c.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611c.yaml
> new file mode 100644
> index 000000000000..e8f204c71a95
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611c.yaml
> @@ -0,0 +1,123 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/lontium,lt9611.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Lontium LT9611C 2 Port MIPI to HDMI Bridge
> +
> +maintainers:
> +  - Rob Herring <robh@kernel.org>

Are you sure?

> +
> +description: |
> +  The LT9611C are bridge devices which convert DSI to HDMI

Can't you extend the existing lontium,lt9611.yaml?

> +
> +properties:
> +  compatible:
> +    enum:
> +      - lontium,lt9611c
> +      - lontium,lt9611uxd



> +
> +  reg:
> +    maxItems: 1
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: GPIO connected to active high RESET pin.
> +
> +  vdd-supply:
> +    description: Regulator for 1.2V MIPI phy power.
> +
> +  vcc-supply:
> +    description: Regulator for 3.3V IO power.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Primary MIPI port-1 for MIPI input
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Additional MIPI port-2 for MIPI input, used in combination
> +          with primary MIPI port-1 to drive higher resolution displays
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          HDMI port for HDMI output
> +
> +    required:
> +      - port@0
> +      - port@2

All of this totally looks like lontium,lt9611.yaml, except the
vdd-supply voltage difference.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - vdd-supply
> +  - vcc-supply
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c10 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      hdmi-bridge@41 {
> +        compatible = "lontium,lt9611c";
> +        reg = <0x41>;
> +        #sound-dai-cells = <0>;
> +        interrupts-extended = <&pio 128 GPIO_ACTIVE_HIGH>;
> +        reset-gpios = <&pio 127 GPIO_ACTIVE_HIGH>;
> +        vdd-supply = <&lt9611_1v2>;
> +        vcc-supply = <&lt9611_3v3>;
> +        dsi-lanes = <4>;
> +        status = "okay";
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +            lt9611_a: endpoint {
> +              remote-endpoint = <&dsi0_out>;
> +            };
> +          };
> +
> +          port@1 {
> +            reg = <1>;
> +            lt9611_b: endpoint {
> +              remote-endpoint = <&dsi1_out>;
> +            };
> +          };
> +
> +          port@2 {
> +            reg = <2>;
> +            lt9611_out: endpoint {
> +              remote-endpoint = <&hdmi_con>;
> +            };
> +          };
> +        };
> +      };
> +    };
> +
> +...
> +
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00744B39DFB
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 15:01:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F61010E330;
	Thu, 28 Aug 2025 13:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HnScte/N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3782910E330
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 13:01:49 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S61hsF009458
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 13:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=5CZZ8X3dGi+2A49GmpGXcrIf
 DqXJjy/8a+FZlDsA/mA=; b=HnScte/Nm4g2E1pWdO3edn+PiJgSlJNqP/Hm/qGl
 oE1Ql+ov3n/D3q+StH+uoJ3e4XHuT6EUEd+BCiXFtcnGlBUB+SW8F34Ohl6xY8fU
 SXGy4zAbz1af73frbMsgJqOhDsjYHbK4BMjsktYv8HFiDEg2Nge+UaLD7kIYCL6z
 LaxS6ytGysb6Y0quNN2sQzL4dxJh6shJ+c8K2/gbarlGtlvnjxrvrOBMP3nRbMpM
 RuVaN+0XLaDgU9qHQTRR+dCikydc2Tl0IMvJ5ntZX2c2p/gPcWt6RHSTxxxh6PCW
 vM5Bcmv6uW8vvEGicG4qq0/xKLc4L4l62K6SdJXfoB0uSw==
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48sh8aphfw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 13:01:48 +0000 (GMT)
Received: by mail-io1-f71.google.com with SMTP id
 ca18e2360f4ac-886e17c1bb2so91779739f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 06:01:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756386107; x=1756990907;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5CZZ8X3dGi+2A49GmpGXcrIfDqXJjy/8a+FZlDsA/mA=;
 b=dTHZDY2TZ7DA4khswUlO/UFzzZPR/wz+tTtS58xUsmzvwKJejT8EYQngcN4qLxN1em
 duiBg/uwj4hnmslSN7yxk6ntzYYU4l37XU09XeHYebvKUMWqAgCk2N3NS1R7n5hRJl1k
 aP/BxFvlz+3ptCxZfqG2X4UyI948pT3SoxAPEB8d/bG5GHOC6PfIiPUvRWgC38cZ2E4y
 gi1JPjz/9OWdsrrvyP4KbU9V+rdfs7KA+Ndg01lri7h2fxhQqedGEatSAvwp9SPHeX/8
 nIJ16zOpOrdoSYMl62Ze8+rnTI9M1Ff1j8XO/rgpIl7F35RrzVuESKk5YlDRJUm0oPT7
 juAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6LtIkjRnLo33g96yE8ScX/Rz+ROQbFgdGIYJ8aExI87j2tky5uF8jVowb0n5yP2GECWIa1TF2xzQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmgGomjb2dOLPD/Ep7gxhymc9LWSLmSRaoR3RfQj3ZectLZ2Xq
 Dd4GGpNIyzAUeUkSKZeMsicLI0tdZL8nTfsl24ZP0CNZqVUy5codoBecEwqW1hqlqpRib866sbo
 TNwDHxo2/kZm13w5C+RwZMwnNzLPPMNQ9V8RCTcb6g/E9kelC0RW+5vhPg17tvCygPG38Tg4=
X-Gm-Gg: ASbGnculoAuYrmlR0nN+7HxgYgfLIAuxNta84vb/UaSX5b0zRdNoaWslGjV4/p84ZDb
 x67qn2maGf46gbTXaAMYwvnH3VuEuKC//KelnZMWFVbbNb2lK9EpfpV7YUpxEETGAhWxE6CJ7zJ
 esF0jfVJziQwnbtv8DPzjqwMn/1gqq8MCZY4OAvlS6JLm7V4sW/L8p2ItrUE9WbyFRTWSL7M5WX
 eyTTtT8+irGDiJOwLCCLS/t+5kd+zcAlX1OyAqJOgP85GPMPveo96FeJTbSvN1yIk13VIM3t/ta
 WAOzHuNOm1aucLYHhlkFYmICQW3Ml8/WAWmFv2vE+PAbTAnObvbyoiqkNwpMDgahnUBmhTrEBv1
 dvD4g+sYKFAwfFgQM2UaaAIN7F95kjwkH6ecclJOitDfi07cCdsP+
X-Received: by 2002:a92:cd84:0:b0:3f2:1184:74c with SMTP id
 e9e14a558f8ab-3f2118408a6mr9220435ab.1.1756386107177; 
 Thu, 28 Aug 2025 06:01:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoWgR1m6SPJJT8N1upZ5xl2y0n4EmbtRhWcPx9TkfaLMRgVUMGH92IrxU2E0pOWKzIMyNT0Q==
X-Received: by 2002:a92:cd84:0:b0:3f2:1184:74c with SMTP id
 e9e14a558f8ab-3f2118408a6mr9219445ab.1.1756386106532; 
 Thu, 28 Aug 2025 06:01:46 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3365e20ed53sm33236101fa.4.2025.08.28.06.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 06:01:44 -0700 (PDT)
Date: Thu, 28 Aug 2025 16:01:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pet Weng <pet.weng@ite.com.tw>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hermes Wu <hermes.Wu@ite.com.tw>, Kenneth Hung <kenneth.Hung@ite.com.tw>,
 Pin-yen Lin <treapking@google.com>
Subject: Re: [PATCH v2 1/3] dt-binding: display: Add ITE IT61620 MIPI DSI to
 HDMI bridge
Message-ID: <w4esyqbwash5izcdbu476xtvi7dom4o7xbj6c5vk7jdpokfsxk@pxnseqmu2rvw>
References: <20250828-it61620-0714-v2-0-586f5934d5f8@ite.com.tw>
 <20250828-it61620-0714-v2-1-586f5934d5f8@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828-it61620-0714-v2-1-586f5934d5f8@ite.com.tw>
X-Authority-Analysis: v=2.4 cv=cLDgskeN c=1 sm=1 tr=0 ts=68b0533c cx=c_pps
 a=WjJghted8nQMc6PJgwfwjA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=Ns9eNvu6AAAA:8 a=95iR6gA1d2zzZcfHCfgA:9
 a=CjuIK1q_8ugA:10 a=CtjknkDrmJZAHT7xvMyn:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=LZLx1i01EnjtqRv10NxV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDE1MyBTYWx0ZWRfXxHToVzVFSGEf
 Facjt8MM1Lcqlq8mWxEQRCpqNQFtjSC9J+vYDLvPwlSUrcztmusYbZipyVpYkSWZpeGV3oFj03r
 HV7pqDsJKX9MuhzLCxv9HBB0mThN8JGbh1vPgWbk649w8gTalZ54NapYqD4fclmmhOfpN+0jkf7
 9bD6yjWDJcy9d5OCZZkXeaGbxtzheCHPQ3O//vGSJv+Ju02KL/y0G0hl8IAeBzy5tFgdQQdq+zV
 bHZ1MIS9ZihtatkA0E38X+wQWnfuTh5oo/k6d/GcXd033zTM4t0YDebF4PyRWGmTMpackH2YS2R
 zC45lPAyS3ogJZ8ca/+yaiMkb25mJYYZ201Dy/higI98d6+jFnrIoCKKIAlgen2s7zH2RY2nQka
 skx2Pe91
X-Proofpoint-GUID: YSWG2uDedICOMXSXscHi5i8Lm27TiHZ-
X-Proofpoint-ORIG-GUID: YSWG2uDedICOMXSXscHi5i8Lm27TiHZ-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508260153
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

On Thu, Aug 28, 2025 at 12:01:18PM +0800, Pet Weng wrote:
> This chip receives MIPI DSI input and outputs HDMI, and is commonly
> connected to SoCs via I2C and DSI.
> 
> Signed-off-by: Pet Weng <pet.weng@ite.com.tw>
> ---
>  .../bindings/display/bridge/ite,it61620.yaml       | 143 +++++++++++++++++++++
>  1 file changed, 143 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it61620.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it61620.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..dd8a54a1e0aa9bbbd9d02e68398bb5df65b821a8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it61620.yaml
> @@ -0,0 +1,143 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/ite,it61620.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ITE IT61620 MIPI DSI to HDMI Bridge
> +
> +maintainers:
> +  - Pet Weng <pet.weng@ite.com.tw>
> +
> +description: |
> +  The ITE IT61620 is a high-performance, low-power HDMI bridge that converts
> +  MIPI DSI input to HDMI 1.4b TMDS output. It supports up to 4 lanes of MIPI
> +  D-PHY 2.0 input at 2.5Gbps per lane (10Gbps total), compatible with DSI-2 v2.0.
> +
> +  The HDMI transmitter side supports up to 4Kx2K@30Hz resolutions, and is
> +  compliant with HDMI 1.4b and HDCP 1.4.
> +
> +  For audio, the IT61620 supports up to 8-channel LPCM via I2S (multi-line or
> +  TDM mode), with optional S/PDIF or DSD (for SACD). It supports audio
> +  sampling rates up to 192kHz.
> +
> +allOf:
> +  - $ref: /schemas/sound/dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: ite,it61620
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +    description: interrupt specifier of INT pin
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: GPIO specifier of RESET pin
> +
> +  ivdd-supply:
> +    description: core voltage
> +
> +  ovdd-supply:
> +    description: I/O voltage
> +
> +  ovdd1833-supply:
> +    description: flexible I/O votage
> +
> +  pinctrl-names:
> +    items:
> +      - const: default
> +
> +  pinctrl-0:
> +    maxItems: 1
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: Input port for MIPI DSI
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes: true
> +
> +            required:
> +              - data-lanes
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output port for HDMI output


No audio port?

> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - reset-gpios
> +  - ivdd-supply
> +  - ovdd-supply
> +  - ovdd1833-supply
> +  - ports
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ite61620@58 {
> +                compatible = "ite,it61620";
> +                reg = <0x58>;
> +                #sound-dai-cells = <0>;
> +                interrupt-parent = <&pio>;
> +                interrupts = <128 IRQ_TYPE_LEVEL_LOW>;
> +                pinctrl-names = "default";
> +                pinctrl-0 = <&it61620_pins>;
> +                reset-gpios = <&pio 127 GPIO_ACTIVE_LOW>;
> +                ivdd-supply = <&pp1000_hdmi_x>;
> +                ovdd-supply = <&pp3300_vio28_x>;
> +                ovdd1833-supply = <&pp1800_vcamio_x>;
> +
> +                ports {
> +                        #address-cells = <1>;
> +                        #size-cells = <0>;
> +
> +                        port@0 {
> +                                reg = <0>;
> +                                it61620_dsi_in: endpoint {
> +                                        data-lanes = <0 1 2 3>;
> +                                        remote-endpoint = <&dsi_out>;
> +                                };
> +                        };
> +
> +                        port@1 {
> +                                reg = <1>;
> +                                it61620_hdmi_out: endpoint {
> +                                        remote-endpoint = <&hdmi_connector_in>;
> +                                };
> +                        };
> +                };
> +        };
> +    };
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

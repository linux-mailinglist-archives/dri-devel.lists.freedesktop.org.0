Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBA9CE50EE
	for <lists+dri-devel@lfdr.de>; Sun, 28 Dec 2025 15:20:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F88A10E186;
	Sun, 28 Dec 2025 14:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vf5c6h9s";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZpqGtiGm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0897610E186
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 14:20:51 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BSBuvRM2919933
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 14:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ZV90aa2JGVwVJ1ltYtHFbAF8
 YUWVR1CPjUq+qjIlEgw=; b=Vf5c6h9szKtuBE0es3+wRvC0dKuumnFBan4d/XoR
 lVoy3QzYCNS3e+fjKfgSGx9L7uViDEtYsIOdzRSCB7b/HZ9XXojMGpj8pR7lBcTb
 dP3i9q3M9xhn0b3Xt6MfKpVpWdnBszvAIdI++NaMZYpCX2IFGKKj0yRfJ+j5He6M
 k4QO6oQACsaUO/VEBgkwl46IBGI97vW9VGbGhnD44in8062Qs8KAMhzbWRVcXXaU
 ZW8XNPEgWWBKd1y2wiQZHoadCNdAzrIdQIldZmyOGmSA1A9y/mJ5x6g8lF2HwNO6
 AWFry7vdfyCa9VApvJFU9fDEW4rEODlQGABWfnHCb+Iuhw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7u5j805-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 14:20:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ee0193a239so87580401cf.0
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 06:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766931650; x=1767536450;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZV90aa2JGVwVJ1ltYtHFbAF8YUWVR1CPjUq+qjIlEgw=;
 b=ZpqGtiGmDAJagWJ2HS4ba21IOxxw66ZTobcDtHd8wTzKbuG9LAUZn7QB9vGy12DWYe
 uMBe2nwmaR4jvnwwJf+J57XBRthK5LKhJVYDK15U3MGvsh0uHjHKRaiWcmoH6TU0j4cz
 ovrndrCyoPi7pM7wgeAZ91+qHi0fKiQZ5VbAjgINqfghOvmLQaYwQ7zJ7gS2qCFKH4QA
 pDmk0nehnl3TQOwaTjjnKJb0zxAcnP30xbKsA6RCcb84JohrcVpNT8s0jhsHo2RsA2WG
 0SBGY5tn8g1oLUyyxoaKk8OckIO9gS2d4T6xl85KKUMRSprfTTnylhoxPDxAn84Ic5La
 a3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766931650; x=1767536450;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZV90aa2JGVwVJ1ltYtHFbAF8YUWVR1CPjUq+qjIlEgw=;
 b=kEmjZrslHTJAuEWJkWWKldwpvvvNa9qZDiOWxve0CyzAF8miMGI7BLmn+3ZJnfOxuN
 FBJUJa58IdBJ5vHbLArwLUVzBIzyVojaHslA+FfkIg8ElHGaZmi6Lt2rn9IxGDok1GwE
 +GcDoEvyuNqGYMtiXeDUCkqvqMCCisc9722HSszuilrvy0vqgYJDHmpqqXqvLFX6ivlB
 /PrJAU1b0cx5NpMnxJO5n8x9wiHpPg55O3DrJ8wa8xGNOXeWXFJ8dKFcOWflkOIjhInA
 aiJaAPfX+jjUhvoy6UujZQxOHuhV8mBWj/FXfXC6B6ZIMRdDrGaN6RL5L5VBuhu3qk9t
 fDMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCULeP+OKO05d6X8r3DtYzuiaX3GFA3zaQSstpHWcBOkZ/piZ9EWVRKHvV6qvfZm5G/Su287gaBxiiA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyINyZM3WS5wp2uDl93NNGbapQqr5sDvGk6+8VVkfMRJaj0PrFR
 eYBhiMxHL/yETbtB+Mjw9aWTNT0/LsOrzXD/yiy2V9W1GfjIsdJv4Ty7mPhgj0MPwPhjMIdo4UO
 zKfj39GfGLecBe8QL5xYnB3NAYax0yCL3iIoOvZA1UAXsZUZo2JzxCdEVw14maGe71ne9+7c=
X-Gm-Gg: AY/fxX7c8VvjyK4cmmKWU5+OqMK3iiYyQOFQfkNf3JBdgl7usMsCWe0eEfgoFVKd06c
 3HkM+1m4XrhDXN5BmXlAFdJ+DC2I8ODHhVnjG9Gn6n0GZ5/SVMT5bR4bM/y5ShcFg0KpNT0raBm
 so91NxWGNGproJqDG++JPyeqv5Ut5R/mVRILWvxIlH5gXt8vlFRbkhfju6sRcBWlovb3YvRxS1R
 isQ6NA+RVarc/0MA/5H/RRnv8ttVsSMA8iQnIg/6H3ZQXzzg1MNevCtqi9Ef2F4jlg3VQaQZIb3
 6Yw3Zr8Fm5XGrKzcf2krvdPICOkQRLojc7QEQ/E18TOxfTtlGF9p4eEAGiwUI/bziT3BfEoOd+Q
 sTpq3tpqpkphTQ0720nbJsHXz659tNuie1KHEWeU+SzFpLF5zFm0fPMkYrGj0itpTWA2gngpinU
 gFZAIvzlJyfFz+Jg7k8HwX6X0=
X-Received: by 2002:a05:622a:4d06:b0:4f0:441:96be with SMTP id
 d75a77b69052e-4f4abd6097cmr400844731cf.51.1766931650151; 
 Sun, 28 Dec 2025 06:20:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgLon84UIj6xT6LECozm3iETiUIpuOGMX0UBf3yRSXKGa+FwW7Nu23cxGm2ZieR7OnQ2nGGQ==
X-Received: by 2002:a05:622a:4d06:b0:4f0:441:96be with SMTP id
 d75a77b69052e-4f4abd6097cmr400844381cf.51.1766931649650; 
 Sun, 28 Dec 2025 06:20:49 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a185d5eb2sm8016730e87.1.2025.12.28.06.20.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 06:20:48 -0800 (PST)
Date: Sun, 28 Dec 2025 16:20:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Tony <syyang@lontium.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, prahlad.valluru@oss.qualcomm.com,
 Prahlad Valluru <vvalluru@qti.qualcomm.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: bridge: lt8713sx: Add bindings
Message-ID: <ua6ewpauwabzyf4srnawqz6znsvrzkkl75zwqhpxk4ltdnzvj6@dkntys7skfan>
References: <20251228-lt8713sx-bridge-driver-v3-0-9169fbef0e5b@oss.qualcomm.com>
 <20251228-lt8713sx-bridge-driver-v3-1-9169fbef0e5b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251228-lt8713sx-bridge-driver-v3-1-9169fbef0e5b@oss.qualcomm.com>
X-Proofpoint-GUID: k-h-MkQF6Zo7qh-8RICtTHEAYQq2HC9v
X-Proofpoint-ORIG-GUID: k-h-MkQF6Zo7qh-8RICtTHEAYQq2HC9v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDEzMiBTYWx0ZWRfXziEJps6fT9nr
 5SBK2Pto+tCH4j8yHWbef6txyn1wHuBt9QYVa8wK3SpvIv5x7fRlJ9EJKljJptKNK+DDFfZhGwh
 sELo0cr9nQFtmxkDu4SzZIBwFAOVdrB76cLFbOCPRafS4+WFBCzHIfg5HX6OWLTvciGvSmViCFv
 Me8Q9wVaqNr7VA85VW5OqkhI2joAw+0lKNSV5/5Td6/EBP/zkwandLnp68Izub2dx/z5IipxvK0
 2tD2Ei3O0lTde/S5Ctj5OMatttFxtdRfJ0VnxiVn+S7I97MqduAn8i3oH79aRfYSJl33OLE7WmY
 w3ZPR2+8VXrq50JuZo1kj9zMOpxTGWFn5aY0dH84IqODOiQ689xgXLFujQtI+ijyeQhU5/pstbL
 wpcYYppsJdTpX41JMTd/RBDzu8EUI/hJtpL3dsiEnlSUxZLgLUWyd1BShnpIY+K5r6L2Wu974v2
 6NW9POPGNgCH6/vJTQA==
X-Authority-Analysis: v=2.4 cv=DptbOW/+ c=1 sm=1 tr=0 ts=69513cc2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=Kz8-B0t5AAAA:8 a=FMXgjKT3AwVderRZyjQA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280132
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

On Sun, Dec 28, 2025 at 05:10:39PM +0530, Vishnu Saini wrote:
> Add bindings for lt8713sx.
> 
> Co-developed-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> Signed-off-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> ---
>  .../bindings/display/bridge/lontium,lt8713sx.yaml  | 101 +++++++++++++++++++++
>  1 file changed, 101 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt8713sx.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt8713sx.yaml
> new file mode 100644
> index 000000000000..0a6dc56e337c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt8713sx.yaml
> @@ -0,0 +1,101 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/lontium,lt8713sx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Lontium LT8713SX Type-C/DP1.4 to Type-C/DP1.4/HDMI2.0/DP++ bridge-hub
> +
> +maintainers:
> +  - Tony <syyang@lontium.com>

Is he/she aware of this?

> +
> +description:
> +  The Lontium LT8713SX is a Type-C/DP1.4 to Type-C/DP1.4/HDMI2.0 converter
> +  that integrates one DP input and up to three configurable output interfaces
> +  (DP1.4 / HDMI2.0 / DP++), with SST/MST functionality and audio support.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - lontium,lt8713sx
> +
> +  reg:
> +    maxItems: 1
> +
> +  vcc-supply:
> +    description: Regulator for 3.3V vcc.
> +
> +  vdd-supply:
> +    description: Regulator for 1.1V vdd.
> +
> +  reset-gpios:
> +    description: GPIO connected to active low RESET pin.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          DP port for DP input from soc to bridge chip
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          DP port for DP output from bridge
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Additional DP port for DP output from bridge

Why do you have only two output ports here? The datasheet documents
three ports.

> +
> +    required:
> +      - port@0
> +
> +required:
> +  - compatible
> +  - reg
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        bridge@4f {
> +            compatible = "lontium,lt8713sx";
> +            reg = <0x4f>;
> +            reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    lt8713sx_dp_in: endpoint {
> +                        remote-endpoint = <&mdss_dp0_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    lt8713sx_dp0_out: endpoint {
> +                        remote-endpoint = <&dp0_connector_in>;
> +                    };
> +                };
> +
> +                port@2 {
> +                    reg = <2>;
> +                    lt8713sx_dp1_out: endpoint {
> +                        remote-endpoint = <&dp1_connector_in>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

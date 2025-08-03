Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EE6B193F3
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 14:02:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08BB210E04D;
	Sun,  3 Aug 2025 12:02:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UoAwCYqN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 473E110E04D
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Aug 2025 12:02:41 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5732jtbW007622
 for <dri-devel@lists.freedesktop.org>; Sun, 3 Aug 2025 12:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=OAIGfqwm1o5Mxl29tN5H4C7B
 Htx7NSCXZqC99JGU7eI=; b=UoAwCYqNVz+9KHfbgfwKHh+zOOj9uO5Yj+TBBC4x
 jp2ILH++Xeh95sGJ/+pPmfjOj5hmt37MLz1AqybQfAtmEKaypcLMIbEwMCDoVoJv
 TC892PjvlGXBTcgh8QFmboJdsqfj1VWW+1MySIPs4Jz9uR7IkoUPgRMsZhMIL0GR
 cgLPEpo+jmgkOjEoaXUmbXe4u6NcUXVKWDrKcHT6SlJdpjreeU7xMUfgsVxoIAFi
 vZoRfRHAVLbw4RowLrsw/w9eGDZAU56S0LZW0t7PSX5ZJUubWw0mb2bezyz+pGtk
 OVZyNZ8BjmAxD98fywj8cbPZ+LMqbsDK0OrMjDLhzhdoHg==
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489byc259d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Aug 2025 12:02:40 +0000 (GMT)
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-3e401ca74fbso24524305ab.1
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Aug 2025 05:02:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754222559; x=1754827359;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OAIGfqwm1o5Mxl29tN5H4C7BHtx7NSCXZqC99JGU7eI=;
 b=sV8v0gfU7a4Xyw9fGWGjxp2Tm385salYiC6w1Q/FEiMmqTr0Ofb0I2FljLP57RgX58
 90yn60gJesq1k+ZIImOhrhOzsRRv29dZMkz8nKpzM8OxuXHDvwVDeSaK/kRpiLDXUgEt
 vt9QMKDmUuS2X9e0+RGFcFQZ8JRXfVQ3/zqxC6pbtKytEOUBGb8ree/58wX7LJ/oW3gx
 vbfdeo+Pmok7YTdaDjwd4tA9qVV7tPjerUxwkphd5jNhlYa0vR5hcbpgrMeSGXvFlPZN
 y9YkUKzSPstQKyjH9VsypTStEQu5bwHZy4iRfAAlCkTQfnwOUYMDWR3MzPAYZmwcV5AW
 H8SA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqrC6ne+MZhh3+u0YKC+YmHdY0fJ7oc9DwhMYrXHKK/QiYwTfHVzwGKqS7dI8hS8oFuDFv2LzNvKw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQwrt8Xv9EQTiZlGZqqY98w8XraVA3tv7CV5RSL+MRXI6144DM
 UQAHP6iW55lmFEQyvMNuAdGayjJgnySksZiE8s0dWlbrhTu7IQLITbP2+O3v7cNWzcD0d0xzywK
 MJ9gL2aYjGVHj1XZecN+khcX9MSlnN2xBxIWbfGqmhrL2gVsjTDeCQDuyvE8oW9UjaT3O+NY=
X-Gm-Gg: ASbGncs8ldGzRG15wVgZj3alYOCLeK93qB1jcWegrTnaH4GzQLQpVfyxWcf+BAc+218
 bDNe/Jd9+tFuoZCa6QiQLYn8mLg8n2vvWuY8AKNporOB1knCX0LUP9L0rfOuNqJ+70BTCr7mb/M
 bObGGJnEtf3LrZ9ky+dNOKcLtAq0s4i3f6AYycC0mvFb97Ll+AAFguzv0kB1nA1g8p22+wBbMl5
 GkbdXZC3P2pnqLi6duFkaCcuoR+3N5NmOKbehihM2HTTZeH9h7UBb2uyOM8xXTFNVITog/cBXmL
 LrPBvEuewiWI3195dOOgOfjCFapBgouxYVi/A8lLODuPI3teizFo3zQCPaxpvIPctvYqM5m/INJ
 Y3EoQ+N8iGdwUHnzR7GskTNCDTPQO2SEauq4OuJcT1j1YVFNy5s86
X-Received: by 2002:a92:cda6:0:b0:3e2:a8d7:cbc0 with SMTP id
 e9e14a558f8ab-3e41610d612mr112393405ab.2.1754222559500; 
 Sun, 03 Aug 2025 05:02:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYUIi9fxAQlndkvIQvqoHMofxn9K2oksFY/TXCUKLTtpvW3PxnZKP0cFdXI+rxl6CDCEMupg==
X-Received: by 2002:a92:cda6:0:b0:3e2:a8d7:cbc0 with SMTP id
 e9e14a558f8ab-3e41610d612mr112392925ab.2.1754222559083; 
 Sun, 03 Aug 2025 05:02:39 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898beb4sm1288955e87.30.2025.08.03.05.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Aug 2025 05:02:38 -0700 (PDT)
Date: Sun, 3 Aug 2025 15:02:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: display: panel: document Synaptics
 TDDI panel
Message-ID: <7rk5cgjiublkrczl6khkjepixppbatee25w6gc5utfvrcl45o7@6oouraafet2f>
References: <20250720-panel-synaptics-tddi-v3-0-43a5957f4b24@disroot.org>
 <20250720-panel-synaptics-tddi-v3-1-43a5957f4b24@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250720-panel-synaptics-tddi-v3-1-43a5957f4b24@disroot.org>
X-Proofpoint-ORIG-GUID: eW6MeeuATpKqnOOZEoBVU-5BV0wn-aml
X-Authority-Analysis: v=2.4 cv=Y6D4sgeN c=1 sm=1 tr=0 ts=688f4fe0 cx=c_pps
 a=knIvlqb+BQeIC/0qDTJ88A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=LpNgXrTXAAAA:8 a=ui9BxCMBW18_jymSI_0A:9
 a=CjuIK1q_8ugA:10 a=8vIIu0IPYQVSORyX1RVL:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=LqOpv0_-CX5VL_7kjZO3:22
X-Proofpoint-GUID: eW6MeeuATpKqnOOZEoBVU-5BV0wn-aml
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAzMDA4MiBTYWx0ZWRfXzQVb1eHYKi1/
 5Wcpm8rifPbzEJXMRzkQjkcNae5ToPKdAUhpcOHvaFCzJ7LG++DHuGarNi6vP0Iv3RfYyk2nX5d
 od6XlMVCbPoj8/4F85e3fpVIvYb3lB7gR46tH3oYbAdTchUnWCgm8qpRrHTXfTxcGE4DUTw8a3F
 Suf0vKn7DALR6HRkWx0H4XbLPpixgKQ/CxGONvmOxAM76esNvnxbNGtDy/ajN+R4BAucBeb9M9m
 60E/ozilAxzv5+NPynGB3xSi3u3gollfiQynCL2iPgQdkerrjxW5o2NjmeB4QfjpKh6tO2TALoc
 dad03Gfr6+V3L58RZ5Pbv7UzQqt/EjKOeIci/HMkKNjpNO6wTIpu6+cfDgSqmQbcPYr/xRY2BGS
 eYW/YaV3JmgGf/rwzeoUp5vhf6NQGdHQkNRlJDoibIIrN4+JW1hpaY5pQ7j+SgzewGPiddK+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-03_03,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508030082
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

On Sun, Jul 20, 2025 at 05:31:54PM +0530, Kaustabh Chakraborty wrote:
> Document the Synaptics TDDI (Touch/Display Integration) panel hardware.
> Along with the MIPI-DSI panel, these devices also have an in-built LED
> backlight device and a touchscreen, all packed together in a single chip.
> 
> Also, add compatibles for supported panels - TD4101 and TD4300. Both
> have the '-panel' suffix so as to remove any ambiguity between the panel
> and touchscreen chips.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  .../display/panel/synaptics,td4300-panel.yaml      | 89 ++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/synaptics,td4300-panel.yaml b/Documentation/devicetree/bindings/display/panel/synaptics,td4300-panel.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..152d94367130e9d80a885fe87a2da53db88e3393
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/synaptics,td4300-panel.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/synaptics,td4300-panel.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synaptics TDDI Display Panel Controller
> +
> +maintainers:
> +  - Kaustabh Chakraborty <kauschluss@disroot.org>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - syna,td4101-panel
> +      - syna,td4300-panel
> +
> +  reg:
> +    maxItems: 1
> +
> +  vio-supply:
> +    description: core I/O voltage supply
> +
> +  vsn-supply:
> +    description: negative voltage supply for analog circuits
> +
> +  vsp-supply:
> +    description: positive voltage supply for analog circuits
> +
> +  backlight-gpios:
> +    maxItems: 1
> +    description: backlight enable GPIO
> +
> +  reset-gpios: true
> +  width-mm: true
> +  height-mm: true
> +  panel-timing: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - width-mm
> +  - height-mm
> +  - panel-timing
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "syna,td4300-panel";
> +            reg = <0>;
> +
> +            vio-supply = <&panel_vio_reg>;
> +            vsn-supply = <&panel_vsn_reg>;
> +            vsp-supply = <&panel_vsp_reg>;
> +
> +            backlight-gpios = <&gpd3 5 GPIO_ACTIVE_LOW>;
> +            reset-gpios = <&gpd3 4 GPIO_ACTIVE_LOW>;
> +
> +            width-mm = <68>;
> +            height-mm = <121>;
> +
> +            panel-timing {

Are the timings defined by the 'TD4300' name or might there be different
panels with the same name but different timings?

> +                clock-frequency = <144389520>;
> +
> +                hactive = <1080>;
> +                hsync-len = <4>;
> +                hfront-porch = <120>;
> +                hback-porch = <32>;
> +
> +                vactive = <1920>;
> +                vsync-len = <2>;
> +                vfront-porch = <21>;
> +                vback-porch = <4>;
> +            };
> +        };
> +    };
> +
> +...
> 
> -- 
> 2.50.0
> 

-- 
With best wishes
Dmitry

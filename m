Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58ACD1554CB
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 10:35:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E1B6FBF3;
	Fri,  7 Feb 2020 09:35:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85F36FBF3
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 09:35:33 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0179T9jD000507; Fri, 7 Feb 2020 10:35:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=vKgnaX5bjo09jVxPTqlOy1rgK6nH+2B8BLsuyDClUl8=;
 b=vJHPrnO0gHy5W/LwCsmxpAI6LNzrUHtxsQrn5Sf10NoLdXkV1IHddDDQ0eLTt5dwRgKx
 NNG75Uieu+LTkdqtwSg3SUrrAYAuQh8u/eCGiWSYxTgRchArBEfYp97bmmtu3X5uZ8kG
 jUd7K0lQ4MBaHWNmB82TYVrUcLRkvyNo4VL+TPTE0EC3xNmSSFM+/OguveWM+Q8SkBsm
 02skcAZj3O90+FhJ2uJjGL07fxzywZXa1S0X3hFPRpYB5V2E/SFN2XMooGoie/bHFx9K
 dyGqnqhnbQ7Wce9BDJWGU6Cwa/tRdLBlIwbm0O+cwPI25S0BIuuFZD2QoktHM7HU+BSq WA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xyhku9r14-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Feb 2020 10:35:28 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9E98310002A;
 Fri,  7 Feb 2020 10:35:27 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8CBAC2A8FA3;
 Fri,  7 Feb 2020 10:35:27 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Feb
 2020 10:35:27 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 7 Feb 2020 10:35:26 +0100
From: Philippe CORNU <philippe.cornu@st.com>
To: Benjamin GAIGNARD <benjamin.gaignard@st.com>, "thierry.reding@gmail.com"
 <thierry.reding@gmail.com>, "sam@ravnborg.org" <sam@ravnborg.org>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com"
 <mark.rutland@arm.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: panel: Convert raydium,rm68200 to
 json-schema
Thread-Topic: [PATCH v4 2/3] dt-bindings: panel: Convert raydium,rm68200 to
 json-schema
Thread-Index: AQHV3PIRbsEXfpNCKEe93LIMHMYazKgPaTMA
Date: Fri, 7 Feb 2020 09:35:26 +0000
Message-ID: <2939457c-0d76-caa9-7f12-8befbc5b96f2@st.com>
References: <20200206133344.724-1-benjamin.gaignard@st.com>
 <20200206133344.724-3-benjamin.gaignard@st.com>
In-Reply-To: <20200206133344.724-3-benjamin.gaignard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-ID: <73E242B49A240944830717037FB39E19@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-07_01:2020-02-07,
 2020-02-06 signatures=0
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Benjamin,

On 2/6/20 2:33 PM, Benjamin Gaignard wrote:
> Convert raydium,rm68200 to json-schema.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>   .../bindings/display/panel/raydium,rm68200.txt     | 25 ----------
>   .../bindings/display/panel/raydium,rm68200.yaml    | 56 ++++++++++++++++++++++
>   2 files changed, 56 insertions(+), 25 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/display/panel/raydium,rm68200.txt
>   create mode 100644 Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm68200.txt b/Documentation/devicetree/bindings/display/panel/raydium,rm68200.txt
> deleted file mode 100644
> index cbb79ef3bfc9..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/raydium,rm68200.txt
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -Raydium Semiconductor Corporation RM68200 5.5" 720p MIPI-DSI TFT LCD panel
> -
> -The Raydium Semiconductor Corporation RM68200 is a 5.5" 720x1280 TFT LCD
> -panel connected using a MIPI-DSI video interface.
> -
> -Required properties:
> -  - compatible: "raydium,rm68200"
> -  - reg: the virtual channel number of a DSI peripheral
> -
> -Optional properties:
> -  - reset-gpios: a GPIO spec for the reset pin (active low).
> -  - power-supply: phandle of the regulator that provides the supply voltage.
> -  - backlight: phandle of the backlight device attached to the panel.
> -
> -Example:
> -&dsi {
> -	...
> -	panel@0 {
> -		compatible = "raydium,rm68200";
> -		reg = <0>;
> -		reset-gpios = <&gpiof 15 GPIO_ACTIVE_LOW>;
> -		power-supply = <&v1v8>;
> -		backlight = <&pwm_backlight>;
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml
> new file mode 100644
> index 000000000000..09149f140d5f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/raydium,rm68200.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Raydium Semiconductor Corporation RM68200 5.5" 720p MIPI-DSI TFT LCD panel
> +
> +maintainers:
> +  - Philippe CORNU <philippe.cornu@st.com>
> +
> +description: |
> +             The Raydium Semiconductor Corporation RM68200 is a 5.5" 720x1280 TFT LCD
> +             panel connected using a MIPI-DSI video interface.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +
> +  compatible:
> +    const: raydium,rm68200
> +
> +  reg:
> +    maxItems: 1
> +    description: DSI virtual channel
> +
> +  backlight: true
> +  enable-gpios: true
> +  port: true
> +  power-supply: true
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - power-supply
> +  - reg
> +
> +examples:
> +  - |
> +    dsi@0 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      panel@0 {
> +        compatible = "raydium,rm68200";
> +        reg = <0>;
> +        reset-gpios = <&gpiof 15 0>;
> +        power-supply = <&v1v8>;
> +        backlight = <&pwm_backlight>;
> +      };
> +    };
> +...
> 

Reviewed-by: Philippe Cornu <philippe.cornu@st.com>
Thank you
Philippe :-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

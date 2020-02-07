Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D7A1554C8
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 10:35:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A20E46FBEC;
	Fri,  7 Feb 2020 09:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D02BE6FBEC
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 09:34:59 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0179RUDx013874; Fri, 7 Feb 2020 10:34:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=bUFEdxgHJ3uF5fxlnj+Oz6ttTEQRedQ3ZUNqy8lCUjU=;
 b=IuS7DkoJEon3mMJ3lk5szh26gy3yt0ZaYpUkiXVkhDScwV65SGAkmHmGfVoXq0QMBhsH
 l9rk1ZLGTQUjt31ryiQZSs+fGhNHUIDdhsBOxX1+ARrGvnC1ByGOL8+YeiLxqdHnFUES
 0pwwvmAdzmW/UCbbihnIXmMbe9/t1CH4cC8h/Vm0JR3vEuDTMES5GgDC1lVFppK8UZ9O
 /feJ68sudoOhgtaNaCWo7B2sNaOsllbabbAICEepLfAGMqjh+1O3EGk2i0m5FyFDfDhs
 I89fXriFMPsPC+he+yQEctPcJYNzKWCAKYyzz1YCgVEP8NmxmTOLCWTN0+am1dKkYwMt AA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xyhm003tt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Feb 2020 10:34:53 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 22DE2100034;
 Fri,  7 Feb 2020 10:34:48 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E81192A8FA2;
 Fri,  7 Feb 2020 10:34:47 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 7 Feb
 2020 10:34:47 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 7 Feb 2020 10:34:47 +0100
From: Philippe CORNU <philippe.cornu@st.com>
To: Benjamin GAIGNARD <benjamin.gaignard@st.com>, "thierry.reding@gmail.com"
 <thierry.reding@gmail.com>, "sam@ravnborg.org" <sam@ravnborg.org>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com"
 <mark.rutland@arm.com>
Subject: Re: [PATCH v4 3/3] dt-bindings: panel: Convert orisetech, otm8009a to
 json-schema
Thread-Topic: [PATCH v4 3/3] dt-bindings: panel: Convert orisetech, otm8009a to
 json-schema
Thread-Index: AQHV3PIRgJ4AtMRmk0Ke4l0B2y5xt6gPaP+A
Date: Fri, 7 Feb 2020 09:34:47 +0000
Message-ID: <80b5cd29-166c-f3a2-891f-762c45dd203b@st.com>
References: <20200206133344.724-1-benjamin.gaignard@st.com>
 <20200206133344.724-4-benjamin.gaignard@st.com>
In-Reply-To: <20200206133344.724-4-benjamin.gaignard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <8804B4F629350A48B86A7680318AF44E@st.com>
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
> Convert orisetech,otm8009a to json-schema.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>   .../bindings/display/panel/orisetech,otm8009a.txt  | 23 ----------
>   .../bindings/display/panel/orisetech,otm8009a.yaml | 53 ++++++++++++++++++++++
>   2 files changed, 53 insertions(+), 23 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.txt
>   create mode 100644 Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.txt b/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.txt
> deleted file mode 100644
> index 203b03eefb68..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.txt
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -Orise Tech OTM8009A 3.97" 480x800 TFT LCD panel (MIPI-DSI video mode)
> -
> -The Orise Tech OTM8009A is a 3.97" 480x800 TFT LCD panel connected using
> -a MIPI-DSI video interface. Its backlight is managed through the DSI link.
> -
> -Required properties:
> -  - compatible: "orisetech,otm8009a"
> -  - reg: the virtual channel number of a DSI peripheral
> -
> -Optional properties:
> -  - reset-gpios: a GPIO spec for the reset pin (active low).
> -  - power-supply: phandle of the regulator that provides the supply voltage.
> -
> -Example:
> -&dsi {
> -	...
> -	panel@0 {
> -		compatible = "orisetech,otm8009a";
> -		reg = <0>;
> -		reset-gpios = <&gpioh 7 GPIO_ACTIVE_LOW>;
> -		power-supply = <&v1v8>;
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml b/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
> new file mode 100644
> index 000000000000..6e6ac995c27b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/orisetech,otm8009a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Orise Tech OTM8009A 3.97" 480x800 TFT LCD panel (MIPI-DSI video mode)
> +
> +maintainers:
> +  - Philippe CORNU <philippe.cornu@st.com>
> +
> +description: |
> +             The Orise Tech OTM8009A is a 3.97" 480x800 TFT LCD panel connected using
> +             a MIPI-DSI video interface. Its backlight is managed through the DSI link.
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +
> +  compatible:
> +    const: orisetech,otm8009a
> +
> +  reg:
> +    maxItems: 1
> +    description: DSI virtual channel
> +
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
> +  - reg
> +
> +examples:
> +  - |
> +    dsi@0 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      panel@0 {
> +        compatible = "orisetech,otm8009a";
> +        reg = <0>;
> +        reset-gpios = <&gpiof 15 0>;
> +        power-supply = <&v1v8>;
> +      };
> +    };
> +...
> +
> 

Reviewed-by: Philippe Cornu <philippe.cornu@st.com>
Thank you
Philippe :-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

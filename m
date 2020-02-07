Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7AC1554DE
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 10:39:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F3856FBF6;
	Fri,  7 Feb 2020 09:39:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E8746FBF6
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 09:39:23 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0179bwEi032026; Fri, 7 Feb 2020 10:39:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=uV+lOQb/omDQocQnES6jhPSEMxDi5yzug/DtBrg7Jxc=;
 b=bClpxiC9JbGfKTYOVULkh/N1MD+R1OBhC/IiKSY/2ON2YeMi5s+uD6dkf9CdClsalvlE
 rHBYdQio10C+9kgicSN5JFlHGYN+gCePYjbMELO+rde12Io2vDEygvaIeYEZLcKbQ+9B
 eNvSJ5yFDBa5JxP7iV9VzMtxDYE1f55Jl2v2AlYB2cqV6dvuQdr6Sb7bP1JAg9s3vqVL
 tkqi8DkbbmHTc8C2Q1w+zt6I3d5nezEK1GBh3OWC8o92jC1NaxHtlK29llZEtX6X66kI
 hdsS6LZAp9Npej7030laKit/mLEFiWbDvXg2SdiSWvph8IQRsDKXJ0TrUe0IoVnsqn9S TQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xyhk8srx1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Feb 2020 10:39:16 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6CB5610002A;
 Fri,  7 Feb 2020 10:39:12 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5669A2A8FB0;
 Fri,  7 Feb 2020 10:39:12 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Feb
 2020 10:39:11 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 7 Feb 2020 10:39:11 +0100
From: Philippe CORNU <philippe.cornu@st.com>
To: Benjamin GAIGNARD <benjamin.gaignard@st.com>, "thierry.reding@gmail.com"
 <thierry.reding@gmail.com>, "sam@ravnborg.org" <sam@ravnborg.org>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com"
 <mark.rutland@arm.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: one file of all simple DSI panels
Thread-Topic: [PATCH v4 1/3] dt-bindings: one file of all simple DSI panels
Thread-Index: AQHV3PIRj7wu8FMZKU6xZkktJ3qf8KgPaj+A
Date: Fri, 7 Feb 2020 09:39:11 +0000
Message-ID: <1755cf1f-3a4a-5637-865e-028f227abbaa@st.com>
References: <20200206133344.724-1-benjamin.gaignard@st.com>
 <20200206133344.724-2-benjamin.gaignard@st.com>
In-Reply-To: <20200206133344.724-2-benjamin.gaignard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-ID: <1E4CBBACC22A874BA4D832170E22A1C8@st.com>
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
 Yannick FERTRE <yannick.fertre@st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Benjamin,
and many thanks for this serie.
Regarding this patch:

Reviewed-by: Philippe Cornu <philippe.cornu@st.com>
Philippe :-)

On 2/6/20 2:33 PM, Benjamin Gaignard wrote:
> From: Sam Ravnborg <sam@ravnborg.org>
> 
> To complement panel-simple.yaml, create panel-simple-dsi.yaml.
> panel-simple-dsi-yaml are for all simple DSP panels with a single
> power-supply and optional backlight / enable GPIO.
> 
> Migrate panasonic,vvx10f034n00 over to the new file.
> 
> The objectives with one file for all the simple DSI panels are:
>      - Make it simpler to add bindings for simple DSI panels
>      - Keep the number of bindings file lower
>      - Keep the binding documentation for simple DSI panels more consistent
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Yannick Fertre <yannick.fertre@st.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: devicetree@vger.kernel.org
> ---
> version 4:
> - remove orisetech,otm8009a and raydium,rm68200 compatibles
> - remove reset-gpios optional property
> 
> version 3:
> - add orisetech,otm8009a and raydium,rm68200 compatibles
> - add reset-gpios optional property
> - fix indentation on compatible enumeration
> 
>   .../display/panel/panasonic,vvx10f034n00.txt       | 20 -------
>   .../bindings/display/panel/panel-simple-dsi.yaml   | 67 ++++++++++++++++++++++
>   2 files changed, 67 insertions(+), 20 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.txt
>   create mode 100644 Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.txt b/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.txt
> deleted file mode 100644
> index 37dedf6a6702..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.txt
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -Panasonic 10" WUXGA TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "panasonic,vvx10f034n00"
> -- reg: DSI virtual channel of the peripheral
> -- power-supply: phandle of the regulator that provides the supply voltage
> -
> -Optional properties:
> -- backlight: phandle of the backlight device attached to the panel
> -
> -Example:
> -
> -	mdss_dsi@fd922800 {
> -		panel@0 {
> -			compatible = "panasonic,vvx10f034n00";
> -			reg = <0>;
> -			power-supply = <&vreg_vsp>;
> -			backlight = <&lp8566_wled>;
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> new file mode 100644
> index 000000000000..8b60368a2425
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/panel-simple-dsi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Simple DSI panels with a single power-supply
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Sam Ravnborg <sam@ravnborg.org>
> +
> +description: |
> +  This binding file is a collection of the DSI panels that
> +  requires only a single power-supply.
> +  There are optionally a backlight and an enable GPIO.
> +  The panel may use an OF graph binding for the association to the display,
> +  or it may be a direct child node of the display.
> +
> +  If the panel is more advanced a dedicated binding file is required.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +
> +  compatible:
> +    enum:
> +      # compatible must be listed in alphabetical order, ordered by compatible.
> +      # The description in the comment is mandatory for each compatible.
> +
> +        # Panasonic 10" WUXGA TFT LCD panel
> +      - panasonic,vvx10f034n00
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
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - power-supply
> +  - reg
> +
> +examples:
> +  - |
> +    mdss_dsi@fd922800 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      panel@0 {
> +        compatible = "panasonic,vvx10f034n00";
> +        reg = <0>;
> +        power-supply = <&vcc_lcd_reg>;
> +
> +        port {
> +          panel: endpoint {
> +            remote-endpoint = <&ltdc_out>;
> +          };
> +        };
> +      };
> +    };
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

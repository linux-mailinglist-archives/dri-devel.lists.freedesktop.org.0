Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD4114E958
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 09:04:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A75E26FA96;
	Fri, 31 Jan 2020 08:04:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD796F9CA
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 15:07:43 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00UF3ZMl015109; Thu, 30 Jan 2020 16:07:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=xyxcZaoAfvSQh3zX7fH3Tu17xHjmlTcBlramWG+lPic=;
 b=T6zMoFmvTRYiTOguFS3mL4002JGuzIhB5dsCOGJGJusq5DAn9D1R4qJKWs24It9XbvXK
 PwBon78NsqA3gv4KGmKReRBR6DgSBBJ0QDxPja4mlxmkHLA7RrJg6LOJsQmfHNZwv6OW
 C9kvig0HVXaGoMVf3U1AvMb4pf4O3Txnt/jN4+GT17jwSx2AV8K9FSvRMrWAfiHEIs14
 EfG2nIjBZkPku2nxFeIP7r5aK4UjvjkNKZBr1GaRcs1Yfzq3vyMf7SFR58f1k+/8gTfs
 b1kDsgpDlar7xrnqrJtCRyVfu3HIHL8vMfnKFLqu+2qtP1x0SqBc4BMe91M4S2SaqR4x 8w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrbpb98hg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jan 2020 16:07:37 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DCEFD100034;
 Thu, 30 Jan 2020 16:07:32 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C7C292D792D;
 Thu, 30 Jan 2020 16:07:32 +0100 (CET)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Jan
 2020 16:07:32 +0100
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Thu, 30 Jan 2020 16:07:32 +0100
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: one file of all simple DSI panels
Thread-Topic: [PATCH v3] dt-bindings: one file of all simple DSI panels
Thread-Index: AQHV10mLDU78tIWhRkerqIj/vXieLqgDOUiAgAAFXAA=
Date: Thu, 30 Jan 2020 15:07:32 +0000
Message-ID: <4e517adb-d364-96e9-bc12-a44685db399b@st.com>
References: <20200130084430.20966-1-benjamin.gaignard@st.com>
 <CAL_JsqKDtiaq-hba5t1Ag-XJ1CQgkg1jPxCq9g2OdmK77+qHDQ@mail.gmail.com>
In-Reply-To: <CAL_JsqKDtiaq-hba5t1Ag-XJ1CQgkg1jPxCq9g2OdmK77+qHDQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <6C0564F6B925484C8E2F6999278E69F1@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-30_04:2020-01-28,
 2020-01-30 signatures=0
X-Mailman-Approved-At: Fri, 31 Jan 2020 08:04:00 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Yannick
 FERTRE <yannick.fertre@st.com>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/30/20 3:48 PM, Rob Herring wrote:
> On Thu, Jan 30, 2020 at 2:45 AM Benjamin Gaignard
> <benjamin.gaignard@st.com> wrote:
>> From: Sam Ravnborg <sam@ravnborg.org>
>>
>> To complement panel-simple.yaml, create panel-simple-dsi.yaml.
>> panel-simple-dsi-yaml are for all simple DSP panels with a single
>> power-supply and optional backlight / enable GPIO / reset GPIO.
>>
>> Migrate panasonic,vvx10f034n00, orisetech,otm8009a and raydium,rm68200 over to the new file.
>>
>> The objectives with one file for all the simple DSI panels are:
>>      - Make it simpler to add bindings for simple DSI panels
>>      - Keep the number of bindings file lower
>>      - Keep the binding documentation for simple DSI panels more consistent
>>
>> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
>> Cc: Thierry Reding <thierry.reding@gmail.com>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Yannick Fertre <yannick.fertre@st.com>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: devicetree@vger.kernel.org
>> ---
>> version 3:
>> - add orisetech,otm8009a and raydium,rm68200 compatibles
>> - add reset-gpios optional property
>> - fix indentation on compatible enumeration
>> => Rob had reviewed the second version but, given the changes in version 3
>>     I haven't added here.
>>   .../bindings/display/panel/orisetech,otm8009a.txt  | 23 -------
>>   .../display/panel/panasonic,vvx10f034n00.txt       | 20 ------
>>   .../bindings/display/panel/panel-simple-dsi.yaml   | 74 ++++++++++++++++++++++
>>   .../bindings/display/panel/raydium,rm68200.txt     | 25 --------
>>   4 files changed, 74 insertions(+), 68 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.txt
>>   delete mode 100644 Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.txt
>>   create mode 100644 Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
>>   delete mode 100644 Documentation/devicetree/bindings/display/panel/raydium,rm68200.txt
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.txt b/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.txt
>> deleted file mode 100644
>> index 203b03eefb68..000000000000
>> --- a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.txt
>> +++ /dev/null
>> @@ -1,23 +0,0 @@
>> -Orise Tech OTM8009A 3.97" 480x800 TFT LCD panel (MIPI-DSI video mode)
>> -
>> -The Orise Tech OTM8009A is a 3.97" 480x800 TFT LCD panel connected using
>> -a MIPI-DSI video interface. Its backlight is managed through the DSI link.
>> -
>> -Required properties:
>> -  - compatible: "orisetech,otm8009a"
>> -  - reg: the virtual channel number of a DSI peripheral
>> -
>> -Optional properties:
>> -  - reset-gpios: a GPIO spec for the reset pin (active low).
>> -  - power-supply: phandle of the regulator that provides the supply voltage.
>> -
>> -Example:
>> -&dsi {
>> -       ...
>> -       panel@0 {
>> -               compatible = "orisetech,otm8009a";
>> -               reg = <0>;
>> -               reset-gpios = <&gpioh 7 GPIO_ACTIVE_LOW>;
>> -               power-supply = <&v1v8>;
>> -       };
>> -};
>> diff --git a/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.txt b/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.txt
>> deleted file mode 100644
>> index 37dedf6a6702..000000000000
>> --- a/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.txt
>> +++ /dev/null
>> @@ -1,20 +0,0 @@
>> -Panasonic 10" WUXGA TFT LCD panel
>> -
>> -Required properties:
>> -- compatible: should be "panasonic,vvx10f034n00"
>> -- reg: DSI virtual channel of the peripheral
>> -- power-supply: phandle of the regulator that provides the supply voltage
>> -
>> -Optional properties:
>> -- backlight: phandle of the backlight device attached to the panel
>> -
>> -Example:
>> -
>> -       mdss_dsi@fd922800 {
>> -               panel@0 {
>> -                       compatible = "panasonic,vvx10f034n00";
>> -                       reg = <0>;
>> -                       power-supply = <&vreg_vsp>;
>> -                       backlight = <&lp8566_wled>;
>> -               };
>> -       };
>> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
>> new file mode 100644
>> index 000000000000..1168b8186490
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
>> @@ -0,0 +1,74 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/panel/panel-simple-dsi.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Simple DSI panels with a single power-supply
>> +
>> +maintainers:
>> +  - Thierry Reding <thierry.reding@gmail.com>
>> +  - Sam Ravnborg <sam@ravnborg.org>
>> +
>> +description: |
>> +  This binding file is a collection of the DSI panels that
>> +  requires only a single power-supply.
>> +  There are optionally a backlight and an enable GPIO.
>> +  The panel may use an OF graph binding for the association to the display,
>> +  or it may be a direct child node of the display.
>> +
>> +  If the panel is more advanced a dedicated binding file is required.
>> +
>> +allOf:
>> +  - $ref: panel-common.yaml#
>> +
>> +properties:
>> +
>> +  compatible:
>> +    enum:
>> +      # compatible must be listed in alphabetical order, ordered by compatible.
>> +      # The description in the comment is mandatory for each compatible.
>> +
>> +        # Orise Tech OTM8009A is a 3.97" 480x800 TFT LCD
>> +      - orisetech,otm8009a
>> +        # Panasonic 10" WUXGA TFT LCD panel
>> +      - panasonic,vvx10f034n00
>> +        # Raydium Semiconductor Corporation RM68200 is a 5.5" 720x1280 TFT LCD
>> +      - raydium,rm68200
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description: DSI virtual channel
>> +
>> +  reset-gpios:
>> +    maxItems : 1
> Can we keep whether to add 'reset-gpios' a separate discussion. If we
> do add it, then it should go in panel-common.yaml and
> panel-simple.yaml.

reset-gpios is needed, at least, for orisetech,otm8009a and raydium,rm68200
maybe that means these two displays are not simple dsi panels.
It is the case I could create dedicated files for them.

Benjamin

> Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

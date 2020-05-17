Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB7D1D74EC
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 12:14:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9276E225;
	Mon, 18 May 2020 10:14:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 229A76E04B
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 11:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1589713609; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a+8uUs3KZErtQFYLwRFcI4Y9Qu/GahR4WBEx76kMicU=;
 b=JcNP/sXXR5LlAQyGgIDVT84jR1N8QUsQZViSBBi4neVMfuz8zSKI3xrAbm6Kt4hZTkGpY8
 oANNPgIIs9BhTuh23iqoxGTXZyOnEhbUrzyq5kOrxlI15KXhg6XigZB2qW1jydrd/+UJ55
 TLLg3EO0buSMfIKZ5hHd8H+D4AJM7O8=
Date: Sun, 17 May 2020 13:06:38 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 02/12] dt-bindings: display: Add ingenic,ipu.yaml
To: Sam Ravnborg <sam@ravnborg.org>
Message-Id: <2V2HAQ.FED0YBJJAZ7D2@crapouillou.net>
In-Reply-To: <20200517061710.GB609600@ravnborg.org>
References: <20200516215057.392609-1-paul@crapouillou.net>
 <20200516215057.392609-2-paul@crapouillou.net>
 <20200517061710.GB609600@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 18 May 2020 10:14:39 +0000
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
Cc: devicetree@vger.kernel.org, od@zcrc.me,
 "Rafael J . Wysocki" <rafael@kernel.org>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Le dim. 17 mai 2020 =E0 8:17, Sam Ravnborg <sam@ravnborg.org> a =E9crit :
> Hi Paul.
> On Sat, May 16, 2020 at 11:50:47PM +0200, Paul Cercueil wrote:
>>  Add documentation of the Device Tree bindings for the Image =

>> Processing
>>  Unit (IPU) found in most Ingenic SoCs.
>> =

>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> =

> For me it fails like this:

Oops. I missed the 'const:' in the item list. Will fix when I send a =

V2, and verify it this time.

Cheers,
-Paul

> /Documentation/devicetree/bindings/display/ingenic,ipu.yaml: =

> ignoring, error in schema: properties: compatible: oneOf: 1: items
> warning: no schema found in file: =

> Documentation/devicetree/bindings/display/ingenic,ipu.yaml
> make[2]: *** [Documentation/devicetree/bindings/Makefile:42: =

> Documentation/devicetree/bindings/processed-schema.yaml] Error 255
> make[2]: *** Waiting for unfinished jobs....
> Documentation/devicetree/bindings/display/ingenic,ipu.yaml: =

> properties:compatible:oneOf:1:items: ['ingenic,jz4770-ipu', =

> 'ingenic,jz4760-ipu'] is not valid under any of the given schemas =

> (Possible causes of the failure):
> 	Documentation/devicetree/bindings/display/ingenic,ipu.yaml: =

> properties:compatible:oneOf:1:items: ['ingenic,jz4770-ipu', =

> 'ingenic,jz4760-ipu'] is not of type 'object', 'boolean'
> 	Documentation/devicetree/bindings/display/ingenic,ipu.yaml: =

> properties:compatible:oneOf:1:items:0: 'ingenic,jz4770-ipu' is not of =

> type 'object', 'boolean'
> 	Documentation/devicetree/bindings/display/ingenic,ipu.yaml: =

> properties:compatible:oneOf:1:items:1: 'ingenic,jz4760-ipu' is not of =

> type 'object', 'boolean'
> =

> =

> 	Sam
> =

>>  ---
>>   .../bindings/display/ingenic,ipu.yaml         | 65 =

>> +++++++++++++++++++
>>   1 file changed, 65 insertions(+)
>>   create mode 100644 =

>> Documentation/devicetree/bindings/display/ingenic,ipu.yaml
>> =

>>  diff --git =

>> a/Documentation/devicetree/bindings/display/ingenic,ipu.yaml =

>> b/Documentation/devicetree/bindings/display/ingenic,ipu.yaml
>>  new file mode 100644
>>  index 000000000000..22fe02ca866d
>>  --- /dev/null
>>  +++ b/Documentation/devicetree/bindings/display/ingenic,ipu.yaml
>>  @@ -0,0 +1,65 @@
>>  +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>  +%YAML 1.2
>>  +---
>>  +$id: http://devicetree.org/schemas/display/ingenic,ipu.yaml#
>>  +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>  +
>>  +title: Ingenic SoCs Image Processing Unit (IPU) devicetree bindings
>>  +
>>  +maintainers:
>>  +  - Paul Cercueil <paul@crapouillou.net>
>>  +
>>  +properties:
>>  +  compatible:
>>  +    oneOf:
>>  +      - enum:
>>  +        - ingenic,jz4725b-ipu
>>  +        - ingenic,jz4760-ipu
>>  +      - items:
>>  +        - ingenic,jz4770-ipu
>>  +        - ingenic,jz4760-ipu
>>  +
>>  +  reg:
>>  +    maxItems: 1
>>  +
>>  +  interrupts:
>>  +    maxItems: 1
>>  +
>>  +  clocks:
>>  +    maxItems: 1
>>  +
>>  +  clock-names:
>>  +    const: ipu
>>  +
>>  +patternProperties:
>>  +  "^ports?$":
>>  +    description: OF graph bindings (specified in =

>> bindings/graph.txt).
>>  +
>>  +required:
>>  +  - compatible
>>  +  - reg
>>  +  - interrupts
>>  +  - clocks
>>  +  - clock-names
>>  +
>>  +additionalProperties: false
>>  +
>>  +examples:
>>  +  - |
>>  +    #include <dt-bindings/clock/jz4770-cgu.h>
>>  +    ipu@13080000 {
>>  +      compatible =3D "ingenic,jz4770-ipu", "ingenic,jz4760-ipu";
>>  +      reg =3D <0x13080000 0x800>;
>>  +
>>  +      interrupt-parent =3D <&intc>;
>>  +      interrupts =3D <29>;
>>  +
>>  +      clocks =3D <&cgu JZ4770_CLK_IPU>;
>>  +      clock-names =3D "ipu";
>>  +
>>  +      port {
>>  +        ipu_ep: endpoint {
>>  +          remote-endpoint =3D <&lcdc_ep>;
>>  +        };
>>  +      };
>>  +    };
>>  --
>>  2.26.2
>> =

>>  _______________________________________________
>>  dri-devel mailing list
>>  dri-devel@lists.freedesktop.org
>>  https://lists.freedesktop.org/mailman/listinfo/dri-devel


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF4B2402B5
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 09:36:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 541ED89A32;
	Mon, 10 Aug 2020 07:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5028D6E176
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 12:52:44 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id a5so1730160ioa.13
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Aug 2020 05:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
 bh=JWIALOfRV45nZL/1N9LGPRT4zFymvH5lqcJFH+DWMrc=;
 b=uMuxbsKto1KdzpaEoe4kzZIRooNAkw1pB16lnW82YiAXdKfJzsdx9NZS87uYI8QmQ/
 /NDXRavxsY3kBblcbXpsdWXTQQfNBICCEZ/XSvj3WuR1AXl+6spulyP/0b4yL6otqGcb
 sVScqDob6cB7KpL/rjuwVqnNrvp5GsMYOt7V4w/DoVhIPX3v+KWAKzBs5Eo9QAswAVNx
 ihTG4Xt/XBDRUJp81leGhfoNMOvcUr6+7FzAiYlJaTMYzoh7JDqZvwCBiEWXZDeRXaxW
 WQxL8VfIF3VyL4oCcseimzBMTlW4kMnUtnYT4XscHGT5o9+O7s+oy/qvaEfH95tVJtjz
 yw5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:cc;
 bh=JWIALOfRV45nZL/1N9LGPRT4zFymvH5lqcJFH+DWMrc=;
 b=YOIUaqBzq05MFzkNXQtp2kXRS+Rjs7RIsIHqAw4UJlJ/X9hmdtD8dLGBYhgYZHmdBG
 RlawqSuEOd7wOdXanZKVlhSFHiVXRirBMYcdEE6y5o1QMSmZTPiQRL4fgyAgfs34rZ5L
 xzHG9/EHLe6panLhL3LCtqEcCS6F2AxHDjEtnhZ5uVAcQNr0ov2n/JtYy4HJsilvWpyf
 RBu2QyZMfaStQg2kBohUihq8XuSJJQhgJJ52CEtnAFqW2Gbos/Wj/qczQbVPMOf9jYtf
 WzeL+8/EiH4wS3eXz+nXn4pER44qMeoOt0uMuYstgew/e/tufh6PBk4oS5KcmlKwLdt2
 Eghg==
X-Gm-Message-State: AOAM532BgtA1jxL1eQ8H1hmK2e03dnm7Ke/66hFT+OhYIWip4d8cUSwA
 yPLkjI53wdgK7DVF4fDaiH0EHUEzFgR4n5BK3hU=
X-Received: by 2002:a6b:6204:: with SMTP id f4mt4397749iog.56.1596804763620;
 Fri, 07 Aug 2020 05:52:43 -0700 (PDT)
MIME-Version: 1.0
References: <1594388491-15129-1-git-send-email-simhavcs@gmail.com>
 <CAGWqDJ74bveHPKXqdPhwbZjb=cXPPQLTEng4oi+dkZa-1fRz_Q@mail.gmail.com>
In-Reply-To: <CAGWqDJ74bveHPKXqdPhwbZjb=cXPPQLTEng4oi+dkZa-1fRz_Q@mail.gmail.com>
From: Vinay Simha B N <simhavcs@gmail.com>
Date: Fri, 7 Aug 2020 18:22:31 +0530
Message-ID: <CAGWqDJ58xJYdAH0EOTycOrxzd1oSteWApDfk7fxRm+TvucME-w@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] dt-binding: Add DSI/LVDS TC358775 bridge bindings
X-Mailman-Approved-At: Mon, 10 Aug 2020 07:35:59 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============1800014402=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1800014402==
Content-Type: multipart/alternative; boundary="000000000000b7608a05ac49145f"

--000000000000b7608a05ac49145f
Content-Type: text/plain; charset="UTF-8"

Hi All,

Please Review the patch

On Wed, Jul 29, 2020 at 6:01 PM Vinay Simha B N <simhavcs@gmail.com> wrote:

> Hi All,
>
> Please Review the patch
>
> On Fri, Jul 10, 2020 at 7:11 PM Vinay Simha BN <simhavcs@gmail.com> wrote:
>
>> - license modified to (GPL-2.0-only OR BSD-2-Clause)
>> - single-link and dual-link lvds description and
>>   examples are added
>> - proper indentation
>> - VESA/JEIDA formats picked from panel-lvds dts
>> - dsi data-lanes property removed, it will be picked
>>   from dsi0 ports
>> - dual-link lvds port added and implemented
>> - converted from .txt to .yaml
>>
>> Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>
>> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>> v1:
>>  Initial version wast .txt file
>>
>> v2:
>>  From txt to yaml file format
>>
>> v3:
>> * Andrzej Hajda review comments incorporated
>>   dual port lvds implemented
>>
>> * Laurent Pinchart review comments incorporated
>>   dsi lanes property removed and it is dynamically
>>   picked from the dsi ports
>>   VESA/JEIDA format picked from panel-lvds dts
>>
>> v4:
>> * Sam Ravnborg review comments incorporated
>>   }' is indented properly in examples data-lanes
>>   description for single-link and dual-link lvds
>>
>> v5:
>> * Sam Ravnborg review comments incorporated
>>   license modified to (GPL-2.0-only OR BSD-2-Clause)
>>   changelog added
>>
>> v6:
>> * No changes, revision version mentioned to inline with
>>   driver file
>>
>> v7:
>> * change log added
>>   Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>>
>> v8:
>> * Reviewed-by: Rob Herring <robh@kernel.org>
>> * change log modified in reverse chronological order
>> ---
>>  .../bindings/display/bridge/toshiba,tc358775.yaml  | 215
>> +++++++++++++++++++++
>>  1 file changed, 215 insertions(+)
>>  create mode 100644
>> Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
>>
>> diff --git
>> a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
>> b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
>> new file mode 100644
>> index 0000000..31f085d
>> --- /dev/null
>> +++
>> b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
>> @@ -0,0 +1,215 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/bridge/toshiba,tc358775.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Toshiba TC358775 DSI to LVDS bridge bindings
>> +
>> +maintainers:
>> + - Vinay Simha BN <simhavcs@gmail.com>
>> +
>> +description: |
>> + This binding supports DSI to LVDS bridge TC358775
>> +
>> + MIPI DSI-RX Data 4-lane, CLK 1-lane with data rates up to 800 Mbps/lane.
>> + Video frame size:
>> + Up to 1600x1200 24-bit/pixel resolution for single-link LVDS display
>> panel
>> + limited by 135 MHz LVDS speed
>> + Up to WUXGA (1920x1200 24-bit pixels) resolution for dual-link LVDS
>> display
>> + panel, limited by 270 MHz LVDS speed.
>> +
>> +properties:
>> +  compatible:
>> +    const: toshiba,tc358775
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description: i2c address of the bridge, 0x0f
>> +
>> +  vdd-supply:
>> +    maxItems: 1
>> +    description:  1.2V LVDS Power Supply
>> +
>> +  vddio-supply:
>> +    maxItems: 1
>> +    description: 1.8V IO Power Supply
>> +
>> +  stby-gpios:
>> +    maxItems: 1
>> +    description: Standby pin, Low active
>> +
>> +  reset-gpios:
>> +    maxItems: 1
>> +    description: Hardware reset, Low active
>> +
>> +  ports:
>> +    type: object
>> +    description:
>> +      A node containing input and output port nodes with endpoint
>> definitions
>> +      as documented in
>> +      Documentation/devicetree/bindings/media/video-interfaces.txt
>> +    properties:
>> +      "#address-cells":
>> +        const: 1
>> +
>> +      "#size-cells":
>> +        const: 0
>> +
>> +      port@0:
>> +        type: object
>> +        description: |
>> +          DSI Input. The remote endpoint phandle should be a
>> +          reference to a valid mipi_dsi_host device node.
>> +
>> +      port@1:
>> +        type: object
>> +        description: |
>> +          Video port for LVDS output (panel or connector).
>> +
>> +      port@2:
>> +        type: object
>> +        description: |
>> +          Video port for Dual link LVDS output (panel or connector).
>> +
>> +    required:
>> +      - port@0
>> +      - port@1
>> +
>> +required:
>> + - compatible
>> + - reg
>> + - vdd-supply
>> + - vddio-supply
>> + - stby-gpios
>> + - reset-gpios
>> + - ports
>> +
>> +examples:
>> + - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +
>> +    /* For single-link LVDS display panel */
>> +
>> +    i2c@78b8000 {
>> +        /* On High speed expansion */
>> +        label = "HS-I2C2";
>> +        reg = <0x078b8000 0x500>;
>> +        clock-frequency = <400000>; /* fastmode operation */
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        tc_bridge: bridge@f {
>> +            compatible = "toshiba,tc358775";
>> +            reg = <0x0f>;
>> +
>> +            vdd-supply = <&pm8916_l2>;
>> +            vddio-supply = <&pm8916_l6>;
>> +
>> +            stby-gpios = <&msmgpio 99 GPIO_ACTIVE_LOW>;
>> +            reset-gpios = <&msmgpio 72 GPIO_ACTIVE_LOW>;
>> +
>> +            ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                port@0 {
>> +                    reg = <0>;
>> +                    d2l_in_test: endpoint {
>> +                        remote-endpoint = <&dsi0_out>;
>> +                    };
>> +                };
>> +
>> +                port@1 {
>> +                    reg = <1>;
>> +                    lvds_out: endpoint {
>> +                        remote-endpoint = <&panel_in>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +    };
>> +
>> +    dsi@1a98000 {
>> +        reg = <0x1a98000 0x25c>;
>> +        reg-names = "dsi_ctrl";
>> +
>> +        ports {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +            port@1 {
>> +                reg = <1>;
>> +                dsi0_out: endpoint {
>> +                    remote-endpoint = <&d2l_in_test>;
>> +                    data-lanes = <0 1 2 3>;
>> +                };
>> +             };
>> +         };
>> +     };
>> +
>> + - |
>> +    /* For dual-link LVDS display panel */
>> +
>> +    i2c@78b8000 {
>> +        /* On High speed expansion */
>> +        label = "HS-I2C2";
>> +        reg = <0x078b8000 0x500>;
>> +        clock-frequency = <400000>; /* fastmode operation */
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        tc_bridge_dual: bridge@f {
>> +            compatible = "toshiba,tc358775";
>> +            reg = <0x0f>;
>> +
>> +            vdd-supply = <&pm8916_l2>;
>> +            vddio-supply = <&pm8916_l6>;
>> +
>> +            stby-gpios = <&msmgpio 99 GPIO_ACTIVE_LOW>;
>> +            reset-gpios = <&msmgpio 72 GPIO_ACTIVE_LOW>;
>> +
>> +            ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                port@0 {
>> +                    reg = <0>;
>> +                    d2l_in_dual: endpoint {
>> +                        remote-endpoint = <&dsi0_out_dual>;
>> +                    };
>> +                };
>> +
>> +                port@1 {
>> +                    reg = <1>;
>> +                    lvds0_out: endpoint {
>> +                        remote-endpoint = <&panel_in0>;
>> +                    };
>> +                };
>> +
>> +                port@2 {
>> +                    reg = <2>;
>> +                    lvds1_out: endpoint {
>> +                        remote-endpoint = <&panel_in1>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +    };
>> +
>> +    dsi@1a98000 {
>> +        reg = <0x1a98000 0x25c>;
>> +        reg-names = "dsi_ctrl";
>> +
>> +        ports {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +            port@1 {
>> +                reg = <1>;
>> +                dsi0_out_dual: endpoint {
>> +                    remote-endpoint = <&d2l_in_dual>;
>> +                    data-lanes = <0 1 2 3>;
>> +                };
>> +             };
>> +         };
>> +     };
>> +...
>> --
>> 2.1.2
>>
>>
>
> --
> regards,
> vinaysimha
>


-- 
regards,
vinaysimha

--000000000000b7608a05ac49145f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi All,</div><div><br></div><div>Please Review the pa=
tch</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Wed, Jul 29, 2020 at 6:01 PM Vinay Simha B N &lt;<a href=3D"mai=
lto:simhavcs@gmail.com">simhavcs@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hi All,</di=
v><div><br></div><div>Please Review the patch<br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 10, 2020=
 at 7:11 PM Vinay Simha BN &lt;<a href=3D"mailto:simhavcs@gmail.com" target=
=3D"_blank">simhavcs@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">- license modified to (GPL-2.0-only OR BSD-2-=
Clause)<br>
- single-link and dual-link lvds description and<br>
=C2=A0 examples are added<br>
- proper indentation<br>
- VESA/JEIDA formats picked from panel-lvds dts<br>
- dsi data-lanes property removed, it will be picked<br>
=C2=A0 from dsi0 ports<br>
- dual-link lvds port added and implemented<br>
- converted from .txt to .yaml<br>
<br>
Signed-off-by: Vinay Simha BN &lt;<a href=3D"mailto:simhavcs@gmail.com" tar=
get=3D"_blank">simhavcs@gmail.com</a>&gt;<br>
Reviewed-by: Sam Ravnborg &lt;<a href=3D"mailto:sam@ravnborg.org" target=3D=
"_blank">sam@ravnborg.org</a>&gt;<br>
Reviewed-by: Rob Herring &lt;<a href=3D"mailto:robh@kernel.org" target=3D"_=
blank">robh@kernel.org</a>&gt;<br>
---<br>
v1:<br>
=C2=A0Initial version wast .txt file<br>
<br>
v2:<br>
=C2=A0From txt to yaml file format<br>
<br>
v3:<br>
* Andrzej Hajda review comments incorporated<br>
=C2=A0 dual port lvds implemented<br>
<br>
* Laurent Pinchart review comments incorporated<br>
=C2=A0 dsi lanes property removed and it is dynamically<br>
=C2=A0 picked from the dsi ports<br>
=C2=A0 VESA/JEIDA format picked from panel-lvds dts<br>
<br>
v4:<br>
* Sam Ravnborg review comments incorporated<br>
=C2=A0 }&#39; is indented properly in examples data-lanes<br>
=C2=A0 description for single-link and dual-link lvds<br>
<br>
v5:<br>
* Sam Ravnborg review comments incorporated<br>
=C2=A0 license modified to (GPL-2.0-only OR BSD-2-Clause)<br>
=C2=A0 changelog added<br>
<br>
v6:<br>
* No changes, revision version mentioned to inline with<br>
=C2=A0 driver file<br>
<br>
v7:<br>
* change log added<br>
=C2=A0 Reviewed-by: Sam Ravnborg &lt;<a href=3D"mailto:sam@ravnborg.org" ta=
rget=3D"_blank">sam@ravnborg.org</a>&gt;<br>
<br>
v8:<br>
* Reviewed-by: Rob Herring &lt;<a href=3D"mailto:robh@kernel.org" target=3D=
"_blank">robh@kernel.org</a>&gt;<br>
* change log modified in reverse chronological order<br>
---<br>
=C2=A0.../bindings/display/bridge/toshiba,tc358775.yaml=C2=A0 | 215 +++++++=
++++++++++++++<br>
=C2=A01 file changed, 215 insertions(+)<br>
=C2=A0create mode 100644 Documentation/devicetree/bindings/display/bridge/t=
oshiba,tc358775.yaml<br>
<br>
diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358=
775.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc35877=
5.yaml<br>
new file mode 100644<br>
index 0000000..31f085d<br>
--- /dev/null<br>
+++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yam=
l<br>
@@ -0,0 +1,215 @@<br>
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)<br>
+%YAML 1.2<br>
+---<br>
+$id: <a href=3D"http://devicetree.org/schemas/display/bridge/toshiba,tc358=
775.yaml#" rel=3D"noreferrer" target=3D"_blank">http://devicetree.org/schem=
as/display/bridge/toshiba,tc358775.yaml#</a><br>
+$schema: <a href=3D"http://devicetree.org/meta-schemas/core.yaml#" rel=3D"=
noreferrer" target=3D"_blank">http://devicetree.org/meta-schemas/core.yaml#=
</a><br>
+<br>
+title: Toshiba TC358775 DSI to LVDS bridge bindings<br>
+<br>
+maintainers:<br>
+ - Vinay Simha BN &lt;<a href=3D"mailto:simhavcs@gmail.com" target=3D"_bla=
nk">simhavcs@gmail.com</a>&gt;<br>
+<br>
+description: |<br>
+ This binding supports DSI to LVDS bridge TC358775<br>
+<br>
+ MIPI DSI-RX Data 4-lane, CLK 1-lane with data rates up to 800 Mbps/lane.<=
br>
+ Video frame size:<br>
+ Up to 1600x1200 24-bit/pixel resolution for single-link LVDS display pane=
l<br>
+ limited by 135 MHz LVDS speed<br>
+ Up to WUXGA (1920x1200 24-bit pixels) resolution for dual-link LVDS displ=
ay<br>
+ panel, limited by 270 MHz LVDS speed.<br>
+<br>
+properties:<br>
+=C2=A0 compatible:<br>
+=C2=A0 =C2=A0 const: toshiba,tc358775<br>
+<br>
+=C2=A0 reg:<br>
+=C2=A0 =C2=A0 maxItems: 1<br>
+=C2=A0 =C2=A0 description: i2c address of the bridge, 0x0f<br>
+<br>
+=C2=A0 vdd-supply:<br>
+=C2=A0 =C2=A0 maxItems: 1<br>
+=C2=A0 =C2=A0 description:=C2=A0 1.2V LVDS Power Supply<br>
+<br>
+=C2=A0 vddio-supply:<br>
+=C2=A0 =C2=A0 maxItems: 1<br>
+=C2=A0 =C2=A0 description: 1.8V IO Power Supply<br>
+<br>
+=C2=A0 stby-gpios:<br>
+=C2=A0 =C2=A0 maxItems: 1<br>
+=C2=A0 =C2=A0 description: Standby pin, Low active<br>
+<br>
+=C2=A0 reset-gpios:<br>
+=C2=A0 =C2=A0 maxItems: 1<br>
+=C2=A0 =C2=A0 description: Hardware reset, Low active<br>
+<br>
+=C2=A0 ports:<br>
+=C2=A0 =C2=A0 type: object<br>
+=C2=A0 =C2=A0 description:<br>
+=C2=A0 =C2=A0 =C2=A0 A node containing input and output port nodes with en=
dpoint definitions<br>
+=C2=A0 =C2=A0 =C2=A0 as documented in<br>
+=C2=A0 =C2=A0 =C2=A0 Documentation/devicetree/bindings/media/video-interfa=
ces.txt<br>
+=C2=A0 =C2=A0 properties:<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;#address-cells&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 const: 1<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;#size-cells&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 const: 0<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 port@0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 type: object<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DSI Input. The remote endpoint phandle =
should be a<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reference to a valid mipi_dsi_host devi=
ce node.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 port@1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 type: object<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Video port for LVDS output (panel or co=
nnector).<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 port@2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 type: object<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Video port for Dual link LVDS output (p=
anel or connector).<br>
+<br>
+=C2=A0 =C2=A0 required:<br>
+=C2=A0 =C2=A0 =C2=A0 - port@0<br>
+=C2=A0 =C2=A0 =C2=A0 - port@1<br>
+<br>
+required:<br>
+ - compatible<br>
+ - reg<br>
+ - vdd-supply<br>
+ - vddio-supply<br>
+ - stby-gpios<br>
+ - reset-gpios<br>
+ - ports<br>
+<br>
+examples:<br>
+ - |<br>
+=C2=A0 =C2=A0 #include &lt;dt-bindings/gpio/gpio.h&gt;<br>
+<br>
+=C2=A0 =C2=A0 /* For single-link LVDS display panel */<br>
+<br>
+=C2=A0 =C2=A0 i2c@78b8000 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* On High speed expansion */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 label =3D &quot;HS-I2C2&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x078b8000 0x500&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 clock-frequency =3D &lt;400000&gt;; /* fastmod=
e operation */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #address-cells =3D &lt;1&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #size-cells =3D &lt;0&gt;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tc_bridge: bridge@f {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;toshiba,tc3=
58775&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x0f&gt;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vdd-supply =3D &lt;&amp;pm8916_l=
2&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vddio-supply =3D &lt;&amp;pm8916=
_l6&gt;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stby-gpios =3D &lt;&amp;msmgpio =
99 GPIO_ACTIVE_LOW&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reset-gpios =3D &lt;&amp;msmgpio=
 72 GPIO_ACTIVE_LOW&gt;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ports {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #address-cells =3D=
 &lt;1&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #size-cells =3D &l=
t;0&gt;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 port@0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =
=3D &lt;0&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d2l_=
in_test: endpoint {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 remote-endpoint =3D &lt;&amp;dsi0_out&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 port@1 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =
=3D &lt;1&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lvds=
_out: endpoint {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 remote-endpoint =3D &lt;&amp;panel_in&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+=C2=A0 =C2=A0 };<br>
+<br>
+=C2=A0 =C2=A0 dsi@1a98000 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x1a98000 0x25c&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg-names =3D &quot;dsi_ctrl&quot;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ports {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #address-cells =3D &lt;1&gt;;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #size-cells =3D &lt;0&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 port@1 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;1&gt;;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dsi0_out: endpoint=
 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remo=
te-endpoint =3D &lt;&amp;d2l_in_test&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data=
-lanes =3D &lt;0 1 2 3&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0};<br>
+<br>
+ - |<br>
+=C2=A0 =C2=A0 /* For dual-link LVDS display panel */<br>
+<br>
+=C2=A0 =C2=A0 i2c@78b8000 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* On High speed expansion */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 label =3D &quot;HS-I2C2&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x078b8000 0x500&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 clock-frequency =3D &lt;400000&gt;; /* fastmod=
e operation */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #address-cells =3D &lt;1&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #size-cells =3D &lt;0&gt;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tc_bridge_dual: bridge@f {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;toshiba,tc3=
58775&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x0f&gt;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vdd-supply =3D &lt;&amp;pm8916_l=
2&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vddio-supply =3D &lt;&amp;pm8916=
_l6&gt;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stby-gpios =3D &lt;&amp;msmgpio =
99 GPIO_ACTIVE_LOW&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reset-gpios =3D &lt;&amp;msmgpio=
 72 GPIO_ACTIVE_LOW&gt;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ports {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #address-cells =3D=
 &lt;1&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #size-cells =3D &l=
t;0&gt;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 port@0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =
=3D &lt;0&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d2l_=
in_dual: endpoint {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 remote-endpoint =3D &lt;&amp;dsi0_out_dual&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 port@1 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =
=3D &lt;1&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lvds=
0_out: endpoint {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 remote-endpoint =3D &lt;&amp;panel_in0&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 port@2 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =
=3D &lt;2&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lvds=
1_out: endpoint {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 remote-endpoint =3D &lt;&amp;panel_in1&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+=C2=A0 =C2=A0 };<br>
+<br>
+=C2=A0 =C2=A0 dsi@1a98000 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x1a98000 0x25c&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg-names =3D &quot;dsi_ctrl&quot;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ports {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #address-cells =3D &lt;1&gt;;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #size-cells =3D &lt;0&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 port@1 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;1&gt;;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dsi0_out_dual: end=
point {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remo=
te-endpoint =3D &lt;&amp;d2l_in_dual&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data=
-lanes =3D &lt;0 1 2 3&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0};<br>
+...<br>
-- <br>
2.1.2<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">regards,<b=
r>vinaysimha</div>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">regards,<br>vinaysimha</div>

--000000000000b7608a05ac49145f--

--===============1800014402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1800014402==--

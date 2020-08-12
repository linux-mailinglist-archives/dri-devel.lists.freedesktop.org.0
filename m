Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 259122425C7
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 09:05:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 539C86E8AA;
	Wed, 12 Aug 2020 07:05:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2546E899
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 02:19:05 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id g19so999215ioh.8
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 19:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QNOKi7bo19L95Ny9tDRoVVztDB3KKoecjRpwEpuHSxU=;
 b=j4vNcAbO33roSxxUvMKZ3wAlRlW/1IithvIR+2dpxWRu37jaVrUBQGTqP7knGARmbs
 Cay4vLOxXLIDZrbrMCt1aoFC2+CGlmVPi6PWyXRJ6/Vxohc5ntvGbpkuM5nBmCq9t7QC
 3xmVxjOscSExXJll+FZ9VTpH6UV0/REgpStzSTT04E0tjGKk1tdITatVETyM9vn5PXv6
 U8ujt+YuP52lrvrctSQsjx1yLEDKOvnrCaFo3X6L9O3xqcWnQpgAvV+BXxTNaPgnj0qW
 L3FUL6aaeRLCridU5/+0liWsdpP+61WRhNealLq5j12mtEv79F15uf1OJcQmSPnpz38W
 lqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QNOKi7bo19L95Ny9tDRoVVztDB3KKoecjRpwEpuHSxU=;
 b=mt5JBmpgP7LllpcezO3pYgsmL0rwH33sHLxoP1xCl9fEndvYhC5ntd3e+QlVXtFXTe
 1DzNY8y5Fb5tRGGgDNMGEH885j40eVesg831KS7Tv3DISsDv1EArcn1rY1bYOf5WZ6RF
 8RPlLRH6wQ+PRoECUgoYdpVDhJKXwGKKyZrHFMKFTgnncZq+B8cQPMR4uH9m4vy6FcbY
 HPCXrWaHDRuHM1XqTSD/+MaKYXBQRghzaWVz3ExHAvMh26P+SgEa7rNIOzGpmWf5hGXQ
 mItwWTGytp8cBtlcYyUsJtEl1wcU4SppIU7bdkbqWs5wlORhNjDQUkWbgt19YXuJex55
 sScQ==
X-Gm-Message-State: AOAM530JFlsUca5YQjLrWbZ2BqWvqd2vSdpqUpG09ba3E8a0ImpFK3t2
 jAOI35j99HhUJtSVM/j6fbF6bcKzjS/vtYQPYAA=
X-Google-Smtp-Source: ABdhPJy0BnJe1GdHomA3iRlOiT0IiGTCiDMUylxDjln2uC6QAdiGVFgINk2UJ7E2QkcHY3TPgf/PwozYyCO4oZXSXkE=
X-Received: by 2002:a6b:e31a:: with SMTP id u26mr24785272ioc.162.1597198744219; 
 Tue, 11 Aug 2020 19:19:04 -0700 (PDT)
MIME-Version: 1.0
References: <1594388491-15129-1-git-send-email-simhavcs@gmail.com>
 <CAGWqDJ74bveHPKXqdPhwbZjb=cXPPQLTEng4oi+dkZa-1fRz_Q@mail.gmail.com>
 <20200810173843.GB292825@ravnborg.org>
In-Reply-To: <20200810173843.GB292825@ravnborg.org>
From: Vinay Simha B N <simhavcs@gmail.com>
Date: Wed, 12 Aug 2020 07:48:50 +0530
Message-ID: <CAGWqDJ6xLwaSoig3OYST+=-Zn4EyMpTxbrJKrr=LFdx6CfML6w@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] dt-binding: Add DSI/LVDS TC358775 bridge bindings
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Approved-At: Wed, 12 Aug 2020 07:05:21 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1037509962=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1037509962==
Content-Type: multipart/alternative; boundary="000000000000c91a6105aca4cffa"

--000000000000c91a6105aca4cffa
Content-Type: text/plain; charset="UTF-8"

Sam,

Thanks.

On Mon, Aug 10, 2020 at 11:08 PM Sam Ravnborg <sam@ravnborg.org> wrote:

> Hi Vinay.
>
> On Wed, Jul 29, 2020 at 06:01:21PM +0530, Vinay Simha B N wrote:
> > Hi All,
> >
> > Please Review the patch
> >
> > On Fri, Jul 10, 2020 at 7:11 PM Vinay Simha BN <simhavcs@gmail.com>
> wrote:
> >
> > > - license modified to (GPL-2.0-only OR BSD-2-Clause)
> > > - single-link and dual-link lvds description and
> > >   examples are added
> > > - proper indentation
> > > - VESA/JEIDA formats picked from panel-lvds dts
> > > - dsi data-lanes property removed, it will be picked
> > >   from dsi0 ports
> > > - dual-link lvds port added and implemented
> > > - converted from .txt to .yaml
> > >
> > > Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>
> > > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
>
> The binding is already reviewed by Rob and me - as you have recorded
> above. It will be applied when the driver is ready.
>
>         Sam
>
> > > ---
> > > v1:
> > >  Initial version wast .txt file
> > >
> > > v2:
> > >  From txt to yaml file format
> > >
> > > v3:
> > > * Andrzej Hajda review comments incorporated
> > >   dual port lvds implemented
> > >
> > > * Laurent Pinchart review comments incorporated
> > >   dsi lanes property removed and it is dynamically
> > >   picked from the dsi ports
> > >   VESA/JEIDA format picked from panel-lvds dts
> > >
> > > v4:
> > > * Sam Ravnborg review comments incorporated
> > >   }' is indented properly in examples data-lanes
> > >   description for single-link and dual-link lvds
> > >
> > > v5:
> > > * Sam Ravnborg review comments incorporated
> > >   license modified to (GPL-2.0-only OR BSD-2-Clause)
> > >   changelog added
> > >
> > > v6:
> > > * No changes, revision version mentioned to inline with
> > >   driver file
> > >
> > > v7:
> > > * change log added
> > >   Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > >
> > > v8:
> > > * Reviewed-by: Rob Herring <robh@kernel.org>
> > > * change log modified in reverse chronological order
> > > ---
> > >  .../bindings/display/bridge/toshiba,tc358775.yaml  | 215
> > > +++++++++++++++++++++
> > >  1 file changed, 215 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
> > >
> > > diff --git
> > >
> a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
> > >
> b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
> > > new file mode 100644
> > > index 0000000..31f085d
> > > --- /dev/null
> > > +++
> > >
> b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
> > > @@ -0,0 +1,215 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id:
> http://devicetree.org/schemas/display/bridge/toshiba,tc358775.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Toshiba TC358775 DSI to LVDS bridge bindings
> > > +
> > > +maintainers:
> > > + - Vinay Simha BN <simhavcs@gmail.com>
> > > +
> > > +description: |
> > > + This binding supports DSI to LVDS bridge TC358775
> > > +
> > > + MIPI DSI-RX Data 4-lane, CLK 1-lane with data rates up to 800
> Mbps/lane.
> > > + Video frame size:
> > > + Up to 1600x1200 24-bit/pixel resolution for single-link LVDS display
> > > panel
> > > + limited by 135 MHz LVDS speed
> > > + Up to WUXGA (1920x1200 24-bit pixels) resolution for dual-link LVDS
> > > display
> > > + panel, limited by 270 MHz LVDS speed.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: toshiba,tc358775
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +    description: i2c address of the bridge, 0x0f
> > > +
> > > +  vdd-supply:
> > > +    maxItems: 1
> > > +    description:  1.2V LVDS Power Supply
> > > +
> > > +  vddio-supply:
> > > +    maxItems: 1
> > > +    description: 1.8V IO Power Supply
> > > +
> > > +  stby-gpios:
> > > +    maxItems: 1
> > > +    description: Standby pin, Low active
> > > +
> > > +  reset-gpios:
> > > +    maxItems: 1
> > > +    description: Hardware reset, Low active
> > > +
> > > +  ports:
> > > +    type: object
> > > +    description:
> > > +      A node containing input and output port nodes with endpoint
> > > definitions
> > > +      as documented in
> > > +      Documentation/devicetree/bindings/media/video-interfaces.txt
> > > +    properties:
> > > +      "#address-cells":
> > > +        const: 1
> > > +
> > > +      "#size-cells":
> > > +        const: 0
> > > +
> > > +      port@0:
> > > +        type: object
> > > +        description: |
> > > +          DSI Input. The remote endpoint phandle should be a
> > > +          reference to a valid mipi_dsi_host device node.
> > > +
> > > +      port@1:
> > > +        type: object
> > > +        description: |
> > > +          Video port for LVDS output (panel or connector).
> > > +
> > > +      port@2:
> > > +        type: object
> > > +        description: |
> > > +          Video port for Dual link LVDS output (panel or connector).
> > > +
> > > +    required:
> > > +      - port@0
> > > +      - port@1
> > > +
> > > +required:
> > > + - compatible
> > > + - reg
> > > + - vdd-supply
> > > + - vddio-supply
> > > + - stby-gpios
> > > + - reset-gpios
> > > + - ports
> > > +
> > > +examples:
> > > + - |
> > > +    #include <dt-bindings/gpio/gpio.h>
> > > +
> > > +    /* For single-link LVDS display panel */
> > > +
> > > +    i2c@78b8000 {
> > > +        /* On High speed expansion */
> > > +        label = "HS-I2C2";
> > > +        reg = <0x078b8000 0x500>;
> > > +        clock-frequency = <400000>; /* fastmode operation */
> > > +        #address-cells = <1>;
> > > +        #size-cells = <0>;
> > > +
> > > +        tc_bridge: bridge@f {
> > > +            compatible = "toshiba,tc358775";
> > > +            reg = <0x0f>;
> > > +
> > > +            vdd-supply = <&pm8916_l2>;
> > > +            vddio-supply = <&pm8916_l6>;
> > > +
> > > +            stby-gpios = <&msmgpio 99 GPIO_ACTIVE_LOW>;
> > > +            reset-gpios = <&msmgpio 72 GPIO_ACTIVE_LOW>;
> > > +
> > > +            ports {
> > > +                #address-cells = <1>;
> > > +                #size-cells = <0>;
> > > +
> > > +                port@0 {
> > > +                    reg = <0>;
> > > +                    d2l_in_test: endpoint {
> > > +                        remote-endpoint = <&dsi0_out>;
> > > +                    };
> > > +                };
> > > +
> > > +                port@1 {
> > > +                    reg = <1>;
> > > +                    lvds_out: endpoint {
> > > +                        remote-endpoint = <&panel_in>;
> > > +                    };
> > > +                };
> > > +            };
> > > +        };
> > > +    };
> > > +
> > > +    dsi@1a98000 {
> > > +        reg = <0x1a98000 0x25c>;
> > > +        reg-names = "dsi_ctrl";
> > > +
> > > +        ports {
> > > +            #address-cells = <1>;
> > > +            #size-cells = <0>;
> > > +            port@1 {
> > > +                reg = <1>;
> > > +                dsi0_out: endpoint {
> > > +                    remote-endpoint = <&d2l_in_test>;
> > > +                    data-lanes = <0 1 2 3>;
> > > +                };
> > > +             };
> > > +         };
> > > +     };
> > > +
> > > + - |
> > > +    /* For dual-link LVDS display panel */
> > > +
> > > +    i2c@78b8000 {
> > > +        /* On High speed expansion */
> > > +        label = "HS-I2C2";
> > > +        reg = <0x078b8000 0x500>;
> > > +        clock-frequency = <400000>; /* fastmode operation */
> > > +        #address-cells = <1>;
> > > +        #size-cells = <0>;
> > > +
> > > +        tc_bridge_dual: bridge@f {
> > > +            compatible = "toshiba,tc358775";
> > > +            reg = <0x0f>;
> > > +
> > > +            vdd-supply = <&pm8916_l2>;
> > > +            vddio-supply = <&pm8916_l6>;
> > > +
> > > +            stby-gpios = <&msmgpio 99 GPIO_ACTIVE_LOW>;
> > > +            reset-gpios = <&msmgpio 72 GPIO_ACTIVE_LOW>;
> > > +
> > > +            ports {
> > > +                #address-cells = <1>;
> > > +                #size-cells = <0>;
> > > +
> > > +                port@0 {
> > > +                    reg = <0>;
> > > +                    d2l_in_dual: endpoint {
> > > +                        remote-endpoint = <&dsi0_out_dual>;
> > > +                    };
> > > +                };
> > > +
> > > +                port@1 {
> > > +                    reg = <1>;
> > > +                    lvds0_out: endpoint {
> > > +                        remote-endpoint = <&panel_in0>;
> > > +                    };
> > > +                };
> > > +
> > > +                port@2 {
> > > +                    reg = <2>;
> > > +                    lvds1_out: endpoint {
> > > +                        remote-endpoint = <&panel_in1>;
> > > +                    };
> > > +                };
> > > +            };
> > > +        };
> > > +    };
> > > +
> > > +    dsi@1a98000 {
> > > +        reg = <0x1a98000 0x25c>;
> > > +        reg-names = "dsi_ctrl";
> > > +
> > > +        ports {
> > > +            #address-cells = <1>;
> > > +            #size-cells = <0>;
> > > +            port@1 {
> > > +                reg = <1>;
> > > +                dsi0_out_dual: endpoint {
> > > +                    remote-endpoint = <&d2l_in_dual>;
> > > +                    data-lanes = <0 1 2 3>;
> > > +                };
> > > +             };
> > > +         };
> > > +     };
> > > +...
> > > --
> > > 2.1.2
> > >
> > >
> >
> > --
> > regards,
> > vinaysimha
>
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
>

-- 
regards,
vinaysimha

--000000000000c91a6105aca4cffa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Sam,</div><div><br></div><div>Thanks.<br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon=
, Aug 10, 2020 at 11:08 PM Sam Ravnborg &lt;<a href=3D"mailto:sam@ravnborg.=
org">sam@ravnborg.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Hi Vinay.<br>
<br>
On Wed, Jul 29, 2020 at 06:01:21PM +0530, Vinay Simha B N wrote:<br>
&gt; Hi All,<br>
&gt; <br>
&gt; Please Review the patch<br>
&gt; <br>
&gt; On Fri, Jul 10, 2020 at 7:11 PM Vinay Simha BN &lt;<a href=3D"mailto:s=
imhavcs@gmail.com" target=3D"_blank">simhavcs@gmail.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; - license modified to (GPL-2.0-only OR BSD-2-Clause)<br>
&gt; &gt; - single-link and dual-link lvds description and<br>
&gt; &gt;=C2=A0 =C2=A0examples are added<br>
&gt; &gt; - proper indentation<br>
&gt; &gt; - VESA/JEIDA formats picked from panel-lvds dts<br>
&gt; &gt; - dsi data-lanes property removed, it will be picked<br>
&gt; &gt;=C2=A0 =C2=A0from dsi0 ports<br>
&gt; &gt; - dual-link lvds port added and implemented<br>
&gt; &gt; - converted from .txt to .yaml<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Vinay Simha BN &lt;<a href=3D"mailto:simhavcs@gmai=
l.com" target=3D"_blank">simhavcs@gmail.com</a>&gt;<br>
&gt; &gt; Reviewed-by: Sam Ravnborg &lt;<a href=3D"mailto:sam@ravnborg.org"=
 target=3D"_blank">sam@ravnborg.org</a>&gt;<br>
&gt; &gt; Reviewed-by: Rob Herring &lt;<a href=3D"mailto:robh@kernel.org" t=
arget=3D"_blank">robh@kernel.org</a>&gt;<br>
<br>
The binding is already reviewed by Rob and me - as you have recorded<br>
above. It will be applied when the driver is ready.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Sam<br>
<br>
&gt; &gt; ---<br>
&gt; &gt; v1:<br>
&gt; &gt;=C2=A0 Initial version wast .txt file<br>
&gt; &gt;<br>
&gt; &gt; v2:<br>
&gt; &gt;=C2=A0 From txt to yaml file format<br>
&gt; &gt;<br>
&gt; &gt; v3:<br>
&gt; &gt; * Andrzej Hajda review comments incorporated<br>
&gt; &gt;=C2=A0 =C2=A0dual port lvds implemented<br>
&gt; &gt;<br>
&gt; &gt; * Laurent Pinchart review comments incorporated<br>
&gt; &gt;=C2=A0 =C2=A0dsi lanes property removed and it is dynamically<br>
&gt; &gt;=C2=A0 =C2=A0picked from the dsi ports<br>
&gt; &gt;=C2=A0 =C2=A0VESA/JEIDA format picked from panel-lvds dts<br>
&gt; &gt;<br>
&gt; &gt; v4:<br>
&gt; &gt; * Sam Ravnborg review comments incorporated<br>
&gt; &gt;=C2=A0 =C2=A0}&#39; is indented properly in examples data-lanes<br=
>
&gt; &gt;=C2=A0 =C2=A0description for single-link and dual-link lvds<br>
&gt; &gt;<br>
&gt; &gt; v5:<br>
&gt; &gt; * Sam Ravnborg review comments incorporated<br>
&gt; &gt;=C2=A0 =C2=A0license modified to (GPL-2.0-only OR BSD-2-Clause)<br=
>
&gt; &gt;=C2=A0 =C2=A0changelog added<br>
&gt; &gt;<br>
&gt; &gt; v6:<br>
&gt; &gt; * No changes, revision version mentioned to inline with<br>
&gt; &gt;=C2=A0 =C2=A0driver file<br>
&gt; &gt;<br>
&gt; &gt; v7:<br>
&gt; &gt; * change log added<br>
&gt; &gt;=C2=A0 =C2=A0Reviewed-by: Sam Ravnborg &lt;<a href=3D"mailto:sam@r=
avnborg.org" target=3D"_blank">sam@ravnborg.org</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; v8:<br>
&gt; &gt; * Reviewed-by: Rob Herring &lt;<a href=3D"mailto:robh@kernel.org"=
 target=3D"_blank">robh@kernel.org</a>&gt;<br>
&gt; &gt; * change log modified in reverse chronological order<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 .../bindings/display/bridge/toshiba,tc358775.yaml=C2=A0 | 2=
15<br>
&gt; &gt; +++++++++++++++++++++<br>
&gt; &gt;=C2=A0 1 file changed, 215 insertions(+)<br>
&gt; &gt;=C2=A0 create mode 100644<br>
&gt; &gt; Documentation/devicetree/bindings/display/bridge/toshiba,tc358775=
.yaml<br>
&gt; &gt;<br>
&gt; &gt; diff --git<br>
&gt; &gt; a/Documentation/devicetree/bindings/display/bridge/toshiba,tc3587=
75.yaml<br>
&gt; &gt; b/Documentation/devicetree/bindings/display/bridge/toshiba,tc3587=
75.yaml<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..31f085d<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++<br>
&gt; &gt; b/Documentation/devicetree/bindings/display/bridge/toshiba,tc3587=
75.yaml<br>
&gt; &gt; @@ -0,0 +1,215 @@<br>
&gt; &gt; +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)<br>
&gt; &gt; +%YAML 1.2<br>
&gt; &gt; +---<br>
&gt; &gt; +$id: <a href=3D"http://devicetree.org/schemas/display/bridge/tos=
hiba,tc358775.yaml#" rel=3D"noreferrer" target=3D"_blank">http://devicetree=
.org/schemas/display/bridge/toshiba,tc358775.yaml#</a><br>
&gt; &gt; +$schema: <a href=3D"http://devicetree.org/meta-schemas/core.yaml=
#" rel=3D"noreferrer" target=3D"_blank">http://devicetree.org/meta-schemas/=
core.yaml#</a><br>
&gt; &gt; +<br>
&gt; &gt; +title: Toshiba TC358775 DSI to LVDS bridge bindings<br>
&gt; &gt; +<br>
&gt; &gt; +maintainers:<br>
&gt; &gt; + - Vinay Simha BN &lt;<a href=3D"mailto:simhavcs@gmail.com" targ=
et=3D"_blank">simhavcs@gmail.com</a>&gt;<br>
&gt; &gt; +<br>
&gt; &gt; +description: |<br>
&gt; &gt; + This binding supports DSI to LVDS bridge TC358775<br>
&gt; &gt; +<br>
&gt; &gt; + MIPI DSI-RX Data 4-lane, CLK 1-lane with data rates up to 800 M=
bps/lane.<br>
&gt; &gt; + Video frame size:<br>
&gt; &gt; + Up to 1600x1200 24-bit/pixel resolution for single-link LVDS di=
splay<br>
&gt; &gt; panel<br>
&gt; &gt; + limited by 135 MHz LVDS speed<br>
&gt; &gt; + Up to WUXGA (1920x1200 24-bit pixels) resolution for dual-link =
LVDS<br>
&gt; &gt; display<br>
&gt; &gt; + panel, limited by 270 MHz LVDS speed.<br>
&gt; &gt; +<br>
&gt; &gt; +properties:<br>
&gt; &gt; +=C2=A0 compatible:<br>
&gt; &gt; +=C2=A0 =C2=A0 const: toshiba,tc358775<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 reg:<br>
&gt; &gt; +=C2=A0 =C2=A0 maxItems: 1<br>
&gt; &gt; +=C2=A0 =C2=A0 description: i2c address of the bridge, 0x0f<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 vdd-supply:<br>
&gt; &gt; +=C2=A0 =C2=A0 maxItems: 1<br>
&gt; &gt; +=C2=A0 =C2=A0 description:=C2=A0 1.2V LVDS Power Supply<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 vddio-supply:<br>
&gt; &gt; +=C2=A0 =C2=A0 maxItems: 1<br>
&gt; &gt; +=C2=A0 =C2=A0 description: 1.8V IO Power Supply<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 stby-gpios:<br>
&gt; &gt; +=C2=A0 =C2=A0 maxItems: 1<br>
&gt; &gt; +=C2=A0 =C2=A0 description: Standby pin, Low active<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 reset-gpios:<br>
&gt; &gt; +=C2=A0 =C2=A0 maxItems: 1<br>
&gt; &gt; +=C2=A0 =C2=A0 description: Hardware reset, Low active<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 ports:<br>
&gt; &gt; +=C2=A0 =C2=A0 type: object<br>
&gt; &gt; +=C2=A0 =C2=A0 description:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 A node containing input and output port nod=
es with endpoint<br>
&gt; &gt; definitions<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 as documented in<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 Documentation/devicetree/bindings/media/vid=
eo-interfaces.txt<br>
&gt; &gt; +=C2=A0 =C2=A0 properties:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 &quot;#address-cells&quot;:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 const: 1<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 &quot;#size-cells&quot;:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 const: 0<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 port@0:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 type: object<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: |<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DSI Input. The remote endpoin=
t phandle should be a<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reference to a valid mipi_dsi=
_host device node.<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 port@1:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 type: object<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: |<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Video port for LVDS output (p=
anel or connector).<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 port@2:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 type: object<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: |<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Video port for Dual link LVDS=
 output (panel or connector).<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 required:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 - port@0<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 - port@1<br>
&gt; &gt; +<br>
&gt; &gt; +required:<br>
&gt; &gt; + - compatible<br>
&gt; &gt; + - reg<br>
&gt; &gt; + - vdd-supply<br>
&gt; &gt; + - vddio-supply<br>
&gt; &gt; + - stby-gpios<br>
&gt; &gt; + - reset-gpios<br>
&gt; &gt; + - ports<br>
&gt; &gt; +<br>
&gt; &gt; +examples:<br>
&gt; &gt; + - |<br>
&gt; &gt; +=C2=A0 =C2=A0 #include &lt;dt-bindings/gpio/gpio.h&gt;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 /* For single-link LVDS display panel */<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 i2c@78b8000 {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* On High speed expansion */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 label =3D &quot;HS-I2C2&quot;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x078b8000 0x500&gt;;<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 clock-frequency =3D &lt;400000&gt;; =
/* fastmode operation */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #address-cells =3D &lt;1&gt;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #size-cells =3D &lt;0&gt;;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tc_bridge: bridge@f {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;t=
oshiba,tc358775&quot;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x0f&gt;;<=
br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vdd-supply =3D &lt;&am=
p;pm8916_l2&gt;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vddio-supply =3D &lt;&=
amp;pm8916_l6&gt;;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stby-gpios =3D &lt;&am=
p;msmgpio 99 GPIO_ACTIVE_LOW&gt;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reset-gpios =3D &lt;&a=
mp;msmgpio 72 GPIO_ACTIVE_LOW&gt;;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ports {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #address=
-cells =3D &lt;1&gt;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #size-ce=
lls =3D &lt;0&gt;;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 port@0 {=
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 reg =3D &lt;0&gt;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 d2l_in_test: endpoint {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 remote-endpoint =3D &lt;&amp;dsi0_out&gt;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 };<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 port@1 {=
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 reg =3D &lt;1&gt;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 lvds_out: endpoint {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 remote-endpoint =3D &lt;&amp;panel_in&gt;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 };<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; &gt; +=C2=A0 =C2=A0 };<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 dsi@1a98000 {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x1a98000 0x25c&gt;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg-names =3D &quot;dsi_ctrl&quot;;<=
br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ports {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #address-cells =3D &lt=
;1&gt;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #size-cells =3D &lt;0&=
gt;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 port@1 {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D =
&lt;1&gt;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dsi0_out=
: endpoint {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 remote-endpoint =3D &lt;&amp;d2l_in_test&gt;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 data-lanes =3D &lt;0 1 2 3&gt;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; &gt; +<br>
&gt; &gt; + - |<br>
&gt; &gt; +=C2=A0 =C2=A0 /* For dual-link LVDS display panel */<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 i2c@78b8000 {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* On High speed expansion */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 label =3D &quot;HS-I2C2&quot;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x078b8000 0x500&gt;;<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 clock-frequency =3D &lt;400000&gt;; =
/* fastmode operation */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #address-cells =3D &lt;1&gt;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #size-cells =3D &lt;0&gt;;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tc_bridge_dual: bridge@f {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;t=
oshiba,tc358775&quot;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x0f&gt;;<=
br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vdd-supply =3D &lt;&am=
p;pm8916_l2&gt;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vddio-supply =3D &lt;&=
amp;pm8916_l6&gt;;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stby-gpios =3D &lt;&am=
p;msmgpio 99 GPIO_ACTIVE_LOW&gt;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reset-gpios =3D &lt;&a=
mp;msmgpio 72 GPIO_ACTIVE_LOW&gt;;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ports {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #address=
-cells =3D &lt;1&gt;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #size-ce=
lls =3D &lt;0&gt;;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 port@0 {=
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 reg =3D &lt;0&gt;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 d2l_in_dual: endpoint {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 remote-endpoint =3D &lt;&amp;dsi0_out_dual&gt;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 };<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 port@1 {=
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 reg =3D &lt;1&gt;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 lvds0_out: endpoint {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 remote-endpoint =3D &lt;&amp;panel_in0&gt;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 };<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 port@2 {=
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 reg =3D &lt;2&gt;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 lvds1_out: endpoint {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 remote-endpoint =3D &lt;&amp;panel_in1&gt;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 };<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; &gt; +=C2=A0 =C2=A0 };<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 dsi@1a98000 {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x1a98000 0x25c&gt;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg-names =3D &quot;dsi_ctrl&quot;;<=
br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ports {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #address-cells =3D &lt=
;1&gt;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #size-cells =3D &lt;0&=
gt;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 port@1 {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D =
&lt;1&gt;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dsi0_out=
_dual: endpoint {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 remote-endpoint =3D &lt;&amp;d2l_in_dual&gt;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 data-lanes =3D &lt;0 1 2 3&gt;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; &gt; +...<br>
&gt; &gt; --<br>
&gt; &gt; 2.1.2<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; <br>
&gt; -- <br>
&gt; regards,<br>
&gt; vinaysimha<br>
<br>
&gt; _______________________________________________<br>
&gt; dri-devel mailing list<br>
&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">d=
ri-devel@lists.freedesktop.org</a><br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" r=
el=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/l=
istinfo/dri-devel</a><br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">regards,<br>vinaysimha</div>

--000000000000c91a6105aca4cffa--

--===============1037509962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1037509962==--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 360F367D445
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 19:36:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EA8110E976;
	Thu, 26 Jan 2023 18:36:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com
 [IPv6:2607:f8b0:4864:20::a2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392C810E976
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 18:36:16 +0000 (UTC)
Received: by mail-vk1-xa2e.google.com with SMTP id az23so1310655vkb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 10:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=criticallink.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1XT3bc4PGIFCgEcY5fMpCCUWUD0V3NbUr+u3sBwu7/Y=;
 b=pYj/Gs7wGI16Sm9puIczETjAw2R4KbpBUFcPaCJRf8DKE/oVHr7CLQV3wM1RdX3Und
 e4uPP80nlNU7zmXbBZGyL5Q7xUvrlJPmE+x2p/+RHex6xarjD7lM3n2hkZP4+lpdSTOe
 zovSnw5hQDf36xQTDFXLNQlxMC62TO2H7rAVcugBsleJBvGc2mVts1XyNgV/hmDi04Lh
 78NleLv0BLppAAqCKI8dgAEhr6MjnXOLYV/lVNagBR8CalRMaoa+wGs/DCfX0JozcXJq
 NN64wIq2qGdd8fAFLW+V1Wr12BJRA5k+bTLyhrFElgidZTxNDV8pHoRIsJu8TyYu+85R
 XBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1XT3bc4PGIFCgEcY5fMpCCUWUD0V3NbUr+u3sBwu7/Y=;
 b=dagHvT7ORWJGK3JVNikg0vb5v4BGPefx52UoD7TEFo5XD8kxoM/fk8wzbKxZDMj/3W
 VwFGqdvuUhvuvhAaHc3yOI7umqA0TFJZ5/aHwUSy3jTS/ywW9taG/DGWMrtRdRoAx5Ia
 uIMWqCW6VRNtnFkyEHhNDxmAlsgewwqvS4f2D5rw+aUK15L1pJ4yn+voSazpHPnmfNJ+
 WX4RIrYlGS84HPruxYMlnFvKdVTgWe6bLlEkIvZi/de22zKze8FNc7mh78Lu/Pku6xdP
 tt2VBPYrevVny8DEvtPxtG5/IsgomDbWTkQ+PMw9jmPoHeJBLPhuEI4mcKt+lRwm+xvv
 z6gw==
X-Gm-Message-State: AFqh2kr/gn5f0hzcmYbBLcKlhlOEhvETJXtGvkEVb8Fck7IQ+nuxoS1y
 rAX+Upm+PWrWXzrQC5IfENf89LLXtXLjjnJJ9C+/Mg==
X-Google-Smtp-Source: AMrXdXvhntf3sSiX/+71GcUXiJnsUcFK+oRD7XEv6c4lBP0B3D7BK6l/eTAmvOz5UqFRV1/QKfuTb4XqFcXqjouOqhQ=
X-Received: by 2002:a1f:1b8f:0:b0:3d8:d753:56bb with SMTP id
 b137-20020a1f1b8f000000b003d8d75356bbmr4761631vkb.39.1674758173967; Thu, 26
 Jan 2023 10:36:13 -0800 (PST)
MIME-Version: 1.0
References: <20230125-tfp410_i2c-v1-0-66a4d4e390b7@criticallink.com>
 <20230125-tfp410_i2c-v1-1-66a4d4e390b7@criticallink.com>
 <906b693d-1e85-8c17-cdda-f09ea8f12e7f@linaro.org>
In-Reply-To: <906b693d-1e85-8c17-cdda-f09ea8f12e7f@linaro.org>
From: Jon Cormier <jcormier@criticallink.com>
Date: Thu, 26 Jan 2023 13:36:02 -0500
Message-ID: <CADL8D3YUNnsZt8tc8x9CxH5Ug6kWJHb=a3N5VJFPSePWH3yWxg@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: display: bridge: tfp410: Add tfp410 i2c
 example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000000b669705f32f06c4"
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 dri-devel@lists.freedesktop.org, Jyri Sarha <jsarha@ti.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Bob Duke <bduke@criticallink.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Michael Williamson <michael.williamson@criticallink.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000000b669705f32f06c4
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 26, 2023 at 10:40 AM Krzysztof Kozlowski <
krzysztof.kozlowski@linaro.org> wrote:

> On 25/01/2023 22:09, Jonathan Cormier wrote:
> > Add a i2c example with HDMI connector
>
> Why? It's the same - but more on this below.
>
The existing example is for the previous setup where it was configured as
its own device.  It seemed necessary now that the driver is going to
support being connected to an i2c bus to show it being used as such.

>
> >
> > Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
>
> You need to test the bindings before sending and fix the errors.
>
Will do

>
> > ---
> >  .../bindings/display/bridge/ti,tfp410.yaml         | 42
> ++++++++++++++++++++++
> >  1 file changed, 42 insertions(+)
> >
> > diff --git
> a/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
> b/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
> > index 4c5dd8ec2951..456214f14b47 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
> > @@ -116,4 +116,46 @@ examples:
> >          };
> >      };
> >
> > +  - |
> > +    i2c {
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +
> > +      hdmi_encoder: tfp410@38 {
>
> Node names should be generic.
>
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
>
> Can do

> > +        compatible = "ti,tfp410";
> > +        reg = <0x38>;
> > +
> > +        ports {
> > +          address-cells = <1>;
> > +          size-cells = <0>;
> > +
> > +          port@0 {
> > +            reg = <0>;
> > +            tfp410_in: endpoint {
> > +              remote-endpoint = <&dpi1_out>;
> > +            };
> > +          };
> > +
> > +          port@1 {
> > +            reg = <1>;
> > +            tfp410_out: endpoint {
> > +              remote-endpoint = <&hdmi_connector_in>;
> > +            };
>
> That's the same example as existing one, so it looks useless. I don't
> see benefits of this example.
>
It's mostly the same, except defined inside an i2c bus, with the reg value
set. Without the powerdown-gpios or ti,deskew.
And without the pclk-sample and bus-width (these are now read from i2c)
And I included the hdmi_connector so it would be a more complete and useful
example of how it could be used.  The TFP410 doesn't handle the ddc i2c bus
on its own so a separate connector node is needed.  I'll drop it if that's
preferred.

>
> > +          };
> > +        };
> > +      };
> > +    };
> > +
> > +    hdmi: hdmi_connector {
>
> Drop. Incorrect name and not really related.
>
> > +      compatible = "hdmi-connector";
> > +      label = "hdmi";
> > +      type = "a";
> > +      ddc-i2c-bus = <&i2c1>;
> > +      port {
> > +        hdmi_connector_in: endpoint {
> > +          remote-endpoint = <&tfp410_out>;
> > +        };
> > +      };
> > +    };
> > +
> >  ...
> >
>
> Best regards,
> Krzysztof
>
>

-- 
Jonathan Cormier
Software Engineer

Voice:  315.425.4045 x222



http://www.CriticalLink.com <http://www.criticallink.com/>
6712 Brooklawn Parkway, Syracuse, NY 13211

<https://www.linkedin.com/company/critical-link-llc>
<https://twitter.com/Critical_Link>

--0000000000000b669705f32f06c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 26, 2023 at 10:40 AM Krzy=
sztof Kozlowski &lt;<a href=3D"mailto:krzysztof.kozlowski@linaro.org">krzys=
ztof.kozlowski@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On 25/01/2023 22:09, Jonathan Cormier wrote:<br>
&gt; Add a i2c example with HDMI connector<br>
<br>
Why? It&#39;s the same - but more on this below.<br></blockquote><div>The e=
xisting example is for the previous setup where it was configured as its ow=
n device.=C2=A0 It seemed necessary now that the driver is going to support=
 being connected to an i2c bus to show it being used as such. <br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt; Signed-off-by: Jonathan Cormier &lt;<a href=3D"mailto:jcormier@critica=
llink.com" target=3D"_blank">jcormier@criticallink.com</a>&gt;<br>
<br>
You need to test the bindings before sending and fix the errors.<br></block=
quote><div>Will do <br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
&gt; ---<br>
&gt;=C2=A0 .../bindings/display/bridge/ti,tfp410.yaml=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 42 ++++++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 42 insertions(+)<br>
&gt; <br>
&gt; diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tfp41=
0.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml<br=
>
&gt; index 4c5dd8ec2951..456214f14b47 100644<br>
&gt; --- a/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml<=
br>
&gt; +++ b/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml<=
br>
&gt; @@ -116,4 +116,46 @@ examples:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt;=C2=A0 =C2=A0 =C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 - |<br>
&gt; +=C2=A0 =C2=A0 i2c {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 #address-cells =3D &lt;1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 #size-cells =3D &lt;0&gt;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 hdmi_encoder: tfp410@38 {<br>
<br>
Node names should be generic.<br>
<a href=3D"https://devicetree-specification.readthedocs.io/en/latest/chapte=
r2-devicetree-basics.html#generic-names-recommendation" rel=3D"noreferrer" =
target=3D"_blank">https://devicetree-specification.readthedocs.io/en/latest=
/chapter2-devicetree-basics.html#generic-names-recommendation</a><br><br></=
blockquote><div>Can do <br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;ti,tfp410&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x38&gt;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ports {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 address-cells =3D &lt;1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size-cells =3D &lt;0&gt;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 port@0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tfp410_in: endpoint {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remote-endpoint =3D =
&lt;&amp;dpi1_out&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 port@1 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tfp410_out: endpoint {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remote-endpoint =3D =
&lt;&amp;hdmi_connector_in&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
<br>
That&#39;s the same example as existing one, so it looks useless. I don&#39=
;t<br>
see benefits of this example.<br></blockquote><div>It&#39;s mostly the same=
, except defined inside an i2c bus, with the reg value set. Without the pow=
erdown-gpios or ti,deskew.=C2=A0 <br></div><div>And without the pclk-sample=
 and bus-width (these are now read from i2c) <br></div><div>And I included =
the hdmi_connector so it would be a more complete and useful example of how=
 it could be used.=C2=A0 The TFP410 doesn&#39;t handle the ddc i2c bus on i=
ts own so a separate connector node is needed.=C2=A0 I&#39;ll drop it if th=
at&#39;s preferred.<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 };<br>
&gt; +=C2=A0 =C2=A0 };<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 hdmi: hdmi_connector {<br>
<br>
Drop. Incorrect name and not really related.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;hdmi-connector&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 label =3D &quot;hdmi&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 type =3D &quot;a&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 ddc-i2c-bus =3D &lt;&amp;i2c1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 port {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 hdmi_connector_in: endpoint {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remote-endpoint =3D &lt;&amp;tfp41=
0_out&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 };<br>
&gt; +=C2=A0 =C2=A0 };<br>
&gt; +<br>
&gt;=C2=A0 ...<br>
&gt; <br>
<br>
Best regards,<br>
Krzysztof<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr=
"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div>Jonathan Cormier<br>Soft=
ware Engineer<div><div><div><div><br></div><div><div><font color=3D"#000000=
">Voice:=C2=A0=C2=A0<a value=3D"+13154254045">315.425.4045</a>=C2=A0x222</f=
ont></div><div><font color=3D"#000000"><br></font></div><div><font color=3D=
"#000000"><img src=3D"https://ci3.googleusercontent.com/mail-sig/AIorK4xml7=
5fJPKYF7M9X5Dux4IrbtzZk0RB6jf8iBYuPQKArrkBkOkU4HJ2rP7eH6d2h7_ituMWEBc"><br>=
</font></div></div></div><div><div><font color=3D"#1155cc"><br></font></div=
><div><a href=3D"http://www.criticallink.com/" target=3D"_blank"><font colo=
r=3D"#1155cc">http://www.CriticalLink.com</font></a><br></div><div>6712 Bro=
oklawn Parkway,=C2=A0Syracuse, NY 13211=C2=A0</div></div></div><div><div><b=
r></div><div><font color=3D"#1155cc"><font color=3D"#1155cc"><a href=3D"htt=
ps://www.linkedin.com/company/critical-link-llc" target=3D"_blank"><img src=
=3D"https://docs.google.com/uc?export=3Ddownload&amp;id=3D0B2vNSnu-aYu6OEhH=
RW9BUFV5WnM&amp;revid=3D0B2vNSnu-aYu6RHNZUnhNbFpER1l3emNQY2VoaHA0RDdudWlFPQ=
"></a>=C2=A0=C2=A0<a href=3D"https://twitter.com/Critical_Link" target=3D"_=
blank"><img alt=3D"" src=3D"https://docs.google.com/uc?export=3Ddownload&am=
p;id=3D0B2vNSnu-aYu6cU1yWERrLXE0SnM&amp;revid=3D0B2vNSnu-aYu6b1YrZW1SM0hueV=
hVS0pPWm1IOXFSc0I3ay9jPQ"></a></font></font></div></div></div></div></div><=
/div></div></div></div></div></div></div></div></div></div>

--0000000000000b669705f32f06c4--

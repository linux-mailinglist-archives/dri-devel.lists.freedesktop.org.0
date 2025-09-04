Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D69B4781D
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:49:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB0D10E416;
	Sat,  6 Sep 2025 22:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jplx/M1F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4552110E236
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 07:55:14 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id
 e9e14a558f8ab-3f664c47ad3so8558185ab.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 00:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756972513; x=1757577313; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3vdbWoftH+CGgDq6U37FUs3JSoyytAyG96h29e6GODA=;
 b=jplx/M1F6ut2uPesMtoWScvZo1TpyxGYKUsRinyS1Dbx9C3jjSITIoCjbZNjcHE6LH
 GKje7HIotdXa20wbmZn/dRIl74qEg6ZNWWkY3b9aCDs1LFKdr66Ykk3/hDWYznueoklO
 k52j5joLP8sbtwBDPKD6CD7ULUZnT3AEYbupd4zQ0YkKpRpawzi2jmsBXdI7CVdYeZ7T
 dy4tQqHOJIzel1h9Th6C4lWrDN5rDPlbC9SBLKsElzz76sniBAQkpylzBcv3Sx8fIFUX
 XQxHuX0bf/iZnNlfMDb5QI/0aYWWj8IxFPxUXyx07Y1agsSap/p9uwF2F5LMbarI3vFx
 LJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756972513; x=1757577313;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3vdbWoftH+CGgDq6U37FUs3JSoyytAyG96h29e6GODA=;
 b=a07huAII1D5xH+i4MSAvdJXFOjNz/XJ96JOj7/wy8/l3QNsW9r7UJ9e6x7SaYvWFba
 +Vc0OS4gDAh5H3DC27GeZwNN6a/zaH1MdF9Jnd0lz5l40gQFGmfO2VEl5D8l2G0kS2ch
 GU7Li02yr85OurQ2DUAqPOTw2ym/ogqB/AwvfQymSB0dRlsld+dae4UepHp79ohDvawh
 GepqSkwI2wjfg9OWLguH4Lxy1pX1J9hnBA2dGnLOjJczVkOPOiH4kr1Lx22LI/s6ZnuX
 rCyEx21LX2+t8UE3KfEhMUwOb62gxitXvj8ypEFIqy0crYyQ2ij2flGBBcf24EMNCuTi
 QBzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuXV9n71CH1A6ky7dNodzcrBxudHcrjBixRFJ6a1nJ4HC50upFNMOhbPdAl6OFiX8vrhXOt4I1CqM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZ/RW0DHvt4fEqUYdnZ8s4dnGlbbb6q9lFSRG7T/fApSDL3Vo8
 npRbJQb3pm8csb3gEvbTJ3mOWa4bkXIHMJgxu3l6GP6dSXoLMKk3z1eX08Qafp9pS1OL2qn8j91
 viSxJzRrnTWF3aRa7DJbvMGnlWIITLoE=
X-Gm-Gg: ASbGnctce0XxZVVW66LePOCWtJVQKGc9zSY+hsJapGQZoLgCgj1WD1OAPapiaGVJNZQ
 HL6JwmpQKIyxitalp/ugeS0cVGsrKjA1zGjpgR7cy6zHxc3bLKvF4gqSQGjLUQwRuiRB7DPJ4ks
 KHY8cGMz70NsXqOkq58erDg+JPMiCOf/N2TNw+kxIKOFrAC7hNSp6KwJL2sOdSuVWB+ZztJ29EK
 cO82Lfg9fsYoFnMUaCLozJRzrxU
X-Google-Smtp-Source: AGHT+IFl4uYRjBhJV3y8+Ww2zyb+nbbFA1SXF3lRhcxEnL2VdU3KpKQl2JGjIiX2+h2h8dYF37v55nm9Qu+d69tjzR8=
X-Received: by 2002:a05:6e02:216b:b0:3f1:7907:5fb9 with SMTP id
 e9e14a558f8ab-3f3ffda5d39mr341825775ab.6.1756972513201; Thu, 04 Sep 2025
 00:55:13 -0700 (PDT)
MIME-Version: 1.0
References: <175691717884.2393851.6340903042726389490.robh@kernel.org>
 <20250904022524.1748587-1-syyang@lontium.com>
 <042523f7-2b75-4a04-8e0b-d1019ab84987@kernel.org>
In-Reply-To: <042523f7-2b75-4a04-8e0b-d1019ab84987@kernel.org>
From: =?UTF-8?B?5p2o5a2Z6L+Q?= <yangsunyun1993@gmail.com>
Date: Thu, 4 Sep 2025 15:55:00 +0800
X-Gm-Features: Ac12FXxXPto95gA4erjfrZwsn37-wFaL1gW6iISqyXUTi1pam6hz_TpQh1_YIGQ
Message-ID: <CAFQXuNYnmSbRKoWS-EbPjx444=sznXyo2UnF9td+tza7GTd2fA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] This patch adds a new device tree binding
 documentation.
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: syyang <syyang@lontium.com>, robh@kernel.org,
 Laurent.pinchart@ideasonboard.com, 
 andrzej.hajda@intel.com, conor+dt@kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com, jonas@kwiboo.se, 
 krzk+dt@kernel.org, linux-kernel@vger.kernel.org, neil.armstrong@linaro.org, 
 rfoss@kernel.org
Content-Type: multipart/alternative; boundary="00000000000087955e063df50a2b"
X-Mailman-Approved-At: Sat, 06 Sep 2025 22:49:11 +0000
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

--00000000000087955e063df50a2b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2025=E5=B9=B49=E6=9C=884=E6=
=97=A5=E5=91=A8=E5=9B=9B 13:49=E5=86=99=E9=81=93=EF=BC=9A
>
> On 04/09/2025 04:25, syyang wrote:
> > Fix device tree binding validation errors reported by Rob Herring.
> >
> > v2:
>
> That's not the place where you put changelog.
>
I'm currently learning what to do. Thank you.

> > - Fixed $id field to match actual filename (lontium,lt9611c.yaml)
> > - build pass
> >
> > Thanks to Rob Herring for the review and feedback.
>
> Please carefully read submitting patches.
>
> Do not attach (thread) your patchsets to some other threads (unrelated
> or older versions). This buries them deep in the mailbox and might
> interfere with applying entire sets. See also:
>
https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/sub=
mitting-patches.rst#L830
>
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
>
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patch=
es.html#i-for-patch-submitters
>
I'm currently learning what to do. Thank you.

> >
> > Signed-off-by: syyang <syyang@lontium.com>
> > ---
> >  .../display/bridge/lontium,lt9611c.yaml       | 121 ++++++++++++++++++
> >  1 file changed, 121 insertions(+)
> >  create mode 100644
Documentation/devicetree/bindings/display/bridge/lontium,lt9611c.yaml
> >
> > diff --git
a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611c.yaml
b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611c.yaml
> > new file mode 100644
> > index 000000000000..712644da4f1d
> > --- /dev/null
> > +++
b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611c.yaml
> > @@ -0,0 +1,121 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/bridge/lontium,lt9611c.yaml=
#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Lontium LT9611C 2 Port MIPI to HDMI Bridge
> > +
> > +maintainers:
> > +  - Rob Herring <robh@kernel.org>
>
> No, how so?
>
I will change it to the email address I use when working at the company. =
=EF=BC=88
syyang@lontium.com=EF=BC=89

> > +
> > +description: |
>
> Do not need '|' unless you need to preserve formatting.
>
Both lontium,lt9211.yaml and lontium,lt9611.yaml use "|", so please confirm
if they need to be removed.

> > +  The LT9611C are bridge devices which convert DSI to HDMI
>
> Why this cannot be added to lt9611 binding? Commit msg should clearly
> answer that.
>
The lt9611 and lt9611c are chips of different specifications, and their
related parameters are different.
The VDD-supply of lt9611c is 1.2V; the vdd-supply of lt9611uxc is also
1.2V, while the vdd-supply of lt9611 is 1.8V.
Now lt9611 and lt9611uxc are connected together. I'm not sure if this is a
problem.
If this lt9611c can also be bound to lt9611, and if you think it's okay,
then I have no problem.

> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - lontium,lt9611c
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#sound-dai-cells":
>
> Missing dai-common ref.
>
I don't understand .   I referred to:
Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml

> > +    const: 0
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +    description: GPIO connected to active high RESET pin.
> > +
> > +  vdd-supply:
> > +    description: Regulator for 1.2V MIPI phy power.
> > +
> > +  vcc-supply:
> > +    description: Regulator for 3.3V IO power.
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description:
> > +          Primary MIPI port-1 for MIPI input
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description:
> > +          Additional MIPI port-2 for MIPI input, used in combination
> > +          with primary MIPI port-1 to drive higher resolution displays
> > +
> > +      port@2:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description:
> > +          HDMI port for HDMI output
> > +
> > +    required:
> > +      - port@0
> > +      - port@2
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - vdd-supply
> > +  - vcc-supply
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    i2c10 {
> > +      #address-cells =3D <1>;
> > +      #size-cells =3D <0>;
> > +
> > +      hdmi-bridge@41 {
> > +        compatible =3D "lontium,lt9611c";
> > +        reg =3D <0x41>;
> > +        #sound-dai-cells =3D <0>;
> > +        interrupts-extended =3D <&pio 128 GPIO_ACTIVE_HIGH>;
> > +        reset-gpios =3D <&pio 127 GPIO_ACTIVE_HIGH>;
> > +        vdd-supply =3D <&lt9611_1v2>;
> > +        vcc-supply =3D <&lt9611_3v3>;
> > +        status =3D "okay";
>
> Nope, drop.
>
>
>
> Best regards,
> Krzysztof

--00000000000087955e063df50a2b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>Krzysztof Kozlowski &lt;<a href=3D"mailto:krzk@ker=
nel.org">krzk@kernel.org</a>&gt; =E4=BA=8E2025=E5=B9=B49=E6=9C=884=E6=97=A5=
=E5=91=A8=E5=9B=9B 13:49=E5=86=99=E9=81=93=EF=BC=9A<br>&gt;<br>&gt; On 04/0=
9/2025 04:25, syyang wrote:<br>&gt; &gt; Fix device tree binding validation=
 errors reported by Rob Herring.<br>&gt; &gt;<br>&gt; &gt; v2:<br>&gt;<br>&=
gt; That&#39;s not the place where you put changelog.<br>&gt;<br>I&#39;m cu=
rrently learning what to do. Thank you.<br><br>&gt; &gt; - Fixed $id field =
to match actual filename (lontium,lt9611c.yaml)<br>&gt; &gt; - build pass<b=
r>&gt; &gt;<br>&gt; &gt; Thanks to Rob Herring for the review and feedback.=
<br>&gt;<br>&gt; Please carefully read submitting patches.<br>&gt;<br>&gt; =
Do not attach (thread) your patchsets to some other threads (unrelated<br>&=
gt; or older versions). This buries them deep in the mailbox and might<br>&=
gt; interfere with applying entire sets. See also:<br>&gt; <a href=3D"https=
://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/submitti=
ng-patches.rst#L830">https://elixir.bootlin.com/linux/v6.16-rc2/source/Docu=
mentation/process/submitting-patches.rst#L830</a><br>&gt;<br>&gt; Please us=
e subject prefixes matching the subsystem. You can get them for<br>&gt; exa=
mple with `git log --oneline -- DIRECTORY_OR_FILE` on the directory<br>&gt;=
 your patch is touching. For bindings, the preferred subjects are<br>&gt; e=
xplained here:<br>&gt; <a href=3D"https://www.kernel.org/doc/html/latest/de=
vicetree/bindings/submitting-patches.html#i-for-patch-submitters">https://w=
ww.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i=
-for-patch-submitters</a><br>&gt;<br>I&#39;m currently learning what to do.=
 Thank you.<br><br>&gt; &gt;<br>&gt; &gt; Signed-off-by: syyang &lt;<a href=
=3D"mailto:syyang@lontium.com">syyang@lontium.com</a>&gt;<br>&gt; &gt; ---<=
br>&gt; &gt; =C2=A0.../display/bridge/lontium,lt9611c.yaml =C2=A0 =C2=A0 =
=C2=A0 | 121 ++++++++++++++++++<br>&gt; &gt; =C2=A01 file changed, 121 inse=
rtions(+)<br>&gt; &gt; =C2=A0create mode 100644 Documentation/devicetree/bi=
ndings/display/bridge/lontium,lt9611c.yaml<br>&gt; &gt;<br>&gt; &gt; diff -=
-git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611c.yam=
l b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611c.yaml<b=
r>&gt; &gt; new file mode 100644<br>&gt; &gt; index 000000000000..712644da4=
f1d<br>&gt; &gt; --- /dev/null<br>&gt; &gt; +++ b/Documentation/devicetree/=
bindings/display/bridge/lontium,lt9611c.yaml<br>&gt; &gt; @@ -0,0 +1,121 @@=
<br>&gt; &gt; +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)<br=
>&gt; &gt; +%YAML 1.2<br>&gt; &gt; +---<br>&gt; &gt; +$id: <a href=3D"http:=
//devicetree.org/schemas/display/bridge/lontium,lt9611c.yaml#">http://devic=
etree.org/schemas/display/bridge/lontium,lt9611c.yaml#</a><br>&gt; &gt; +$s=
chema: <a href=3D"http://devicetree.org/meta-schemas/core.yaml#">http://dev=
icetree.org/meta-schemas/core.yaml#</a><br>&gt; &gt; +<br>&gt; &gt; +title:=
 Lontium LT9611C 2 Port MIPI to HDMI Bridge<br>&gt; &gt; +<br>&gt; &gt; +ma=
intainers:<br>&gt; &gt; + =C2=A0- Rob Herring &lt;<a href=3D"mailto:robh@ke=
rnel.org">robh@kernel.org</a>&gt;<br>&gt;<br>&gt; No, how so?<br>&gt;<br>I =
will change it to the email address I use when working at the company. =EF=
=BC=88<a href=3D"mailto:syyang@lontium.com">syyang@lontium.com</a>=EF=BC=89=
<br><br>&gt; &gt; +<br>&gt; &gt; +description: |<br>&gt;<br>&gt; Do not nee=
d &#39;|&#39; unless you need to preserve formatting.<br>&gt;<br>Both lonti=
um,lt9211.yaml and lontium,lt9611.yaml use &quot;|&quot;, so please confirm=
 if they need to be removed.<br><br>&gt; &gt; + =C2=A0The LT9611C are bridg=
e devices which convert DSI to HDMI<br>&gt;<br>&gt; Why this cannot be adde=
d to lt9611 binding? Commit msg should clearly<br>&gt; answer that.<br>&gt;=
<br>The lt9611 and lt9611c are chips of different specifications, and their=
 related parameters are different.<br>The VDD-supply of lt9611c is 1.2V; th=
e vdd-supply of lt9611uxc is also 1.2V, while the vdd-supply of lt9611 is 1=
.8V.<br>Now lt9611 and lt9611uxc are connected together. I&#39;m not sure i=
f this is a problem.<br>If this lt9611c can also be bound to lt9611, and if=
 you think it&#39;s okay, then I have no problem.<br><br>&gt; &gt; +<br>&gt=
; &gt; +properties:<br>&gt; &gt; + =C2=A0compatible:<br>&gt; &gt; + =C2=A0 =
=C2=A0enum:<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0- lontium,lt9611c<br>&gt; &g=
t; +<br>&gt; &gt; + =C2=A0reg:<br>&gt; &gt; + =C2=A0 =C2=A0maxItems: 1<br>&=
gt; &gt; +<br>&gt; &gt; + =C2=A0&quot;#sound-dai-cells&quot;:<br>&gt;<br>&g=
t; Missing dai-common ref.<br>&gt;<br>I don&#39;t understand .=C2=A0 =C2=A0=
I referred to:<br>Documentation/devicetree/bindings/display/bridge/ite,it65=
05.yaml<br>Documentation/devicetree/bindings/display/bridge/lontium,lt9611.=
yaml<br>=C2=A0<br>&gt; &gt; + =C2=A0 =C2=A0const: 0<br>&gt; &gt; +<br>&gt; =
&gt; + =C2=A0interrupts:<br>&gt; &gt; + =C2=A0 =C2=A0maxItems: 1<br>&gt; &g=
t; +<br>&gt; &gt; + =C2=A0reset-gpios:<br>&gt; &gt; + =C2=A0 =C2=A0maxItems=
: 1<br>&gt; &gt; + =C2=A0 =C2=A0description: GPIO connected to active high =
RESET pin.<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0vdd-supply:<br>&gt; &gt; + =
=C2=A0 =C2=A0description: Regulator for 1.2V MIPI phy power.<br>&gt; &gt; +=
<br>&gt; &gt; + =C2=A0vcc-supply:<br>&gt; &gt; + =C2=A0 =C2=A0description: =
Regulator for 3.3V IO power.<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0ports:<br>=
&gt; &gt; + =C2=A0 =C2=A0$ref: /schemas/graph.yaml#/properties/ports<br>&gt=
; &gt; +<br>&gt; &gt; + =C2=A0 =C2=A0properties:<br>&gt; &gt; + =C2=A0 =C2=
=A0 =C2=A0port@0:<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0$ref: /schemas/=
graph.yaml#/properties/port<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0descr=
iption:<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Primary MIPI port-=
1 for MIPI input<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0port@1:<=
br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0$ref: /schemas/graph.yaml#/proper=
ties/port<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0description:<br>&gt; &g=
t; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Additional MIPI port-2 for MIPI inpu=
t, used in combination<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wit=
h primary MIPI port-1 to drive higher resolution displays<br>&gt; &gt; +<br=
>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0port@2:<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0$ref: /schemas/graph.yaml#/properties/port<br>&gt; &gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0description:<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0HDMI port for HDMI output<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =C2=
=A0required:<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0- port@0<br>&gt; &gt; + =C2=
=A0 =C2=A0 =C2=A0- port@2<br>&gt; &gt; +<br>&gt; &gt; +required:<br>&gt; &g=
t; + =C2=A0- compatible<br>&gt; &gt; + =C2=A0- reg<br>&gt; &gt; + =C2=A0- i=
nterrupts<br>&gt; &gt; + =C2=A0- vdd-supply<br>&gt; &gt; + =C2=A0- vcc-supp=
ly<br>&gt; &gt; + =C2=A0- ports<br>&gt; &gt; +<br>&gt; &gt; +additionalProp=
erties: false<br>&gt; &gt; +<br>&gt; &gt; +examples:<br>&gt; &gt; + =C2=A0-=
 |<br>&gt; &gt; + =C2=A0 =C2=A0#include &lt;dt-bindings/gpio/gpio.h&gt;<br>=
&gt; &gt; + =C2=A0 =C2=A0#include &lt;dt-bindings/interrupt-controller/irq.=
h&gt;<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =C2=A0i2c10 {<br>&gt; &gt; + =C2=
=A0 =C2=A0 =C2=A0#address-cells =3D &lt;1&gt;;<br>&gt; &gt; + =C2=A0 =C2=A0=
 =C2=A0#size-cells =3D &lt;0&gt;;<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =C2=
=A0 =C2=A0hdmi-bridge@41 {<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0compat=
ible =3D &quot;lontium,lt9611c&quot;;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0reg =3D &lt;0x41&gt;;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0#soun=
d-dai-cells =3D &lt;0&gt;;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0interr=
upts-extended =3D &lt;&amp;pio 128 GPIO_ACTIVE_HIGH&gt;;<br>&gt; &gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0reset-gpios =3D &lt;&amp;pio 127 GPIO_ACTIVE_HIGH&g=
t;;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0vdd-supply =3D &lt;&amp;lt961=
1_1v2&gt;;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0vcc-supply =3D &lt;&am=
p;lt9611_3v3&gt;;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quo=
t;okay&quot;;<br>&gt;<br>&gt; Nope, drop.<br>&gt;<br>&gt;<br>&gt;<br>&gt; B=
est regards,<br>&gt; Krzysztof</div>

--00000000000087955e063df50a2b--

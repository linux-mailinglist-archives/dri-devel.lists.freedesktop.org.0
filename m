Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 259AF7060D9
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 09:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7638010E3C4;
	Wed, 17 May 2023 07:09:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E917A10E0EE
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 22:08:27 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-25332b3915bso141264a91.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 15:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684274907; x=1686866907;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HFkfqX8pgc74Jv0KdmbZEyVpGOPB+cZHuR+uMYduhHI=;
 b=fRx/QopIGUwec5T4JzeahZQe/3GM3arcZLgg9Q18g5L6v4nlqfjne4GKIeJWI78IUK
 8mk8CHBwORF8tfQVA9V5h3oNM8XBDiGAgV9l7ip2zrfOeaQKEFsfw07HGHNP+Zh85eP6
 6Mr/5IWTWVksT/LoqZAafGOH3pm7GAu/eBoeukbHEMlwgSWSeP18JFoW9Isuzzqp6HjE
 VvYhbQjWfbixYk07LVpVBdXZDIlfSD0LLvp0xHGCnY6z52GMPS9IsV1mkz+sFK6A47Es
 yLZMTMODPcUohyONz+JlYCYgK1DsQAg+RLSUm63nsuGjBoSFZY8BbCsAoyxjnBM8godd
 Hbgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684274907; x=1686866907;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HFkfqX8pgc74Jv0KdmbZEyVpGOPB+cZHuR+uMYduhHI=;
 b=Bh9Ys6EeNqrJ7a76YYBZw71QxSjbzlHhnpyxGshs7NnfXg+hyFKHuQEPYtIOZee9aU
 /NeY6FyUTWpizIfIMsf1CyZgjGacF5YovsaABQbJDEqF337dsbN93zYdrL7QsKk5X3J/
 4Ra1P0D/HA12oC9Glrrak7xyBHwavw9ueO+Q+C5CB38ZcsM+L4pJM0D/t9g4EbHRsWQC
 SnC81Ey+4MKA4aSi1o8IoGrLcvoGpCDSUWwdJxaB4Dj7q+/qT5Iw5PJIQO+ZZa/qDDk/
 4La/fl4c/Vp2CQrRKp5PtO9ZGraHfHFX8dYbWWL4Waj6qylijLIuKVpH+b3QVuOQEGEM
 pdNA==
X-Gm-Message-State: AC+VfDzAfIkWDvrfLfFpU9hDdMvWOyS0kebMccHOgNAmnMU0RpENQlQv
 izMjh5iZsIdcBtNdO7zPhaI0V52Qzyhqwzac2dA=
X-Google-Smtp-Source: ACHHUZ7ccfoW/iAOi1KVwlPNcj8er99pWYAZWesfkviD9f37trEjmhBhoB6yE4Vc5D9m6rpaDoLuQVXK/Qgo9rNQurw=
X-Received: by 2002:a17:90a:24c:b0:253:2c86:4476 with SMTP id
 t12-20020a17090a024c00b002532c864476mr2437018pje.18.1684274906731; Tue, 16
 May 2023 15:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAO9szn18KsR0c+U8EEY1=xnmsKMxy6SEArMUic0z=aYJDVwWCQ@mail.gmail.com>
 <023f6cf9-0f08-f27e-d203-5ff78faf110f@linaro.org>
In-Reply-To: <023f6cf9-0f08-f27e-d203-5ff78faf110f@linaro.org>
From: Paulo Pavacic <pavacic.p@gmail.com>
Date: Wed, 17 May 2023 00:08:14 +0200
Message-ID: <CAO9szn1QAuszs2rDKeNw4gEgRg5x9kbC=tkwm++_JG8am354iw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: display: panel: add panel-mipi-dsi-bringup
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000851d4c05fbd6cfce"
X-Mailman-Approved-At: Wed, 17 May 2023 07:08:54 +0000
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000851d4c05fbd6cfce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, thank you for your time to review this patch and sorry for not
addressing all of the concerns, it was done unintentionally. This is my
first contribution to the Linux kernel and it is quite a process.
I have run those two scripts and haven't received any errors I have latest
master cloned so I will check what I did wrong.

The thing I would like to get approval on before I try anything else is the
name 'panel-mipi-dsi-bringup':

Still wrong filename. You did not respond to my previous comments, so I
don't really understand what's this.

Judging by compatible, this should be fannal,c3004.yaml

If not, explain please.

Missing user of the bindings - driver or DTS. Please sent patches
together as patchset.


 I wasn't sure how to name it and this name seemed fit. I'm not sure how to
be concise about this, but here is the full story as to why I have done
that:

I got a task to enable panel for which working driver wasn't available. I
have started testing raydium driver and modifying parts of it until I got
it working.
Driver was modified quite a lot, new functions, macros and structures were
added which resulted in a new driver.
Therefore I have made a simple driver which I have submitted for a review
which will probably be rejected now due tomany reasons I have noticed after
sending it:
https://lore.kernel.org/lkml/CAO9szn03msW6pu37Zws5EaFGL10rjp9ugPdCuDvOPuQRU=
72gVQ@mail.gmail.com/T/

While talking with manufacturers of the panel I have figured out that they
aren't that familiar with the Linux kernel.
They had previously only enabled  it on bare metal (PLA?) and provided me
with the initialization sequences. Initialization sequences are hex values
sent over MIPI DSI to initialize panel controller.
Initialization sequences sometimes also require delays after certain
commands and for different panels it can be very different.
I believe I have simplified it so that someone can follow comments inside
of the driver and try to enable mipi dsi panel by copy pasting
initialization code from bare metal system and doing minor modifications.
Since I have targeted this at people who need to enable their panels for
the first time name seemed okay. I thought that since there is
panel-simple.yml that panel-mipi-dsi-bringup.yml would be acceptable name.

Best regards,
Paulo

uto, 16. svi 2023. u 17:57 Krzysztof Kozlowski <
krzysztof.kozlowski@linaro.org> napisao je:
>
> On 16/05/2023 15:09, Paulo Pava=C4=8Di=C4=87 wrote:
> > Add dt-bindings documentation for panel-mipi-dsi-bringup which currentl=
y
> > supports fannal,c3004 panel. Also added fannal to vendor-prefixes.
>
> Thank you for your patch. There is something to discuss/improve.
>
> >
> > v2 changelog:
>
> Please put changelog after ---
>
> Missing user of the bindings - driver or DTS. Please sent patches
> together as patchset.
>
>
>
> >   - revised driver title, now describes purpose
> >   - revised description, now describes hw
> >   - revised maintainers, now has only 1 mail
> >   - removed diacritics from commit/commit author
> >   - properties/compatible is now enum
> >   - compatible using only lowercase
> >   - revised dts example
> >   - modified MAINTAINERS in this commit (instead of driver commit)
> >   - dt_bindings_check checked yml
> >   - checkpatch warning fixed
> >
> > Signed-off-by: Paulo Pavacic <pavacic.p@gmail.com>
> > ---
> >  .../display/panel/panel-mipi-dsi-bringup.yaml | 54 +++++++++++++++++++
> >  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
> >  MAINTAINERS                                   |  6 +++
> >  3 files changed, 62 insertions(+)
> >  create mode 100644
> >
Documentation/devicetree/bindings/display/panel/panel-mipi-dsi-bringup.yaml
>
> Still wrong filename. You did not respond to my previous comments, so I
> don't really understand what's this.
>
> Judging by compatible, this should be fannal,c3004.yaml
>
> If not, explain please.
>
> >
> > diff --git
a/Documentation/devicetree/bindings/display/panel/panel-mipi-dsi-bringup.ya=
ml
> >
b/Documentation/devicetree/bindings/display/panel/panel-mipi-dsi-bringup.ya=
ml
> > new file mode 100644
> > index 000000000000..c9e2b545657e
> > --- /dev/null
> > +++
b/Documentation/devicetree/bindings/display/panel/panel-mipi-dsi-bringup.ya=
ml
> > @@ -0,0 +1,54 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id:
http://devicetree.org/schemas/display/panel/panel-mipi-dsi-bringup.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MIPI DSI Bringup Panel Porting Bindings
>
> Drop Bindings. I don't understand what is "Porting" in the terms of
> hardware. If it these are bindings for Panel, please write here proper
> hardware.
>
> > +
> > +description: |
> > +  MIPI DSI Bringup Panel porting bindings to be used for a collection
of panels
>
> I have no clue what is "Bringup panel". Is it technical term for some
> type of panels?
>
> > +  from different manufacturers which don't require backlight control
from the
> > +  driver and have a single reset pin which is required to be passed as
an
> > +  argument.
>
> Drop "driver"
>
> > +
> > +maintainers:
> > +  - Paulo Pavacic <pavacic.p@gmail.com>
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +
>
> Drop blank line.
>
> > +  compatible:
> > +    enum:
> > +      # compatible must be listed in alphabetical order, ordered by
compatible.
> > +      # The description in the comment is mandatory for each
compatible.
>
> Drop above comment.
>
> > +
> > +        # Fannal 480x800 panel
> > +      - fannal,c3004
> > +
> > +  reg: true
> > +  reset-gpios: true
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reset-gpios
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    //example on IMX8MM where GPIO pin 9 is used as a reset pin
>
> This is a friendly reminder during the review process.
>
> It seems my previous comments were not fully addressed. Maybe my
> feedback got lost between the quotes, maybe you just forgot to apply it.
> Please go back to the previous discussion and either implement all
> requested changes or keep discussing them.
>
> Thank you.
>
> I asked to drop the comment.
>
> > +    mipi_dsi@32e10000 {
>
> dsi {
>
> There is no way it was correct in current form.
>
> It does not look like you tested the bindings, at least after quick
> look. Please run `make dt_binding_check` (see
> Documentation/devicetree/bindings/writing-schema.rst for instructions).
> Maybe you need to update your dtschema and yamllint.
>
> > +        panel@0 {
> > +            compatible =3D "fannal,c3004";
> > +            reg =3D <0>;
> > +            pinctrl-0 =3D <&pinctrl_mipi_dsi_rst>;
> > +            pinctrl-names =3D "default";
> > +            reset-gpios =3D <&gpio1 9 GPIO_ACTIVE_LOW>;
> > +        };
> > +    };
> > +...
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > index 82d39ab0231b..f962750f630a 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -462,6 +462,8 @@ patternProperties:
> >      description: Facebook
> >    "^fairphone,.*":
> >      description: Fairphone B.V.
> > +  "^fannal,.*":
> > +    description: Fannal Electronics Co., Ltd
> >    "^faraday,.*":
> >      description: Faraday Technology Corporation
> >    "^fastrax,.*":
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index e0ad886d3163..46f988ee60bd 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -6566,6 +6566,12 @@ T:    git git://
anongit.freedesktop.org/drm/drm-misc
> >  F:
 Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
> >  F:    drivers/gpu/drm/tiny/panel-mipi-dbi.c
> >
> > +DRM DRIVER FOR MIPI DSI BRINGUP
> > +M:    Paulo Pavacic <pavacic.p@gmail.com>
> > +S:    Maintained
> > +C:    mipi-dsi-bringup:matrix.org
>
> Missing protocol. See explanation of C: entry at the beginning.
>
> > +F:
 Documentation/devicetree/bindings/display/panel/panel-mipi-dsi-bringup.yam=
l
> > +
> >  DRM DRIVER FOR MSM ADRENO GPU
> >  M:    Rob Clark <robdclark@gmail.com>
> >  M:    Abhinav Kumar <quic_abhinavk@quicinc.com>
>
> Best regards,
> Krzysztof
>

--000000000000851d4c05fbd6cfce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello, thank you for your time to review this patch a=
nd sorry for not<br>addressing all of the concerns, it was done unintention=
ally. This is my first contribution to the Linux kernel and it is quite a p=
rocess.<br>I have run those two scripts and haven&#39;t received any errors=
 I have latest master cloned so I will check what I did wrong.</div><div><b=
r></div><div>The thing I would like to get approval on before I try anythin=
g else is the name &#39;panel-mipi-dsi-bringup&#39;:</div><blockquote>Still=
 wrong filename. You did not respond to my previous comments, so I<br>don&#=
39;t really understand what&#39;s this.<br><br>Judging by compatible, this =
should be fannal,c3004.yaml<br><br>If not, explain please. <br><br>Missing =
user of the bindings - driver or DTS. Please sent patches<br>
together as patchset.<span class=3D"gmail-im"><br></span></blockquote><br>=
=C2=A0I wasn&#39;t sure how to name it and this name seemed fit. I&#39;m no=
t sure how to be concise about this, but here is the full story as to why I=
 have done that:<br><br>I got a task to enable panel for which working driv=
er wasn&#39;t available. I have started testing raydium driver and modifyin=
g parts of it until I got it working.<br>Driver was modified quite a lot, n=
ew functions, macros and structures were added which resulted in a new driv=
er.<br>Therefore I have made a simple driver which I have submitted for a r=
eview which will probably be rejected now due tomany reasons I have noticed=
 after sending it:<br><a href=3D"https://lore.kernel.org/lkml/CAO9szn03msW6=
pu37Zws5EaFGL10rjp9ugPdCuDvOPuQRU72gVQ@mail.gmail.com/T/">https://lore.kern=
el.org/lkml/CAO9szn03msW6pu37Zws5EaFGL10rjp9ugPdCuDvOPuQRU72gVQ@mail.gmail.=
com/T/</a><br><br>While talking with manufacturers of the panel I have figu=
red out that they aren&#39;t that familiar with the Linux kernel.<br><div>T=
hey had previously only enabled =C2=A0it on bare metal (PLA?) and provided =
me with the initialization sequences. Initialization sequences are hex valu=
es sent over MIPI DSI to initialize panel controller.</div><div>Initializat=
ion sequences sometimes also require delays after certain commands and for =
different panels it can be very different. </div><div>I believe I have simp=
lified it so that someone can follow comments inside of the driver and try =
to enable mipi dsi panel by copy pasting initialization code from bare meta=
l system and doing minor modifications.</div><div>Since I have targeted thi=
s at people who need to enable their panels for the first time name seemed =
okay. I thought that since there is panel-simple.yml that panel-mipi-dsi-br=
ingup.yml would be acceptable name. <br></div><br>Best regards,<br>Paulo<br=
><br>uto, 16. svi 2023. u 17:57 Krzysztof Kozlowski &lt;<a href=3D"mailto:k=
rzysztof.kozlowski@linaro.org">krzysztof.kozlowski@linaro.org</a>&gt; napis=
ao je:<br>&gt;<br>&gt; On 16/05/2023 15:09, Paulo Pava=C4=8Di=C4=87 wrote:<=
br>&gt; &gt; Add dt-bindings documentation for panel-mipi-dsi-bringup which=
 currently<br>&gt; &gt; supports fannal,c3004 panel. Also added fannal to v=
endor-prefixes.<br>&gt;<br>&gt; Thank you for your patch. There is somethin=
g to discuss/improve.<br>&gt;<br>&gt; &gt;<br>&gt; &gt; v2 changelog:<br>&g=
t;<br>&gt; Please put changelog after ---<br>&gt;<br>&gt; Missing user of t=
he bindings - driver or DTS. Please sent patches<br>&gt; together as patchs=
et.<br>&gt;<br>&gt;<br>&gt;<br>&gt; &gt; =C2=A0 - revised driver title, now=
 describes purpose<br>&gt; &gt; =C2=A0 - revised description, now describes=
 hw<br>&gt; &gt; =C2=A0 - revised maintainers, now has only 1 mail<br>&gt; =
&gt; =C2=A0 - removed diacritics from commit/commit author<br>&gt; &gt; =C2=
=A0 - properties/compatible is now enum<br>&gt; &gt; =C2=A0 - compatible us=
ing only lowercase<br>&gt; &gt; =C2=A0 - revised dts example<br>&gt; &gt; =
=C2=A0 - modified MAINTAINERS in this commit (instead of driver commit)<br>=
&gt; &gt; =C2=A0 - dt_bindings_check checked yml<br>&gt; &gt; =C2=A0 - chec=
kpatch warning fixed<br>&gt; &gt;<br>&gt; &gt; Signed-off-by: Paulo Pavacic=
 &lt;<a href=3D"mailto:pavacic.p@gmail.com">pavacic.p@gmail.com</a>&gt;<br>=
&gt; &gt; ---<br>&gt; &gt; =C2=A0.../display/panel/panel-mipi-dsi-bringup.y=
aml | 54 +++++++++++++++++++<br>&gt; &gt; =C2=A0.../devicetree/bindings/ven=
dor-prefixes.yaml =C2=A0| =C2=A02 +<br>&gt; &gt; =C2=A0MAINTAINERS =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A06 +++<br>&gt; &gt; =C2=A03 f=
iles changed, 62 insertions(+)<br>&gt; &gt; =C2=A0create mode 100644<br>&gt=
; &gt; Documentation/devicetree/bindings/display/panel/panel-mipi-dsi-bring=
up.yaml<br>&gt;<br>&gt; Still wrong filename. You did not respond to my pre=
vious comments, so I<br>&gt; don&#39;t really understand what&#39;s this.<b=
r>&gt;<br>&gt; Judging by compatible, this should be fannal,c3004.yaml<br>&=
gt;<br>&gt; If not, explain please.<br>&gt;<br>&gt; &gt;<br>&gt; &gt; diff =
--git a/Documentation/devicetree/bindings/display/panel/panel-mipi-dsi-brin=
gup.yaml<br>&gt; &gt; b/Documentation/devicetree/bindings/display/panel/pan=
el-mipi-dsi-bringup.yaml<br>&gt; &gt; new file mode 100644<br>&gt; &gt; ind=
ex 000000000000..c9e2b545657e<br>&gt; &gt; --- /dev/null<br>&gt; &gt; +++ b=
/Documentation/devicetree/bindings/display/panel/panel-mipi-dsi-bringup.yam=
l<br>&gt; &gt; @@ -0,0 +1,54 @@<br>&gt; &gt; +# SPDX-License-Identifier: (G=
PL-2.0-only OR BSD-2-Clause)<br>&gt; &gt; +%YAML 1.2<br>&gt; &gt; +---<br>&=
gt; &gt; +$id: <a href=3D"http://devicetree.org/schemas/display/panel/panel=
-mipi-dsi-bringup.yaml#">http://devicetree.org/schemas/display/panel/panel-=
mipi-dsi-bringup.yaml#</a><br>&gt; &gt; +$schema: <a href=3D"http://devicet=
ree.org/meta-schemas/core.yaml#">http://devicetree.org/meta-schemas/core.ya=
ml#</a><br>&gt; &gt; +<br>&gt; &gt; +title: MIPI DSI Bringup Panel Porting =
Bindings<br>&gt;<br>&gt; Drop Bindings. I don&#39;t understand what is &quo=
t;Porting&quot; in the terms of<br>&gt; hardware. If it these are bindings =
for Panel, please write here proper<br>&gt; hardware.<br>&gt;<br>&gt; &gt; =
+<br>&gt; &gt; +description: |<br>&gt; &gt; + =C2=A0MIPI DSI Bringup Panel =
porting bindings to be used for a collection of panels<br>&gt;<br>&gt; I ha=
ve no clue what is &quot;Bringup panel&quot;. Is it technical term for some=
<br>&gt; type of panels?<br>&gt;<br>&gt; &gt; + =C2=A0from different manufa=
cturers which don&#39;t require backlight control from the<br>&gt; &gt; + =
=C2=A0driver and have a single reset pin which is required to be passed as =
an<br>&gt; &gt; + =C2=A0argument.<br>&gt;<br>&gt; Drop &quot;driver&quot;<b=
r>&gt;<br>&gt; &gt; +<br>&gt; &gt; +maintainers:<br>&gt; &gt; + =C2=A0- Pau=
lo Pavacic &lt;<a href=3D"mailto:pavacic.p@gmail.com">pavacic.p@gmail.com</=
a>&gt;<br>&gt; &gt; +<br>&gt; &gt; +allOf:<br>&gt; &gt; + =C2=A0- $ref: pan=
el-common.yaml#<br>&gt; &gt; +<br>&gt; &gt; +properties:<br>&gt; &gt; +<br>=
&gt;<br>&gt; Drop blank line.<br>&gt;<br>&gt; &gt; + =C2=A0compatible:<br>&=
gt; &gt; + =C2=A0 =C2=A0enum:<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0# compatib=
le must be listed in alphabetical order, ordered by compatible.<br>&gt; &gt=
; + =C2=A0 =C2=A0 =C2=A0# The description in the comment is mandatory for e=
ach compatible.<br>&gt;<br>&gt; Drop above comment.<br>&gt;<br>&gt; &gt; +<=
br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0# Fannal 480x800 panel<br>&gt; &g=
t; + =C2=A0 =C2=A0 =C2=A0- fannal,c3004<br>&gt; &gt; +<br>&gt; &gt; + =C2=
=A0reg: true<br>&gt; &gt; + =C2=A0reset-gpios: true<br>&gt; &gt; +<br>&gt; =
&gt; +required:<br>&gt; &gt; + =C2=A0- compatible<br>&gt; &gt; + =C2=A0- re=
g<br>&gt; &gt; + =C2=A0- reset-gpios<br>&gt; &gt; +<br>&gt; &gt; +additiona=
lProperties: false<br>&gt; &gt; +<br>&gt; &gt; +examples:<br>&gt; &gt; + =
=C2=A0- |<br>&gt; &gt; + =C2=A0 =C2=A0#include &lt;dt-bindings/gpio/gpio.h&=
gt;<br>&gt; &gt; + =C2=A0 =C2=A0//example on IMX8MM where GPIO pin 9 is use=
d as a reset pin<br>&gt;<br>&gt; This is a friendly reminder during the rev=
iew process.<br>&gt;<br>&gt; It seems my previous comments were not fully a=
ddressed. Maybe my<br>&gt; feedback got lost between the quotes, maybe you =
just forgot to apply it.<br>&gt; Please go back to the previous discussion =
and either implement all<br>&gt; requested changes or keep discussing them.=
<br>&gt;<br>&gt; Thank you.<br>&gt;<br>&gt; I asked to drop the comment.<br=
>&gt;<br>&gt; &gt; + =C2=A0 =C2=A0mipi_dsi@32e10000 {<br>&gt;<br>&gt; dsi {=
<br>&gt;<br>&gt; There is no way it was correct in current form.<br>&gt;<br=
>&gt; It does not look like you tested the bindings, at least after quick<b=
r>&gt; look. Please run `make dt_binding_check` (see<br>&gt; Documentation/=
devicetree/bindings/writing-schema.rst for instructions).<br>&gt; Maybe you=
 need to update your dtschema and yamllint.<br>&gt;<br>&gt; &gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0panel@0 {<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0compatible =3D &quot;fannal,c3004&quot;;<br>&gt; &gt; + =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0&gt;;<br>&gt; &gt; + =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;pinctrl_mipi_dsi_=
rst&gt;;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-na=
mes =3D &quot;default&quot;;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0reset-gpios =3D &lt;&amp;gpio1 9 GPIO_ACTIVE_LOW&gt;;<br>&gt; &gt=
; + =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>&gt; &gt; + =C2=A0 =C2=A0};<br>&gt; &g=
t; +...<br>&gt; &gt; diff --git a/Documentation/devicetree/bindings/vendor-=
prefixes.yaml<br>&gt; &gt; b/Documentation/devicetree/bindings/vendor-prefi=
xes.yaml<br>&gt; &gt; index 82d39ab0231b..f962750f630a 100644<br>&gt; &gt; =
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml<br>&gt; &gt; +=
++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml<br>&gt; &gt; @@=
 -462,6 +462,8 @@ patternProperties:<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0descr=
iption: Facebook<br>&gt; &gt; =C2=A0 =C2=A0&quot;^fairphone,.*&quot;:<br>&g=
t; &gt; =C2=A0 =C2=A0 =C2=A0description: Fairphone B.V.<br>&gt; &gt; + =C2=
=A0&quot;^fannal,.*&quot;:<br>&gt; &gt; + =C2=A0 =C2=A0description: Fannal =
Electronics Co., Ltd<br>&gt; &gt; =C2=A0 =C2=A0&quot;^faraday,.*&quot;:<br>=
&gt; &gt; =C2=A0 =C2=A0 =C2=A0description: Faraday Technology Corporation<b=
r>&gt; &gt; =C2=A0 =C2=A0&quot;^fastrax,.*&quot;:<br>&gt; &gt; diff --git a=
/MAINTAINERS b/MAINTAINERS<br>&gt; &gt; index e0ad886d3163..46f988ee60bd 10=
0644<br>&gt; &gt; --- a/MAINTAINERS<br>&gt; &gt; +++ b/MAINTAINERS<br>&gt; =
&gt; @@ -6566,6 +6566,12 @@ T: =C2=A0 =C2=A0git git://<a href=3D"http://ano=
ngit.freedesktop.org/drm/drm-misc">anongit.freedesktop.org/drm/drm-misc</a>=
<br>&gt; &gt; =C2=A0F: =C2=A0 =C2=A0Documentation/devicetree/bindings/displ=
ay/panel/panel-mipi-dbi-spi.yaml<br>&gt; &gt; =C2=A0F: =C2=A0 =C2=A0drivers=
/gpu/drm/tiny/panel-mipi-dbi.c<br>&gt; &gt;<br>&gt; &gt; +DRM DRIVER FOR MI=
PI DSI BRINGUP<br>&gt; &gt; +M: =C2=A0 =C2=A0Paulo Pavacic &lt;<a href=3D"m=
ailto:pavacic.p@gmail.com">pavacic.p@gmail.com</a>&gt;<br>&gt; &gt; +S: =C2=
=A0 =C2=A0Maintained<br>&gt; &gt; +C: =C2=A0 =C2=A0mipi-dsi-bringup:<a href=
=3D"http://matrix.org">matrix.org</a><br>&gt;<br>&gt; Missing protocol. See=
 explanation of C: entry at the beginning.<br>&gt;<br>&gt; &gt; +F: =C2=A0 =
=C2=A0Documentation/devicetree/bindings/display/panel/panel-mipi-dsi-bringu=
p.yaml<br>&gt; &gt; +<br>&gt; &gt; =C2=A0DRM DRIVER FOR MSM ADRENO GPU<br>&=
gt; &gt; =C2=A0M: =C2=A0 =C2=A0Rob Clark &lt;<a href=3D"mailto:robdclark@gm=
ail.com">robdclark@gmail.com</a>&gt;<br>&gt; &gt; =C2=A0M: =C2=A0 =C2=A0Abh=
inav Kumar &lt;<a href=3D"mailto:quic_abhinavk@quicinc.com">quic_abhinavk@q=
uicinc.com</a>&gt;<br>&gt;<br>&gt; Best regards,<br>&gt; Krzysztof<br>&gt;<=
/div>

--000000000000851d4c05fbd6cfce--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BCF4BB528
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 10:17:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1ECB10F115;
	Fri, 18 Feb 2022 09:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B839010F114
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 09:17:31 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id w7so6807611ioj.5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 01:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tBapzxv0uNqploAKJlVAnGnpalD94X2Y4zlWphJoQ8Q=;
 b=eH1fjGNm2EMrwPfFk1/bRHYkQANw3SnFKzU5E2/akKgLkoADo8lvDcEF/CqBjHHCq2
 Y/9h+6sHwDsmhn4xpJAUOmCdDobbve4UIsIfi/QT9jJmugNQCVokuyQkZOiBg36JjoJl
 npUDk06LqPj4SkzYItZFnnbz2KcCRDBp63jD4WEM7xDdZpJhNOEP5EWYAXjdyAwGKuDy
 POfoi19xip6825tTR+tvQI5Ggn4dA4I+4RdGqFfCDg8FhnGpcwK7z4+KvjYQVGnB0GV8
 hwmZtNLLun01Ra33mfU/pPEAO4GtUsbXbsdD6EcQHRP6NLhV9xCgLhl+ygV/CI9cA8Cn
 UaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tBapzxv0uNqploAKJlVAnGnpalD94X2Y4zlWphJoQ8Q=;
 b=ihi78E/BHH+Pwck1cJ+/GPK/2qjapuAoysFNI1KKOF5UINRnaRpAbJhPnAYHGEYdkD
 eO9GvmrpwP3ADaNdE8Vv7xcaCnv0ToF2gDKepiaUncS89qfbDWeVasMYoXqA+WxbPJjP
 2atBiAhKj0T9t7cGFqIoez0Tl5Z0sCXwqyK6znJ5lPO10ruvi4Z/I4zfovlcZlYQjC95
 hNwye5ZlnhuMrKnZPF3WDR6TG1FGlw2RGUEarjSqO4mRJdR1wgHv72eLRBdhZ9n6fxNJ
 SHEEBB6vFECJVS5rtnCMkPmKQ91M2Sn8ex6ntbFSKEEpOoYZ1kSnZ3x4rZtYY4XwLm4Q
 alUw==
X-Gm-Message-State: AOAM530pM+vLs+aXQGAhYIhcl8DmYegOriqn0/wLmX4VZGbw+3u3WoC9
 FwJME8v8OQRT++4fpeC+GLAB2Zui55B6Ji7MXqI=
X-Google-Smtp-Source: ABdhPJwrVpfdZatYWTg5NLvbSwQHp2bmKdpXBT0aoL9/+cLupA3BwtHatWwQNsk1/hCsgoaKHfFcpX/h7VCYQDZ6rbE=
X-Received: by 2002:a5d:984f:0:b0:63d:a956:cdbc with SMTP id
 p15-20020a5d984f000000b0063da956cdbcmr4853453ios.37.1645175850497; Fri, 18
 Feb 2022 01:17:30 -0800 (PST)
MIME-Version: 1.0
References: <20220218063610.1530630-1-rexnie3@gmail.com>
 <CAJMQK-gz5ha232M22+wEY8Bid4oHOESJPk3vRXDU_dzAeiaEQA@mail.gmail.com>
In-Reply-To: <CAJMQK-gz5ha232M22+wEY8Bid4oHOESJPk3vRXDU_dzAeiaEQA@mail.gmail.com>
From: Rex Nie <rexnie3@gmail.com>
Date: Fri, 18 Feb 2022 17:17:19 +0800
Message-ID: <CAG+K-_+4NpYGz0hnG-CizLK2-zKptu6Sg_NPVWBF3mS7=HvpSg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Add panel-edp: add lcd innolux,n140hca-eac
To: Hsin-Yi Wang <hsinyi@chromium.org>
Content-Type: multipart/alternative; boundary="000000000000297ef505d8475a64"
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, spanda@codeaurora.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 robh+dt@kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000297ef505d8475a64
Content-Type: text/plain; charset="UTF-8"

Hi Hsin-Yi,

Got it, thanks

On Fri, 18 Feb 2022 at 17:01, Hsin-Yi Wang <hsinyi@chromium.org> wrote:

> On Fri, Feb 18, 2022 at 2:36 PM Rex Nie <rexnie3@gmail.com> wrote:
> >
> > innolux,n140hca-eac is a eDP-based LCD panel. This panel has 1920x1080
> > resolution in 14-inch TFT panel.
> >
> > Signed-off-by: Rex Nie <rexnie3@gmail.com>
> > ---
> >  .../display/panel/innolux,n140hca-eac.yaml    | 43 +++++++++++++++++++
> >  drivers/gpu/drm/panel/panel-edp.c             | 26 +++++++++++
> >  2 files changed, 69 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/display/panel/innolux,n140hca-eac.yaml
> >
> Hi Rex,
>
> Please split yaml and driver into different patches.
> You don't need to create a new binding for innolux,n140hca-eac.yaml.
> You can add the compatible into panel-simple.yaml. Check
> innolux,n125hce-gn1 for example.
>
> > diff --git
> a/Documentation/devicetree/bindings/display/panel/innolux,n140hca-eac.yaml
> b/Documentation/devicetree/bindings/display/panel/innolux,n140hca-eac.yaml
> > new file mode 100644
> > index 000000000000..5493e383c97c
> > --- /dev/null
> > +++
> b/Documentation/devicetree/bindings/display/panel/innolux,n140hca-eac.yaml
> > @@ -0,0 +1,43 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id:
> http://devicetree.org/schemas/display/panel/innolux,n140hca-eac.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Innolux N140HCA-EAC 14 inch eDP 1080p display panel
> > +
> > +maintainers:
> > +  - Sandeep Panda <spanda@codeaurora.org>
> > +  - Douglas Anderson <dianders@chromium.org>
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: innolux,n140hca-eac
> > +
> > +  enable-gpios: true
> > +  power-supply: true
> > +  backlight: true
> > +  no-hpd: true
> > +
> > +required:
> > +  - compatible
> > +  - power-supply
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    panel_edp: panel-edp {
> > +        compatible = "innolux,n140hca-eac";
> > +        enable-gpios = <&pio 96 GPIO_ACTIVE_HIGH>;
> > +        power-supply = <&pp3300_disp_x>;
> > +        backlight = <&backlight_lcd0>;
> > +        no-hpd;
> > +    };
> > +
> > +...
> > diff --git a/drivers/gpu/drm/panel/panel-edp.c
> b/drivers/gpu/drm/panel/panel-edp.c
> > index f7bfcf63d48e..f5f9c9cb26ba 100644
> > --- a/drivers/gpu/drm/panel/panel-edp.c
> > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > @@ -1330,6 +1330,29 @@ static const struct panel_desc
> innolux_n125hce_gn1 = {
> >         },
> >  };
> >
> > +static const struct display_timing innolux_n140hca_eac_timing = {
> > +       .pixelclock = { 72600000, 76420000, 80240000 },
> > +       .hactive = { 1920, 1920, 1920 },
> > +       .hfront_porch = { 80, 80, 80 },
> > +       .hback_porch = { 190, 190, 190 },
> > +       .hsync_len = { 60, 60, 60 },
> > +       .vactive = { 1080, 1080, 1080 },
> > +       .vfront_porch = { 6, 6, 6 },
> > +       .vback_porch = { 38, 38, 38 },
> > +       .vsync_len = { 8, 8, 8 },
> > +       .flags = DISPLAY_FLAGS_VSYNC_LOW | DISPLAY_FLAGS_HSYNC_LOW,
> > +};
> > +
> > +static const struct panel_desc innolux_n140hca_eac = {
> > +       .timings = &innolux_n140hca_eac_timing,
> > +       .num_timings = 1,
> > +       .bpc = 6,
> > +       .size = {
> > +               .width = 309,
> > +               .height = 174,
> > +       },
> > +};
> > +
> >  static const struct drm_display_mode innolux_p120zdg_bf1_mode = {
> >         .clock = 206016,
> >         .hdisplay = 2160,
> > @@ -1750,6 +1773,9 @@ static const struct of_device_id
> platform_of_match[] = {
> >         }, {
> >                 .compatible = "innolux,n125hce-gn1",
> >                 .data = &innolux_n125hce_gn1,
> > +       }, {
> > +               .compatible = "innolux,n140hca-eac",
> > +               .data = &innolux_n140hca_eac,
> >         }, {
> >                 .compatible = "innolux,p120zdg-bf1",
> >                 .data = &innolux_p120zdg_bf1,
> > --
> > 2.25.1
> >
>

--000000000000297ef505d8475a64
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Hsin-Yi,<div><br></div><div>Got it,=C2=A0thanks</div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Fri, 18 Feb 2022 at 17:01, Hsin-Yi Wang &lt;<a href=3D"mailto:hsinyi@chrom=
ium.org">hsinyi@chromium.org</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">On Fri, Feb 18, 2022 at 2:36 PM Rex Nie &lt;<a =
href=3D"mailto:rexnie3@gmail.com" target=3D"_blank">rexnie3@gmail.com</a>&g=
t; wrote:<br>
&gt;<br>
&gt; innolux,n140hca-eac is a eDP-based LCD panel. This panel has 1920x1080=
<br>
&gt; resolution in 14-inch TFT panel.<br>
&gt;<br>
&gt; Signed-off-by: Rex Nie &lt;<a href=3D"mailto:rexnie3@gmail.com" target=
=3D"_blank">rexnie3@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../display/panel/innolux,n140hca-eac.yaml=C2=A0 =C2=A0 | 43 +++=
++++++++++++++++<br>
&gt;=C2=A0 drivers/gpu/drm/panel/panel-edp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 26 +++++++++++<br>
&gt;=C2=A0 2 files changed, 69 insertions(+)<br>
&gt;=C2=A0 create mode 100644 Documentation/devicetree/bindings/display/pan=
el/innolux,n140hca-eac.yaml<br>
&gt;<br>
Hi Rex,<br>
<br>
Please split yaml and driver into different patches.<br>
You don&#39;t need to create a new binding for innolux,n140hca-eac.yaml.<br=
>
You can add the compatible into panel-simple.yaml. Check<br>
innolux,n125hce-gn1 for example.<br>
<br>
&gt; diff --git a/Documentation/devicetree/bindings/display/panel/innolux,n=
140hca-eac.yaml b/Documentation/devicetree/bindings/display/panel/innolux,n=
140hca-eac.yaml<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..5493e383c97c<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/devicetree/bindings/display/panel/innolux,n140hca-=
eac.yaml<br>
&gt; @@ -0,0 +1,43 @@<br>
&gt; +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)<br>
&gt; +%YAML 1.2<br>
&gt; +---<br>
&gt; +$id: <a href=3D"http://devicetree.org/schemas/display/panel/innolux,n=
140hca-eac.yaml#" rel=3D"noreferrer" target=3D"_blank">http://devicetree.or=
g/schemas/display/panel/innolux,n140hca-eac.yaml#</a><br>
&gt; +$schema: <a href=3D"http://devicetree.org/meta-schemas/core.yaml#" re=
l=3D"noreferrer" target=3D"_blank">http://devicetree.org/meta-schemas/core.=
yaml#</a><br>
&gt; +<br>
&gt; +title: Innolux N140HCA-EAC 14 inch eDP 1080p display panel<br>
&gt; +<br>
&gt; +maintainers:<br>
&gt; +=C2=A0 - Sandeep Panda &lt;<a href=3D"mailto:spanda@codeaurora.org" t=
arget=3D"_blank">spanda@codeaurora.org</a>&gt;<br>
&gt; +=C2=A0 - Douglas Anderson &lt;<a href=3D"mailto:dianders@chromium.org=
" target=3D"_blank">dianders@chromium.org</a>&gt;<br>
&gt; +<br>
&gt; +allOf:<br>
&gt; +=C2=A0 - $ref: panel-common.yaml#<br>
&gt; +<br>
&gt; +properties:<br>
&gt; +=C2=A0 compatible:<br>
&gt; +=C2=A0 =C2=A0 const: innolux,n140hca-eac<br>
&gt; +<br>
&gt; +=C2=A0 enable-gpios: true<br>
&gt; +=C2=A0 power-supply: true<br>
&gt; +=C2=A0 backlight: true<br>
&gt; +=C2=A0 no-hpd: true<br>
&gt; +<br>
&gt; +required:<br>
&gt; +=C2=A0 - compatible<br>
&gt; +=C2=A0 - power-supply<br>
&gt; +<br>
&gt; +additionalProperties: false<br>
&gt; +<br>
&gt; +examples:<br>
&gt; +=C2=A0 - |<br>
&gt; +=C2=A0 =C2=A0 #include &lt;dt-bindings/gpio/gpio.h&gt;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 panel_edp: panel-edp {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;innolux,n140hca-eac&=
quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 enable-gpios =3D &lt;&amp;pio 96 GPIO_ACT=
IVE_HIGH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 power-supply =3D &lt;&amp;pp3300_disp_x&g=
t;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 backlight =3D &lt;&amp;backlight_lcd0&gt;=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 no-hpd;<br>
&gt; +=C2=A0 =C2=A0 };<br>
&gt; +<br>
&gt; +...<br>
&gt; diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel=
/panel-edp.c<br>
&gt; index f7bfcf63d48e..f5f9c9cb26ba 100644<br>
&gt; --- a/drivers/gpu/drm/panel/panel-edp.c<br>
&gt; +++ b/drivers/gpu/drm/panel/panel-edp.c<br>
&gt; @@ -1330,6 +1330,29 @@ static const struct panel_desc innolux_n125hce_=
gn1 =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt; +static const struct display_timing innolux_n140hca_eac_timing =3D {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.pixelclock =3D { 72600000, 76420000, 8024=
0000 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.hactive =3D { 1920, 1920, 1920 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.hfront_porch =3D { 80, 80, 80 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.hback_porch =3D { 190, 190, 190 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.hsync_len =3D { 60, 60, 60 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.vactive =3D { 1080, 1080, 1080 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.vfront_porch =3D { 6, 6, 6 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.vback_porch =3D { 38, 38, 38 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.vsync_len =3D { 8, 8, 8 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.flags =3D DISPLAY_FLAGS_VSYNC_LOW | DISPL=
AY_FLAGS_HSYNC_LOW,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const struct panel_desc innolux_n140hca_eac =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.timings =3D &amp;innolux_n140hca_eac_timi=
ng,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.num_timings =3D 1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.bpc =3D 6,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.size =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.width =3D 309=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.height =3D 17=
4,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +};<br>
&gt; +<br>
&gt;=C2=A0 static const struct drm_display_mode innolux_p120zdg_bf1_mode =
=3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.clock =3D 206016,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.hdisplay =3D 2160,<br>
&gt; @@ -1750,6 +1773,9 @@ static const struct of_device_id platform_of_mat=
ch[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}, {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.compatib=
le =3D &quot;innolux,n125hce-gn1&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data =3D=
 &amp;innolux_n125hce_gn1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}, {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.compatible =
=3D &quot;innolux,n140hca-eac&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data =3D &amp=
;innolux_n140hca_eac,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}, {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.compatib=
le =3D &quot;innolux,p120zdg-bf1&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data =3D=
 &amp;innolux_p120zdg_bf1,<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
</blockquote></div>

--000000000000297ef505d8475a64--

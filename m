Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D05476A0A90
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 14:34:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 597E110E4BB;
	Thu, 23 Feb 2023 13:34:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B79A410E4BB
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 13:34:29 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id f9so5655272iox.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 05:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NFPYneV5a7FyDhPpLHSRMx4daqDtbK5EYDB2kgMvqfY=;
 b=VdRHF7Gh+LkT2yca5G9XVAJWwW/yWc1qqxByPUi7/j797KjTdsWiWzdidkavuI5cjY
 epvFYDuIp8c/rMkq2Fb9jtxB8VQJk3kAJlLak6Tk3CyMk00Dy9dhmOGUaiKHqxaGODTS
 2A3RlocJGCMiOelzBDBzxkmFrX/tTRzX0llqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NFPYneV5a7FyDhPpLHSRMx4daqDtbK5EYDB2kgMvqfY=;
 b=os/xtSAG6CVdjM3OFebE/HbnLlCNMivk37MSfJRBGSSDczCgJbOTZSeZP2sLF8yWL5
 mjeIrzovnOCUBICtpq4Z3tOJIwa1B5ud6nZdNE2t0PPWSc5cmCsKL5wDDreI4k+glgV8
 K3vIRlCEDu53+SDnsMcViTmFMRxwFaE9uPZmwM36+BNT8VdF1XxaF2WyknLOZQ9PtCXd
 z4kkIh6pK9GVlUyYpzfGdjNkw7j3zTMxpIANUGmgkeqdtQMpRArVJ1CRNca152Hm4tKF
 dOPcwDcIt53mDE1YI+EgD+3cH6gmyG1I4DSkis6iA27Ag/onx8LnlQ7zhoPRUceceJDc
 HTtg==
X-Gm-Message-State: AO0yUKXXvLlz7NKORYGVv3mOqSJCiLgEmktmkl2/Vb/VFvCmwsyZfmAm
 TZ0NO+4ypileTQ8vx/D+MeD1E6O6dAA5uTniTO0Eqw==
X-Google-Smtp-Source: AK7set+0nwS/5l73f+njQAR7lRNmoFMQ0mBDx0ncZunjJvu3/seEQajknB/v+c1QzryEhP7mLgAq86fzBstgy+XAi40=
X-Received: by 2002:a02:7a19:0:b0:3e5:4c9d:6e11 with SMTP id
 a25-20020a027a19000000b003e54c9d6e11mr1315024jac.2.1677159268441; Thu, 23 Feb
 2023 05:34:28 -0800 (PST)
MIME-Version: 1.0
References: <20230218111712.2380225-1-treapking@chromium.org>
 <20230218111712.2380225-2-treapking@chromium.org>
 <20230221154124.GA2584323-robh@kernel.org>
In-Reply-To: <20230221154124.GA2584323-robh@kernel.org>
From: Pin-yen Lin <treapking@chromium.org>
Date: Thu, 23 Feb 2023 21:34:17 +0800
Message-ID: <CAEXTbpeGaS+qFY_fBSVgA_0_p+DdmkWZO21pT3eo4RfcVg_BjA@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: display: bridge: Add ddc-i2c-bus for
 anx7688
To: Rob Herring <robh@kernel.org>
Content-Type: multipart/alternative; boundary="0000000000006d76e005f55e12ae"
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
 Nicolas Boichat <drinkcat@chromium.org>, Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Benson Leung <bleung@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Guenter Roeck <groeck@chromium.org>, devicetree@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, chrome-platform@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000006d76e005f55e12ae
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

After some internal discussions, we decided to drop this series because the
driver is trying to do runtime routing of the display signals, which is not
supported by the current DRM system, even if we can describe the design in
the device tree. I'm explaining our use case as a record, and I can follow
up on the mtk_hdmi.c change if anyone is interested.

The more detailed schematics looks like:
   +----------+    +----------------+    +-----------+
   |   MTK    |    |                |    |   HDMI    |
   |   HDMI   +--->|    TS3DV642    +--->| connector |
   |  bridge  |    |                |    +-----------+
   +----------+    |                |
                   |    HDMI MUX    |    +-------------+
                   |                |    |  anx7688    |   +-----------+
   +----------+    |                |    |  HDMI to DP |   |  USB-C    |
   | cros EC  +--->|                +--->|  bridge     +-->| connector |
   +----------+    +----------------+    +-------------+   +-----------+

The TS3DV642 HDMI MUX is controlled by the CrOS EC to switch the HDMI
signal between two output ports, and the generic-display-mux driver was
trying to control the downstream bridges according to the GPIO status
reported by EC. However, as far as I know, this kind of runtime routing is
not supported by DRM.

And, it can work fine if we only describe the following design in DT:

  +---------+   +-------------+   +-----------+
  |  MTK    |   |  anx7688    |   |  USB-C    |
  |  HDMI   +-->|  HDMI to DP +-->| connector |
  |  bridge |   |  bridge     |   +-----------+
  +---------+   +-------------+

This can work because the anx7688 driver won't reject any display modes
when the DP lane count is 0 ([1]), which is true when the HDMI connector is
used.

Thanks for your time for reviewing this series and sorry for not explaining
everything clearly at the beginning.

[1]:
https://elixir.bootlin.com/linux/v6.2/source/drivers/gpu/drm/bridge/cros-ec-anx7688.c#L87

Regards,
Pin-yen


On Tue, Feb 21, 2023 at 11:41 PM Rob Herring <robh@kernel.org> wrote:

> On Sat, Feb 18, 2023 at 07:17:08PM +0800, Pin-yen Lin wrote:
> > Introduce a optional "ddc-i2c-bus" property for anx7688 bridge. This
> > allows the bridge to register a .get_edid callback.
>
> What's .get_edid? This is a binding and is independent of Linux.
>
> >
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > ---
> >
> > Changes in v3:
> > - New in v3
> >
> >  .../bindings/display/bridge/google,cros-ec-anx7688.yaml      | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git
> a/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
> b/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
> > index a44d025d33bd..9d5ce8172e88 100644
> > ---
> a/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
> > +++
> b/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
> > @@ -25,6 +25,10 @@ properties:
> >      maxItems: 1
> >      description: I2C address of the device.
> >
> > +  ddc-i2c-bus:
> > +    description: phandle link to the I2C controller used for DDC EDID
> probing
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +
>
> No, this belongs in the connector node. The DDC signals are routed to
> the connector, not the bridge chip.
>
> Rob
>

--0000000000006d76e005f55e12ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><font face=3D"monospace">Hi Rob,<br><br>After some interna=
l discussions, we decided to drop this series because the driver is trying =
to do runtime routing of the display signals, which is not supported by the=
 current DRM system, even if we can describe the design in the device tree.=
 I&#39;m explaining our use case as a record, and I can follow up on the mt=
k_hdmi.c change if anyone is interested.<br><br>The more detailed schematic=
s looks like:<br>=C2=A0 =C2=A0+----------+ =C2=A0 =C2=A0+----------------+ =
=C2=A0 =C2=A0+-----------+<br>=C2=A0 =C2=A0| =C2=A0 MTK =C2=A0 =C2=A0| =C2=
=A0 =C2=A0| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0=
 =C2=A0| =C2=A0 HDMI =C2=A0 =C2=A0|<br>=C2=A0 =C2=A0| =C2=A0 HDMI =C2=A0 +-=
--&gt;| =C2=A0 =C2=A0TS3DV642 =C2=A0 =C2=A0+---&gt;| connector |<br>=C2=A0 =
=C2=A0| =C2=A0bridge =C2=A0| =C2=A0 =C2=A0| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A0+-----------+<br>=C2=A0 =C2=A0+-----=
-----+ =C2=A0 =C2=A0| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| =C2=A0 =C2=A0HDMI MUX =C2=A0 =C2=A0| =C2=A0 =C2=A0+-------------+<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A0| =C2=A0=
anx7688 =C2=A0 =C2=A0| =C2=A0 +-----------+<br>=C2=A0 =C2=A0+----------+ =
=C2=A0 =C2=A0| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 =C2=A0| =C2=A0HDMI to DP | =C2=A0 | =C2=A0USB-C =C2=A0 =C2=A0|<br>=C2=
=A0 =C2=A0| cros EC =C2=A0+---&gt;| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0+---&gt;| =C2=A0bridge =C2=A0 =C2=A0 +--&gt;| connector |<=
br>=C2=A0 =C2=A0+----------+ =C2=A0 =C2=A0+----------------+ =C2=A0 =C2=A0+=
-------------+ =C2=A0 +-----------+<br><br>The TS3DV642 HDMI MUX is control=
led by the CrOS EC to switch the HDMI signal between two output ports, and =
the generic-display-mux driver was trying to control the downstream bridges=
 according to the GPIO status reported by EC. However, as far as I know, th=
is kind of runtime routing is not supported by DRM.</font><div><font face=
=3D"monospace"><br></font></div><div><font face=3D"monospace">And, it can w=
ork fine if we only describe the following design in DT:<br><br>=C2=A0 +---=
------+ =C2=A0 +-------------+ =C2=A0 +-----------+<br>=C2=A0 | =C2=A0MTK =
=C2=A0 =C2=A0| =C2=A0 | =C2=A0anx7688 =C2=A0 =C2=A0| =C2=A0 | =C2=A0USB-C =
=C2=A0 =C2=A0|<br>=C2=A0 | =C2=A0HDMI =C2=A0 +--&gt;| =C2=A0HDMI to DP +--&=
gt;| connector |<br>=C2=A0 | =C2=A0bridge | =C2=A0 | =C2=A0bridge =C2=A0 =
=C2=A0 | =C2=A0 +-----------+<br>=C2=A0 +---------+ =C2=A0 +-------------+<=
br><br>This can work because the anx7688 driver won&#39;t reject any displa=
y modes when the DP lane count is 0 ([1]), which is true when the HDMI conn=
ector is used.<br><br>Thanks for your time for reviewing this series and so=
rry for not explaining everything clearly at the beginning.</font></div><di=
v><font face=3D"monospace"><br></font></div><div><font face=3D"monospace">[=
1]:=C2=A0<a href=3D"https://elixir.bootlin.com/linux/v6.2/source/drivers/gp=
u/drm/bridge/cros-ec-anx7688.c#L87">https://elixir.bootlin.com/linux/v6.2/s=
ource/drivers/gpu/drm/bridge/cros-ec-anx7688.c#L87</a><br><br>Regards,<br>P=
in-yen</font><br></div></div><br><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Tue, Feb 21, 2023 at 11:41 PM Rob Herring &lt=
;<a href=3D"mailto:robh@kernel.org">robh@kernel.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">On Sat, Feb 18, 2023 at =
07:17:08PM +0800, Pin-yen Lin wrote:<br>
&gt; Introduce a optional &quot;ddc-i2c-bus&quot; property for anx7688 brid=
ge. This<br>
&gt; allows the bridge to register a .get_edid callback.<br>
<br>
What&#39;s .get_edid? This is a binding and is independent of Linux.<br>
<br>
&gt; <br>
&gt; Signed-off-by: Pin-yen Lin &lt;<a href=3D"mailto:treapking@chromium.or=
g" target=3D"_blank">treapking@chromium.org</a>&gt;<br>
&gt; ---<br>
&gt; <br>
&gt; Changes in v3:<br>
&gt; - New in v3<br>
&gt; <br>
&gt;=C2=A0 .../bindings/display/bridge/google,cros-ec-anx7688.yaml=C2=A0 =
=C2=A0 =C2=A0 | 5 +++++<br>
&gt;=C2=A0 1 file changed, 5 insertions(+)<br>
&gt; <br>
&gt; diff --git a/Documentation/devicetree/bindings/display/bridge/google,c=
ros-ec-anx7688.yaml b/Documentation/devicetree/bindings/display/bridge/goog=
le,cros-ec-anx7688.yaml<br>
&gt; index a44d025d33bd..9d5ce8172e88 100644<br>
&gt; --- a/Documentation/devicetree/bindings/display/bridge/google,cros-ec-=
anx7688.yaml<br>
&gt; +++ b/Documentation/devicetree/bindings/display/bridge/google,cros-ec-=
anx7688.yaml<br>
&gt; @@ -25,6 +25,10 @@ properties:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 maxItems: 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 description: I2C address of the device.<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 ddc-i2c-bus:<br>
&gt; +=C2=A0 =C2=A0 description: phandle link to the I2C controller used fo=
r DDC EDID probing<br>
&gt; +=C2=A0 =C2=A0 $ref: /schemas/types.yaml#/definitions/phandle<br>
&gt; +<br>
<br>
No, this belongs in the connector node. The DDC signals are routed to <br>
the connector, not the bridge chip.<br>
<br>
Rob<br>
</blockquote></div>

--0000000000006d76e005f55e12ae--

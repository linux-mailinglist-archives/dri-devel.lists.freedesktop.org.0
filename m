Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBFF67D48E
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 19:45:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B744810E96F;
	Thu, 26 Jan 2023 18:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com
 [IPv6:2607:f8b0:4864:20::a2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A536F10E96F
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 18:45:45 +0000 (UTC)
Received: by mail-vk1-xa2c.google.com with SMTP id z190so1333549vka.4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 10:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=criticallink.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NrrW4TQZzGQdb3jYIROt+9YNoymm8nup5fiPcc6UxMs=;
 b=STriHvBP+/hCB3q2D2fl9kQyqOvwN2xYipBgXoSFcI4myWes5DJBww4dc4HdKC13HD
 LvXfTdVyIiU6YahNlPBrozZC+0LNd1+1JFHOcauwwGYCf/SguqmhPOV0uBEXDBn6F/9d
 BALJfgZv4lBaXSjSL692MZzMvoqfyfe3olTYg+i8luuPsUzVedVVGGjl67SB98MSjPyl
 SxH/7gMJTJy5Ds8PnG0kBmIQgGorshCO7AbjWZobJEYAuCwBlEdjMWgnLKjxur4PhXyj
 IMTiHqB1wOXyIp+39z/tFx3Fth9PY/nabaU30qOCaWfelTl11v4naxrA3MVEUa1/u5Ov
 Df/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NrrW4TQZzGQdb3jYIROt+9YNoymm8nup5fiPcc6UxMs=;
 b=B4zJJU4hgyZhj2dvFscZAHyhtKrYGIcI7VcJB2m9Nmz+uuDjfIQkp71fdHA/axtAdV
 M+BpWGl7NULcxEcmfttXtWL/E1gN4egbcjZeYq5ODp3IkEtwISd5QbxsL/AugM84IyHQ
 L+UqitS4JEwtaTMAqhN1kvdwEjC11I0xQQd9Kttsle74VlZ8nXcM08rQczZNLtg9J8T6
 Nb0xn7u/kF9Eh6YCfPogYikMN21k/eWUa1EwuVVLirytHr5kcdK4gWuVtqT/4nx5GbS/
 KzsrncCbaaE4DyMXif9eoIgHYKFRTTdasI1GkRLRv4qKv6U9ofPg/hJ0bkRcFjw6pW3i
 AJkg==
X-Gm-Message-State: AO0yUKUtXONW9IHM6n0AjxYeysHjlnrQv8LSPXv6IuTiPjqIcd5ES4Dr
 hjlrjSqbjy6JzqFsN0GO/rg9E6dqENC4wSUYtIn4Fd28Ww2yS7qx
X-Google-Smtp-Source: AK7set+yo21JikRz1wt3RGlq72GPCgiaA8z0g6EK4Erk5vWc/C+Sk9YKYkVOjA/TA9ybvznHXMxEhwuu4VW7Bm36i2U=
X-Received: by 2002:a05:6122:b48:b0:3e6:c869:3517 with SMTP id
 8-20020a0561220b4800b003e6c8693517mr754297vko.36.1674758744540; Thu, 26 Jan
 2023 10:45:44 -0800 (PST)
MIME-Version: 1.0
References: <20230125-tfp410_i2c-v1-0-66a4d4e390b7@criticallink.com>
 <20230125-tfp410_i2c-v1-2-66a4d4e390b7@criticallink.com>
 <c851113d-c243-c883-f038-3e61a5b8b066@linaro.org>
In-Reply-To: <c851113d-c243-c883-f038-3e61a5b8b066@linaro.org>
From: Jon Cormier <jcormier@criticallink.com>
Date: Thu, 26 Jan 2023 13:45:33 -0500
Message-ID: <CADL8D3YGgf38agCfLO=qVAvNFoCzoQ582_SkaWbQ24eiWFOuQQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] DRM: BRIDGE: TFP410: Support basic I2C interface
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000000d9dee05f32f2898"
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

--0000000000000d9dee05f32f2898
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 26, 2023 at 10:41 AM Krzysztof Kozlowski <
krzysztof.kozlowski@linaro.org> wrote:

> On 25/01/2023 22:09, Jonathan Cormier wrote:
> > From: Michael Williamson <michael.williamson@criticallink.com>
> >
> > The TFP410 driver does not support I2C.  As such, the device remains in
> > Power Down if the I2C is enabled by the bootstrap pins.
> >
> > Add basic support for the I2C interface, and provide support to take
> > the device out of power down when enabled.  Also read the bootstrap mode
> > pins via the CTL_1_MODE register when using the I2C bus.
> >
> > Signed-off-by: Michael Williamson <michael.williamson@criticallink.com>
> > Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
> > ---
> >  drivers/gpu/drm/bridge/ti-tfp410.c | 95
> +++++++++++++++++++++++++++-----------
> >  1 file changed, 68 insertions(+), 27 deletions(-)
>
> Use subject prefixes matching the subsystem (which you can get for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching).
>
> hint: it is entirely different.
>
It's caps vs non caps so not entirely different.  But it should be
lowercase so I will fix that.   Note there does seem to be some
disagreement between "drm: bridge" and "drm/bridge" in the commits.  The
later appears slightly more often, especially recently so I will go with
that.

>
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c
> b/drivers/gpu/drm/bridge/ti-tfp410.c
> > index b9635abbad16..323a6d9ed188 100644
> > --- a/drivers/gpu/drm/bridge/ti-tfp410.c
> > +++ b/drivers/gpu/drm/bridge/ti-tfp410.c
> > @@ -6,6 +6,7 @@
> >
> >  #include <linux/gpio/consumer.h>
> >  #include <linux/i2c.h>
> > +#include <linux/regmap.h>
> >  #include <linux/media-bus-format.h>
> >  #include <linux/module.h>
> >  #include <linux/of_graph.h>
> > @@ -21,6 +22,20 @@
>
> (...)
>
> >
> >  static void tfp410_i2c_remove(struct i2c_client *client)
> > @@ -408,7 +449,7 @@ MODULE_DEVICE_TABLE(i2c, tfp410_i2c_ids);
> >  static struct i2c_driver tfp410_i2c_driver = {
> >       .driver = {
> >               .name   = "tfp410",
> > -             .of_match_table = of_match_ptr(tfp410_match),
> > +             .of_match_table = tfp410_match,
>
Dropping

>
> This does not look related to the patch.
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

--0000000000000d9dee05f32f2898
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 26, 2023 at 10:41 AM Krzy=
sztof Kozlowski &lt;<a href=3D"mailto:krzysztof.kozlowski@linaro.org">krzys=
ztof.kozlowski@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On 25/01/2023 22:09, Jonathan Cormier wrote:<br>
&gt; From: Michael Williamson &lt;<a href=3D"mailto:michael.williamson@crit=
icallink.com" target=3D"_blank">michael.williamson@criticallink.com</a>&gt;=
<br>
&gt; <br>
&gt; The TFP410 driver does not support I2C.=C2=A0 As such, the device rema=
ins in<br>
&gt; Power Down if the I2C is enabled by the bootstrap pins.<br>
&gt; <br>
&gt; Add basic support for the I2C interface, and provide support to take<b=
r>
&gt; the device out of power down when enabled.=C2=A0 Also read the bootstr=
ap mode<br>
&gt; pins via the CTL_1_MODE register when using the I2C bus.<br>
&gt; <br>
&gt; Signed-off-by: Michael Williamson &lt;<a href=3D"mailto:michael.willia=
mson@criticallink.com" target=3D"_blank">michael.williamson@criticallink.co=
m</a>&gt;<br>
&gt; Signed-off-by: Jonathan Cormier &lt;<a href=3D"mailto:jcormier@critica=
llink.com" target=3D"_blank">jcormier@criticallink.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/bridge/ti-tfp410.c | 95 ++++++++++++++++++++++++=
+++-----------<br>
&gt;=C2=A0 1 file changed, 68 insertions(+), 27 deletions(-)<br>
<br>
Use subject prefixes matching the subsystem (which you can get for<br>
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory<br>
your patch is touching).<br>
<br>
hint: it is entirely different.<br></blockquote><div>It&#39;s caps vs non c=
aps so not entirely different.=C2=A0 But it should be lowercase so I will f=
ix that. =C2=A0 Note there does seem to be some disagreement between &quot;=
drm: bridge&quot; and &quot;drm/bridge&quot; in the commits.=C2=A0 The late=
r appears slightly more often, especially recently so I will go with that.<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/brid=
ge/ti-tfp410.c<br>
&gt; index b9635abbad16..323a6d9ed188 100644<br>
&gt; --- a/drivers/gpu/drm/bridge/ti-tfp410.c<br>
&gt; +++ b/drivers/gpu/drm/bridge/ti-tfp410.c<br>
&gt; @@ -6,6 +6,7 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #include &lt;linux/gpio/consumer.h&gt;<br>
&gt;=C2=A0 #include &lt;linux/i2c.h&gt;<br>
&gt; +#include &lt;linux/regmap.h&gt;<br>
&gt;=C2=A0 #include &lt;linux/media-bus-format.h&gt;<br>
&gt;=C2=A0 #include &lt;linux/module.h&gt;<br>
&gt;=C2=A0 #include &lt;linux/of_graph.h&gt;<br>
&gt; @@ -21,6 +22,20 @@<br>
<br>
(...)<br>
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static void tfp410_i2c_remove(struct i2c_client *client)<br>
&gt; @@ -408,7 +449,7 @@ MODULE_DEVICE_TABLE(i2c, tfp410_i2c_ids);<br>
&gt;=C2=A0 static struct i2c_driver tfp410_i2c_driver =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.driver =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=
=A0=3D &quot;tfp410&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_table =3D o=
f_match_ptr(tfp410_match),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_table =3D t=
fp410_match,<br></blockquote><div>Dropping <br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
This does not look related to the patch.<br>
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

--0000000000000d9dee05f32f2898--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78927571640
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 11:56:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A3B93F6F;
	Tue, 12 Jul 2022 09:56:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E8D93F53
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 09:56:05 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id bp15so3098407ejb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 02:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bh4iKZtlZ8nQ2Vp/+gKB5MaxwpA7+oVlUPoQ3ptHwKg=;
 b=ZYDorqT823gznoKmkmlq8whQ2HPrhRUkQlWGw2FywkaLQkJ3s7RLZ/9joUYH2Nc/iK
 Z5HE+TUYtmGB374HYCGnozEBtz3MMWM67lQS2EVDjv9m4usL71f9tQcVkCopuWSk1ZCf
 qJfPbCq2yhdrjVJRrc/qRKw4n0OF9H1qi6jqHkDNyU5BIPtJ2ljKduwxS8iENdHcmDnN
 xwhOIDd5oSKF+O8gNTy/61qv+OO4AZhcCkbb/bcxNrmtnOHJLXgq2xUu6vuwrTSmyniE
 jXKRWKhMM/LxNour+5sv+JTkrlmURoLYQVw8zhoKPTSKdDcGOfs0fK513+5TEHWsDiXf
 eZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bh4iKZtlZ8nQ2Vp/+gKB5MaxwpA7+oVlUPoQ3ptHwKg=;
 b=yP1VMp4/ToqbzR9WKjmXvbCUA0Ypo579DOPiBbEieHdtM+9y+qWFtZPfYapXHH668K
 Sp02iup/KiPaqAYLPxsZNpvuCxmYtUlIAT+rGcloVgZXePnq5vMohOZNFXt1TzvsYB7K
 Cj9wxSnF+r1p+1pcsA86xu6RkkI3XejXIRrDf6J0pSVva0WZPFcZU9LDo0K6oHvwKJZh
 +k99I3Glm6t0gEweViqhF2gqBmD+STJ5e3doamnMaSVGowhpnUeCihQ/yda5Uh+4mGx/
 rLWr3SO76925OEnxa0dLXY75rltbgLrl73rc4/DhvVla2APvSadgy3h7Pcqq2VVlTroA
 RZtQ==
X-Gm-Message-State: AJIora8CGm5eiX1dbVQtUE72sDRbWClObfJWa4r39trBv44QmxjqgoqJ
 nHA3vhJDUowpWNQI0kaFWqUs36zQaGbIt3VhgKPXfw==
X-Google-Smtp-Source: AGRyM1tkV07Atp5mfAG5MUgEXrEQrlLFv4q7CFZSVKbqR8wGVwXUUl5AP9CPSdgYIXYNL3a1cvJve8zo9OYjtWQ8USA=
X-Received: by 2002:a17:907:7b87:b0:726:c868:cf38 with SMTP id
 ne7-20020a1709077b8700b00726c868cf38mr22717715ejc.580.1657619764252; Tue, 12
 Jul 2022 02:56:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220707080600.49041-1-allen.chen@ite.com.tw>
 <20220707080600.49041-2-allen.chen@ite.com.tw>
 <CAG3jFystTA3sD2nWJHPYq39WxRwjVt4qj2DMDk2Khh1kR=8ntg@mail.gmail.com>
 <CAGXv+5HcU6paJJzm4nLe6mmSYUaR-pp5LBsy9aev0RRX+FKmcg@mail.gmail.com>
In-Reply-To: <CAGXv+5HcU6paJJzm4nLe6mmSYUaR-pp5LBsy9aev0RRX+FKmcg@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 12 Jul 2022 11:55:53 +0200
Message-ID: <CAG3jFytVYWxn53AB-VTFZnp7ByG92PkLF+HDp95QQ6oJxryBqw@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/bridge: it6505: Modified power sequence
To: Chen-Yu Tsai <wenst@chromium.org>
Content-Type: multipart/alternative; boundary="00000000000038abbe05e398ad41"
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
Cc: Kenneth Hung <Kenneth.Hung@ite.com.tw>, Pin-yen Lin <treapking@google.com>,
 David Airlie <airlied@linux.ie>, allen <allen.chen@ite.com.tw>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Pin-Yen Lin <treapking@chromium.org>,
 Hermes Wu <Hermes.Wu@ite.com.tw>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000038abbe05e398ad41
Content-Type: text/plain; charset="UTF-8"

Hi,




On Tue, Jul 12, 2022, 11:41 Chen-Yu Tsai <wenst@chromium.org> wrote:

> On Tue, Jul 12, 2022 at 4:08 PM Robert Foss <robert.foss@linaro.org>
> wrote:
> >
> > Hi Allen,
> >
> > On Thu, 7 Jul 2022 at 10:06, allen <allen.chen@ite.com.tw> wrote:
> > >
> > > From: allen chen <allen.chen@ite.com.tw>
> > >
> > > Change power sequence to meet it6505 data sheet requirement when boot
> on.
> > >
> > > Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
> > > Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
> > >
> > > ---
> > >  drivers/gpu/drm/bridge/ite-it6505.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/ite-it6505.c
> b/drivers/gpu/drm/bridge/ite-it6505.c
> > > index 2d119e3016b3..aa5e0aa1af85 100644
> > > --- a/drivers/gpu/drm/bridge/ite-it6505.c
> > > +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> > > @@ -3029,7 +3029,7 @@ static int it6505_init_pdata(struct it6505
> *it6505)
> > >                 return PTR_ERR(pdata->ovdd);
> > >         }
> > >
> > > -       pdata->gpiod_reset = devm_gpiod_get(dev, "reset",
> GPIOD_OUT_HIGH);
> > > +       pdata->gpiod_reset = devm_gpiod_get(dev, "reset",
> GPIOD_OUT_LOW);
> >
> > Making this change is problematic since it requires a corresponding
> > change in all of the device trees that use this device. It's against
> > policy to change this interface after it has been introduced.
> >
> > Unless anyone thinks otherwise, I would like to see this patch dropped.
>
> I think you're confusing GPIO_ACTIVE_{LOW,HIGH} flags in the device tree
> vs GPIOD_OUT_{LOW,HIGH}, which just sets the "default" state the GPIO
> should be in when it is requested.
>
> This change doesn't impact the device tree.
>

Thanks ChenYu, you are 100% right.


Reviewed-by: Robert Foss <robert.foss@linaro.org>


>
> Regards
> ChenYu
>
> > >         if (IS_ERR(pdata->gpiod_reset)) {
> > >                 dev_err(dev, "gpiod_reset gpio not found");
> > >                 return PTR_ERR(pdata->gpiod_reset);
> > > --
> > > 2.25.1
> > >
>

--00000000000038abbe05e398ad41
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi,<div dir=3D"auto"><br></div><div dir=3D"auto"><br=
></div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Tue, Jul 12, 2022, 11:41 Chen-Yu Tsai &lt;<a href=3D"mailto:wenst@c=
hromium.org">wenst@chromium.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">On Tue, Jul 12, 2022 at 4:08 PM Robert Foss &lt;<a href=3D"ma=
ilto:robert.foss@linaro.org" target=3D"_blank" rel=3D"noreferrer">robert.fo=
ss@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Allen,<br>
&gt;<br>
&gt; On Thu, 7 Jul 2022 at 10:06, allen &lt;<a href=3D"mailto:allen.chen@it=
e.com.tw" target=3D"_blank" rel=3D"noreferrer">allen.chen@ite.com.tw</a>&gt=
; wrote:<br>
&gt; &gt;<br>
&gt; &gt; From: allen chen &lt;<a href=3D"mailto:allen.chen@ite.com.tw" tar=
get=3D"_blank" rel=3D"noreferrer">allen.chen@ite.com.tw</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Change power sequence to meet it6505 data sheet requirement when =
boot on.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Pin-Yen Lin &lt;<a href=3D"mailto:treapking@chromi=
um.org" target=3D"_blank" rel=3D"noreferrer">treapking@chromium.org</a>&gt;=
<br>
&gt; &gt; Signed-off-by: Allen Chen &lt;<a href=3D"mailto:allen.chen@ite.co=
m.tw" target=3D"_blank" rel=3D"noreferrer">allen.chen@ite.com.tw</a>&gt;<br=
>
&gt; &gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 drivers/gpu/drm/bridge/ite-it6505.c | 2 +-<br>
&gt; &gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/dr=
m/bridge/ite-it6505.c<br>
&gt; &gt; index 2d119e3016b3..aa5e0aa1af85 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/bridge/ite-it6505.c<br>
&gt; &gt; +++ b/drivers/gpu/drm/bridge/ite-it6505.c<br>
&gt; &gt; @@ -3029,7 +3029,7 @@ static int it6505_init_pdata(struct it6505 =
*it6505)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retu=
rn PTR_ERR(pdata-&gt;ovdd);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0pdata-&gt;gpiod_reset =3D devm_gpiod_=
get(dev, &quot;reset&quot;, GPIOD_OUT_HIGH);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pdata-&gt;gpiod_reset =3D devm_gpiod_=
get(dev, &quot;reset&quot;, GPIOD_OUT_LOW);<br>
&gt;<br>
&gt; Making this change is problematic since it requires a corresponding<br=
>
&gt; change in all of the device trees that use this device. It&#39;s again=
st<br>
&gt; policy to change this interface after it has been introduced.<br>
&gt;<br>
&gt; Unless anyone thinks otherwise, I would like to see this patch dropped=
.<br>
<br>
I think you&#39;re confusing GPIO_ACTIVE_{LOW,HIGH} flags in the device tre=
e<br>
vs GPIOD_OUT_{LOW,HIGH}, which just sets the &quot;default&quot; state the =
GPIO<br>
should be in when it is requested.<br>
<br>
This change doesn&#39;t impact the device tree.<br></blockquote></div></div=
><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks ChenYu, you are 100% =
right.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Reviewed-by: Robert Foss &lt;<a href=3D"mailto:robert.foss@linar=
o.org">robert.foss@linaro.org</a>&gt;</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
<br>
Regards<br>
ChenYu<br>
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(pdata-&gt;gpiod_reset=
)) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_=
err(dev, &quot;gpiod_reset gpio not found&quot;);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retu=
rn PTR_ERR(pdata-&gt;gpiod_reset);<br>
&gt; &gt; --<br>
&gt; &gt; 2.25.1<br>
&gt; &gt;<br>
</blockquote></div></div></div>

--00000000000038abbe05e398ad41--

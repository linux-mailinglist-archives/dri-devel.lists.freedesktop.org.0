Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4728B56CEAF
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 13:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9465512B543;
	Sun, 10 Jul 2022 11:12:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13DB412B543
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 11:12:39 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id t1so977700lft.8
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 04:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FyXy5TjIeN2i2aopPk/0TcbFsrLrz+0mOcQvKieLAgs=;
 b=AVsBkVxSGjmMrlMgLlrP5/Og5M26fZ//6szKK+z5/y5TC3fuiy3PdEbAl4y9EAIfLl
 RwQw/wcfPUlcScjWyvRhl6NnTjRxSedfLzpacBoFTv6y8neq6+2A0VHAXUa51t3gMsCE
 6nhQEzmhZPYwXTtBhgzPtDlfUN/pMhVoSG2RkNIf4cXg4TWqdDRya04rtiNj0qWBGS3t
 ADBEva+Kc9OALVzTjELogwJIB3Ept5FOWn8/jFJiEx0jFBdPdsllAbIfdWWCclgb9jbp
 VmiGMLuDS5Fw6g7KUGnXx27l55TvM6RvIM4G705fmsuBurObPlON40b0O931Tls0Tk42
 Vmdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FyXy5TjIeN2i2aopPk/0TcbFsrLrz+0mOcQvKieLAgs=;
 b=pFWgu+HoDf/wuPJKeGI1A7IfOA+3lA4WLFNVM9inX41EI1J7B0ki8qh86pHmUtiJoy
 qcTQInu1YjPQ6iExRbQZUJMsSMSqKiHY2Y/VdHFUKEI5O1+jS5dOp6c5hZt62nc4Y7Hm
 2DVoAgNkx6esDE9nQeh149X22N3ZqY2N9EyC3/xn2uOruXxOc/Wb3DNdUMPGHxmSWV6m
 wqKmv8k9yccU8UwQ0/lF0yZeJHJj8f6CaVXx05HiZIl8XdUwOmcJ61R2ggO7faz9ZfbE
 7jvvOLBGkBJ8OiXkH1z2CvDH61jU5Gx9GeqA7ZgtnW77UG3yUCNJ8kn1ml4nWHzwsRxS
 np1g==
X-Gm-Message-State: AJIora/Zyf9VlRwMLXvYFqGagGhL6a3fzJRJWEEbuirb2lzC/zpF32tW
 +aS/QxlAVzm2L/b4RHWsBt46zW135T66q1icO3s=
X-Google-Smtp-Source: AGRyM1u0OGJS9PhIeRmEySxnDLxPd1zI7kCNJHCLtw/jwkLnbBxpxXt1oYS/9m8zYuakMD7chWQr/WZxl9Ac74CStHQ=
X-Received: by 2002:a05:6512:398e:b0:481:154b:a92 with SMTP id
 j14-20020a056512398e00b00481154b0a92mr9073036lfu.110.1657451557184; Sun, 10
 Jul 2022 04:12:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220709141136.58298-1-mollysophia379@gmail.com>
 <YsnpXU2w1wsXiGrs@ravnborg.org>
 <CAK0UmJBL9tj+XLa3GQHqk_gMHz9tZRoWEj=3G9zjNaPkZw9+5A@mail.gmail.com>
 <YsqmRzxlvdoK8iK8@ravnborg.org>
In-Reply-To: <YsqmRzxlvdoK8iK8@ravnborg.org>
From: Molly Sophia <mollysophia379@gmail.com>
Date: Sun, 10 Jul 2022 19:12:26 +0800
Message-ID: <CAK0UmJAwyNbjgz2tM1O+5twrDASk4bc3q9L-OqhF=KOSMK3Wxw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: Add Novatek NT35596S
 panel bindings
To: Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/alternative; boundary="0000000000004c68f705e371835a"
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
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000004c68f705e371835a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sam,
Thank you again for your support. I forgot that point, which is really
important to know.

    Molly

Sam Ravnborg <sam@ravnborg.org> =E4=BA=8E2022=E5=B9=B47=E6=9C=8810=E6=97=A5=
=E5=91=A8=E6=97=A5 18:13=E5=86=99=E9=81=93=EF=BC=9A

> Hi Molly,
>
> On Sun, Jul 10, 2022 at 02:19:41PM +0800, Molly Sophia wrote:
> > Hi Sam,
> >
> > Thanks for your suggestions.
> >
> > Sam Ravnborg <sam@ravnborg.org> =E4=BA=8E 2022=E5=B9=B47=E6=9C=8810=E6=
=97=A5=E5=91=A8=E6=97=A5 =E4=B8=8A=E5=8D=884:47=E5=86=99=E9=81=93=EF=BC=9A
> >
> > > Hi Molly,
> > >
> > > thanks for the quick response to the review comments.
> > >
> > > On Sat, Jul 09, 2022 at 10:11:35PM +0800, MollySophia wrote:
> > > > Add documentation for "novatek,nt35596s" panel.
> > > >
> > > > Signed-off-by: MollySophia <mollysophia379@gmail.com>
> > > The s-o-b needs your real name - guess the above is a concatenation o=
f
> > > first name and surname.
> > >
> > > The binding included in this patch fails the check:
> > > $ make DT_CHECKER_FLAGS=3D-m dt_binding_check
> > >
> > > You may need to run:
> > > $ pip3 install dtschema --upgrade
> > >
> > > Or you may have to install some dependencies first.
> > > The problem is that the patch is missing a "reset-gpios: true"
> > >
> > > On top of this I looked at the binding - and the description
> > > this is copied from is almost identical.
> > > So another approach would be to extend the existing binding like
> > > in the following.
> > >
> > > And this also gives a good hint that maybe this can be embedded in
> > > the existing driver - and there is no need for a new driver.
> > > Could you try to give this a spin and get back on this.
> > >
> >
> > That's reasonable. Actually, this driver was modified from
> > novatek,nt35596s, with different panel initialization commands, and it
> > seems easy to be embedded in
> > the existing driver. However, I wonder what the driver file name would
> > be...? "panel-novatek-nt35596s-nt36672a.c" or something else?
>
> Just keep the current driver name - we cannot embed all the supported HW
> in one driver name anyway. And then you do not break currents users in
> case they have hardwired the current driver name.
>
>         Sam
>

--0000000000004c68f705e371835a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Sam,<div>Thank you again for your support. I forgot tha=
t point, which is really important to know.</div><div><br></div><div>=C2=A0=
 =C2=A0 Molly</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">Sam Ravnborg &lt;<a href=3D"mailto:sam@ravnborg.org">sam=
@ravnborg.org</a>&gt; =E4=BA=8E2022=E5=B9=B47=E6=9C=8810=E6=97=A5=E5=91=A8=
=E6=97=A5 18:13=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">Hi Molly,<br>
<br>
On Sun, Jul 10, 2022 at 02:19:41PM +0800, Molly Sophia wrote:<br>
&gt; Hi Sam,<br>
&gt; <br>
&gt; Thanks for your suggestions.<br>
&gt; <br>
&gt; Sam Ravnborg &lt;<a href=3D"mailto:sam@ravnborg.org" target=3D"_blank"=
>sam@ravnborg.org</a>&gt; =E4=BA=8E 2022=E5=B9=B47=E6=9C=8810=E6=97=A5=E5=
=91=A8=E6=97=A5 =E4=B8=8A=E5=8D=884:47=E5=86=99=E9=81=93=EF=BC=9A<br>
&gt; <br>
&gt; &gt; Hi Molly,<br>
&gt; &gt;<br>
&gt; &gt; thanks for the quick response to the review comments.<br>
&gt; &gt;<br>
&gt; &gt; On Sat, Jul 09, 2022 at 10:11:35PM +0800, MollySophia wrote:<br>
&gt; &gt; &gt; Add documentation for &quot;novatek,nt35596s&quot; panel.<br=
>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: MollySophia &lt;<a href=3D"mailto:mollysophia=
379@gmail.com" target=3D"_blank">mollysophia379@gmail.com</a>&gt;<br>
&gt; &gt; The s-o-b needs your real name - guess the above is a concatenati=
on of<br>
&gt; &gt; first name and surname.<br>
&gt; &gt;<br>
&gt; &gt; The binding included in this patch fails the check:<br>
&gt; &gt; $ make DT_CHECKER_FLAGS=3D-m dt_binding_check<br>
&gt; &gt;<br>
&gt; &gt; You may need to run:<br>
&gt; &gt; $ pip3 install dtschema --upgrade<br>
&gt; &gt;<br>
&gt; &gt; Or you may have to install some dependencies first.<br>
&gt; &gt; The problem is that the patch is missing a &quot;reset-gpios: tru=
e&quot;<br>
&gt; &gt;<br>
&gt; &gt; On top of this I looked at the binding - and the description<br>
&gt; &gt; this is copied from is almost identical.<br>
&gt; &gt; So another approach would be to extend the existing binding like<=
br>
&gt; &gt; in the following.<br>
&gt; &gt;<br>
&gt; &gt; And this also gives a good hint that maybe this can be embedded i=
n<br>
&gt; &gt; the existing driver - and there is no need for a new driver.<br>
&gt; &gt; Could you try to give this a spin and get back on this.<br>
&gt; &gt;<br>
&gt; <br>
&gt; That&#39;s reasonable. Actually, this driver was modified from<br>
&gt; novatek,nt35596s, with different panel initialization commands, and it=
<br>
&gt; seems easy to be embedded in<br>
&gt; the existing driver. However, I wonder what the driver file name would=
<br>
&gt; be...? &quot;panel-novatek-nt35596s-nt36672a.c&quot; or something else=
?<br>
<br>
Just keep the current driver name - we cannot embed all the supported HW<br=
>
in one driver name anyway. And then you do not break currents users in<br>
case they have hardwired the current driver name.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Sam<br>
</blockquote></div>

--0000000000004c68f705e371835a--

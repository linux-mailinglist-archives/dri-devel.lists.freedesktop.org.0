Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C522425D4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 09:05:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4976E8B7;
	Wed, 12 Aug 2020 07:05:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C86386E899
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 02:20:15 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id g14so1105206iom.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 19:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IHs25zeeOM4Srfgt2NN1yoCSxLpzApC2HovALXc+aKQ=;
 b=GGpLgQ9eYUCRceDS7xsV0OAfUDJCdweXwpyNkVS1jymJsXG86lxZTGHHlSLHUZq5T1
 lo5tAT3va6GJorM8jutKnAQAUxWnCvub9rh1Jkw46sryVQtMurDYdBYsAnoQdV5fL8SH
 wN1VW3VenzWJvWJWsidhT5queXbqp3z8FjuZ+E+iFiFCY8IrkrJnrWF4JsPT8KT/1wjR
 oURgWHsY/2Cwla7usWg3fZKBUT3NBsb8+99weqn2+w1/Q5r32ZesID2fCSqbXZapC7pK
 QybtGrs49MM2DBviz6LIrycibksmHl/pAQLHKSa35OxTrnJhGv4hmcS9KlnZXjcViLA1
 2a5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IHs25zeeOM4Srfgt2NN1yoCSxLpzApC2HovALXc+aKQ=;
 b=bm/hsbncYtB7TKFb23ZW1Qvz8+AIjBKXhOcPr4PuQxnfImD6GCcWt1hfzT+XsLN3tN
 isFIr0c//ifPd97ZrFTKdFm6gdZDbGv4DuSqn4AaFWDtTo0/Q5RZiKQm+eYGoy90D2Qj
 4rpFm4gXBH2U8jZQTUlR79VNrIkkFXMJVB5HmAx1KVYnm4iR7VkTWZuEsgnJ0epfx+Uy
 2ysK0Vqe3CWYLkNMmgCdXudxliudt5Q3O/tH3dXaJkFVcNAi2PJuICxKF18dlgobhiRf
 gXyEKORkzjSzXU0PCK8DFjFPc46acNdevai5RFgeAx3d5c6fzcnbJQ6kFzj7ejOsAhtM
 UFYw==
X-Gm-Message-State: AOAM530hCZrqI/3Qts6R7qtOYjPfvIMQPs8cmCkoGBQHEM2xY5weoWbC
 WiUYpUtwz7VEe/l6q6lgIhUtEPxnbyAFFas41mU=
X-Google-Smtp-Source: ABdhPJzUYGrICGytOZKCmDOBWnfjaAE+XvD0UZcDHv4guJ9aHO5BjU7EpgFGCj2HK2jtzWmVFokg8WtF6Wa+kRQkEms=
X-Received: by 2002:a6b:6204:: with SMTP id f4mr25003256iog.56.1597198815142; 
 Tue, 11 Aug 2020 19:20:15 -0700 (PDT)
MIME-Version: 1.0
References: <1594388491-15129-1-git-send-email-simhavcs@gmail.com>
 <1594388491-15129-2-git-send-email-simhavcs@gmail.com>
 <CAGWqDJ4P9dKzGngkiEtL_X1HRjjtU17WqNFM-qiv16tXwQNZTg@mail.gmail.com>
 <CAGWqDJ4s3x5M7dGMTxYMpDbM4NBS7kfTb6-+7Fdx8Pe=CE58fA@mail.gmail.com>
 <20200808213022.GW6186@pendragon.ideasonboard.com>
 <20200810175440.GC292825@ravnborg.org>
 <20200811101942.GB6054@pendragon.ideasonboard.com>
 <20200811191704.GA524675@ravnborg.org>
In-Reply-To: <20200811191704.GA524675@ravnborg.org>
From: Vinay Simha B N <simhavcs@gmail.com>
Date: Wed, 12 Aug 2020 07:50:00 +0530
Message-ID: <CAGWqDJ7bAjDyEr03UT-mfyOuD+xkbo9BG4GyWxbiK_c74eESYw@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] display/drm/bridge: TC358775 DSI/LVDS driver
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: multipart/mixed; boundary="===============1801960545=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1801960545==
Content-Type: multipart/alternative; boundary="00000000000003264005aca4d4fa"

--00000000000003264005aca4d4fa
Content-Type: text/plain; charset="UTF-8"

Sam,

I will look into this and send the patch ASAP.

On Wed, Aug 12, 2020 at 12:47 AM Sam Ravnborg <sam@ravnborg.org> wrote:

> Hi Vinay.
>
> > >
> > > If Laurent or others identify further things to improve we can take
> > > it in-tree.
> >
> > Just one thing, please see below.
> >
> > > > > >> +       d2l_write(tc->i2c, VTIM1, vtime1);
> > > > > >> +       d2l_write(tc->i2c, HTIM2, htime2);
> > > > > >> +       d2l_write(tc->i2c, VTIM2, vtime2);
> > > > > >> +
> > > > > >> +       d2l_write(tc->i2c, VFUEN, VFUEN_EN);
> > > > > >> +       d2l_write(tc->i2c, SYSRST, SYS_RST_LCD);
> > > > > >> +       d2l_write(tc->i2c, LVPHY0, LV_PHY0_PRBS_ON(4) |
> LV_PHY0_ND(6));
> > > > > >> +
> > > > > >> +       dev_dbg(tc->dev, "bus_formats %04x bpc %d\n",
> > > > > >> +               connector->display_info.bus_formats[0],
> > > > > >> +               tc->bpc);
> > > > > >> +       /*
> > > > > >> +        * Default hardware register settings of tc358775
> configured
> > > > > >> +        * with MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA jeida-24 format
> > > > > >> +        */
> > > > > >> +       if (connector->display_info.bus_formats[0] ==
> > > > > >> +               MEDIA_BUS_FMT_RGB888_1X7X4_SPWG) {
> >
> > This shouldn't come from the connector, but from the
> > drm_bridge_state.output_bus_cfg.format. The drm_bridge_funcs
> > .atomic_get_input_bus_fmts() operation likely needs to be implemented.
>
> I trust you will look into this and submit a patch on top of
> drm-misc-next.
> Please add a proper "Fixes:" tag identifying the commit that introduced
> this bug - in this case the commit introducing the driver.
>
> Do not hesitate to reply to all if you have any questions.
> We will help you if we can.
>
>         Sam
>


-- 
regards,
vinaysimha

--00000000000003264005aca4d4fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Sam,</div><div><br></div><div>I will look into this a=
nd send the patch ASAP.<br></div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 12, 2020 at 12:47 AM Sam Ravnb=
org &lt;<a href=3D"mailto:sam@ravnborg.org">sam@ravnborg.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Vinay.<br>
<br>
&gt; &gt; <br>
&gt; &gt; If Laurent or others identify further things to improve we can ta=
ke<br>
&gt; &gt; it in-tree.<br>
&gt; <br>
&gt; Just one thing, please see below.<br>
&gt; <br>
&gt; &gt; &gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i=
2c, VTIM1, vtime1);<br>
&gt; &gt; &gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i=
2c, HTIM2, htime2);<br>
&gt; &gt; &gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i=
2c, VTIM2, vtime2);<br>
&gt; &gt; &gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i=
2c, VFUEN, VFUEN_EN);<br>
&gt; &gt; &gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i=
2c, SYSRST, SYS_RST_LCD);<br>
&gt; &gt; &gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i=
2c, LVPHY0, LV_PHY0_PRBS_ON(4) | LV_PHY0_ND(6));<br>
&gt; &gt; &gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(tc-&gt;dev=
, &quot;bus_formats %04x bpc %d\n&quot;,<br>
&gt; &gt; &gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0connector-&gt;display_info.bus_formats[0],<br>
&gt; &gt; &gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tc-&gt;bpc);<br>
&gt; &gt; &gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; &gt; &gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Default hardwar=
e register settings of tc358775 configured<br>
&gt; &gt; &gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * with MEDIA_BUS_=
FMT_RGB888_1X7X4_JEIDA jeida-24 format<br>
&gt; &gt; &gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; &gt; &gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (connector-&gt;=
display_info.bus_formats[0] =3D=3D<br>
&gt; &gt; &gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0MEDIA_BUS_FMT_RGB888_1X7X4_SPWG) {<br>
&gt; <br>
&gt; This shouldn&#39;t come from the connector, but from the<br>
&gt; drm_bridge_state.output_bus_cfg.format. The drm_bridge_funcs<br>
&gt; .atomic_get_input_bus_fmts() operation likely needs to be implemented.=
<br>
<br>
I trust you will look into this and submit a patch on top of<br>
drm-misc-next.<br>
Please add a proper &quot;Fixes:&quot; tag identifying the commit that intr=
oduced<br>
this bug - in this case the commit introducing the driver.<br>
<br>
Do not hesitate to reply to all if you have any questions.<br>
We will help you if we can.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Sam<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">regards,<br>vinaysimha</div>

--00000000000003264005aca4d4fa--

--===============1801960545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1801960545==--

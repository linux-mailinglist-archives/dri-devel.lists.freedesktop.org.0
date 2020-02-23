Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A795016A1E2
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:21:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1658189339;
	Mon, 24 Feb 2020 09:20:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A656E119
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2020 04:02:06 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id d5so4355662qto.0
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 20:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4Qt6Hhyzi79Bj1NXMPGyazzAfhXvNZz1WBlqWfeDyTA=;
 b=KEF0pypce1ekwF/YH2cvmCya6xN5K6MHDySmYxfo/MI358A5LlJRoznZjAHbgeagdV
 CUbHQM/Zb/pGS5vAkH2p9Ifr0pJ0CBYcKdyLrAK/uZTfJ2kGgBFsHzwJYGdzqvL7quOA
 4pfCbfoXwKcfSDvRPnnfi3jE8nLovt4QyuYoqbJ6D09EIcbn/VL71ZMNYVUgpPAjze+l
 SQ49OPoMjbRotxFLCl2aJN4oLMnZXxFxasgRw+jq/NI7K51arVB4/Gn4b5EYh9W7F+T3
 tyvVQhUg33Sy1et/de2WeZVGPaiSWg+Yu5vtGRsJ/xIFHjBzUOcn2lB+vzgKjShNEKoB
 5BfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4Qt6Hhyzi79Bj1NXMPGyazzAfhXvNZz1WBlqWfeDyTA=;
 b=U8Gs96K/PCdFRJLbnUqZm4sxUH5f1Ob3uan6KJ0EeZhEeGVaqW8d/p4nwQpGxv3C0J
 vGoGajHXyxtHf8yQfSpAjqTLz1ZMDHsdcGCBlyv3uAbaSSwmusGAygOuG2DSeKkbNip3
 dWZSVwMpmQNc5mukIma06PGEOFhcCc/iKFJYvsYTtdHFBxoYf6A9LBxLjuIDJQ6uOiiq
 TswFI34+q+bln+XdovjIBcYHMxa+/YEt3I0aLoeaPcFQI/RDgzYjJFyrF6n844oqwGRB
 +zDZWdww7CwvBAx0p/0G67EAi+OJA2TakggibHOKPXOHPSwaDVsfvsGXlpz6F77LHIvt
 wwYQ==
X-Gm-Message-State: APjAAAVhjZMoY/mDi/+Y6fGvfB8SssZBbiojOoP69S5BB0hPykjkZDEl
 ukU7/BvBWBGRUDyp2TqZZS5rQ7NzsXyQGUvxrZk=
X-Google-Smtp-Source: APXvYqzuA2Oxx4JEcNwtfEEApFMk1G6kONbaZAesFLZRffciXFSXETc44PhmZUT+/1LO9+a7YQr+LtxzgXT4w2TPGTE=
X-Received: by 2002:ac8:488b:: with SMTP id i11mr40032987qtq.209.1582430525252; 
 Sat, 22 Feb 2020 20:02:05 -0800 (PST)
MIME-Version: 1.0
References: <1582271336-3708-1-git-send-email-kevin3.tang@gmail.com>
 <20200221211756.GB3456@ravnborg.org>
In-Reply-To: <20200221211756.GB3456@ravnborg.org>
From: tang pengchuan <kevin3.tang@gmail.com>
Date: Sun, 23 Feb 2020 12:01:53 +0800
Message-ID: <CAFPSGXay8CF-svxpHpA9MKE4zR_1PQ0cz5-=LY4yBCmDu4WasA@mail.gmail.com>
Subject: Re: [PATCH RFC v3 0/6] Add Unisoc's drm kms module
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:20:26 +0000
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
Cc: mark.rutland@arm.com, Baolin Wang <baolin.wang@linaro.org>,
 David Airlie <airlied@linux.ie>, Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, robh+dt@kernel.org,
 Orson Zhai <orsonzhai@gmail.com>
Content-Type: multipart/mixed; boundary="===============1803792400=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1803792400==
Content-Type: multipart/alternative; boundary="00000000000056e910059f365177"

--00000000000056e910059f365177
Content-Type: text/plain; charset="UTF-8"

Hi Sam,
Thanks for your feedback

In the future we will have dp(displayport), hdmi encoder and more, so all
those put into sprd directory, maybe better?

On Sat, Feb 22, 2020 at 5:17 AM Sam Ravnborg <sam@ravnborg.org> wrote:

> Hi Kevin.
>
> On Fri, Feb 21, 2020 at 03:48:50PM +0800, Kevin Tang wrote:
> > ChangeList:
> > v1:
> > 1. only upstream modeset and atomic at first commit.
> > 2. remove some unused code;
> > 3. use alpha and blend_mode properties;
> > 3. add yaml support;
> > 4. remove auto-adaptive panel driver;
> > 5. bugfix
> >
> > v2:
> > 1. add sprd crtc and plane module for KMS, preparing for multi
> crtc&encoder
> > 2. remove gem drivers, use generic CMA handlers
> > 3. remove redundant "module_init", all the sub modules loading by KMS
> >
> > v3:
> > 1. multi crtc&encoder design have problem, so rollback to v1
> >
> > Kevin Tang (6):
> >   dt-bindings: display: add Unisoc's drm master bindings
> >   drm/sprd: add Unisoc's drm kms master
> >   dt-bindings: display: add Unisoc's dpu bindings
> >   drm/sprd: add Unisoc's drm display controller driver
> >   dt-bindings: display: add Unisoc's mipi dsi&dphy bindings
> >   drm/sprd: add Unisoc's drm mipi dsi&dphy driver
> >
> >  .../devicetree/bindings/display/sprd/dphy.yaml     |   78 ++
> >  .../devicetree/bindings/display/sprd/dpu.yaml      |   85 ++
> >  .../devicetree/bindings/display/sprd/drm.yaml      |   38 +
> >  .../devicetree/bindings/display/sprd/dsi.yaml      |  101 ++
> Good to see you are using DT Schema format.
> Consider to drop the sprd directory and then use
> filename with "sprd-" prefix.
> sprd.yaml
> sprd-dphy.yaml
> sprd-dpu.yaml
> sprd-dsi.yaml
>
>         Sam
>
>

--00000000000056e910059f365177
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Sam,<div>Thanks for your feedback</div=
><div><br></div><div>In the future we will have dp(displayport), hdmi encod=
er and more, so all those put into sprd directory, maybe better?<br></div><=
div><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Sat, Feb 22, 2020 at 5:17 AM Sam Ravnborg &lt;<a href=3D"mailt=
o:sam@ravnborg.org">sam@ravnborg.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">Hi Kevin.<br>
<br>
On Fri, Feb 21, 2020 at 03:48:50PM +0800, Kevin Tang wrote:<br>
&gt; ChangeList:<br>
&gt; v1:<br>
&gt; 1. only upstream modeset and atomic at first commit. <br>
&gt; 2. remove some unused code;<br>
&gt; 3. use alpha and blend_mode properties;<br>
&gt; 3. add yaml support;<br>
&gt; 4. remove auto-adaptive panel driver;<br>
&gt; 5. bugfix<br>
&gt; <br>
&gt; v2:<br>
&gt; 1. add sprd crtc and plane module for KMS, preparing for multi crtc&am=
p;encoder<br>
&gt; 2. remove gem drivers, use generic CMA handlers<br>
&gt; 3. remove redundant &quot;module_init&quot;, all the sub modules loadi=
ng by KMS<br>
&gt; <br>
&gt; v3:<br>
&gt; 1. multi crtc&amp;encoder design have problem, so rollback to v1<br>
&gt; <br>
&gt; Kevin Tang (6):<br>
&gt;=C2=A0 =C2=A0dt-bindings: display: add Unisoc&#39;s drm master bindings=
<br>
&gt;=C2=A0 =C2=A0drm/sprd: add Unisoc&#39;s drm kms master<br>
&gt;=C2=A0 =C2=A0dt-bindings: display: add Unisoc&#39;s dpu bindings<br>
&gt;=C2=A0 =C2=A0drm/sprd: add Unisoc&#39;s drm display controller driver<b=
r>
&gt;=C2=A0 =C2=A0dt-bindings: display: add Unisoc&#39;s mipi dsi&amp;dphy b=
indings<br>
&gt;=C2=A0 =C2=A0drm/sprd: add Unisoc&#39;s drm mipi dsi&amp;dphy driver<br=
>
&gt; <br>
&gt;=C2=A0 .../devicetree/bindings/display/sprd/dphy.yaml=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A078 ++<br>
&gt;=C2=A0 .../devicetree/bindings/display/sprd/dpu.yaml=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A085 ++<br>
&gt;=C2=A0 .../devicetree/bindings/display/sprd/drm.yaml=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A038 +<br>
&gt;=C2=A0 .../devicetree/bindings/display/sprd/dsi.yaml=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 101 ++<br>
Good to see you are using DT Schema format.<br>
Consider to drop the sprd directory and then use<br>
filename with &quot;sprd-&quot; prefix.<br>
sprd.yaml<br>
sprd-dphy.yaml<br>
sprd-dpu.yaml<br>
sprd-dsi.yaml<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Sam<br>
<br>
</blockquote></div></div>

--00000000000056e910059f365177--

--===============1803792400==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1803792400==--

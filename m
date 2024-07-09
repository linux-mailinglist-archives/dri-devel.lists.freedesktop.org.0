Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B31292C283
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 19:30:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C9388924B;
	Tue,  9 Jul 2024 17:30:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EVdoGEqe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D468924B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 17:30:40 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-dff17fd97b3so6046697276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 10:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720546239; x=1721151039; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WNlyt4y43+Jz1Zom9ZW3FrRjKWjV33+Al0P8HERgYY0=;
 b=EVdoGEqePb4eEkipye2cdOw18fTNS3yP6reoIYnYXLvNZp2XYGlxeErPMS7hI38Dvy
 6OajQ3OOfD3K5YUZFRznoMSzD1BsBZM9WOVDdKRsO4UMo5aggWz1bJ9W5RxVUayoEFrA
 NGNqSreyDvfgOgEulVe/p/7v4zMBuTT8bU+UxyT+McFVWxk0cR6KqT4rFkgwirGTcxiS
 Tnc/VoDcy82Ci+0AHEvBdk20vOSD19LcnHO6wG+GHZx1PbPvcTnTL+l47UoEUiKTuWP4
 q1FmKsl1iV/UzIg4obimCTofB312/H1XMeC7XBXkkhq6zgHuzCqphK1fZbDnUl+FmV0U
 poXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720546239; x=1721151039;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WNlyt4y43+Jz1Zom9ZW3FrRjKWjV33+Al0P8HERgYY0=;
 b=W5BqDDib1yttDuUCJ+QsHqWf9v9RkJRisnzjH3Kud+l44qVUcPzCHPU7sk8OlG0tLn
 ilzxyyutiX6MKDvBNStPHwesps3UPjE4uIsjrjIU98QMZcRmfQYIQ3nPsT/A8Eok7WH8
 jZ7nZkmbeqGXGJZsPbx91NHosX+3bNSgrmpwnV5FA+Am57iaZc+ecj2Y/3iZQwvu+f2v
 zEFDOC4q3Oj/C/mOle5rHPQxyPxus5pukBNGoi8TTbi8esa6gM57ZHdf2ApRpbBh1E14
 KXyuCaOVuQNObt6V5Rq18oCKmPTU8MHZMF4eClr3aShb0bnVHS45mOsvwEdqCk2BlDNq
 nGZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRZagB6ARBwpqhY+2f1znS61B3ZNTNFLUMA5Y1oDqhCAqvGvK7ekYd7TrD0Q1stMjbjCd9mHcno+RWBg55qI1FM+W4KvCd3iaYERnTq0nL
X-Gm-Message-State: AOJu0YwCjULo/oDNU5Q2Yx58MQ1P191bS5Y5ozWqsRZhmE2+6qipDz+g
 csj43BsjQc70ElLYw48EPQeE2sFVuf0iaSeIM80TgTkUK2NZ6JeVUgSG/8lFNpkuWMiho9EsubD
 7RnttxiRxAj/yX9ekiLvFbkvWQGY=
X-Google-Smtp-Source: AGHT+IGOjJHvGKbedEFhzRDIFdooLGsj28vn6iUAkmnUl7Lm0rCOI5r1V+bUsW2/cU5RbasscGe4neOW78oKs0/T4sQ=
X-Received: by 2002:a05:6902:245:b0:dff:bfc:1643 with SMTP id
 3f1490d57ef6-e041b122b55mr3995751276.49.1720546238691; Tue, 09 Jul 2024
 10:30:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240708151857.40538-1-stefano.radaelli21@gmail.com>
 <172045725750.3389992.15451403448241421795.robh@kernel.org>
 <CAK+owohBrewYFpDKjsE5iWC5OQ3p6S_9fwj7DWa1Ux2h8CXcAw@mail.gmail.com>
 <944ecc41-9ef7-4d9e-9d96-3c5c0cdb71b5@denx.de>
 <CAK+owoiQY8OYiZofyq4jj2S3Mg6ub88DF5V52JcppxhWbUsWgg@mail.gmail.com>
 <223b287f-4da6-4ec1-be7c-6135215c5551@denx.de>
In-Reply-To: <223b287f-4da6-4ec1-be7c-6135215c5551@denx.de>
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
Date: Tue, 9 Jul 2024 19:30:28 +0200
Message-ID: <CAK+owogLctqu17cFEQH+258wrpfMJ4iE6iJABRu5dwxDtR21EA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: bridge: ti,
 sn65dsi83: add burst-mode-disabled
To: Marek Vasut <marex@denx.de>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, 
 "Noah J . Rosa" <noahj.rosa@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="000000000000608301061cd3e39d"
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

--000000000000608301061cd3e39d
Content-Type: text/plain; charset="UTF-8"

Okay, I get it.

So if you think this mode shouldn't be implemented within this driver, we
can close the thread.
Just for information, this driver has been implemented from the work done
by Compulab (as it says in the driver's initial comments), and they do not
put the burst mode by default, not even giving the possibility to activate
it by dts:
https://github.com/compulab-yokneam/imx8-android/blob/master/o8/vendor/nxp-opensource/kernel_imx/0055-sn65dsi83-Add-ti-sn65dsi83-dsi-to-lvds-bridge-driver.patch

The panels that I've had these problems with are some of JuTouch's
1920x1200, for example JT101TM015 , and I solved it by giving the option to
remove this mode.
I have also heard from other colleagues who have had the same problem on
some dual-channel displays.

Thank you,

Stefano

Il Mar 9 Lug 2024, 17:00 Marek Vasut <marex@denx.de> ha scritto:

> On 7/9/24 4:44 PM, Stefano Radaelli wrote:
> > Hi Marek,
>
> Hi,
>
> > Actually this property is specific also to DSI8x bridge, as you can see
> > from the screenshot below taken from official datasheet:
> >
> > [image: image.png]
> >
> > And it's the sn65dsi8x driver that tells MIPI driver which flags to use
> > during attachment.
>
> There are other bridges and panels which support both DSI burst and
> sync-pulse/sync-events modes, so a property which selects the mode is
> generic, not specific to this particular bridge . The bridge driver
> could parse such generic property, although it would be better if the
> core code parsed it instead.
>
> > So, for example, this bridge can work also for MIPI interfaces which
> don't
> > support burst-mode.
> > Also, as a value-added benefit, I found non-burst mode better for some
> > 1920x1200 LVDS panels I'm testing (Of course with more energy
> consumption).
> > That's why I though it could be useful have this option, since SN65DSI8x
> > supports both modes.
>
> Can you share which panel model this is ?
>

--000000000000608301061cd3e39d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto">Okay, I get it.</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">So if you think this mode shouldn&#39;t be impl=
emented within this driver, we can close the thread.</div><div dir=3D"auto"=
>Just for information, this driver has been implemented from the work done =
by Compulab (as it says in the driver&#39;s initial comments), and they do =
not put the burst mode by default, not even giving the possibility to activ=
ate it by dts:<br></div><div dir=3D"auto"><a href=3D"https://github.com/com=
pulab-yokneam/imx8-android/blob/master/o8/vendor/nxp-opensource/kernel_imx/=
0055-sn65dsi83-Add-ti-sn65dsi83-dsi-to-lvds-bridge-driver.patch">https://gi=
thub.com/compulab-yokneam/imx8-android/blob/master/o8/vendor/nxp-opensource=
/kernel_imx/0055-sn65dsi83-Add-ti-sn65dsi83-dsi-to-lvds-bridge-driver.patch=
</a></div><div dir=3D"auto"><br></div><div dir=3D"auto">The panels that I&#=
39;ve had these problems with are some of JuTouch&#39;s 1920x1200, for exam=
ple JT101TM015 , and I solved it by giving the option to remove this mode.<=
/div><div dir=3D"auto">I have also heard from other colleagues who have had=
 the same problem on some dual-channel displays.<br></div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Thank you,</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Stefano</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Il Mar 9 Lug 2024, 17:00 Marek Vasut &lt;<a h=
ref=3D"mailto:marex@denx.de">marex@denx.de</a>&gt; ha scritto:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">On 7/9/24 4:44 PM, Stefano Radaelli wrote:<br>
&gt; Hi Marek,<br>
<br>
Hi,<br>
<br>
&gt; Actually this property is specific also to DSI8x bridge, as you can se=
e<br>
&gt; from the screenshot below taken from official datasheet:<br>
&gt; <br>
&gt; [image: image.png]<br>
&gt; <br>
&gt; And it&#39;s the sn65dsi8x driver that tells MIPI driver which flags t=
o use<br>
&gt; during attachment.<br>
<br>
There are other bridges and panels which support both DSI burst and <br>
sync-pulse/sync-events modes, so a property which selects the mode is <br>
generic, not specific to this particular bridge . The bridge driver <br>
could parse such generic property, although it would be better if the <br>
core code parsed it instead.<br>
<br>
&gt; So, for example, this bridge can work also for MIPI interfaces which d=
on&#39;t<br>
&gt; support burst-mode.<br>
&gt; Also, as a value-added benefit, I found non-burst mode better for some=
<br>
&gt; 1920x1200 LVDS panels I&#39;m testing (Of course with more energy cons=
umption).<br>
&gt; That&#39;s why I though it could be useful have this option, since SN6=
5DSI8x<br>
&gt; supports both modes.<br>
<br>
Can you share which panel model this is ?<br>
</blockquote></div>

--000000000000608301061cd3e39d--

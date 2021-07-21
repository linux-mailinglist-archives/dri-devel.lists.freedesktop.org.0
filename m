Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 075853D09B9
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 09:30:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D33EC6E85A;
	Wed, 21 Jul 2021 07:30:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E5836E85A
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 07:30:00 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id y6so1463945ilj.13
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 00:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JJyapWso43cKxu7exR6UDB9SXEcP2zO2ejL6sTcse9U=;
 b=draIOqOnpPvTHBMPDajHYxnZpgi3hCpg1BxirrVgoEYxghc3TcRRz0/xxRvpShQl2y
 QRfeyP2nf4Yx3eBaLVfC1pihBjTXaPHGttywezWhikOFcGHneCk2GT0Nao1l9czoSKZj
 Aw4jTYrCrc+1hLgqrUlMyzOnkHhg3aLmqWC+1+1eu6SLQGz9CpwJq5KpSJop0o9jlK/W
 lDQWyc4D9GnFw3y6SHXtI08cbPppDFrCva60xhsgVAoxFK33INN2tA8MmOeBGltQzSd/
 rS+sQxYdp1FjCfIOJGetNFAEA3ZuaS7tI6Du1FjFTlr2vM/geuMnMVJpSFOHeB90EWFK
 U32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JJyapWso43cKxu7exR6UDB9SXEcP2zO2ejL6sTcse9U=;
 b=AeCjG36t/A5s7Bnr0LPHDNiX0U3sCmyulNTEzboEppDtpOFWbYek4SZKx47BRWIVIZ
 ZRZhdwEBNNeATsgCB8fKBNjQxUIzNoH0BGs0ZJaUzX/cRkf3gcsMO3J9AUFO6VwsoOPS
 J4ZWPb/bWXMssZgjwxBRGFhcpE/4oRY2TrtFDLgHofn3rJ7V6jDxRG6AlAgvbPFbu6wu
 BIf7gjWPZGXVDAcy8IyV2cYfACKIRVuSX2XCkSMPgY3KQzSNztSnT/Oot71X/ke5QUzg
 g0BqDLD2o20RzY5Doq90W0//RcXzG0cN0yBK+fz+Da4darkWQdB7OB+Btabu9IGLmkrD
 l6KA==
X-Gm-Message-State: AOAM5325yVw9eIeS+k6RYQfUpcXJk5ZYB478SaW5OpP+x9jCmOTwPGuU
 1EPhWRe+eqvMNbPpOlep00t3dudxNKBYfHrRJjQ=
X-Google-Smtp-Source: ABdhPJwgZTtkv63YIk04u138pE+AS+Biq6n5UJESA7lfXXhZ+X6P39wlRoF2kGHKp3Xbkqqzt5aEcXzq2cwEpD0hdcI=
X-Received: by 2002:a05:6e02:e82:: with SMTP id
 t2mr23356675ilj.218.1626852599569; 
 Wed, 21 Jul 2021 00:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <1626430843-23823-1-git-send-email-dillon.minfei@gmail.com>
 <1626430843-23823-2-git-send-email-dillon.minfei@gmail.com>
 <CACRpkdbkOY08THPsPHfOOMeToHGXZvN2DBoKG9+WHeke9jypzQ@mail.gmail.com>
In-Reply-To: <CACRpkdbkOY08THPsPHfOOMeToHGXZvN2DBoKG9+WHeke9jypzQ@mail.gmail.com>
From: Dillon Min <dillon.minfei@gmail.com>
Date: Wed, 21 Jul 2021 15:29:23 +0800
Message-ID: <CAL9mu0JufzC_2p+X0PHdEpuYUqCNJ6XoT+f18oEsRa5Wm7wS3g@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add ilitek ili9341 panel
 bindings
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000004ca0fd05c79d2384"
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Dave Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 Doug Anderson <dianders@chromium.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000004ca0fd05c79d2384
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

Thanks for your detailed reply.

On Sun, 18 Jul 2021 at 08:17, Linus Walleij <linus.walleij@linaro.org>
wrote:

> Hi Dillon,
>
> thanks for your patch!
>
> On Fri, Jul 16, 2021 at 12:20 PM <dillon.minfei@gmail.com> wrote:
>
> > From: Dillon Min <dillon.minfei@gmail.com>
> >
> > Add documentation for "ilitek,ili9341" panel.
> >
> > Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
>
> > +  dc-gpios:
> > +    maxItems: 1
> > +    description: Display data/command selection (D/CX)
>
> This is a DBI feature so mention in the description that this is a
> DBI panel.
>

Okay, I will add the DBI panel to v2.


>
> > +  spi-3wire: true
> > +
> > +  spi-max-frequency:
> > +    const: 10000000
> > +
> > +  port: true
> > +
> > +additionalProperties: false
>
> Please add regulator supplies for the power lines, it's fine
> not to implement code handling them in the driver but they
> should be in the bindings.
>
> For the ili9341 it should be
>
>   vci-supply:
>     description: Analog voltage supply (2.5 .. 3.3V)
>
>   vddi-supply:
>     description: Voltage supply for interface logic (1.65 .. 3.3 V)
>
>   vddi-led-supply:
>     description: Voltage supply for the LED driver (1.65 .. 3.3 V)
>
>
Thanks so much, I will add it to v2.


> Yours,
> Linus Walleij
>

--0000000000004ca0fd05c79d2384
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Linus,<div><br></div><div>Thanks for y=
our detailed reply.</div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Sun, 18 Jul 2021 at 08:17, Linus Walleij &lt;<a=
 href=3D"mailto:linus.walleij@linaro.org">linus.walleij@linaro.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Dillon=
,<br>
<br>
thanks for your patch!<br>
<br>
On Fri, Jul 16, 2021 at 12:20 PM &lt;<a href=3D"mailto:dillon.minfei@gmail.=
com" target=3D"_blank">dillon.minfei@gmail.com</a>&gt; wrote:<br>
<br>
&gt; From: Dillon Min &lt;<a href=3D"mailto:dillon.minfei@gmail.com" target=
=3D"_blank">dillon.minfei@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Add documentation for &quot;ilitek,ili9341&quot; panel.<br>
&gt;<br>
&gt; Signed-off-by: Dillon Min &lt;<a href=3D"mailto:dillon.minfei@gmail.co=
m" target=3D"_blank">dillon.minfei@gmail.com</a>&gt;<br>
<br>
&gt; +=C2=A0 dc-gpios:<br>
&gt; +=C2=A0 =C2=A0 maxItems: 1<br>
&gt; +=C2=A0 =C2=A0 description: Display data/command selection (D/CX)<br>
<br>
This is a DBI feature so mention in the description that this is a<br>
DBI panel.<br></blockquote><div><br></div><div>Okay, I will add the DBI pan=
el to v2.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
&gt; +=C2=A0 spi-3wire: true<br>
&gt; +<br>
&gt; +=C2=A0 spi-max-frequency:<br>
&gt; +=C2=A0 =C2=A0 const: 10000000<br>
&gt; +<br>
&gt; +=C2=A0 port: true<br>
&gt; +<br>
&gt; +additionalProperties: false<br>
<br>
Please add regulator supplies for the power lines, it&#39;s fine<br>
not to implement code handling them in the driver but they<br>
should be in the bindings.<br>
<br>
For the ili9341 it should be<br>
<br>
=C2=A0 vci-supply:<br>
=C2=A0 =C2=A0 description: Analog voltage supply (2.5 .. 3.3V)<br>
<br>
=C2=A0 vddi-supply:<br>
=C2=A0 =C2=A0 description: Voltage supply for interface logic (1.65 .. 3.3 =
V)<br>
<br>
=C2=A0 vddi-led-supply:<br>
=C2=A0 =C2=A0 description: Voltage supply for the LED driver (1.65 .. 3.3 V=
)<br>
<br></blockquote><div><br></div><div>Thanks so much, I will add it to v2.</=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Yours,<br>
Linus Walleij<br>
</blockquote></div></div>

--0000000000004ca0fd05c79d2384--

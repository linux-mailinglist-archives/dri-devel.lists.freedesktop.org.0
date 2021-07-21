Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 122823D09B1
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 09:28:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4B76E87E;
	Wed, 21 Jul 2021 07:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16CD76E87E
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 07:28:21 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id v26so1274150iom.11
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 00:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=crzrKyOvq9XSzeVwcwYVEZyzEYKB+kuf+nGDzKw4bc8=;
 b=tjmB+xOvE90FRuCicGDmQvW54HE+z3q+OZelOKqukIr/u+qVAIoWvAD0/HPMMjnPoG
 fdqu1IHE314OBVff87JxATVUwxnxobOUkLpbPzEyBuErxbImOPCHTrxeQQqg+ISGZQX0
 ETd6C2EUGOIUsuwafHcTP2DVkMjBwkBJ+kQf5tsOUDxDB5Rm8cN5w8narOE8P/0dvruY
 BlAzt2VZtSWrU0ai5A9DNHDmA5zrMuMr9/F9q/8hbd1WCUx318sUrDKV6avWSMrml1RK
 ecgpvgILwYFX1z+G1vxWQP6J2h1qmlEDetU2isQTLHhpjgBTw0fUaDZzCXqy378CeWuk
 1UXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=crzrKyOvq9XSzeVwcwYVEZyzEYKB+kuf+nGDzKw4bc8=;
 b=Dw9KYhHVoBHH9Wwuk5rb89GWwiXtJs2QLEfrjm3h9DAzG4VZ/IDxBQmXPX/8bqe6Qy
 90u+xhBGT/Ooti4tHU4RvQotQMcc4Emn6goIYIRx10/D42SJp74DvHilJHUPs4SW6fKt
 d+bT1ixjIa0iPqa3+hso8c6F9aSAadS3bUPcbXYN3migPPgR9Tfz6bFYv1XsAylxEk35
 J8Z/y7QDDn1StYtZtqeapVT7K4TC/jRSmt0JRL4V//v/qkuSyy8gwCWJl7EkQjFu5nI0
 +VR+XlkvsE2xc6WB84+d7lqEbXqLjPHzNjJfe1+XxZ8BmjJ1apXUJAdTB1ahhj9JYz9F
 KlBQ==
X-Gm-Message-State: AOAM533oX8p0cuPGvXkhq7kBPuw4AUVQUHTIKhkm1KG2WR26CWYYh7pu
 3cXugB+F38tq3y4vdn/wTnp8NjmP5YU5Nr4XNd8=
X-Google-Smtp-Source: ABdhPJxhP4qhdGPqpGs8CMhq9oYFqXjrHGMxEFk4vfQhCG7aRsoRrdB41oD1dRCvjoO8UvLmFcg39J6E0oqBVq1+3Js=
X-Received: by 2002:a05:6638:24c3:: with SMTP id
 y3mr29796193jat.10.1626852500466; 
 Wed, 21 Jul 2021 00:28:20 -0700 (PDT)
MIME-Version: 1.0
References: <1626430843-23823-1-git-send-email-dillon.minfei@gmail.com>
 <1626430843-23823-3-git-send-email-dillon.minfei@gmail.com>
 <CACRpkdZZyN_8ND52+piHYaksujwwwTMigkv6eL0fih_2dYZ4Lg@mail.gmail.com>
In-Reply-To: <CACRpkdZZyN_8ND52+piHYaksujwwwTMigkv6eL0fih_2dYZ4Lg@mail.gmail.com>
From: Dillon Min <dillon.minfei@gmail.com>
Date: Wed, 21 Jul 2021 15:27:44 +0800
Message-ID: <CAL9mu0+C1p1mMEbw90Z66KCt1Rp2=GV=RcXgZizJRxu8rVaOGw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: Add ilitek ili9341 panel driver
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000064709c05c79d1d01"
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

--00000000000064709c05c79d1d01
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

Thanks for your detailed review.

On Sun, 18 Jul 2021 at 08:31, Linus Walleij <linus.walleij@linaro.org>
wrote:

> Hi Dillon,
>
> thanks for your patch!
>
> On Fri, Jul 16, 2021 at 12:20 PM <dillon.minfei@gmail.com> wrote:
>
> > From: Dillon Min <dillon.minfei@gmail.com>
> >
> > This driver combine tiny/ili9341.c mipi_dbi_interface driver
> > with mipi_dpi_interface driver, can support ili9341 with serial
> > mode or parallel rgb interface mode by register configuration.
> >
> > Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
>
> Nice!
>
> > +config DRM_PANEL_ILITEK_ILI9341
> > +       tristate "Ilitek ILI9341 240x320 QVGA panels"
> > +       depends on OF && SPI
> > +       depends on DRM_KMS_HELPER
> > +       depends on DRM_KMS_CMA_HELPER
> (...)
> > +#include <drm/drm_gem_framebuffer_helper.h>
> > +#include <drm/drm_gem_cma_helper.h>
> > +#include <drm/drm_fb_helper.h>
> > +#include <drm/drm_gem_atomic_helper.h>
> > +#include <drm/drm_atomic_helper.h>
>
> Hm now there is a (partial) KMS driver in the panel driver, kinda, sorta.
> Is this the right split? I'm not the best with DRM infrastructure,
> just asking.
>

I tried to remove one of these two headers, but got compile errors:

linux/drivers/gpu/drm/panel/panel-ilitek-ili9341.c:719:3: error: implicit
declaration of function 'drm_atomic_helper_shutdown' [-Werror
=implicit-function-declaration]
  719 |   drm_atomic_helper_shutdown(drm);
      |   ^~~~~~~~~~~~~~~~~~~~~~~~~~
or

linux/drivers/gpu/drm/panel/panel-ilitek-ili9341.c:562:16: error:
'drm_gem_simple_display_pipe_prepare_fb' undeclared here (not in a function)
  562 |  .prepare_fb = drm_gem_simple_display_pipe_prepare_fb,
      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Actually, these two headers are merged from tiny/ili9341.c to support only-
DBI interface, I'm
not sure whether the maintainers will ask me to remove (tiny/ili9341.c)
code from this patch.
If so, I will remove these headers.

But, It's a little strange to support different interfaces from different
drivers.


> > +struct ili9341_config {
> > +       u32 max_spi_speed;
> > +       /** @mode: the drm display mode */
> > +       const struct drm_display_mode mode;
> > +       /* @ca: TODO: need comments for this register */
> > +       u8 ca[ILI9341_CA_LEN];
>
> These are all in the datasheet but I guess you plan to add these
> TODOs later. (It's fine I suppose, the driver is already very nice.)
>

Yes, I didn't get detailed information about these registers from this
panel datasheet, so leave TODOs here.


> > +       struct regulator *vcc;
>
> Use the right name of the pin for the regulator. I guess this is actually
> vci. I would implement all three regulators and get them as bulk.
> See e.g. drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
> for an example on how to get and enable several regulators
> using bulk.
>
> The regulator framework will provide dummy regulators if you
> didn't define some of them so it is fine to just provide one or two.
>
>
Really appreciate your suggestion, will add to v2.


> Yours,
> Linus Walleij
>

--00000000000064709c05c79d1d01
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Linus,<div><br></div><div>Thanks for y=
our detailed review.</div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Sun, 18 Jul 2021 at 08:31, Linus <span class=
=3D"" id=3D":1i5.1" tabindex=3D"-1" role=3D"menuitem" aria-haspopup=3D"true=
" style=3D"">Walleij</span> &lt;<span class=3D"" id=3D":1i5.2" tabindex=3D"=
-1" role=3D"menuitem" aria-haspopup=3D"true" style=3D"">linus</span>.<span =
class=3D"" id=3D":1i5.3" tabindex=3D"-1" role=3D"menuitem" aria-haspopup=3D=
"true" style=3D"">walleij</span>@<span class=3D"" id=3D":1i5.4" tabindex=3D=
"-1" role=3D"menuitem" aria-haspopup=3D"true" style=3D"">linaro</span>.org&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Di=
llon,<br>
<br>
thanks for your patch!<br>
<br>
On Fri, Jul 16, 2021 at 12:20 PM &lt;<a href=3D"mailto:dillon.minfei@gmail.=
com" target=3D"_blank">dillon.minfei@gmail.com</a>&gt; wrote:<br>
<br>
&gt; From: Dillon Min &lt;<a href=3D"mailto:dillon.minfei@gmail.com" target=
=3D"_blank">dillon.minfei@gmail.com</a>&gt;<br>
&gt;<br>
&gt; This driver combine tiny/ili9341.c mipi_dbi_interface driver<br>
&gt; with mipi_dpi_interface driver, can support ili9341 with serial<br>
&gt; mode or parallel rgb interface mode by register configuration.<br>
&gt;<br>
&gt; Signed-off-by: Dillon Min &lt;<a href=3D"mailto:dillon.minfei@gmail.co=
m" target=3D"_blank">dillon.minfei@gmail.com</a>&gt;<br>
<br>
Nice!<br>
<br>
&gt; +config DRM_PANEL_ILITEK_ILI9341<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;Ilitek ILI9341 240x320 QVGA=
 panels&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on OF &amp;&amp; SPI<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on DRM_KMS_HELPER<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on DRM_KMS_CMA_HELPER<br>
(...)<br>
&gt; +#include &lt;drm/drm_gem_framebuffer_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_gem_cma_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_fb_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_gem_atomic_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_atomic_helper.h&gt;<br>
<br>
Hm now there is a (partial) KMS driver in the panel driver, kinda, sorta.<b=
r>
Is this the right split? I&#39;m not the best with DRM infrastructure,<br>
just asking.<br></blockquote><div><br></div><div>I tried to remove one of t=
hese two headers, but got compile errors:</div><div class=3D"gmail_quote"><=
br></div><span class=3D"" id=3D":1i5.5" tabindex=3D"-1" role=3D"menuitem" a=
ria-haspopup=3D"true" style=3D"">linux</span>/drivers/<span class=3D"" id=
=3D":1i5.6" tabindex=3D"-1" role=3D"menuitem" aria-haspopup=3D"true" style=
=3D"">gpu</span>/<span class=3D"" id=3D":1i5.7" tabindex=3D"-1" role=3D"men=
uitem" aria-haspopup=3D"true" style=3D"">drm</span>/panel/panel-<span class=
=3D"" id=3D":1i5.8" tabindex=3D"-1" role=3D"menuitem" aria-haspopup=3D"true=
" style=3D"">ilitek</span>-ili9341.c:719:3: error: implicit declaration of =
function &#39;drm_atomic_helper_shutdown&#39; [-<span class=3D"" id=3D":1i5=
.9" tabindex=3D"-1" role=3D"menuitem" aria-haspopup=3D"true" style=3D"">Wer=
ror</span>=3Dimplicit-function-declaration]<br>=C2=A0 719 | =C2=A0 <span cl=
ass=3D"" id=3D":1i5.10" tabindex=3D"-1" role=3D"menuitem" aria-haspopup=3D"=
true" style=3D"">drm</span>_atomic_helper_shutdown(<span class=3D"" id=3D":=
1i5.11" tabindex=3D"-1" role=3D"menuitem" aria-haspopup=3D"true" style=3D""=
>drm</span>);<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~<b=
r><div>or</div><div class=3D"gmail_quote"><br></div><span class=3D"" id=3D"=
:1i5.12" tabindex=3D"-1" role=3D"menuitem" aria-haspopup=3D"true" style=3D"=
">linux</span>/drivers/<span class=3D"" id=3D":1i5.13" tabindex=3D"-1" role=
=3D"menuitem" aria-haspopup=3D"true" style=3D"">gpu</span>/<span class=3D""=
 id=3D":1i5.14" tabindex=3D"-1" role=3D"menuitem" aria-haspopup=3D"true" st=
yle=3D"">drm</span>/panel/panel-<span class=3D"" id=3D":1i5.15" tabindex=3D=
"-1" role=3D"menuitem" aria-haspopup=3D"true" style=3D"">ilitek</span>-ili9=
341.c:562:16: error: &#39;drm_gem_simple_display_pipe_prepare_fb&#39; undec=
lared here (not in a function)<br>=C2=A0 562 | =C2=A0.prepare_<span class=
=3D"" id=3D":1i5.16" tabindex=3D"-1" role=3D"menuitem" aria-haspopup=3D"tru=
e" style=3D"">fb</span> =3D <span class=3D"" id=3D":1i5.17" tabindex=3D"-1"=
 role=3D"menuitem" aria-haspopup=3D"true" style=3D"">drm</span>_gem_simple_=
display_pipe_prepare_<span class=3D"" id=3D":1i5.18" tabindex=3D"-1" role=
=3D"menuitem" aria-haspopup=3D"true" style=3D"">fb</span>,<br>=C2=A0 =C2=A0=
 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br><div><br></div><div>Actually, these two hea=
ders are merged from tiny/ili9341.c to support only-<span class=3D"" id=3D"=
:1i5.19" tabindex=3D"-1" role=3D"menuitem" aria-haspopup=3D"true" style=3D"=
">DBI</span> interface, I&#39;m</div><div>not sure whether the maintainers =
will ask me to remove (tiny/ili9341.c) code from this patch.</div><div>If s=
o, I will remove these headers.</div><div><br></div><div>But, It&#39;s a li=
ttle strange to support different interfaces from different drivers.</div><=
div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +struct ili9341_config {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 max_spi_speed;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @mode: the drm display mode */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct drm_display_mode mode;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* @ca: TODO: need comments for this regis=
ter */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 ca[ILI9341_CA_LEN];<br>
<br>
These are all in the datasheet but I guess you plan to add these<br>
TODOs later. (It&#39;s fine I suppose, the driver is already very nice.)<br=
></blockquote><div><br></div><div>Yes, I didn&#39;t get detailed informatio=
n about these registers from this</div><div>panel <span class=3D"" id=3D":1=
i5.20" tabindex=3D"-1" role=3D"menuitem" aria-haspopup=3D"true" style=3D"">=
datasheet</span>, so leave <span class=3D"" id=3D":1i5.21" tabindex=3D"-1" =
role=3D"menuitem" aria-haspopup=3D"true" style=3D"">TODOs</span> here.</div=
><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct regulator *vcc;<br>
<br>
Use the right name of the pin for the regulator. I guess this is actually<b=
r>
vci. I would implement all three regulators and get them as bulk.<br>
See e.g. drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c<br>
for an example on how to get and enable several regulators<br>
using bulk.<br>
<br>
The regulator framework will provide dummy regulators if you<br>
didn&#39;t define some of them so it is fine to just provide one or two.<br=
>
<br></blockquote><div><br></div><div>Really appreciate your suggestion, wil=
l add to v2.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
Yours,<br>
Linus Walleij<br>
</blockquote></div></div>

--00000000000064709c05c79d1d01--

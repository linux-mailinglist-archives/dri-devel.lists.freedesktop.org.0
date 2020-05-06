Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7061C69B4
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 09:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A89146E82D;
	Wed,  6 May 2020 07:02:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B78C89E41
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 06:45:48 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id n11so733452ilj.4
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 23:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lvaoZuKBKXpFlpA5C0J+EMjnV9LE596vkA9s4ZS6L/8=;
 b=iN359gjylLMOb7LEa3z5hv5ElAB3LdkCy/ywo4eOeTPoWENmmAELeMCcD7u9PieepY
 Lhpy4cpNpw4APv14XssIqNqDaHyxVtPLzSgYoZjoaFbnjWBxrc5pgmbXhg5352U1Bas7
 gXZlcv4CDcrvuIO3yo2ye2PUVOCPOJRCvK+Wne4ZshRb6L7fGcy+NPkbxN7BnJzgLPz6
 2W/20nrCtKMw554ymLoeR9+R1GkKHn8gMw+EsTEinqmmtvUNmTaHnBZTpYPD/GemecZo
 io6J7StoPpjzE6PuTHL/yM7SPOc8juKMMrrlMUabsqlWTTAKCiEAVbrfmYCP9rPOHQu9
 /K2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lvaoZuKBKXpFlpA5C0J+EMjnV9LE596vkA9s4ZS6L/8=;
 b=APWUCrh09l8cvhxUTxMyQ50iPwACZ/yl4nFqY1zmNRjIvgB0Gr+8c6/R5QI2YwkDzc
 WXl33WIaIXvDIjXk3HLvaV5+4QfoW/m8Ezj0zIteZmXBy0Ya74TkZkj2ezBuGtEHIjNT
 GJDucbNaW0W5eEHtGTFv2lPid8lCyTJrz4APrMag7PGQiZ9SUmVIuZQLdZl00BQx7sNL
 Uk2hoTnavfR+GQLWQcxy9hlacm0JoNIrW51hHLUh2KlUW5/IlzsieyOez90P8OPhkWCC
 K4zgp9NEGuAejdUpY5FKhS4vuOvDfzObehc0YRk3TV5sFudMUmVecXTqbTm9RV+XAB7z
 czmQ==
X-Gm-Message-State: AGi0Puaut5fy24JYcVEV+KrhpWZHHEoSWD4/coJwiU1l1eGE4vMnLNpt
 PPMVZKkvyAW04kpsfOfUKDuWcc99yFdizGDGBWs=
X-Google-Smtp-Source: APiQypLhIFdue4tf1+DVFyehWNlt9KwOsn3tb9e2Xib2hxe1B83Zmdd09QxamCaSGfVbXFAfjUoSfuZOmvnEptPOemY=
X-Received: by 2002:a92:485b:: with SMTP id v88mr7465090ila.271.1588747547756; 
 Tue, 05 May 2020 23:45:47 -0700 (PDT)
MIME-Version: 1.0
References: <1588239802-11442-1-git-send-email-dillon.minfei@gmail.com>
 <33f928e7-3fde-99a2-b84d-d74a2d3f1186@st.com>
 <CAL9mu0+AqO69+rEcH=HVWRhDLbqDO52-Cjxt-PAZmg6=7QtpvQ@mail.gmail.com>
 <40bdf88c-fbc2-564c-1aec-38318bab5e61@st.com>
 <CAL9mu0KRPPrTUWggs2dQWPGjkyubUMpYx=3JzOpwTPQPHjsGhw@mail.gmail.com>
 <20200502063036.GA9204@ravnborg.org>
In-Reply-To: <20200502063036.GA9204@ravnborg.org>
From: dillon min <dillon.minfei@gmail.com>
Date: Wed, 6 May 2020 14:45:30 +0800
Message-ID: <CAL9mu0KS1UZkXXC8+xRcBv6Vw6CaGPchX8SMqkA-kM03BfowGQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] add dts node for drm panel driver ili9341 add dts
 i2c3 for stmpe touch add dts spi5 for gyro & ili9341
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Approved-At: Wed, 06 May 2020 07:02:40 +0000
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
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 mcoquelin.stm32@gmail.com
Content-Type: multipart/mixed; boundary="===============1966108008=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1966108008==
Content-Type: multipart/alternative; boundary="00000000000038cea005a4f51d70"

--00000000000038cea005a4f51d70
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sam Ravnborg <sam@ravnborg.org> =E4=BA=8E2020=E5=B9=B45=E6=9C=882=E6=97=A5=
=E5=91=A8=E5=85=AD =E4=B8=8B=E5=8D=882:30=E5=86=99=E9=81=93=EF=BC=9A

> Hi dillon min
>
> > > okay, thanks alexandre, i will go through these docs. currently i'm o=
n
> may
> > day holiday,  will be back at  next wensday.
> > after go back to work. i will separate this patch to five part with 9
> > patchs , should be more clear
> >
> > dts releated
> >     1,  ARM: dts: stm32: Add i2c3 node for stm32f429
> >     2,  ARM: dts: stm32: Add drm panel ili9341 nodes connect to ldtc
> > support for stm32f429-disco board
> >     3,  ARM: dts: stm32: Add stmpe811 touch screen support for
> > stm32f429-disco board
> >     4,  ARM: dts: stm32: Add l3gd20 gyroscope sensor support for
> > stm32f429-disco board
> >
> > clk releated
> >     1, clk: stm32: Fix ltdc loading hang in set clk rate, pll_hw set to
> > clks[PLL_VCO_SAI] but not clks[PLL_SAI]
> >     2, clk: stm32: Add CLK_IGNORE_UNUSED flags for ltdc, make sure ltdc
> clk
> > not be released after system startup
> >
> > spi releated
> >     1, spi: stm32: Add transfer mode SPI_SIMPLE_RX, SPI_3WIRE_RX suppor=
t
> > for stm32f4
> >
> > drm releated
> >     1, drm/panel: Add panel driver ilitek-ili9341
> >
> > doc releated
> >      1, dt-bindings: display: panel: Add binding document for Ilitek
> Ili9341
>
> Patch separation looks good.
> Please cc: me on both the binding and the panel patches.
> The binding must be in DT Schema format (.yaml).
> See a lot of examples in drm-misc-next for inspiration.
>
> Looks forward to see/review your submission.
>
>         Sam
>

hi Sam,

just sumbmit a patchset about ltdc with ili-9341 support on stm32f429-disco
board, with yaml
documents inside as well.

thanks,

Dillon,

--00000000000038cea005a4f51d70
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Sam Ravnborg &lt;<a href=3D"mailto:sa=
m@ravnborg.org">sam@ravnborg.org</a>&gt; =E4=BA=8E2020=E5=B9=B45=E6=9C=882=
=E6=97=A5=E5=91=A8=E5=85=AD =E4=B8=8B=E5=8D=882:30=E5=86=99=E9=81=93=EF=BC=
=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi dillon mi=
n<br>
<br>
&gt; &gt; okay, thanks alexandre, i will go through these docs. currently i=
&#39;m on may<br>
&gt; day holiday,=C2=A0 will be back at=C2=A0 next wensday.<br>
&gt; after go back to work. i will separate this patch to five part with 9<=
br>
&gt; patchs , should be more clear<br>
&gt; <br>
&gt; dts releated<br>
&gt;=C2=A0 =C2=A0 =C2=A01,=C2=A0 ARM: dts: stm32: Add i2c3 node for stm32f4=
29<br>
&gt;=C2=A0 =C2=A0 =C2=A02,=C2=A0 ARM: dts: stm32: Add drm panel ili9341 nod=
es connect to ldtc<br>
&gt; support for stm32f429-disco board<br>
&gt;=C2=A0 =C2=A0 =C2=A03,=C2=A0 ARM: dts: stm32: Add stmpe811 touch screen=
 support for<br>
&gt; stm32f429-disco board<br>
&gt;=C2=A0 =C2=A0 =C2=A04,=C2=A0 ARM: dts: stm32: Add l3gd20 gyroscope sens=
or support for<br>
&gt; stm32f429-disco board<br>
&gt; <br>
&gt; clk releated<br>
&gt;=C2=A0 =C2=A0 =C2=A01, clk: stm32: Fix ltdc loading hang in set clk rat=
e, pll_hw set to<br>
&gt; clks[PLL_VCO_SAI] but not clks[PLL_SAI]<br>
&gt;=C2=A0 =C2=A0 =C2=A02, clk: stm32: Add CLK_IGNORE_UNUSED flags for ltdc=
, make sure ltdc clk<br>
&gt; not be released after system startup<br>
&gt; <br>
&gt; spi releated<br>
&gt;=C2=A0 =C2=A0 =C2=A01, spi: stm32: Add transfer mode SPI_SIMPLE_RX, SPI=
_3WIRE_RX support<br>
&gt; for stm32f4<br>
&gt; <br>
&gt; drm releated<br>
&gt;=C2=A0 =C2=A0 =C2=A01, drm/panel: Add panel driver ilitek-ili9341<br>
&gt; <br>
&gt; doc releated<br>
&gt;=C2=A0 =C2=A0 =C2=A0 1, dt-bindings: display: panel: Add binding docume=
nt for Ilitek Ili9341<br>
<br>
Patch separation looks good.<br>
Please cc: me on both the binding and the panel patches.<br>
The binding must be in DT Schema format (.yaml).<br>
See a lot of examples in drm-misc-next for inspiration.<br>
<br>
Looks forward to see/review your submission.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Sam<br></blockquote><div><br></div><div>hi Sam,=
</div><div><br></div><div>just sumbmit a patchset about ltdc with ili-9341 =
support on stm32f429-disco board, with yaml</div><div>documents inside as w=
ell.</div><div><br></div><div>thanks,</div><div><br></div><div>Dillon,=C2=
=A0</div></div></div>

--00000000000038cea005a4f51d70--

--===============1966108008==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1966108008==--

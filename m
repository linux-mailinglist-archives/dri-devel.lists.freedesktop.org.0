Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 962C993B1E0
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 15:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7872D10E6C8;
	Wed, 24 Jul 2024 13:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jvvRbt/C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE07B10E211
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 12:58:33 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-52f0277daa5so3735510e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 05:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721739512; x=1722344312; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8edORPJm6xw6TDCSQ6Q02RVJfKFzM82Fr01x37bm5O0=;
 b=jvvRbt/C23x2Ie0chS9KHeuLnywRx27cJGbsvzfXFwBuQxWxPz88dvEVUwctJCoXO6
 3DVXTUbKgr3GKLb4e7irGa0E7Aa0BCZbxQIpAY52dc7assvLp1e2MmZspjL8aTfhjYvH
 d8KS4rayFeB00RCNtl3vHDhYKKL6U9pKaz9NnQIoq7ljPSnjovCm+Z4fRY67f7wrQT6Q
 hhdQukpPUplCEM63jGdLUURxs5w/7z7MWzRaZMsi/7JxL9SmwULxFFGW0kRvkgYVigpV
 crO7hMTVKjhTiyFy77RoyuwTMhf5xXLIRTkDAU2KTlLeVIAhyRbwjyEsBi6D5DzpkRB7
 0t5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721739512; x=1722344312;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8edORPJm6xw6TDCSQ6Q02RVJfKFzM82Fr01x37bm5O0=;
 b=TGvXZLP3+giCCjOprbOO3MMvpCEq5nLUANNJUippwb911R8zI8ac5XB2sNRcOIYyy3
 qCE/gv3C5ByZ8Hcmkg4yBkXuxxLzweZzLhqXmf/uQaZ4hyFQ4ai+3qv3kIqtIJpC0tHy
 yTNGNYmhRVdSta7jZQpEQjSYldda3+/hdUyv9IxG8wp2LTuSnBik1U+hR0cZR3QSPiCq
 ls+NanWM/jjFPOE+AtIXMpNLYyblHFv5aSuAoSMXRamC/pT7TVh91nHv4UYlFJMr2FwD
 vBfIlE6EkNqI9ahL4S0uN3VcowEK6BUH8eH+DxUDh7eWVch2tpkzjOLewz4jOxNBDjje
 RQmg==
X-Gm-Message-State: AOJu0YzeaCni4VXZcG9/cn7eAzcNbKFf032wkRcHnQFOqMBQZVe3F9zx
 OAEnaUIaATldyuU6h8MbvbBB+Hp2+VYVxcUwlfappUWfh9Zlx4fYQN9R28/Ol/WElNEe2BTjAwU
 xFskhN75xRoLA3QK+vNyPBFNUrnA=
X-Google-Smtp-Source: AGHT+IHJEAgsnTUd1Ey6uXhHX0LXuCyUzahCgIc9y0L8mO4+Y5XcSJttJuXU2tCHaupjQU+CuHVy38EIltgG+e2KDPY=
X-Received: by 2002:a05:6512:a87:b0:52e:7542:f469 with SMTP id
 2adb3069b0e04-52efb1a8d57mr5947735e87.0.1721739511432; Tue, 23 Jul 2024
 05:58:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240723060311.32043-1-riyandhiman14@gmail.com>
 <2024072339-elderly-charbroil-5d5d@gregkh>
In-Reply-To: <2024072339-elderly-charbroil-5d5d@gregkh>
From: Riyan Dhiman <riyandhiman14@gmail.com>
Date: Tue, 23 Jul 2024 18:28:19 +0530
Message-ID: <CAAjz0QbtK=c98QP5t76_=_Xrg4+3bHksXR=_QJfz0W0f_zZ=vA@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: remove unnecessary braces in if
 statements and space before close parenthesis in function call
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="000000000000f993b5061de9b7e2"
X-Mailman-Approved-At: Wed, 24 Jul 2024 13:42:47 +0000
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

--000000000000f993b5061de9b7e2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thank you for your feedback on my patch submission.
I have reviewed the mailing list traffic and noted that the last patch
addressing the same coding style issue was submitted in April. Given this
timeframe, I believed it was appropriate to submit my patch to contribute
to the resolution of the ongoing issue.
As this is my first contribution to the Linux kernel, I want to ensure that
my submission aligns with the requirements. I would greatly appreciate your
guidance on how to improve my patch and avoid duplicating previous efforts.

Thank you for your time and consideration.

Best regards,
Riyan Dhiman

On Tue, Jul 23, 2024 at 1:13=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:

> On Tue, Jul 23, 2024 at 11:33:11AM +0530, Riyan Dhiman wrote:
> > Adhere to Linux kernel coding style.
> >
> > Reported by checkpatch:
> >
> > CHECK: Unnecessary parentheses around 'devcode !=3D 0x0000'
> > CHECK: Unnecessary parentheses around 'devcode !=3D 0x9320'
> > CHECK: Unnecessary parentheses around 'par->info->var.xres =3D=3D 320'
> > CHECK: Unnecessary parentheses around 'par->info->var.yres =3D=3D 240'
> > CHECK: Unnecessary parentheses around 'par->spi->bits_per_word =3D=3D 8=
'
> > CHECK: Unnecessary parentheses around '!txbuflen'
> > CHECK: Unnecessary parentheses around 'bpp > 8'
> > ERROR: space prohibited before that close parenthesis ')'
> >
> > Signed-off-by: Riyan Dhiman <riyandhiman14@gmail.com>
> > ---
> >  drivers/staging/fbtft/fb_ili9320.c | 2 +-
> >  drivers/staging/fbtft/fb_ra8875.c  | 2 +-
> >  drivers/staging/fbtft/fbtft-bus.c  | 6 +++---
> >  drivers/staging/fbtft/fbtft-core.c | 2 +-
> >  4 files changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/staging/fbtft/fb_ili9320.c
> b/drivers/staging/fbtft/fb_ili9320.c
> > index 0be7c2d51548..409b54cc562e 100644
> > --- a/drivers/staging/fbtft/fb_ili9320.c
> > +++ b/drivers/staging/fbtft/fb_ili9320.c
> > @@ -37,7 +37,7 @@ static int init_display(struct fbtft_par *par)
> >       devcode =3D read_devicecode(par);
> >       fbtft_par_dbg(DEBUG_INIT_DISPLAY, par, "Device code: 0x%04X\n",
> >                     devcode);
> > -     if ((devcode !=3D 0x0000) && (devcode !=3D 0x9320))
> > +     if (devcode !=3D 0x0000 && devcode !=3D 0x9320)
> >               dev_warn(par->info->device,
> >                        "Unrecognized Device code: 0x%04X (expected
> 0x9320)\n",
> >                       devcode);
> > diff --git a/drivers/staging/fbtft/fb_ra8875.c
> b/drivers/staging/fbtft/fb_ra8875.c
> > index 398bdbf53c9a..ce305a0bea48 100644
> > --- a/drivers/staging/fbtft/fb_ra8875.c
> > +++ b/drivers/staging/fbtft/fb_ra8875.c
> > @@ -50,7 +50,7 @@ static int init_display(struct fbtft_par *par)
> >
> >       par->fbtftops.reset(par);
> >
> > -     if ((par->info->var.xres =3D=3D 320) && (par->info->var.yres =3D=
=3D 240)) {
> > +     if (par->info->var.xres =3D=3D 320 && par->info->var.yres =3D=3D =
240) {
> >               /* PLL clock frequency */
> >               write_reg(par, 0x88, 0x0A);
> >               write_reg(par, 0x89, 0x02);
> > diff --git a/drivers/staging/fbtft/fbtft-bus.c
> b/drivers/staging/fbtft/fbtft-bus.c
> > index 3d422bc11641..02d7dbd38678 100644
> > --- a/drivers/staging/fbtft/fbtft-bus.c
> > +++ b/drivers/staging/fbtft/fbtft-bus.c
> > @@ -62,9 +62,9 @@ out:
>                             \
> >  }
>        \
> >  EXPORT_SYMBOL(func);
> >
> > -define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
> > +define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8,)
> >  define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be1=
6)
> > -define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
> > +define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16,)
> >
> >  void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
> >  {
> > @@ -85,7 +85,7 @@ void fbtft_write_reg8_bus9(struct fbtft_par *par, int
> len, ...)
> >       if (len <=3D 0)
> >               return;
> >
> > -     if (par->spi && (par->spi->bits_per_word =3D=3D 8)) {
> > +     if (par->spi && par->spi->bits_per_word =3D=3D 8) {
> >               /* we're emulating 9-bit, pad start of buffer with no-ops
> >                * (assuming here that zero is a no-op)
> >                */
> > diff --git a/drivers/staging/fbtft/fbtft-core.c
> b/drivers/staging/fbtft/fbtft-core.c
> > index 8e2fd0c0fee2..53b104559502 100644
> > --- a/drivers/staging/fbtft/fbtft-core.c
> > +++ b/drivers/staging/fbtft/fbtft-core.c
> > @@ -666,7 +666,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct
> fbtft_display *display,
> >               txbuflen =3D 0;
> >
> >  #ifdef __LITTLE_ENDIAN
> > -     if ((!txbuflen) && (bpp > 8))
> > +     if (!txbuflen && bpp > 8)
> >               txbuflen =3D PAGE_SIZE; /* need buffer for byteswapping *=
/
> >  #endif
> >
> > --
> > 2.39.2
> >
> >
>
> Hi,
>
> This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
> a patch that has triggered this response.  He used to manually respond
> to these common problems, but in order to save his sanity (he kept
> writing the same thing over and over, yet to different people), I was
> created.  Hopefully you will not take offence and will fix the problem
> in your patch and resubmit it so that it can be accepted into the Linux
> kernel tree.
>
> You are receiving this message because of the following common error(s)
> as indicated below:
>
> - You sent a patch that has been sent multiple times in the past, and is
>   identical to ones that has been recently rejected.  Please always look
>   at the mailing list traffic to determine if you are duplicating other
>   people's work.
>
> If you wish to discuss this problem further, or you have questions about
> how to resolve this issue, please feel free to respond to this email and
> Greg will reply once he has dug out from the pending patches received
> from other developers.
>
> thanks,
>
> greg k-h's patch email bot
>

--000000000000f993b5061de9b7e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><p>Thank you for your feedback on my patch submiss=
ion.<br>I have reviewed the mailing list traffic and noted that the last pa=
tch addressing the same coding style issue was submitted in April. Given th=
is timeframe, I believed it was appropriate to submit my patch to contribut=
e to the resolution of the ongoing issue.<br>As this is my first contributi=
on to the Linux kernel, I want to ensure that my submission aligns with the=
 requirements. I would greatly appreciate your guidance on how to improve m=
y patch and avoid duplicating previous efforts.<br><br>Thank you for your t=
ime and consideration.</p><p>Best regards,<br>Riyan Dhiman</p></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue,=
 Jul 23, 2024 at 1:13=E2=80=AFPM Greg KH &lt;<a href=3D"mailto:gregkh@linux=
foundation.org">gregkh@linuxfoundation.org</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On Tue, Jul 23, 2024 at 11:33:11A=
M +0530, Riyan Dhiman wrote:<br>
&gt; Adhere to Linux kernel coding style.<br>
&gt; <br>
&gt; Reported by checkpatch:<br>
&gt; <br>
&gt; CHECK: Unnecessary parentheses around &#39;devcode !=3D 0x0000&#39;<br=
>
&gt; CHECK: Unnecessary parentheses around &#39;devcode !=3D 0x9320&#39;<br=
>
&gt; CHECK: Unnecessary parentheses around &#39;par-&gt;info-&gt;var.xres =
=3D=3D 320&#39;<br>
&gt; CHECK: Unnecessary parentheses around &#39;par-&gt;info-&gt;var.yres =
=3D=3D 240&#39;<br>
&gt; CHECK: Unnecessary parentheses around &#39;par-&gt;spi-&gt;bits_per_wo=
rd =3D=3D 8&#39;<br>
&gt; CHECK: Unnecessary parentheses around &#39;!txbuflen&#39;<br>
&gt; CHECK: Unnecessary parentheses around &#39;bpp &gt; 8&#39;<br>
&gt; ERROR: space prohibited before that close parenthesis &#39;)&#39;<br>
&gt; <br>
&gt; Signed-off-by: Riyan Dhiman &lt;<a href=3D"mailto:riyandhiman14@gmail.=
com" target=3D"_blank">riyandhiman14@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/staging/fbtft/fb_ili9320.c | 2 +-<br>
&gt;=C2=A0 drivers/staging/fbtft/fb_ra8875.c=C2=A0 | 2 +-<br>
&gt;=C2=A0 drivers/staging/fbtft/fbtft-bus.c=C2=A0 | 6 +++---<br>
&gt;=C2=A0 drivers/staging/fbtft/fbtft-core.c | 2 +-<br>
&gt;=C2=A0 4 files changed, 6 insertions(+), 6 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/staging/fbtft/fb_ili9320.c b/drivers/staging/fbtf=
t/fb_ili9320.c<br>
&gt; index 0be7c2d51548..409b54cc562e 100644<br>
&gt; --- a/drivers/staging/fbtft/fb_ili9320.c<br>
&gt; +++ b/drivers/staging/fbtft/fb_ili9320.c<br>
&gt; @@ -37,7 +37,7 @@ static int init_display(struct fbtft_par *par)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0devcode =3D read_devicecode(par);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fbtft_par_dbg(DEBUG_INIT_DISPLAY, par, &quot=
;Device code: 0x%04X\n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0devcode);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if ((devcode !=3D 0x0000) &amp;&amp; (devcode !=
=3D 0x9320))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (devcode !=3D 0x0000 &amp;&amp; devcode !=3D 0=
x9320)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(par-&gt=
;info-&gt;device,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;Unrecognized Device code: 0x%04X (expected 0x9320)\n&qu=
ot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0devcode);<br>
&gt; diff --git a/drivers/staging/fbtft/fb_ra8875.c b/drivers/staging/fbtft=
/fb_ra8875.c<br>
&gt; index 398bdbf53c9a..ce305a0bea48 100644<br>
&gt; --- a/drivers/staging/fbtft/fb_ra8875.c<br>
&gt; +++ b/drivers/staging/fbtft/fb_ra8875.c<br>
&gt; @@ -50,7 +50,7 @@ static int init_display(struct fbtft_par *par)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0par-&gt;fbtftops.reset(par);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0if ((par-&gt;info-&gt;var.xres =3D=3D 320) &amp;&=
amp; (par-&gt;info-&gt;var.yres =3D=3D 240)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (par-&gt;info-&gt;var.xres =3D=3D 320 &amp;&am=
p; par-&gt;info-&gt;var.yres =3D=3D 240) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* PLL clock fre=
quency */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_reg(par, 0=
x88, 0x0A);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_reg(par, 0=
x89, 0x02);<br>
&gt; diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft=
/fbtft-bus.c<br>
&gt; index 3d422bc11641..02d7dbd38678 100644<br>
&gt; --- a/drivers/staging/fbtft/fbtft-bus.c<br>
&gt; +++ b/drivers/staging/fbtft/fbtft-bus.c<br>
&gt; @@ -62,9 +62,9 @@ out:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 \<br>
&gt;=C2=A0 }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;=C2=A0 EXPORT_SYMBOL(func);<br>
&gt;=C2=A0 <br>
&gt; -define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )<br>
&gt; +define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8,)<br>
&gt;=C2=A0 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_=
to_be16)<br>
&gt; -define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )<br>
&gt; +define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16,)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)<=
br>
&gt;=C2=A0 {<br>
&gt; @@ -85,7 +85,7 @@ void fbtft_write_reg8_bus9(struct fbtft_par *par, in=
t len, ...)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (len &lt;=3D 0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (par-&gt;spi &amp;&amp; (par-&gt;spi-&gt;bits_=
per_word =3D=3D 8)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (par-&gt;spi &amp;&amp; par-&gt;spi-&gt;bits_p=
er_word =3D=3D 8) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* we&#39;re emu=
lating 9-bit, pad start of buffer with no-ops<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * (assuming her=
e that zero is a no-op)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtf=
t/fbtft-core.c<br>
&gt; index 8e2fd0c0fee2..53b104559502 100644<br>
&gt; --- a/drivers/staging/fbtft/fbtft-core.c<br>
&gt; +++ b/drivers/staging/fbtft/fbtft-core.c<br>
&gt; @@ -666,7 +666,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbt=
ft_display *display,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0txbuflen =3D 0;<=
br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #ifdef __LITTLE_ENDIAN<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if ((!txbuflen) &amp;&amp; (bpp &gt; 8))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!txbuflen &amp;&amp; bpp &gt; 8)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0txbuflen =3D PAG=
E_SIZE; /* need buffer for byteswapping */<br>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.39.2<br>
&gt; <br>
&gt; <br>
<br>
Hi,<br>
<br>
This is the friendly patch-bot of Greg Kroah-Hartman.=C2=A0 You have sent h=
im<br>
a patch that has triggered this response.=C2=A0 He used to manually respond=
<br>
to these common problems, but in order to save his sanity (he kept<br>
writing the same thing over and over, yet to different people), I was<br>
created.=C2=A0 Hopefully you will not take offence and will fix the problem=
<br>
in your patch and resubmit it so that it can be accepted into the Linux<br>
kernel tree.<br>
<br>
You are receiving this message because of the following common error(s)<br>
as indicated below:<br>
<br>
- You sent a patch that has been sent multiple times in the past, and is<br=
>
=C2=A0 identical to ones that has been recently rejected.=C2=A0 Please alwa=
ys look<br>
=C2=A0 at the mailing list traffic to determine if you are duplicating othe=
r<br>
=C2=A0 people&#39;s work.<br>
<br>
If you wish to discuss this problem further, or you have questions about<br=
>
how to resolve this issue, please feel free to respond to this email and<br=
>
Greg will reply once he has dug out from the pending patches received<br>
from other developers.<br>
<br>
thanks,<br>
<br>
greg k-h&#39;s patch email bot<br>
</blockquote></div>

--000000000000f993b5061de9b7e2--

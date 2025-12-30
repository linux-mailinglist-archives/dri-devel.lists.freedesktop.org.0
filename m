Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1884ACEB9E2
	for <lists+dri-devel@lfdr.de>; Wed, 31 Dec 2025 09:54:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6942B10E995;
	Wed, 31 Dec 2025 08:54:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="giEYITE2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7CDC10E652
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 23:21:41 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-c2a9a9b43b1so4142179a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 15:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767136901; x=1767741701; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lolgzX29BLdymn1JgvhHwpIVgxKMcXZxKgRDRKlTL8I=;
 b=giEYITE2NCs/U4xSVFor9QysjfiPqWOIfzvlM4iGNERJYodw7IQEFo//qbSWCFCTbn
 cJkInwJSG9ymw1/9QSt28SAbro/b0mIu6UarGYLIqBcO8adYHptk08Zic5GnNbqnQ9gE
 E87kJhd1/i0vYxGhJqNbpUZjUIE856bVrjDl3Hj+YVRCFq7N9K27OgAgMYi/BPeu28gR
 +yB3hAWA76mYGbrMjMWfXvaUddyYiLeXNgy3iRXreycEhHXU1VWnXyJjBAJcaNQHBLcb
 U5MnLYiN6WTOF4u4PTC17zoO4MwQA2tWR0kD/+WLfxSF78E4oN3T8+EMp0XfkoFxvw6j
 yufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767136901; x=1767741701;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lolgzX29BLdymn1JgvhHwpIVgxKMcXZxKgRDRKlTL8I=;
 b=ZMAGb/8AutXvz958xhIk6L61GDR4bcaRXFLikQgJZ0eZA6pqhRtirbd5iB8p0Qf6+T
 +soHWsrU7fqMySZx21buHYEzQy1oelVJ3sO/f5ByGI2uKH2niaZjXajUy+c2vjJTU7NA
 YbAWZtSC5Js1w5LggGqp7n1XJsBc2On99i7Qb4BKEUlWjJnSmf7F/7gJ+RN2vUzll5J9
 ohY7w6SvgRlEoRqpQSeU64u4J8zNzNE40AGjeFBvYa306XyyVxw+ZSjSMy6QnjsgveVS
 ebUDlfriIyIHAxCtGnfSChWQQP0IjRT5xgMndABEf/8ETK6ZuZAhnD00Ejt43pSvAgYa
 Arog==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjdns0WY1UfsbNkRruEh+gkfzDWL5UZQt7LzQCtwhkwQxobMgs5+a4h3WK6QtQ2bmiqdrw5wjVsPU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+QettQ/iiWjBVYtahZyPmWgYjioVEIk6r1z8ViFkbsKeuBoNm
 J8QZLNcKRLa2h7FZ/AfVYYBtldr+mq1pdCzmnSqbOQlK3GUgLNOqhFZ0y/1XXjc9lOYluy8T0KA
 zD3SgTbsNWxotqzBam7viJ5TCt71Fux1oFw==
X-Gm-Gg: AY/fxX4nbj6eNmCrLWX7qe8lsXQ7hLgsH+Fljyce9qdzm8HjHVM9newkQfhOBMJxREC
 5eFT6RR+bUKVX/oyW090DCVfeZEQPC1JgSMfeP5uP9k7l0o1G5zpMreThSOg8NlZDijcX5BjEAr
 P9/7K3GOO6BpG+8c9wL7FaW6b0VMU4//EO8l+G8I/GoOCu6eVCiJkXLF6uaQxLklZ4hxgaplbOx
 IH2w7A/zwzzWxN4tRKzhjVfcykHJKzzPRJyzF20VWK2LSnArUmfdHYuThd07DnQrEW6mi/+Vgj4
 4ob0UOvUG+5nWIj8PzIbdUI=
X-Google-Smtp-Source: AGHT+IHuxCEFA5SMaGglQ+DfobFVofg/lhV4LIp/88qjSy795he9Ngfu7yfI3FGmckH+4xB7CMm0o/wR/pBClSSyE9M=
X-Received: by 2002:a05:7022:4287:b0:11b:9386:8268 with SMTP id
 a92af1059eb24-12172302173mr32431016c88.45.1767136901025; Tue, 30 Dec 2025
 15:21:41 -0800 (PST)
MIME-Version: 1.0
References: <20251215225305.3820098-1-patdiviyam@gmail.com>
 <c3253bfe-e967-48ae-9376-a65ad1d53419@gmx.de>
In-Reply-To: <c3253bfe-e967-48ae-9376-a65ad1d53419@gmx.de>
From: Diviyam Pat <patdiviyam@gmail.com>
Date: Wed, 31 Dec 2025 04:51:30 +0530
X-Gm-Features: AQt7F2rMUIqK0c2KHJ5k6vp8SnVBVp_h9hKwDJbrUYWxEwCkoHL5-ScAA7MKIxk
Message-ID: <CAM19b+s73Fo6Ej85qk72UPn12VQ_iFAYpHv7K=wOapb0-+1XBA@mail.gmail.com>
Subject: Re: [PATCH] fbdev: xilinxfb: request memory region before mapping
 framebuffer
To: Helge Deller <deller@gmx.de>
Cc: tzimmermann@suse.de, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="0000000000004154f40647339f43"
X-Mailman-Approved-At: Wed, 31 Dec 2025 08:54:47 +0000
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

--0000000000004154f40647339f43
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi
No, this wasn't tested on actual hardware. I don't have access to it. If
someone is able to it that would be great.

Thanks
Diviyam

On Tue, 30 Dec, 2025, 3:27=E2=80=AFpm Helge Deller, <deller@gmx.de> wrote:

> On 12/15/25 23:53, patdiviyam@gmail.com wrote:
> > From: DiviyamPathak <patdiviyam@gmail.com>
> >
> > The xilinxfb driver maps a physical framebuffer address with ioremap()
> > without first reserving the memory region. This can conflict with other
> > drivers accessing the same resource.
> >
> > Request the memory region with devm_request_mem_region() before mapping
> > the framebuffer and use managed mappings for proper lifetime handling.
> >
> > This addresses the fbdev TODO about requesting memory regions and avoid=
s
> > potential resource conflicts.
> >
> > Signed-off-by: DiviyamPathak <patdiviyam@gmail.com>
>
> Was it tested it on physical hardware?
> If not, could someone test?
>
> Helge
>
>
> > ---
> >   drivers/video/fbdev/xilinxfb.c | 30 +++++++++++++++++-------------
> >   1 file changed, 17 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/video/fbdev/xilinxfb.c
> b/drivers/video/fbdev/xilinxfb.c
> > index 0a6e05cd155a..f18437490de8 100644
> > --- a/drivers/video/fbdev/xilinxfb.c
> > +++ b/drivers/video/fbdev/xilinxfb.c
> > @@ -280,19 +280,27 @@ static int xilinxfb_assign(struct platform_device
> *pdev,
> >       /* Allocate the framebuffer memory */
> >       if (pdata->fb_phys) {
> >               drvdata->fb_phys =3D pdata->fb_phys;
> > -             drvdata->fb_virt =3D ioremap(pdata->fb_phys, fbsize);
> > +             /* Request the memory region before mapping */
> > +             if (!devm_request_mem_region(dev, pdata->fb_phys, fbsize,
> > +                                     DRIVER_NAME)) {
> > +                     dev_err(dev, "Cannot request framebuffer memory
> region\n");
> > +                     return -EBUSY;
> > +             }
> > +             drvdata->fb_virt =3D devm_ioremap(dev, pdata->fb_phys,
> fbsize);
> > +             if (!drvdata->fb_virt) {
> > +                     dev_err(dev, "Could not map framebuffer memory\n"=
);
> > +                     return -ENOMEM;
> > +             }
> >       } else {
> >               drvdata->fb_alloced =3D 1;
> >               drvdata->fb_virt =3D dma_alloc_coherent(dev,
> PAGE_ALIGN(fbsize),
> > -                                                   &drvdata->fb_phys,
> > -                                                   GFP_KERNEL);
> > -     }
> > -
> > -     if (!drvdata->fb_virt) {
> > -             dev_err(dev, "Could not allocate frame buffer memory\n");
> > -             return -ENOMEM;
> > +                                     &drvdata->fb_phys,
> > +                                     GFP_KERNEL);
> > +             if (!drvdata->fb_virt) {
> > +                     dev_err(dev, "Could not allocate frame buffer
> memory\n");
> > +                     return -ENOMEM;
> > +             }
> >       }
> > -
> >       /* Clear (turn to black) the framebuffer */
> >       memset_io((void __iomem *)drvdata->fb_virt, 0, fbsize);
> >
> > @@ -362,8 +370,6 @@ static int xilinxfb_assign(struct platform_device
> *pdev,
> >       if (drvdata->fb_alloced)
> >               dma_free_coherent(dev, PAGE_ALIGN(fbsize),
> drvdata->fb_virt,
> >                                 drvdata->fb_phys);
> > -     else
> > -             iounmap(drvdata->fb_virt);
> >
> >       /* Turn off the display */
> >       xilinx_fb_out32(drvdata, REG_CTRL, 0);
> > @@ -386,8 +392,6 @@ static void xilinxfb_release(struct device *dev)
> >       if (drvdata->fb_alloced)
> >               dma_free_coherent(dev,
> PAGE_ALIGN(drvdata->info.fix.smem_len),
> >                                 drvdata->fb_virt, drvdata->fb_phys);
> > -     else
> > -             iounmap(drvdata->fb_virt);
> >
> >       /* Turn off the display */
> >       xilinx_fb_out32(drvdata, REG_CTRL, 0);
>
>

--0000000000004154f40647339f43
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi=C2=A0<div dir=3D"auto">No, this wasn&#39;t tested on a=
ctual hardware. I don&#39;t have access to it. If someone is able to it tha=
t=C2=A0would be great.</div><div dir=3D"auto"><br></div><div dir=3D"auto">T=
hanks</div><div dir=3D"auto">Diviyam=C2=A0</div></div><br><div class=3D"gma=
il_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tu=
e, 30 Dec, 2025, 3:27=E2=80=AFpm Helge Deller, &lt;<a href=3D"mailto:deller=
@gmx.de">deller@gmx.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">On 12/15/25 23:53, <a href=3D"mailto:patdiviyam@gmail.com" target=3D"_bl=
ank" rel=3D"noreferrer">patdiviyam@gmail.com</a> wrote:<br>
&gt; From: DiviyamPathak &lt;<a href=3D"mailto:patdiviyam@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">patdiviyam@gmail.com</a>&gt;<br>
&gt; <br>
&gt; The xilinxfb driver maps a physical framebuffer address with ioremap()=
<br>
&gt; without first reserving the memory region. This can conflict with othe=
r<br>
&gt; drivers accessing the same resource.<br>
&gt; <br>
&gt; Request the memory region with devm_request_mem_region() before mappin=
g<br>
&gt; the framebuffer and use managed mappings for proper lifetime handling.=
<br>
&gt; <br>
&gt; This addresses the fbdev TODO about requesting memory regions and avoi=
ds<br>
&gt; potential resource conflicts.<br>
&gt; <br>
&gt; Signed-off-by: DiviyamPathak &lt;<a href=3D"mailto:patdiviyam@gmail.co=
m" target=3D"_blank" rel=3D"noreferrer">patdiviyam@gmail.com</a>&gt;<br>
<br>
Was it tested it on physical hardware?<br>
If not, could someone test?<br>
<br>
Helge<br>
<br>
<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0drivers/video/fbdev/xilinxfb.c | 30 +++++++++++++++++-----=
--------<br>
&gt;=C2=A0 =C2=A01 file changed, 17 insertions(+), 13 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/video/fbdev/xilinxfb.c b/drivers/video/fbdev/xili=
nxfb.c<br>
&gt; index 0a6e05cd155a..f18437490de8 100644<br>
&gt; --- a/drivers/video/fbdev/xilinxfb.c<br>
&gt; +++ b/drivers/video/fbdev/xilinxfb.c<br>
&gt; @@ -280,19 +280,27 @@ static int xilinxfb_assign(struct platform_devic=
e *pdev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Allocate the framebuffer memory */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pdata-&gt;fb_phys) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drvdata-&gt;fb_p=
hys =3D pdata-&gt;fb_phys;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drvdata-&gt;fb_virt =
=3D ioremap(pdata-&gt;fb_phys, fbsize);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Request the memory=
 region before mapping */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!devm_request_mem=
_region(dev, pdata-&gt;fb_phys, fbsize,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRIVER_NAME)=
) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dev_err(dev, &quot;Cannot request framebuffer memory region\n&quot;)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return -EBUSY;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drvdata-&gt;fb_virt =
=3D devm_ioremap(dev, pdata-&gt;fb_phys, fbsize);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!drvdata-&gt;fb_v=
irt) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dev_err(dev, &quot;Could not map framebuffer memory\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return -ENOMEM;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drvdata-&gt;fb_a=
lloced =3D 1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drvdata-&gt;fb_v=
irt =3D dma_alloc_coherent(dev, PAGE_ALIGN(fbsize),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;drvdata-&gt;fb_phys,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GFP_KERNEL);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (!drvdata-&gt;fb_virt) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;Co=
uld not allocate frame buffer memory\n&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;drvdata=
-&gt;fb_phys,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GFP_KERNEL);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!drvdata-&gt;fb_v=
irt) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dev_err(dev, &quot;Could not allocate frame buffer memory\n&quot;);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return -ENOMEM;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Clear (turn to black) the framebuffer */<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0memset_io((void __iomem *)drvdata-&gt;fb_vir=
t, 0, fbsize);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -362,8 +370,6 @@ static int xilinxfb_assign(struct platform_device =
*pdev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (drvdata-&gt;fb_alloced)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_free_coheren=
t(dev, PAGE_ALIGN(fbsize), drvdata-&gt;fb_virt,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drvdata-&gt;fb_phys);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iounmap(drvdata-&gt;f=
b_virt);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Turn off the display */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0xilinx_fb_out32(drvdata, REG_CTRL, 0);<br>
&gt; @@ -386,8 +392,6 @@ static void xilinxfb_release(struct device *dev)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (drvdata-&gt;fb_alloced)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_free_coheren=
t(dev, PAGE_ALIGN(drvdata-&gt;info.fix.smem_len),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drvdata-&gt;fb_virt, drvdat=
a-&gt;fb_phys);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iounmap(drvdata-&gt;f=
b_virt);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Turn off the display */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0xilinx_fb_out32(drvdata, REG_CTRL, 0);<br>
<br>
</blockquote></div>

--0000000000004154f40647339f43--

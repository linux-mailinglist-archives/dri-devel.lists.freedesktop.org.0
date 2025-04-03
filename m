Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D90A7A57D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 16:43:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E3C10E9E5;
	Thu,  3 Apr 2025 14:43:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OZdZ5/kw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141DC10E9E5
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 14:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743691421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G0/3xF7LqKpHtjllUeSgNdL9BkYbSzaTgS+iogKs1P0=;
 b=OZdZ5/kwbGLH0y9Ft5AC5iycEwwcaBMOjPKrXon3/AI4KH/hYDVHZy+1SIqAn1nzj0DyhD
 H2LTdBOs/0VXMIPyb5ojFoxc/wQ+U1/bJzcPS01fDsBdoHXRsFN9I5vPuJZiOTBAKnSKiZ
 BZnKc/LDw16KsHAq2LMabYclhEESKXE=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-5LuGOogrNn6WHZLpeETpYw-1; Thu, 03 Apr 2025 10:43:39 -0400
X-MC-Unique: 5LuGOogrNn6WHZLpeETpYw-1
X-Mimecast-MFC-AGG-ID: 5LuGOogrNn6WHZLpeETpYw_1743691419
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-6fec94421f8so15284587b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Apr 2025 07:43:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743691419; x=1744296219;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G0/3xF7LqKpHtjllUeSgNdL9BkYbSzaTgS+iogKs1P0=;
 b=pZfM1hUkj3A0JbRz3aI8tGEq9YGYP/Nnna3s6VXsvkv1Cpy/f1BFDNV1zkNyuP2q2X
 Uvf/Qb65LAX8/B8u3M9y4by+K5P/4Gzz3R2+rM6iFhht8NpKoH+cvT9zM7WNU4+8KDN8
 tdIIemRNL4k3FQ4bFAlH5BGrSsBWeJo/JM0h7vVC8canSXamVTXTC8vMiSZKTDxqwz/n
 m599JYlsP9vCWX/qMpWJLfHmGyGih14it8VXNl7EZrpDqGv0Uxp7lv9Xigc4S9SSI0Mv
 AQLmCJPEbyCvkqE7V7S6KnrpZM/foH/Iv0zQde3uowxRPF/Kd0tciUMq2qRNe1RP2dAp
 ZBXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuPjnFieCyaGWQ1aehZ8688DEDBN7frKBhH4CooT1O/OWk3yXUV09vh2WMXa1PcNr7HaqJNtkngc4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwA30Wwj8wEWPJ42EFmKozgQNcTkpLGC/4wKB8sxOTX/VzkiNA5
 5ohk7fQCLfQoEJMmMkBhYusakOwELnno7trK6FBbwrE3X2kTgYVjfzDadKMRGhkw0K4th9IbHty
 Voew9N8wa6KrhwnN8FKgXrn43stIbXXE3nruHmXB8NC1i0M7GwXN4bsYlPnBWJEO5AyReS6Ac9X
 DT4d+Pj+U23NWmpUOAXFYUnsppfCc44Jv9NDjT5oEJ
X-Gm-Gg: ASbGncv50XisIWXvIv/4xuqm+lHA0zx26rMiaH18Sl6NgRyzPXU+gxNaAHtjliHqYTV
 i+8Ed1v/Pvi3rj3vKKZcqNB8f5WuZ9yjrTXcDLykgECVggTxl2cO1vppGGl0vbd54EcKSi+I=
X-Received: by 2002:a05:690c:4c07:b0:6f9:a3c6:b2e4 with SMTP id
 00721157ae682-703d08b9668mr57470467b3.37.1743691419228; 
 Thu, 03 Apr 2025 07:43:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEy0jWUEBPrwVi5+cp4UiEoK2GwZruFeMmvvFiZ/FfQJ3rvFuOg36l+02AtRrya7XMe57ywC9rDPaJzzKe6+QQ=
X-Received: by 2002:a05:690c:4c07:b0:6f9:a3c6:b2e4 with SMTP id
 00721157ae682-703d08b9668mr57469947b3.37.1743691418913; Thu, 03 Apr 2025
 07:43:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250402-b4-drm_panel_mass_convert_part2-v1-0-903b70999ea6@redhat.com>
 <20250402-b4-drm_panel_mass_convert_part2-v1-7-903b70999ea6@redhat.com>
 <75q6u7kgyhveuzlxujoocvqfzilaxsvh3udzeltk2itwigy2n3@f5sqxddtjxuf>
In-Reply-To: <75q6u7kgyhveuzlxujoocvqfzilaxsvh3udzeltk2itwigy2n3@f5sqxddtjxuf>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 3 Apr 2025 09:42:05 -0400
X-Gm-Features: ATxdqUGIuvmtYOcLysnbRX-17l-WfrVBjLqnj3qYOgi5YL2_hLuPabNHBYRCCfE
Message-ID: <CAN9Xe3QpdbCW_802yxp5h3OHLf0hMA6diY=HZjR07-shggNsBg@mail.gmail.com>
Subject: Re: [PATCH 07/30] panel/ilitek-ili9341: Use refcounted allocation in
 place of devm_kzalloc()
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, 
 Anusha Srivatsa <asrivats@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Michael Trimarchi <michael@amarulasolutions.com>, 
 Michael Walle <mwalle@kernel.org>, Jagan Teki <jagan@edgeble.ai>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, Linus Walleij <linus.walleij@linaro.org>, 
 Jianhua Lu <lujianhua000@gmail.com>, Stefan Mavrodiev <stefan@olimex.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aKQRObt5-JIC6ouTtHkMPYdq5S7sJJgBfI7G-vx2sFw_1743691419
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000009f5f650631e0cb11"
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

--0000000000009f5f650631e0cb11
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 5:09=E2=80=AFPM Ond=C5=99ej Jirman <megi@xff.cz> wro=
te:

> Hi Anusha,
>
> On Wed, Apr 02, 2025 at 11:23:45AM -0400, Anusha Srivatsa wrote:
> > Move to using the new API devm_drm_panel_alloc() to allocate the
> > panel.
> >
> > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> > ---
> >  drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> > index
> ff39f5dd4097e8da0a0e16c50c5bfd45c078d91c..d87b7eefe9beedd290fb59065b389b3=
315c85720
> 100644
> > --- a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> > +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> > @@ -490,9 +490,11 @@ static int ili9341_dpi_probe(struct spi_device
> *spi, struct gpio_desc *dc,
> >       struct ili9341 *ili;
> >       int ret;
> >
> > -     ili =3D devm_kzalloc(dev, sizeof(struct ili9341), GFP_KERNEL);
> > -     if (!ili)
> > -             return -ENOMEM;
> > +     ili =3D devm_drm_panel_alloc(dev, struct ili9341, panel,
> > +                                &ili9341_dpi_funcs,
> > +                                DRM_MODE_CONNECTOR_DPI);
> > +     if (IS_ERR(ili))
> > +             return PTR_ERR(ili);
> >
> >       ili->dbi =3D devm_kzalloc(dev, sizeof(struct mipi_dbi),
> >                               GFP_KERNEL);
>
> Unlike in other patches, in this one you did not remove:
>
>
> https://elixir.bootlin.com/linux/v6.13.7/source/drivers/gpu/drm/panel/pan=
el-ilitek-ili9341.c#L529
>
>         drm_panel_init(&ili->panel, dev, &ili9341_dpi_funcs,
>                        DRM_MODE_CONNECTOR_DPI);
>
> Unintentional?
>
> Yup. Unintentional. WIll remove this in the next iteration.

Thanks!
Anusha

> kind regards,
>         o.
>
> > --
> > 2.48.1
> >
>
>

--0000000000009f5f650631e0cb11
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 2, =
2025 at 5:09=E2=80=AFPM Ond=C5=99ej Jirman &lt;<a href=3D"mailto:megi@xff.c=
z">megi@xff.cz</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Hi Anusha,<br>
<br>
On Wed, Apr 02, 2025 at 11:23:45AM -0400, Anusha Srivatsa wrote:<br>
&gt; Move to using the new API devm_drm_panel_alloc() to allocate the<br>
&gt; panel.<br>
&gt; <br>
&gt; Signed-off-by: Anusha Srivatsa &lt;<a href=3D"mailto:asrivats@redhat.c=
om" target=3D"_blank">asrivats@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 8 +++++---<br>
&gt;=C2=A0 1 file changed, 5 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gp=
u/drm/panel/panel-ilitek-ili9341.c<br>
&gt; index ff39f5dd4097e8da0a0e16c50c5bfd45c078d91c..d87b7eefe9beedd290fb59=
065b389b3315c85720 100644<br>
&gt; --- a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c<br>
&gt; +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c<br>
&gt; @@ -490,9 +490,11 @@ static int ili9341_dpi_probe(struct spi_device *s=
pi, struct gpio_desc *dc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ili9341 *ili;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0ili =3D devm_kzalloc(dev, sizeof(struct ili9341),=
 GFP_KERNEL);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (!ili)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ili =3D devm_drm_panel_alloc(dev, struct ili9341,=
 panel,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;ili9341_dpi_funcs,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_MODE_CONNECTOR_DPI);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(ili))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(ili);<=
br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ili-&gt;dbi =3D devm_kzalloc(dev, sizeof(str=
uct mipi_dbi),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GFP_KERNEL);<br>
<br>
Unlike in other patches, in this one you did not remove:<br>
<br>
<a href=3D"https://elixir.bootlin.com/linux/v6.13.7/source/drivers/gpu/drm/=
panel/panel-ilitek-ili9341.c#L529" rel=3D"noreferrer" target=3D"_blank">htt=
ps://elixir.bootlin.com/linux/v6.13.7/source/drivers/gpu/drm/panel/panel-il=
itek-ili9341.c#L529</a><br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_panel_init(&amp;ili-&gt;panel, dev, &amp;il=
i9341_dpi_funcs,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0DRM_MODE_CONNECTOR_DPI);<br>
<br>
Unintentional?<br>
<br></blockquote><div>Yup. Unintentional. WIll remove this in the next iter=
ation.</div><div><br></div><div>Thanks!</div><div>Anusha <br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
kind regards,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 o.<br>
<br>
&gt; -- <br>
&gt; 2.48.1<br>
&gt; <br>
<br>
</blockquote></div></div>

--0000000000009f5f650631e0cb11--


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D0BA63706
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 19:43:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F82410E03D;
	Sun, 16 Mar 2025 18:43:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Oe4F4rEC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D89010E03D
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 18:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742150607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d/+ICi5b5aNy3JKMCNJHQ8eh8JrUPbFZj0sXLa8JM3g=;
 b=Oe4F4rEClsuxYsPcox5h4YiDP48m+MKe9KfF2e8gXHOXXzKiLR+IuU++d2ZvnjR5IGZQXb
 r3OnPKDkPfEm3L/SdLZ4BRrwFaUOA1C0Af41J3LkNrkR6FY0IfPXfho2TZy807RVI/zTQ1
 un1UikxmN2spcVNzUQYBDfVrF4PgEJk=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-TJmanLWUN76_vCB0HZcSbQ-1; Sun, 16 Mar 2025 14:43:25 -0400
X-MC-Unique: TJmanLWUN76_vCB0HZcSbQ-1
X-Mimecast-MFC-AGG-ID: TJmanLWUN76_vCB0HZcSbQ_1742150605
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-6f4348c854eso48513157b3.2
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 11:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742150605; x=1742755405;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d/+ICi5b5aNy3JKMCNJHQ8eh8JrUPbFZj0sXLa8JM3g=;
 b=Q+qEF5UvW9kDhrOzX28oi+dmIU2IIiKdoIfxDUsxYU7CQiLBV50OSAHC/qsvAU40ol
 Ucx30VEAsWpfX1oRBkntXTC+kKhCsyqBoQ/VlL9ijOUBavSKrC1LJ5/0azrkGHAFK0nL
 QNp3F7rQ2GXg3GO8z/hO/v49plks00N9YYEyILWAktQCsztmSvF+M449PXtbv+PBq/L8
 v5LQA/at4iKlXF3cRjdjpuR3dI3MYiwbIJsqtjqCK6oyCx9HU9pI15xF4nWZJv8Ne0qq
 4EjhoPLmtMTXDlToC2E3rxMfo4v71CiqM+HcQbQQ0eTOJgghK69AcoNL5lLbBOXdAU/V
 WRgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxL3qSj7V8bJ+UqcGgOiwUVqgjSMvWap2r/u/GnpJxB+fgiUB7j6vxb6I5VhoZ6SkM63W0KO6PAFA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3zFsFhSED79TQMVEZu5jqLjESPRI2bFytW55kw08arXtYfRQM
 65gvYO3/7AaZLcPKcwbCg+WVw4Fc8WKE8f9ptXvKXHMAHs/M/kt0CTIN85dKUMMsgnzGNh3xP2y
 YFk3bJgswqIeqpgp7ch/I9phmz6j/Tj6BYTB6g0t0Z3At7VT05DAZxWKSZGanFyOw1lUG17Rzsk
 zA0gfYmuJ7Q1m2TviemLr6OCCbOIiLYuDdUyZTvbh4
X-Gm-Gg: ASbGncu/k1M4cpBSfPpRQZ80zRtsQ2RYHdXPg0GUsRVJ/Sg/cmTjltwOWhZgefUoAth
 2Z1thjsLZEOpEXy8Ad4GX6VT/UhYhIFdz0kMWFUdYhg1ybn89qXLHFraD6vJ5/Mn+/tqLXDg=
X-Received: by 2002:a05:690c:48ca:b0:6fd:3d82:f900 with SMTP id
 00721157ae682-6ff45fb93bfmr138017937b3.20.1742150605280; 
 Sun, 16 Mar 2025 11:43:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEb12r/7cowmt2jvjTXh9s842xkIO99DjQ9gWG13Z2OM+CAFsfFx0jUUPEQifTC06n1Nl/JgH4K+LPM+dHmoFE=
X-Received: by 2002:a05:690c:48ca:b0:6fd:3d82:f900 with SMTP id
 00721157ae682-6ff45fb93bfmr138017617b3.20.1742150604873; Sun, 16 Mar 2025
 11:43:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250314-b4-mipi-synaptic-v1-1-a64ccb5e5c66@redhat.com>
 <CAD=FV=XUN7CcnjURs6xfVAFqvZ1WR86y8nQm=OMcrV_hYjq5RQ@mail.gmail.com>
In-Reply-To: <CAD=FV=XUN7CcnjURs6xfVAFqvZ1WR86y8nQm=OMcrV_hYjq5RQ@mail.gmail.com>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Sun, 16 Mar 2025 13:40:50 -0400
X-Gm-Features: AQ5f1JqxmUKu89-wcedx98OfW7LD07tqJjqF2e1p1doG1H0wUDInr3oZpBKUZio
Message-ID: <CAN9Xe3TpwwBtfXD7oii3VR8-ijDN_WQe9JUTC5bE_7vFQVRN3w@mail.gmail.com>
Subject: Re: [PATCH] drm/panel/synaptics-r63353: Use _multi variants
To: Doug Anderson <dianders@chromium.org>
Cc: Michael Trimarchi <michael@amarulasolutions.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Tejas Vipin <tejasvipin76@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NCLakW4FH_c6w4k9tUlNsOYPGUYuN4nwStFCQrhB1FY_1742150605
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000f2ff7606307a0b3d"
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

--000000000000f2ff7606307a0b3d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 14, 2025 at 10:20=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg>
wrote:

> Hi,
>
> On Thu, Mar 13, 2025 at 9:47=E2=80=AFPM Anusha Srivatsa <asrivats@redhat.=
com>
> wrote:
> >
> > @@ -181,24 +162,15 @@ static int r63353_panel_prepare(struct drm_panel
> *panel)
> >  static int r63353_panel_deactivate(struct r63353_panel *rpanel)
> >  {
> >         struct mipi_dsi_device *dsi =3D rpanel->dsi;
> > -       struct device *dev =3D &dsi->dev;
> > -       int ret;
> > +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
> >
> > -       ret =3D mipi_dsi_dcs_set_display_off(dsi);
> > -       if (ret < 0) {
> > -               dev_err(dev, "Failed to set display OFF (%d)\n", ret);
> > -               return ret;
> > -       }
> > +       mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> >
> > -       usleep_range(5000, 10000);
> > +       mipi_dsi_usleep_range(&dsi_ctx, 5000, 10000);
> >
> > -       ret =3D mipi_dsi_dcs_enter_sleep_mode(dsi);
> > -       if (ret < 0) {
> > -               dev_err(dev, "Failed to enter sleep mode (%d)\n", ret);
> > -               return ret;
> > -       }
> > +       mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> >
> > -       return 0;
> > +       return dsi_ctx.accum_err;
>
> nit: the one caller of r63353_panel_deactivate() doesn't actually look
> at the error code, so this could be a function that returns "void".
> That was true even before your patch, though. I wouldn't mind a
> followup patch that fixed this. ;-)
>
>
This is anyway not merged, Maybe better to fix right now instead of a
follow up patch?

In any case, the patch looks reasonable to me now.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>

Thanks :)

Anusha

>
> Happy for someone else to apply it if they want. If not, I'll snooze
> this for ~a week to give others a chance to comment and then plan to
> push to drm-misc-next.


>
> -Doug
>
>

--000000000000f2ff7606307a0b3d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 14,=
 2025 at 10:20=E2=80=AFAM Doug Anderson &lt;<a href=3D"mailto:dianders@chro=
mium.org">dianders@chromium.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi,<br>
<br>
On Thu, Mar 13, 2025 at 9:47=E2=80=AFPM Anusha Srivatsa &lt;<a href=3D"mail=
to:asrivats@redhat.com" target=3D"_blank">asrivats@redhat.com</a>&gt; wrote=
:<br>
&gt;<br>
&gt; @@ -181,24 +162,15 @@ static int r63353_panel_prepare(struct drm_panel=
 *panel)<br>
&gt;=C2=A0 static int r63353_panel_deactivate(struct r63353_panel *rpanel)<=
br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct mipi_dsi_device *dsi =3D rpane=
l-&gt;dsi;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;dsi-&gt;dev;<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mipi_dsi_multi_context dsi_ctx =3D =
{ .dsi =3D dsi };<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_dcs_set_display_off(dsi);=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &=
quot;Failed to set display OFF (%d)\n&quot;, ret);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mipi_dsi_dcs_set_display_off_multi(&amp;ds=
i_ctx);<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0usleep_range(5000, 10000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mipi_dsi_usleep_range(&amp;dsi_ctx, 5000, =
10000);<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_dcs_enter_sleep_mode(dsi)=
;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &=
quot;Failed to enter sleep mode (%d)\n&quot;, ret);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mipi_dsi_dcs_enter_sleep_mode_multi(&amp;d=
si_ctx);<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return dsi_ctx.accum_err;<br>
<br>
nit: the one caller of r63353_panel_deactivate() doesn&#39;t actually look<=
br>
at the error code, so this could be a function that returns &quot;void&quot=
;.<br>
That was true even before your patch, though. I wouldn&#39;t mind a<br>
followup patch that fixed this. ;-)<br>
<br></blockquote><div><br></div><div>This is anyway not merged, Maybe bette=
r to fix right now instead of a follow up patch?=C2=A0</div><div><br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
In any case, the patch looks reasonable to me now.<br>
<br>
Reviewed-by: Douglas Anderson &lt;<a href=3D"mailto:dianders@chromium.org" =
target=3D"_blank">dianders@chromium.org</a>&gt;<br></blockquote><div><br></=
div><div>Thanks :)</div><div><br></div><div>Anusha=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
<br>
Happy for someone else to apply it if they want. If not, I&#39;ll snooze<br=
>
this for ~a week to give others a chance to comment and then plan to<br>
push to drm-misc-next.=C2=A0</blockquote><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
<br>
<br>
-Doug<br>
<br>
</blockquote></div></div>

--000000000000f2ff7606307a0b3d--


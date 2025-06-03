Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA920ACCDD7
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 21:56:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5D310E75A;
	Tue,  3 Jun 2025 19:56:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="baOfNs/B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073B310E916
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 19:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748980583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NGbtAztzSuB8BOgrLRlgXgmr8mQIKvhgUti5YVHArjc=;
 b=baOfNs/Bzrm73azfkxj17UFqdTKgtz7rry9lgfmzTUEM6HVBQp191uP2qsBEWfTFxaKfFm
 nsswEGhZhax9FOppPkf+93pgmXmYLKg/SyGBuy8kx+ruPqTrrFj40HMfkIFYtWBuXJL/d6
 g0QSiCTuIL0m6wgIcKzaNYal/w/JMts=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-232-KaDa_Qj4MUOADGvhqemdCQ-1; Tue, 03 Jun 2025 15:56:22 -0400
X-MC-Unique: KaDa_Qj4MUOADGvhqemdCQ-1
X-Mimecast-MFC-AGG-ID: KaDa_Qj4MUOADGvhqemdCQ_1748980582
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-70a4fd518b7so83609197b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 12:56:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748980582; x=1749585382;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NGbtAztzSuB8BOgrLRlgXgmr8mQIKvhgUti5YVHArjc=;
 b=jv8aaRS/MwsHcN5fYvqIP+Y6MKyqcnGwkV5yxhy8kP8sS8TIPmfzqc+wbeU0QZQ/rz
 XY1vQ5AF1JdcRnD3E8U6gHMhCpQWk/WWhURXiOl8hBENJ0X2O/3/tzHlw8vlxDnaW9eb
 KUNGT9OZXnqHFXnNvcw11t74bK7vi9zH8UW0dwnWD9QQqrOXw/jDpzGW7x7tYcQJo75I
 3CgR7uBPlgZlVDGrod+H2gIl81nxmz/ggPd8ydWHvqm90kEmkM2UcapZ5lAf0GxstkHY
 GZul+KspQwzf4+UJ2SPycplv1U6GPwE/ENmyINyDzHqIVjVV5nryd/V2MpbDOS8WONXj
 71lA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVX//pvUY5WcLLC0fBs3BbnIbwOizu/ocBuVW6VoHw2OuKANNvgKSpUr53C5PWEAnXYbIdRY7SZ1II=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywp7j/X6YlmN2aTgcLXLQ1j6YoqrFsL8yuNZG15SIMPtG86i2lc
 QnKTDMocAiyX5gtsrFO6H/FQcH4O0/LJaeuQl3AW226ozDF0xz9WU+x1fWaxX7UcKBvUYXaNBLP
 jpaV9/O5iLU0PZOE77JWKWma/KvkSWyB4469nCRZ8nty0tBQLqC4raMLUhwRwwtLTsoa2TMq5eV
 zgsyqbXP0MHI0ti9wt5CVvgnaAnZ1b9Bow6Lm5C+ZhLyvw
X-Gm-Gg: ASbGncsOBqezvKvH58TtowJ0AE3YLmR1mCmnqN4gBSD8rlz8kbv1RefIsnsL8kOoRYs
 zKM9IPIfLKoWAH2Ruzq5ns6UXkSBz96vo7yyiI47iL+F5hr/S64vznAjvNORUmFl2+ps=
X-Received: by 2002:a05:690c:4b87:b0:708:16b0:59c3 with SMTP id
 00721157ae682-710d9e692bbmr319957b3.33.1748980581887; 
 Tue, 03 Jun 2025 12:56:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuxs7YZ4/dLupWEIjE5+lo6105SImSJJL5sVIBKlRaxSp837NkmzvLtM36KdaiQm8HoPH+nHA2pWDSKal26ps=
X-Received: by 2002:a05:690c:4b87:b0:708:16b0:59c3 with SMTP id
 00721157ae682-710d9e692bbmr319497b3.33.1748980581495; Tue, 03 Jun 2025
 12:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-0-5d75a3711e40@redhat.com>
 <20250529-b4-drm_panel_mass_driver_convert_part3-v2-1-5d75a3711e40@redhat.com>
 <CAMuHMdWsGVNsm_WdiZ2hNuErrUUaj49SN_ROr-_KfEWW63omTw@mail.gmail.com>
In-Reply-To: <CAMuHMdWsGVNsm_WdiZ2hNuErrUUaj49SN_ROr-_KfEWW63omTw@mail.gmail.com>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 3 Jun 2025 14:55:03 -0500
X-Gm-Features: AX0GCFskxY3LC-8CDPvQmVzeHl24T3KiNZkX4TQOYrQBrH2j2OGoNCWP6lHL-n4
Message-ID: <CAN9Xe3TXZa1nrCLkHadiBkOO=q1ue8Jwc3V13pXcbAc9AFS2-Q@mail.gmail.com>
Subject: Re: [PATCH v2 01/46] panel/orisetech-otm8009a: Use refcounted
 allocation in place of devm_kzalloc()
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Robert Chiras <robert.chiras@nxp.com>, Linus Walleij <linus.walleij@linaro.org>,
 Markuss Broks <markuss.broks@gmail.com>, Artur Weber <aweber.kernel@gmail.com>,
 Dzmitry Sankouski <dsankouski@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, 
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Janne Grunau <j@jannau.net>, Michael Trimarchi <michael@amarulasolutions.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OUH0RTH9tky3o_-KV8vF1ptaif3w_8XtQcAjNo3_OiI_1748980582
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000004794bf0636b04643"
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

--0000000000004794bf0636b04643
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 2:11=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68k=
.org>
wrote:

> Hi Anusha,
>
> On Fri, 30 May 2025 at 20:28, Anusha Srivatsa <asrivats@redhat.com> wrote=
:
> > Move to using the new API devm_drm_panel_alloc() to allocate the
> > panel.
> >
> > Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
>
> Thanks for your patch!
>
> I have a generic comment that applies to all patches in the series.
>
> > --- a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
> > +++ b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
> > @@ -424,9 +424,11 @@ static int otm8009a_probe(struct mipi_dsi_device
> *dsi)
> >         struct otm8009a *ctx;
> >         int ret;
> >
> > -       ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>
> The old code used sizeof(*ctx) instead of an explicit type, for
> increased type-safety.
>
> > -       if (!ctx)
> > -               return -ENOMEM;
> > +       ctx =3D devm_drm_panel_alloc(dev, struct otm8009a, panel,
>
> Can't you use __typeof(*ctx) instead of the explicit type here, too?
>
> Hi Geert,
Your suggestion does improve the patch for sure. The series along with its
first two parts is already merged
and this change will have to go as a separate series.

Thanks,
Anusha

> > +                                  &otm8009a_drm_funcs,
> > +                                  DRM_MODE_CONNECTOR_DSI);
> > +       if (IS_ERR(ctx))
> > +               return PTR_ERR(ctx);
> >
> >         ctx->reset_gpio =3D devm_gpiod_get_optional(dev, "reset",
> GPIOD_OUT_LOW);
> >         if (IS_ERR(ctx->reset_gpio)) {
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 --
> geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker.
> But
> when I'm talking to journalists I just say "programmer" or something like
> that.
>                                 -- Linus Torvalds
>
>

--0000000000004794bf0636b04643
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 3, =
2025 at 2:11=E2=80=AFAM Geert Uytterhoeven &lt;<a href=3D"mailto:geert@linu=
x-m68k.org">geert@linux-m68k.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi Anusha,<br>
<br>
On Fri, 30 May 2025 at 20:28, Anusha Srivatsa &lt;<a href=3D"mailto:asrivat=
s@redhat.com" target=3D"_blank">asrivats@redhat.com</a>&gt; wrote:<br>
&gt; Move to using the new API devm_drm_panel_alloc() to allocate the<br>
&gt; panel.<br>
&gt;<br>
&gt; Reviewed-by: Neil Armstrong &lt;<a href=3D"mailto:neil.armstrong@linar=
o.org" target=3D"_blank">neil.armstrong@linaro.org</a>&gt;<br>
&gt; Signed-off-by: Anusha Srivatsa &lt;<a href=3D"mailto:asrivats@redhat.c=
om" target=3D"_blank">asrivats@redhat.com</a>&gt;<br>
<br>
Thanks for your patch!<br>
<br>
I have a generic comment that applies to all patches in the series.<br>
<br>
&gt; --- a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c<br>
&gt; +++ b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c<br>
&gt; @@ -424,9 +424,11 @@ static int otm8009a_probe(struct mipi_dsi_device =
*dsi)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct otm8009a *ctx;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx =3D devm_kzalloc(dev, sizeof(*ctx), GF=
P_KERNEL);<br>
<br>
The old code used sizeof(*ctx) instead of an explicit type, for<br>
increased type-safety.<br>
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ctx)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx =3D devm_drm_panel_alloc(dev, struct o=
tm8009a, panel,<br>
<br>
Can&#39;t you use __typeof(*ctx) instead of the explicit type here, too?<br=
>
<br></blockquote><div>Hi Geert,</div><div>Your suggestion does improve the =
patch for sure. The series along with its first two parts is already merged=
</div><div>and this change will have to go as a separate series.</div><div>=
<br></div><div>Thanks,</div><div>Anusha</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;otm8009a_drm_funcs,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_MODE_CONNECTOR_DSI);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(ctx))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR=
(ctx);<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;reset_gpio =3D devm_gpiod_get=
_optional(dev, &quot;reset&quot;, GPIOD_OUT_LOW);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(ctx-&gt;reset_gpio)) {<br>
<br>
Gr{oetje,eeting}s,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert<br>
<br>
--<br>
Geert Uytterhoeven -- There&#39;s lots of Linux beyond ia32 -- <a href=3D"m=
ailto:geert@linux-m68k.org" target=3D"_blank">geert@linux-m68k.org</a><br>
<br>
In personal conversations with technical people, I call myself a hacker. Bu=
t<br>
when I&#39;m talking to journalists I just say &quot;programmer&quot; or so=
mething like that.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -- Linus Torvalds<br>
<br>
</blockquote></div></div>

--0000000000004794bf0636b04643--


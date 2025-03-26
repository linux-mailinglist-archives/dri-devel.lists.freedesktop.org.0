Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFCEA70FA4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 04:48:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F0F10E2AB;
	Wed, 26 Mar 2025 03:48:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="J/2RJU6y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3759110E2AB
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 03:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742960919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TKKXin4K6vsF3Adjwl7ibd33vqLGkURtqb2SlCkFXqA=;
 b=J/2RJU6ylEHOltuErx6xKRZhzGuGwvUewP3cSdtU1oFtsyNOcLVZFy7HMRwLpmMOQygPlK
 MGVCa33AsbWSvNWmfrr7KFtw5EQoRyUOmn8fS/huTGU/oO5Qy25HjL4Oaq6qBsGNqSE3Vg
 sIvfpT0AmK2k6qhoqjgBaaLhIhY23XI=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-XHJxwMbaM62zAV5iZIi3pQ-1; Tue, 25 Mar 2025 23:48:35 -0400
X-MC-Unique: XHJxwMbaM62zAV5iZIi3pQ-1
X-Mimecast-MFC-AGG-ID: XHJxwMbaM62zAV5iZIi3pQ_1742960915
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-6f6d40a61e7so95772637b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 20:48:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742960915; x=1743565715;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TKKXin4K6vsF3Adjwl7ibd33vqLGkURtqb2SlCkFXqA=;
 b=PpLVsr/u33useu6UIpQQgpxkecLu1Hot63SeqtsAwYgmtohTf9GS6eRmfi8ghXOVye
 xPt3H9XEbCjxpWiUfpn6rNreL5XHpoJZ+JsAIMLyAFmWnHi5F8Vii949WWfM2gl/i8wq
 4IioI/LGFAundKfhXyD75dECGTnKHlB5Xd/LzblEyQ4VejS3gcQTw7grkDm53MR+hlnW
 cfvKqH4eaY+niLj41axXeTXwB9y9RAe2PjRVM7xYYeF45Jzs8CM96Rs/9jADWk6FHOjM
 UQZEN8aE8uuINRw22du08JXZNuQ45bSIEpFX5mbvxNdAV0aNTQGQcQx2G5bbiAE+DQca
 +ESQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCPHyJjQUqbQYxdRbySJCcSjxz+rRhr18loO56NjoUqZzxEGMJ4j59ykVfXNW30LUzxr7qbDKhr/4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYRXmKdr2a81ISiIqofLMRCPJRu4xnZ10wGo2YYaTo4G+qYNRE
 EA/QsWlPz/6ZUOfsbNyWieoGIWsq5aiYNapudNC0V1iLSPMYUzV/fet1okuaYSODmbj4YJfXfzu
 XxloLKyQOIKK6D6bW5FRlMSLJk/bjvLlaAqBFX3Xk6cADhWQ5CEpDFwm+f7t2ZTy8o6lAMq9mMs
 bO9oAnncUlqB+4qfGUoy4tA0ZE651WieKP/NBgnUbA
X-Gm-Gg: ASbGncu7+Tvz86ORSQgBsIwgVyFPPU5x+9XPtx+uk8fzsxlICoroPYS5cq0fS50sH6t
 bTKWAp/XQHiItQ5mu3Q/chYDc7CrQsuN8c7srtA3Ux/BGbb4K1zWgVUTQcNBM7CJYKKovK7A=
X-Received: by 2002:a05:690c:d8f:b0:6f6:d405:7010 with SMTP id
 00721157ae682-700bad18b5bmr254973177b3.29.1742960914954; 
 Tue, 25 Mar 2025 20:48:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGP9V8wQr0c+2RXmgXdqgkMz2MJmXsPfap501qebpziXeuwP+X+eb2xnOuhDJT35SeHjQVzkkuCeiqEc/4SbEU=
X-Received: by 2002:a05:690c:d8f:b0:6f6:d405:7010 with SMTP id
 00721157ae682-700bad18b5bmr254973027b3.29.1742960914472; Tue, 25 Mar 2025
 20:48:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250324-b4-panel-ls043t1le01-v2-1-e43aedc115be@redhat.com>
 <CAD=FV=XXHOjpZUrb5BGSZ-OqaCdmzqwDnVx5zcnV3BEOyjuByQ@mail.gmail.com>
In-Reply-To: <CAD=FV=XXHOjpZUrb5BGSZ-OqaCdmzqwDnVx5zcnV3BEOyjuByQ@mail.gmail.com>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 25 Mar 2025 22:45:53 -0400
X-Gm-Features: AQ5f1JqrgxbqneL_mNDUzgdpSqrr6c_l-GLoOobbVl7ljc9KBao6lIijs-QY0XE
Message-ID: <CAN9Xe3TXOn4GnHANB7n0Xbj_GEC28DujjXfmKXncCF3Z1=HJfw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel/sharp-ls043t1le01: Use _multi variants
To: Doug Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Tejas Vipin <tejasvipin76@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3EdFMYUXp6XiuBEd0C3Tc36Uc-HPSGbAUCkze9EIJOE_1742960915
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000002a3480063136b602"
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

--0000000000002a3480063136b602
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 11:34=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg>
wrote:

> Hi,
>
> On Mon, Mar 24, 2025 at 1:31=E2=80=AFPM Anusha Srivatsa <asrivats@redhat.=
com>
> wrote:
> >
> > Move away from using deprecated API and use _multi
> > variants if available. Use mipi_dsi_msleep()
> > and mipi_dsi_usleep_range() instead of msleep()
> > and usleep_range() respectively.
> >
> > Used Coccinelle to find the _multi variant APIs,
> > replacing mpi_dsi_msleep() where necessary and for returning
> > dsi_ctx.accum_err in these functions. mipi_dsi_dcs_write()
> > does not have a corresponding _multi() variant. Replacing it with
> > mipi_dsi_dcs_write_buffer_multi() instead. This change is manual
> >
> > @rule_1@
> > identifier dsi_var;
> > identifier r;
> > identifier func;
> > type t;
> > position p;
> > expression dsi_device;
> > expression list es;
> > @@
> > t func(...) {
> > ...
> > struct mipi_dsi_device *dsi_var =3D dsi_device;
> > +struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi_var };
> > <+...
> > (
> > -r =3D mipi_dsi_dcs_nop(dsi_var)@p;
> > +mipi_dsi_dcs_nop_multi(&dsi_ctx);
> > |
> > -r =3D mipi_dsi_dcs_exit_sleep_mode(dsi_var)@p;
> > +mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> > |
> > -r =3D mipi_dsi_dcs_enter_sleep_mode(dsi_var)@p;
> > +mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> > |
> > -r =3D mipi_dsi_dcs_write_buffer(dsi_var,es)@p;
> > +mipi_dsi_dcs_write_buffer_multi(&dsi_ctx,es);
> > |
> > -r =3D mipi_dsi_dcs_set_display_off(dsi_var,es)@p;
> > +mipi_dsi_dcs_set_display_off_multi(&dsi_ctx,es);
> > |
> > -r =3D mipi_dsi_compression_mode_ext(dsi_var,es)@p;
> > +mipi_dsi_compression_mode_ext_multi(&dsi_ctx,es);
> > |
> > -r =3D mipi_dsi_compression_mode(dsi_var,es)@p;
> > +mipi_dsi_compression_mode_multi(&dsi_ctx,es);
> > |
> > -r =3D mipi_dsi_picture_parameter_set(dsi_var,es)@p;
> > +mipi_dsi_picture_parameter_set_multi(&dsi_ctx,es);
> > |
> > -r =3D mipi_dsi_dcs_set_display_on(dsi_var,es)@p;
> > +mipi_dsi_dcs_set_display_on_multi(&dsi_ctx,es);
> > |
> > -r =3D mipi_dsi_dcs_set_tear_on(dsi_var)@p;
> > +mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx);
> > |
> > -r =3D mipi_dsi_turn_on_peripheral(dsi_var)@p;
> > +mipi_dsi_turn_on_peripheral_multi(&dsi_ctx);
> > |
> > -r =3D mipi_dsi_dcs_soft_reset(dsi_var)@p;
> > +mipi_dsi_dcs_soft_reset_multi(&dsi_ctx);
> > |
> > -r =3D mipi_dsi_dcs_set_display_brightness(dsi_var,es)@p;
> > +mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx,es);
> > |
> > -r =3D mipi_dsi_dcs_set_pixel_format(dsi_var,es)@p;
> > +mipi_dsi_dcs_set_pixel_format_multi(&dsi_ctx,es);
> > |
> > -r =3D mipi_dsi_dcs_set_column_address(dsi_var,es)@p;
> > +mipi_dsi_dcs_set_column_address_multi(&dsi_ctx,es);
> > |
> > -r =3D mipi_dsi_dcs_set_page_address(dsi_var,es)@p;
> > +mipi_dsi_dcs_set_page_address_multi(&dsi_ctx,es);
> > |
> > -r =3D mipi_dsi_dcs_set_tear_scanline(dsi_var,es)@p;
> > +mipi_dsi_dcs_set_tear_scanline_multi(&dsi_ctx,es);
> > )
> > -if(r < 0) {
> > -...
> > -}
> > ...+>
> > }
> >
> > @rule_2@
> > identifier dsi_var;
> > identifier r;
> > identifier func;
> > type t;
> > position p;
> > expression dsi_device;
> > expression list es;
> > @@
> > t func(...) {
> > ...
> > struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi_var };
> > <+...
> > (
> > -r =3D msleep(es)@p;
> > +r =3D mipi_dsi_msleep(&dsi_ctx,es);
> > |
> > -msleep(es)@p;
> > +mipi_dsi_msleep(&dsi_ctx,es);
> > |
> > -r =3D usleep_range(es)@p;
> > +r =3D mipi_dsi_usleep_range(&dsi_ctx,es);
> > |
> > -usleep_range(es)@p;
> > +mipi_dsi_usleep_range(&dsi_ctx,es);
> > )
> > ...+>
> > }
> >
> > @rule_3@
> > identifier dsi_var;
> > identifier func;
> > type t;
> > position p;
> > expression list es;
> > @@
> > t func(...) {
> > ...
> > struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi_var };
> > ...
> > -return 0;
> > +return dsi_ctx.accum_err;
> > }
>
> This is the exact same script as last time, right? Rather than
> duplicate it, you can just reference the previous patch that already
> landed. You'd say something like:
>
> The Coccinelle script is the same as the one in commit c8ba07caaecc
> ("drm/panel/synaptics-r63353: Use _multi variants")
>
> Hey Doug - Good idea.


>
> > v2: Use mipi_dsi_dcs_write_buffer_multi() in place of
> > mipi_dsi_dcs_write(). (Dmitry)
> >
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Cc: Tejas Vipin <tejasvipin76@gmail.com>
> > Cc: Doug Anderson <dianders@chromium.org>
> > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> > ---
> > Changes in v2:
> > - While mipi_dsi_dcs_write() does not have a corresponding _multi()
> >   variant replace it with mipi_dsi_dcs_write_buffer_multi() to have all
> >   APIs following _multi() usage for easier error handling
> >
> > - Link to v1:
> https://lore.kernel.org/r/20250316-b4-panel-ls043t1le01-v1-1-ee38371b0ba0=
@redhat.com
> > ---
> >  drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c | 42
> ++++++++++---------------
> >  1 file changed, 16 insertions(+), 26 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
> b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
> > index
> 729cbb0d8403ff7c0c4b9d21774909cc298904a2..e3dc99ff711e388660d6d39251876de=
8cec50dbc
> 100644
> > --- a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
> > +++ b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
> > @@ -36,60 +36,50 @@ static inline struct sharp_nt_panel
> *to_sharp_nt_panel(struct drm_panel *panel)
> >  static int sharp_nt_panel_init(struct sharp_nt_panel *sharp_nt)
> >  {
> >         struct mipi_dsi_device *dsi =3D sharp_nt->dsi;
> > -       int ret;
> > +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
> >
> > +       static const u8 d[] =3D { 0xae,  0x03 };
> >         dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
> >
> > -       ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
> > -       if (ret < 0)
> > -               return ret;
> > +       mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> >
> > -       msleep(120);
> > +       mipi_dsi_msleep(&dsi_ctx, 120);
> >
> >         /* Novatek two-lane operation */
> > -       ret =3D mipi_dsi_dcs_write(dsi, 0xae, (u8[]){ 0x03 }, 1);
> > -       if (ret < 0)
> > -               return ret;
> > +       mipi_dsi_dcs_write_buffer_multi(&dsi_ctx, d, ARRAY_SIZE(d));
>
> Can't the above just be:
>
> mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xae, 0x03);
>
> ?
>
> it can.... definitely simpler.

Anusha

>
> -Doug
>
>

--0000000000002a3480063136b602
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 25,=
 2025 at 11:34=E2=80=AFAM Doug Anderson &lt;<a href=3D"mailto:dianders@chro=
mium.org">dianders@chromium.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi,<br>
<br>
On Mon, Mar 24, 2025 at 1:31=E2=80=AFPM Anusha Srivatsa &lt;<a href=3D"mail=
to:asrivats@redhat.com" target=3D"_blank">asrivats@redhat.com</a>&gt; wrote=
:<br>
&gt;<br>
&gt; Move away from using deprecated API and use _multi<br>
&gt; variants if available. Use mipi_dsi_msleep()<br>
&gt; and mipi_dsi_usleep_range() instead of msleep()<br>
&gt; and usleep_range() respectively.<br>
&gt;<br>
&gt; Used Coccinelle to find the _multi variant APIs,<br>
&gt; replacing mpi_dsi_msleep() where necessary and for returning<br>
&gt; dsi_ctx.accum_err in these functions. mipi_dsi_dcs_write()<br>
&gt; does not have a corresponding _multi() variant. Replacing it with<br>
&gt; mipi_dsi_dcs_write_buffer_multi() instead. This change is manual<br>
&gt;<br>
&gt; @rule_1@<br>
&gt; identifier dsi_var;<br>
&gt; identifier r;<br>
&gt; identifier func;<br>
&gt; type t;<br>
&gt; position p;<br>
&gt; expression dsi_device;<br>
&gt; expression list es;<br>
&gt; @@<br>
&gt; t func(...) {<br>
&gt; ...<br>
&gt; struct mipi_dsi_device *dsi_var =3D dsi_device;<br>
&gt; +struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi_var };<br>
&gt; &lt;+...<br>
&gt; (<br>
&gt; -r =3D mipi_dsi_dcs_nop(dsi_var)@p;<br>
&gt; +mipi_dsi_dcs_nop_multi(&amp;dsi_ctx);<br>
&gt; |<br>
&gt; -r =3D mipi_dsi_dcs_exit_sleep_mode(dsi_var)@p;<br>
&gt; +mipi_dsi_dcs_exit_sleep_mode_multi(&amp;dsi_ctx);<br>
&gt; |<br>
&gt; -r =3D mipi_dsi_dcs_enter_sleep_mode(dsi_var)@p;<br>
&gt; +mipi_dsi_dcs_enter_sleep_mode_multi(&amp;dsi_ctx);<br>
&gt; |<br>
&gt; -r =3D mipi_dsi_dcs_write_buffer(dsi_var,es)@p;<br>
&gt; +mipi_dsi_dcs_write_buffer_multi(&amp;dsi_ctx,es);<br>
&gt; |<br>
&gt; -r =3D mipi_dsi_dcs_set_display_off(dsi_var,es)@p;<br>
&gt; +mipi_dsi_dcs_set_display_off_multi(&amp;dsi_ctx,es);<br>
&gt; |<br>
&gt; -r =3D mipi_dsi_compression_mode_ext(dsi_var,es)@p;<br>
&gt; +mipi_dsi_compression_mode_ext_multi(&amp;dsi_ctx,es);<br>
&gt; |<br>
&gt; -r =3D mipi_dsi_compression_mode(dsi_var,es)@p;<br>
&gt; +mipi_dsi_compression_mode_multi(&amp;dsi_ctx,es);<br>
&gt; |<br>
&gt; -r =3D mipi_dsi_picture_parameter_set(dsi_var,es)@p;<br>
&gt; +mipi_dsi_picture_parameter_set_multi(&amp;dsi_ctx,es);<br>
&gt; |<br>
&gt; -r =3D mipi_dsi_dcs_set_display_on(dsi_var,es)@p;<br>
&gt; +mipi_dsi_dcs_set_display_on_multi(&amp;dsi_ctx,es);<br>
&gt; |<br>
&gt; -r =3D mipi_dsi_dcs_set_tear_on(dsi_var)@p;<br>
&gt; +mipi_dsi_dcs_set_tear_on_multi(&amp;dsi_ctx);<br>
&gt; |<br>
&gt; -r =3D mipi_dsi_turn_on_peripheral(dsi_var)@p;<br>
&gt; +mipi_dsi_turn_on_peripheral_multi(&amp;dsi_ctx);<br>
&gt; |<br>
&gt; -r =3D mipi_dsi_dcs_soft_reset(dsi_var)@p;<br>
&gt; +mipi_dsi_dcs_soft_reset_multi(&amp;dsi_ctx);<br>
&gt; |<br>
&gt; -r =3D mipi_dsi_dcs_set_display_brightness(dsi_var,es)@p;<br>
&gt; +mipi_dsi_dcs_set_display_brightness_multi(&amp;dsi_ctx,es);<br>
&gt; |<br>
&gt; -r =3D mipi_dsi_dcs_set_pixel_format(dsi_var,es)@p;<br>
&gt; +mipi_dsi_dcs_set_pixel_format_multi(&amp;dsi_ctx,es);<br>
&gt; |<br>
&gt; -r =3D mipi_dsi_dcs_set_column_address(dsi_var,es)@p;<br>
&gt; +mipi_dsi_dcs_set_column_address_multi(&amp;dsi_ctx,es);<br>
&gt; |<br>
&gt; -r =3D mipi_dsi_dcs_set_page_address(dsi_var,es)@p;<br>
&gt; +mipi_dsi_dcs_set_page_address_multi(&amp;dsi_ctx,es);<br>
&gt; |<br>
&gt; -r =3D mipi_dsi_dcs_set_tear_scanline(dsi_var,es)@p;<br>
&gt; +mipi_dsi_dcs_set_tear_scanline_multi(&amp;dsi_ctx,es);<br>
&gt; )<br>
&gt; -if(r &lt; 0) {<br>
&gt; -...<br>
&gt; -}<br>
&gt; ...+&gt;<br>
&gt; }<br>
&gt;<br>
&gt; @rule_2@<br>
&gt; identifier dsi_var;<br>
&gt; identifier r;<br>
&gt; identifier func;<br>
&gt; type t;<br>
&gt; position p;<br>
&gt; expression dsi_device;<br>
&gt; expression list es;<br>
&gt; @@<br>
&gt; t func(...) {<br>
&gt; ...<br>
&gt; struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi_var };<br>
&gt; &lt;+...<br>
&gt; (<br>
&gt; -r =3D msleep(es)@p;<br>
&gt; +r =3D mipi_dsi_msleep(&amp;dsi_ctx,es);<br>
&gt; |<br>
&gt; -msleep(es)@p;<br>
&gt; +mipi_dsi_msleep(&amp;dsi_ctx,es);<br>
&gt; |<br>
&gt; -r =3D usleep_range(es)@p;<br>
&gt; +r =3D mipi_dsi_usleep_range(&amp;dsi_ctx,es);<br>
&gt; |<br>
&gt; -usleep_range(es)@p;<br>
&gt; +mipi_dsi_usleep_range(&amp;dsi_ctx,es);<br>
&gt; )<br>
&gt; ...+&gt;<br>
&gt; }<br>
&gt;<br>
&gt; @rule_3@<br>
&gt; identifier dsi_var;<br>
&gt; identifier func;<br>
&gt; type t;<br>
&gt; position p;<br>
&gt; expression list es;<br>
&gt; @@<br>
&gt; t func(...) {<br>
&gt; ...<br>
&gt; struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi_var };<br>
&gt; ...<br>
&gt; -return 0;<br>
&gt; +return dsi_ctx.accum_err;<br>
&gt; }<br>
<br>
This is the exact same script as last time, right? Rather than<br>
duplicate it, you can just reference the previous patch that already<br>
landed. You&#39;d say something like:<br>
<br>
The Coccinelle script is the same as the one in commit c8ba07caaecc<br>
(&quot;drm/panel/synaptics-r63353: Use _multi variants&quot;)<br>
<br></blockquote><div>Hey Doug - Good idea.</div><div>=C2=A0<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; v2: Use mipi_dsi_dcs_write_buffer_multi() in place of<br>
&gt; mipi_dsi_dcs_write(). (Dmitry)<br>
&gt;<br>
&gt; Cc: Maxime Ripard &lt;<a href=3D"mailto:mripard@kernel.org" target=3D"=
_blank">mripard@kernel.org</a>&gt;<br>
&gt; Cc: Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov@linaro.org=
" target=3D"_blank">dmitry.baryshkov@linaro.org</a>&gt;<br>
&gt; Cc: Tejas Vipin &lt;<a href=3D"mailto:tejasvipin76@gmail.com" target=
=3D"_blank">tejasvipin76@gmail.com</a>&gt;<br>
&gt; Cc: Doug Anderson &lt;<a href=3D"mailto:dianders@chromium.org" target=
=3D"_blank">dianders@chromium.org</a>&gt;<br>
&gt; Signed-off-by: Anusha Srivatsa &lt;<a href=3D"mailto:asrivats@redhat.c=
om" target=3D"_blank">asrivats@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt; Changes in v2:<br>
&gt; - While mipi_dsi_dcs_write() does not have a corresponding _multi()<br=
>
&gt;=C2=A0 =C2=A0variant replace it with mipi_dsi_dcs_write_buffer_multi() =
to have all<br>
&gt;=C2=A0 =C2=A0APIs following _multi() usage for easier error handling<br=
>
&gt;<br>
&gt; - Link to v1: <a href=3D"https://lore.kernel.org/r/20250316-b4-panel-l=
s043t1le01-v1-1-ee38371b0ba0@redhat.com" rel=3D"noreferrer" target=3D"_blan=
k">https://lore.kernel.org/r/20250316-b4-panel-ls043t1le01-v1-1-ee38371b0ba=
0@redhat.com</a><br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c | 42 ++++++++++-=
--------------<br>
&gt;=C2=A0 1 file changed, 16 insertions(+), 26 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c b/drivers=
/gpu/drm/panel/panel-sharp-ls043t1le01.c<br>
&gt; index 729cbb0d8403ff7c0c4b9d21774909cc298904a2..e3dc99ff711e388660d6d3=
9251876de8cec50dbc 100644<br>
&gt; --- a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c<br>
&gt; +++ b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c<br>
&gt; @@ -36,60 +36,50 @@ static inline struct sharp_nt_panel *to_sharp_nt_p=
anel(struct drm_panel *panel)<br>
&gt;=C2=A0 static int sharp_nt_panel_init(struct sharp_nt_panel *sharp_nt)<=
br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct mipi_dsi_device *dsi =3D sharp=
_nt-&gt;dsi;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mipi_dsi_multi_context dsi_ctx =3D =
{ .dsi =3D dsi };<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0static const u8 d[] =3D { 0xae,=C2=A0 0x03=
 };<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dsi-&gt;mode_flags |=3D MIPI_DSI_MODE=
_LPM;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mipi_dsi_dcs_exit_sleep_mode_multi(&amp;ds=
i_ctx);<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0msleep(120);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mipi_dsi_msleep(&amp;dsi_ctx, 120);<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Novatek two-lane operation */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_dcs_write(dsi, 0xae, (u8[=
]){ 0x03 }, 1);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mipi_dsi_dcs_write_buffer_multi(&amp;dsi_c=
tx, d, ARRAY_SIZE(d));<br>
<br>
Can&#39;t the above just be:<br>
<br>
mipi_dsi_dcs_write_seq_multi(&amp;dsi_ctx, 0xae, 0x03);<br>
<br>
?<br>
<br></blockquote><div>it can.... definitely simpler.=C2=A0</div><div><br></=
div><div>Anusha <br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
<br>
-Doug<br>
<br>
</blockquote></div></div>

--0000000000002a3480063136b602--


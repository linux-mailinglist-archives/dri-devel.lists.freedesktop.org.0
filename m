Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D3EA6617A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 23:21:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9528E10E1E4;
	Mon, 17 Mar 2025 22:21:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="h+FbcWLf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D0710E1E4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 22:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742250081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/wbfFOOiY3sCvKM1MHxSUAQtcTns3Jo/q3YW0vPlBek=;
 b=h+FbcWLfxLqQvPpFEyrFltvnjf26K9lB+ZxhzDlJnLhD7yZCZIjRZrKDSpImKfSkDIfqK1
 8/RypAdYjGIvr0AU0eHYT9TTxSIcNM8OoZRaGRDTReH++zWWYIaH+X768dVXDQrXn9eR/3
 fCyM8JjXfTyx9+iobbA2MMXXP3NxLYg=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-2EY228EVOjWlv4Hi8iD5aA-1; Mon, 17 Mar 2025 18:21:19 -0400
X-MC-Unique: 2EY228EVOjWlv4Hi8iD5aA-1
X-Mimecast-MFC-AGG-ID: 2EY228EVOjWlv4Hi8iD5aA_1742250079
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-6fd541f4b43so55914777b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 15:21:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742250079; x=1742854879;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/wbfFOOiY3sCvKM1MHxSUAQtcTns3Jo/q3YW0vPlBek=;
 b=IwULmiry5oKagkEkPFmAD6EExwzethudk7kDZ3NRFNsoLzqZ0mw+Tr1oSVh++hziVB
 fB5FDE8e5VRCialNK3vYUOmgxAj+HBvGUWxYM1koNkTeYKf/1Ellqx6J56+EmfR7urAj
 prLoEKBzBRsi8sypoGVBpGK6NyIhJPTVYjfV/+G6i6PNMZj4nn10bneDZQElfgxWAI3s
 LQggvcI/yviX6CjGAtqt/ylTOCUL2SSlTuBbd4naLDohaH6KOWfmNm4SUDP6P/diOZ4c
 jEzJtWOPpLJ9IyTIWqX2PrRF/ectc+CcHB16AAw1iw48HKzkeUURwHjib54DJmSoDm5j
 NNEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjUnLbJirBEFnVtdislm8pUMkyF1oCFeT4VHDyTQ8QiqYZluA0BdEfc2/nPI2E1KSi3Q6ruYFEwzE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcoZ3PAtlcTj4zzS9aWVfd9082vB8mx0ckNYTGneUo3YMUZZlt
 hVLX0i7wjPvbO06To44lYO+tTxwdLj8enUFirrCAgvKErRe7Eqad7Z36MGQfqsAinQym6MTWrf2
 9Gfd6M/UTu6HiSjhkit8SbACBCk+qP0XeLjVrj6KIdB/dA4SU8in/Mn5pyvTI9rCzlkiLziq++w
 hrs/PeeXv/dH/Jcd6ue9gMR/hbcQnbWjdvBHeaXYff
X-Gm-Gg: ASbGncuEBMg+CB1+BFW2eAqXEeJU740rk1trmzjP/XwoBrqu/0MlM0T2uUxQfV+2stM
 k1EH/wEXDKj95/lrXif7DiZOh1PnfosYhsmN7lzfJOCN+Bre49y9q1hWI/rPJjm1MXAPSy28=
X-Received: by 2002:a05:690c:61c8:b0:6e9:e097:718c with SMTP id
 00721157ae682-6ff45e43e4cmr189133767b3.6.1742250079262; 
 Mon, 17 Mar 2025 15:21:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERhzyjTppQfVr7LXPiHK1qYiErcmciVQqSlwfnERbpJFR85436TIoavkoOa1Khxrh5ZXTnkIQ+pLBbfqNihB4=
X-Received: by 2002:a05:690c:61c8:b0:6e9:e097:718c with SMTP id
 00721157ae682-6ff45e43e4cmr189133617b3.6.1742250078927; Mon, 17 Mar 2025
 15:21:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250316-b4-panel-ls043t1le01-v1-1-ee38371b0ba0@redhat.com>
 <zs4tt57ur6hbesipab3kuiost4gokfu6tmfsicfwtdwri2wwli@fylnnpu3xoen>
In-Reply-To: <zs4tt57ur6hbesipab3kuiost4gokfu6tmfsicfwtdwri2wwli@fylnnpu3xoen>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Mon, 17 Mar 2025 18:21:07 -0400
X-Gm-Features: AQ5f1JqnM7WnXZ1SvM8tuhKqEXc7pVjlysGCUC0lx3vQYFcYUrB_E3SeQ1bYvJw
Message-ID: <CAN9Xe3TH-81HV2YsiWnYHsozRPGOWm900QOUsbVoQ4TpMFDCdQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel/sharp-ls043t1le01: Use _multi variants
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Tejas Vipin <tejasvipin76@gmail.com>, 
 Doug Anderson <dianders@chromium.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 48o5zp1uDgKHtuTiz_yD-5w2GZB81E_iGjfNRPm7mSg_1742250079
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000001094b1063091359f"
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

--0000000000001094b1063091359f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 16, 2025 at 7:32=E2=80=AFPM Dmitry Baryshkov <
dmitry.baryshkov@oss.qualcomm.com> wrote:

> On Sun, Mar 16, 2025 at 02:58:22PM -0400, Anusha Srivatsa wrote:
> > Move away from using deprecated API and use _multi
> > variants if available. Use mipi_dsi_msleep()
> > and mipi_dsi_usleep_range() instead of msleep()
> > and usleep_range() respectively.
> >
> > Used Coccinelle to find the _multi variant APIs,
> > replacing mpi_dsi_msleep() where necessary and for returning
> > dsi_ctx.accum_err in these functions.
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
> >
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Cc: Tejas Vipin <tejasvipin76@gmail.com>
> > Cc: Doug Anderson <dianders@chromium.org>
> >
> > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> > ---
> >  drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c | 36
> ++++++++++---------------
> >  1 file changed, 14 insertions(+), 22 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
> b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
> > index
> 729cbb0d8403ff7c0c4b9d21774909cc298904a2..9803eaf18e95d70742ece88e8293275=
1476fdda8
> 100644
> > --- a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
> > +++ b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
> > @@ -36,15 +36,14 @@ static inline struct sharp_nt_panel
> *to_sharp_nt_panel(struct drm_panel *panel)
> >  static int sharp_nt_panel_init(struct sharp_nt_panel *sharp_nt)
> >  {
> >       struct mipi_dsi_device *dsi =3D sharp_nt->dsi;
> > +     struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
> >       int ret;
> >
> >       dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
> >
> > -     ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
> > -     if (ret < 0)
> > -             return ret;
> > +     mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> >
> > -     msleep(120);
> > +     mipi_dsi_msleep(&dsi_ctx, 120);
> >
> >       /* Novatek two-lane operation */
> >       ret =3D mipi_dsi_dcs_write(dsi, 0xae, (u8[]){ 0x03 }, 1);
>
> Anusha. Please. Start reviewing your patches before you send them. This
> is a MIPI DSI call. And it wasn't switched to _multi / context. You
> should have cought this. I don't know why you didn't. Please review and
> check your code before sending it upstream.
>
>
Sigh :( I actually need to give it  a day, look at the patch again next day
and catch faults before pushing to ML.

Anusha

>
> --
> With best wishes
> Dmitry
>
>

--0000000000001094b1063091359f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Mar 16,=
 2025 at 7:32=E2=80=AFPM Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.bary=
shkov@oss.qualcomm.com">dmitry.baryshkov@oss.qualcomm.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sun, Mar 16, 20=
25 at 02:58:22PM -0400, Anusha Srivatsa wrote:<br>
&gt; Move away from using deprecated API and use _multi<br>
&gt; variants if available. Use mipi_dsi_msleep()<br>
&gt; and mipi_dsi_usleep_range() instead of msleep()<br>
&gt; and usleep_range() respectively.<br>
&gt; <br>
&gt; Used Coccinelle to find the _multi variant APIs,<br>
&gt; replacing mpi_dsi_msleep() where necessary and for returning<br>
&gt; dsi_ctx.accum_err in these functions.<br>
&gt; <br>
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
&gt; <br>
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
&gt; <br>
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
&gt; <br>
&gt; Cc: Maxime Ripard &lt;<a href=3D"mailto:mripard@kernel.org" target=3D"=
_blank">mripard@kernel.org</a>&gt;<br>
&gt; Cc: Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov@linaro.org=
" target=3D"_blank">dmitry.baryshkov@linaro.org</a>&gt;<br>
&gt; Cc: Tejas Vipin &lt;<a href=3D"mailto:tejasvipin76@gmail.com" target=
=3D"_blank">tejasvipin76@gmail.com</a>&gt;<br>
&gt; Cc: Doug Anderson &lt;<a href=3D"mailto:dianders@chromium.org" target=
=3D"_blank">dianders@chromium.org</a>&gt;<br>
&gt; <br>
&gt; Signed-off-by: Anusha Srivatsa &lt;<a href=3D"mailto:asrivats@redhat.c=
om" target=3D"_blank">asrivats@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c | 36 ++++++++++-=
--------------<br>
&gt;=C2=A0 1 file changed, 14 insertions(+), 22 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c b/drivers=
/gpu/drm/panel/panel-sharp-ls043t1le01.c<br>
&gt; index 729cbb0d8403ff7c0c4b9d21774909cc298904a2..9803eaf18e95d70742ece8=
8e82932751476fdda8 100644<br>
&gt; --- a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c<br>
&gt; +++ b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c<br>
&gt; @@ -36,15 +36,14 @@ static inline struct sharp_nt_panel *to_sharp_nt_p=
anel(struct drm_panel *panel)<br>
&gt;=C2=A0 static int sharp_nt_panel_init(struct sharp_nt_panel *sharp_nt)<=
br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mipi_dsi_device *dsi =3D sharp_nt-&gt=
;dsi;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =
=3D dsi };<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dsi-&gt;mode_flags |=3D MIPI_DSI_MODE_LPM;<b=
r>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mipi_dsi_dcs_exit_sleep_mode_multi(&amp;dsi_ctx);=
<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0msleep(120);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mipi_dsi_msleep(&amp;dsi_ctx, 120);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Novatek two-lane operation */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_dcs_write(dsi, 0xae, (u8[])=
{ 0x03 }, 1);<br>
<br>
Anusha. Please. Start reviewing your patches before you send them. This<br>
is a MIPI DSI call. And it wasn&#39;t switched to _multi / context. You<br>
should have cought this. I don&#39;t know why you didn&#39;t. Please review=
 and<br>
check your code before sending it upstream.<br>
<br></blockquote><div><br></div><div>Sigh :( I actually need to give it=C2=
=A0 a day, look at the patch again next day and catch faults before pushing=
 to ML.</div><div><br></div><div>Anusha <br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
<br>
-- <br>
With best wishes<br>
Dmitry<br>
<br>
</blockquote></div></div>

--0000000000001094b1063091359f--


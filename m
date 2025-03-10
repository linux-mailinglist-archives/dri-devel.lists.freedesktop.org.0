Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D84A5998E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 16:16:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A5C10E422;
	Mon, 10 Mar 2025 15:16:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WX/AaLGL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2128610E422
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 15:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741619813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SyOrr1T2OvECu87SVwETtCju49YTmk9OGRizV4KZMmk=;
 b=WX/AaLGLD0tWp6/e9QGgODlXRoVTAWO4NEqARwL+pLxnYGNhnrVEOB3bbfIlEGzqa7Lc34
 QuAbEn0JXqcjrVJTpobsY9CakCQa3eTtCe9lM0FbfbN5vnWYOnEtoRsV3EnPxyzwI/HmVI
 BEFCK0TpLfblQs1mWxRLPqao24iG4hc=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-V6E6QQbRNtKVzR3hCfbcWg-1; Mon, 10 Mar 2025 11:16:49 -0400
X-MC-Unique: V6E6QQbRNtKVzR3hCfbcWg-1
X-Mimecast-MFC-AGG-ID: V6E6QQbRNtKVzR3hCfbcWg_1741619809
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-6f3ff1ff13aso70822327b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 08:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741619809; x=1742224609;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SyOrr1T2OvECu87SVwETtCju49YTmk9OGRizV4KZMmk=;
 b=hbPMNlbvCFhgpzT4d19iDsXLuHHHtTtKdfr3kNnsNi7uAgD9duadxsb168XwQed4uK
 zyWtNlVkCmlZFXOkLBSNWmttAhtkRkBkGoP7Gs+V/wRJpUZp296ZObdHiR51Y0k/utPn
 5lq+1qete2I4/6DqnrJYtLcbuzaVLrgXE3SqyFwdaZoDwa91qCWgVa1PDVZMxnvFShov
 OLH4n2GsIi5oocdfW3Yt1wNJo3zHWw80Wz4XeWmesNiDDJwkJhMWVnz84pSdiG2XxGVT
 OHKVBJnRQpwv0dSTFBMFkDOYIkxkFMisP/T77wqY4fEqj7y8mkmPvsCrH4KRJ5zJ4HDX
 FTPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhdEIclRQSzWJUU1AAEB443KB5YmlI7EFmpI3dc3SrcbVIpU76HDU44RlOUzfEnHUYKprLcNKFpVo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxURN+eXpfU+vN45RyNuIrudRrUgbb7jEm/ViB4tRFsVwXYO845
 YLN3tAuhhkCHLQN1PxV2UnYAnFEJ0tvhDXpRPhM97sPpKuG9RAL6mi2AYWibMOXfc4k/KGBpqoU
 PYsUlOQfRWxQsPgiUcRQzqYpKIs4sNpxT6zOYF53Lzc+06Y12H/r28fXxyFK9WLFTrli6MlUtLy
 1rH/p4MYd76Y04QlcRJd5VuHeFqnf7dexuB1kJrltn
X-Gm-Gg: ASbGncsSDa/LUbc9sCtXI4obSBXwyMtz3BCZUgJms0VgsmI90ouREw7jX5VGJi/sLHq
 9GzjgYr34pnactY+7/Mg00IapQd86yC8iiMCyY5vXHh+3Y2zS3+fGPxYkaVRBTm58doAR6J8=
X-Received: by 2002:a05:690c:3612:b0:6fb:b2c0:71da with SMTP id
 00721157ae682-6febf3b37c8mr190672247b3.36.1741619809217; 
 Mon, 10 Mar 2025 08:16:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBBOHktzu5bbZ/9SqBlz4Uwv8xZLjj0fVJM8Z3SXFYgNimj2JUnVcP4I8nkoxc4ITIWm3wuzKw2Kn8VyPQRvA=
X-Received: by 2002:a05:690c:3612:b0:6fb:b2c0:71da with SMTP id
 00721157ae682-6febf3b37c8mr190671887b3.36.1741619808920; Mon, 10 Mar 2025
 08:16:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250305-mipi-synaptic-1-v1-1-92017cd19ef6@redhat.com>
 <20250306-clever-lime-tanuki-e2fc43@houat>
 <CAN9Xe3SDyC47HWww1eH63aZOiM-WF9BGxztM3yh9bf6ORuY7VA@mail.gmail.com>
 <20250306-brave-wonderful-sambar-3d0bc5@houat>
 <CAD=FV=XZJjNpzUgvGog0pFGwqUR09SocYFEk5355eptbK_gjqA@mail.gmail.com>
 <CAN9Xe3TEYjfjDcaCL7MOUBMu5Uq0ifN36=jRumtDX7pQ0FsK3g@mail.gmail.com>
 <20250307-happy-jasmine-raccoon-c6226c@houat>
In-Reply-To: <20250307-happy-jasmine-raccoon-c6226c@houat>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Mon, 10 Mar 2025 10:14:20 -0400
X-Gm-Features: AQ5f1Jrl_6dO-62n7DDkAP8Da0-SqM6S3gw4PgeuZyabEYjXI8zIARyPPdZeYN0
Message-ID: <CAN9Xe3QGVkccvtexP1riR8DkgDuETE-eCNG_L9UOP1oB1w2GgQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel/synaptics-r63353: Use _multi variants
To: Maxime Ripard <mripard@kernel.org>
Cc: Doug Anderson <dianders@chromium.org>,
 Michael Trimarchi <michael@amarulasolutions.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Tejas Vipin <tejasvipin76@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wTuWxdi8JNk_trlzwW65yu-9ByygvCiORyVfinvW7bQ_1741619809
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000000b7e31062ffe769c"
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

--0000000000000b7e31062ffe769c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 7, 2025 at 12:47=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:

> On Thu, Mar 06, 2025 at 02:12:14PM -0500, Anusha Srivatsa wrote:
> > On Thu, Mar 6, 2025 at 12:54=E2=80=AFPM Doug Anderson <dianders@chromiu=
m.org>
> wrote:
> > > On Thu, Mar 6, 2025 at 9:20=E2=80=AFAM Maxime Ripard <mripard@kernel.=
org>
> wrote:
> > > >
> > > > On Thu, Mar 06, 2025 at 10:08:24AM -0500, Anusha Srivatsa wrote:
> > > > > On Thu, Mar 6, 2025 at 4:31=E2=80=AFAM Maxime Ripard <mripard@ker=
nel.org>
> > > wrote:
> > > > >
> > > > > > Hi Anusha,
> > > > > >
> > > > > > On Wed, Mar 05, 2025 at 07:01:41PM -0500, Anusha Srivatsa wrote=
:
> > > > > > > Move away from using deprecated API and use _multi
> > > > > > > variants if available. Use mipi_dsi_msleep()
> > > > > > > and mipi_dsi_usleep_range() instead of msleep()
> > > > > > > and usleep_range() respectively.
> > > > > > >
> > > > > > > Used Coccinelle to find the multiple occurences.
> > > > > > > SmPl patch:
> > > > > > > @rule@
> > > > > > > identifier dsi_var;
> > > > > > > identifier r;
> > > > > > > identifier func;
> > > > > > > type t;
> > > > > > > position p;
> > > > > > > expression dsi_device;
> > > > > > > expression list es;
> > > > > > > @@
> > > > > > > t func(...) {
> > > > > > > ...
> > > > > > > struct mipi_dsi_device *dsi_var =3D dsi_device;
> > > > > > > +struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi_var=
 };
> > > > > > > <+...
> > > > > > > (
> > > > > > > -mipi_dsi_dcs_write_seq(dsi_var,es)@p;
> > > > > > > +mipi_dsi_dcs_write_seq_multi(&dsi_ctx,es);
> > > > > > > |
> > > > > > > -mipi_dsi_generic_write_seq(dsi_var,es)@p;
> > > > > > > +mipi_dsi_generic_write_seq_multi(&dsi_ctx,es);
> > > > > > > |
> > > > > > > -mipi_dsi_generic_write(dsi_var,es)@p;
> > > > > > > +mipi_dsi_generic_write_multi(&dsi_ctx,es);
> > > > > > > |
> > > > > > > -r =3D mipi_dsi_dcs_nop(dsi_var)@p;
> > > > > > > +mipi_dsi_dcs_nop_multi(&dsi_ctx);
> > > > > > > |
> > > > > > > ....rest of API
> > > > > > > ..
> > > > > > > )
> > > > > > > -if(r < 0) {
> > > > > > > -...
> > > > > > > -}
> > > > > > > ...+>
> > > > > >
> > > > > > The point of sending a single patch was to review the coccinell=
e
> > > script,
> > > > > > so you must put the entire script you used here.
> > > > >
> > > > > I was actually thinking of sending patches per driver this time
> around
> > > > > since Tejas also seems to be looking into similar
> parts....Thoughts?
> > > >
> > > > Not really?
> > > >
> > > > The point of doing it with one driver was to make sure the coccinel=
le
> > > > script was fine before rolling it to other drivers. And actually, i=
t
> > > > doesn't really matter: the whole point of putting the script in the
> > > > commit log is to be able to review and document the script you used=
.
> If
> > > > you're not going to put the one you used, it's kind of pointless.
> > >
> > > Personally, I don't have any interest in reviewing the coccinelle
> > > script so I don't need it and, from my point of view, you could just
> > > remove it from the patch description (or point to it indirectly or
> > > something). I'll review each patch on its own merits. I am a bit
> > > curious if you ended up fully generating this patch with a coccinelle
> > > script or if you used a coccinelle script to start and then had to
> > > manually tweak the patch after. Actually, I guess I'll take it back.
> > > If you manage to fully generate conversions for all the panels with a
> > > single cocinelle script, I would love to take a glance at your full
> > > script just to satisfy my curiosity for how you handled everything
> > > properly. :-P
> > >
> >
> > managed to get all conversions other than the usleep_range() and mslee(=
)
> > because I was trying to replace them with mipi_dsi_* variants only in
> > functions that I was  touching and not each and every occurrence. Didnt
> > spend enough time to get the script smart enough to do that and did onl=
y
> > usleep() and msleep change manually. Here goes the script:
> >
> > @rule_1@
> > identifier dsi_var;
> > expression dsi_device;
> > expression list es;
> > @@
> > struct mipi_dsi_device *dsi_var =3D dsi_device;
> > +struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi_var };
> > <+...
> > -mipi_dsi_dcs_write_seq(dsi_var,es);
> > +mipi_dsi_dcs_write_seq_multi(&dsi_ctx,es);
> > ...+>
> >
> > //rule_2
> > @@
> > expression list es;
> > identifier jdi;
> > @@
> > static int jdi_write_dcdc_registers(struct jdi_panel *jdi)
> > {
> > +struct mipi_dsi_multi_context dsi_ctx1 =3D { .dsi =3D jdi->link1 };
> > +struct mipi_dsi_multi_context dsi_ctx2 =3D { .dsi =3D jdi->link2 };
> > <+...
> > -mipi_dsi_generic_write_seq(jdi->link1,es);
> > +mipi_dsi_generic_write_seq_multi(&dsi_ctx1,es);
> > -mipi_dsi_generic_write_seq(jdi->link2,es);
> > +mipi_dsi_generic_write_seq_multi(&dsi_ctx2,es);
> > ...+>
> > }
> > @rule_3@
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
>
> You're not matching on msleep because it doesn't return anything, and
> here you're expecting a return value. You need to make 'r =3D' optional.
>
> Yup! works now :)

Anusha

> Maxime
>

--0000000000000b7e31062ffe769c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 7, =
2025 at 12:47=E2=80=AFPM Maxime Ripard &lt;<a href=3D"mailto:mripard@kernel=
.org">mripard@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Thu, Mar 06, 2025 at 02:12:14PM -0500, Anusha Sr=
ivatsa wrote:<br>
&gt; On Thu, Mar 6, 2025 at 12:54=E2=80=AFPM Doug Anderson &lt;<a href=3D"m=
ailto:dianders@chromium.org" target=3D"_blank">dianders@chromium.org</a>&gt=
; wrote:<br>
&gt; &gt; On Thu, Mar 6, 2025 at 9:20=E2=80=AFAM Maxime Ripard &lt;<a href=
=3D"mailto:mripard@kernel.org" target=3D"_blank">mripard@kernel.org</a>&gt;=
 wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Thu, Mar 06, 2025 at 10:08:24AM -0500, Anusha Srivatsa wr=
ote:<br>
&gt; &gt; &gt; &gt; On Thu, Mar 6, 2025 at 4:31=E2=80=AFAM Maxime Ripard &l=
t;<a href=3D"mailto:mripard@kernel.org" target=3D"_blank">mripard@kernel.or=
g</a>&gt;<br>
&gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Hi Anusha,<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; On Wed, Mar 05, 2025 at 07:01:41PM -0500, Anusha S=
rivatsa wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; Move away from using deprecated API and use _=
multi<br>
&gt; &gt; &gt; &gt; &gt; &gt; variants if available. Use mipi_dsi_msleep()<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; and mipi_dsi_usleep_range() instead of msleep=
()<br>
&gt; &gt; &gt; &gt; &gt; &gt; and usleep_range() respectively.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Used Coccinelle to find the multiple occurenc=
es.<br>
&gt; &gt; &gt; &gt; &gt; &gt; SmPl patch:<br>
&gt; &gt; &gt; &gt; &gt; &gt; @rule@<br>
&gt; &gt; &gt; &gt; &gt; &gt; identifier dsi_var;<br>
&gt; &gt; &gt; &gt; &gt; &gt; identifier r;<br>
&gt; &gt; &gt; &gt; &gt; &gt; identifier func;<br>
&gt; &gt; &gt; &gt; &gt; &gt; type t;<br>
&gt; &gt; &gt; &gt; &gt; &gt; position p;<br>
&gt; &gt; &gt; &gt; &gt; &gt; expression dsi_device;<br>
&gt; &gt; &gt; &gt; &gt; &gt; expression list es;<br>
&gt; &gt; &gt; &gt; &gt; &gt; @@<br>
&gt; &gt; &gt; &gt; &gt; &gt; t func(...) {<br>
&gt; &gt; &gt; &gt; &gt; &gt; ...<br>
&gt; &gt; &gt; &gt; &gt; &gt; struct mipi_dsi_device *dsi_var =3D dsi_devic=
e;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +struct mipi_dsi_multi_context dsi_ctx =3D { =
.dsi =3D dsi_var };<br>
&gt; &gt; &gt; &gt; &gt; &gt; &lt;+...<br>
&gt; &gt; &gt; &gt; &gt; &gt; (<br>
&gt; &gt; &gt; &gt; &gt; &gt; -mipi_dsi_dcs_write_seq(dsi_var,es)@p;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +mipi_dsi_dcs_write_seq_multi(&amp;dsi_ctx,es=
);<br>
&gt; &gt; &gt; &gt; &gt; &gt; |<br>
&gt; &gt; &gt; &gt; &gt; &gt; -mipi_dsi_generic_write_seq(dsi_var,es)@p;<br=
>
&gt; &gt; &gt; &gt; &gt; &gt; +mipi_dsi_generic_write_seq_multi(&amp;dsi_ct=
x,es);<br>
&gt; &gt; &gt; &gt; &gt; &gt; |<br>
&gt; &gt; &gt; &gt; &gt; &gt; -mipi_dsi_generic_write(dsi_var,es)@p;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +mipi_dsi_generic_write_multi(&amp;dsi_ctx,es=
);<br>
&gt; &gt; &gt; &gt; &gt; &gt; |<br>
&gt; &gt; &gt; &gt; &gt; &gt; -r =3D mipi_dsi_dcs_nop(dsi_var)@p;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +mipi_dsi_dcs_nop_multi(&amp;dsi_ctx);<br>
&gt; &gt; &gt; &gt; &gt; &gt; |<br>
&gt; &gt; &gt; &gt; &gt; &gt; ....rest of API<br>
&gt; &gt; &gt; &gt; &gt; &gt; ..<br>
&gt; &gt; &gt; &gt; &gt; &gt; )<br>
&gt; &gt; &gt; &gt; &gt; &gt; -if(r &lt; 0) {<br>
&gt; &gt; &gt; &gt; &gt; &gt; -...<br>
&gt; &gt; &gt; &gt; &gt; &gt; -}<br>
&gt; &gt; &gt; &gt; &gt; &gt; ...+&gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; The point of sending a single patch was to review =
the coccinelle<br>
&gt; &gt; script,<br>
&gt; &gt; &gt; &gt; &gt; so you must put the entire script you used here.<b=
r>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I was actually thinking of sending patches per driver t=
his time around<br>
&gt; &gt; &gt; &gt; since Tejas also seems to be looking into similar parts=
....Thoughts?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Not really?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The point of doing it with one driver was to make sure the c=
occinelle<br>
&gt; &gt; &gt; script was fine before rolling it to other drivers. And actu=
ally, it<br>
&gt; &gt; &gt; doesn&#39;t really matter: the whole point of putting the sc=
ript in the<br>
&gt; &gt; &gt; commit log is to be able to review and document the script y=
ou used. If<br>
&gt; &gt; &gt; you&#39;re not going to put the one you used, it&#39;s kind =
of pointless.<br>
&gt; &gt;<br>
&gt; &gt; Personally, I don&#39;t have any interest in reviewing the coccin=
elle<br>
&gt; &gt; script so I don&#39;t need it and, from my point of view, you cou=
ld just<br>
&gt; &gt; remove it from the patch description (or point to it indirectly o=
r<br>
&gt; &gt; something). I&#39;ll review each patch on its own merits. I am a =
bit<br>
&gt; &gt; curious if you ended up fully generating this patch with a coccin=
elle<br>
&gt; &gt; script or if you used a coccinelle script to start and then had t=
o<br>
&gt; &gt; manually tweak the patch after. Actually, I guess I&#39;ll take i=
t back.<br>
&gt; &gt; If you manage to fully generate conversions for all the panels wi=
th a<br>
&gt; &gt; single cocinelle script, I would love to take a glance at your fu=
ll<br>
&gt; &gt; script just to satisfy my curiosity for how you handled everythin=
g<br>
&gt; &gt; properly. :-P<br>
&gt; &gt;<br>
&gt; <br>
&gt; managed to get all conversions other than the usleep_range() and mslee=
()<br>
&gt; because I was trying to replace them with mipi_dsi_* variants only in<=
br>
&gt; functions that I was=C2=A0 touching and not each and every occurrence.=
 Didnt<br>
&gt; spend enough time to get the script smart enough to do that and did on=
ly<br>
&gt; usleep() and msleep change manually. Here goes the script:<br>
&gt; <br>
&gt; @rule_1@<br>
&gt; identifier dsi_var;<br>
&gt; expression dsi_device;<br>
&gt; expression list es;<br>
&gt; @@<br>
&gt; struct mipi_dsi_device *dsi_var =3D dsi_device;<br>
&gt; +struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi_var };<br>
&gt; &lt;+...<br>
&gt; -mipi_dsi_dcs_write_seq(dsi_var,es);<br>
&gt; +mipi_dsi_dcs_write_seq_multi(&amp;dsi_ctx,es);<br>
&gt; ...+&gt;<br>
&gt; <br>
&gt; //rule_2<br>
&gt; @@<br>
&gt; expression list es;<br>
&gt; identifier jdi;<br>
&gt; @@<br>
&gt; static int jdi_write_dcdc_registers(struct jdi_panel *jdi)<br>
&gt; {<br>
&gt; +struct mipi_dsi_multi_context dsi_ctx1 =3D { .dsi =3D jdi-&gt;link1 }=
;<br>
&gt; +struct mipi_dsi_multi_context dsi_ctx2 =3D { .dsi =3D jdi-&gt;link2 }=
;<br>
&gt; &lt;+...<br>
&gt; -mipi_dsi_generic_write_seq(jdi-&gt;link1,es);<br>
&gt; +mipi_dsi_generic_write_seq_multi(&amp;dsi_ctx1,es);<br>
&gt; -mipi_dsi_generic_write_seq(jdi-&gt;link2,es);<br>
&gt; +mipi_dsi_generic_write_seq_multi(&amp;dsi_ctx2,es);<br>
&gt; ...+&gt;<br>
&gt; }<br>
&gt; @rule_3@<br>
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
<br>
You&#39;re not matching on msleep because it doesn&#39;t return anything, a=
nd<br>
here you&#39;re expecting a return value. You need to make &#39;r =3D&#39; =
optional.<br>
<br></blockquote><div>Yup! works now :)</div><div><br></div><div>Anusha=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Maxime<br>
</blockquote></div></div>

--0000000000000b7e31062ffe769c--


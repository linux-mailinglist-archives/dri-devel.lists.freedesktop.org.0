Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA9DA55648
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 20:12:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BD010E14A;
	Thu,  6 Mar 2025 19:12:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="U4diPYor";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3057710E14A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 19:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741288350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oUaxGhaSa65I1vyfBFz+7hMDka6h+dzFcMS/CL4nHeA=;
 b=U4diPYor43qCv4A7C4/SS1zIt7eJZk+GE94596OPD791UtcR5PAZw+BMvO7kCWvXiupPIk
 VUFtp5AaB0IcgWENzoqTGtfsr8BNnLBq08Mw0JSt62afUEx1cHc+0olnzbm0E1WAzfah6x
 nYMVfFrzyfNj9F1ER++ux/eteu4u66E=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-iAqZCxY5Pl-K6y-tTuIo_A-1; Thu, 06 Mar 2025 14:12:26 -0500
X-MC-Unique: iAqZCxY5Pl-K6y-tTuIo_A-1
X-Mimecast-MFC-AGG-ID: iAqZCxY5Pl-K6y-tTuIo_A_1741288346
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-6fda1dcbdf1so10788787b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 11:12:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741288346; x=1741893146;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oUaxGhaSa65I1vyfBFz+7hMDka6h+dzFcMS/CL4nHeA=;
 b=p2ElBMk0AZ459AU3HmaHvQmLsyYgQ3M0guvOPJLNXLprP1t4+0qpv3l+NpuZsBJ54x
 ZPk4Xdz2yGJfUwmoUyVs5ZWdK5PKWeZVFxdJ9jQKZfh3y/6iXTagAEwNWptlkiIrDGMO
 Nmh/WYsmqublitah2NzbySVhY2eBW12LQhXHKZ48EYDLiJkN8LuEFJ17Znrf1nAKYjbw
 IvJvOvzLViexQFJoExlCm8WGZhKcjzkndpAker/xHPb3QmYE/9MuSY26y+NYR/nVupoJ
 lvXE7Tg8ZHJdMpvqWiUQJydL2nT8uCeUzXox81d6vu/L/ArTLwt5JlUJKUbuOrU9LfDO
 X/jA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtC3Fvs1tpEVoYCUs8bS6QK7Z5wsJQixSvO1ofNv0k0Tn25YOyXLkX2tZDrb6MKqo0iliGcPLXfNA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrcKArXswEY0Tml1MLwJVah0VJxjYr1oc8AKdN8TWXMFo3vq64
 3pAt1wuCYbqReoFYAfXBXtqhKO0uI/CDla8DJhBJVkJvpO6IcvSUBkbSChXYqEUDWEf/BfQswGY
 lF5gCqrVukofalEMpwRx6PM4lYkBtNrmcm2fiurtyPQpH0qEZMP2UcVn3jqc2lenVRXENscXkGg
 J5CbObXOqfYe68FE1ozrIWI790b3R0CrvBckwSoVWd
X-Gm-Gg: ASbGncs6BaftDa6uIRGztxyZVLvX7rp6mVcxyBS1ZV6jYvDUi+AxVQzbplNBT15NBqO
 7kqXfoS88y5/M2NqOaUfKmwgJMVlyqawfIqIAEM71wpSzAbSOE8DPzRQZWiXYGgrtAbVSdM4=
X-Received: by 2002:a05:690c:6382:b0:6ef:94db:b208 with SMTP id
 00721157ae682-6febf3a8fa9mr9179577b3.24.1741288346087; 
 Thu, 06 Mar 2025 11:12:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhbL22fkNNALu7nLX0QTzkBL8eRbVIgqXWGCiJWLENjIL5MXsTdYXxTALJmqnRLmd1EDdp2N/CUWDgTiLF1VQ=
X-Received: by 2002:a05:690c:6382:b0:6ef:94db:b208 with SMTP id
 00721157ae682-6febf3a8fa9mr9179237b3.24.1741288345750; Thu, 06 Mar 2025
 11:12:25 -0800 (PST)
MIME-Version: 1.0
References: <20250305-mipi-synaptic-1-v1-1-92017cd19ef6@redhat.com>
 <20250306-clever-lime-tanuki-e2fc43@houat>
 <CAN9Xe3SDyC47HWww1eH63aZOiM-WF9BGxztM3yh9bf6ORuY7VA@mail.gmail.com>
 <20250306-brave-wonderful-sambar-3d0bc5@houat>
 <CAD=FV=XZJjNpzUgvGog0pFGwqUR09SocYFEk5355eptbK_gjqA@mail.gmail.com>
In-Reply-To: <CAD=FV=XZJjNpzUgvGog0pFGwqUR09SocYFEk5355eptbK_gjqA@mail.gmail.com>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 6 Mar 2025 14:12:14 -0500
X-Gm-Features: AQ5f1Jq41EsbXcuPnZXX5lHTX1SXVhYk8DtQYnCknIiIBQ0oQin3VT_EKTy9MKU
Message-ID: <CAN9Xe3TEYjfjDcaCL7MOUBMu5Uq0ifN36=jRumtDX7pQ0FsK3g@mail.gmail.com>
Subject: Re: [PATCH] drm/panel/synaptics-r63353: Use _multi variants
To: Doug Anderson <dianders@chromium.org>
Cc: Maxime Ripard <mripard@kernel.org>,
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
X-Mimecast-MFC-PROC-ID: 2uXZ_VKezzXe7-dN21XvRhc1zU9C13i2-DXvNB88kWQ_1741288346
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000004ce5b7062fb14931"
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

--0000000000004ce5b7062fb14931
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 12:54=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:

> Hi,
>
> On Thu, Mar 6, 2025 at 9:20=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:
> >
> > On Thu, Mar 06, 2025 at 10:08:24AM -0500, Anusha Srivatsa wrote:
> > > On Thu, Mar 6, 2025 at 4:31=E2=80=AFAM Maxime Ripard <mripard@kernel.=
org>
> wrote:
> > >
> > > > Hi Anusha,
> > > >
> > > > On Wed, Mar 05, 2025 at 07:01:41PM -0500, Anusha Srivatsa wrote:
> > > > > Move away from using deprecated API and use _multi
> > > > > variants if available. Use mipi_dsi_msleep()
> > > > > and mipi_dsi_usleep_range() instead of msleep()
> > > > > and usleep_range() respectively.
> > > > >
> > > > > Used Coccinelle to find the multiple occurences.
> > > > > SmPl patch:
> > > > > @rule@
> > > > > identifier dsi_var;
> > > > > identifier r;
> > > > > identifier func;
> > > > > type t;
> > > > > position p;
> > > > > expression dsi_device;
> > > > > expression list es;
> > > > > @@
> > > > > t func(...) {
> > > > > ...
> > > > > struct mipi_dsi_device *dsi_var =3D dsi_device;
> > > > > +struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi_var };
> > > > > <+...
> > > > > (
> > > > > -mipi_dsi_dcs_write_seq(dsi_var,es)@p;
> > > > > +mipi_dsi_dcs_write_seq_multi(&dsi_ctx,es);
> > > > > |
> > > > > -mipi_dsi_generic_write_seq(dsi_var,es)@p;
> > > > > +mipi_dsi_generic_write_seq_multi(&dsi_ctx,es);
> > > > > |
> > > > > -mipi_dsi_generic_write(dsi_var,es)@p;
> > > > > +mipi_dsi_generic_write_multi(&dsi_ctx,es);
> > > > > |
> > > > > -r =3D mipi_dsi_dcs_nop(dsi_var)@p;
> > > > > +mipi_dsi_dcs_nop_multi(&dsi_ctx);
> > > > > |
> > > > > ....rest of API
> > > > > ..
> > > > > )
> > > > > -if(r < 0) {
> > > > > -...
> > > > > -}
> > > > > ...+>
> > > >
> > > > The point of sending a single patch was to review the coccinelle
> script,
> > > > so you must put the entire script you used here.
> > >
> > > I was actually thinking of sending patches per driver this time aroun=
d
> > > since Tejas also seems to be looking into similar parts....Thoughts?
> >
> > Not really?
> >
> > The point of doing it with one driver was to make sure the coccinelle
> > script was fine before rolling it to other drivers. And actually, it
> > doesn't really matter: the whole point of putting the script in the
> > commit log is to be able to review and document the script you used. If
> > you're not going to put the one you used, it's kind of pointless.
>
> Personally, I don't have any interest in reviewing the coccinelle
> script so I don't need it and, from my point of view, you could just
> remove it from the patch description (or point to it indirectly or
> something). I'll review each patch on its own merits. I am a bit
> curious if you ended up fully generating this patch with a coccinelle
> script or if you used a coccinelle script to start and then had to
> manually tweak the patch after. Actually, I guess I'll take it back.
> If you manage to fully generate conversions for all the panels with a
> single cocinelle script, I would love to take a glance at your full
> script just to satisfy my curiosity for how you handled everything
> properly. :-P
>

managed to get all conversions other than the usleep_range() and mslee()
because I was trying to replace them with mipi_dsi_* variants only in
functions that I was  touching and not each and every occurrence. Didnt
spend enough time to get the script smart enough to do that and did only
usleep() and msleep change manually. Here goes the script:

@rule_1@
identifier dsi_var;
expression dsi_device;
expression list es;
@@
struct mipi_dsi_device *dsi_var =3D dsi_device;
+struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi_var };
<+...
-mipi_dsi_dcs_write_seq(dsi_var,es);
+mipi_dsi_dcs_write_seq_multi(&dsi_ctx,es);
...+>

//rule_2
@@
expression list es;
identifier jdi;
@@
static int jdi_write_dcdc_registers(struct jdi_panel *jdi)
{
+struct mipi_dsi_multi_context dsi_ctx1 =3D { .dsi =3D jdi->link1 };
+struct mipi_dsi_multi_context dsi_ctx2 =3D { .dsi =3D jdi->link2 };
<+...
-mipi_dsi_generic_write_seq(jdi->link1,es);
+mipi_dsi_generic_write_seq_multi(&dsi_ctx1,es);
-mipi_dsi_generic_write_seq(jdi->link2,es);
+mipi_dsi_generic_write_seq_multi(&dsi_ctx2,es);
...+>
}
@rule_3@
identifier dsi_var;
identifier r;
identifier func;
type t;
position p;
expression dsi_device;
expression list es;
@@
t func(...) {
...
struct mipi_dsi_device *dsi_var =3D dsi_device;
+struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi_var };
<+...
(
-r =3D mipi_dsi_dcs_nop(dsi_var)@p;
+mipi_dsi_dcs_nop_multi(&dsi_ctx);
|
-r =3D mipi_dsi_dcs_exit_sleep_mode(dsi_var)@p;
+mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
|
-r =3D mipi_dsi_dcs_enter_sleep_mode(dsi_var)@p;
+mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
|
|
-r =3D mipi_dsi_dcs_write_buffer(dsi_var,es)@p;
+mipi_dsi_dcs_write_buffer_multi(&dsi_ctx,es);
|
-r =3D mipi_dsi_dcs_set_display_off(dsi_var,es)@p;
+mipi_dsi_dcs_set_display_off_multi(&dsi_ctx,es);
|
-r =3D mipi_dsi_compression_mode_ext(dsi_var,es)@p;
+mipi_dsi_compression_mode_ext_multi(&dsi_ctx,es);
|
-r =3D mipi_dsi_compression_mode(dsi_var,es)@p;
+mipi_dsi_compression_mode_multi(&dsi_ctx,es);
|
-r =3D mipi_dsi_picture_parameter_set(dsi_var,es)@p;
+mipi_dsi_picture_parameter_set_multi(&dsi_ctx,es);
|
-r =3D mipi_dsi_dcs_set_display_on(dsi_var,es)@p;
+mipi_dsi_dcs_set_display_on_multi(&dsi_ctx,es);
|
-r =3D mipi_dsi_dcs_set_tear_on(dsi_var)@p;
+mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx);
|
-r =3D mipi_dsi_turn_on_peripheral(dsi_var)@p;
+mipi_dsi_turn_on_peripheral_multi(&dsi_ctx);
|
-r =3D mipi_dsi_dcs_soft_reset(dsi_var)@p;
+mipi_dsi_dcs_soft_reset_multi(&dsi_ctx);
|
-r =3D mipi_dsi_dcs_set_display_brightness(dsi_var,es)@p;
+mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx,es);
|
-r =3D mipi_dsi_dcs_set_pixel_format(dsi_var,es)@p;
+mipi_dsi_dcs_set_pixel_format_multi(&dsi_ctx,es);
|
-r =3D mipi_dsi_dcs_set_column_address(dsi_var,es)@p;
+mipi_dsi_dcs_set_column_address_multi(&dsi_ctx,es);
|
-r =3D mipi_dsi_dcs_set_page_address(dsi_var,es)@p;
+mipi_dsi_dcs_set_page_address_multi(&dsi_ctx,es);
|
-r =3D mipi_dsi_dcs_set_tear_scanline(dsi_var,es)@p;
+mipi_dsi_dcs_set_tear_scanline_multi(&dsi_ctx,es);
)
-if(r < 0) {
-...
-}
...+>
}

Thanks,
Anusha

> -Doug
>
>

--0000000000004ce5b7062fb14931
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 6, =
2025 at 12:54=E2=80=AFPM Doug Anderson &lt;<a href=3D"mailto:dianders@chrom=
ium.org">dianders@chromium.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Hi,<br>
<br>
On Thu, Mar 6, 2025 at 9:20=E2=80=AFAM Maxime Ripard &lt;<a href=3D"mailto:=
mripard@kernel.org" target=3D"_blank">mripard@kernel.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Thu, Mar 06, 2025 at 10:08:24AM -0500, Anusha Srivatsa wrote:<br>
&gt; &gt; On Thu, Mar 6, 2025 at 4:31=E2=80=AFAM Maxime Ripard &lt;<a href=
=3D"mailto:mripard@kernel.org" target=3D"_blank">mripard@kernel.org</a>&gt;=
 wrote:<br>
&gt; &gt;<br>
&gt; &gt; &gt; Hi Anusha,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Wed, Mar 05, 2025 at 07:01:41PM -0500, Anusha Srivatsa wr=
ote:<br>
&gt; &gt; &gt; &gt; Move away from using deprecated API and use _multi<br>
&gt; &gt; &gt; &gt; variants if available. Use mipi_dsi_msleep()<br>
&gt; &gt; &gt; &gt; and mipi_dsi_usleep_range() instead of msleep()<br>
&gt; &gt; &gt; &gt; and usleep_range() respectively.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Used Coccinelle to find the multiple occurences.<br>
&gt; &gt; &gt; &gt; SmPl patch:<br>
&gt; &gt; &gt; &gt; @rule@<br>
&gt; &gt; &gt; &gt; identifier dsi_var;<br>
&gt; &gt; &gt; &gt; identifier r;<br>
&gt; &gt; &gt; &gt; identifier func;<br>
&gt; &gt; &gt; &gt; type t;<br>
&gt; &gt; &gt; &gt; position p;<br>
&gt; &gt; &gt; &gt; expression dsi_device;<br>
&gt; &gt; &gt; &gt; expression list es;<br>
&gt; &gt; &gt; &gt; @@<br>
&gt; &gt; &gt; &gt; t func(...) {<br>
&gt; &gt; &gt; &gt; ...<br>
&gt; &gt; &gt; &gt; struct mipi_dsi_device *dsi_var =3D dsi_device;<br>
&gt; &gt; &gt; &gt; +struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D d=
si_var };<br>
&gt; &gt; &gt; &gt; &lt;+...<br>
&gt; &gt; &gt; &gt; (<br>
&gt; &gt; &gt; &gt; -mipi_dsi_dcs_write_seq(dsi_var,es)@p;<br>
&gt; &gt; &gt; &gt; +mipi_dsi_dcs_write_seq_multi(&amp;dsi_ctx,es);<br>
&gt; &gt; &gt; &gt; |<br>
&gt; &gt; &gt; &gt; -mipi_dsi_generic_write_seq(dsi_var,es)@p;<br>
&gt; &gt; &gt; &gt; +mipi_dsi_generic_write_seq_multi(&amp;dsi_ctx,es);<br>
&gt; &gt; &gt; &gt; |<br>
&gt; &gt; &gt; &gt; -mipi_dsi_generic_write(dsi_var,es)@p;<br>
&gt; &gt; &gt; &gt; +mipi_dsi_generic_write_multi(&amp;dsi_ctx,es);<br>
&gt; &gt; &gt; &gt; |<br>
&gt; &gt; &gt; &gt; -r =3D mipi_dsi_dcs_nop(dsi_var)@p;<br>
&gt; &gt; &gt; &gt; +mipi_dsi_dcs_nop_multi(&amp;dsi_ctx);<br>
&gt; &gt; &gt; &gt; |<br>
&gt; &gt; &gt; &gt; ....rest of API<br>
&gt; &gt; &gt; &gt; ..<br>
&gt; &gt; &gt; &gt; )<br>
&gt; &gt; &gt; &gt; -if(r &lt; 0) {<br>
&gt; &gt; &gt; &gt; -...<br>
&gt; &gt; &gt; &gt; -}<br>
&gt; &gt; &gt; &gt; ...+&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The point of sending a single patch was to review the coccin=
elle script,<br>
&gt; &gt; &gt; so you must put the entire script you used here.<br>
&gt; &gt;<br>
&gt; &gt; I was actually thinking of sending patches per driver this time a=
round<br>
&gt; &gt; since Tejas also seems to be looking into similar parts....Though=
ts?<br>
&gt;<br>
&gt; Not really?<br>
&gt;<br>
&gt; The point of doing it with one driver was to make sure the coccinelle<=
br>
&gt; script was fine before rolling it to other drivers. And actually, it<b=
r>
&gt; doesn&#39;t really matter: the whole point of putting the script in th=
e<br>
&gt; commit log is to be able to review and document the script you used. I=
f<br>
&gt; you&#39;re not going to put the one you used, it&#39;s kind of pointle=
ss.<br>
<br>
Personally, I don&#39;t have any interest in reviewing the coccinelle<br>
script so I don&#39;t need it and, from my point of view, you could just<br=
>
remove it from the patch description (or point to it indirectly or<br>
something). I&#39;ll review each patch on its own merits. I am a bit<br>
curious if you ended up fully generating this patch with a coccinelle<br>
script or if you used a coccinelle script to start and then had to<br>
manually tweak the patch after. Actually, I guess I&#39;ll take it back.<br=
>
If you manage to fully generate conversions for all the panels with a<br>
single cocinelle script, I would love to take a glance at your full<br>
script just to satisfy my curiosity for how you handled everything<br>
properly. :-P<br></blockquote><div><br></div><div>managed to get all conver=
sions other than the usleep_range() and mslee() because I was trying to rep=
lace them with mipi_dsi_* variants only in functions that I was=C2=A0 touch=
ing and not each and every occurrence. Didnt spend enough time to get the s=
cript smart enough to do that and did only usleep() and msleep change manua=
lly. Here goes the script:</div><div><br></div><div>@rule_1@<br>identifier =
dsi_var;<br>expression dsi_device;<br>expression list es;<br>@@<br>struct m=
ipi_dsi_device *dsi_var =3D dsi_device;<br>+struct mipi_dsi_multi_context d=
si_ctx =3D { .dsi =3D dsi_var };<br>&lt;+...<br>-mipi_dsi_dcs_write_seq(dsi=
_var,es);<br>+mipi_dsi_dcs_write_seq_multi(&amp;dsi_ctx,es);<br>...+&gt;<br=
><br>//rule_2<br>@@<br>expression list es;<br>identifier jdi;<br>@@<br>stat=
ic int jdi_write_dcdc_registers(struct jdi_panel *jdi)<br>{<br>+struct mipi=
_dsi_multi_context dsi_ctx1 =3D { .dsi =3D jdi-&gt;link1 };<br>+struct mipi=
_dsi_multi_context dsi_ctx2 =3D { .dsi =3D jdi-&gt;link2 };<br>&lt;+...<br>=
-mipi_dsi_generic_write_seq(jdi-&gt;link1,es);<br>+mipi_dsi_generic_write_s=
eq_multi(&amp;dsi_ctx1,es);<br>-mipi_dsi_generic_write_seq(jdi-&gt;link2,es=
);<br>+mipi_dsi_generic_write_seq_multi(&amp;dsi_ctx2,es);<br>...+&gt;<br>}=
<br>@rule_3@<br>identifier dsi_var;<br>identifier r;<br>identifier func;<br=
>type t;<br>position p;<br>expression dsi_device;<br>expression list es;<br=
>@@<br>t func(...) {<br>...<br>struct mipi_dsi_device *dsi_var =3D dsi_devi=
ce;<br>+struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi_var };<br>=
&lt;+...<br>(<br>-r =3D mipi_dsi_dcs_nop(dsi_var)@p;<br>+mipi_dsi_dcs_nop_m=
ulti(&amp;dsi_ctx);<br>|<br>-r =3D mipi_dsi_dcs_exit_sleep_mode(dsi_var)@p;=
<br>+mipi_dsi_dcs_exit_sleep_mode_multi(&amp;dsi_ctx);<br>|<br>-r =3D mipi_=
dsi_dcs_enter_sleep_mode(dsi_var)@p;<br>+mipi_dsi_dcs_enter_sleep_mode_mult=
i(&amp;dsi_ctx);<br>|<br>|<br>-r =3D mipi_dsi_dcs_write_buffer(dsi_var,es)@=
p;<br>+mipi_dsi_dcs_write_buffer_multi(&amp;dsi_ctx,es);<br>|<br>-r =3D mip=
i_dsi_dcs_set_display_off(dsi_var,es)@p;<br>+mipi_dsi_dcs_set_display_off_m=
ulti(&amp;dsi_ctx,es);<br>|<br>-r =3D mipi_dsi_compression_mode_ext(dsi_var=
,es)@p;<br>+mipi_dsi_compression_mode_ext_multi(&amp;dsi_ctx,es);<br>|<br>-=
r =3D mipi_dsi_compression_mode(dsi_var,es)@p;<br>+mipi_dsi_compression_mod=
e_multi(&amp;dsi_ctx,es);<br>|<br>-r =3D mipi_dsi_picture_parameter_set(dsi=
_var,es)@p;<br>+mipi_dsi_picture_parameter_set_multi(&amp;dsi_ctx,es);<br>|=
<br>-r =3D mipi_dsi_dcs_set_display_on(dsi_var,es)@p;<br>+mipi_dsi_dcs_set_=
display_on_multi(&amp;dsi_ctx,es);<br>|<br>-r =3D mipi_dsi_dcs_set_tear_on(=
dsi_var)@p;<br>+mipi_dsi_dcs_set_tear_on_multi(&amp;dsi_ctx);<br>|<br>-r =
=3D mipi_dsi_turn_on_peripheral(dsi_var)@p;<br>+mipi_dsi_turn_on_peripheral=
_multi(&amp;dsi_ctx);<br>|<br>-r =3D mipi_dsi_dcs_soft_reset(dsi_var)@p;<br=
>+mipi_dsi_dcs_soft_reset_multi(&amp;dsi_ctx);<br>|<br>-r =3D mipi_dsi_dcs_=
set_display_brightness(dsi_var,es)@p;<br>+mipi_dsi_dcs_set_display_brightne=
ss_multi(&amp;dsi_ctx,es);<br>|<br>-r =3D mipi_dsi_dcs_set_pixel_format(dsi=
_var,es)@p;<br>+mipi_dsi_dcs_set_pixel_format_multi(&amp;dsi_ctx,es);<br>|<=
br>-r =3D mipi_dsi_dcs_set_column_address(dsi_var,es)@p;<br>+mipi_dsi_dcs_s=
et_column_address_multi(&amp;dsi_ctx,es);<br>|<br>-r =3D mipi_dsi_dcs_set_p=
age_address(dsi_var,es)@p;<br>+mipi_dsi_dcs_set_page_address_multi(&amp;dsi=
_ctx,es);<br>|<br>-r =3D mipi_dsi_dcs_set_tear_scanline(dsi_var,es)@p;<br>+=
mipi_dsi_dcs_set_tear_scanline_multi(&amp;dsi_ctx,es);<br>)<br>-if(r &lt; 0=
) {<br>-...<br>-}<br>...+&gt;<br>}<br></div><div><br></div><div>Thanks,</di=
v><div>Anusha</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
-Doug<br>
<br>
</blockquote></div></div>

--0000000000004ce5b7062fb14931--


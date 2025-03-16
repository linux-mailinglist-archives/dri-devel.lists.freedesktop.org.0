Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A52A63724
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 20:05:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0846310E056;
	Sun, 16 Mar 2025 19:05:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fem8fNmj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FDA410E056
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 19:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742151918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k0eVPqaVGipdq4mosGwdn+ojnqB85RoVI6JOVuSY/pM=;
 b=fem8fNmjEuYwyTmRZs02MtMxYAxqPqCaxQr6rz57vLn+5goPRYAylpjBvEMCPb5XhH17ol
 c6JD6u4Ccr58XxM+D7ttsndTa+OuankAUGLkqz9lHrVli/wT05yIP+iKGc5+JW3hQFwQfv
 nq6bRGnt9bvi45Fi/a4Mj0ptu0aqHCs=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-241-xe5-OgTbN-WvzQGv-bce2w-1; Sun, 16 Mar 2025 15:05:16 -0400
X-MC-Unique: xe5-OgTbN-WvzQGv-bce2w-1
X-Mimecast-MFC-AGG-ID: xe5-OgTbN-WvzQGv-bce2w_1742151915
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-6fd010df0f4so59887567b3.3
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 12:05:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742151915; x=1742756715;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k0eVPqaVGipdq4mosGwdn+ojnqB85RoVI6JOVuSY/pM=;
 b=T6LnjCJm85pxbPSz9jrD3pyvl5GLkfIgl6WTHeUNfnIKwRXxSM8D1AsD6iadU5jZCA
 Cvn8pRsfttNAb0TeQHv7nuhlbCTE78sAl2/aQxmkTuzw7zo0qemQXJWwZiT31CPEno3l
 /sApCY/dzBrbkJKJN8PJiebZMAcCmCAPeesLZAAb5TV7on+JJ+UyGGvCf0KJEA3tdSK/
 wCbwT8OPLH/E022rFq6DUS1HlVpmOglGE8sXjFwoC4yvpd3LUtqr2AK9QURRYQgppe4M
 R2YcdzfemCFz2cx3jcfVx/fIwzsSUMVFeCpbR5LqcwULcyLZyg4aqLdkTZfkOPPj7DKE
 c6uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+aiLWsA8SIemXW4sxAFyS2sDYjZAVUbJYm/vV3+DWJ0oq9RZ8jARAuol7hKVRIKHytKe6MEnGLcM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywbu2sYHLfGhMYtiJwqGFbm1rp5TJJ7xgKxXWAA/ycZcGeVN9NE
 0i1lHeFWI7QPDbrgkyp/jNRsyIWQe6WRrT+l68uI+9pSynMZ/VP643DdfOdsCoHU29Curu8PrFK
 o0s+D88SE3npJhJTV830WdDEmYDUM+MMovpi3eLGow9CbzAWOyXzQhHwsnmEG86uHJF7QRLddYM
 EoaZCpMKykoM9PJWH+/jmBgtgKCeR2+qHQI6GmCHdB
X-Gm-Gg: ASbGnctZvOy7+Pqo0Ia/b0NEvnpEsb2mPkuZdu0kBrdSb/2RZXYT4spMm4pKr5PGhq1
 eHvOnXWzibQhTZh2fHMB4Atiyk+xVTfsYIZ08rCFt+rKXNSRkelKHMN8dtt/QoVEN1tmzX34=
X-Received: by 2002:a05:690c:c96:b0:6f9:45de:408f with SMTP id
 00721157ae682-6ff46026148mr130895407b3.35.1742151915553; 
 Sun, 16 Mar 2025 12:05:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGd6qyTcSK1BTrW5D2NFHXsoV/s8NiNSmvkW9NkVLSOPIjURWId2+E46PubvxRW+G89wNa+djaVn1b+8tOcfKU=
X-Received: by 2002:a05:690c:c96:b0:6f9:45de:408f with SMTP id
 00721157ae682-6ff46026148mr130895087b3.35.1742151915282; Sun, 16 Mar 2025
 12:05:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250314-b4-mipi-synaptic-v1-1-a64ccb5e5c66@redhat.com>
 <20250314-brass-cobra-of-fury-f7fc26@houat>
In-Reply-To: <20250314-brass-cobra-of-fury-f7fc26@houat>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Sun, 16 Mar 2025 14:02:41 -0400
X-Gm-Features: AQ5f1JpV3aq-XWHSoJpNJQ5iuksyfKct5k_pBIukto7iTCxOEE_2KqMQn4hTxJI
Message-ID: <CAN9Xe3Qxa_67tt75vJKCpeTTEhdeVR74AvxW8YhbYT8p+ym0ig@mail.gmail.com>
Subject: Re: [PATCH] drm/panel/synaptics-r63353: Use _multi variants
To: Maxime Ripard <mripard@kernel.org>
Cc: Michael Trimarchi <michael@amarulasolutions.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Tejas Vipin <tejasvipin76@gmail.com>, Doug Anderson <dianders@chromium.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hxWEKinbdVBjeosJ7DIwsZ8WLyun4In_otIxoVo1r24_1742151915
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000000e3c8b06307a5a3e"
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

--0000000000000e3c8b06307a5a3e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 14, 2025 at 2:22=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:

> Hi
>
> On Fri, Mar 14, 2025 at 12:47:16AM -0400, Anusha Srivatsa wrote:
> > Move away from using deprecated API and use _multi
> > variants if available. Use mipi_dsi_msleep()
> > and mipi_dsi_usleep_range() instead of msleep()
> > and usleep_range() respectively.
> >
> > Used Coccinelle to find the _multi variant APIs,
> > replacing mpi_dsi_msleep() where necessary and for returning
> > dsi_ctx.accum_err in these functions. Manually handled the
> > reset step before returning from r63353_panel_activate()
> >
> > v2: Do not skip the reset in case of error during
> > panel activate (Dmitry)
> > - Convert all usleep_range()
> >
> > v3: mipi_dsi_usleep_range() is to be used only when in
> > between _multi commands(Doug)
> > - Check for error once in the end while using _multi
> > variants (Doug)
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
> > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
>
> It's looking good, but you forgot to set the version. If you're not
> using it already, b4 simplifies that a lot for you, you should be using
> it.
>
> Yes. Agreed.
Duly noted.

Anusha

> Maxime
>

--0000000000000e3c8b06307a5a3e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 14,=
 2025 at 2:22=E2=80=AFPM Maxime Ripard &lt;<a href=3D"mailto:mripard@kernel=
.org">mripard@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Hi<br>
<br>
On Fri, Mar 14, 2025 at 12:47:16AM -0400, Anusha Srivatsa wrote:<br>
&gt; Move away from using deprecated API and use _multi<br>
&gt; variants if available. Use mipi_dsi_msleep()<br>
&gt; and mipi_dsi_usleep_range() instead of msleep()<br>
&gt; and usleep_range() respectively.<br>
&gt; <br>
&gt; Used Coccinelle to find the _multi variant APIs,<br>
&gt; replacing mpi_dsi_msleep() where necessary and for returning<br>
&gt; dsi_ctx.accum_err in these functions. Manually handled the<br>
&gt; reset step before returning from r63353_panel_activate()<br>
&gt; <br>
&gt; v2: Do not skip the reset in case of error during<br>
&gt; panel activate (Dmitry)<br>
&gt; - Convert all usleep_range()<br>
&gt; <br>
&gt; v3: mipi_dsi_usleep_range() is to be used only when in<br>
&gt; between _multi commands(Doug)<br>
&gt; - Check for error once in the end while using _multi<br>
&gt; variants (Doug)<br>
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
&gt; Signed-off-by: Anusha Srivatsa &lt;<a href=3D"mailto:asrivats@redhat.c=
om" target=3D"_blank">asrivats@redhat.com</a>&gt;<br>
<br>
It&#39;s looking good, but you forgot to set the version. If you&#39;re not=
<br>
using it already, b4 simplifies that a lot for you, you should be using<br>
it.<br>
<br></blockquote><div>Yes. Agreed.</div><div>Duly noted.</div><div><br></di=
v><div>Anusha=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Maxime<br>
</blockquote></div></div>

--0000000000000e3c8b06307a5a3e--


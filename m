Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE317A55616
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 20:01:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B03710EA7B;
	Thu,  6 Mar 2025 19:01:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Uo7BGEAt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA3410EA84
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 19:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741287693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x5qA9pzE8ygHlCvJwYIOc83JNk5co4UI8j4CHfzEq48=;
 b=Uo7BGEAt2swdEh39zZx+r7NnlqI5gBEM6RiiNjzpOTh7UMZOubS5XsUO/bYBzjyteOffca
 HZn0QJFxNO/9VNFhg64fkjGiYex96XOswexTtRH4RmCsFHDBObzhSi4C0xZFbYXlOEuoQ1
 Mz+Gj3vY9GjhRPlsbAJCDfu6UD8Sm7k=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-PKpm4o85MNGPQeNDiQ6L_g-1; Thu, 06 Mar 2025 14:01:28 -0500
X-MC-Unique: PKpm4o85MNGPQeNDiQ6L_g-1
X-Mimecast-MFC-AGG-ID: PKpm4o85MNGPQeNDiQ6L_g_1741287688
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-6f27dd44f86so15669717b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 11:01:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741287688; x=1741892488;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x5qA9pzE8ygHlCvJwYIOc83JNk5co4UI8j4CHfzEq48=;
 b=rJyjBgQOvzXLu7UpTPXoa3VmvoWzZ1nNhUvubXprdrhfivDkyd+b7F4tlLWUPXcCrL
 VQSwd9CU2exjSPcY1d48CiwOlQIUBRVmdeCXNsxtUemJfT+2KX81Cem1LWNZlIfcLIMG
 ME9pT09ccgeUbT4mNBA8WrqwBPUBqqF08wiMpkiBO73EOYNDNP8Tl2y5LhuSaM7CLIyp
 enDVqT//oqSuHXvDfx2QKWDnsBnNiC/t+nes8dEXIJkqRbhKc1+EKhV7ZGP6lM7XAM15
 uymV1yS4TzXt9Z4W0RSu1kT49bfO9MVcKlNnyHgsSzlocWOdY61Jur+v1QGhf3zPJ/9Y
 fxMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1IvFP/lsNQJWA3hKTiNmgfrebLzc1CPh3gaoOMFf0GSl7XUqlEACvTEeWEl/hwqPjyikkEl2SlTc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUxt+UupZEByyuwA7jgKcl3hsOYaxIRt5j8wag46W4+uq5Evbx
 b9ApO2O2ysRqETM/JR8TcCfADsDhEP4bVHpidhzrqaXXym08an0yJVfsjaXhqUfQDCSJ0GgzHY8
 CpDW5IMIM+oPCTzzH7bl65oVFhmtjrLmJqPRPjRe3FrIPmillLPh6wRYuBNE/BOZalGCGfziF/p
 NDLDzLTwPJ/hnYxbrRfWedTOG4OVgyETLrY2cpOJim
X-Gm-Gg: ASbGncuV1M7G8zv59WOA87VH4DfWSWSE+J958mbCsV4jTvq0F53zByB11n9gHou2AqH
 ehRmLIIvny8GRekY1cBiY8AyuEj4xqRyaBsatl+6UOokZDuijTTtzurvNXbNIQ+NTsRRqylU=
X-Received: by 2002:a05:690c:3386:b0:6f2:9704:405c with SMTP id
 00721157ae682-6febf2e7688mr9148057b3.15.1741287688105; 
 Thu, 06 Mar 2025 11:01:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHprdru0ckevYwY5Fo0wPWr27LSMC0YhLHQ/IjW+Ha/eCgfj0Au+NYUjxp7hwi9lJWATZZiluArGvr4NbenS/w=
X-Received: by 2002:a05:690c:3386:b0:6f2:9704:405c with SMTP id
 00721157ae682-6febf2e7688mr9147457b3.15.1741287687675; Thu, 06 Mar 2025
 11:01:27 -0800 (PST)
MIME-Version: 1.0
References: <20250305-mipi-synaptic-1-v1-1-92017cd19ef6@redhat.com>
 <20250306-clever-lime-tanuki-e2fc43@houat>
 <CAN9Xe3SDyC47HWww1eH63aZOiM-WF9BGxztM3yh9bf6ORuY7VA@mail.gmail.com>
 <CAA8EJpqBy22eWZjccT5_UM2PQGjiG4ZEfrb6S_1tP1w962rd8w@mail.gmail.com>
 <CAN9Xe3QQLze9ZBbWG=KLYHzaFLZsmhah6GrYKmKMCd62rYP=OQ@mail.gmail.com>
 <cec91b2e-d639-4d9e-ae85-33d27f634800@gmail.com>
In-Reply-To: <cec91b2e-d639-4d9e-ae85-33d27f634800@gmail.com>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 6 Mar 2025 14:01:16 -0500
X-Gm-Features: AQ5f1JoxVpNo6KeyKisAqoJ_z0QpmNvPUHTbs4AgqmxVZdbqqEI1Uo9FUdhJamk
Message-ID: <CAN9Xe3Sg7aaS9pThsvh9901gHNTSzHrwzE4WR5OfYvaZfcQ69g@mail.gmail.com>
Subject: Re: [PATCH] drm/panel/synaptics-r63353: Use _multi variants
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, 
 Michael Trimarchi <michael@amarulasolutions.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Doug Anderson <dianders@chromium.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GlTlqREfHl-VZByEqM8hQlTWXA_nd_Kr4we4ogDL8tk_1741287688
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000137804062fb1224e"
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

--000000000000137804062fb1224e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 12:26=E2=80=AFPM Tejas Vipin <tejasvipin76@gmail.com=
> wrote:

>
>
> On 3/6/25 9:03 PM, Anusha Srivatsa wrote:
> > On Thu, Mar 6, 2025 at 11:29=E2=80=AFAM Dmitry Baryshkov <
> > dmitry.baryshkov@linaro.org> wrote:
> >
> >> On Thu, 6 Mar 2025 at 17:10, Anusha Srivatsa <asrivats@redhat.com>
> wrote:
> >>>
> >>>
> >>>
> >>> On Thu, Mar 6, 2025 at 4:31=E2=80=AFAM Maxime Ripard <mripard@kernel.=
org>
> wrote:
> >>>>
> >>>> Hi Anusha,
> >>>>
> >>>> On Wed, Mar 05, 2025 at 07:01:41PM -0500, Anusha Srivatsa wrote:
> >>>>> Move away from using deprecated API and use _multi
> >>>>> variants if available. Use mipi_dsi_msleep()
> >>>>> and mipi_dsi_usleep_range() instead of msleep()
> >>>>> and usleep_range() respectively.
> >>>>>
> >>>>> Used Coccinelle to find the multiple occurences.
> >>>>> SmPl patch:
> >>>>> @rule@
> >>>>> identifier dsi_var;
> >>>>> identifier r;
> >>>>> identifier func;
> >>>>> type t;
> >>>>> position p;
> >>>>> expression dsi_device;
> >>>>> expression list es;
> >>>>> @@
> >>>>> t func(...) {
> >>>>> ...
> >>>>> struct mipi_dsi_device *dsi_var =3D dsi_device;
> >>>>> +struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi_var };
> >>>>> <+...
> >>>>> (
> >>>>> -mipi_dsi_dcs_write_seq(dsi_var,es)@p;
> >>>>> +mipi_dsi_dcs_write_seq_multi(&dsi_ctx,es);
> >>>>> |
> >>>>> -mipi_dsi_generic_write_seq(dsi_var,es)@p;
> >>>>> +mipi_dsi_generic_write_seq_multi(&dsi_ctx,es);
> >>>>> |
> >>>>> -mipi_dsi_generic_write(dsi_var,es)@p;
> >>>>> +mipi_dsi_generic_write_multi(&dsi_ctx,es);
> >>>>> |
> >>>>> -r =3D mipi_dsi_dcs_nop(dsi_var)@p;
> >>>>> +mipi_dsi_dcs_nop_multi(&dsi_ctx);
> >>>>> |
> >>>>> ....rest of API
> >>>>> ..
> >>>>> )
> >>>>> -if(r < 0) {
> >>>>> -...
> >>>>> -}
> >>>>> ...+>
> >>>>
> >>>> The point of sending a single patch was to review the coccinelle
> script,
> >>>> so you must put the entire script you used here.
> >>>>
> >>>
> >>> I was actually thinking of sending patches per driver this time aroun=
d
> >> since Tejas also seems to be looking into similar parts....Thoughts?
> >>
> >> Have you discussed it with Tejas? What is his next target?
> >>
> >> I was hoping he will have some feedback on this patch and we could tak=
e
> it
> > from there.....
> > It *should* be okay for me to send all changes in a single series...
> >
> > Anusha
> >
>
> There's 5 more panels that use dcs/generic write_seq(). Maybe I could
> work on those (himax-hx8394, samsung-sofef00, samsung-s6d7aa0,
> boe-bf060y8m-aj0, jdi-lpm102a188a) while you work on transitioning the
> rest of the panels (excluding these) that use other functions in the
> old API? When either of us finishes before the other we could have
> another discussion about splitting work if necessary. I'm open to other
> suggestions too
>

Like the suggestion! Thanks Tejas.

Anusha

> >>>>> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> >>>>
> >>>> That hasn't been my email address for 6 years :)
> >>>>
> >>> My bad. Will change this.
> >>
> >>
> >>
> >> --
> >> With best wishes
> >> Dmitry
> >>
> >>
> >
>
> --
> Tejas Vipin
>
>

--000000000000137804062fb1224e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 6, =
2025 at 12:26=E2=80=AFPM Tejas Vipin &lt;<a href=3D"mailto:tejasvipin76@gma=
il.com">tejasvipin76@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><br>
<br>
On 3/6/25 9:03 PM, Anusha Srivatsa wrote:<br>
&gt; On Thu, Mar 6, 2025 at 11:29=E2=80=AFAM Dmitry Baryshkov &lt;<br>
&gt; <a href=3D"mailto:dmitry.baryshkov@linaro.org" target=3D"_blank">dmitr=
y.baryshkov@linaro.org</a>&gt; wrote:<br>
&gt; <br>
&gt;&gt; On Thu, 6 Mar 2025 at 17:10, Anusha Srivatsa &lt;<a href=3D"mailto=
:asrivats@redhat.com" target=3D"_blank">asrivats@redhat.com</a>&gt; wrote:<=
br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Thu, Mar 6, 2025 at 4:31=E2=80=AFAM Maxime Ripard &lt;<a hr=
ef=3D"mailto:mripard@kernel.org" target=3D"_blank">mripard@kernel.org</a>&g=
t; wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Hi Anusha,<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On Wed, Mar 05, 2025 at 07:01:41PM -0500, Anusha Srivatsa =
wrote:<br>
&gt;&gt;&gt;&gt;&gt; Move away from using deprecated API and use _multi<br>
&gt;&gt;&gt;&gt;&gt; variants if available. Use mipi_dsi_msleep()<br>
&gt;&gt;&gt;&gt;&gt; and mipi_dsi_usleep_range() instead of msleep()<br>
&gt;&gt;&gt;&gt;&gt; and usleep_range() respectively.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Used Coccinelle to find the multiple occurences.<br>
&gt;&gt;&gt;&gt;&gt; SmPl patch:<br>
&gt;&gt;&gt;&gt;&gt; @rule@<br>
&gt;&gt;&gt;&gt;&gt; identifier dsi_var;<br>
&gt;&gt;&gt;&gt;&gt; identifier r;<br>
&gt;&gt;&gt;&gt;&gt; identifier func;<br>
&gt;&gt;&gt;&gt;&gt; type t;<br>
&gt;&gt;&gt;&gt;&gt; position p;<br>
&gt;&gt;&gt;&gt;&gt; expression dsi_device;<br>
&gt;&gt;&gt;&gt;&gt; expression list es;<br>
&gt;&gt;&gt;&gt;&gt; @@<br>
&gt;&gt;&gt;&gt;&gt; t func(...) {<br>
&gt;&gt;&gt;&gt;&gt; ...<br>
&gt;&gt;&gt;&gt;&gt; struct mipi_dsi_device *dsi_var =3D dsi_device;<br>
&gt;&gt;&gt;&gt;&gt; +struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D =
dsi_var };<br>
&gt;&gt;&gt;&gt;&gt; &lt;+...<br>
&gt;&gt;&gt;&gt;&gt; (<br>
&gt;&gt;&gt;&gt;&gt; -mipi_dsi_dcs_write_seq(dsi_var,es)@p;<br>
&gt;&gt;&gt;&gt;&gt; +mipi_dsi_dcs_write_seq_multi(&amp;dsi_ctx,es);<br>
&gt;&gt;&gt;&gt;&gt; |<br>
&gt;&gt;&gt;&gt;&gt; -mipi_dsi_generic_write_seq(dsi_var,es)@p;<br>
&gt;&gt;&gt;&gt;&gt; +mipi_dsi_generic_write_seq_multi(&amp;dsi_ctx,es);<br=
>
&gt;&gt;&gt;&gt;&gt; |<br>
&gt;&gt;&gt;&gt;&gt; -mipi_dsi_generic_write(dsi_var,es)@p;<br>
&gt;&gt;&gt;&gt;&gt; +mipi_dsi_generic_write_multi(&amp;dsi_ctx,es);<br>
&gt;&gt;&gt;&gt;&gt; |<br>
&gt;&gt;&gt;&gt;&gt; -r =3D mipi_dsi_dcs_nop(dsi_var)@p;<br>
&gt;&gt;&gt;&gt;&gt; +mipi_dsi_dcs_nop_multi(&amp;dsi_ctx);<br>
&gt;&gt;&gt;&gt;&gt; |<br>
&gt;&gt;&gt;&gt;&gt; ....rest of API<br>
&gt;&gt;&gt;&gt;&gt; ..<br>
&gt;&gt;&gt;&gt;&gt; )<br>
&gt;&gt;&gt;&gt;&gt; -if(r &lt; 0) {<br>
&gt;&gt;&gt;&gt;&gt; -...<br>
&gt;&gt;&gt;&gt;&gt; -}<br>
&gt;&gt;&gt;&gt;&gt; ...+&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; The point of sending a single patch was to review the cocc=
inelle script,<br>
&gt;&gt;&gt;&gt; so you must put the entire script you used here.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I was actually thinking of sending patches per driver this tim=
e around<br>
&gt;&gt; since Tejas also seems to be looking into similar parts....Thought=
s?<br>
&gt;&gt;<br>
&gt;&gt; Have you discussed it with Tejas? What is his next target?<br>
&gt;&gt;<br>
&gt;&gt; I was hoping he will have some feedback on this patch and we could=
 take it<br>
&gt; from there.....<br>
&gt; It *should* be okay for me to send all changes in a single series...<b=
r>
&gt; <br>
&gt; Anusha<br>
&gt;<br>
<br>
There&#39;s 5 more panels that use dcs/generic write_seq(). Maybe I could<b=
r>
work on those (himax-hx8394, samsung-sofef00, samsung-s6d7aa0,<br>
boe-bf060y8m-aj0, jdi-lpm102a188a) while you work on transitioning the<br>
rest of the panels (excluding these) that use other functions in the <br>
old API? When either of us finishes before the other we could have <br>
another discussion about splitting work if necessary. I&#39;m open to other=
<br>
suggestions too<br></blockquote><div><br></div><div>Like the suggestion! Th=
anks Tejas.=C2=A0</div><div><br></div><div>Anusha <br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
&gt;&gt;&gt;&gt;&gt; Cc: Maxime Ripard &lt;<a href=3D"mailto:maxime.ripard@=
bootlin.com" target=3D"_blank">maxime.ripard@bootlin.com</a>&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; That hasn&#39;t been my email address for 6 years :)<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; My bad. Will change this.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; With best wishes<br>
&gt;&gt; Dmitry<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; <br>
<br>
-- <br>
Tejas Vipin<br>
<br>
</blockquote></div></div>

--000000000000137804062fb1224e--


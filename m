Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC442A55140
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 17:36:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10FE010EA0C;
	Thu,  6 Mar 2025 16:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BK3y74/n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED30610EA0C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 16:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741278967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/hwBhi3hreMjxlCpzbkV2AlwrFWTZ1blvpFu9fE0pxw=;
 b=BK3y74/n4FjYo4+RPp7a0sPsXcLzbhRNzosdS0Cq1AJDrkXFeLFr7/rEeDv5DTWjlKO52i
 x9rWMn0mqz2UkeiChSMzycDm51Zi/tgST/W+3TdspRVxsrCuIgRsJHxqgT+/D5sZ2tP8gH
 GiQix4d5d/4QD8Hd9JghJWp0apdjue0=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-cLzZMFv-OwaJjqrFf-uQGQ-1; Thu, 06 Mar 2025 11:36:01 -0500
X-MC-Unique: cLzZMFv-OwaJjqrFf-uQGQ-1
X-Mimecast-MFC-AGG-ID: cLzZMFv-OwaJjqrFf-uQGQ_1741278960
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-6f2c7746509so13563207b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 08:36:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741278960; x=1741883760;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/hwBhi3hreMjxlCpzbkV2AlwrFWTZ1blvpFu9fE0pxw=;
 b=kAaE90bcMexuGO2Hh5UbnuS/UXJXkN11aBbJ+WsraqefqaHjF3IK+2dO5Ve0FKUlFZ
 ExjdFdUs5zeWZI+/JSpZfse1d7yyvfAnZ7IeLtbK2wz5GHU+edIQ1c02jay9yZEMeCjK
 r5Wb7ewoBIzYHiN2secI9omiTgWCVbliH5owNA7lGMoiHi9vR3ofeU64vi9Kia09d1QE
 k2iFE1DLAXB8RrVKRbtvHEH/uvbRpoolf948hyiGADwasJ5MQij1gvcvulQ0dgEXNOWB
 4VqSQCqaZ7pOj5BslT9mF3TUzWD5/t9Y5v3PXESwfnbVtisz63RQwTu9JmXgiJdrL7NC
 NZ0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV22Gb+okHb3GNgw5lJh8k4Dir8ohBQ5sQio8SRDDhdw9PzF2uMpNewzOhqXfBw3naAE9F6UnlZyyI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqHuak43lG8SToZJCrlQ8XYe2wvVII4ujRwUCrS1LjJkR+cywv
 XED8Zu5lU4ZymDCbCoKyze84gYyOU30EF99URArOFqr6MEvESoH/QtR/HboHyBdwdqqQ0n5X3UY
 7FXGTJN5j6duBGiGJVZj+5MrfuONhgNVM7rs3Qzd/PEFTU+fPXGNAyiUbo9js3Om9WG6yvS33GO
 PmUZhZjczEVPN/bIXts+QzSIzSSaMg0+b8qq981Qns
X-Gm-Gg: ASbGncvtZNbqFvMlAVwLECi8BVH/slgWb5xaCgHeVOzpMJ6xN8k2f2Uhbj8TJjGAZmG
 j4SPDlrd9WSslL91tG7bOiBRAem7MO41tvFrBEgm1tjHkiCTAI97vSK4+U4lEL8G2WTkVdyA=
X-Received: by 2002:a05:690c:7243:b0:6fb:9389:3cde with SMTP id
 00721157ae682-6fda2fe10a1mr106094967b3.3.1741278960411; 
 Thu, 06 Mar 2025 08:36:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBDgx5vsYcyY9dkA2DVRHY4epHUb81dX0YsDO53gPEpI2wHFfG1gFw8oOA1/Ywh+cs0i8BZmbelsv0UCh0abw=
X-Received: by 2002:a05:690c:7243:b0:6fb:9389:3cde with SMTP id
 00721157ae682-6fda2fe10a1mr106094717b3.3.1741278960175; Thu, 06 Mar 2025
 08:36:00 -0800 (PST)
MIME-Version: 1.0
References: <20250305-mipi-synaptic-1-v1-1-92017cd19ef6@redhat.com>
 <20250306-clever-lime-tanuki-e2fc43@houat>
 <CAN9Xe3SDyC47HWww1eH63aZOiM-WF9BGxztM3yh9bf6ORuY7VA@mail.gmail.com>
 <CAA8EJpqBy22eWZjccT5_UM2PQGjiG4ZEfrb6S_1tP1w962rd8w@mail.gmail.com>
In-Reply-To: <CAA8EJpqBy22eWZjccT5_UM2PQGjiG4ZEfrb6S_1tP1w962rd8w@mail.gmail.com>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 6 Mar 2025 10:33:33 -0500
X-Gm-Features: AQ5f1JracV3MvpfCVLotNKbENbg1lThpeKYQL4v3o5vgd1kGn2dzQm9t3Zw_h4w
Message-ID: <CAN9Xe3QQLze9ZBbWG=KLYHzaFLZsmhah6GrYKmKMCd62rYP=OQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel/synaptics-r63353: Use _multi variants
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>,
 Michael Trimarchi <michael@amarulasolutions.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Tejas Vipin <tejasvipin76@gmail.com>, 
 Doug Anderson <dianders@chromium.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3vB0xTgt5IJcy3B55WmAJgWYxnCxv0GoIBQgAmKlivw_1741278960
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000e06bbd062faf1946"
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

--000000000000e06bbd062faf1946
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 11:29=E2=80=AFAM Dmitry Baryshkov <
dmitry.baryshkov@linaro.org> wrote:

> On Thu, 6 Mar 2025 at 17:10, Anusha Srivatsa <asrivats@redhat.com> wrote:
> >
> >
> >
> > On Thu, Mar 6, 2025 at 4:31=E2=80=AFAM Maxime Ripard <mripard@kernel.or=
g> wrote:
> >>
> >> Hi Anusha,
> >>
> >> On Wed, Mar 05, 2025 at 07:01:41PM -0500, Anusha Srivatsa wrote:
> >> > Move away from using deprecated API and use _multi
> >> > variants if available. Use mipi_dsi_msleep()
> >> > and mipi_dsi_usleep_range() instead of msleep()
> >> > and usleep_range() respectively.
> >> >
> >> > Used Coccinelle to find the multiple occurences.
> >> > SmPl patch:
> >> > @rule@
> >> > identifier dsi_var;
> >> > identifier r;
> >> > identifier func;
> >> > type t;
> >> > position p;
> >> > expression dsi_device;
> >> > expression list es;
> >> > @@
> >> > t func(...) {
> >> > ...
> >> > struct mipi_dsi_device *dsi_var =3D dsi_device;
> >> > +struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi_var };
> >> > <+...
> >> > (
> >> > -mipi_dsi_dcs_write_seq(dsi_var,es)@p;
> >> > +mipi_dsi_dcs_write_seq_multi(&dsi_ctx,es);
> >> > |
> >> > -mipi_dsi_generic_write_seq(dsi_var,es)@p;
> >> > +mipi_dsi_generic_write_seq_multi(&dsi_ctx,es);
> >> > |
> >> > -mipi_dsi_generic_write(dsi_var,es)@p;
> >> > +mipi_dsi_generic_write_multi(&dsi_ctx,es);
> >> > |
> >> > -r =3D mipi_dsi_dcs_nop(dsi_var)@p;
> >> > +mipi_dsi_dcs_nop_multi(&dsi_ctx);
> >> > |
> >> > ....rest of API
> >> > ..
> >> > )
> >> > -if(r < 0) {
> >> > -...
> >> > -}
> >> > ...+>
> >>
> >> The point of sending a single patch was to review the coccinelle scrip=
t,
> >> so you must put the entire script you used here.
> >>
> >
> > I was actually thinking of sending patches per driver this time around
> since Tejas also seems to be looking into similar parts....Thoughts?
>
> Have you discussed it with Tejas? What is his next target?
>
> I was hoping he will have some feedback on this patch and we could take i=
t
from there.....
It *should* be okay for me to send all changes in a single series...

Anusha

> >> > Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> >>
> >> That hasn't been my email address for 6 years :)
> >>
> > My bad. Will change this.
>
>
>
> --
> With best wishes
> Dmitry
>
>

--000000000000e06bbd062faf1946
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 6, =
2025 at 11:29=E2=80=AFAM Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.bary=
shkov@linaro.org">dmitry.baryshkov@linaro.org</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">On Thu, 6 Mar 2025 at 17:10, A=
nusha Srivatsa &lt;<a href=3D"mailto:asrivats@redhat.com" target=3D"_blank"=
>asrivats@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Thu, Mar 6, 2025 at 4:31=E2=80=AFAM Maxime Ripard &lt;<a href=3D"ma=
ilto:mripard@kernel.org" target=3D"_blank">mripard@kernel.org</a>&gt; wrote=
:<br>
&gt;&gt;<br>
&gt;&gt; Hi Anusha,<br>
&gt;&gt;<br>
&gt;&gt; On Wed, Mar 05, 2025 at 07:01:41PM -0500, Anusha Srivatsa wrote:<b=
r>
&gt;&gt; &gt; Move away from using deprecated API and use _multi<br>
&gt;&gt; &gt; variants if available. Use mipi_dsi_msleep()<br>
&gt;&gt; &gt; and mipi_dsi_usleep_range() instead of msleep()<br>
&gt;&gt; &gt; and usleep_range() respectively.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Used Coccinelle to find the multiple occurences.<br>
&gt;&gt; &gt; SmPl patch:<br>
&gt;&gt; &gt; @rule@<br>
&gt;&gt; &gt; identifier dsi_var;<br>
&gt;&gt; &gt; identifier r;<br>
&gt;&gt; &gt; identifier func;<br>
&gt;&gt; &gt; type t;<br>
&gt;&gt; &gt; position p;<br>
&gt;&gt; &gt; expression dsi_device;<br>
&gt;&gt; &gt; expression list es;<br>
&gt;&gt; &gt; @@<br>
&gt;&gt; &gt; t func(...) {<br>
&gt;&gt; &gt; ...<br>
&gt;&gt; &gt; struct mipi_dsi_device *dsi_var =3D dsi_device;<br>
&gt;&gt; &gt; +struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi_var=
 };<br>
&gt;&gt; &gt; &lt;+...<br>
&gt;&gt; &gt; (<br>
&gt;&gt; &gt; -mipi_dsi_dcs_write_seq(dsi_var,es)@p;<br>
&gt;&gt; &gt; +mipi_dsi_dcs_write_seq_multi(&amp;dsi_ctx,es);<br>
&gt;&gt; &gt; |<br>
&gt;&gt; &gt; -mipi_dsi_generic_write_seq(dsi_var,es)@p;<br>
&gt;&gt; &gt; +mipi_dsi_generic_write_seq_multi(&amp;dsi_ctx,es);<br>
&gt;&gt; &gt; |<br>
&gt;&gt; &gt; -mipi_dsi_generic_write(dsi_var,es)@p;<br>
&gt;&gt; &gt; +mipi_dsi_generic_write_multi(&amp;dsi_ctx,es);<br>
&gt;&gt; &gt; |<br>
&gt;&gt; &gt; -r =3D mipi_dsi_dcs_nop(dsi_var)@p;<br>
&gt;&gt; &gt; +mipi_dsi_dcs_nop_multi(&amp;dsi_ctx);<br>
&gt;&gt; &gt; |<br>
&gt;&gt; &gt; ....rest of API<br>
&gt;&gt; &gt; ..<br>
&gt;&gt; &gt; )<br>
&gt;&gt; &gt; -if(r &lt; 0) {<br>
&gt;&gt; &gt; -...<br>
&gt;&gt; &gt; -}<br>
&gt;&gt; &gt; ...+&gt;<br>
&gt;&gt;<br>
&gt;&gt; The point of sending a single patch was to review the coccinelle s=
cript,<br>
&gt;&gt; so you must put the entire script you used here.<br>
&gt;&gt;<br>
&gt;<br>
&gt; I was actually thinking of sending patches per driver this time around=
 since Tejas also seems to be looking into similar parts....Thoughts?<br>
<br>
Have you discussed it with Tejas? What is his next target?<br>
<br></blockquote><div>I was hoping he will have some feedback on this patch=
 and we could take it from there.....=C2=A0</div><div>It *should* be okay f=
or me to send all changes in a single series...</div><div><br></div><div>An=
usha</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;&gt; &gt; Cc: Maxime Ripard &lt;<a href=3D"mailto:maxime.ripard@bootlin=
.com" target=3D"_blank">maxime.ripard@bootlin.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; That hasn&#39;t been my email address for 6 years :)<br>
&gt;&gt;<br>
&gt; My bad. Will change this.<br>
<br>
<br>
<br>
-- <br>
With best wishes<br>
Dmitry<br>
<br>
</blockquote></div></div>

--000000000000e06bbd062faf1946--


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C8EA55047
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 17:10:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22CBA10E9E2;
	Thu,  6 Mar 2025 16:10:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GEk9aLti";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 742AA10E9E2
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 16:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741277451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q69luuoo+35XMoz4Re8uhCewZm5Mlopa0/HjDEh00BM=;
 b=GEk9aLtiOa4gVvPhDtHg7mMviAEAHNekd7b2qgsNMU8MRTSSRWUccRCDGj8H3K1L/9jE+e
 P/P8JOJKoTI994I31Yf0AMIUOYAYnX3B4TaEUGtIU8ved6Zl9zhrP1sW5mTzudHkgjUoe+
 XRx8BNkFZF/9PJqJMwZGHpDvCnywf0Q=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-qFqxp-ttPteBi1RFgiLrng-1; Thu, 06 Mar 2025 11:10:50 -0500
X-MC-Unique: qFqxp-ttPteBi1RFgiLrng-1
X-Mimecast-MFC-AGG-ID: qFqxp-ttPteBi1RFgiLrng_1741277449
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-6f2a2ab50f6so11626027b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 08:10:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741277449; x=1741882249;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q69luuoo+35XMoz4Re8uhCewZm5Mlopa0/HjDEh00BM=;
 b=L3mk+g91H/7+pRwGaW/aDZeQn9vpg+YNHDAex/gEWad1afIuERwGSrb54nqhBCFpRr
 WM+Lkpn/3YjFowRUq/ajnl66wQRDQscv1N50q13ShtUTpTgkwBnkQKxFVkRzVNk+NGIG
 VPBjNqAv7qcubMIM1CMlFcZBDosB2hvA+S4QfhqeT6p/latDtaPJe+IWFuG/hPRVTCAz
 48uAtSNgIHcV1mjQRlTAyMy7oYc2eE0rg9oAKKwKXDM4f3Fb0KFu7hRdpNVo4YuD4Imo
 kSLgPpX4fUWFsDbLCl/ttNgJgjwbqB0GYLf2RbaKJw2i53Ur3++oH0P6cA18eCierYtF
 PEwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUW3ZqbFJunamDqRJSXt1AXiZ7pUeJRrA9/qI0O6iydi+fR/1XQYc1F8snq0ojkOBmLTIyLQDB+qnE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLcqSMvElx53fbhlfQmyzohj1PLQSsuED8V1msaGxBladEYYp6
 gPcN+y40HDD5zNKF9coS1TjrIvdCrtbcTvwC8h7kdFo1cjVd2QnbJPKXjuKgPBAK6ynxBcGw9hs
 BUD2p2iPbgXxdpHBw4CMzOfl5FT+64+QdeUp/p0SWo29QqDxzR/tYOGZ9US++9BTPPBmC4vYhE2
 cVU7RYV6G2DNmdT9XbbiuCZnmymhEWfkM5iqCEy7Wz
X-Gm-Gg: ASbGncuNdwqInjnYLHKth96WGz3c8JH0FaU+hIo1JlZCBI5fZ90MNfZjPbz37M1ECWY
 zpsQyHndOcQF6QWHe4oN20w89SwFT/r4zjEHMRR7toKjvu3N7D2XyKxfxvsi9t5fr/ZgfR/c=
X-Received: by 2002:a05:690c:6b11:b0:6ef:48ac:9d0c with SMTP id
 00721157ae682-6fda31225cbmr114351307b3.25.1741277449624; 
 Thu, 06 Mar 2025 08:10:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFSCzqD/h8QPTGSfKSE1fFgVcl1woUUXPclhM4ogHXnzmJ6eaQ3Mjv5hWwOMqiv7UjtBxcyA86daE292EE9Z8M=
X-Received: by 2002:a05:690c:6b11:b0:6ef:48ac:9d0c with SMTP id
 00721157ae682-6fda31225cbmr114350797b3.25.1741277449323; Thu, 06 Mar 2025
 08:10:49 -0800 (PST)
MIME-Version: 1.0
References: <20250305-mipi-synaptic-1-v1-1-92017cd19ef6@redhat.com>
 <20250306-clever-lime-tanuki-e2fc43@houat>
In-Reply-To: <20250306-clever-lime-tanuki-e2fc43@houat>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 6 Mar 2025 10:08:24 -0500
X-Gm-Features: AQ5f1Joyf9pys-fTQPbz8yQrxe46Oj7tlQUUQ-ahGyfizWyXX7eTy9ZfYIwD1Tg
Message-ID: <CAN9Xe3SDyC47HWww1eH63aZOiM-WF9BGxztM3yh9bf6ORuY7VA@mail.gmail.com>
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
X-Mimecast-MFC-PROC-ID: RTd593gfAjOGzX62SyChF9TuLs0pj3Vo_zzrc8HDld4_1741277449
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000d2a91a062faebfe1"
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

--000000000000d2a91a062faebfe1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 4:31=E2=80=AFAM Maxime Ripard <mripard@kernel.org> w=
rote:

> Hi Anusha,
>
> On Wed, Mar 05, 2025 at 07:01:41PM -0500, Anusha Srivatsa wrote:
> > Move away from using deprecated API and use _multi
> > variants if available. Use mipi_dsi_msleep()
> > and mipi_dsi_usleep_range() instead of msleep()
> > and usleep_range() respectively.
> >
> > Used Coccinelle to find the multiple occurences.
> > SmPl patch:
> > @rule@
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
> > -mipi_dsi_dcs_write_seq(dsi_var,es)@p;
> > +mipi_dsi_dcs_write_seq_multi(&dsi_ctx,es);
> > |
> > -mipi_dsi_generic_write_seq(dsi_var,es)@p;
> > +mipi_dsi_generic_write_seq_multi(&dsi_ctx,es);
> > |
> > -mipi_dsi_generic_write(dsi_var,es)@p;
> > +mipi_dsi_generic_write_multi(&dsi_ctx,es);
> > |
> > -r =3D mipi_dsi_dcs_nop(dsi_var)@p;
> > +mipi_dsi_dcs_nop_multi(&dsi_ctx);
> > |
> > ....rest of API
> > ..
> > )
> > -if(r < 0) {
> > -...
> > -}
> > ...+>
>
> The point of sending a single patch was to review the coccinelle script,
> so you must put the entire script you used here.
>
>
I was actually thinking of sending patches per driver this time around
since Tejas also seems to be looking into similar parts....Thoughts?


> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
>
> That hasn't been my email address for 6 years :)
>
> My bad. Will change this.

Anusha

> Maxime
>

--000000000000d2a91a062faebfe1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 6, =
2025 at 4:31=E2=80=AFAM Maxime Ripard &lt;<a href=3D"mailto:mripard@kernel.=
org">mripard@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Hi Anusha,<br>
<br>
On Wed, Mar 05, 2025 at 07:01:41PM -0500, Anusha Srivatsa wrote:<br>
&gt; Move away from using deprecated API and use _multi<br>
&gt; variants if available. Use mipi_dsi_msleep()<br>
&gt; and mipi_dsi_usleep_range() instead of msleep()<br>
&gt; and usleep_range() respectively.<br>
&gt; <br>
&gt; Used Coccinelle to find the multiple occurences.<br>
&gt; SmPl patch:<br>
&gt; @rule@<br>
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
&gt; -mipi_dsi_dcs_write_seq(dsi_var,es)@p;<br>
&gt; +mipi_dsi_dcs_write_seq_multi(&amp;dsi_ctx,es);<br>
&gt; |<br>
&gt; -mipi_dsi_generic_write_seq(dsi_var,es)@p;<br>
&gt; +mipi_dsi_generic_write_seq_multi(&amp;dsi_ctx,es);<br>
&gt; |<br>
&gt; -mipi_dsi_generic_write(dsi_var,es)@p;<br>
&gt; +mipi_dsi_generic_write_multi(&amp;dsi_ctx,es);<br>
&gt; |<br>
&gt; -r =3D mipi_dsi_dcs_nop(dsi_var)@p;<br>
&gt; +mipi_dsi_dcs_nop_multi(&amp;dsi_ctx);<br>
&gt; |<br>
&gt; ....rest of API<br>
&gt; ..<br>
&gt; )<br>
&gt; -if(r &lt; 0) {<br>
&gt; -...<br>
&gt; -}<br>
&gt; ...+&gt;<br>
<br>
The point of sending a single patch was to review the coccinelle script,<br=
>
so you must put the entire script you used here.<br>
<br></blockquote><div><br></div><div>I was actually thinking of sending pat=
ches per driver this time around since Tejas also seems to be looking into =
similar parts....Thoughts?</div><div>=C2=A0</div><div><br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
&gt; Cc: Maxime Ripard &lt;<a href=3D"mailto:maxime.ripard@bootlin.com" tar=
get=3D"_blank">maxime.ripard@bootlin.com</a>&gt;<br>
<br>
That hasn&#39;t been my email address for 6 years :)<br>
<br></blockquote><div>My bad. Will change this.</div><div><br></div><div>An=
usha=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Maxime<br>
</blockquote></div></div>

--000000000000d2a91a062faebfe1--


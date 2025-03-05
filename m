Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7791CA5065E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 18:29:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8839B10E81C;
	Wed,  5 Mar 2025 17:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="a6P0b94y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A348110E81C
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 17:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741195769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m+Uc6ofXsQKUvvRYiZER3AwMsPnTWSon6PId4zI6oXo=;
 b=a6P0b94yZRcPqnfLGsZZfWNl6gpCPumaFgyoXrDOuwl3DFyfiWVerbMHSc37VdiC19pPlz
 aX3vVu9G1ttrOhPGRVtWizllgmtmZhQX9SU4K+pR639c8JRIwUxdDWNSiAoyb9IhCKENZA
 /OehOfUrqRnp9VXGP8hYTOWAK2jhy9w=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81-AKzY_PWVOfyD7cSJ5ftq4w-1; Wed, 05 Mar 2025 12:29:18 -0500
X-MC-Unique: AKzY_PWVOfyD7cSJ5ftq4w-1
X-Mimecast-MFC-AGG-ID: AKzY_PWVOfyD7cSJ5ftq4w_1741195758
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-6f2a2ab50f6so101165377b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Mar 2025 09:29:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741195758; x=1741800558;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m+Uc6ofXsQKUvvRYiZER3AwMsPnTWSon6PId4zI6oXo=;
 b=dOcFgNVSvCmSzkUYxUy3dkGNyGrjlDWrN/OXsTILSiRYwIRQgo/pN2a7L5qnBdn1Ar
 1DVmoJVGdUNyMRAdHKZC6B0m3vm2GCo5Z3jZMemtGtlHvA+LTMieUIhI7cFwzEgkcWTx
 bVcsqiVeZEED2ok5X6RI9Hs4mtKob3rTM++e0AWELghZwq/iBuIg2NswvG4+hhyOLF8r
 hlw8Yx6DU1MblgdrIcehJlicoGhL2kI4wPth+TudJtqajJopqKeIR9exfUKw+MI5J73Y
 nRRKuJ2YX9rTxlKyt5Q6KzM2ae26gE3st7mDl8BJ5CZU02HfedLpGHJCvcPeA+Z8joQl
 +zYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqhjh46+KrzQoX4CdBnGaNIoliaH/gQbg5zb07gZ5p79e0AG0pli7pZyEqL5MQllbdjuXw6cGgXnU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymQNfyiWAXWGZP2Ev/1nPOr+YKxmxrlfeYJZA/bgkQFVKYuciw
 vX7epIUViJTDCavI6pdSfceTBokwb8ZdBR41FdjPHmpxxRUgf3701FJXdLOWuvBQRhgKFSB+w3t
 b78J8tdT1LmOOC7sI1MryBZ71wvbIWV5BHfsszNkFlH2o40iyjXfFfKbqjYbYXgxFnqOqY2h3Gp
 35l8pyrcTFNrmBq7KS5v9c6fnqpnyYwK5BCVIrf0Vh
X-Gm-Gg: ASbGncs/9RWA/7VTa0Ngeg/mu6K9fb2FkQAQTT0qZcoxAIqU9zdsNcqlwdTKH5gbgVA
 chr7acjayOPsrPLftzQIkyRpCp68bgDuqXU0vzf3cvSEBcWnGRQfT3KVR4JLh5nOcJ8ZH0tk=
X-Received: by 2002:a05:690c:6b11:b0:6ef:48ac:9d0c with SMTP id
 00721157ae682-6fda31225cbmr61042447b3.25.1741195757973; 
 Wed, 05 Mar 2025 09:29:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqf+rgcCZfkvxo+b2+MYpfub1OpKQvQ29tSf+h3GzR3IN0Da+EIhlEIILuxDfYOJt/Ef5AaNGONyN3mWAEEC8=
X-Received: by 2002:a05:690c:6b11:b0:6ef:48ac:9d0c with SMTP id
 00721157ae682-6fda31225cbmr61042057b3.25.1741195757656; Wed, 05 Mar 2025
 09:29:17 -0800 (PST)
MIME-Version: 1.0
References: <20250206-mipi-cocci-v1-0-4ff0c69e8897@redhat.com>
 <CAD=FV=WkPefg00R_TAQQA6waRqGdD+3e84JXfPLk2i9BRzW6Yg@mail.gmail.com>
In-Reply-To: <CAD=FV=WkPefg00R_TAQQA6waRqGdD+3e84JXfPLk2i9BRzW6Yg@mail.gmail.com>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 5 Mar 2025 12:29:06 -0500
X-Gm-Features: AQ5f1JoyXJztYYlq-TtxDj4yoBykgBKoLz7TpFuH6vwJfXZDkoQmfuH4eq39PGU
Message-ID: <CAN9Xe3S6u1hjp0YifoFC4N9t6Ek3+ZZQPPbL529Y1_+AvnPNLg@mail.gmail.com>
Subject: Re: [PATCH 00/14] drm/panel: Transition away from using
 mipi_dsi_*_write_seq()
To: Doug Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Joel Selvaraj <jo@jsfamily.in>, Ondrej Jirman <megi@xff.cz>, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Artur Weber <aweber.kernel@gmail.com>, 
 Jianhua Lu <lujianhua000@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Tejas Vipin <tejasvipin76@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xErfcYSxSp7I4LRifsAcVLUJ9cjmxmeZYDKyZLuExZA_1741195758
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000009ead96062f9bba49"
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

--0000000000009ead96062f9bba49
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 8, 2025 at 3:43=E2=80=AFPM Doug Anderson <dianders@chromium.org=
> wrote:

> Hi,
>
> On Thu, Feb 6, 2025 at 1:06=E2=80=AFPM Anusha Srivatsa <asrivats@redhat.c=
om>
> wrote:
> >
> > Transition away from mipi_dsi_generic_write_seq() and
> > mipi_dsi_dcs_write_seq() to mipi_dsi_generic_write_seq_multi()
> > and mipi_dsi_dcs_write_seq_multi() respectively.
> >
> > This is addressing one of the gpu todo items [1]
> >
> > Used Coccinelle to make the code changes.
>
> As Dmitry mentioned [1], I think a real cleanup needs more thought
> than can be done in a Coccinelle script. Maybe you can make a script
> that's super fancy and does a perfect conversion, but I sorta doubt it
> in this case.
>
> A few other note:
>
> * Tejas Vipin has been slowly whittling down this TODO item. It would
> be good to CC him on any attempts to avoid duplicating work. He just
> submitted a patch [2] that duplicates one of the panels you ran your
> script on. It would also be good to look at the patches he has been
> posting to see some of the extra complexities.
>
> * I'm happy you CCed on the cover letter, but given that I've been
> helping with this TODO entry it would have been nice to have been CCed
> on all the patches.
>
> For now I'm not going to review the individual patches in this series.
> If there are any where you think your Coccinelle script really got
> everything adjusted perfectly then feel free to point them out and
> I'll review them. If you want to help with this effort, my own
> personal preference would be to at least start w/ one panel at a time
> since probably review feedback on all the conversions will be similar.
>
> Thanks!
>
>
I thought I had replied to this  :( (face-palm) sincere apologies. Luckily
I bumped into this today.  Thanks for the feedback. I agree with what you
said. While the script catches the patterns , a little of manual conversion
and proof checking is needed. I am taking this into account while I spin
the next version. WIll CC everyone in individual patches who have taken
their time to take a look at my clearly incomplete approach to this
redesign.

Again, thanks Dough

Anusha

> -Doug
>
> [1]
> https://lore.kernel.org/r/mz6usiheb2lx6wlk47z3btvf6t6kbo4ja4n6mli5hosrpcv=
dwp@wmvfvhaqhpkm
> [2]
> http://lore.kernel.org/r/20250208051541.176667-1-tejasvipin76@gmail.com
>
>

--0000000000009ead96062f9bba49
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Feb 8, =
2025 at 3:43=E2=80=AFPM Doug Anderson &lt;<a href=3D"mailto:dianders@chromi=
um.org">dianders@chromium.org</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">Hi,<br>
<br>
On Thu, Feb 6, 2025 at 1:06=E2=80=AFPM Anusha Srivatsa &lt;<a href=3D"mailt=
o:asrivats@redhat.com" target=3D"_blank">asrivats@redhat.com</a>&gt; wrote:=
<br>
&gt;<br>
&gt; Transition away from mipi_dsi_generic_write_seq() and<br>
&gt; mipi_dsi_dcs_write_seq() to mipi_dsi_generic_write_seq_multi()<br>
&gt; and mipi_dsi_dcs_write_seq_multi() respectively.<br>
&gt;<br>
&gt; This is addressing one of the gpu todo items [1]<br>
&gt;<br>
&gt; Used Coccinelle to make the code changes.<br>
<br>
As Dmitry mentioned [1], I think a real cleanup needs more thought<br>
than can be done in a Coccinelle script. Maybe you can make a script<br>
that&#39;s super fancy and does a perfect conversion, but I sorta doubt it<=
br>
in this case.<br>
<br>
A few other note:<br>
<br>
* Tejas Vipin has been slowly whittling down this TODO item. It would<br>
be good to CC him on any attempts to avoid duplicating work. He just<br>
submitted a patch [2] that duplicates one of the panels you ran your<br>
script on. It would also be good to look at the patches he has been<br>
posting to see some of the extra complexities.<br>
<br>
* I&#39;m happy you CCed on the cover letter, but given that I&#39;ve been<=
br>
helping with this TODO entry it would have been nice to have been CCed<br>
on all the patches.<br>
<br>
For now I&#39;m not going to review the individual patches in this series.<=
br>
If there are any where you think your Coccinelle script really got<br>
everything adjusted perfectly then feel free to point them out and<br>
I&#39;ll review them. If you want to help with this effort, my own<br>
personal preference would be to at least start w/ one panel at a time<br>
since probably review feedback on all the conversions will be similar.<br>
<br>
Thanks!<br>
<br></blockquote><div><br></div><div>I thought I had replied to this=C2=A0 =
:( (face-palm) sincere apologies. Luckily I bumped into this today.=C2=A0 T=
hanks for the feedback. I agree with what you said. While the script catche=
s the patterns , a little of manual conversion and proof checking is needed=
. I am taking this into account while I spin the next version. WIll CC ever=
yone in individual patches who have taken their time to take a look at my c=
learly incomplete approach to this redesign.=C2=A0</div><div><br></div><div=
>Again, thanks Dough</div><div><br></div><div>Anusha</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
-Doug<br>
<br>
[1] <a href=3D"https://lore.kernel.org/r/mz6usiheb2lx6wlk47z3btvf6t6kbo4ja4=
n6mli5hosrpcvdwp@wmvfvhaqhpkm" rel=3D"noreferrer" target=3D"_blank">https:/=
/lore.kernel.org/r/mz6usiheb2lx6wlk47z3btvf6t6kbo4ja4n6mli5hosrpcvdwp@wmvfv=
haqhpkm</a><br>
[2] <a href=3D"http://lore.kernel.org/r/20250208051541.176667-1-tejasvipin7=
6@gmail.com" rel=3D"noreferrer" target=3D"_blank">http://lore.kernel.org/r/=
20250208051541.176667-1-tejasvipin76@gmail.com</a><br>
<br>
</blockquote></div></div>

--0000000000009ead96062f9bba49--


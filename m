Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF578AC4C13
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 12:15:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6464F10E107;
	Tue, 27 May 2025 10:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c232LBg/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D2310E107;
 Tue, 27 May 2025 10:15:32 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-31149f0393dso1543232a91.1; 
 Tue, 27 May 2025 03:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748340931; x=1748945731; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lpQsh15suo6L+VuJB8jrpchAgTw+gvlxVYwBK5tV8J4=;
 b=c232LBg/uQl6apLzu4SuNH6+qTkZrfzEjXM/j1W1shOa4SmiLsOLG2aTBDOp+P7SyY
 glRs4wpz1GnKxxOc4UXrhjQaRTNoQwm3eefq3PxMX2Fc27L02fesB4edS2ExGgR2P9ui
 S1iK7hMo0YRjxUARtAT7OqQqpuqYB8jH3VDaIq9Iw/vIDXC8RJts7belw8e+AuReMolf
 xowG83p+lBJhuLdE7hUpj36G/fFpZS2AWVtY0IGdXdUCXEOvUVPUlfrVRUYBKRNlccdQ
 +K4eTZpu5akgdJOv9miFtJuf6TpNZeoRr+x+rp3AIYDLdqCI5vgCO2B1X+gUgPnxNk0K
 TE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748340931; x=1748945731;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lpQsh15suo6L+VuJB8jrpchAgTw+gvlxVYwBK5tV8J4=;
 b=MSLOzglSfn0TETKR2ykzvnhiZGDkCipdMwPJzjdZ8LJaFMMNzLq0Ml6uJ9dZhKjHUV
 7c+cMDif8wnw06vLU02aqDp/LSC8hF/DUkD9y+Lv5ut1d6WOz4blLDRo7kEIFswEMTtc
 vD81UleVywO7OtfHC4agmluRF5f4hWMzxZ96e1npd7KLGlrb5fyiEbj/OrM4ROYGXBg0
 1FxSpYQjQnK3sUQCYpeyWCf4wXVTo4uE0ryZHQNuwwwWnA+IH6gFKxWEecvRiaUpJvmo
 bkHqe58M5QEcIaHR7m9Aa8zONRS3/MTeHv/Z0g54YW5UzTyp1odONXhk1Iii/V5pDZcP
 9vfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7URxk/uEzX+pwAHRmCnpxKAl2Io5R209JIIATHUqcCSoYUMBPNNDsgvTnh3YC7iWyH4aoQNtF@lists.freedesktop.org,
 AJvYcCXKtjUrA3c3ft3maOuEZ3b+hM4RzF8kULfvvWQvVY/DELsmBA2FemJUqzrV97lCmBx87TTb0YHPXNel@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyO9Err2L+guyDCiMnUNSpNVjzAIvR1wOSwPXuF7KN+HZ6FbCrj
 qPi4fu/MqTpNKAwEEl3mkbfFKHtKDb8Z1Vf8dh++vw2+1klv4KrDSJ8TK26dJglm+wOLJE7PUAB
 JRmdUjcSwiC/AX6GVPnZ0ue5TDH8CgZw=
X-Gm-Gg: ASbGnct7dAeTLQPr6NdWKupGSrVctQwAUi8YY71F/6834wgJGTAiArq/GFFoRwbA4mz
 fvAJzF8kSWrQvngAam6H+sWiHZyr8lsXYsq1VswO6fkNajEeBdNuOTudYBJyoo179YBXSURHwd4
 Nqh927gBosUhZ/R7ZtIgwrKzA9cgYxGq8EzCWBNoiABcRQm0A1Buw6wSz48kzU+g/RpdGlqMwnp
 Q==
X-Google-Smtp-Source: AGHT+IEuEg9cgaIC4FO6vszBSjTl9c5OmaynlX/dU3sF8g8aALFDpUtLS+naIoZhi5139cN7d2dH8FQaiwkOt2hE1pM=
X-Received: by 2002:a17:90a:c2c3:b0:310:8db0:1663 with SMTP id
 98e67ed59e1d1-311100d865cmr19696229a91.17.1748340930843; Tue, 27 May 2025
 03:15:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250521135851.11110-1-leonardodasigomes@gmail.com>
 <f4fa1065-ff9e-4721-9f5f-55a87faeb6c2@amd.com>
In-Reply-To: <f4fa1065-ff9e-4721-9f5f-55a87faeb6c2@amd.com>
From: Leonardo Gomes <leonardodasigomes@gmail.com>
Date: Tue, 27 May 2025 07:15:20 -0300
X-Gm-Features: AX0GCFulJPqelxHX9oSz6lULC6oFN3TWN-OSzrk9xdgYojRkVVtjjDq-xnHGQtA
Message-ID: <CABtyycS2O5S_yr5DOKchmZOdC9m7h63ob1xjHQAT_bj18-NUOA@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/amd/display: Adjust prefix of dcn31_apg
 construct function name
To: Alex Hung <alex.hung@amd.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com, 
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch, 
 derick.william.moraes@gmail.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000211aab06361b5871"
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

--000000000000211aab06361b5871
Content-Type: text/plain; charset="UTF-8"

Hi Alex,

Thanks for your answer!

On Mon, 26 May 2025 at 23:50 Alex Hung <alex.hung@amd.com> wrote:

> Hi Leonardo,
>
> Thank you for this patch, but unfortunately some unit test suites depend
> on the names.
>
> On 5/21/25 07:58, Leonardo Gomes wrote:
> > From: Leonardo da Silva Gomes <leonardodasigomes@gmail.com>
> >
> > Adjust the dcn31_apg construct function name from
> > 'apg31_construct' to 'dcn31_apg_construct'.
> > This helps the ftrace to detect the file by the function name.
> >
> > Signed-off-by: Leonardo da Silva Gomes <leonardodasigomes@gmail.com>
> > Co-developed-by: Derick Frias <derick.william.moraes@gmail.com>
> > Signed-off-by: Derick Frias <derick.william.moraes@gmail.com>
> > ---
> >   drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c                | 2 +-
> >   drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.h                | 2 +-
> >   drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c  | 2 +-
> >   .../gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c    | 2 +-
> >   .../gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c    | 2 +-
> >   .../gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c    | 2 +-
> >   drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c  | 2 +-
> >   .../gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c    | 2 +-
> >   drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c  | 2 +-
> >   .../gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c    | 2 +-
> >   drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c  | 2 +-
> >   .../gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c    | 2 +-
> >   12 files changed, 12 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c
> b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c
> > index 05aac3e444b4..d1ccc9a34b2e 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c
> > @@ -101,7 +101,7 @@ static struct apg_funcs dcn31_apg_funcs = {
> >       .disable_apg                    = apg31_disable,
> >   };
> >
> > -void apg31_construct(struct dcn31_apg *apg31,
> > +void dcn31_apg_construct(struct dcn31_apg *apg31,
> >       struct dc_context *ctx,
> >       uint32_t inst,
> >       const struct dcn31_apg_registers *apg_regs,
> > diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.h
> b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.h
> > index 1b81f6773c53..54c6b62195c2 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.h
> > +++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.h
> > @@ -100,7 +100,7 @@ struct dcn31_apg {
> >       const struct dcn31_apg_mask *apg_mask;
> >   };
> >
> > -void apg31_construct(struct dcn31_apg *apg3,
> > +void dcn31_apg_construct(struct dcn31_apg *apg3,
> >       struct dc_context *ctx,
> >       uint32_t inst,
> >       const struct dcn31_apg_registers *apg_regs,
> > diff --git
> a/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
> b/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
> > index dddddbfef85f..b3553ae26d7c 100644
> > --- a/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
> > +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
> > @@ -1207,7 +1207,7 @@ static struct apg *dcn31_apg_create(
> >       if (!apg31)
> >               return NULL;
> >
> > -     apg31_construct(apg31, ctx, inst,
> > +     dcn31_apg_construct(apg31, ctx, inst,
> >                       &apg_regs[inst],
> >                       &apg_shift,
> >                       &apg_mask);
> > diff --git
> a/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c
> b/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c
> > index 26becc4cb804..be55a3c36a78 100644
> > --- a/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c
> > +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c
> > @@ -1263,7 +1263,7 @@ static struct apg *dcn31_apg_create(
> >       if (!apg31)
> >               return NULL;
> >
> > -     apg31_construct(apg31, ctx, inst,
> > +     dcn31_apg_construct(apg31, ctx, inst,
> >                       &apg_regs[inst],
> >                       &apg_shift,
> >                       &apg_mask);
> > diff --git
> a/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c
> b/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c
> > index 6c2bb3f63be1..b9847b4bb0f3 100644
> > --- a/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c
> > +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c
> > @@ -1205,7 +1205,7 @@ static struct apg *dcn31_apg_create(
> >       if (!apg31)
> >               return NULL;
> >
> > -     apg31_construct(apg31, ctx, inst,
> > +     dcn31_apg_construct(apg31, ctx, inst,
> >                       &apg_regs[inst],
> >                       &apg_shift,
> >                       &apg_mask);
> > diff --git
> a/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c
> b/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c
> > index 568094827212..b6cf2a296ab4 100644
> > --- a/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c
> > +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c
> > @@ -1200,7 +1200,7 @@ static struct apg *dcn31_apg_create(
> >       if (!apg31)
> >               return NULL;
> >
> > -     apg31_construct(apg31, ctx, inst,
> > +     dcn31_apg_construct(apg31, ctx, inst,
> >                       &apg_regs[inst],
> >                       &apg_shift,
> >                       &apg_mask);
> > diff --git
> a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
> b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
> > index 2a59cc61ed8c..66fef6f6000e 100644
> > --- a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
> > +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
> > @@ -1187,7 +1187,7 @@ static struct apg *dcn31_apg_create(
> >       apg_regs_init(2),
> >       apg_regs_init(3);
> >
> > -     apg31_construct(apg31, ctx, inst,
> > +     dcn31_apg_construct(apg31, ctx, inst,
> >                       &apg_regs[inst],
> >                       &apg_shift,
> >                       &apg_mask);
> > diff --git
> a/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
> b/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
> > index 38d76434683e..9be23da216d0 100644
> > --- a/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
> > +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
> > @@ -1170,7 +1170,7 @@ static struct apg *dcn321_apg_create(
> >       apg_regs_init(2),
> >       apg_regs_init(3);
> >
> > -     apg31_construct(apg31, ctx, inst,
> > +     dcn31_apg_construct(apg31, ctx, inst,
> >                       &apg_regs[inst],
> >                       &apg_shift,
> >                       &apg_mask);
> > diff --git
> a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
> b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
> > index ffd2b816cd02..27affafb14f1 100644
> > --- a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
> > +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
> > @@ -1252,7 +1252,7 @@ static struct apg *dcn31_apg_create(
> >       apg_regs_init(2),
> >       apg_regs_init(3);
> >
> > -     apg31_construct(apg31, ctx, inst,
> > +     dcn31_apg_construct(apg31, ctx, inst,
> >                       &apg_regs[inst],
> >                       &apg_shift,
> >                       &apg_mask);
> > diff --git
> a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
> b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
> > index 98f5bc1b929e..d5341b0d59f3 100644
> > --- a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
> > +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
> > @@ -1232,7 +1232,7 @@ static struct apg *dcn31_apg_create(
> >       apg_regs_init(2),
> >       apg_regs_init(3);
> >
> > -     apg31_construct(apg31, ctx, inst,
> > +     dcn31_apg_construct(apg31, ctx, inst,
> >                       &apg_regs[inst],
> >                       &apg_shift,
> >                       &apg_mask);
> > diff --git
> a/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c
> b/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c
> > index b6468573dc33..6fb2261c554d 100644
> > --- a/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c
> > +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c
> > @@ -1233,7 +1233,7 @@ static struct apg *dcn31_apg_create(
> >       apg_regs_init(2),
> >       apg_regs_init(3);
> >
> > -     apg31_construct(apg31, ctx, inst,
> > +     dcn31_apg_construct(apg31, ctx, inst,
> >                       &apg_regs[inst],
> >                       &apg_shift,
> >                       &apg_mask);
> > diff --git
> a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
> b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
> > index 7436dfbdf927..ef4d758bfb5a 100644
> > --- a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
> > +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
> > @@ -1162,7 +1162,7 @@ static struct apg *dcn401_apg_create(
> >       apg_regs_init(2),
> >       apg_regs_init(3);
> >
> > -     apg31_construct(apg31, ctx, inst,
> > +     dcn31_apg_construct(apg31, ctx, inst,
> >                       &apg_regs[inst],
> >                       &apg_shift,
> >                       &apg_mask);
>
>

--000000000000211aab06361b5871
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Alex,</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Thanks for your answer!</div><div><br><div class=3D"gmail_quote gmail_qu=
ote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 26 May 2025 at=
 23:50 Alex Hung &lt;<a href=3D"mailto:alex.hung@amd.com">alex.hung@amd.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Leonardo,<br>
<br>
Thank you for this patch, but unfortunately some unit test suites depend <b=
r>
on the names.<br>
<br>
On 5/21/25 07:58, Leonardo Gomes wrote:<br>
&gt; From: Leonardo da Silva Gomes &lt;<a href=3D"mailto:leonardodasigomes@=
gmail.com" target=3D"_blank">leonardodasigomes@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Adjust the dcn31_apg construct function name from<br>
&gt; &#39;apg31_construct&#39; to &#39;dcn31_apg_construct&#39;.<br>
&gt; This helps the ftrace to detect the file by the function name.<br>
&gt; <br>
&gt; Signed-off-by: Leonardo da Silva Gomes &lt;<a href=3D"mailto:leonardod=
asigomes@gmail.com" target=3D"_blank">leonardodasigomes@gmail.com</a>&gt;<b=
r>
&gt; Co-developed-by: Derick Frias &lt;<a href=3D"mailto:derick.william.mor=
aes@gmail.com" target=3D"_blank">derick.william.moraes@gmail.com</a>&gt;<br=
>
&gt; Signed-off-by: Derick Frias &lt;<a href=3D"mailto:derick.william.morae=
s@gmail.com" target=3D"_blank">derick.william.moraes@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.h=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resour=
ce.c=C2=A0 | 2 +-<br>
&gt;=C2=A0 =C2=A0.../gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource=
.c=C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 =C2=A0.../gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource=
.c=C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 =C2=A0.../gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource=
.c=C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resour=
ce.c=C2=A0 | 2 +-<br>
&gt;=C2=A0 =C2=A0.../gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource=
.c=C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resour=
ce.c=C2=A0 | 2 +-<br>
&gt;=C2=A0 =C2=A0.../gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource=
.c=C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resour=
ce.c=C2=A0 | 2 +-<br>
&gt;=C2=A0 =C2=A0.../gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource=
.c=C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 =C2=A012 files changed, 12 insertions(+), 12 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c b/driver=
s/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c<br>
&gt; index 05aac3e444b4..d1ccc9a34b2e 100644<br>
&gt; --- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c<br>
&gt; +++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c<br>
&gt; @@ -101,7 +101,7 @@ static struct apg_funcs dcn31_apg_funcs =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.disable_apg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D apg31_disable,<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -void apg31_construct(struct dcn31_apg *apg31,<br>
&gt; +void dcn31_apg_construct(struct dcn31_apg *apg31,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dc_context *ctx,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t inst,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct dcn31_apg_registers *apg_regs,<=
br>
&gt; diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.h b/driver=
s/gpu/drm/amd/display/dc/dcn31/dcn31_apg.h<br>
&gt; index 1b81f6773c53..54c6b62195c2 100644<br>
&gt; --- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.h<br>
&gt; +++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.h<br>
&gt; @@ -100,7 +100,7 @@ struct dcn31_apg {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct dcn31_apg_mask *apg_mask;<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -void apg31_construct(struct dcn31_apg *apg3,<br>
&gt; +void dcn31_apg_construct(struct dcn31_apg *apg3,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dc_context *ctx,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t inst,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct dcn31_apg_registers *apg_regs,<=
br>
&gt; diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resou=
rce.c b/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c<br>
&gt; index dddddbfef85f..b3553ae26d7c 100644<br>
&gt; --- a/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c<b=
r>
&gt; +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c<b=
r>
&gt; @@ -1207,7 +1207,7 @@ static struct apg *dcn31_apg_create(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!apg31)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0apg31_construct(apg31, ctx, inst,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dcn31_apg_construct(apg31, ctx, inst,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&amp;apg_regs[inst],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&amp;apg_shift,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&amp;apg_mask);<br>
&gt; diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_res=
ource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c<=
br>
&gt; index 26becc4cb804..be55a3c36a78 100644<br>
&gt; --- a/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c=
<br>
&gt; +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c=
<br>
&gt; @@ -1263,7 +1263,7 @@ static struct apg *dcn31_apg_create(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!apg31)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0apg31_construct(apg31, ctx, inst,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dcn31_apg_construct(apg31, ctx, inst,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&amp;apg_regs[inst],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&amp;apg_shift,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&amp;apg_mask);<br>
&gt; diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_res=
ource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c<=
br>
&gt; index 6c2bb3f63be1..b9847b4bb0f3 100644<br>
&gt; --- a/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c=
<br>
&gt; +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c=
<br>
&gt; @@ -1205,7 +1205,7 @@ static struct apg *dcn31_apg_create(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!apg31)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0apg31_construct(apg31, ctx, inst,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dcn31_apg_construct(apg31, ctx, inst,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&amp;apg_regs[inst],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&amp;apg_shift,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&amp;apg_mask);<br>
&gt; diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_res=
ource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c<=
br>
&gt; index 568094827212..b6cf2a296ab4 100644<br>
&gt; --- a/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c=
<br>
&gt; +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c=
<br>
&gt; @@ -1200,7 +1200,7 @@ static struct apg *dcn31_apg_create(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!apg31)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0apg31_construct(apg31, ctx, inst,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dcn31_apg_construct(apg31, ctx, inst,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&amp;apg_regs[inst],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&amp;apg_shift,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&amp;apg_mask);<br>
&gt; diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resou=
rce.c b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c<br>
&gt; index 2a59cc61ed8c..66fef6f6000e 100644<br>
&gt; --- a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c<b=
r>
&gt; +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c<b=
r>
&gt; @@ -1187,7 +1187,7 @@ static struct apg *dcn31_apg_create(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0apg_regs_init(2),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0apg_regs_init(3);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0apg31_construct(apg31, ctx, inst,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dcn31_apg_construct(apg31, ctx, inst,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&amp;apg_regs[inst],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&amp;apg_shift,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&amp;apg_mask);<br>
&gt; diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_res=
ource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c<=
br>
&gt; index 38d76434683e..9be23da216d0 100644<br>
&gt; --- a/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c=
<br>
&gt; +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c=
<br>
&gt; @@ -1170,7 +1170,7 @@ static struct apg *dcn321_apg_create(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0apg_regs_init(2),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0apg_regs_init(3);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0apg31_construct(apg31, ctx, inst,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dcn31_apg_construct(apg31, ctx, inst,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&amp;apg_regs[inst],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&amp;apg_shift,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&amp;apg_mask);<br>
&gt; diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resou=
rce.c b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c<br>
&gt; index ffd2b816cd02..27affafb14f1 100644<br>
&gt; --- a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c<b=
r>
&gt; +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c<b=
r>
&gt; @@ -1252,7 +1252,7 @@ static struct apg *dcn31_apg_create(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0apg_regs_init(2),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0apg_regs_init(3);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0apg31_construct(apg31, ctx, inst,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dcn31_apg_construct(apg31, ctx, inst,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&amp;apg_regs[inst],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&amp;apg_shift,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&amp;apg_mask);<br>
&gt; diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_res=
ource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c<=
br>
&gt; index 98f5bc1b929e..d5341b0d59f3 100644<br>
&gt; --- a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c=
<br>
&gt; +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c=
<br>
&gt; @@ -1232,7 +1232,7 @@ static struct apg *dcn31_apg_create(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0apg_regs_init(2),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0apg_regs_init(3);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0apg31_construct(apg31, ctx, inst,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dcn31_apg_construct(apg31, ctx, inst,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&amp;apg_regs[inst],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&amp;apg_shift,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&amp;apg_mask);<br>
&gt; diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resou=
rce.c b/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c<br>
&gt; index b6468573dc33..6fb2261c554d 100644<br>
&gt; --- a/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c<b=
r>
&gt; +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c<b=
r>
&gt; @@ -1233,7 +1233,7 @@ static struct apg *dcn31_apg_create(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0apg_regs_init(2),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0apg_regs_init(3);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0apg31_construct(apg31, ctx, inst,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dcn31_apg_construct(apg31, ctx, inst,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&amp;apg_regs[inst],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&amp;apg_shift,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&amp;apg_mask);<br>
&gt; diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_res=
ource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c<=
br>
&gt; index 7436dfbdf927..ef4d758bfb5a 100644<br>
&gt; --- a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c=
<br>
&gt; +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c=
<br>
&gt; @@ -1162,7 +1162,7 @@ static struct apg *dcn401_apg_create(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0apg_regs_init(2),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0apg_regs_init(3);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0apg31_construct(apg31, ctx, inst,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dcn31_apg_construct(apg31, ctx, inst,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&amp;apg_regs[inst],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&amp;apg_shift,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&amp;apg_mask);<br>
<br>
</blockquote></div></div>

--000000000000211aab06361b5871--

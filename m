Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D774D9E6781
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 07:57:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82B910E3F5;
	Fri,  6 Dec 2024 06:57:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="KagG91dZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 750D110E3F5
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 06:57:54 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-3a7bc2d7608so64065ab.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 22:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1733468273; x=1734073073;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dXMn6I7hWYWL/P+acu3qGdtYaDPspLPyZia6cGFakoA=;
 b=KagG91dZXjULQ+yNgguAS5v7wfxd7+U5kvSe5IT43K8rUKPCPgqMMJMJcmUd8buBcH
 YrjrPaibhcEjmVaNKZDVHg3rbwpAKRxspNwAGr9Js3WC2CUi4/quj1BG/01XxIye5WMr
 mmYd14EHaR9/K0dddOivly19+zODEGitb4NaiVLA33vzeleyTtzs5MNNkvvAkAhM0Bwo
 qNggqaFQT2rAA3nFBkAe2djVEhkt0B+sxwktHNRQBSikFuTDhtlmZR0ipnqCol+spOW5
 imTvdZMVvK+0axVsNeCkH187c0vmz4JyOTpTifwoI1pmLX040iCtaPBdTWVM7mxQsvnp
 /5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733468273; x=1734073073;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dXMn6I7hWYWL/P+acu3qGdtYaDPspLPyZia6cGFakoA=;
 b=ZQ5v3V5OQ09NaBp02B/oHpQmfjiDUjiayMesQadJvr4kodhO/xho0uUxs8wrktR2sA
 UGQUlY/qCmW2w0JNALKU5t1cp337Vygt3ww0qu/OT4piN6k6g9Gi2FXPpuLON1Yt6GSE
 rF45EzWBpP4Q4j7TsYjBegI6VELJQhr9F+9ApRVQ38qe2dZApwZOC3ZXB0Wtr1AwwFQS
 rdZY+a+nrwJfjTw9md7Qz08Cb7ghjyXP2g05I3pWp54+cA0CT0rpbDrqbD67/4N1N8Yi
 42fhQFACuJkfdEmZ8GNdbVMaqpHoy6zYUbGwqISb0KgXMzRa6/0tJffsp+LxjbZXEZsH
 zWLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhpdMeQyxWELbpXCtqMo3SluZNMYPuAWQ7WYvBk0KJUBrJ0/6xpY+k1qtjLEMovSyIB2TcVwrC6cI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSDvD9etWsIvM8cwIz6eCU2uHVvX1ycttctGgODumYJHEyRMNU
 s90uGBoNfwxIZvFRq8DlBG8LbH0U/s0StuIsYcQvuYeZSJoG/8iZE8L5CHEMHebn0EYxFyTtFse
 ttqQINnpN++N53JWjGwtFE8ACgOALbusPs2+M
X-Gm-Gg: ASbGncsDec3gANdQ4/SBgre4TX6BLWu1726E/RHYsQUS0Egkh7NLSnSuokInWqgO8/S
 OYToFE3+k+PzH1e0qC90j5ujwdUhtLLzK
X-Google-Smtp-Source: AGHT+IEBWqfpt2e3wk/xban2B7L/9zraBXwb7yATu2Omq+k/NWHoAq5u+yXwLqSrM+NLSj6sWl4Oz9m1Zct4nWMyugU=
X-Received: by 2002:a05:6e02:3a0d:b0:3a7:a5d2:c641 with SMTP id
 e9e14a558f8ab-3a812c5bd0bmr2398645ab.14.1733468273429; Thu, 05 Dec 2024
 22:57:53 -0800 (PST)
MIME-Version: 1.0
References: <20241101191156.1272730-1-irogers@google.com>
 <20241101191156.1272730-2-irogers@google.com>
 <20241102101720.cwp7lcidqbzkrub6@illithid>
In-Reply-To: <20241102101720.cwp7lcidqbzkrub6@illithid>
From: Ian Rogers <irogers@google.com>
Date: Thu, 5 Dec 2024 22:57:42 -0800
Message-ID: <CAP-5=fX5Gw71CuQgqJuuWkFBUAyz2+SObWvGnEHpz1BgHh7tsg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] proc_pid_fdinfo.5: Make pid clearer in the name
 and 1st paragraph
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Alejandro Colomar <alx@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-man@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sat, Nov 2, 2024 at 3:17=E2=80=AFAM G. Branden Robinson
<g.branden.robinson@gmail.com> wrote:
>
> Hi Ian,
>
> At 2024-11-01T12:11:54-0700, Ian Rogers wrote:
> > diff --git a/man/man5/proc_pid_fdinfo.5 b/man/man5/proc_pid_fdinfo.5
> > index 87e6dbe56..935b54b4c 100644
> > --- a/man/man5/proc_pid_fdinfo.5
> > +++ b/man/man5/proc_pid_fdinfo.5
> [...]
> > -this is a subdirectory containing one entry for each file which the
> > -process has open, named by its file descriptor.
> > +this subdirectory contains one entry for each file that process
> > +.IR pid
> > +has open, named by its file descriptor.
>
> `IR` is better used with two or more arguments.
>
> As of groff 1.23 (July 2023), the man(7) package will warn you about
> problem like this if you ask it to.
>
> $ nroff -man -rCHECKSTYLE=3D1 /tmp/proc_pid_fdinfo_mini.5
> an.tmac:/tmp/proc_pid_fdinfo_mini.5:7: style: .IR expects at least 2 argu=
ments, got 1
> proc_pid_fdinfo_mini(5)       File Formats Manual      proc_pid_fdinfo_mi=
ni(5)
>
> Name
>        /proc/pid/fdinfo - information about file descriptors
>
> Description
>        Text text text text.  One pid to rule them all and in the darkness=
 bind
>        them.
>
> example                           2024=E2=80=9011=E2=80=9002           pr=
oc_pid_fdinfo_mini(5)
>
> I think Alex has a make(1) target that assists with running groff this
> way.
>
> groff_man(7):
>    Font style macros
>      ... It is often necessary to set
>      text in different styles without intervening space.  The macros
>      .BI, .BR, .IB, .IR, .RB, and .RI, where =E2=80=9CB=E2=80=9D, =E2=80=
=9CI=E2=80=9D, and =E2=80=9CR=E2=80=9D
>      indicate bold, italic, and roman, respectively, set their odd=E2=80=
=90
>      and even=E2=80=90numbered arguments in alternating styles, with no s=
pace
>      separating them.
>
> One reason to pay close attention to this point is that
>
> .IR foo bar
>
> formats as "foobar" (with "foo" in italics), whereas
>
> .I foo bar
>
> formats as "foo bar", with both words in italics.
>
> The different handling of the space is a common manifestation of error.

Thanks Branden, I think I'm taking away use ".I pid" rather than ".IR
pid" as the pattern of using ".I <name>" is used already in the file
and groff/nroff weird stuff, who knows. I'll change this for v5.

Ian

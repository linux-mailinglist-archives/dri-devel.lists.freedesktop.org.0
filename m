Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D00913838
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 08:01:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D2910E08F;
	Sun, 23 Jun 2024 06:01:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lav5JD6d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE4C010E08F
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 06:01:06 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-79baa4e8531so326304085a.2
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 23:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719122465; x=1719727265; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=639B1VhzkVRiQ3egX05fSRdoRLJZKUd3UI9/6wfJ8lw=;
 b=lav5JD6d04jxlIn0p3cWTbxYLY7JdT7/fsSOJDXZRZSfmIDoYSnR8Ue0zVSOWyDvzo
 HP3/OUpZ894qOgT/5oH9dsB2NloOpI3BBWCn7+h1AMHZ3a/MpdKib4AdvN9rRlHRVDHx
 i78aRWVtZE0WVXF2o88FjoC+QTOZnJR9CWgVjX0cn/CQtVibsXPLjuOWRBotsBQe3svq
 +owxmo4BtfoP1C6OZiP7EbQIHXc/cyaBkk2ngNGjk3jXe/BpxmbCSrrUpuYY3yYhxsV9
 g/FsmKHTUWDpLhwG5qA6xr8Thb97xwAOFjQRUqfm+R22V7ArKreV2nUNnyw5kdW9F8ea
 bHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719122465; x=1719727265;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=639B1VhzkVRiQ3egX05fSRdoRLJZKUd3UI9/6wfJ8lw=;
 b=wz/Pq4vZ+leHs8N8pDveKXz8jp65yywsu+ZxfE7an5BZV7GgKrwWzrdhJQkvxlu6rY
 iDr6HxLvq5w/V3TVGwFOSTBTeKbHFNUQJcxUxBvH6bYTA39CJbctNIjNqNEaEtx3qkbQ
 PLKd3wi9dkdAVUa7Rg0O/Jc41Hqb72soF31X6z6v6QviDCqmL5gLwvizX78XpBxUZcag
 mFVICwI10shDayVrzU+6stxW7ootUdn+KwG/TitHHr4vf4Xy05ROCJV7ffKkWB0xGw4i
 NTmmcw7gBgt8GFt7AARv0+kR+vB0sIgTrPqJdu+WZOY5YxUoo1rw5sXdf0bpsyXRlqSZ
 pyrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkb4jnoCxV5e/AXkrUnZMJfN1Jz5VlfrA3dgEaLLqxHo7fcdN3OzyXStodGDSgka0ifQRwL5pkGyUfhHb8jk5n+YDFH1Z55R2HYZllCdHT
X-Gm-Message-State: AOJu0YxXOO3IuNCGr7WpGebMllq9hwcKcIG6TRkJ5MobNoCWSZuUewHr
 r/tnJsK937iG3mAZgzi4f9d5NWVKIqrwqRgBScjmXsPq++YFTKo/DGm9IKAFmGs9x1B0T0gqrIr
 UpDVRwb1wQonum8r0S7Vbjvrsrec=
X-Google-Smtp-Source: AGHT+IHcXR+ehU+k0C/NmM/DLF8W1FSfgc1FOoi+9SruG7tbvTjl8bMu8+dVhBmSjLDe3SkqoqwwTUGvFNLK0f3vidI=
X-Received: by 2002:ad4:5228:0:b0:6b4:f644:9d87 with SMTP id
 6a1803df08f44-6b53debf738mr17899726d6.21.1719122465581; Sat, 22 Jun 2024
 23:01:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240621022959.9124-1-laoar.shao@gmail.com>
 <20240621022959.9124-7-laoar.shao@gmail.com>
 <ZnWGsw4d9aq5mY0S@casper.infradead.org>
 <CALOAHbC0ta-g2pcWqsL6sVVigthedN04y8_tH-cS9TuDGEBsEg@mail.gmail.com>
 <ZneSWDgijj3r0MMC@casper.infradead.org>
In-Reply-To: <ZneSWDgijj3r0MMC@casper.infradead.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Sun, 23 Jun 2024 14:00:29 +0800
Message-ID: <CALOAHbDvyBn=yUABT4G6Egne48cQqHDM7bvuBeKFmbSA5fhg4A@mail.gmail.com>
Subject: Re: [PATCH v3 06/11] mm/util: Deduplicate code in {kstrdup, kstrndup,
 kmemdup_nul}
To: Matthew Wilcox <willy@infradead.org>
Cc: torvalds@linux-foundation.org, ebiederm@xmission.com, 
 alexei.starovoitov@gmail.com, rostedt@goodmis.org, catalin.marinas@arm.com, 
 akpm@linux-foundation.org, penguin-kernel@i-love.sakura.ne.jp, 
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org, 
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
 bpf@vger.kernel.org, netdev@vger.kernel.org, dri-devel@lists.freedesktop.org
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

On Sun, Jun 23, 2024 at 11:11=E2=80=AFAM Matthew Wilcox <willy@infradead.or=
g> wrote:
>
> On Sun, Jun 23, 2024 at 10:29:30AM +0800, Yafang Shao wrote:
> > On Fri, Jun 21, 2024 at 9:57=E2=80=AFPM Matthew Wilcox <willy@infradead=
.org> wrote:
> > >
> > > On Fri, Jun 21, 2024 at 10:29:54AM +0800, Yafang Shao wrote:
> > > > +++ b/mm/internal.h
> > >
> > > Why are you putting __kstrndup in a header file when it's only used
> > > in util.c?
> >
> > I want to make it always inlined. However, it is not recommended to
> > define an inline function in a .c file, right ?
>
> I'm not aware of any such recommendation.  Better than putting it in
> a .h file that everybody has to look at but nobody uses.

Understood.
Will change it.

--=20
Regards
Yafang

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D49B09084A3
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 09:25:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C32EF10EC4C;
	Fri, 14 Jun 2024 07:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mqtAUwP5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F5E10EBB0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 02:34:27 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-dfab5f7e749so1828542276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 19:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718332467; x=1718937267; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WGt7k6r3FpcN6H9iB54r2UkgCkDa1oqmP1AFpUTryM4=;
 b=mqtAUwP5CxGV3UzhbC8gZhotfN+8ctgS8dRa73mtKc5JST714uKdMEouIuTTvtO0Yg
 eLap6B/3LVR7WCBIlPwDNCOft6gZQkQAzKHL7Ls96LpUE1RzIbyFuWlgXLL3nLxSWYH+
 i+wVsgW8LpkXwsqzO+y0ldXnM+jwH8Wen7tSJRz4sZau/qYLDTjWbRXXNYR/ESgJUCaN
 qPi+M2mLkLQCWyhglw0v1T/Qbapyz2P/o5P8nMenW0tEj432Jj2Hi9b09SLpH4Qio/Gr
 kSxNJRp99iZLwBw2Gq8epk0YfvJqDMAA+sT8tzl4BgzkrrB4k8M5hWotnwllfA+x5Dom
 /9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718332467; x=1718937267;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WGt7k6r3FpcN6H9iB54r2UkgCkDa1oqmP1AFpUTryM4=;
 b=L6pwifJY92dfLtaT8f/mizgEk0CyciTt/dKNuWlAZ8nE8H8W3a1NisgntAyd9keBjh
 yh2A4PimjJ3cWWXYTH9CHOmc08fnv6LUog6dNhmxKP7tS95JLTFGmlZVTK4Sh/p3sKH2
 9jLICqKRxKlykUfX0O7nehgPBVLuAIAFPh3xdj+WsdddEXeP0sKG7zOL1G+1OksUBPjM
 VccebxHZv6sB7qwyi+l5Bi6bKoDqqar1Y6B7Vc0g1oJHHAnyeZUFfTZT2/xfOwFpWjQv
 jhR0bjULGElajdYcmge5mF9jGM6Bbt5F9ypTZ9GRl18cWdHLQKUYtLmvyQS0aDF3e2Uu
 MxcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvloxYmfK44LQZO26GfJrbN5uXCbHs0Wu4RZoG4J2YEcqlYWeFYZy0pVJBAb5xmVWXD188BawhsYZNUTZeVSbb1mIRlVrCJjMwV2HLrQbq
X-Gm-Message-State: AOJu0YwuWp3ZGOlnfTUuzWJmj7meY4SaY2RXba/zw9pkfdfV5HpPiG4x
 dvc+UZUyrbLcM9j95jJPoiqIjA7hLo55b9x3nlkJiBhNoHRVRYl/bOYqtzdCQICggXCjzwkt9jF
 k9A4smPcGvy3JSrK3i+D2gy+nGho=
X-Google-Smtp-Source: AGHT+IF7Sz7NY6o3j4C4IPnMtJt7woKj9cH4kVPcujOZcn7xP0eRFnMx3IdWG7c4BrBfrjM411w0aCOam3Y1x/7rGQg=
X-Received: by 2002:a25:acdc:0:b0:df4:45c1:f465 with SMTP id
 3f1490d57ef6-dff154e5be2mr1023094276.62.1718332466522; Thu, 13 Jun 2024
 19:34:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240613023044.45873-1-laoar.shao@gmail.com>
 <20240613023044.45873-6-laoar.shao@gmail.com>
 <20240613141435.fad09579c934dbb79a3086cc@linux-foundation.org>
In-Reply-To: <20240613141435.fad09579c934dbb79a3086cc@linux-foundation.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Fri, 14 Jun 2024 10:33:48 +0800
Message-ID: <CALOAHbBEtViUN3L=741jNF4oFSqvxej-p0vcd-0awShMtmCQvg@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] mm/util: Fix possible race condition in kstrdup()
To: Andrew Morton <akpm@linux-foundation.org>
Cc: torvalds@linux-foundation.org, ebiederm@xmission.com, 
 alexei.starovoitov@gmail.com, rostedt@goodmis.org, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 audit@vger.kernel.org, linux-security-module@vger.kernel.org, 
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 14 Jun 2024 07:24:50 +0000
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

On Fri, Jun 14, 2024 at 5:14=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Thu, 13 Jun 2024 10:30:39 +0800 Yafang Shao <laoar.shao@gmail.com> wro=
te:
>
> > In kstrdup(), it is critical to ensure that the dest string is always
> > NUL-terminated. However, potential race condidtion can occur between a
> > writer and a reader.
> >
> > Consider the following scenario involving task->comm:
> >
> >     reader                    writer
> >
> >   len =3D strlen(s) + 1;
> >                              strlcpy(tsk->comm, buf, sizeof(tsk->comm))=
;
> >   memcpy(buf, s, len);
> >
> > In this case, there is a race condition between the reader and the
> > writer. The reader calculate the length of the string `s` based on the
> > old value of task->comm. However, during the memcpy(), the string `s`
> > might be updated by the writer to a new value of task->comm.
> >
> > If the new task->comm is larger than the old one, the `buf` might not b=
e
> > NUL-terminated. This can lead to undefined behavior and potential
> > security vulnerabilities.
> >
> > Let's fix it by explicitly adding a NUL-terminator.
>
> The concept sounds a little strange.  If some code takes a copy of a
> string while some other code is altering it, yes, the result will be a
> mess.  This is why get_task_comm() exists, and why it uses locking.
>
> I get that "your copy is a mess" is less serious than "your string
> isn't null-terminated" but still.  Whichever outcome we get, the
> calling code is buggy and should be fixed.
>
> Are there any other problematic scenarios we're defending against here?
>
> >
> > --- a/mm/util.c
> > +++ b/mm/util.c
> > @@ -60,8 +60,10 @@ char *kstrdup(const char *s, gfp_t gfp)
> >
> >       len =3D strlen(s) + 1;
> >       buf =3D kmalloc_track_caller(len, gfp);
> > -     if (buf)
> > +     if (buf) {
> >               memcpy(buf, s, len);
> > +             buf[len - 1] =3D '\0';
> > +     }
> >       return buf;
> >  }
>
> Now I'll start receiving patches to remove this again.  Let's have a
> code comment please.

I will add a comment for it.

>
> And kstrdup() is now looking awfully similar to kstrndup().  Perhaps
> there's a way to reduce duplication?

Yes, I believe we can add a common helper for them :

  static char *__kstrndup(const char *s, size_t max, gfp_t gfp)

--=20
Regards
Yafang

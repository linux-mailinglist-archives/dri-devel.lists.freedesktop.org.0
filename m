Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B65A69776D4
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 04:21:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F0F10E03E;
	Fri, 13 Sep 2024 02:20:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NYYVy8mR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D71010E03E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 02:20:54 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-6c34c02ff1cso9863756d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 19:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726194053; x=1726798853; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/YuGlKzxhtY5rBL2eIZIp8+LMnunU1KOYKGMKR0vy8Y=;
 b=NYYVy8mRNhL6x0/e10A2UZfO3EyPotc+dxGfo69o2+OSfV31kdSlcRmPliG4w+9bPM
 NkowRjfiPBTYhyHsxF/zCxond16QNeaN0FyBk4PyCnZOWw+St7byFTRVWwKPwut+BjHU
 DOnfUIpnT/1U8yDA9OsinUkZFycOn0q2Qgq3zUgwkD8ajPuBl/ZYCme2qGbefmvXGjkh
 w9ojqZDWcUtpVRF11AHTz+du9z33rq3a+ajja00vZxQnvzbOS8kaQAQI39ZTWODg626y
 yqIQ7RPsGVl1b+GLeP0xHUucgvHLuTWIfSD7+QFv9wYRd3bLKBJlvUsrTZKP36aQl0mm
 chUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726194053; x=1726798853;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/YuGlKzxhtY5rBL2eIZIp8+LMnunU1KOYKGMKR0vy8Y=;
 b=BKZrnHXxke2wF2RpIJmiOPdk9bcteSZOUWdXnspmIQB54LEKtsLe/+FO9Wi/BIBvMV
 jdNttPNxD3WwNd0eUs7BmhVDC0oXK7LwgwV+OkehHe9G21K2vPHQ1ZF3BPh+8iUm1fuu
 /b5hEesNjPhJzIt9djZIdqn6uknv3Q0Gq+AZMQFw5uOrU26SJZHByMe2uC8quEyq6lsC
 0sWb6tj1zxdam8aDHkvHezyzKddk1o+Qfw3zlGC9bcC49aXUR30weXVugOXC2eZ2loTn
 uAKsqfLWdheSeqb9fv7YuG9AR78UjFmlMQAKmE1p6LU8WrxF124W3O5+QIgQROqM18xG
 K34Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXK9lu9h4csiKiDElWBhgFAzgPjasq/kYM8Thk5Z9OLpN3/utMECQwSv6Ab9kbllX2/mJchguvmsw8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNkicrnSzowW+TJ4Yn4VI2ZH2ZkbxyMRvINGrASVTLgskD1zHT
 rupljchesGiArodIgohpWCt5T5ftTiaryYiBFfyLiowRpA4844qPGSbD/NlKdP0/RDvaEK3AAKp
 V8tIc2j3nmfMHnag3kekEdnoak1I=
X-Google-Smtp-Source: AGHT+IEALOyw7njQRSkttfTBxiECARy2DIo72UCyaA7S1zsv/zTsiW7a3znz7/TXgkua05e1Jrm3oxglJjkOnal6MfM=
X-Received: by 2002:a05:6214:4886:b0:6c5:30c9:c055 with SMTP id
 6a1803df08f44-6c57355ac2dmr79834256d6.14.1726194053000; Thu, 12 Sep 2024
 19:20:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240828030321.20688-1-laoar.shao@gmail.com>
 <20240828030321.20688-5-laoar.shao@gmail.com>
 <ozoyqz5a7zssggowambojv4x6fbhdl6iqjopgnycca223jm6sz@pdzdmshhdgwn>
In-Reply-To: <ozoyqz5a7zssggowambojv4x6fbhdl6iqjopgnycca223jm6sz@pdzdmshhdgwn>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Fri, 13 Sep 2024 10:20:16 +0800
Message-ID: <CALOAHbD0eEOPft2E_RwxrdB0aHC_qV9JGjA2NJvhYeNy1joDRA@mail.gmail.com>
Subject: Re: [PATCH v8 4/8] bpftool: Ensure task comm is always NUL-terminated
To: Justin Stitt <justinstitt@google.com>
Cc: akpm@linux-foundation.org, torvalds@linux-foundation.org, alx@kernel.org, 
 ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org, 
 catalin.marinas@arm.com, penguin-kernel@i-love.sakura.ne.jp, 
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org, 
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
 bpf@vger.kernel.org, netdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Quentin Monnet <qmo@kernel.org>
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

On Fri, Sep 13, 2024 at 5:14=E2=80=AFAM Justin Stitt <justinstitt@google.co=
m> wrote:
>
> Hi,
>
> On Wed, Aug 28, 2024 at 11:03:17AM GMT, Yafang Shao wrote:
> > Let's explicitly ensure the destination string is NUL-terminated. This =
way,
> > it won't be affected by changes to the source string.
> >
> > Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> > Reviewed-by: Quentin Monnet <qmo@kernel.org>
> > ---
> >  tools/bpf/bpftool/pids.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/tools/bpf/bpftool/pids.c b/tools/bpf/bpftool/pids.c
> > index 9b898571b49e..23f488cf1740 100644
> > --- a/tools/bpf/bpftool/pids.c
> > +++ b/tools/bpf/bpftool/pids.c
> > @@ -54,6 +54,7 @@ static void add_ref(struct hashmap *map, struct pid_i=
ter_entry *e)
> >               ref =3D &refs->refs[refs->ref_cnt];
> >               ref->pid =3D e->pid;
> >               memcpy(ref->comm, e->comm, sizeof(ref->comm));
> > +             ref->comm[sizeof(ref->comm) - 1] =3D '\0';
>
> ...
>
> >               refs->ref_cnt++;
> >
> >               return;
> > @@ -77,6 +78,7 @@ static void add_ref(struct hashmap *map, struct pid_i=
ter_entry *e)
> >       ref =3D &refs->refs[0];
> >       ref->pid =3D e->pid;
> >       memcpy(ref->comm, e->comm, sizeof(ref->comm));
> > +     ref->comm[sizeof(ref->comm) - 1] =3D '\0';
>
> Excuse my ignorance, do we not have a strscpy() equivalent usable in bpf
> code?

To my knowledge, there is no direct equivalent of the standard
strcpy() function available in bpftool or libbpf code.

--=20
Regards
Yafang

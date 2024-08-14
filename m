Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 595D8951281
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 04:35:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C830010E403;
	Wed, 14 Aug 2024 02:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iYdjwOVm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5D810E403
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 02:34:58 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-6b7a3e468a9so42007286d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 19:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723602897; x=1724207697; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gulgz5rKPIgrCppnzyz5c+/APUjS7s9WOQeVGOEKdkQ=;
 b=iYdjwOVmjPE8SN4R3jV5ahLbU0H6mD2nZbWyz/pFmvVlQeYjiGi4NGoir9sREOYEM2
 DDFa5ydoMd6QR4bc+UhtGuplCI9mTURA2d4iukABb2poWxEad3gN/JReVMIy+Fvxnr+I
 vq0OaYlIKB8xc5/LaW0N2NR287e8T+ME02BpIURM868ucjiMbUfRHDxGiDtTah260TnQ
 RdT4W4WHdzrMueBJSQARlk2xJu9SbyTr4IRL1FPdo+cYEuUgAky0URE0oVg7ixBcgczB
 p/VZy5NkIFNsw/z731mf1Qnf3HYOhO2jutz2D+iY8NhkrvI7Ou7W50yM6SIItaypZ9tm
 EJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723602897; x=1724207697;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gulgz5rKPIgrCppnzyz5c+/APUjS7s9WOQeVGOEKdkQ=;
 b=W1c6knTGLQyiHLM3siT/+J/HvrCUDTVq2j9VjsavoHJ++9F3LRPwAVi0y88CLWrUmL
 /Inii2QX6ihp3SqjEm344K0qcGcvk+O8Ff1hTZpXhMztxngpHjxyb0tLUmbdoRyBeo5y
 fT2ToVDsJokovpay/1c+VgJQH38mrL8vhoWaJr935zGb/WyHEyMqiRWiSBYN1QfjJmPI
 T1ko3NS/GKD1AlY2q6LM1Pkl7iSjFoCy0Va9dJuF9A7WdPPF3S5Ydjcx8G9rqWbpx5JN
 cNW7kHGRgmwEJJm9i4hXweKTaPlKVkUm93bMCtOz2sdHSJczwFK/YOqZwVl3ezQYU+ns
 0Cfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWF/7TDj2LZ3QI7xJVuMl0RPe4J3SoQqXnS6AH+huv3a0iTEetw51Wy/tf8dJOKF8Y9cpW/P1C98V6X2K4HHOmLv+cLA2AsuijGkzHkbUYA
X-Gm-Message-State: AOJu0Yxh2sRjP06jeatKOcO1vy9zUp56Nm5j2YX9hNxs/GvxXO9DPsNW
 ixL90S3fmzysIu9ohxghrx/h+nyc8+tasWC/SRb3Ud2u8ZFV1NJBAqPmV4CYUmsf4uYpUyOnUL/
 hSPJbXkByu312SK5P2V5fYdFYfoM=
X-Google-Smtp-Source: AGHT+IFMSVMbk2rFvvLCxVG+t2Kro+kM02PzB20ab6DAgtzjWvP0nxAeN6FMupoLej6GxB7D7awodMjAvR0yE5dJ7Jc=
X-Received: by 2002:a05:6214:4413:b0:6b7:ab54:3b90 with SMTP id
 6a1803df08f44-6bf5d22db83mr14601296d6.35.1723602897166; Tue, 13 Aug 2024
 19:34:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240812022933.69850-1-laoar.shao@gmail.com>
 <20240812022933.69850-8-laoar.shao@gmail.com>
 <hbjxkyhugi27mbrj5zo2thfdg2gotz6syz6qoeows6l6qwbzkt@c3yb26z4pn62>
 <CAFhGd8oBmBVooQha7EB+_wenO8TfOjqJsZAzgHLuDUSYmwxy=w@mail.gmail.com>
In-Reply-To: <CAFhGd8oBmBVooQha7EB+_wenO8TfOjqJsZAzgHLuDUSYmwxy=w@mail.gmail.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Wed, 14 Aug 2024 10:34:21 +0800
Message-ID: <CALOAHbC=DpQROvwxxzqU31L5pOd5tC3+26Q_KuC8PZ7FeU=AAg@mail.gmail.com>
Subject: Re: [PATCH v6 7/9] tracing: Replace strncpy() with strscpy()
To: Justin Stitt <justinstitt@google.com>, ruanjinjie@huawei.com
Cc: akpm@linux-foundation.org, torvalds@linux-foundation.org, 
 ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org, 
 catalin.marinas@arm.com, penguin-kernel@i-love.sakura.ne.jp, 
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org, 
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
 bpf@vger.kernel.org, netdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
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

On Wed, Aug 14, 2024 at 6:31=E2=80=AFAM Justin Stitt <justinstitt@google.co=
m> wrote:
>
> On Tue, Aug 13, 2024 at 3:19=E2=80=AFPM Justin Stitt <justinstitt@google.=
com> wrote:
> >
> > Hi,
> >
> > On Mon, Aug 12, 2024 at 10:29:31AM GMT, Yafang Shao wrote:
> > > Using strscpy() to read the task comm ensures that the name is
> > > always NUL-terminated, regardless of the source string. This approach=
 also
> > > facilitates future extensions to the task comm.
> >
> > Thanks for sending patches replacing str{n}cpy's!
> >
> > I believe there's at least two more instances of strncpy in trace.c as
> > well as in trace_events_hist.c (for a grand total of 6 instances in the
> > files you've touched in this specific patch).
> >
> > It'd be great if you could replace those instances in this patch as wel=
l :>)
> >
> > This would help greatly with [1].
> >
>
> I just saw that Jinjie Ruan sent replacements for these strncpy's too
> and tracked down and replaced an instance of strscpy() that was
> present in trace.c but was moved to trace_sched_switch.c during a
> refactor.
>
> They even used the new 2-argument strscpy which is pretty neat.
>
> See their patch here:
> https://lore.kernel.org/all/20240731075058.617588-1-ruanjinjie@huawei.com=
/

+ Jinjie

That sounds good. Since this change can be handled as a separate
patch, I will drop it from the next version and leave it to Jinjie.
Please note that Steven might have a better solution for handling
task->comm in trace events, so it=E2=80=99s probably best to leave any chan=
ges
related to trace events to him [0].

[0] https://lore.kernel.org/all/20240603184016.3374559f@gandalf.local.home/=
#t

--
Regards
Yafang

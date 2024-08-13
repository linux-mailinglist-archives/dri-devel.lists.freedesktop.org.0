Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 545F9950FC4
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 00:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD5F310E3F8;
	Tue, 13 Aug 2024 22:31:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="oop+UIBo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A78910E3F9
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 22:31:39 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id
 ada2fe7eead31-492a09d4c42so2113602137.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 15:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1723588298; x=1724193098;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PjDal07NYOKBjkEkz7/rPrI2L3lDW5tzH1NRX7vsX+E=;
 b=oop+UIBoPNUbvhkYPWLEsz6G7pnrI5xZFnKUsM8s3msjwg8RD/Y1+9ZCA7LX66lPDg
 2R3WrEZJX8Y0i8xbQcFjRFVgRuPuOyGbjkSaDwh6O15kILWgAO1YyXvwyO3AH/fxZxDi
 5VherZCm8YlXEP5Uh8uO0xJwuI7xAn9ij0wmYr/C73i9QZj2zBPeGZYxsFLSe6ZuE0C8
 pqBaizrAHCOFyZn1AVQ5SGfODEt7/LItabIJLFAMfsjbOQgXK3TDEYkVE9niiiUC2oR1
 G5xG9mE7Q5YjEUr0ag6mSNFBQA8PgpFuWhUcP+TcUJYIxzyt5dlPrOUp6Ppa3vZvrp9V
 5zMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723588298; x=1724193098;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PjDal07NYOKBjkEkz7/rPrI2L3lDW5tzH1NRX7vsX+E=;
 b=owP5OfyBZ8n1kAXdHDX4goWqfwo5twaVsVkiKU8FgU2no81oojVS3oaBwqM7hGRn2q
 wtzFgf8Gierj77vbbAQhuLL8wYH4yEMJZi2lPimec0/cZaLM+IQ+crpQIOgJhxgIERor
 pwgiMSreHP8H92ZwLza8TnQkWoxzHwKk6OxQ8ZPATqD7qUllSeo008o3aRuqG4vnRF2j
 4PDEZRSuq0sgI2/+T3TTJ9yITPTouklu3EpzJ6wukIxG5USoQN9CEPNDsy5yZn++k//J
 PzvAkABS5kuAomLrNSesO+UixkYSmidVK8eMxXcmtBbrVkXFwPHwc3upr9UPlUuwDmg2
 YgIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUk37nhFAC1t4hnjTtwrElCZJtlHrsNh0jbqK23if58u8pq8/zdqV7hYpojDFgTK6l8W7Z8LU0IJ/vPUrZei9XVlEmVbk8z2+EECb1lVRO4
X-Gm-Message-State: AOJu0YyJjGAtOkWbwOYD43qkzDKc6t4IxnkMwE1vFmAsPL23wm9236MM
 7+V/wVZjCgsf9Zdy1ESj1FoEIDT+ls7Va5BGMrBTcqZ4TSwz9xEfC5buFW4Pm9Bae3DqJkCzgB2
 RfFZiLCvHe5F78tGu1EqUKeNi5wFhPUdxgr3G
X-Google-Smtp-Source: AGHT+IH/QraxU2fjWjOPkx0WDZKuaY29L3Zen/pzf+3bC1KTX13QSkaN1GEjq4vqJeNmusG+MLJVL3jxUBZoAMXwy+8=
X-Received: by 2002:a05:6102:c04:b0:493:b4b5:4850 with SMTP id
 ada2fe7eead31-497599e9a02mr915097137.31.1723588298200; Tue, 13 Aug 2024
 15:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240812022933.69850-1-laoar.shao@gmail.com>
 <20240812022933.69850-8-laoar.shao@gmail.com>
 <hbjxkyhugi27mbrj5zo2thfdg2gotz6syz6qoeows6l6qwbzkt@c3yb26z4pn62>
In-Reply-To: <hbjxkyhugi27mbrj5zo2thfdg2gotz6syz6qoeows6l6qwbzkt@c3yb26z4pn62>
From: Justin Stitt <justinstitt@google.com>
Date: Tue, 13 Aug 2024 15:31:26 -0700
Message-ID: <CAFhGd8oBmBVooQha7EB+_wenO8TfOjqJsZAzgHLuDUSYmwxy=w@mail.gmail.com>
Subject: Re: [PATCH v6 7/9] tracing: Replace strncpy() with strscpy()
To: Yafang Shao <laoar.shao@gmail.com>
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

On Tue, Aug 13, 2024 at 3:19=E2=80=AFPM Justin Stitt <justinstitt@google.co=
m> wrote:
>
> Hi,
>
> On Mon, Aug 12, 2024 at 10:29:31AM GMT, Yafang Shao wrote:
> > Using strscpy() to read the task comm ensures that the name is
> > always NUL-terminated, regardless of the source string. This approach a=
lso
> > facilitates future extensions to the task comm.
>
> Thanks for sending patches replacing str{n}cpy's!
>
> I believe there's at least two more instances of strncpy in trace.c as
> well as in trace_events_hist.c (for a grand total of 6 instances in the
> files you've touched in this specific patch).
>
> It'd be great if you could replace those instances in this patch as well =
:>)
>
> This would help greatly with [1].
>

I just saw that Jinjie Ruan sent replacements for these strncpy's too
and tracked down and replaced an instance of strscpy() that was
present in trace.c but was moved to trace_sched_switch.c during a
refactor.

They even used the new 2-argument strscpy which is pretty neat.

See their patch here:
https://lore.kernel.org/all/20240731075058.617588-1-ruanjinjie@huawei.com/

> Link: https://github.com/KSPP/linux/issues/90 [1]
> Link: https://lore.kernel.org/all/CAHk-=3DwhWtUC-AjmGJveAETKOMeMFSTwKwu99=
v7+b6AyHMmaDFA@mail.gmail.com/ [2]
>
> Thanks
> Justin

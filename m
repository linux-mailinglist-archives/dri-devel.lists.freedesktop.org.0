Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3959722A6
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 21:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA66310E13C;
	Mon,  9 Sep 2024 19:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IsjC4grF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9D710E13C;
 Mon,  9 Sep 2024 19:30:21 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2f75d044201so21844191fa.0; 
 Mon, 09 Sep 2024 12:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725910220; x=1726515020; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=woE07RMIM4YJ88QTc1ZNc52E+GbLSESAkfn/9qs5W1Y=;
 b=IsjC4grFAvgjLRqJZIcOwhbI1N9YpJBBSfFrRt/4e2YQPPE+e1bEOme6SEyHjujJyv
 5LoVh0PF1V2EExPrubGyJUAsyyVJp80dpQ5afpPupmJJS9nuWy+NGv+xgQyBMEqajooS
 W9nfM3DsSrV4uAMXxx0KUt2jAaVFYA2R4Q3TnmxWosHFGHPW9QxUueks/aZ+InpYuiZA
 VKvy1qfej1SXRlhilimxpby9hRknvJtTnovkgJBDiCmA0goXyldQwaVlsgJjNygI4VfK
 1pMjDNV4cujs8xrLupXHLw3hFGHnFDV3IhmwXqEGVJQM+Ufryd9mezuv18aZxj1+0Gme
 2D/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725910220; x=1726515020;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=woE07RMIM4YJ88QTc1ZNc52E+GbLSESAkfn/9qs5W1Y=;
 b=OtcsPga/uIxfsVj85jsyV9yoRvPwzFMm/SdHGKbIsOl74UT3EK92aMyRJINpFvjyJD
 4TGXARunEMk7Nb5tmMcoHxlGCPdmRERlfLEfioVKQ9Bp7KTPLTCPiNCS6xA+8rEjkruA
 fSFbBoqpyDZ4eAO61MMYKqf/ht8QNs1GlgB5gXLU+rbfCw06YCQodgun4fK+yIrWJFMG
 Px2mACJmrVFRdFI3lVte91leE1gS89IXMCDTTRdAW4W3rHTOrqy0ujc9OgdcI9R5Pc9Q
 KyBbxJCtgkK/auxTAXRDZ4Q8VHPd+nQcyi66anOiUayxYSubOB2hXb34SCdPd67vIDcE
 p/LA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeqmu0Yk/vKy6PQXEClsN0TAeSiY1LLVog4dzCQwIes97RsVyawATe3OqnClESursb1o3cCuvqqCs=@lists.freedesktop.org,
 AJvYcCXNNqYghK178ZZ46H21Q97SDFA7IZhGpPqwpW+7bNQ08M7wn4LphVujQLuBrtlNhgIj9zrKUOU8nhB4@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxqhh188munkYMmVjhvVKCHG/RKLNpkIRP571F61+wQ0qZrLIYr
 TqT78L9XAIvbegC4iYhUHwaCrTRtmlkZe7FCVRyt443sWEfPCQrUF+PXrJP7x22py5axrqGAb0k
 4iEX1L/moymjk9WblX+AkqH8wwBY=
X-Google-Smtp-Source: AGHT+IHGDlZWsmVxtU6Y46aEXfBA2sgXqI4naIhOyyLQHvnhEyR7+3HqFvBi8W+gcZkb/4A25yABw4d/bXms0qX89pY=
X-Received: by 2002:a05:651c:549:b0:2f7:6277:f2be with SMTP id
 38308e7fff4ca-2f7727190f4mr2037391fa.22.1725910218656; Mon, 09 Sep 2024
 12:30:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240909075641.258968-1-ubizjak@gmail.com>
 <Zt8a6_RwLG2pEnZ6@zx2c4.com>
In-Reply-To: <Zt8a6_RwLG2pEnZ6@zx2c4.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Mon, 9 Sep 2024 21:30:06 +0200
Message-ID: <CAFULd4ak3n1x0tGrqiNoxvDBRw6AWgchfBO_k4aKps34DomPvA@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 00/19] random: Resolve circular include
 dependency and include <linux/percpu.h>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: x86@kernel.org, linux-crypto@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Eric Biggers <ebiggers@kernel.org>, 
 "Theodore Y. Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>, Hannes Reinecke <hare@suse.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, 
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>, 
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Stephen Hemminger <stephen@networkplumber.org>,
 Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>,
 Kent Overstreet <kent.overstreet@linux.dev>
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

On Mon, Sep 9, 2024 at 5:57=E2=80=AFPM Jason A. Donenfeld <Jason@zx2c4.com>=
 wrote:

> On Mon, Sep 09, 2024 at 09:53:43AM +0200, Uros Bizjak wrote:
> > a) Substitutes the inclusion of <linux/random.h> with the
> > inclusion of <linux/prandom.h> where needed (patches 1 - 17).
> >
> > b) Removes legacy inclusion of <linux/prandom.h> from
> > <linux/random.h> (patch 18).
> >
> > c) Includes <linux/percpu.h> in <linux/prandom.h> (patch 19).
>
> Thanks for doing this. That seems like a fine initiative to me. (I'm
> also curious about the future percpu changes you've got planned.)

As explained in the cover letter, recent GCCs are able to track
address space of variables in percpu address space from the
declaration to its usage site. There are certain rules regarding casts
of variables and their pointers (when this named address space is not
considered a subspace of the generic address space), so it is possible
to create much more effective checks for cast-from-as type casts than
what sparse can achieve.

Besides GCC, clang can define various named address space via
address_space attribute:

--cut here--
#define __as(N) __attribute__((address_space(N)))

void *foo(void __as(1) *x) { return x; }         // error

void *bar(void __as(1) *x) { return (void *)x; } // fine
--cut here--

When compiling this, the compiler returns:

clang-as.c:3:37: error: returning '__as(1) void *' from a function
with result type 'void *' changes address space of pointer

Although clang currently errors out when __seg_gs and __seg_fs named
address space designators are used, we can explore its named address
spaces functionality to implement percpu checks for all targets. The
percpu address space checks patchset, referred to in the cover letter,
also supports this functionality when per_cpu_qual is defined to
__attribute__((address_space(N))).

Perhaps we can use different address spaces to also handle __user,
__iomem and __rcu address spaces. This way the compiler will be able
to handle address space checks instead of sparse.

> Tree-wise, were you expecting me to take this through random.git? And if
> so, what timeframe did you have in mind? For 6.12 next week (can you
> poke folks for acks in time?), or punt it for 6.13? Or did you have a
> different tree in mind for treewide changes (in which case, I'll send
> you an ack for the [p]random.h changes).

I think that the best approach is to target this patchset for linux
6.13 via random.git tree. I will prepare a v3 after 6.12rc1, so when
committed to random.git, the patchset will be able to spend some time
in linux-next. This way, there will be plenty of time for CI robots to
do additional checks also for some less popular targets (although
individual patches are dead simple, removing these kinds of "legacy"
includes can be tricky), and I will also be able to collect Acked-by:s
in the meantime.

While the patchset is an improvement by itself, its inclusion is not
time sensitive. The follow up percpu named address checking
functionality requires a very recent feature (__typeof_unqual__
keyword), which is only supported in recent compilers (gcc-14 and
clang-20). Besides compiler support, sparse doesn't know about
__typeof_unqual__, resulting in broken type tracing and hundreds of
sparse errors with C=3D1 due to unknown keyword.

So, I think we are not in a hurry and can take the slow and safe path.

Thanks and best regards,
Uros.

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A3D96D9A7
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 15:03:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A303F10E89B;
	Thu,  5 Sep 2024 13:03:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IEUBYdIs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3223110E89B;
 Thu,  5 Sep 2024 13:03:39 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2f025b94e07so6765241fa.0; 
 Thu, 05 Sep 2024 06:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725541417; x=1726146217; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J4Ap3iChcCI6LjI4bbXEj5UiVcIZisPfcA3U2HCE+kE=;
 b=IEUBYdIsF1GiML4tzwvs5sD1P3TrgSXM7798ilNc5UCG7c8IHASUvvnBmk8dg0zRll
 SbbqxYbNiPACstyzMyLFTRm2fhjioUDyKM9WNdmsd4wEMyjESE22VJlGJsnwWfYvft0v
 JVRffnrOp8AvlRbnWIssjm0l+60dV4l4ANRF+l0/AWB2BO/Me478bJ2jxBTE0MQ9RQ1b
 QnJtaUrLo2KAWK7VU0JpFTuLGGIM9ixYFUJw8jQlZF4d9U8OpK0Br/df9DNhgqhEdKYJ
 Ssi0snJIvHKj/kjoxIzmAXADLTOIdslXAbIMgQHPeyfviNswxBm7UWhnYUahVjR/YwCu
 IC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725541417; x=1726146217;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J4Ap3iChcCI6LjI4bbXEj5UiVcIZisPfcA3U2HCE+kE=;
 b=GHBnZeK/2gzsTApsAuagHIZhnWXzx7NmfqYFeV9WBiaJc7gjWyOPdm6Fr8ETGqnm+L
 W5Rvq7Lh1YE8FdcLhJ9Q6mGSdkikOSx2f1UUggiY8vKnSHmUNWOHrw85EwlnIhWeBzwn
 w+OaGpN3V6qQs66G0DfCmIRXWxak0IR7uZmbeyxRh3Q9V6jPdqIo63a301gxdKgV8RbY
 DXAP/J6ES6pMpVJZtcHcHjtRq7+p8+hc9xZP5V+Sy0zXxrCQSym2oT0O+qjH9/NW+5kR
 KKdRmk8NVR2V0fUG0fZZVO3Djn4ycx2GVS4z4rOBIVvveOsCSxgFj9I5rsT1VpKOodTo
 g/nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiGJ5Z+i0et1XnFhKHSeIcQBXWa/uZI2tDufvORfA0i/A7ODzXj5y/c1jIUPaZWyK0yez+kFM7GBnO@lists.freedesktop.org,
 AJvYcCVwKYEo9rQ5zcu4LbQ5FSYe4Ze+7e5/Bc5pFZPgZQ5i/r2SHonTqBaXW2L7HlmEOmh3mDxkuhKkS+Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUp3+AyTi7YBJzZtSNRhTISViNmc3/XLKJ9OizOdUcwAXMR3Tx
 rKhACcQ8zWXls00rV49QsvA9GIbRUn+FYGXjoI2rqEZNb1+tZl+GF3oWNlRCXFCHCURan+AwWj1
 xJOmNHKPg9f1wnr2C4xzvw22wOng=
X-Google-Smtp-Source: AGHT+IETBLGAu3Qd00jjqcPIw+YbfEw8PL6KVZG3phkN8mEHyaiFDy+b4h0Zi/X597x+B58/kQSA12RjAv0BY7eFUFU=
X-Received: by 2002:a2e:a54b:0:b0:2ef:2b06:b686 with SMTP id
 38308e7fff4ca-2f6103a565bmr183794191fa.17.1725541415766; Thu, 05 Sep 2024
 06:03:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240905122020.872466-1-ubizjak@gmail.com>
 <Ztmm00eLBQGtiwRM@smile.fi.intel.com>
In-Reply-To: <Ztmm00eLBQGtiwRM@smile.fi.intel.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Thu, 5 Sep 2024 15:03:24 +0200
Message-ID: <CAFULd4bzyNGcJqeg7w2ZQ0Xmw-HsBhczf8yPna7mSgG4NmdcWw@mail.gmail.com>
Subject: Re: [PATCH 00/18] random: Include <linux/percpu.h> and resolve
 circular include dependency
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
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
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Hannes Reinecke <hare@suse.de>, 
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
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Stephen Hemminger <stephen@networkplumber.org>,
 Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>,
 Kent Overstreet <kent.overstreet@linux.dev>, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com
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

On Thu, Sep 5, 2024 at 2:41=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Sep 05, 2024 at 02:17:08PM +0200, Uros Bizjak wrote:
> > There were several attempts to resolve circular include dependency
> > after the addition of percpu.h: 1c9df907da83 ("random: fix circular
> > include dependency on arm64 after addition of percpu.h"), c0842fbc1b18
> > ("random32: move the pseudo-random 32-bit definitions to prandom.h") an=
d
> > finally d9f29deb7fe8 ("prandom: Remove unused include") that completely
> > removes inclusion of <linux/percpu.h>.
> >
> > Due to legacy reasons, <linux/random.h> includes <linux/prandom.h>, but
> > with the commit entry remark:
> >
> > --quote--
> > A further cleanup step would be to remove this from <linux/random.h>
> > entirely, and make people who use the prandom infrastructure include
> > just the new header file.  That's a bit of a churn patch, but grepping
> > for "prandom_" and "next_pseudo_random32" "struct rnd_state" should
> > catch most users.
> >
> > But it turns out that that nice cleanup step is fairly painful, because
> > a _lot_ of code currently seems to depend on the implicit include of
> > <linux/random.h>, which can currently come in a lot of ways, including
> > such fairly core headfers as <linux/net.h>.
> >
> > So the "nice cleanup" part may or may never happen.
> > --/quote--
> >
> > __percpu tag is currently defined in include/linux/compiler_types.h,
> > so there is no direct need for the inclusion of <linux/percpu.h>.
> > However, in [1] we would like to repurpose __percpu tag as a named
> > address space qualifier, where __percpu macro uses defines from
> > <linux/percpu.h>.
> >
> > This patch series is the "nice cleanup" part, and allows us to finally
> > include <linux/percpu.h> in prandom.h.
> >
> > The whole series was tested by compiling the kernel for x86_64 allconfi=
g
> > and some popular architectures, namely arm64 defconfig, powerpc defconf=
ig
> > and loongarch defconfig.
>
> Obvious question(s) is(are):
> 1) have you seen the Ingo's gigantic patch series towards resolving issue=
s with
> the headers?
> 2) if not, please look at the preliminary work and take something from th=
ere, I
> believe there are many useful changes already waiting for a couple of yea=
rs to
> be applied.
>
> Because I haven't found any references nor mentions of that in the cover =
letter
> here and explanation why it was not taking into consideration.

I am aware of the series, but the patch takes only a small bite of it
and specifically resolves the inclusion of <linux/prandom.h> from
linux/random.h. The series fixes the missing inclusion of
<linux/prandom.h> in files that use pseudo-random function and it was
not meant to be a general header cleanup. The end goal is to allow us
to include <linux/percpu.h> in linux/prandom.h - which uses __percpu
tag without the correct include.

Thus, the patch series is only tangentially connected to Ingo's patch serie=
s.

Best regards,
Uros.

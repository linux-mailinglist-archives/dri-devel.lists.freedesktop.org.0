Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C807269904
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 00:38:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE2B6E7EA;
	Mon, 14 Sep 2020 22:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B332F6E7EA
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 22:38:11 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id w3so1076354ljo.5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 15:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HByVscULZ1aCzKEsNJOaDk74v0AyftSy1pTwuoj93qw=;
 b=Cd9Si1L6gfURzpvvo99txBSmG4fycZzpI1K602Rqdgokf4YjHKM5bshv0gBeRPoKoq
 S07+pMee3ja0pLLEif7+5dTcJ55cbbmX1a0rjsvg02GjZzwr0ekBVDISdAQ1ceTpPczJ
 7r3vx/CHsgdJU8GacJiTsbr8oX1ECzkK1quPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HByVscULZ1aCzKEsNJOaDk74v0AyftSy1pTwuoj93qw=;
 b=MJGw7pjXoYxp7u7mQ5rjq517LssNSlMcAtEsGICik+V7NsNkTpDtRbHmb2ZWDY1ndc
 gqYhepqI1RKQ2ZnRb+YNderPcEzdRsvPDpVhc2Ju9EqpbJL/+a08MzB4RrVNagvh7xdf
 OwCACzXJMBEoOrhP05R/JhJBz6SpE0QcJPBV1TLPwD1hqDuQHet7VajemQenl/W7Bhv9
 i79Mio2RVHlz3/kPxZj5NHGomSAUSb98NYtek2vS233il5BXv63D4FTyvCfHxQ2x3nOj
 EKdz/Os5sC+jb3UpzBOxz7XR5dIn/q4LUie3owrG4y9/lIM0HwDFIQZQmcKXbdHLnbQ+
 ujqA==
X-Gm-Message-State: AOAM532jYFAlCePZfzwzTJWrQwW5Cffl8LW5+jjO16rb1isR/q4SGGXx
 NSuP+OdRW2LVu2eNxfa+vsRpqTHecfjelg==
X-Google-Smtp-Source: ABdhPJwMiUqxFUK7mstrD/8W7EdOczcmcZm3bIti9PLBd740rD/Rwcp77UTYsycUZ/PJCV9OVolB+A==
X-Received: by 2002:a2e:5c89:: with SMTP id q131mr5438809ljb.352.1600123089613; 
 Mon, 14 Sep 2020 15:38:09 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42])
 by smtp.gmail.com with ESMTPSA id 73sm3529374lff.118.2020.09.14.15.38.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2020 15:38:08 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id y17so984744lfa.8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 15:38:07 -0700 (PDT)
X-Received: by 2002:ac2:5594:: with SMTP id v20mr5351814lfg.344.1600123085147; 
 Mon, 14 Sep 2020 15:38:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200914204209.256266093@linutronix.de>
 <CAHk-=win80rdof8Pb=5k6gT9j_v+hz-TQzKPVastZDvBe9RimQ@mail.gmail.com>
 <871rj4owfn.fsf@nanos.tec.linutronix.de>
 <CAHk-=wj0eUuVQ=hRFZv_nY7g5ZLt7Fy3K7SMJL0ZCzniPtsbbg@mail.gmail.com>
In-Reply-To: <CAHk-=wj0eUuVQ=hRFZv_nY7g5ZLt7Fy3K7SMJL0ZCzniPtsbbg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 14 Sep 2020 15:37:49 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjOV6f_ddg+QVCF6RUe+pXPhSR2WevnNyOs9oT+q2ihEA@mail.gmail.com>
Message-ID: <CAHk-=wjOV6f_ddg+QVCF6RUe+pXPhSR2WevnNyOs9oT+q2ihEA@mail.gmail.com>
Subject: Re: [patch 00/13] preempt: Make preempt count unconditional
To: Thomas Gleixner <tglx@linutronix.de>, Ard Biesheuvel <ardb@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Segall <bsegall@google.com>,
 Linux-MM <linux-mm@kvack.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 linux-hexagon@vger.kernel.org, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 linux-arch <linux-arch@vger.kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Brian Cain <bcain@codeaurora.org>, Richard Weinberger <richard@nod.at>,
 Russell King <linux@armlinux.org.uk>, David Airlie <airlied@linux.ie>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Mel Gorman <mgorman@suse.de>, intel-gfx <intel-gfx@lists.freedesktop.org>,
 Matt Turner <mattst88@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>, linux-xtensa@linux-xtensa.org,
 Shuah Khan <shuah@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Jeff Dike <jdike@addtoit.com>, linux-um <linux-um@lists.infradead.org>,
 Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>,
 rcu@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Richard Henderson <rth@twiddle.net>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 14, 2020 at 3:24 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Ard and Herbert added to participants: see
> chacha20poly1305_crypt_sg_inplace(), which does
>
>         flags = SG_MITER_TO_SG;
>         if (!preemptible())
>                 flags |= SG_MITER_ATOMIC;
>
> introduced in commit d95312a3ccc0 ("crypto: lib/chacha20poly1305 -
> reimplement crypt_from_sg() routine").

As far as I can tell, the only reason for this all is to try to use
"kmap()" rather than "kmap_atomic()".

And kmap() actually has the much more complex "might_sleep()" tests,
and apparently the "preemptible()" check wasn't even the proper full
debug check, it was just a complete hack to catch the one that
triggered.

From a quick look, that code should probably just get rid of
SG_MITER_ATOMIC entirely, and alwayse use kmap_atomic().

kmap_atomic() is actually the faster and proper interface to use
anyway (never mind that any of this matters on any sane hardware). The
old kmap() and kunmap() interfaces should generally be avoided like
the plague - yes, they allow sleeping in the middle and that is
sometimes required, but if you don't need that, you should never ever
use them.

We used to have a very nasty kmap_atomic() that required people to be
very careful and know exactly which atomic entry to use, and that was
admitedly quite nasty.

So it _looks_ like this code started using kmap() - probably back when
kmap_atomic() was so cumbersome to use - and was then converted
(conditionally) to kmap_atomic() rather than just changed whole-sale.
Is there actually something that wants to use those sg_miter functions
and sleep?

Because if there is, that choice should come from the outside, not
from inside lib/scatterlist.c trying to make some bad guess based on
the wrong thing entirely.

                 Linus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C214526AAF2
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 19:43:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29C376E138;
	Tue, 15 Sep 2020 17:43:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F4C66E138
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 17:43:44 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id v23so3624167ljd.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 10:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0nYcbfWZAApGs9MKHeuMMDYKDYJP/KjXcIMY7yTiRjk=;
 b=hFeX95/TT9jtwZAL/DonKpuMHGRk/7SCmZequDM1VaRmacKDQZY4lc39NgOcx0VujL
 ul3l8yb5Ugprhwk3dogs1JqCkfr90spWSTqKGkSLsF9w3lXrIygeRUDRxh1yw1QSoeb3
 vUCYW8AmUQyz6zbxknLrsvz9nPCTdNe9Dcd+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0nYcbfWZAApGs9MKHeuMMDYKDYJP/KjXcIMY7yTiRjk=;
 b=ESEe0YT9QTP125MyNm0elOjmuoC1C05MVnjkuaVsXREDOEaoP5yBsw2HJcnni9b6qa
 cfpVwLBqtzFgIcCBvlKeMmZP3+1vkKTGZdXgNQuWvMy7bHYM+fjcnrWdhGXHCF8AYilv
 wrjUerm0tq2xmO5U4kQ0FNboe1FgILSxoH27dVkuMmANmODxan7pSrWCZSxWC71tGQqe
 LwbewtMhuDFQHCWkvdMn/Q4foFJom13RlhXSc+nKDFc7jHl4HgDBndLaLACPShhPlu4A
 IEaDiJJPRVjRjygoOmX19Bu7gx6gctgpaFLWeeQH/vYa20L20szZ2QCEWBqJrBDoPrzC
 nVLA==
X-Gm-Message-State: AOAM533W1WTaryrjC1x99JLsSXd8VtRRATLM5RByi+g9kqgZQT7pLrl+
 KuvM0q1dlQy8ssra68XdsO10PTyJWrz/4w==
X-Google-Smtp-Source: ABdhPJwyS7+5OEqyfiP6cXmBhkWzhlEfpPsibkXyPlxGXfmaoasMhwnM53LQTKtD79STDTazi+mZmg==
X-Received: by 2002:a05:651c:106f:: with SMTP id
 y15mr7582296ljm.170.1600191822662; 
 Tue, 15 Sep 2020 10:43:42 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com.
 [209.85.167.54])
 by smtp.gmail.com with ESMTPSA id d18sm4062369lfm.178.2020.09.15.10.43.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Sep 2020 10:43:42 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id q8so4015462lfb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 10:43:42 -0700 (PDT)
X-Received: by 2002:ac2:5594:: with SMTP id v20mr6798322lfg.344.1600191336149; 
 Tue, 15 Sep 2020 10:35:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200914204209.256266093@linutronix.de>
 <CAHk-=win80rdof8Pb=5k6gT9j_v+hz-TQzKPVastZDvBe9RimQ@mail.gmail.com>
 <871rj4owfn.fsf@nanos.tec.linutronix.de>
 <CAHk-=wj0eUuVQ=hRFZv_nY7g5ZLt7Fy3K7SMJL0ZCzniPtsbbg@mail.gmail.com>
 <87bli75t7v.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87bli75t7v.fsf@nanos.tec.linutronix.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 15 Sep 2020 10:35:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wht7kAeyR5xEW2ORj7m0hibVxZ3t+2ie8vNHLQfdbN2_g@mail.gmail.com>
Message-ID: <CAHk-=wht7kAeyR5xEW2ORj7m0hibVxZ3t+2ie8vNHLQfdbN2_g@mail.gmail.com>
Subject: Re: [patch 00/13] preempt: Make preempt count unconditional
To: Thomas Gleixner <tglx@linutronix.de>
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
 Herbert Xu <herbert@gondor.apana.org.au>, Brian Cain <bcain@codeaurora.org>,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 Ard Biesheuvel <ardb@kernel.org>, David Airlie <airlied@linux.ie>,
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

On Tue, Sep 15, 2020 at 1:39 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> OTOH, having a working 'preemptible()' or maybe better named
> 'can_schedule()' check makes tons of sense to make decisions about
> allocation modes or other things.

No. I think that those kinds of decisions about actual behavior are
always simply fundamentally wrong.

Note that this is very different from having warnings about invalid
use. THAT is correct. It may not warn in all configurations, but that
doesn't matter: what matters is that it warns in common enough
configurations that developers will catch it.

So having a warning in "might_sleep()" that doesn't always trigger,
because you have a limited configuration that can't even detect the
situation, that's fine and dandy and intentional.

But having code like

       if (can_schedule())
           .. do something different ..

is fundamentally complete and utter garbage.

It's one thing if you test for "am I in hardware interrupt context".
Those tests aren't great either, but at least they make sense.

But a driver - or some library routine - making a difference based on
some nebulous "can I schedule" is fundamentally and basically WRONG.

If some code changes behavior, it needs to be explicit to the *caller*
of that code.

So this is why GFP_ATOMIC is fine, but "if (!can_schedule())
do_something_atomic()" is pure shite.

And I am not IN THE LEAST interested in trying to help people doing
pure shite. We need to fix them. Like the crypto code is getting
fixed.

                   Linus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

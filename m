Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCD2272C8A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 18:33:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC94897D7;
	Mon, 21 Sep 2020 16:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C7B897D7
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 16:33:07 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id u21so18673248eja.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 09:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LbpMl5lO0+qWgp9uAKdYj5ux1bx38Si35gqGXl7ChFs=;
 b=a2Cw4ka1cjcNejUhLUZAAjSLNoYelCoyZSpmQCatftbiLw5qTc+pZIam7CQ+bzySoC
 gGOBNlZFILF1rbb13VR5vHbBB6o7IPhfhEtjuIQ55GiefDbPErJYqMNF7ag3KHBM9T1M
 Z1SXFFsw84dXXtq0Bg7SO0KF3jcdxFjvGihOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LbpMl5lO0+qWgp9uAKdYj5ux1bx38Si35gqGXl7ChFs=;
 b=q8Um0kCpR10voebCC3ipQahxfhVtvI4MTJBVkTHqoYDBLlviF/srHTiHBozDwhMQ07
 8QXdWH+Y7LR59gdz9xUsHKv6Cf/0BxTNeGns02hSAzCHvdHciGJy1RA9uBZf8qjKDR+6
 lTvZZ2WI79mzayFmRBuS+invw58+iXd/YZNJH4csu9T1oqsP00I+UU1xGxz6c70+ShNO
 gqmcnnVdy9Smz0S0jGnt4tjanTh96HGhrH+Ht9GR4FHaKvDWkPzuSWFgju2ImK7R6+YB
 YCYqW8iz86jsDQ1RKA26bR0XINlGUaWIDUVBI5rkqknU/ONDnkSS0yWd19NsvH9MXrTe
 qPkg==
X-Gm-Message-State: AOAM531sGtP0NTAp3JaAfc1icj6L6RIdCaKxI9khCwbDo8S/DyMXO1Ld
 1Dn6IPN9Cp4y04pMNMhl32zt+NTywmDJcA==
X-Google-Smtp-Source: ABdhPJxIJSon2/4iQZIyJcQFJtIc6OqU5Z2mVQiWLEBbzGJlw5Eo2q+dZzHA9l4t0jDO2UwjNFE5KA==
X-Received: by 2002:a17:906:4b41:: with SMTP id j1mr271677ejv.1.1600705986117; 
 Mon, 21 Sep 2020 09:33:06 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com.
 [209.85.218.54])
 by smtp.gmail.com with ESMTPSA id i3sm9259368edn.55.2020.09.21.09.33.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 09:33:05 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id q13so18605612ejo.9
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 09:33:05 -0700 (PDT)
X-Received: by 2002:a2e:994a:: with SMTP id r10mr154392ljj.102.1600705501870; 
 Mon, 21 Sep 2020 09:25:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200919091751.011116649@linutronix.de>
 <CAHk-=wiYGyrFRbA1cc71D2-nc5U9LM9jUJesXGqpPnB7E4X1YQ@mail.gmail.com>
 <87mu1lc5mp.fsf@nanos.tec.linutronix.de>
 <87k0wode9a.fsf@nanos.tec.linutronix.de>
 <CAHk-=wgbmwsTOKs23Z=71EBTrULoeaH2U3TNqT2atHEWvkBKdw@mail.gmail.com>
 <87eemwcpnq.fsf@nanos.tec.linutronix.de>
 <CAHk-=wgF-upZVpqJWK=TK7MS9H-Rp1ZxGfOG+dDW=JThtxAzVQ@mail.gmail.com>
 <87a6xjd1dw.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87a6xjd1dw.fsf@nanos.tec.linutronix.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 21 Sep 2020 09:24:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjhxzx3KHHOMvdDj3Aw-_Mk5eRiNTUBB=tFf=vTkw1FeA@mail.gmail.com>
Message-ID: <CAHk-=wjhxzx3KHHOMvdDj3Aw-_Mk5eRiNTUBB=tFf=vTkw1FeA@mail.gmail.com>
Subject: Re: [patch RFC 00/15] mm/highmem: Provide a preemptible variant of
 kmap_atomic & friends
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
 dri-devel <dri-devel@lists.freedesktop.org>, linux-mips@vger.kernel.org,
 Ben Segall <bsegall@google.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Guo Ren <guoren@kernel.org>, linux-sparc <sparclinux@vger.kernel.org>,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Mel Gorman <mgorman@suse.de>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 linux-xtensa@linux-xtensa.org, Paul McKenney <paulmck@kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Linux-MM <linux-mm@kvack.org>,
 Vineet Gupta <vgupta@synopsys.com>, LKML <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 21, 2020 at 12:39 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> If a task is migrated to a different CPU then the mapping address will
> change which will explode in colourful ways.

Heh.

Right you are.

Maybe we really *could* call this new kmap functionality something
like "kmap_percpu()" (or maybe "local" is good enough), and make it
act like your RT code does for spinlocks - not disable preemption, but
only disabling CPU migration.

That would probably be good enough for a lot of users that don't want
to expose excessive latencies, but where it's really not a huge deal
to say "stick to this CPU for a short while".

The crypto code certainly sounds like one such case.

             Linus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC6C192056
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 06:10:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E0E6E0E9;
	Wed, 25 Mar 2020 05:10:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from conssluserg-06.nifty.com (conssluserg-06.nifty.com
 [210.131.2.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80BE36E0E9;
 Wed, 25 Mar 2020 05:10:43 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
 [209.85.217.51]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id 02P5ABUE020393;
 Wed, 25 Mar 2020 14:10:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 02P5ABUE020393
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1585113012;
 bh=goHEK+Svl1j1CHZ8RGvjblzdAWdDcWxFnIuljEdud0o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DnT5KzDtk1VZ4bX5jz1F2rsdqsISqFkA3UcZ8xsfhN86oNs2j/XPmD5P0cCs/JhpC
 4djo10x3J7e7VKuxZ6VaqctGHnlh7v8Y2a60Ld7EPdInTe+DqQnV3Yv2mMRbEtWync
 MiWlzZhvtXqwbjoutaboaVOvFnOMo0MJcs+5uYk6RNu52LFYtiOci3i1kOmUu1RoBi
 xhqivkrrBXMFOs8hfcQ/k+Do1CGoUI92UhBVNthIcvYQO4wcMswpJWLXGNNqUdh7Tw
 n7tev83ZNX9rklVlt+woYh25RkzUKyFRAAw9ucZjUiaVa3CirJ/T2AZaRCO80gKTwU
 bP6ZfZcCxvw5g==
X-Nifty-SrcIP: [209.85.217.51]
Received: by mail-vs1-f51.google.com with SMTP id e138so744821vsc.11;
 Tue, 24 Mar 2020 22:10:12 -0700 (PDT)
X-Gm-Message-State: ANhLgQ34Gj363yZonJbk6Ae/rdvYagLqmS/6SoGfGJNVctwFM9g4H1h/
 0n75WOXZzHLzWv9dpxKyXyXptaJVBPC5e1SmuNg=
X-Google-Smtp-Source: ADFU+vu+bM6M5+X0alIJHo1ALDGfE82bX+MEHXukXjfTCtMpyx9j4+KKQCB6mj8BRZ3ztAMCXwbRLo3j/oOEZhFBzJo=
X-Received: by 2002:a67:2d55:: with SMTP id t82mr1251970vst.215.1585113010953; 
 Tue, 24 Mar 2020 22:10:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200324084821.29944-1-masahiroy@kernel.org>
 <20200325045940.GA24974@gmail.com>
In-Reply-To: <20200325045940.GA24974@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 25 Mar 2020 14:09:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQvgT=OWVuBVrvgdZ7AAkoaV_K_Y+w9bOFxRPw_1TOSUA@mail.gmail.com>
Message-ID: <CAK7LNAQvgT=OWVuBVrvgdZ7AAkoaV_K_Y+w9bOFxRPw_1TOSUA@mail.gmail.com>
Subject: Re: [PATCH 00/16] x86, crypto: remove always-defined CONFIG_AS_* and
 cosolidate Kconfig/Makefiles
To: Ingo Molnar <mingo@kernel.org>
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
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 NeilBrown <neilb@suse.de>, dri-devel <dri-devel@lists.freedesktop.org>,
 "H . Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>,
 Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>,
 X86 ML <x86@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, intel-gfx@lists.freedesktop.org,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Yuanhan Liu <yuanhan.liu@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Borislav Petkov <bp@alien8.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Jim Kukunas <james.t.kukunas@linux.intel.com>,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ingo,

On Wed, Mar 25, 2020 at 1:59 PM Ingo Molnar <mingo@kernel.org> wrote:
>
>
> * Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> > This series of cleanups was prompted by Linus:
> > https://lkml.org/lkml/2020/3/12/726
> >
> > First, this series drop always-on CONFIG_AS_* options.
> > Some of those options were introduced in old days.
> > For example, the check for CONFIG_AS_CFI dates back to 2006.
> >
> > We raise the minimal tool versions from time to time.
> > Currently, we require binutils 2.21
> > (and we plan to bump it to 2.23 for v5.7-rc1).
> >
> > After cleaning away the old checks,
> > as-instr calls are moved to Kconfig from Makefiles.
> > (patch 11)
> >
> > This allows more Kconfig / Makefile cleanups.
> > Patch 12 is complex, but I double-checked it does the equivalent.
> >
> > Patch 14 bumps the binutils version to 2.23,
> > and patch 15 removes more CONFIG_AS_* options.
> >
> > I folded all relevanet patches into this series,
> > as suggested by Jason A. Donenfeld.
> >
> > If x86 maintainers take care of this series, that's good.
> >
> > If it is OK to queue this up to Kbuild tree,
> > I will send a pull request to Linus.
> >
> > Thank you.
>
> LGTM. I've got these four from Jason A. Donenfeld queued up in
> tip:WIP.x86/asm:
>
>  bd5b1283e41c: ("crypto: Curve25519 - do not pollute dispatcher based on assembler")
>  829f32d78588: ("crypto: X86 - rework configuration, based on Kconfig")
>  95ef9f80ed63: ("x86/build: Probe assembler from Kconfig instead of Kbuild")
>  1651e700664b: ("x86: Fix bitops.h warning with a moved cast")
>
> I suppose these might interact (maybe even conflict), and are topically
> related.
>
> Would you like to pull these into the kbuild tree? You can find them in:
>
>    git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git WIP.x86/asm
>
> Thanks,
>
>         Ingo


I did not know that these had already landed in tip tree.

They are immature version.
(In fact CONFIG_AS_CFI and AS_ADX are false-negative
if GCC that defaults to 32-bit is used.)

Can you simply discard the WIP.x86/asm branch,
and only reapply
1651e700664b: ("x86: Fix bitops.h warning with a moved cast")

?


-- 
Best Regards
Masahiro Yamada
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

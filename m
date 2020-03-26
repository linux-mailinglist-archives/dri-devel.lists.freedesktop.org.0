Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 696D6194A43
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 22:13:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7924A6E05D;
	Thu, 26 Mar 2020 21:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from conssluserg-01.nifty.com (conssluserg-01.nifty.com
 [210.131.2.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F238E6E05D;
 Thu, 26 Mar 2020 21:13:16 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id 02QLCubn023761;
 Fri, 27 Mar 2020 06:12:56 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 02QLCubn023761
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1585257177;
 bh=yUWTDQTSG+CELwmMJY3M4PyyjvvHxAi5WzaSE/lWqWs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=02ax5uD7o97ywHVTM+BzqvV5KxZq7HYns7pOohZvn/H/gS5KFk5dbFbsxwdf2UO4S
 1vqgsJtvu7G6cL6QxIOeeAfB7udsm/QfTFmvxTfuFM4wBO/O48Zk7DfzdkY6eJcLqZ
 IYWMLO9qD356FZlV4oG/s8OoRqthhbrehJW26Vcszqfnjt/CzHVWfnd/4452UUWixv
 BUNH6/d9yw/4kHTvTVnv/QzWGiv0H4p/k0G64hu8GCyt6Nv0WvyS4X5BxKhmC981/N
 xLS1cNma8U/X2FiQX7Cf+UbsbUdRi74RlEOVV/aDPSaYzz5d/uHwb4vaz8fAJ8XJJ5
 UsXN64bnn8b1A==
X-Nifty-SrcIP: [209.85.222.49]
Received: by mail-ua1-f49.google.com with SMTP id l18so2727667uak.4;
 Thu, 26 Mar 2020 14:12:56 -0700 (PDT)
X-Gm-Message-State: ANhLgQ0jhwtHxDrQQ81Dpf0dfykd3AwZ/5DPs/os6xW/ctyceuLUqvMR
 8BVx9cVcblsIP2lWX2NPQ+tMMdVu3iuTtvwwBFk=
X-Google-Smtp-Source: ADFU+vt/pF+IMJk2I2eYB42/QwdxfxYfeO3mcmt/FNF9nUsRTsBXsBiH5xt4Zbky0X6BnYqInbOxR2tZvNrmVUvbcYI=
X-Received: by 2002:a9f:28c5:: with SMTP id d63mr8552249uad.25.1585257175580; 
 Thu, 26 Mar 2020 14:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200326080104.27286-1-masahiroy@kernel.org>
 <CAHmME9pnAvgErYkcvvdakvfMY8ZGKfwHHNYzpVtJ913Tgp16CQ@mail.gmail.com>
 <20200326092213.GA100918@gmail.com>
 <CAK7LNAQ7-wpm+g=cXeJ01vGrO1nVjfP-ornKm=SXoDEn4x+DjQ@mail.gmail.com>
 <CAHmME9qnWWYV+eWVmx2yoADB9oecZKj=UgLkdSHe_=MnxedtSQ@mail.gmail.com>
In-Reply-To: <CAHmME9qnWWYV+eWVmx2yoADB9oecZKj=UgLkdSHe_=MnxedtSQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 27 Mar 2020 06:12:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQNx0TxWGCzNM-2JqfEJuyDKnLMcqJv8Be_9_Ty5wv5Lg@mail.gmail.com>
Message-ID: <CAK7LNAQNx0TxWGCzNM-2JqfEJuyDKnLMcqJv8Be_9_Ty5wv5Lg@mail.gmail.com>
Subject: Re: [PATCH v2 00/16] x86, crypto: remove always-defined CONFIG_AS_*
 and cosolidate Kconfig/Makefiles
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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
 "H . Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>,
 X86 ML <x86@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, intel-gfx@lists.freedesktop.org,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Yuanhan Liu <yuanhan.liu@linux.intel.com>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Borislav Petkov <bp@alien8.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Jim Kukunas <james.t.kukunas@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 27, 2020 at 5:46 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Thu, Mar 26, 2020 at 2:44 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > I collected more Reviewed-by and Acked-by,
> > then pushed this series to
> >
> > git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
> > kbuild-asinstr
>
> But not the version of the penultimate patch that Nick ack'd....

Dropped Nick's Reviewed-by.


-- 
Best Regards
Masahiro Yamada
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

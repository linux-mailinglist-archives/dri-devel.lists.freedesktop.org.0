Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2067C194962
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 21:44:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AB446E921;
	Thu, 26 Mar 2020 20:44:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from conssluserg-05.nifty.com (conssluserg-05.nifty.com
 [210.131.2.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF8D06E921;
 Thu, 26 Mar 2020 20:44:28 +0000 (UTC)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id 02QKht1E008132;
 Fri, 27 Mar 2020 05:43:56 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 02QKht1E008132
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1585255436;
 bh=6HJwRTaLrQez1RAJvnsU1ylf9hNXRZ8k4BSgYFgJ22k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=T0Y1kMBwFGoCVnrYmgbljc8dGfYYmNn1y5912DRfmdrZ52tovyg2MebhB9htlrcek
 EBCBHT4EkxUxjtN+Pocobt56tKzjylF44IAR3wNgt+rElQrG49wtEG/SGzDIh07Nmb
 1vD0ZIWdhyCGUMFZyWwXA/liOP3cPEIwOQNV/ZH/tKdrUzOGWGbsYwxKYVkTJGBksY
 ohv/3vYXBVSBzbzyhVspvaJ8oVdHuojxS2Ka7r7osBRYu0OeTcH+dYykPSI9i3CLRo
 cMuBpo8cWrm0kOxa58lZQpGC0tzA3oZc6DzUSx7qeiYiQkY8PxkZbMDdKLCG6egLsJ
 1ab1uBfbtdgkw==
X-Nifty-SrcIP: [209.85.222.43]
Received: by mail-ua1-f43.google.com with SMTP id y17so2669111uap.13;
 Thu, 26 Mar 2020 13:43:55 -0700 (PDT)
X-Gm-Message-State: ANhLgQ1RlZ5XV5cuhN4y+ZjJJzOiyf8n5pHr18q3kbeG+LxR9XBAJEOn
 3AUDl5TKAGNxaVwhf4VlEO9ZOFBdvj+u0vrl0/E=
X-Google-Smtp-Source: ADFU+vtsUXD+aSP8lpvYCbKxZbqHSpDlYx8uyE46+TTsrnTO4BDwceM64UJEqOELPHKlfLTGso2KU8OCkIQLa5hZG1I=
X-Received: by 2002:ab0:2085:: with SMTP id r5mr8287832uak.95.1585255434710;
 Thu, 26 Mar 2020 13:43:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200326080104.27286-1-masahiroy@kernel.org>
 <CAHmME9pnAvgErYkcvvdakvfMY8ZGKfwHHNYzpVtJ913Tgp16CQ@mail.gmail.com>
 <20200326092213.GA100918@gmail.com>
In-Reply-To: <20200326092213.GA100918@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 27 Mar 2020 05:43:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ7-wpm+g=cXeJ01vGrO1nVjfP-ornKm=SXoDEn4x+DjQ@mail.gmail.com>
Message-ID: <CAK7LNAQ7-wpm+g=cXeJ01vGrO1nVjfP-ornKm=SXoDEn4x+DjQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/16] x86, crypto: remove always-defined CONFIG_AS_*
 and cosolidate Kconfig/Makefiles
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 NeilBrown <neilb@suse.de>, dri-devel <dri-devel@lists.freedesktop.org>,
 "H . Peter Anvin" <hpa@zytor.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Jonathan Corbet <corbet@lwn.net>, X86 ML <x86@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 intel-gfx@lists.freedesktop.org,
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

Hi all,

On Thu, Mar 26, 2020 at 6:22 PM Ingo Molnar <mingo@kernel.org> wrote:
>
>
> * Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> > Very little has changed from last time, and this whole series still
> > looks good to me. I think I already ack'd most packages, but in case
> > it helps:
> >
> > Reviewed-by: Jason A. Donenfeld <Jason@zx2c4.com>
>
> Acked-by: Ingo Molnar <mingo@kernel.org>
>
> > Since this touches a lot of stuff, it might be best to get it in as
> > early as possible during the merge window, as I imagine new code being
> > added is going to want to be touching those makefiles too.
>
> I'd argue the opposite: please merge this later in the merge window, to
> not disrupt the vast body of other stuff that has already been lined up
> and has been tested, and to give time for these new bits to get tested
> some more.

I agree.


> Also, please get it into -next ASAP, today would be ideal for test
> coverage ...

I collected more Reviewed-by and Acked-by,
then pushed this series to

git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
kbuild-asinstr

It will show up in -next soon.


-- 
Best Regards
Masahiro Yamada
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

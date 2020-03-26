Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 725F6193B9F
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 10:20:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA506E89B;
	Thu, 26 Mar 2020 09:20:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6201B6E8A2;
 Thu, 26 Mar 2020 09:20:24 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id m3so6129338wmi.0;
 Thu, 26 Mar 2020 02:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QMCowoi/JCe2v265QDbm4p0VWyPtNcTvLQEymboWLVk=;
 b=RX5mdPiGXyfiPKfLphcwrDBi/peU3SRPc7ZGMrTb/Lqfw5UgtRSTdH91h+70066QSC
 pP/ZHueo0A+c2VE90+X8dHKj3RlwOXug4g/YAbDWlmKY39FtPZUup4CBm3d3ZB4WSKjR
 0Huosrm//+PuSEoUBMz87vDYm1X12Mc+oGDi7+6T1B67NT8uWqaZaiJ3FcOHvTmVvv6S
 eZ2W1Tvhym1i2jFVx2NsZrf7q1CPuiwf72Cu0d8tW+Puw87y8oVvdM83FKXgxpa9mT7b
 af7m9ubE+9gkC/qaffhOvx4OugsY5bB0Kao9ZPWQ8vc6qWAwB58n97v5dvbVrwPS6VaA
 bR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=QMCowoi/JCe2v265QDbm4p0VWyPtNcTvLQEymboWLVk=;
 b=E2NSOBSNjq8ZNSHmYXKhuGc+lrQc3tVn7pjgPsWbOMNaoF6CAexJCu1KuQm5rq/iy9
 DbiDWOrwsw+qY5J6I21AuCaKF12rRgxNLqPtkbP+BmFOfiP0R3bRiByrpYifqG3D8xqh
 Ego0OYWo/X7/2I+vjc/y+pe/KKXCIR2CVbZsM6gzizPxYg44FZYyfQeHBeT81ji4LTlX
 LciA8ChkIDOonX8xy8z6fBw5fxuo4yhI39/k/DloTzQMSc66oAkKPQZyqOc2zy6wUX+b
 B64R/y4ixCvBGMNMtyjovZHaEk2f2AeVdE7gWbuzaqXGmxlgtLRqMjHj7I5UyfW6uySY
 1+cg==
X-Gm-Message-State: ANhLgQ0q59Q5l3h+QHyZcIDAM0GLfqslWwKRwU/tkrl45x5j3YNwAtx9
 mOo2IZrl/7Xt/BlKJgcTjss=
X-Google-Smtp-Source: ADFU+vuo5kkY6YJNmSthEGmulf1OSYWdFlZ4mkUhgBR28ala97SVa+B34f0Sizj5koNYygjLIKM3Ew==
X-Received: by 2002:a1c:a950:: with SMTP id s77mr2082562wme.176.1585214422984; 
 Thu, 26 Mar 2020 02:20:22 -0700 (PDT)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
 by smtp.gmail.com with ESMTPSA id v26sm2742597wra.7.2020.03.26.02.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 02:20:22 -0700 (PDT)
Date: Thu, 26 Mar 2020 10:20:19 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 00/16] x86, crypto: remove always-defined CONFIG_AS_* and
 cosolidate Kconfig/Makefiles
Message-ID: <20200326092019.GA100058@gmail.com>
References: <20200324084821.29944-1-masahiroy@kernel.org>
 <20200325045940.GA24974@gmail.com>
 <CAK7LNAQvgT=OWVuBVrvgdZ7AAkoaV_K_Y+w9bOFxRPw_1TOSUA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK7LNAQvgT=OWVuBVrvgdZ7AAkoaV_K_Y+w9bOFxRPw_1TOSUA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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


* Masahiro Yamada <masahiroy@kernel.org> wrote:

> > LGTM. I've got these four from Jason A. Donenfeld queued up in
> > tip:WIP.x86/asm:
> >
> >  bd5b1283e41c: ("crypto: Curve25519 - do not pollute dispatcher based on assembler")
> >  829f32d78588: ("crypto: X86 - rework configuration, based on Kconfig")
> >  95ef9f80ed63: ("x86/build: Probe assembler from Kconfig instead of Kbuild")
> >  1651e700664b: ("x86: Fix bitops.h warning with a moved cast")
> >
> > I suppose these might interact (maybe even conflict), and are topically
> > related.
> >
> > Would you like to pull these into the kbuild tree? You can find them in:
> >
> >    git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git WIP.x86/asm
> >
> > Thanks,
> >
> >         Ingo
> 
> 
> I did not know that these had already landed in tip tree.
> 
> They are immature version.
> (In fact CONFIG_AS_CFI and AS_ADX are false-negative
> if GCC that defaults to 32-bit is used.)
> 
> Can you simply discard the WIP.x86/asm branch,
> and only reapply
> 1651e700664b: ("x86: Fix bitops.h warning with a moved cast")
> 
> ?

Sure, done!

In case you need any x86 maintainer acks for your series:

  Acked-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

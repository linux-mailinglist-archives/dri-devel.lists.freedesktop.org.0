Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E3C192048
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 05:59:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A1906E05F;
	Wed, 25 Mar 2020 04:59:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3E56E05F;
 Wed, 25 Mar 2020 04:59:45 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id a25so1345250wrd.0;
 Tue, 24 Mar 2020 21:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=h4KOauMe4v1I9pCuRQdOG97Qu/heRc/6J7SU7o8yNwE=;
 b=eym7r4h8AfIsMrgo04iccRS6vIxpRq/GGv4kov4LTgdKGrwEQ7NH5p96msOECxq/Km
 PFH2vIUzNv06GEqB6wtynYt0kuEoT8qZihcaMl24tj6Tk2AOfzlAwPrvl42qfw4f+4BA
 mwcxhRe6qd2i16ficvpLPTPPUAmI6dbtwnpkduuMnFQJMWXpnkJIG2YpPdAjQzG+7JD2
 /LEVW3fOt4bpK1vkzUH2I7xJO0pGRlO83VAENk6A01kvSi5QthsmEOPPw1IAF2Pn84tP
 Nn4vjTJJXt8B1LyLl6/HuK93OxneZMzcfL27zwzGfymxQnQYiRkIQ5350pLXWmGqam49
 sR4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=h4KOauMe4v1I9pCuRQdOG97Qu/heRc/6J7SU7o8yNwE=;
 b=GxlZgwoa1vC5ZtPkDq0TFpdoqh4EZ/pUkIyHjuQ/u6rfQa6rdCtxgSmlnw0utueVES
 8gJI6DEST6lBTpgnGI81kks5go2pqzeSfcaDBlHH6Mr5kBGQCs+Bc2F8Aj1Rco8Inel6
 rrOkSInYUcRccH7O9uQXzzEOOHBo3B7RWNkfmEMq23u3gvdSQ6+k8cSHwJWD/aArQ+ic
 MCit+equFjnQf3MhmxgW1ZgM165lrejoDWPBibhLCJLSPx5W/TsJjb5xzLz4KBKPs6Ds
 8CsluqfcczHF0wau4c6CPtlsit8VIWM8Py8iX2zyH/9SSvUtW2jdEVYyxFoFSbQXCstZ
 rGsQ==
X-Gm-Message-State: ANhLgQ32y9L+/iyfzSXAHmUYJx+AcxWd8PM4EMWy7o0h6CNFBFmKB4d8
 lXw5Z/fBHmQ/VzeOwzyHWJo=
X-Google-Smtp-Source: ADFU+vsMr8RTd3Hle0zy0eB1BsZBBUecnZChYZPKh6yx0k9aeumjW3wG1yR68IBbypixPwr4XlixZw==
X-Received: by 2002:a5d:474b:: with SMTP id o11mr1225073wrs.4.1585112383933;
 Tue, 24 Mar 2020 21:59:43 -0700 (PDT)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
 by smtp.gmail.com with ESMTPSA id p16sm7149295wmi.40.2020.03.24.21.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 21:59:43 -0700 (PDT)
Date: Wed, 25 Mar 2020 05:59:40 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 00/16] x86, crypto: remove always-defined CONFIG_AS_* and
 cosolidate Kconfig/Makefiles
Message-ID: <20200325045940.GA24974@gmail.com>
References: <20200324084821.29944-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200324084821.29944-1-masahiroy@kernel.org>
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
Cc: linux-doc@vger.kernel.org, NeilBrown <neilb@suse.de>,
 dri-devel@lists.freedesktop.org, "H . Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <a.p.zijlstra@chello.nl>,
 Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>,
 x86@kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, intel-gfx@lists.freedesktop.org,
 linux-crypto@vger.kernel.org, Yuanhan Liu <yuanhan.liu@linux.intel.com>,
 Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Borislav Petkov <bp@alien8.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com,
 Jim Kukunas <james.t.kukunas@linux.intel.com>,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


* Masahiro Yamada <masahiroy@kernel.org> wrote:

> This series of cleanups was prompted by Linus:
> https://lkml.org/lkml/2020/3/12/726
> 
> First, this series drop always-on CONFIG_AS_* options.
> Some of those options were introduced in old days.
> For example, the check for CONFIG_AS_CFI dates back to 2006.
> 
> We raise the minimal tool versions from time to time.
> Currently, we require binutils 2.21
> (and we plan to bump it to 2.23 for v5.7-rc1).
> 
> After cleaning away the old checks,
> as-instr calls are moved to Kconfig from Makefiles.
> (patch 11)
> 
> This allows more Kconfig / Makefile cleanups.
> Patch 12 is complex, but I double-checked it does the equivalent.
> 
> Patch 14 bumps the binutils version to 2.23,
> and patch 15 removes more CONFIG_AS_* options.
> 
> I folded all relevanet patches into this series,
> as suggested by Jason A. Donenfeld.
> 
> If x86 maintainers take care of this series, that's good.
> 
> If it is OK to queue this up to Kbuild tree,
> I will send a pull request to Linus.
> 
> Thank you.

LGTM. I've got these four from Jason A. Donenfeld queued up in 
tip:WIP.x86/asm:

 bd5b1283e41c: ("crypto: Curve25519 - do not pollute dispatcher based on assembler")
 829f32d78588: ("crypto: X86 - rework configuration, based on Kconfig")
 95ef9f80ed63: ("x86/build: Probe assembler from Kconfig instead of Kbuild")
 1651e700664b: ("x86: Fix bitops.h warning with a moved cast")

I suppose these might interact (maybe even conflict), and are topically 
related.

Would you like to pull these into the kbuild tree? You can find them in:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git WIP.x86/asm

Thanks,

	Ingo
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

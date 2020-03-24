Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C47601916FD
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 17:52:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3066E4F3;
	Tue, 24 Mar 2020 16:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649706E4CA
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 16:52:13 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id z3so21457043edq.11
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 09:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WsR634IM9mmhNsoHiRslx4q1ur3OKG9sqLOfW3mTlvE=;
 b=Z4pJJsNRptNjfG3P3MoBuNrYlnzenPIYlkT2d80DcIZW7UeaJ7NzLHI1ja4yIjcDoc
 /iKfJJvm1iYP31UYLTqjCrBqL5Uar8necO8dCIgcOuI51Nj7AidT3P8YaYaCV6jUFzMJ
 fsKqZJnyfGhT7+0lEb4rByJaviH4S/tML+mT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WsR634IM9mmhNsoHiRslx4q1ur3OKG9sqLOfW3mTlvE=;
 b=liF0YwmptDH/0NHVn1TV0FX50BKz/WHkoyujBtKprpBeybT2cGAYIZdGq7STnWwvnW
 vwfUuExFOAI2VqoOUDcRcBXw+DsJ348ladKp26/ri0ArYhXSCjxchldCZum6rdXj31uZ
 SkJ0ZLZt0EOzf9iXYe1VYAcutajwogiqm8aKMseLGeFuxNxIHmLfmERzaVt+4u8QEx2r
 S2IYh/TcVzd8fIUPb7NfQHiWO+C7aYM+x8BI2RqVMsW3BkWaIU1pf0BW3/1ROdCR3mdF
 tyMxowSAjVQO+KEAmfoGfCiZUW91cFNa8qQb5mqiUphDtwxUIbQumLFHzsFjaCy/KfBs
 XaCw==
X-Gm-Message-State: ANhLgQ2gNNJe3NK2mbf6TAkw9kOL4Q6cgKcdO/QeznwTbISjSYOuv0nM
 6JomDMzlxa448ZP08vYOPsmuuW1avDU=
X-Google-Smtp-Source: ADFU+vtH51ifepb+p0uSUXOMaWcRc1A5cfzRd63FJ9dRwsa/SlckZBmyKAuSf+kn+tpg+wTtjuSN+Q==
X-Received: by 2002:a17:906:1c55:: with SMTP id
 l21mr2474416ejg.333.1585068730534; 
 Tue, 24 Mar 2020 09:52:10 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com.
 [209.85.221.44])
 by smtp.gmail.com with ESMTPSA id m4sm1366801edq.23.2020.03.24.09.52.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2020 09:52:09 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id p10so9978267wrt.6
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 09:52:08 -0700 (PDT)
X-Received: by 2002:a05:6512:10cf:: with SMTP id
 k15mr17550349lfg.142.1585068727556; 
 Tue, 24 Mar 2020 09:52:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200324084821.29944-1-masahiroy@kernel.org>
In-Reply-To: <20200324084821.29944-1-masahiroy@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 24 Mar 2020 09:51:51 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjEi4VoT8qkBhrBtdZ27shyrPwo0ETpuOdxk5anHtQqhQ@mail.gmail.com>
Message-ID: <CAHk-=wjEi4VoT8qkBhrBtdZ27shyrPwo0ETpuOdxk5anHtQqhQ@mail.gmail.com>
Subject: Re: [PATCH 00/16] x86, crypto: remove always-defined CONFIG_AS_* and
 cosolidate Kconfig/Makefiles
To: Masahiro Yamada <masahiroy@kernel.org>
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
 "H . Peter Anvin" <hpa@zytor.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Jonathan Corbet <corbet@lwn.net>, the arch/x86 maintainers <x86@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 intel-gfx@lists.freedesktop.org,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Yuanhan Liu <yuanhan.liu@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Borislav Petkov <bp@alien8.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Jim Kukunas <james.t.kukunas@linux.intel.com>,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 24, 2020 at 1:49 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> If it is OK to queue this up to Kbuild tree,
> I will send a pull request to Linus.

Looks fine to me, assuming we didn't now get some confusion due to
duplicate patches (I think Jason got his tree added to -next already).

And yeah, that end result looks much better.

             Linus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

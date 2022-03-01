Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C884C7FF1
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 02:02:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D15A10E170;
	Tue,  1 Mar 2022 01:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE3D10E16C
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 01:02:48 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id f8so7823195edf.10
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 17:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ud5/y/EBwvp8QN7vw5ZxaiWuDsWQaCGba2UHh4N4mec=;
 b=QDNLH8KOj2N5elfQIiFc9ZMVPG667ughU6MItd4VPmNt6fV069Cvzy3GNDu1LboIOU
 /ukem7qn980/nnuqsEKTwz+sJAAGQSBr/OuNtNkm7jqBwkXZFdDq4KuXeUYSVdjS5Ygf
 UbLkNglYiw3uAvK1jhMlolPsp6Bm5sW2kE0eY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ud5/y/EBwvp8QN7vw5ZxaiWuDsWQaCGba2UHh4N4mec=;
 b=Vi8w8iHhTNZj9QfPrbSB1XlEPFaV6OfGx4wOwdS4aYsQ42JR4Z7PWVJWf59rSx2Zky
 hiI+2rNKepgtorw+GuDusGoKKINNclOcEpWcGOz4TUe+smW5Foc3nQkpogpVeP8gKBZK
 WAyIe8OdJ1YbnB0iSoyvgVr8QhlbGZ+UPgJCECz34as/BPsKVYVs/raAsTha87l5InuH
 ppBih2hhzrxqAh01x4Rq+i+MrKz7p8ty6j7XnqzPDRm97hxO6HMzPjqfqkzwmZoj9uXx
 UFHxk2Fb66nd/eBZLe3ibP+TiRSW9RWFqhmQmgTUhXCk4Q8o4QMYTabtogC7DL6Gworv
 qF5w==
X-Gm-Message-State: AOAM530Yd06HXGIkTx02PyjQF4zp2wBT1MMXdjl99BQFgQ3oFHZosJRS
 9VXBeycrHpMunUItWMqj7CvsEhmkGx+VXW0xohE=
X-Google-Smtp-Source: ABdhPJwbDaow2dHSSf2OlBIGM4BJ60E8BlPf4ygCUhCARKyYZaOQFnbF3QQS8fSWq6HpzTx8zgZGAA==
X-Received: by 2002:aa7:c446:0:b0:410:9a8e:9b85 with SMTP id
 n6-20020aa7c446000000b004109a8e9b85mr21653363edr.319.1646096567092; 
 Mon, 28 Feb 2022 17:02:47 -0800 (PST)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com.
 [209.85.218.53]) by smtp.gmail.com with ESMTPSA id
 v4-20020a170906338400b006d5aca9fc80sm4801891eja.106.2022.02.28.17.02.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 17:02:46 -0800 (PST)
Received: by mail-ej1-f53.google.com with SMTP id hw13so28262340ejc.9
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 17:02:46 -0800 (PST)
X-Received: by 2002:a2e:aaa2:0:b0:244:bf42:3e6e with SMTP id
 bj34-20020a2eaaa2000000b00244bf423e6emr16240083ljb.176.1646096101617; Mon, 28
 Feb 2022 16:55:01 -0800 (PST)
MIME-Version: 1.0
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <282f0f8d-f491-26fc-6ae0-604b367a5a1a@amd.com>
 <b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
 <7D0C2A5D-500E-4F38-AD0C-A76E132A390E@kernel.org>
 <73fa82a20910c06784be2352a655acc59e9942ea.camel@HansenPartnership.com>
 <20220301003059.GE614@gate.crashing.org>
In-Reply-To: <20220301003059.GE614@gate.crashing.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Feb 2022 16:54:45 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgLYqYcw0xv65xrLSR7KDpS_6M+S9737m6NQorHGWsXYQ@mail.gmail.com>
Message-ID: <CAHk-=wgLYqYcw0xv65xrLSR7KDpS_6M+S9737m6NQorHGWsXYQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
To: Segher Boessenkool <segher@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>,
 samba-technical@lists.samba.org, linux1394-devel@lists.sourceforge.net,
 drbd-dev@lists.linbit.com, linux-arch <linux-arch@vger.kernel.org>,
 CIFS <linux-cifs@vger.kernel.org>, KVM list <kvm@vger.kernel.org>,
 linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, linux-staging@lists.linux.dev,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 intel-wired-lan@lists.osuosl.org, kgdb-bugreport@lists.sourceforge.net,
 bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 Linux PM <linux-pm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, v9fs-developer@lists.sourceforge.net,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sgx@vger.kernel.org,
 linux-block <linux-block@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
 linux-usb@vger.kernel.org, linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
 tipc-discussion@lists.sourceforge.net,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 dma <dmaengine@vger.kernel.org>, linux-mediatek@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 28, 2022 at 4:38 PM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> In C its scope is the rest of the declaration and the entire loop, not
> anything after it.  This was the same in C++98 already, btw (but in
> pre-standard versions of C++ things were like you remember, yes, and it
> was painful).

Yeah, the original C++ model was just unadulterated garbage, with no
excuse for it, and the scope was not the loop, but the block the loop
existed in.

That would never have been acceptable for the kernel - it's basically
just an even uglier version of "put variable declarations in the
middle of code" (and we use "-Wdeclaration-after-statement" to
disallow that for kernel code, although apparently some of our user
space tooling code doesn't enforce or follow that rule).

The actual C99 version is the sane one which actually makes it easier
and clearer to have loop iterators that are clearly just in loop
scope.

That's a good idea in general, and I have wanted to start using that
in the kernel even aside from some of the loop construct macros.
Because putting variables in natural minimal scope is a GoodThing(tm).

Of course, we shouldn't go crazy with it. Even after we do that
-std=gnu11 thing, we'll have backports to worry about. And it's not
clear that we necessarily want to backport that gnu11 thing - since
people who run old stable kernels also may be still using those really
old compilers...

            Linus

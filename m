Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E4BA9F7C3
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 19:54:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9433B10E64A;
	Mon, 28 Apr 2025 17:53:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="zJ7QVyCj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8607310E64A
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 17:53:53 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5e8be1bdb7bso8091834a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 10:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1745862832; x=1746467632;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cELG0a2mXl5N6mpi0+RLp319EHg3sGhSPY6U6Zc2/4k=;
 b=zJ7QVyCjdpzHwc+N6NuZFku5Lxvz0KR3zaxBDcXfzhrW0mPLpZjHf7WhnlPZydJGnw
 mQEi5Tr+Aka2EOnKAG8BMUT0KdwT4+P8arH+eYl57RO6lfqYY9p9ON9qy3yKc7i3AKu0
 bmT8lIiYALrgGMfV+sF2Ifr/wG1v3CCTHji95NgTu43gf9Pd2nSj2M0UQ/50tNxdDY0V
 +o0Nze99qMddJcUy6AK7RicFZqTzt9hTsauIyByqz+qeLhhE3j8WQg72zperGYr1kvYu
 C12P30Rl+ZL6Q1l9MUSJoRm4/XW3uPS5w5ig1UIupmMGuw/xp+QcDbU8yJxsjEFtN5lW
 uPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745862832; x=1746467632;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cELG0a2mXl5N6mpi0+RLp319EHg3sGhSPY6U6Zc2/4k=;
 b=LS3v0vpKfPd+NpeGahY6LZNv+XtJnDZ4ypsrlSq19cVMKjB898Nwd88wZCJ5GySzQw
 N1ZGTBfjFB7mCzV71byvI3QlS//xQaPDSShkCaudvknVHDWS7wJ/aPjnFtsaKBIx/dTY
 zOF9MAXZhr15cN1PmZWUyToJJQ1abzMVQi/eybnDrshe+GhWBR2F5N/tUHXEnYyHzX7g
 f/8nWzejAtJ6PcpRaVGiV/Y9QpfN6pEsVGg0fSxh8Zzu5lmWzq39Nh1a4Qr8l+GC0o9j
 nXxj4vC4aFG3cBcu+T2JTHSextECCO1Olv6wD84KOtKrguC/pNONo3kl+RLgwndhVGtQ
 QTCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7hU4OjI27NOrtDaEzcr3mp677CBiZKM3fopUo/PEAlakjxwJ/FMPIVD5JK2IrGKDBLK+XVr5oarA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/HklmsKipmTTeTwIezYN4qGoqv1bn2WLgUCB92at0q3962OsG
 Cs0+7TH63jH6gqzWfryn4SZcNKp0FhGjOs47K3S3T+DeHoelo7AItOA66+ocmF0FCrqZAF4tQlr
 XA4LMp4Dmpiho331MsOQw8PTGWbMn2iiObqc=
X-Gm-Gg: ASbGncvwUnzTrmBEDrUUUjspfJog10Ft637tn+e9mUCz2ZMnTyyuzSTcHGxx/f2aP0L
 nx0Y02aDWvt4di41Zh0ZaW8gqUGa72kb7Zh9V79jiWCkcw6qtPA1XZx8Td9ZDYY4x8NqljYf8n7
 sioYa1ubQJTVFLZ385jCM=
X-Google-Smtp-Source: AGHT+IHqIg2Loa+Y0QKSG8YxCDTk31ezU03P7AATW+Z/1ns4Jt8XF4Ad3BTyh3bkX7w/0eQbixiiXnU4rTOZoxrjc1Q=
X-Received: by 2002:a17:907:7d8a:b0:ac6:fec7:34dd with SMTP id
 a640c23a62f3a-acec6c67f34mr8894566b.52.1745862831882; Mon, 28 Apr 2025
 10:53:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wiq=E0fwJLFpCc3wPY_9BPZF3dbdqGgVoOmK9Ykj5JEeg@mail.gmail.com>
 <CAHk-=wip2-yTrWpAkrUQ0iejEo2PjReddu4xntwBvdnSvWDbzg@mail.gmail.com>
 <20250426200513.GA427956@ax162>
 <CAHk-=wgPCbZv0JgqoNWMOO+p=N772YW16xYk_pmb1GU7aeuPFA@mail.gmail.com>
In-Reply-To: <CAHk-=wgPCbZv0JgqoNWMOO+p=N772YW16xYk_pmb1GU7aeuPFA@mail.gmail.com>
From: Bill Wendling <morbo@google.com>
Date: Mon, 28 Apr 2025 10:53:34 -0700
X-Gm-Features: ATxdqUEJVTdPbMJGumIpmgzZbU1wN2Zlt9jaYxbaWMUYvK-iFBpwnq2gM8nUxXs
Message-ID: <CAGG=3QWKQ++Yhh0w8zJobs=C4M7F01doAw9t2h=f2W9wxSG3Mw@mail.gmail.com>
Subject: Re: clang and drm issue: objtool warnings from clang build
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Justin Stitt <justinstitt@google.com>, 
 "the arch/x86 maintainers" <x86@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 26, 2025 at 1:57=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sat, 26 Apr 2025 at 13:05, Nathan Chancellor <nathan@kernel.org> wrote=
:
> >
> >     KBUILD_CFLAGS +=3D -mllvm -trap-unreachable
>
> Hmm. That certainly builds for me, but yeah, it generates new objtool
> warnings, notably
>
>    panic() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>
> and I *think* that is because that flag makes clang not honour our
> *explicit* "this code is unreachable" annotations.
>
There's also this flag:

  -mllvm -no-trap-after-noreturn

Here's the documentation for both flags:

static cl::opt<bool>
    EnableTrapUnreachable("trap-unreachable", cl::Hidden,
                          cl::desc("Enable generating trap for unreachable"=
));

static cl::opt<bool> EnableNoTrapAfterNoreturn(
    "no-trap-after-noreturn", cl::Hidden,
    cl::desc("Do not emit a trap instruction for 'unreachable' IR instructi=
ons "
             "after noreturn calls, even if --trap-unreachable is set."));


Could you share how you configured your build?

-bw

> So now objtool complains about the fact that clang has generated some
> random code that follows a call to 'panic()' even though objtool knows
> that panic() cannot return.
>
> And those explicit annotations definitely should be honored.
>
> IOW, there's a *big* difference between "the programmer told me this
> is unreachable, so I won't generate code past this point" and "I have
> decided this is undefined behavior, so now I won't generate code past
> this point".
>
> So what I'm asking for is absolutely not "trap on unreachable". That's
> wrong and just plain stupid.
>
> I'm asking for "trap on UD instead of *assuming* it's unreachable".
>
> Because clearly that code *can* be reached, it's just doing something und=
efined.
>
> See? Big big difference.
>
>              Linus

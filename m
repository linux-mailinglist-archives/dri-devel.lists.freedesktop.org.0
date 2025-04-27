Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF54A9DE0A
	for <lists+dri-devel@lfdr.de>; Sun, 27 Apr 2025 02:31:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE0E10E35E;
	Sun, 27 Apr 2025 00:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="GPHAiVq+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E0C10E35E
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Apr 2025 00:31:25 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5f6214f189bso6696187a12.2
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 17:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1745713884; x=1746318684;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kFnF6XQXyjuHCzFQmPZ6cMo/XgSLXx5JlYecXTeUa1Y=;
 b=GPHAiVq+dVpzaO6XuHZg049M6PGsoWvS9/8Cx3gckjggrGGmlV78cD3HCFLIWj7rEh
 4SKnNyTmrxWjB4fk3SIRsEplU/Gk30zK6eQN8U98o0RJIGFqSX4XA74TUGXCOwvx49it
 W7CMXdZNDFd5MIphHFNYR23b5O54PpOZagaFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745713884; x=1746318684;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kFnF6XQXyjuHCzFQmPZ6cMo/XgSLXx5JlYecXTeUa1Y=;
 b=tWtHm2lj7rjFiQ6Qb7lPJilCkBGPvtPxZn4pQ0dJFvegtDQPogkkHFhUlesPJ6ZE09
 oeybHtcviO2PdCLH0O+f5FboPp7pyRf53zM2AmEQVSj7JYD3x/vrYMCGJ2FGSu7ScZ8+
 TthgrghxqzW6tlRDlt09wAMFlq5bMGdf4SZji4A4izcjMtEC6T0LlKIqS6mRFgT6igZF
 wYz3hXX1qHum7AldHrEoZy3tZYno7BAKu0xgmqmIlat75V21fkbk+9L079WhMf9eS/9G
 QV/IJlw4SiryNVXHS2Bk1m/BlpCOvqPPIxZ8k65vzFWG7FMV0IhOp77NHij+vPv/KJfT
 4HNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRaMtlyU/g9ZlJnFMZZDzQ81ZwEPx1bUFYCapb6LCk6yABjm34wrOGibI9TQO2cxXauMJ3uWqLNeA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUHxGsKL5V6UsNmGi1289BXzroP79dWjDFQFgN8USkdZYpNfAx
 3d0YedHxrJgBsWNCn78qmQTkAmVs3mCfvNrwvMTRUfBpCwsTX8hcg+/4/QSOUdRdgZBCGxXDdAm
 ZgVvKlA==
X-Gm-Gg: ASbGncu+Se+wOq4iJaaziToBjTkMYBcmzySiR/UM/BE+Qq4U1fBy5LSvICFukYgyHkc
 PKbMyU3V2AlkLEpZCLNdugqDZrQyt0VWQnCcDEvZsZI9HgytVVe0Wlt4o40kd6mZnGmLC/1Os3P
 P1A+S1WM8D8ycqCwUL8xC7Phx45exdb2JCGNWqPQTI6HBJqjNrY81ZwKFgLGBlEDNq1V/r0PLBC
 SiiUEbzj9l4q4XTHuh1qpV1+rWdyUjqA1R3UFskqIz7ZQllGziy2Xe1BOgNielE+XrCz2RHKtVb
 lhGYbO3CQNIZkOqTYPjrk743hhRxPhGkfHnCVEq9mjfExUkoRWBjaLGPoBrPnsoUaTWhe0QPSVt
 Sueueo1E9vs/3Q5A=
X-Google-Smtp-Source: AGHT+IH7OSTGrNnsS1JO+PdJl2bHACdktwS011jmZUWW559Nc48UeDBNPIpeLPY0AwZNsGhjzrMc+g==
X-Received: by 2002:a17:907:6e90:b0:ac3:bd68:24f0 with SMTP id
 a640c23a62f3a-ace739dd0a4mr593885966b.7.1745713883620; 
 Sat, 26 Apr 2025 17:31:23 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com.
 [209.85.218.53]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6ed6fe65sm363372766b.142.2025.04.26.17.31.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Apr 2025 17:31:22 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-ac3eb3fdd2eso618503066b.0
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 17:31:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXkykEof85FTTe42WdEKpKBHewta16/UaIZqa3XyuXgTIorn3VYLWDj4bUembmsUiis6GWg9454GH4=@lists.freedesktop.org
X-Received: by 2002:a17:907:944a:b0:ace:3a90:77 with SMTP id
 a640c23a62f3a-ace73b23775mr666667966b.48.1745713882190; Sat, 26 Apr 2025
 17:31:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wiq=E0fwJLFpCc3wPY_9BPZF3dbdqGgVoOmK9Ykj5JEeg@mail.gmail.com>
 <CAHk-=wip2-yTrWpAkrUQ0iejEo2PjReddu4xntwBvdnSvWDbzg@mail.gmail.com>
 <20250426200513.GA427956@ax162>
 <CAHk-=wgPCbZv0JgqoNWMOO+p=N772YW16xYk_pmb1GU7aeuPFA@mail.gmail.com>
 <20250426232344.GA1395819@ax162>
In-Reply-To: <20250426232344.GA1395819@ax162>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 26 Apr 2025 17:31:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wha-AgeeqATWRrKuopM4fKhhF_tZE_raQM77qO7Zd3fOQ@mail.gmail.com>
X-Gm-Features: ATxdqUG4kycEbobY8t6qpPfU6v6hZ5LAqpyt3P0fzgjGlYoNIvpe5smXYXHg7i8
Message-ID: <CAHk-=wha-AgeeqATWRrKuopM4fKhhF_tZE_raQM77qO7Zd3fOQ@mail.gmail.com>
Subject: Re: clang and drm issue: objtool warnings from clang build
To: Nathan Chancellor <nathan@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
 Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 "the arch/x86 maintainers" <x86@kernel.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 26 Apr 2025 at 16:23, Nathan Chancellor <nathan@kernel.org> wrote:
>
>  Pardon my ignorance though, isn't something like this
> basically just '-fsanitize=undefined -fsanitize-trap=all'?

Sure. Except -fsanitize=undefined is a horrible horrible thing.

Why? Because it pointlessly adds code to *look* for undefined
behavior, which is only extra overhead.

I)OW, if we have a divide, just *DO THE DIVIDE*. Don't some extra
pointless code to "is the divisor zero, and trap if so".

Because dammit, that's what the divide instruction ALREADY DOES.

The whole concept of "use undefined C behavior to change code
generation" is complete and utter BS. It's wrong. It's stupid. And a
compiler shouldn't do it.

The argument for it is "once it's udnefined, I might as well optimize
it away". But in reality, that argument is pure garbage.

It's garbage for several reasons:

 - there's no real life optimization to have in practice. You aren't
actually improving code generation.

 - there are real and serious downsides in security, and this case is
an example of that very issue

 - the historical reason for most C undefined behavior DOES NOT
ACTUALLY EXIST ANY MORE.

Nick Desaulniers recently pointed me at a paper that is worth reading
by any compiler person:

   https://web.ist.utl.pt/nuno.lopes/pubs/ub-pldi25.pdf

which backs me up on that "UD optimizations aren't actually optimizing
anything" thing.

So please. Clang people need to get a clue. Yes, we care *deeply*
about performance in the kernel, but a C compiler that thinks that
using UD to generate "better" code is a disgrace and pure garbage.
Because security matters a whole lot too, and the downsides of turning
undefined behavior into random garbage are about a million times
bigger than the "I can remove one integer instruction for zero gain".

For the kerrnel, we want to disable absolutely all undefined behavior
crap ideas by the compiler. It's why we use -fwrapv and have for
years. It's why we disable the idiotic "strict alias" stuff that
should never have become part of C. And it's why I want that "turn UD
into unreachable" mindfart fixed.

The notion of "optimizing" unreachable code is crazy. And the notion
of thinking that "UD means unreachable" is so incredibly insane that
any compiler person that thinks it is reasonable should have his head
examined.

               Linus

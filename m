Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF429E8180
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2024 19:19:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A168810E2C0;
	Sat,  7 Dec 2024 18:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="XSI2PA0O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C35710E2C0
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2024 18:19:53 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a9e44654ae3so500924066b.1
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2024 10:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1733595592; x=1734200392;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hz+XAesKzHzZKAdlmXfk5ETHyOV9LQeE1EOaQCTU32k=;
 b=XSI2PA0Opxdi6pI+unCK++Fy8dE64FJF4i4vt4Mcai56YyvCzsaO7yQWUMzB9JyOIG
 kk1ZpvsYnZNlP5Vqkn8ct3C56HvrWTK7mg0R9zCIOT7MHI+3MJFs752rC6i+QHXnn9xs
 iPbGAVrw4zYCuqi0Ysl2lvNc0m4/3Wr/tjrbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733595592; x=1734200392;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hz+XAesKzHzZKAdlmXfk5ETHyOV9LQeE1EOaQCTU32k=;
 b=keEcVBU67Ti9BW6sgHqS0xVYcXi1mcnd7OfKvmIYhgZXPqy1K/uzKxCVFoftwZXtPN
 UkC93atDn5yi9WucyZ/JY3wz7+GLK6gHqjF/HJGwmVIA5+is8cZZ7tsHzRiQQ7L7IRrK
 IF+sENE5JwBHCtBYC5I5P+eufNybTn1S26qJe8FLg0z4zvwVVtTOHgr7sA1ED9bF2hh+
 kaIZeoAgE19P14eHazUjhLnr9lWeCP8yOxblh1Ugr1kfYLpazmHVKKJ1ZsCO33CKR2Fp
 rWBMo0NW6ji2GQWkR0agbNJCVNo25wNZx/9TSIFrPWoq3K/kGMyxnWHSu9v9cIfnUm9O
 hZbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWShgA3COaS5APvDva4S3XTQdWR0w2jlT5URhV6jGiDqnNITwFWR/hcLdTAqzR/+ZK3UmD+/NjHlXE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBKqNw//BaoJbrHbWpWoKSGDMp16UH/JGh5tkYoEGGyYM+7l3C
 xk58XR2oXPC/Q6M5Vg5yokr5BRJoZEDQaQjFpWBivNIoIJ0MY69jpKWYU4qtJ0WmuH7kElSAksQ
 mMCXkMw==
X-Gm-Gg: ASbGncvFi2Xo4iBU3OwZz/YdLNdJ++m3pch5GTSmnA+jF7rvQvwJxTMM8EsoPDwDdYE
 cWwo6b7YzQN/0+7qgkfgNshSoaNM0mAa7KVa+YIoFQ9YX6XmpKbMzXC0Q/LkAZURDW+PFhQNt5C
 xMo2X/J/d8r8JOTqECk8+RxyY08xaL7eoUqFrXsauvYhehd/4w9zYWYBKxKs+T8Oam/fuiJjOLT
 DfQYf1Lmb80KDR29XpAmOl2q6x3HQb/GZ3SVbsgOd7tWZz+nG102knqCCiZ5RbzXtdghbDbS0df
 KTb4fVkP6x5k+DBtru1d3R2n
X-Google-Smtp-Source: AGHT+IEQtjniDaDLmLAT/bcoS+MOZQuue0V8Nm8Eel6JoFROkjB4ItBXlkZuBUhBAZTTBjWEccSUXA==
X-Received: by 2002:a17:906:9c1:b0:aa6:21ce:cde0 with SMTP id
 a640c23a62f3a-aa639fb2f18mr619756466b.12.1733595592250; 
 Sat, 07 Dec 2024 10:19:52 -0800 (PST)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com.
 [209.85.218.47]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa651cf4a83sm115913966b.62.2024.12.07.10.19.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Dec 2024 10:19:51 -0800 (PST)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a9e44654ae3so500921566b.1
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2024 10:19:51 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWT/LRnm9D6whuUA1v2Zie1XohhePhd87jkkENQLsHyshkW2vckpEgcsfnltd0ak1DQnLjNMc8nIYo=@lists.freedesktop.org
X-Received: by 2002:a17:906:1db1:b0:aa6:3de7:f258 with SMTP id
 a640c23a62f3a-aa63de7f394mr497786166b.37.1733595590996; Sat, 07 Dec 2024
 10:19:50 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com>
 <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com>
 <CAHk-=wjmeU6ahyuwAymqkSpxX-gCNa3Qc70UXjgnxNiC8eiyOw@mail.gmail.com>
 <CAMZ6Rq+SzTA25XcMZnMnOJcrrq1VZpeT1xceinarqbXgDDo8VA@mail.gmail.com>
 <CAHk-=wiP8111QZZJNbcDNsYQ_JC-xvwRKr0qV9UdKn3HKK+-4Q@mail.gmail.com>
 <d23fe8a5dbe84bfeb18097fdef7aa4c4@AcuMS.aculab.com>
 <CAHk-=win8afdcergvJ6f2=rRrff8giGUW62qmYs9Ae6aw=wcnA@mail.gmail.com>
 <0f5c07b827c3468c8fa3928a93a98bfa@AcuMS.aculab.com>
 <e806dd51b1ac4e289131297fbf30fc37@AcuMS.aculab.com>
 <CAMZ6RqLOR3aCRW_js2agV+VFiHdazb4S2+NdT5G4=WbDKNB8bA@mail.gmail.com>
 <b1ff4a65594a4d39b2e9b8b44770214e@AcuMS.aculab.com>
 <CAMZ6RqJFReLJTd-O8s02oQNeB0SPQh3C-Mg+Nif5vMB9gFtQww@mail.gmail.com>
In-Reply-To: <CAMZ6RqJFReLJTd-O8s02oQNeB0SPQh3C-Mg+Nif5vMB9gFtQww@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 7 Dec 2024 10:19:34 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjpN4GWtnsWQ8XJvf=gBQ3UvBk512xK1S35=nGXA6yTiw@mail.gmail.com>
Message-ID: <CAHk-=wjpN4GWtnsWQ8XJvf=gBQ3UvBk512xK1S35=nGXA6yTiw@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of
 __is_constexpr()
To: Vincent Mailhol <vincent.mailhol@gmail.com>
Cc: David Laight <David.Laight@aculab.com>, "w@1wt.eu" <w@1wt.eu>, 
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
 Justin Stitt <justinstitt@google.com>, Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, 
 "linux-sparse@vger.kernel.org" <linux-sparse@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>, 
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "coresight@lists.linaro.org" <coresight@lists.linaro.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "uecker@tugraz.at" <uecker@tugraz.at>
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

On Sat, 7 Dec 2024 at 04:24, Vincent Mailhol <vincent.mailhol@gmail.com> wrote:
>
> > No good - expands everything twice.
>
> And? __is_const_zero() does not evaluate its arguments, so no side effect:

No, the problem is literally the expansion.

Double expansion of these fundamental helpers gets exponential,
because they are used in various nested ways in other fundamental
helpers.

That's why we then spent so much effort on trying to clean up the
min/max macros, because a single line of code would expand to
literally tens of megabytes of horrific expansions.

And the problem with these things is that you can't make them inline
functions, so they have to be macros, and then you build up other
macros using them (like that "clamp()" macro), and it really gets
horrendous and affects the build time.

And yes, it is very sad. Particularly since a compiler would have a
really easy time with some nice helper builtins.

Of course, often the compiler *does* have helper builtins, but we
can't use them, because they aren't *quite* the right thing. Like that
"__builtin_constant_p()" not actually working for some situations
where we absolutely need not just a constant value, but a constant
_expression_ due to C parsing rules.

Quite a lot of the pain we tend to have with these things is directly
related to the fact that we often want to do these tests in contexts
like global array initializers etc.

If there is one feature of C I would have liked it is "allow inline
functions and statement expressions with constant arguments as
constant expressions". Other languages have done that, and it really
does help. And yes, it means that you have to basically have a
language interpreter in the compiler (you do want to allow loop
constructions etc), but it really is very useful.

Oh well. Even if compilers added that today, it would be years until
we could take advantage of it.

At one point I literally was thinking I'd do 'sparse' as a
pre-processor for kernel code, in order to have extended language
facilities like that.

            Linus

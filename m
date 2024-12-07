Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2889E81FA
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2024 21:35:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307E410E136;
	Sat,  7 Dec 2024 20:35:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Yms+nVYg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F26710E136
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2024 20:35:11 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2ffc357ea33so28087421fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2024 12:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1733603710; x=1734208510;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HiZTKf4hCKQ8GKQ+oAO9V4GLtbxeasgvzn3MVqs40sY=;
 b=Yms+nVYgx7KMKiUohL8rP7HH9j1P3QRl4ptfSJIfWiggV8EyDYDfiz/znMxoUbHWql
 Tjh09O2bFgpdxG+FN+KECKNO1z7NSFRE/q/ljzOfICS+BFtcNPexr0af78odkcRm9Iph
 36PkTXXtUor3uAF7OyEKPCmjRPwFDE/qtXj28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733603710; x=1734208510;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HiZTKf4hCKQ8GKQ+oAO9V4GLtbxeasgvzn3MVqs40sY=;
 b=kgRXLIBDBOftwege6ERxHgVQUvvlolJk8AszYnlaE4rEA4qkA7VNohTFFbNXaCVrfL
 gZxLUwBOCpkGOnVoSaelsm9yZIUq9TCJXBlZrwUATXCQg9FAi2PYVg3Cr7StSJ0OQTDK
 BX1YPgs54SEYBna31jUXXiy7EI+KQwuTmxsavLk80V3UFs5QmkBsnNNlQMkZqohzYmPb
 BUh6Wl/zyy1LKJ7hcgagsBlgtNl67cYEIAGTHgri7kT/ZgIyUBw59uqgDG9hkAan0os0
 vTo73e9prwBDNAluEKLJcybOsNIU9m48x+F2ZplxzpOhmohA4TSQqGXrdDtHrn24yRBT
 9Hjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2WyaUIORFj4/F3vy2rYAelRqa01t/+KEkLDAm4EjqngZDa8rFpDqs+uo+hUYr0z60EOwlLiPnVJk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnAuuNTAgvSO5wdehAaHJ4a2AzkIhWdS5i5klXrbjcQBwZawWo
 r5lv8ZnLhwT3mhAmoGfA8gBj6Ysrw8XVJHWsvAsFg3pASz4k4mAzUgZZ47ctOcUXn8QY9Kh2UkE
 JOOpbdQ==
X-Gm-Gg: ASbGncsG+reIRxvtUJXRAdl+Nqo7daxyVF+r6cuZq8oy1IPxZRt2tEpU41ZyPmcJvf+
 7tgcWF6Je1FyhRUhoFkOkxHbZPySyKzD+3rx7ZqQtVnaiKq8RpuEa83Z1UzxcghAdUDql/jdCRR
 3zcT55lYUrOX2tJy7Wf6MI1/0CNnTRX8RpW0seAPCbC2pnBCAkQNr8fuW5dm9j9ipFmU/K+LOGZ
 a0uim9exwmUdERZ2yNLrOhfzAcobqRyMqW/WVEI3NRkYbVnMpVwW53Zj+wTxyy94RnyZExGdHBK
 fYTYGj0QTzehb6475WJ8TL4Q91iB
X-Google-Smtp-Source: AGHT+IHbcr3vNXPy/SiVzwDl3T4bgzd0cqy1RT5/XbIiz/gOY8kc+ccx35tjaftdttFqLiRr+51B9g==
X-Received: by 2002:a05:6512:281e:b0:53d:d486:9705 with SMTP id
 2adb3069b0e04-53e2c2b19a3mr2300947e87.9.1733603709561; 
 Sat, 07 Dec 2024 12:35:09 -0800 (PST)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
 [209.85.208.173]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53f5e219f6bsm193815e87.248.2024.12.07.12.35.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Dec 2024 12:35:08 -0800 (PST)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2ffc357ea33so28087171fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2024 12:35:07 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVfHBsskxKO4lPWrzQzJahIbjUAPpOmKC2n2+yJIVtY2ME34jjhmcX0AF+xEjgC0lq/YV1Taj+6sy4=@lists.freedesktop.org
X-Received: by 2002:a17:906:5a52:b0:aa5:3853:553d with SMTP id
 a640c23a62f3a-aa63a21b715mr608706066b.46.1733603329136; Sat, 07 Dec 2024
 12:28:49 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com>
 <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com>
 <abdd7862f136aa676b2d2c324369f4a43ff9909c.camel@gwdg.de>
 <CAMZ6RqKzGiRNMeLsQKRNrxvW_bXB-kEi11udQ82kKX6tGCrqcg@mail.gmail.com>
 <9607300dfca5d71ca9570b1e1de0864e524f356b.camel@gwdg.de>
 <344b4cf41a474377b3d2cbf6302de703@AcuMS.aculab.com>
 <9a0c041b6143ba07c2b3e524572fccd841f5374b.camel@gwdg.de>
 <CAHk-=wjpVXEjX16PP=-hi4CgLqEGJ_U-WvKWq+J3C+FW-hSSfg@mail.gmail.com>
 <0a2996a7c63930b9d9a8d3792358dd9e494e27c1.camel@gwdg.de>
In-Reply-To: <0a2996a7c63930b9d9a8d3792358dd9e494e27c1.camel@gwdg.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 7 Dec 2024 12:28:32 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjsfYYKBYuW8_6yKjdwHih0MMa2GwUJh_LHcuUNFR7-QA@mail.gmail.com>
Message-ID: <CAHk-=wjsfYYKBYuW8_6yKjdwHih0MMa2GwUJh_LHcuUNFR7-QA@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of
 __is_constexpr()
To: Martin Uecker <muecker@gwdg.de>
Cc: David Laight <David.Laight@aculab.com>,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
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
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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

On Sat, 7 Dec 2024 at 11:19, Martin Uecker <muecker@gwdg.de> wrote:
>
> But that all seem solvable issues on the compiler side.

You know, there was a whole *architecture* that was designed and
predicated on "it's all solvable on the compiler side".

That architecture was pure and utter *shit*.

Because no, it's not solvable on the compiler side.

Getting things like value range analysis right on the compiler side is
fundamentally hard.

It's hard to the point where either you only get it for the simple
cases - yes, I can show you a ton of real code where it's trivial - or
you need to have explicit markings in the source code to help the
compiler, and then you end up having to have the compiler (or some
other tool) validate those with asserts or whatever.

And random asserts ARE NOT ACCEPTABLE in the kernel outside of pure
debug builds.

They may be acceptable in most other situations, but in a kernel you
can't just say "we stop now because it turns out the analysis was
broken and the manual notes could be fooled by an attacker".

Now, would we want to have proper value *static* range analysis in the
kernel for other reasons? Oh yes. It would often be very nice to have
the ability to state "this value is trusted and is in this range", and
have it percolate all the way down, both for optimization purposes but
also for various sanity check purposes.

But it's simply not sanely available in the generic case.

> a) this is not guaranteed in a specific situation (-Wvla-larher-than)

We'd either get horrendous numbers of false positives that we then
have to manually add special code for, or

> b) transform the array automatically to fixed size array
> of size X *or* something smaller when it can show this.

we'd just do this by hand *once* and for all, and say "VLA's didn't work out".

So yeah. We did (b) by hand.

We used to have VLA's in the kernel. It was a disaster. We got rid of
them, because the (big) pain wasn't worth the (few) places it was
actually useful.

So we have been VLA-free for the last five years, and it's been good.

Simplify.

             Linus

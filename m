Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5044B9E8188
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2024 19:26:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E14910E651;
	Sat,  7 Dec 2024 18:26:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CBXlt5pi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F57310E649
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2024 18:26:22 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5cf9ef18ae9so7321394a12.1
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2024 10:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1733595980; x=1734200780;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=V/vNc5nALUWVUmfD8b/aC22BtPTbXjUkByw6MJHP530=;
 b=CBXlt5pig+jy2tGD+D60k4ivVtRCyKTjkZaLtB0MDPBmPDLupC4JJmJzoCsZQxyxe2
 waqIJ71bW5O/7s5Sdi0jQvg4rgBULVhh3rIhRAtmW+2J2wFY7KWtYEMyYh8bYToaVRMo
 b98D0gAcCawIcukXJ/iA6hQ9Hb7O9UHFNHEZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733595980; x=1734200780;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V/vNc5nALUWVUmfD8b/aC22BtPTbXjUkByw6MJHP530=;
 b=PvBHp0iyTSoVFbNRfVLXvBHmJCbzIYJ8Yn16i+ID4Ko/fescxeW8Vo81FrW3DAhi4S
 amgS9ZXefE8UNdedp0m0hWzdrUkycIgqilyICaycSrxcLUyXsbASYpMxFqMSKVu9O/Mx
 7FTqK83e8A/c8LL0qZRT4BGRVlzt8Qn9iiSJqxH/yt+FABTeHQ5DA3VsUK6tdQYOwvjS
 xU39jX9puHbu6kBTuJPtCqoVoDz7my1i+1VdPV1kMPQvsx9Y+5P5k+RovJ4yOgyvfSh7
 sTqeX5/3wow2gY6qjJUDf2m44LMVoy+6sIH6KqLvHG9jeTJzX5OWBGQYmdb4GqBNufN7
 0QBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcfKCFaD4Cz8L6CfcsK5dht2PErewnlnKitRzjFkD+p28jyGVKY2qz1OkqQmLjUrrs+SXSUFIuHbc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzegZfSjFPKqr17PdhwoJSfP+STZGovY3FwI3wdSVLCLfwYJ7+v
 4pwRYQJAhV6rZNq5q2K/TmIKAOf7gdrUJ65s5TDArE9G0thsCUqe6ZzYpy886LTp34wj8m3Ftee
 TXllJbQ==
X-Gm-Gg: ASbGncsr9OxF6gJkBwwOiQ0cynz+Loh+TAOEOzr8Oi93DmE469RPqynQbsxreamkHJg
 XjcJiglk2+5QH3UZvcBNcYkpUu3OsClRFZJVw3F5tLS+qKzTb/xnzh4Y84r7YuOHhHUZav2D6qN
 AfJtwyr79Wq2NBvugh+84nz/frgYQMd+M4pC9GS7GG0LM6W7EcQbDa3FqGR1mgEKIeTe0jo1riu
 YbpJiCtkva87zVERGBmRuWYZowcAgd5U5AhhiZq8NWVAIHb0Yq4OwQEdnR3UskvvMhwVQkq0nyg
 WmM/sL1cvM45wdrVE7dfmO7H
X-Google-Smtp-Source: AGHT+IHrp14C+ZmCvbt/sL2JgYapNbkJaK6S1NrLhZXZS7KPL0XepfR8eu9SKf4J/8+6lyvL41CezA==
X-Received: by 2002:a17:906:4795:b0:aa5:53d4:8876 with SMTP id
 a640c23a62f3a-aa6219e17c8mr966520766b.20.1733595980259; 
 Sat, 07 Dec 2024 10:26:20 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com.
 [209.85.218.52]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa62608f507sm412862766b.150.2024.12.07.10.26.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Dec 2024 10:26:18 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-aa662795ca3so73005466b.1
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2024 10:26:18 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVt1RY+W1jQoTdkoMCxqvZIbH2asLRdS1xoTbiC+Wxi74DzNmzTU1NDy5A84nWCTJnBM2IDY9OSong=@lists.freedesktop.org
X-Received: by 2002:a17:906:32c2:b0:a9e:85f8:2a3a with SMTP id
 a640c23a62f3a-aa6373494a2mr765427966b.2.1733595978237; Sat, 07 Dec 2024
 10:26:18 -0800 (PST)
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
In-Reply-To: <9a0c041b6143ba07c2b3e524572fccd841f5374b.camel@gwdg.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 7 Dec 2024 10:26:01 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjpVXEjX16PP=-hi4CgLqEGJ_U-WvKWq+J3C+FW-hSSfg@mail.gmail.com>
Message-ID: <CAHk-=wjpVXEjX16PP=-hi4CgLqEGJ_U-WvKWq+J3C+FW-hSSfg@mail.gmail.com>
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

On Sat, 7 Dec 2024 at 05:07, Martin Uecker <muecker@gwdg.de> wrote:
>
> VLA use *less* stack than a fixed size arrays with fixed bound.

Not really. You end up with tons of problems, not the least of which
is how to actually analyze the stack size. It also gets *very* nasty
to have code that declares the VLA size using an argument that is then
checked afterwards - and if you have a strong preference for
"declarations before code", you end up with *horrific* issues.

And even if you are super-careful, and you solved the analysis
problem, in practice VLAs will cause huge stack issues simply due to
code generation issues.  The compiler will end up doing extra
alignment and extra frame handling and saving, to the point where any
advantages the VLA would bring is completely dwarfed by all the
disadvantages.

We went through this. We are so *much* better off without VLAs that
it's not even funny.

Now when the compiler says "your stack size is big", you just look
"Oh, that struct should be allocated with kmalloc, not on the stack".
Boom. Done.

            Linus

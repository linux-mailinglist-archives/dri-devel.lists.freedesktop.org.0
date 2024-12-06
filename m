Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 233DE9E6736
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 07:15:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD5310E1EE;
	Fri,  6 Dec 2024 06:14:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="MioVsOp4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE3E910E1EE
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 06:14:56 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-aa5325af6a0so262853766b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 22:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1733465694; x=1734070494;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lkINBrTDhyE0tcSEzrQhWY00f3rEWU+OMRPtBhc6Jxo=;
 b=MioVsOp4TA30sZXabrPRApVFMg87IuczSNhVIfeNSom7lyODzpoffs8WVlSsz2JB8t
 5M1TaYvl+SRTQDDUy7Vz4iTDMMeMuektwArt7Sg4HjVYIQWDXlNqiY+7SJzw2PW4t8fq
 99M0nbWqLyE+mp2OQ1xI/tGK84KMQ3eShSjy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733465694; x=1734070494;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lkINBrTDhyE0tcSEzrQhWY00f3rEWU+OMRPtBhc6Jxo=;
 b=fbHMDRyxTODaUeLgh48DdBQdFDwmxGq2vIqfFfG1HERKYbAWCb6uhqIy4MdP96plbj
 b9bkwxAEUj/373XnNV5ahJTNF4RL9fYplNRaBc9wowPDsx7BXIHbb/4KwpoVTPrF/yny
 N4++b78r5PGV48vhPus9TdH2sx70vzvv5jZV3zI5p09d07OQ7a4V1Q1L+6MLyUA7K30o
 e2UzsSJSvfPy7s4eKAsj1H5p+wMGXUJd5bEuV6L2C1AtTW3qcilpgic0bG3tfLfs4Lg+
 9SlSVbzd/FcVQX67B9i2Cz6ckohaAmkmKiPW3mZ2pKcGrVnT7dABsFlMK6vtqtPohtys
 VrgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5+ezAsLe7GypSxpKdAGDjlZInvnRzUJ0BGAf0+mPP5RLvEUq2/pJ944q7EG/RSldo8W6KoCCW+3s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxaE8iwzgUlTVPms5OvtktvZBtTLCUVVyuMR6YoPy0fFOf7kbQi
 AO11ieHbLu+8OJS50yvu7QFeq3bAj0wpDixPCHjFwILeRtNgxTiaR5+TeCBlaPLaiXQHy8bI38W
 TUuN1aQ==
X-Gm-Gg: ASbGncuy9Dht+l8sK8LO5VDXwR28YP4kRpMeQIyDr8U2G8IedJJDScS+jeyChM9OYM8
 2TkA7NP5bTXgetpTTJB5dDZmFe0bytWzovDzXe7D4kCXIcQYAoiIw8b+iwK7Yje/inEiC2R6zv7
 Xin9dhv2mvXQywHXWDovdwwHLPRYsw/7wUPFk1Dfz+/teR/e23BAT1KBwh1jzW1lX3ivT+qUSyR
 DPkQqES0KyWuGpDIndwd18mU8AlnEQYkCbqNzRjpru1hB4OhBxrsnzUmTRtYEOjY4O2CVwtwckD
 6tTJ6Mgd4f24nIewKTD1s1lX
X-Google-Smtp-Source: AGHT+IH6Lq5nyH8paq6XCu3p8oytFERnnqDS3xDYjZma0MHwYgdwET37TIvf3koAz8viDoNgNEIPfQ==
X-Received: by 2002:a17:907:7809:b0:aa5:2575:e75d with SMTP id
 a640c23a62f3a-aa639fb0e31mr134071966b.2.1733465694571; 
 Thu, 05 Dec 2024 22:14:54 -0800 (PST)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com.
 [209.85.218.45]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa625eee788sm187027266b.91.2024.12.05.22.14.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Dec 2024 22:14:52 -0800 (PST)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-aa5f1909d6fso327253066b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 22:14:52 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWuAH8R0s1lDJVjAGPoBm5dchrRozUz1uquwi3GSsTqMBlsKUlEjJSuAtD5e8zaDniDBXDcGf8gKZQ=@lists.freedesktop.org
X-Received: by 2002:a17:906:1db1:b0:aa6:3de7:f258 with SMTP id
 a640c23a62f3a-aa63de7f394mr66959966b.37.1733465692215; Thu, 05 Dec 2024
 22:14:52 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com>
 <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com>
In-Reply-To: <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 5 Dec 2024 22:14:36 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjmeU6ahyuwAymqkSpxX-gCNa3Qc70UXjgnxNiC8eiyOw@mail.gmail.com>
Message-ID: <CAHk-=wjmeU6ahyuwAymqkSpxX-gCNa3Qc70UXjgnxNiC8eiyOw@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of
 __is_constexpr()
To: David Laight <David.Laight@aculab.com>
Cc: Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
 Martin Uecker <muecker@gwdg.de>, 
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

On Thu, 5 Dec 2024 at 18:26, David Laight <David.Laight@aculab.com> wrote:
>
> From: Vincent Mailhol
> > ACK. Would adding a suggested--by Linus tag solve your concern?

I'm genberally the one person who doesn't need any more credit ;)

> I actually suspect the first patches to change __is_constexpr() to
> use _Generic were from myself.

Yes. And David was also I think the one who suggested something else
than "!!" originally too.

I may have liked "!!" for being very idiomatic and traditional C, but
there were those pesky compilers that warn about "integer in bool
context" or whatever the annoying warning was when then doing the
"multiply by zero" to turn a constant expression into a constant zero
expression.

So that

  #define is_const(x) __is_const_zero(0 * (x))

causes issues when 'x' is not an integer expression (think
"is_const(NULL)" or "is_const(1 == 2)".

Side note: I think "(x) == 0" will make sparse unhappy when 'x' is a
pointer, because it results that horrid "use integer zero as NULL
without a cast" thing when the plain zero gets implicitly cast to a
pointer. Which is a really nasty and broken C pattern and should never
have been silent.

I think David suggested using ((x)?0:0) at some point. Silly
nonsensical and complex expression, but maybe that finally gets rid of
all the warnings:

     #define is_const(x) __is_const_zero((x)?0:0)

might work regardless of the type of 'x'.

Or does that trigger some odd case too?

            Linus

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF979E7863
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 19:58:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E384310F167;
	Fri,  6 Dec 2024 18:58:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="B8q0x+x/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9466510F178
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 18:58:11 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-53de8ecb39bso3259342e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 10:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1733511489; x=1734116289;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WGtbOaTCTsAvyUDr9a4PNqlmY0QlpNlNkPLsZ0+zYxc=;
 b=B8q0x+x/2k/lR6a+2ZiQl2WTFLzI2SmC6ygBVe7FFBwdkQHXOd0Yc2xjLxtyQ5gKOI
 9yHBRvM84YxWDlCqcEj/Jc1P9h5cfeOER55jSBvkpa4cPIVq+iIKlfol9xHmo2cp1CSC
 EmJ/ymKc97TEwrPep8QrTMXTzF3NoQUkU1drM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733511489; x=1734116289;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WGtbOaTCTsAvyUDr9a4PNqlmY0QlpNlNkPLsZ0+zYxc=;
 b=w+d4Uz4Qr4AVXVNt0Z7jMSu9hVoaP8npUOGjGNQwNkIj1DQHMmIR7/MyZfFjwlKNO1
 zSE7DcVzpNNCvBkyGEK+IP5uyRJZr8fLrrDm+fhh2sH+E3bK4eKBji4S/Rf2wisgknaN
 aoqy7A1dqcFUC/bExmGP4suTU5uvqdEuJ9wrBRTr3kExYiI8TFJQ/vQRRbIjER8pcOaF
 P4DGN4x0gypzOCTYtv7dmQLgdBgerwp/xYooLntJOr86xHVcGJKyYwxMKEdv1g7vkmKX
 n+Q6oL65f3hzUsWcc1sOYes4ziocFmaZ0QTGs3ONfarUyFXE8ogdTS/JLf3tkPSCv4CX
 lQuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/7DaaP18sMVfFKcKCFSKX8pMppMtD7LlMpq3TN8UrVTOQWrqa/eINBR5cqGuM7ImCh8GbX4Ezf34=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxhfs760DryP2kiDwJCsCEel2b+tds9Q96bVl2ICpq++VKJKI7t
 z4zheNdUc+owMP9hInLe2hIuKmtCnJ+ci9E2T7OXkp+gdz91WTGzoyTqUJQVFR2UbTll0BzqYcj
 LgMrN9A==
X-Gm-Gg: ASbGncvwpRokDnfeX4B6CKjEu6pANTS8hhW010xR7QUgxTqhLArPT2g4Wz+F54AqcL5
 5Y5kkTTGm482TSPktwdZpCaNtmhbsXb4hui621FnhlGs/Tr3lsnLRIjC1s3J8peN2I+lKrPlaGS
 yfL4WVS0DtkwWf6SapL2618GZMjUHOfIr/Y9OIqlezvouQvpRT0b4ikhX8Qo3NmxCX9waSdGTYN
 ThIf2QYJlcKseFiLXdiUvTPBfBndET5PpLeIKpvwU3J9s2VS2D7YjxTFwO8hqccGBqze4Hv7t9n
 J1U+GYQ6sK5aGqDyW16jBfxj
X-Google-Smtp-Source: AGHT+IEWn0nkGdfVMeNxJ7EFmhN6WNukb3qRP3/O9jFryQykukNPOUYsBRSrxP/BrEnM9UPk6Wee7A==
X-Received: by 2002:a05:6512:10ce:b0:53d:ea3c:2ba0 with SMTP id
 2adb3069b0e04-53e2c2b663bmr2827485e87.16.1733511489241; 
 Fri, 06 Dec 2024 10:58:09 -0800 (PST)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
 [209.85.167.49]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e229bae3bsm571716e87.127.2024.12.06.10.58.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Dec 2024 10:58:08 -0800 (PST)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-53e28cf55cdso1746601e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 10:58:07 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWITyglAiWB61tnFnHSsYpWB3g1peVs8B+17tp6SjTrAd+ZhOFH7R1axSTyOzJYpgE4JrPZKpCgRX4=@lists.freedesktop.org
X-Received: by 2002:a17:906:1ba2:b0:aa5:451c:ce1e with SMTP id
 a640c23a62f3a-aa63a0aa48amr290776466b.32.1733511169269; Fri, 06 Dec 2024
 10:52:49 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com>
 <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com>
 <CAHk-=wjmeU6ahyuwAymqkSpxX-gCNa3Qc70UXjgnxNiC8eiyOw@mail.gmail.com>
 <CAMZ6Rq+SzTA25XcMZnMnOJcrrq1VZpeT1xceinarqbXgDDo8VA@mail.gmail.com>
In-Reply-To: <CAMZ6Rq+SzTA25XcMZnMnOJcrrq1VZpeT1xceinarqbXgDDo8VA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 6 Dec 2024 10:52:32 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiP8111QZZJNbcDNsYQ_JC-xvwRKr0qV9UdKn3HKK+-4Q@mail.gmail.com>
Message-ID: <CAHk-=wiP8111QZZJNbcDNsYQ_JC-xvwRKr0qV9UdKn3HKK+-4Q@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of
 __is_constexpr()
To: Vincent Mailhol <vincent.mailhol@gmail.com>
Cc: David Laight <David.Laight@aculab.com>, 
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
 uecker@tugraz.at
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

On Fri, 6 Dec 2024 at 10:31, Vincent Mailhol <vincent.mailhol@gmail.com> wrote:
>
> > causes issues when 'x' is not an integer expression (think
> > "is_const(NULL)" or "is_const(1 == 2)".
>
> But 1 == 2 already has an integer type as proven by:

Yeah, I was confused about exactly what triggers that odd
'-Wint-in-bool-context'.

It's not about some actual bool type, it's literally a random
collection of integer operations used with logical ops.

So it's things like "!(var<<2)" that generate that warning, because
some compiler person at some point went "maybe that left shift should
have been just a comparison instead '<'".

But it turns out that "(var <<2)?0:0" _also_ triggers that warning.

End result: I have *no* idea how to shut that crazy warning up for
this case, if we want to have some generic macro that says "is this
constant". Because it damn well is perfectly sane to ask "is (a << 3)
a constant expression".

How very annoying.

This may be a case of "we just need to disable that incorrect compiler
warning". Or does anybody see a workaround?

             Linus

              Linus

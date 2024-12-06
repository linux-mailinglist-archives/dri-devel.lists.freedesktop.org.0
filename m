Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E749E7886
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 20:03:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D81710F18C;
	Fri,  6 Dec 2024 19:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="VCTgSnRj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E268A10F180
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 19:03:09 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5d10f713ef0so6315198a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 11:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1733511788; x=1734116588;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CnspTgT+QlMaq72RnxBUxeYja+eFoihpXPIoDsPSZVk=;
 b=VCTgSnRjjLwnmVdMCmVtHPdC85gtGD+q/+CYGyMEHfxrZ4bxLXeOVVFdRHv4bXLJ2G
 X4aXWILrKn6m33xLfLwsBvI5Dj2m8a3keuakKAx489eZmMfOWMf/5k6u7RZKDfL0nzNT
 BayNosPT8ey1u4Royn0TMC6pZsc32UzPoGsbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733511788; x=1734116588;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CnspTgT+QlMaq72RnxBUxeYja+eFoihpXPIoDsPSZVk=;
 b=wWnOwP4Ybi/LRIWoXj5VcxRTTr8bmsx7dWq+ZxUXa0fMScKp11zei91+3QMuu/N7r1
 +paNUTYcD7m086FYH+m6lO4p93cmFuVTRIWxiTuVvWFtNBEZ9Fwq+HQn5OLzzcbGMwBW
 6AvOiNX4JptLT029eKtURoIGBC+ecw3sL3XahbUC4ZAHNhR4ti1mnU8FfErzs2jvv4Zb
 cdmYvVxuWAMo/VXbyYry/G6zkr8wLzceGb662zo2+u/ChLTNYy7n4r4ucjtYY//Qmoan
 SsbqaWzXO+bDy3ee6+/nMBfbq1E5JV1FoJlglZNNkYCjBmlxi4v35C6yUn6egOeMar3z
 QkxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLIrZk7jtCEA1grjHjJlpzJm3HPh2r11jLFNaw+j8wTVk5uO9XwTrSqkjlzoqmidTzN/xLvbg8GG0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwB9Ilh+KobBYWRYB/6rJ7FSL/Qr77Ot2DpYckeCnCYIwch8/pT
 ac9u7LdQqkzpidfAuhH2q27ZZivbJZ2fIZF/aHPHCayt/gPYESosaRCExckJ6fltAyXiGp7a5l1
 6wQdKrA==
X-Gm-Gg: ASbGncvRrBNAavBZjceRi8Z3J1ulihOPnuzGGvkQAsnRu3rZy7LrW1oKr8weBxM1fpA
 7PuhwgtjWYYm2nTLCqQCYKs4hBLt677DXKAYAUYbdjw5QNEou6STHYXHLURGPy7EjyEGvcaay4h
 N5CQ517cFMn3rhFO0G2VlhXS8NPR1klM15BX0IRwyrG/jTT8JQFwtbarwrmcg/3KwD6tsK6DzkK
 gjZIK8Rfj1Ooytv2YiocInUNLsbHmHk8ABhnm+OVWCFL9DwI/izrnqsIr72HukVqJ6YxpQqhTgv
 q/SrfFUuGcH1ZrN5R9tzOpeI
X-Google-Smtp-Source: AGHT+IGSLdV4jJA0caPAsWT9YPVh3XXmaOViqTTIdY4A4PZAPIUyrpjEH90icHdDEsktRat0NILvfA==
X-Received: by 2002:a17:906:6a20:b0:aa6:42d8:afac with SMTP id
 a640c23a62f3a-aa642d8b471mr290131066b.15.1733511786438; 
 Fri, 06 Dec 2024 11:03:06 -0800 (PST)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com.
 [209.85.218.51]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa62602cf1dsm282223766b.129.2024.12.06.11.03.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Dec 2024 11:03:05 -0800 (PST)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-aa647af6804so71872866b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 11:03:04 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVAbcCoRia44RQ2UJ1NhlFuIjWFWoCOlluCUcVmQks7383IIFkC4XiJbChq2FBb+jaBn3m3Caz0Fbo=@lists.freedesktop.org
X-Received: by 2002:a17:906:9c18:b0:a9e:b5d0:4714 with SMTP id
 a640c23a62f3a-aa6375f5cd6mr310802966b.21.1733511783880; Fri, 06 Dec 2024
 11:03:03 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com>
 <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com>
 <CAHk-=wjmeU6ahyuwAymqkSpxX-gCNa3Qc70UXjgnxNiC8eiyOw@mail.gmail.com>
 <CAMZ6Rq+SzTA25XcMZnMnOJcrrq1VZpeT1xceinarqbXgDDo8VA@mail.gmail.com>
 <CAHk-=wiP8111QZZJNbcDNsYQ_JC-xvwRKr0qV9UdKn3HKK+-4Q@mail.gmail.com>
In-Reply-To: <CAHk-=wiP8111QZZJNbcDNsYQ_JC-xvwRKr0qV9UdKn3HKK+-4Q@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 6 Dec 2024 11:02:46 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjk_thfjRnAYRoGX7LjJ8AyiPTmBqjJEPu6JiKDLG2isg@mail.gmail.com>
Message-ID: <CAHk-=wjk_thfjRnAYRoGX7LjJ8AyiPTmBqjJEPu6JiKDLG2isg@mail.gmail.com>
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

On Fri, 6 Dec 2024 at 10:52, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> This may be a case of "we just need to disable that incorrect compiler
> warning". Or does anybody see a workaround?

Hmm. The "== 0" thing does work, but as mentioned, that causes (more
valid, imho) warnings with pointers.

And it's not necessarily require that a pointer expression actually be
marked as a constant, as for the fact that these macros often get used
in various arbitrary contexts where things *might* be pointers, even
if "not constant" is a perfectly fine answer.

We do actually consciously use __builtin_constant_p() on pointers.
It's very convenient for format strings in particular, where
__builtin_constant_p() is a good test for a constant string, which
sometimes gets treated differently.

And in fact, dealing with NULL pointers statically might be worth it
too, so I do think it's worth keeping in mind.

               Linus

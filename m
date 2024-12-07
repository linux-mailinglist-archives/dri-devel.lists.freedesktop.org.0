Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 344A99E81F7
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2024 21:31:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEEB210E03E;
	Sat,  7 Dec 2024 20:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="BMQRRJhe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4568A10E03E
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2024 20:31:29 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-385e3621518so2342843f8f.1
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2024 12:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1733603487; x=1734208287;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ms7Dj4PhpQjQO3I96MAeIgwapri0gFHpEAP0IFi7Ea0=;
 b=BMQRRJheoRNgDkEcPPNZD+pDxI+zaWkHoMR4VEMbWfeKo4BhLHeLaRXA7mbr920BEY
 9VO6mtvkJWpoplelGc03qCuF/aJf2iNAeCggLDWTDciOPkgedkCFpJ1hDescDY7xrcu+
 4j8f02DffkLIAm1hGkfIsW2F9ILJwn1fT1IG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733603487; x=1734208287;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ms7Dj4PhpQjQO3I96MAeIgwapri0gFHpEAP0IFi7Ea0=;
 b=lzndSZfUwAhFgRewE5VW+Itk4RVN+8IWHMSaGpLCLdYhTmJlt2wEWDBA0qGBo06mlD
 slN1AI3E8+QIufluOHR9OW+0IiRh8uQX+hd9deff1GNtxSkjXV1q8cVYLb1FksLh7ffI
 upeOiY42QpbohuIncvoEs09Wx71ydXGYsUOapoMSqf9jg7MYYsnuMGgrvuIo0DxB7Ymp
 J+DE+nx7rxbOSxKKhvL/UhS2yWutpHoroiq56hCtMuV63CcrzYZfD6kKBo8QFvsZJnoJ
 DxeulzA5dLxBQ3IEJl1o+AEfR2RzTOupU4zAViZS2oXW1oE3wAAJBrJ+kYXm+YYdqAtg
 4nEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWX4ydbGKaChRdTOfKPsdvJwtsZwpkddbEMuWi/0XzSD45IqRz1oVUgNIbzKpbS/w/SUiDDUuoy1dc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXQT60bYXkovfr5Ywjtx3rDA91JWcrWSNDcRuVKt/O8Sj7XxtW
 AiYWRjttPKsH/oM/By/HGjyrqEEDx6FsR1lRsRJslkebsgX3N/Y02BYb96rpaNJ1lLVM7dmZEBX
 nLwkE7g==
X-Gm-Gg: ASbGncunUOelWRyiun9R9Xcwt2m+11/M5hc/J3sb1bDbc5wUXI3wyF7C2TxlSH6B7pC
 SwCUjYTgu9E1laN1/LqGpW1ruItas1Ig2zRUzwyE40ulE0WvMQO9kG1zHFhqczKlrqp5vyAEBkq
 eRiSuUUaPj3c4JjM+1Gwe+kUodWBoOpb7l+VZaJCiyqnTbGlo5tvjXpbLqJR+dRA+HW6VQZeCva
 dLK7nteuGSUQvaFFUxZvFVe9TEkPFbtehCJRtLRU/nB04RkbMZT6mP6zVZE+bsu1pG8bBjQzsZp
 hDtUyJmspo9y1//eru1CHDKr
X-Google-Smtp-Source: AGHT+IH/a89QwAIp25Y5jUgGpn/5qsnz99FLzA2hv2HReYDOAJYVwqQrtRx+KOz1ojGztKAx7yS9dg==
X-Received: by 2002:a05:6000:481d:b0:385:fdc2:1808 with SMTP id
 ffacd0b85a97d-3862b3cedbamr5524647f8f.40.1733603487434; 
 Sat, 07 Dec 2024 12:31:27 -0800 (PST)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com.
 [209.85.218.47]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa625e96c0bsm434355866b.66.2024.12.07.12.31.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Dec 2024 12:31:26 -0800 (PST)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-aa5500f7a75so439517266b.0
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2024 12:31:26 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWnla+2rBwZ9JjuaDe0NWSQiRcaYkhwErX15uWPsXLd8M0Sgf8lTyON7cDqjksSzG/6UVhcUAsXERA=@lists.freedesktop.org
X-Received: by 2002:a17:906:328b:b0:aa6:326a:bcb9 with SMTP id
 a640c23a62f3a-aa63a10fe42mr541173966b.33.1733603485779; Sat, 07 Dec 2024
 12:31:25 -0800 (PST)
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
 <CAHk-=wjpN4GWtnsWQ8XJvf=gBQ3UvBk512xK1S35=nGXA6yTiw@mail.gmail.com>
 <6b8c9b942ba6e85a3f1e4eef65a9916333502881.camel@gwdg.de>
In-Reply-To: <6b8c9b942ba6e85a3f1e4eef65a9916333502881.camel@gwdg.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 7 Dec 2024 12:31:09 -0800
X-Gmail-Original-Message-ID: <CAHk-=whzFAaksqMdYeYC=T82tny1HnGGcYu_xJTXZF1OZwVziQ@mail.gmail.com>
Message-ID: <CAHk-=whzFAaksqMdYeYC=T82tny1HnGGcYu_xJTXZF1OZwVziQ@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of
 __is_constexpr()
To: Martin Uecker <muecker@gwdg.de>
Cc: Vincent Mailhol <vincent.mailhol@gmail.com>,
 David Laight <David.Laight@aculab.com>, 
 "w@1wt.eu" <w@1wt.eu>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
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

On Sat, 7 Dec 2024 at 11:51, Martin Uecker <muecker@gwdg.de> wrote:
>
> Am Samstag, dem 07.12.2024 um 10:19 -0800 schrieb Linus Torvalds:
> >
> > If there is one feature of C I would have liked it is "allow inline
> > functions and statement expressions with constant arguments as
> > constant expressions".
>
> There exist proposals along those lines for C2Y.
>
> From a more near-term solution, I wonder if making it possible (or
> easier) to return integer constant expressions from statement
> expressions and allowing a restricted form of statement expressions
> at file scope would help?

Even a more limited form of this would have been useful several times,
but as mentioned, the problem tends to be that we end up supporting
compilers for many years.

So then we end up having to work with older compilers without that
feature, and can't actually clean stuff up until many years after the
fact.

We're currently still accepting gcc-5.1 as a compiler, although it's
time to look at that and probably (judging by what stable distros use)
upgrade to something like gcc-8.1 as the minimum supported compiler
version.

            Linus

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1694A9E78AC
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 20:15:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10AB210F189;
	Fri,  6 Dec 2024 19:15:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QZ2nKPnQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D3ED10F189
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 19:15:41 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5cecbddb574so2777451a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 11:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1733512539; x=1734117339;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HB1D/kV+LS+wbR3JFN0rKIWFlL1hHHNzi40qmGJ0Urw=;
 b=QZ2nKPnQJ7erGojmcsshIXmq5EM/g6/7lU0P/GQKEEmLAdyKZ8BokEiq6GVZiODNma
 2Oh/5PzFO3gKFzBycr8SndhTfdm1wiLbbTL6kGH3wuPk7v3ofxWVhDZpkezQ/hgJvqxz
 e7dN31X214iNsPkA4+YS+rgDx0DUKtJZTeGew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733512539; x=1734117339;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HB1D/kV+LS+wbR3JFN0rKIWFlL1hHHNzi40qmGJ0Urw=;
 b=PFFNbcbMu4ZF4nM7Cx4EWXYLnZ1VkvNl8Lz3qTIYi4Oy7jw4hwGZ7wkmPBGRhGhIUa
 QLO5U5PpzM+xcrsa1KeZasWDa7eDr1q7dwT+Iu9ogDJXsARsLw+eF+aqXNOhTZaGOJmf
 0vc3H85T1wkKGywi35JRu5PyjXNRNBcg95Tv2tRH/30N6brMsbj5R3+VekrxVMMZf1yc
 yN+gCpR6fEQdfluTsJ8yTdomNd/VJkJJINPjQ/iYr/G+VmWlHEM224Oq4p8m72rPu5cH
 3lDKXcVruVMAZtFL+9M6fG7qqcm/EQEhx6d8LJcYUcFkmvttg4wO2dmm+ypYEnvkU2DS
 Zo7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9Ra/ZEo7Nuur3GPiYeNPaGgZzYdAKs/xE0DqdCPYN355oxsEEJBg61i1YmJ7TH3IWRUM4dVHp1ao=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmkdvW00HrhX4OhAHtxXbhvjAylTwMHtn7BeccHRyN5HGONrgE
 zipEC55lfSB2AkgOGmxrbIEeWDYFQOnTzq7Ar3NF9es87LoUPJYms+p7dLFqQlXJLlqTs1wUGva
 +VpzFSA==
X-Gm-Gg: ASbGnctgJbpRMBxUvp6ijhOgNPki3eiy0GkMFq+usfxNNlPFgIlB12hCDdoNdSfCni6
 A7du9gSJ8BnIbzw+vid0kpUPaHUxB9HvKU8rnDkAc41zyvro3HiyYfJLJP2pKqhfJdIvmsdJQCa
 IYbT9sf0drxHuYdYWFYvUhyqm14cK3OX3OSFsrp2K090jzetITV0DS65kehGVis6gDpJr0trd+E
 imW7EzrHjn88mRVabNUELlBa1cKS7/t0q1yElwWVYUUxW2gyqqAOx7Gfctr5R5lEOUR2rW7x/+J
 VgDlaTmNDpwSXQRzR6PBYSeZ
X-Google-Smtp-Source: AGHT+IE3xMKcDnOKaLXalEWVUBEodwuFI1q3TyeuDaisXZmkdkApQqV7NLXEnhfOvQSOs8B/uKUp7g==
X-Received: by 2002:a17:906:3d21:b0:aa6:32f9:d1a7 with SMTP id
 a640c23a62f3a-aa63a20839amr306028066b.38.1733512539538; 
 Fri, 06 Dec 2024 11:15:39 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com.
 [209.85.218.46]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa625ea259esm277041366b.77.2024.12.06.11.15.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Dec 2024 11:15:37 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-aa549d9dffdso346173866b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 11:15:37 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX26cw17pesyD52uskD5oZmMuhFEbz8ntNlowCCRRrf4oQrbXs9ngVrStMNXhQ5CIztCEIEWY5DkWE=@lists.freedesktop.org
X-Received: by 2002:a17:906:4c2:b0:aa5:308c:3489 with SMTP id
 a640c23a62f3a-aa63a2519b0mr271057466b.58.1733512537212; Fri, 06 Dec 2024
 11:15:37 -0800 (PST)
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
In-Reply-To: <d23fe8a5dbe84bfeb18097fdef7aa4c4@AcuMS.aculab.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 6 Dec 2024 11:15:20 -0800
X-Gmail-Original-Message-ID: <CAHk-=win8afdcergvJ6f2=rRrff8giGUW62qmYs9Ae6aw=wcnA@mail.gmail.com>
Message-ID: <CAHk-=win8afdcergvJ6f2=rRrff8giGUW62qmYs9Ae6aw=wcnA@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of
 __is_constexpr()
To: David Laight <David.Laight@aculab.com>
Cc: Vincent Mailhol <vincent.mailhol@gmail.com>, 
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

On Fri, 6 Dec 2024 at 11:07, David Laight <David.Laight@aculab.com> wrote:
>
> I'm missing the compiler version and options to generate the error.

Just -Wall with most recent gcc versions seems to do it. At least I
can repro it with gcc-14.2.1 and something silly like this:

  $ cat t.c
  int fn(int a) { return (a<<2)?1:2; }
  $ gcc -Wall -S t.c
  t.c: In function =E2=80=98fn=E2=80=99:
  t.c:1:26: warning: =E2=80=98<<=E2=80=99 in boolean context, did you mean =
=E2=80=98<=E2=80=99?
[-Wint-in-bool-context]

> Does a '+ 0' help?  "(var << 2) + 0 ? 0 : 0"

Yeah, that actually works.

And "+0" is nice in that it should work in any context.

> #define const_NULL(x) _Generic(0 ? (x) : (char *)0, char *: 1, void *: 0)
> #define const_true(x) const_NULL((x) ? NULL : (void *)1L))
> #define const_expr(x) const_NULL((x) ? NULL : NULL))
> I send this morning.
> Needs 's/char/struct kjkjkjkjui/' applied.

Oh Christ. You really are taking this whole ugly to another level.

           Linus

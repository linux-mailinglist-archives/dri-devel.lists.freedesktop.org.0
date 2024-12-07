Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6609E82C6
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 00:46:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 818E610E64B;
	Sat,  7 Dec 2024 23:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XssXCZ3x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B3410E283;
 Sat,  7 Dec 2024 15:23:38 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5d27243ba8bso4153122a12.2; 
 Sat, 07 Dec 2024 07:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733585016; x=1734189816; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZXHUUtMJhw42ifbhB350SCKKtNQKr7a+mjsEg0ARJVE=;
 b=XssXCZ3xhZDZt/N5hG9GlkOF5ZPTTEqidwR6+2uzpisbmSOZ/RjwzNxB6z+QLatPCa
 9JinbVP510AJTnDgf4WX3CIAnvdZoX7u3pvlhRTbcUvA6A8wzy7gQoPee1RvZ69HchfV
 eh0beIkbkZFz9SZJFrOLYqWVKzmN9+zz9MPwATLVJ5renvwXgdmYJIZoaOqba60klsas
 xNAu3kQ6BDQ+kw6hPAa82OJggnvms4Hpz+87bK9l+cGCp0SyVe7PUGc7jZP+mIzGZsVA
 vRdWBBHKDvYrVEVG0Syyxpr0kj+BwzuADjvZtT367dTxAk7fnmFZdKx2HHHkNZsK5Udn
 sUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733585016; x=1734189816;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZXHUUtMJhw42ifbhB350SCKKtNQKr7a+mjsEg0ARJVE=;
 b=jqTWP9qL2fM8UMV1PUhw7FJK+8mT6cJ5z9/KKs9N1sVDuMhFxSYk0WtNFl72sScFMe
 X0RRyG/KCKArVNMfp/n7ZH0RB57iWTavsYhI3d16iqgjATKhPA4siOOrGg/L5+LSThIm
 i9MnxjbylvhIzrdfuf+whmBLlPamhFm+yfZOtnwkYzc1jbnj9g44m3aOVm9oqONS9JHo
 7++3hIx5TZIEQnmlshU1+6I8j56Hix374zTRj7YwIZJaCRhCr8ncTFU9K/Xv+23+GL6C
 /5Dr7nenzj+S6tBnMJwShu5K2Nb9mryfs4oVnJEl7fE7NQeXcM1OsBcu3YZAGwaAam1E
 ZVfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdJ47frZmRiOqaSqDAq72GSNnajKJm/g5V14Xs4YcSKKa6ggX3G/6277sfHq7jFjN8SHsPbiqQsIQ=@lists.freedesktop.org,
 AJvYcCXimXIX4MDtOaF6Gb9mbr7VN4/uVZwC2ocjKyaYbIrAe8Z2c3PZEwMfr7DbgyWRO1xLZEE7WWsX5UTK@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzhyes9ZG20dMA0O0W1fdEOA5Un64JOOjC+UgPmiTDxVdH4DEeG
 yvJt4CT9HK9JjJ5dQQ3KPydevqDRKGUpzBtnG2m9+nRMapi8kcWNuvS4MVv4wrAW5OalHsKEJOA
 0YX755nJg5kepn2cTKr+r+LJvfHA=
X-Gm-Gg: ASbGncsuRPjNI9FnLd9z/Ds9oT8aSLBLqKH7MM7mtK8/ANvQDiOIA/UVCCwNq6UhpYA
 kbtQ8X7X9ZoJczrukXGfEx/XwHYre1I8=
X-Google-Smtp-Source: AGHT+IFjxVVDHtb5XUqKlxwjzwTutKQUzN2zumRBPx3EfKj4t3Mn5Sq/gwwPwX7tapi/bTH5lmwV1+4Ni4olRczdgm4=
X-Received: by 2002:a17:906:b3a6:b0:aa5:1661:1949 with SMTP id
 a640c23a62f3a-aa63a21bf7emr624479066b.40.1733585016096; Sat, 07 Dec 2024
 07:23:36 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com>
 <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com>
 <abdd7862f136aa676b2d2c324369f4a43ff9909c.camel@gwdg.de>
 <CAMZ6RqKzGiRNMeLsQKRNrxvW_bXB-kEi11udQ82kKX6tGCrqcg@mail.gmail.com>
 <9607300dfca5d71ca9570b1e1de0864e524f356b.camel@gwdg.de>
 <CAMZ6RqJGqBqvgxzp5yPFY1pk0WkkwEMM34qU-dZ3kXfsnKaqEg@mail.gmail.com>
 <429e7c6713ecc94494d9107e5f5a1f0c8e854f23.camel@gwdg.de>
 <CAMZ6RqL+iS6GVsY20=O6GdQakRpp7XdewZJsUbmE5OCsKaHR6Q@mail.gmail.com>
 <b3bd6d4ef485dbb5db4c784f4e42f76adce502dc.camel@gwdg.de>
In-Reply-To: <b3bd6d4ef485dbb5db4c784f4e42f76adce502dc.camel@gwdg.de>
From: Vincent Mailhol <vincent.mailhol@gmail.com>
Date: Sun, 8 Dec 2024 00:23:24 +0900
Message-ID: <CAMZ6RqJrAVVLDAJtNTA2U=UFVUJp1samoat+yfBmSpO-dCVcaw@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of
 __is_constexpr()
To: Martin Uecker <muecker@gwdg.de>
Cc: David Laight <David.Laight@aculab.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, 
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
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 07 Dec 2024 23:46:21 +0000
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

On Sun. 8 Dec. 2024 at 00:10, Martin Uecker <muecker@gwdg.de> wrote:
> Am Samstag, dem 07.12.2024 um 22:50 +0900 schrieb Vincent Mailhol:
> > On Sat. 7 Dec. 2024 =C3=A0 22:19, Martin Uecker <muecker@gwdg.de> wrote=
:
> > >
> ...
>
> >
> > I was invited to WG14 this September. For now, I am only lurking. The
> > thing I have in mind right now is to write a paper to allow the use of
> > static_assert() in expressions (i.e. make it return 0 on success).
> > That should be a relatively small change, but would bring a nice
> > quality of life improvement.
> >
> > For context, look at this:
> >
> >   https://lore.kernel.org/all/CAHk-=3DwjLSEcZ5LdW+3C+9rtjvNPHZT6zdk0POj=
67T5k2ZpDbgA@mail.gmail.com/T/#m1ba33a804b4041154b72a1d0333f90ec7204c461
>
> What one can do is put it into a structure.
>
> #define const_assert(x) \
>     (sizeof(struct { _Static_assert(x, ""); }))
>
> but yeah, also a hack to work around a limitation of the standard
> feature.

If you scroll down a couple more messages, you can see that Linus came
up with that exact same hack :-)

It is now upstreamed in:

  https://git.kernel.org/torvalds/c/d7a516c6eeae

And yes, this solves the problem for the kernel, but I would still
like to change the standard to solve it for everyone else.


Yours sincerely,
Vincent Mailhol

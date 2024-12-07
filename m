Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 988D69E82BD
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 00:46:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6816610E310;
	Sat,  7 Dec 2024 23:46:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LGCUNPJ2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ED0210E2F7;
 Sat,  7 Dec 2024 13:50:55 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-aa6413fc7c5so182830866b.0; 
 Sat, 07 Dec 2024 05:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733579453; x=1734184253; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xHFw9+ZFS/5kCWej9Q2r4cNs9qWMsdVVVFbrLzYifFk=;
 b=LGCUNPJ2aqaATe4NurBfsOXP0cHDqOO9nLyC7/0tPkWIZg38NamIilP+t4jImdCijx
 fDqJA7rUb2eYNxbvV++a2H8Jq59La+H5meaSPpnynp1yr4YU4veE1+UvcNspg0/y65tN
 2omdveD52YjpW0FkbZ0EcDAvoO6iSShuhn+0YddR9PHj3qG7d75SZEYHzZC9qn6L3l7o
 noC3xg4+B5dxUMXN7g0/rk34py04O6IVpd2MMm+/h9BWk5aQbPB1C1cMY8m2vFD5BVjb
 Dv9kPTzVlzabrJDJ2CUJHjVlFnSqpU4IjMXFixTU/YAwnYBUIlc9nQeXOY90Kl8ibG2A
 y8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733579453; x=1734184253;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xHFw9+ZFS/5kCWej9Q2r4cNs9qWMsdVVVFbrLzYifFk=;
 b=c6i37y0Mbw/vJonMMLGeiXq0u/DQOOf47TE2vHFnooM4fYVn0aLF1uLFho5KyOq5fQ
 80nPmtR8Y9Zj7cRLCBMWyvm2TnQaiQF4e5i6+Ib/wDE1+K73YCN8VDXxaD20Mqj2iO0p
 sS22J53f1GKRNMbs5laKQhjP0G9ov/st9TytST3eyuGPpDJrhkVtC5kGX0dnFSZlKu6o
 8H/VBX7gmWlStNE4diZq3mM4SrVmpV9eZBzxty6KK9j0ffRmUHhlNMC7djYENhbReZiY
 Ii+ONYnewAQ7WV/jeuRoIm1zVWqtYJyigCg7zyox7GjH9dlEw5tyEQkeJ31v5P6mDEdn
 6JkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCURGYHNrQBJGUx6Sq7nRAvTgWSXJhmA5evgqVEuN+dImlSE4dNxHaXhvlL6KLKEgzQatLNRdxlaDzk=@lists.freedesktop.org,
 AJvYcCWJgzlZVhXA0jQbi7mCLm/z2X50yyowqvHdxbRsBwNY0sdRWCu9Qvm2VxlHwZu2i4oXT9KIgCMHsIHw@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxe2rlR2FaejVuC0Z7FJv+Q9rwQWDYvc0jxQd/IVvfMojwPZkgM
 rdeu89Q67y7CUqd60/76+emn5oaHjc8dC9zpIFOoNPDFrIEtGdAkxWbHLvfkdTvBfOjC331bJRh
 t06lTq35vCEcTLIQvOxChCqn/JJE=
X-Gm-Gg: ASbGncsfGBSkTOEcgMP/PLdtN/UMbNnxwcRG4iPztOyZv1U5g7BhqhyvBbLYjT0tbn7
 BGxqp33820kMYn7ZRor4ununB8CsGCSk=
X-Google-Smtp-Source: AGHT+IH6k2GyIlgxnGFl/g0StSGsvarnhcm9pbDRqjwA6P99KliYB7aZHWQfO50sclN4sezlsrdFqfGV/df1a3TMj88=
X-Received: by 2002:aa7:cf83:0:b0:5d3:d7c2:ca58 with SMTP id
 4fb4d7f45d1cf-5d3d7c2cad3mr7104642a12.24.1733579453216; Sat, 07 Dec 2024
 05:50:53 -0800 (PST)
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
In-Reply-To: <429e7c6713ecc94494d9107e5f5a1f0c8e854f23.camel@gwdg.de>
From: Vincent Mailhol <vincent.mailhol@gmail.com>
Date: Sat, 7 Dec 2024 22:50:41 +0900
Message-ID: <CAMZ6RqL+iS6GVsY20=O6GdQakRpp7XdewZJsUbmE5OCsKaHR6Q@mail.gmail.com>
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

On Sat. 7 Dec. 2024 =C3=A0 22:19, Martin Uecker <muecker@gwdg.de> wrote:
> Am Samstag, dem 07.12.2024 um 21:45 +0900 schrieb Vincent Mailhol:
> > On Sat. 7 Dec. 2024 at 17:39, Martin Uecker <muecker@gwdg.de> wrote:
> > > Am Freitag, dem 06.12.2024 um 16:26 +0900 schrieb Vincent Mailhol:
>
> ...
>
> > > I find it amazing how much time the Linux kernel community spends
> > > revising code to make it work perfectly.
> > >
> > > Still, I am wondering whether some of this time and effort should not
> > > be targeted at C compilers and language work to make these macro
> > > hacks unnecessary?
> >
> > It seems to me that the long term solution to this problem are the
> > constexpr functions.
>
> How would constexpr functions help here?  (I am a bit sceptical about
> constexpr functions.)

I was thinking of some of the "side features" of constexpr functions. Namel=
y:

  - std::is_constant_evaluated
  Link: https://en.cppreference.com/w/cpp/types/is_constant_evaluated

  - if consteval
  Link: https://en.cppreference.com/w/cpp/language/if#Consteval_if

I did not try it, but looking at these, I believe that this would
allow us to rewrite most of our macros into some constexpr functions.

> > But the core issue is that before getting this support in Linux, we
> > have to wait for this to be added to the C2Y draft, then implemented
> > in the compilers (probably just reusing the C++ constexpr functions)
> > and finally wait maybe one more decade for the C2Y support to reach
> > the kernel. For reference the kernel supports C11 only from 2022=E2=80=
=A6 So
> > maybe we will see those in the kernel around 2037? Meanwhile, we have
> > to deal with those hacks.
>
> If we do not collaborate on proper solutions, then you might have
> to wait much longer.

I was invited to WG14 this September. For now, I am only lurking. The
thing I have in mind right now is to write a paper to allow the use of
static_assert() in expressions (i.e. make it return 0 on success).
That should be a relatively small change, but would bring a nice
quality of life improvement.

For context, look at this:

  https://lore.kernel.org/all/CAHk-=3DwjLSEcZ5LdW+3C+9rtjvNPHZT6zdk0POj67T5=
k2ZpDbgA@mail.gmail.com/T/#m1ba33a804b4041154b72a1d0333f90ec7204c461

And I will definitely follow the progress of constexpr functions in C2Y.


Yours sincerely,
Vincent Mailhol

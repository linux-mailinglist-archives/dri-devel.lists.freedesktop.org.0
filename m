Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E09C95D91F
	for <lists+dri-devel@lfdr.de>; Sat, 24 Aug 2024 00:14:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72AB010E0D5;
	Fri, 23 Aug 2024 22:14:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kruces-com.20230601.gappssmtp.com header.i=@kruces-com.20230601.gappssmtp.com header.b="ygIwDYru";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CCC310E0D9
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 22:14:40 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5334879ba28so3016548e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 15:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kruces-com.20230601.gappssmtp.com; s=20230601; t=1724451278; x=1725056078;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mVn7bhcqAuWH/Gc+rMZ1Xor11/SH0tAXV77Rde16lJc=;
 b=ygIwDYruwu2cp65SqJx85KXlRLLmZu+P93g0NjVQgr54eLsi5XjarAP4e1s2JF46Ua
 jPAF6gS2UAeW1mzFu/aZvNSdo5+Y+fPs2XXhIIzXdDeMj3tOVHzluBCHOD4gNfWrPyX4
 EnMxuJ7PJPwZ8w/JQOpu2AakNb5J6EtqJTfyUhFndfzOB+xSfckTGIZeczo8UuFc5wZQ
 R7HBv8jKB8iJO7beV9KD9JHmVIQQkCbNgMQRo0QIG3pBvDmHqsdR5rogxuBU9TOM3plc
 my4HMjEpen/X5iQakw43N9X9iNSjc/+ptN5cNpv3ECPzca85EVHzHgFL8AWQMZuNGZy1
 Ze5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724451278; x=1725056078;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mVn7bhcqAuWH/Gc+rMZ1Xor11/SH0tAXV77Rde16lJc=;
 b=vNzjY4DHw+c2iClr1aG51Y2+dbGCgsTV0DWrLt4weNBWQDLFhYFMJbNH2/foN3DnXq
 p3eswMaI9pvhVjKbeQEYy7eWNM7saeez079stUs3WOicRG74QH987IuajC9221mI6wwK
 PZWwEm8JUQhyKyIhPuJCrT30+OuwD455fN9fKNoegfMh4bUnET010XrmAEsMoEn7VhV3
 b8y3EkwoyOHeQym3WYT3TpbJsfFy2PxB9nTDPeFAj8xQQMlZhrAoBD8TjtaTz6e7C5HX
 BisoYj3kOiHSV6L0Tko4/tBEWou/1bJE6BvIiNqadrwFFWthMEOBdsI8frXoSGHp5jvJ
 9DyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuhC7mWSNrPXbYa0rcyHGq6/kyK+XGds72z6oHtdku/fPGWBV6L9e4MRA0lWbIovcCnXnHcvh4m1o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypwHg/PoCvdPw7bokqUoZOwFJWwSh3GN9orgzcnVT/Whf1qT4y
 VHWhML69YVGiCIZK+vcjL1xLDq7sIXjNSRBHW3CFm50pZJBqtQgsVcAPTzx0FHGHm7JWvCldZ5T
 IJUiLi0pw0BD70YSMva0ye1cZ1USapp5eQBe4zg==
X-Google-Smtp-Source: AGHT+IGDhJMFPFDslCxnxri8S951sJjg3aSvVif7lXNqXGz7kFGS4rZgZs1ZBpw6GOJM88hNjR9zGKziEIDdKGLwVUE=
X-Received: by 2002:a05:6512:2244:b0:533:4327:b4cc with SMTP id
 2adb3069b0e04-534387c175cmr2666989e87.52.1724451277886; Fri, 23 Aug 2024
 15:14:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
 <20240807-macos-build-support-v1-1-4cd1ded85694@samsung.com>
 <CAK7LNARmy=N+6O87BJGZbodssDw21sHgMf36TXdcxD4=5A_OBA@mail.gmail.com>
In-Reply-To: <CAK7LNARmy=N+6O87BJGZbodssDw21sHgMf36TXdcxD4=5A_OBA@mail.gmail.com>
From: "Daniel Gomez (Samsung)" <d+samsung@kruces.com>
Date: Sat, 24 Aug 2024 00:14:11 +0200
Message-ID: <CABj0suC1atc=iPX4uOL5FYkzYBRtZC1J3Lhruo7hejd-fe9Yuw@mail.gmail.com>
Subject: Re: [PATCH 01/12] scripts: subarch.include: fix SUBARCH on MacOS hosts
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: da.gomez@samsung.com, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, 
 Kirk Reiser <kirk@reisers.ca>, Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 Paul Moore <paul@paul-moore.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>, 
 Ondrej Mosnacek <omosnace@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, 
 James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, speakup@linux-speakup.org, 
 selinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-serial@vger.kernel.org, llvm@lists.linux.dev, 
 Finn Behrens <me@kloenk.dev>, gost.dev@samsung.com, 
 Nick Desaulniers <nick.desaulniers@gmail.com>
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

On Fri, Aug 23, 2024 at 6:13=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Wed, Aug 7, 2024 at 8:10=E2=80=AFAM Daniel Gomez via B4 Relay
> <devnull+da.gomez.samsung.com@kernel.org> wrote:
> >
> > From: Nick Desaulniers <nick.desaulniers@gmail.com>
> >
> > When building the Linux kernel on an aarch64 MacOS based host, if we do=
n't
> > specify a value for ARCH when invoking make, we default to arm and thus
> > multi_v7_defconfig rather than the expected arm64 and arm64's defconfig=
.
> >
> > This is because subarch.include invokes `uname -m` which on MacOS hosts
> > evaluates to `arm64` but on Linux hosts evaluates to `aarch64`,
> >
> > This allows us to build ARCH=3Darm64 natively on MacOS (as in ARCH need
> > not be specified on an aarch64-based system).
> >
> > Utilize a negative lookahead regular expression to avoid matching arm64=
.
>
>
> Does sed support "negative lookahead regular expression"?

I think they removed support for PCRE. I've found this:

commit 261c7f145d015d9acb79dc650d27e4a23b839c23
Author: Assaf Gordon <assafgordon@gmail.com>
Date:   Tue Aug 21 14:25:57 2018 -0600

    maint: remove REG_PERL code

    Perl-regexp syntax (PCRE) in GNU Sed is shelved indefinitely.
    See https://bugs.gnu.org/22801 , https://bugs.gnu.org/22647 .
    Remove all (unused) REG_PERL related code.

    * sed/sed.c, sed/sed.h, sed/regexp.c, sed/compile.c: Remove REG_PERL co=
de.

git tag --contains 261c7f145d015d9acb79dc650d27e4a23b839c23
v4.6
v4.7
v4.8
v4.9

And my sed version is (Debian):

sed --version
sed (GNU sed) 4.9
Packaged by Debian
Copyright (C) 2022 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <https://gnu.org/licenses/gpl.ht=
ml>.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written by Jay Fenlason, Tom Lord, Ken Pizzini,
Paolo Bonzini, Jim Meyering, and Assaf Gordon.

This sed program was built with SELinux support.
SELinux is disabled on this system.

GNU sed home page: <https://www.gnu.org/software/sed/>.
General help using GNU software: <https://www.gnu.org/gethelp/>.
E-mail bug reports to: <bug-sed@gnu.org>.

sed version (Homebrew):
sed --version
sed (GNU sed) 4.9
Copyright (C) 2022 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <https://gnu.org/licenses/gpl.ht=
ml>.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written by Jay Fenlason, Tom Lord, Ken Pizzini,
Paolo Bonzini, Jim Meyering, and Assaf Gordon.

This sed program was built without SELinux support.

GNU sed home page: <https://www.gnu.org/software/sed/>.
General help using GNU software: <https://www.gnu.org/gethelp/>.
E-mail bug reports to: <bug-sed@gnu.org>.

>
> >
> > Add a separate expression to support for armv.* as per error reported b=
y
> > Nicolas Schier [1].
> >
> > [1] https://lore.kernel.org/all/Y3MRvtwdjIwMHvRo@bergen.fjasle.eu/#t
> >
> > Signed-off-by: Nick Desaulniers <nick.desaulniers@gmail.com>
> > Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> > ---
> >  scripts/subarch.include | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/scripts/subarch.include b/scripts/subarch.include
> > index 4bd327d0ae42..5d84ad8c0dee 100644
> > --- a/scripts/subarch.include
> > +++ b/scripts/subarch.include
> > @@ -6,7 +6,8 @@
> >
> >  SUBARCH :=3D $(shell uname -m | sed -e s/i.86/x86/ -e s/x86_64/x86/ \
> >                                   -e s/sun4u/sparc64/ \
> > -                                 -e s/arm.*/arm/ -e s/sa110/arm/ \
> > +                                 -e s/armv.*/arm/ \
> > +                                 -e s/arm\(?:\(?!64\).*\)/arm/ -e s/sa=
110/arm/ \
>
>
> s/arm\(?:\(?!64\).*\)/arm/
>
> In sed, this expression does not seem to match anything.

You are correct. I've removed the expression and saw no difference.
See below with my test case:
>
> (or please give me some matching examples if I miss something)

cat Makefile
MACHINE ?=3D "aarch64"
SUBARCH0 :=3D $(shell echo $(MACHINE) | sed \
                                  -e s/arm.*/arm/ \
                                  -e s/aarch64.*/arm64/)

SUBARCH1 :=3D $(shell echo $(MACHINE) | sed \
                                  -e s/armv.*/arm/ \
                                  -e s/aarch64.*/arm64/)

SUBARCH2 :=3D $(shell echo $(MACHINE) | sed \
                                  -e /^arm64$/!s/arm.*/arm/ \
                                  -e s/aarch64.*/arm64/)

test:
        @echo "MACHINE=3D$(MACHINE)"
        @echo "SUBARCH0=3D$(SUBARCH0)"
        @echo "SUBARCH1=3D$(SUBARCH1)"
        @echo "SUBARCH2=3D$(SUBARCH2)"
        @echo "---"

SUBARCH0 represents the current upstream expressions for arm/arm64.
SUBARCH1 is my proposal in case we need to cover only armv* for 32-bit
arm (I think that is incomplete?) and SUBARCH2 is Nicolas' proposal
(which I can't make it work in the test Makefile).

Running the above Makefile, I get:

make test MACHINE=3Darmv4 && make test MACHINE=3Darm7 && make test
MACHINE=3Darmhf && make test MACHINE=3Daarch64 && make test MACHINE=3Darm64
MACHINE=3Darmv4
SUBARCH0=3Darm
SUBARCH1=3Darm
SUBARCH2=3Darmv4
---
MACHINE=3Darm7
SUBARCH0=3Darm
SUBARCH1=3Darm7
SUBARCH2=3Darm7
---
MACHINE=3Darmhf
SUBARCH0=3Darm
SUBARCH1=3Darmhf
SUBARCH2=3Darmhf
---
MACHINE=3Daarch64
SUBARCH0=3Darm64
SUBARCH1=3Darm64
SUBARCH2=3Darm64
---
MACHINE=3Darm64
SUBARCH0=3Darm
SUBARCH1=3Darm64
SUBARCH2=3Darm64
---
>
>
>
>
>
> Nocolas already provided correct code:
>
> > [1] https://lore.kernel.org/all/Y3MRvtwdjIwMHvRo@bergen.fjasle.eu/#t

I think it is even more simple if we just make this change:

-                                 -e s/arm.*/arm/ -e s/sa110/arm/ \
+                                 -e s/armv.*/arm/ \

Does armv.* cover all arm32 machines? I see armhf, arm7, arm8 and
armv*, is it correct?

And thanks for checking!

>
>
>
>
>
>
> >                                   -e s/s390x/s390/ \
> >                                   -e s/ppc.*/powerpc/ -e s/mips.*/mips/=
 \
> >                                   -e s/sh[234].*/sh/ -e s/aarch64.*/arm=
64/ \
> >
> > --
> > Git-146)
> >
> >
>
>
> --
> Best Regards
>
>
> Masahiro Yamada

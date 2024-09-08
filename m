Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2398970915
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 19:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF2A10E1B3;
	Sun,  8 Sep 2024 17:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kruces-com.20230601.gappssmtp.com header.i=@kruces-com.20230601.gappssmtp.com header.b="24PRR2Ef";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1674D10E28F
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 17:41:04 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a8d56155f51so18585366b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Sep 2024 10:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kruces-com.20230601.gappssmtp.com; s=20230601; t=1725817262; x=1726422062;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fviFcg3HLptplXdgVPwFETuKylRy16bbpArI+x9x9sA=;
 b=24PRR2EfhHNTzXFxrvZu3OWT+mK3TkAEz9q4F6q31a2OvFsmLQqj2s73HOoTLg5Ew8
 W6p1NlYmqr6I6GOf4hmIllzD/MbyVH5PuVGSKXmSK2Mu2msKp9qL63YE6n1oMZtU7Zsb
 ZmlPJYvGa3HvfpdK+aVlViiYs28Eg6ikc6T+bOvVCTS3NmlR4kLWAXB83jkUrv7X3q1i
 gva70Rr/594JenNG26Qnafllm/MxwVM5tuLDNDunc6mEKPEFvsi/i4884vqM7aTPoY0C
 ypyvca+urc+/+IctghJjKyovf1RPEuaY8ZD7LbVTK0o4JkDsNoWsqwG8YV31Ztl4MnMm
 3xrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725817262; x=1726422062;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fviFcg3HLptplXdgVPwFETuKylRy16bbpArI+x9x9sA=;
 b=mVw9hsjaeccif6EtQTMXf3jvdWC0pHo1HQ5LvDkJVUSRCTogs1hkfTgverOBUyfAJS
 rbUFV+xMA8fc1+KPl1RZLDWSayEIE6ONbYe0q510Db0VWovYPkPUc/rNS7N7qqqUm+Xe
 IixaEaHtnKL/i3nVSnpT3H8QR6m/4OEgWjDYRYT8VrreoOk/z7oq540ypoB8EAHpuiCr
 W11fKoqxHkkyA7hkFxmpK53IdyzG2cmNiBijDvU1LTAvsNT+MuKdK2LC0JLgdZudpFhX
 TIf7e+8Mp6y3MpgXjwQ6blD2Uumjs7WsytKdjE2xWl7FT0GB/RVfeQ9riv9nq4n1gsM9
 g5rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQ6t3q8N1KcrKlq1wIylr12LuH1dQ3W/KnFM1zm6urADiu098EZXJmBYbq8jY87J2nTi9Vzx+uzBY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6bUF6n8x6ts3lmzcmH2GzqbGctWelUiNBxx54b8gF9TIH6SCA
 6JNigt0/ABxp3oCXXnSVD3+q7fO6gGXrIUK5U5S9bz/rHIPA292IWGipdCyvZ6J9Lva94jl7uuu
 rG08N7LL7wVzZqXZlWJw2qdl4iZf/vd5OEmRrFA==
X-Google-Smtp-Source: AGHT+IG0taDaRweGpDhiFssf20qgh8akE04jwmSCvgTsBJig1BN0pA1T1q/8W0tMp8E8Ed3WvXCdk5VBeHS2T6PZWVU=
X-Received: by 2002:a17:907:9690:b0:a8d:2faf:d343 with SMTP id
 a640c23a62f3a-a8d2fafee8fmr226989166b.27.1725817261797; Sun, 08 Sep 2024
 10:41:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240906-macos-build-support-v2-0-06beff418848@samsung.com>
 <20240906-macos-build-support-v2-2-06beff418848@samsung.com>
 <CAK7LNARw-7uwJB7ibmSYE5nYUtPXcr4J9cHBQqm9BnNS=SRUhQ@mail.gmail.com>
In-Reply-To: <CAK7LNARw-7uwJB7ibmSYE5nYUtPXcr4J9cHBQqm9BnNS=SRUhQ@mail.gmail.com>
From: "Daniel Gomez (Samsung)" <d+samsung@kruces.com>
Date: Sun, 8 Sep 2024 19:40:34 +0200
Message-ID: <CABj0suCHeWGDXX-S6U9X5iCzwMqn9pq=i84PSKwKtUXhGxaBjQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] file2alias: fix uuid_t definitions for macos
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: da.gomez@samsung.com, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
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
 Simona Vetter <simona.vetter@ffwll.ch>, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, speakup@linux-speakup.org, 
 selinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-serial@vger.kernel.org, llvm@lists.linux.dev, 
 Finn Behrens <me@kloenk.dev>, gost.dev@samsung.com
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

On Sun, Sep 8, 2024 at 1:56=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> On Fri, Sep 6, 2024 at 8:01=E2=80=AFPM Daniel Gomez via B4 Relay
> <devnull+da.gomez.samsung.com@kernel.org> wrote:
> >
> > From: Daniel Gomez <da.gomez@samsung.com>
> >
> > The uuid_t struct defined in sys/types.h on macOS hosts conflicts with
> > the one defined in file2alias, resulting in the typedef redefinition
> > error below. To resolve this conflict, define the _UUID_T and
> > __GETHOSTUUID_ in file2alias HOSTCFLAGS.
> >
> > Error:
> >   HOSTCC  scripts/mod/file2alias.o scripts/mod/file2alias.c:45:3:
> > error: typedef redefinition with different types ('struct uuid_t' vs
> > '__darwin_uuid_t' (aka 'unsigned char[16]'))    45 | } uuid_t;       |
> > ^
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    sys/_types/_uuid_t.h:31:25: note: previous definition is here 31 |
> >    typedef __darwin_uuid_t uuid_t;    |                         ^
> > scripts/mod/file2alias.c:1354:7: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1354 |
> >  uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1354:19: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1354 |
> >  uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1354:31: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1354 |
> >  uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1354:43: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1354 |
> >  uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1354:55: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1354 |
> >  uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1355:7: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1355 |
> >  uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],      |
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1355:19: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1355 |
> >  uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],      |
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1355:31: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1355 |
> >  uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],      |
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1355:43: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1355 |
> >  uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],      |
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1355:55: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1355 |
> >  uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],      |
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1356:7: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1356 |
> >  uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],      =
|
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1356:20: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1356 |
> >  uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],      =
|
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1356:33: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1356 |
> >  uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],      =
|
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1356:46: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1356 |
> >  uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],      =
|
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1356:59: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1356 |
> >  uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],      =
|
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1357:7: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1357 |
> >  uuid->b[15]);      |                 ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > 17 errors generated.
> >
> > Suggested-by: Nicolas Schier <nicolas@fjasle.eu>
> > Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> > ---
> >  scripts/mod/Makefile     | 2 ++
> >  scripts/mod/file2alias.c | 3 +++
> >  2 files changed, 5 insertions(+)
> >
> > diff --git a/scripts/mod/Makefile b/scripts/mod/Makefile
> > index c729bc936bae..75c12c045f21 100644
> > --- a/scripts/mod/Makefile
> > +++ b/scripts/mod/Makefile
> > @@ -8,6 +8,8 @@ modpost-objs    :=3D modpost.o file2alias.o sumversion.=
o symsearch.o
> >
> >  devicetable-offsets-file :=3D devicetable-offsets.h
> >
> > +HOSTCFLAGS_file2alias.o +=3D -D_UUID_T -D__GETHOSTUUID_H
> > +
> >  $(obj)/$(devicetable-offsets-file): $(obj)/devicetable-offsets.s FORCE
> >         $(call filechk,offsets,__DEVICETABLE_OFFSETS_H__)
> >
> > diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> > index 99dce93a4188..ab743f6d60ef 100644
> > --- a/scripts/mod/file2alias.c
> > +++ b/scripts/mod/file2alias.c
> > @@ -11,6 +11,9 @@
> >   */
> >
> >  #include "modpost.h"
> > +#ifdef __APPLE__
> > +#define uuid_t sys_uuid_t
> > +#endif
> >  #include "devicetable-offsets.h"
>
>
>
>
> Is this what Nicolas suggested?
> https://lore.kernel.org/lkml/20240807-sexy-roadrunner-of-acceptance-a84bb=
f@lindesnes/
>
>
> I thought he suggested replacing #ifdef __APPLE__
> with -D_UUID_T -D__GETHOSTUUID_H.
>
>
> You added -D_UUID_T -D__GETHOSTUUID_H,
> keeping #ifdef __APPLE__.

I forgot to remove this.

Based on your suggestion in the other thread to use/overwrite
HOSTCFLAGS via the command line, it seems I should drop this patch.
Can you confirm?

>
>
>
>
>
>
>
>
>
> >  /* We use the ELF typedefs for kernel_ulong_t but bite the bullet and
> >
> > --
> > 2.46.0
> >
> >
>
>
> --
> Best Regards
> Masahiro Yamada

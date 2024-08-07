Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3512894AD2E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 17:45:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1531C10E179;
	Wed,  7 Aug 2024 15:45:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZSCK7VKG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB27710E179;
 Wed,  7 Aug 2024 15:45:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1EB0F611E9;
 Wed,  7 Aug 2024 15:45:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C63BC4AF49;
 Wed,  7 Aug 2024 15:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723045500;
 bh=62DRcqqeC5v6AnH2Jdg1gao0bSakZspPdgIljEIRA+8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZSCK7VKGfrUUYWa85qY72U563KSZ7oAWK9C1SmiKZTS4h5x/6E+ew0qyMMpdk0yRF
 DSqC6UEiFpc1jg5j0fuU8saCQs9kAViz9G2Unej4kLqNynQmW11z2S+AY47JGjFs+n
 7jIuFifNc4j4X9JmQQr+BCSh1JKh2wM46HqL9F/ruVsehCMwvQt/LMof/yq/W2znap
 03pzS1oK0CBWdcohdlosPgDPUF1aT15QwrDYa+r+DDKdBxtm1Rl7xuFGNFkC+uK6e/
 p5VarmwbzVjNmwq3yV+sPnQtCf/hhzyAcPNHztwXh5KpYrJG9E3YiskeZLPQsZ3nY8
 gLgSmBZ4cCJpg==
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-52f04b3cb33so4526924e87.0; 
 Wed, 07 Aug 2024 08:45:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVoV6ckYfykK4e0i8LXKrroS/Es/eJbsCuNJz8C7py4da8O0rs4WZ1HKlhekPM+zImGY0E/C2ygJtMdZA0kVisOs3Amjr1xvA9So9AFN7Wlc2TFWl+rc/e/VVHU3mzpbhLXITrD3vCOT6v6HOFXML4=
X-Gm-Message-State: AOJu0YypEcLk609NEd9lhzBpvPS5PD7Nlw9glqmNqsGoJPzpNY59jOg+
 zRCVrW3igi/JUPP9vMxogmSUajz3aIJNKyrdi6wIyzR0k1boImdNESrFnmdtMWAxmAinyehwIV6
 /vh/Y3oiscop3+s9Efp92KvE6mAQ=
X-Google-Smtp-Source: AGHT+IEkoeCcq7YGXm+baiHlwfmxdsFq0ZRVrTrB1cw7IHXDs0yss2GR/vUuBkAzPzYypMT+IeV+DjGwfXLBANG7Jew=
X-Received: by 2002:a05:6512:b8d:b0:52e:8071:e89d with SMTP id
 2adb3069b0e04-530bb3b45f5mr17596549e87.40.1723045498671; Wed, 07 Aug 2024
 08:44:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
 <20240807-macos-build-support-v1-6-4cd1ded85694@samsung.com>
 <20240807-outgoing-charcoal-collie-0ee37e@lindesnes>
In-Reply-To: <20240807-outgoing-charcoal-collie-0ee37e@lindesnes>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 8 Aug 2024 00:44:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ21o+cQQaLD1xkwSX0ma8hvB29DMDquy5VjHcBWwhGPw@mail.gmail.com>
Message-ID: <CAK7LNAQ21o+cQQaLD1xkwSX0ma8hvB29DMDquy5VjHcBWwhGPw@mail.gmail.com>
Subject: Re: [PATCH 06/12] selinux/genheaders: include bitsperlong and
 posix_types headers
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: da.gomez@samsung.com, Nathan Chancellor <nathan@kernel.org>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
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
 Finn Behrens <me@kloenk.dev>, "Daniel Gomez (Samsung)" <d+samsung@kruces.com>,
 gost.dev@samsung.com
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

On Thu, Aug 8, 2024 at 12:39=E2=80=AFAM Nicolas Schier <nicolas@fjasle.eu> =
wrote:
>
> On Wed, Aug 07, 2024 at 01:09:20AM +0200, Daniel Gomez via B4 Relay wrote=
:
> > From: Daniel Gomez <da.gomez@samsung.com>
> >
> > The genheaders requires the bitsperlong.h and posix_types.h headers.
> > To ensure these headers are found during compilation on macOS hosts,
> > add usr/include to HOST_EXTRACFLAGS in the genheaders Makefile. This
> > adjustment allows the compiler to locate all necessary headers when the=
y
> > are not available by default on macOS.
> >
> > Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> > ---
> >  scripts/selinux/genheaders/Makefile | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/scripts/selinux/genheaders/Makefile b/scripts/selinux/genh=
eaders/Makefile
> > index 1faf7f07e8db..017149c90f8e 100644
> > --- a/scripts/selinux/genheaders/Makefile
> > +++ b/scripts/selinux/genheaders/Makefile
> > @@ -2,4 +2,5 @@
> >  hostprogs-always-y +=3D genheaders
> >  HOST_EXTRACFLAGS +=3D \
> >       -I$(srctree)/include/uapi -I$(srctree)/include \
> > -     -I$(srctree)/security/selinux/include
> > +     -I$(srctree)/security/selinux/include \
> > +     -I$(srctree)/usr/include
>
> 'make headers' composes the UAPI header tree in $(objtree)/usr/include.
> So, if you build out-of-source, -I$(srctree)/usr/include will not match.
> Just remove the '$(srctree)/' prefix as '$(objtree)/' is always '.'.


Right.


> But I am suspecting that this break cross-building.


Right.

We cannot do this.


--
Best Regards
Masahiro Yamada

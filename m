Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1069704A7
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 03:30:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47E910E0F3;
	Sun,  8 Sep 2024 01:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iw0ZyrY4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE81C10E0F3;
 Sun,  8 Sep 2024 01:30:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 96FCB5C1656;
 Sun,  8 Sep 2024 01:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D3FC4CEDB;
 Sun,  8 Sep 2024 01:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725759008;
 bh=fyOnv3k2017y/ErSznnZHp0l9XWS0bPVAmjp32U6Etk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=iw0ZyrY4vuLZ21JCPOC7RhuX7jH+ga/520Dv1aaM8uNgOoHpA/cMaELxoMFbt9WhQ
 6cWjNnSP4o7rT5Xc1qm3XtbFn4YS0prmu2KTWtXTjxFFhomNRnXeVVh9JP5z7M7miU
 RsaI6nAFHnSgzlWx+0avsFEestaO6zMIOeHJmmJYY2W/sPtsC3Enk28MuA6dyzDfS8
 B0BwayB0He+GmuHbYvmm98cgYqbFocvJdNDrBPe2nLlyhExI1t8DoPlC1Xy7y6a7TS
 6nqNvu2hKR3rjjA6O1+SusQWQQ2vp9f+8BBS60UzZLI2p5UciVSLsD54+sq6iFumv2
 XlPJ61sFI6v6g==
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-536584f6c84so2549188e87.0; 
 Sat, 07 Sep 2024 18:30:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUYF9KyIwSNbWXhF1x4UlSFFo2szrs5mxF0EtQeov2W3Lnju4YrvDNcz8aMRfqKaManOXLqZ4I3jTg=@lists.freedesktop.org,
 AJvYcCXmAxKB79eIdq6LSoNusurVHzVqIzI+joyi7mReEkSlwVOYH56gQHfP1Iu/uOwghOYzWyZFoyrXEhk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwC8e59cgJSD3i7NEG3fQySmP8TVYAJXmkNSOSy/sTjLHnE1KrP
 SutRuIwi49yHEWgQ6FLlFE90xui5IJp5SrCLtBAqalNj1JqpMuRCDzN9t/22mjczkkEqDvc2AO4
 pux/fOLI/hCisykQSR5/hHnRnRGM=
X-Google-Smtp-Source: AGHT+IF+h293KpoI++f+ufbs7y7oQSzJ8FqYF6U09FVXsYlA3fTualWC6YvD7rLK4LHaRVS5cfnW7EaXVcZxWqO9e3g=
X-Received: by 2002:a05:6512:1598:b0:535:66bb:3303 with SMTP id
 2adb3069b0e04-536587a4100mr4487964e87.12.1725759006849; Sat, 07 Sep 2024
 18:30:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240906-macos-build-support-v2-0-06beff418848@samsung.com>
 <20240906-macos-build-support-v2-8-06beff418848@samsung.com>
 <CAK7LNASpWSXbjF_7n0MhosNism=BpvHOnKsa344RPM_wmC9dGA@mail.gmail.com>
 <CABj0suBQCc8=0tLng=OWW=K1hjFuLFZWhbjsqHtz2FzZt4i0sw@mail.gmail.com>
In-Reply-To: <CABj0suBQCc8=0tLng=OWW=K1hjFuLFZWhbjsqHtz2FzZt4i0sw@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 8 Sep 2024 10:29:30 +0900
X-Gmail-Original-Message-ID: <CAK7LNARqUTC2GixVeUQpMvzWt=h8KZvLHTHvp3ftxNwJQU6pWQ@mail.gmail.com>
Message-ID: <CAK7LNARqUTC2GixVeUQpMvzWt=h8KZvLHTHvp3ftxNwJQU6pWQ@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] Documentation: add howto build in macos
To: "Daniel Gomez (Samsung)" <d+samsung@kruces.com>
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

On Sat, Sep 7, 2024 at 6:32=E2=80=AFPM Daniel Gomez (Samsung)
<d+samsung@kruces.com> wrote:
>
> On Sat, Sep 7, 2024 at 10:33=E2=80=AFAM Masahiro Yamada <masahiroy@kernel=
.org> wrote:
> >
> > On Fri, Sep 6, 2024 at 8:01=E2=80=AFPM Daniel Gomez via B4 Relay
> > <devnull+da.gomez.samsung.com@kernel.org> wrote:
> > >
> > > From: Daniel Gomez <da.gomez@samsung.com>
> > >
> > > Add documentation under kbuild/llvm to inform about the experimental
> > > support for building the Linux kernel in macOS hosts environments.
> > >
> > > Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> >
> >
> > Instead, you can add this instruction to:
> >
> > https://github.com/bee-headers/homebrew-bee-headers/blob/main/README.md
>
> Sure, that can be done as well. But the effort here is to have this
> integrated. So, I think documentation should be in-tree.



I do not think so.


Most people are not compile-testing on macOS.

This is an unofficial tip, which you can advertise
somewhere else.




--=20
Best Regards
Masahiro Yamada

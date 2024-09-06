Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A9596F86B
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 17:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98B1610EAA3;
	Fri,  6 Sep 2024 15:37:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="D+uGcia6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AFF710EAA2;
 Fri,  6 Sep 2024 15:37:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C307F5C5984;
 Fri,  6 Sep 2024 15:37:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EBEBC4AF0C;
 Fri,  6 Sep 2024 15:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725637075;
 bh=2UKmaZtNLMhEviH6IeYoUF4i0dN1ltzq9GMvMgOlDQg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=D+uGcia6C1rMFfGtzuNOkJuofRcalbpLcwqkWo4QCWmBvbKYPJGA/uSDWpwZjBbmB
 njLZLd39uJ74CDwwpHnOywo+j9w6RfLW9osPDFdwmgM58Feg3ncW7nfU9kwamY+IMy
 99Py1s10IMSqqtK6gyrueYStEJqVfklEmVG7fAAmOMmjp7xtwGpS2Qy70uF4wbani/
 Arp55SZxjIHtg+pC2RSd0gh/dunKUeUaGhb0g6r6jx92vIQXhc9rNmXyDaGmHGxnxH
 mMaAlC4PbOxH77iNGW7Pvshd1MvQ6r6pNMr6RuFr1dAs5SjdWnfJTeb/GI6MK/vsYd
 QhGUIsjQ5VrGw==
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5365cf5de24so14543e87.1; 
 Fri, 06 Sep 2024 08:37:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVgCCs/q4YpRFuWjbxgcFtxu1l3/7P5tZZTjLzTnLc/KPrxDR2MQJGsdQiafxo5XkA3Oi6SQjw6aJY=@lists.freedesktop.org,
 AJvYcCXT9wwbg0553RZOI+an1HvAa1Hti3S0YAimUuTeiq9KtD4dY8gEjk72Isk8ZJ8oNLD20zyOxcQBB0o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdVRk9PuZ2FhVJdjybZURiiWohPG/aonK+G+X42+kVdiYo3w/q
 eEUKXcWZZ3fPmaynxxfwBFvppTCjtpQvtdGGAaql91Bty7Ar4PAGvAuPbyGOjGqY2KuSW4e1nQ8
 T/5inf4+VbKWX+P6GN/d2wCHWgmk=
X-Google-Smtp-Source: AGHT+IFANMBQ3/Jcqmb4USNwfdW9Zoa8E3V2AYrxt1g8TZNZwyh6S+HB/OdPYQYnVIS/P9F4Mt5DF0hoACFuvJ/eFH4=
X-Received: by 2002:a05:6512:104f:b0:533:46cc:a71e with SMTP id
 2adb3069b0e04-536588103damr2074798e87.54.1725637073910; Fri, 06 Sep 2024
 08:37:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240906-macos-build-support-v2-0-06beff418848@samsung.com>
 <20240906-macos-build-support-v2-7-06beff418848@samsung.com>
 <CAHC9VhQkstJ8Ox-T+FLU34s9U0gezRba6bMA-tUPs80u6sVh2g@mail.gmail.com>
In-Reply-To: <CAHC9VhQkstJ8Ox-T+FLU34s9U0gezRba6bMA-tUPs80u6sVh2g@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 7 Sep 2024 00:37:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQytsDzaJfAJA0nL=KPjxj3DBCRLeuHUwgGDt8fTJ0fTQ@mail.gmail.com>
Message-ID: <CAK7LNAQytsDzaJfAJA0nL=KPjxj3DBCRLeuHUwgGDt8fTJ0fTQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] selinux: move genheaders to security/selinux/
To: Paul Moore <paul@paul-moore.com>
Cc: da.gomez@samsung.com, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, 
 Kirk Reiser <kirk@reisers.ca>, Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
 Justin Stitt <justinstitt@google.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 speakup@linux-speakup.org, selinux@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-serial@vger.kernel.org, llvm@lists.linux.dev, 
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

On Fri, Sep 6, 2024 at 11:54=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
>
> On Fri, Sep 6, 2024 at 7:01=E2=80=AFAM Daniel Gomez via B4 Relay
> <devnull+da.gomez.samsung.com@kernel.org> wrote:
> >
> > From: Masahiro Yamada <masahiroy@kernel.org>
> >
> > This tool is only used in security/selinux/Makefile.
> >
> > There is no reason to keep it under scripts/.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >  scripts/remove-stale-files                                    | 3 +++
> >  scripts/selinux/Makefile                                      | 2 +-
> >  scripts/selinux/genheaders/.gitignore                         | 2 --
> >  scripts/selinux/genheaders/Makefile                           | 3 ---
> >  security/selinux/.gitignore                                   | 1 +
> >  security/selinux/Makefile                                     | 7 ++++=
+--
> >  {scripts/selinux/genheaders =3D> security/selinux}/genheaders.c | 0
> >  7 files changed, 10 insertions(+), 8 deletions(-)
>
> Did you read my comments on your previous posting of this patch?  Here
> is a lore link in case you missed it or it was swallowed by your
> inbox:
>
> https://lore.kernel.org/selinux/3447459d08dd7ebb58972129cddf1c44@paul-moo=
re.com
>
> Unless there is an serious need for this relocation, and I don't see
> one explicitly documented either in this patchset or the previous, I
> don't want to see this patch go upstream.


I commented on the previous thread.


I will reword it as follows:


--------------->8--------------------
selinux: move genheaders to security/selinux/

This tool is only used in security/selinux/Makefile.

Move it to security/selinux/ so that 'make clean' can clean it up.

Please note 'make clean' does not visit scripts/ because tools under
scripts/ are often used for external module builds. Obviously, genheaders
is not the case here.
--------------->8--------------------






--
Best Regards

Masahiro Yamada

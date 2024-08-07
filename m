Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D67F94B12E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 22:22:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF2310E5CD;
	Wed,  7 Aug 2024 20:22:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.b="KxFeNg3V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEFF210E172
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 16:21:01 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-699ac6dbf24so119917b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2024 09:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore.com; s=google; t=1723047661; x=1723652461;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gLIeHC32QQFW2KzLfSivT5ewKagCTjZMp/GPtEGBlcs=;
 b=KxFeNg3VI5ZRr8O84bxvmUh3W2QeyxvGJS87VTvMNHh/ooM/KjG8wmEZ+FslfqKhYS
 lL7b53KZj0OzN3uUlouiQM8t4AEXxVF+WsXcnEjaxhwUfqRKvKLvMO3mXFRkfVPa6O62
 3qOU/CXUgFJylylPgQ2sVYURiCx0Cf3NIEbbj0/OBS4r7nMYowYa2k4hmKiUhTiC9QFf
 GR2mvX/lYPniAyKNDa4+nExjp+3VjzkklbNvXrf2Lg8+cocZfnvB44v79uye6/IONGsc
 tnQA9CiSLuL5FxtVxNgfCmHzHqjdUr17ymxzBNk2900ikbb/bHKtckq+Qhh+BiyvW/YE
 x6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723047661; x=1723652461;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gLIeHC32QQFW2KzLfSivT5ewKagCTjZMp/GPtEGBlcs=;
 b=jWKYrDq40GegrfNj5pfIq5IU0xAjVJ9ZN91E7wbbtAPg3fDkvRzFPDEE/A8b+eY6FJ
 v1Gib/5qrxyBy27J3e/UPKyVFRj2NmiKBwhbPRv2kXZC71mXzC8jBWTvjcV6v5FiSrGJ
 WFKgouuTr4sr912ImaARPlhEZsCtjHkIkqI2U5ClD+e3trURoOSTXtnv7U27DIoO5+nO
 J8RY8hmh2RLyL7BA14Ca7VnEoyn7T/QNYYBxJKsSgCLqbXW+6nTimfcX1xCC1qkty9Au
 DMKAHnTMbpvwydXRMVbyOmqjChbMay4pBmBSJgscEvBfrlBQJHAVcxeWjKp1XuwpEr0L
 DYAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPZUOvO//nna42pOOyjoZmOVGs+ceUj0ZYfrvp8qMEQVI9gRPOyPNL/minOpRPQn0u4r28xkMAK7U3bNwAaC0RcRSgVvwv/qpUcF1XdpBP
X-Gm-Message-State: AOJu0YxoNh7e9RcI+pmh537cxznAxhzEqJ2564lIJAqYtKhChUR10Sc/
 8A37rvYMSz7m9fh3vyCLJRgnoJgreokasFLml0B/VDiisEGNrEyBMgzgyqBbzjbYvLtjkFBLSpV
 fOh6fK66PnUQysSh6/eP2dFKIEsEJ6DcTqdJp
X-Google-Smtp-Source: AGHT+IFlMQZM11eMhKYm88nwqqB//YSwgE91qY+0p4KKcANp0MWW6pOsqJvjDDmdPT/npZIBCFW4JUe0qIrb5ggxQJM=
X-Received: by 2002:a05:6902:1506:b0:e08:631a:742c with SMTP id
 3f1490d57ef6-e0bde2cf614mr20513586276.16.1723047660711; Wed, 07 Aug 2024
 09:21:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
 <20240807-macos-build-support-v1-6-4cd1ded85694@samsung.com>
 <20240807-outgoing-charcoal-collie-0ee37e@lindesnes>
 <CAK7LNAQ21o+cQQaLD1xkwSX0ma8hvB29DMDquy5VjHcBWwhGPw@mail.gmail.com>
In-Reply-To: <CAK7LNAQ21o+cQQaLD1xkwSX0ma8hvB29DMDquy5VjHcBWwhGPw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 7 Aug 2024 12:20:49 -0400
Message-ID: <CAHC9VhS5e4=CK=svEPz=3zGm_FxDXdMoS4M7BUKj8z4sUf17Bw@mail.gmail.com>
Subject: Re: [PATCH 06/12] selinux/genheaders: include bitsperlong and
 posix_types headers
To: Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
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
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
 Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, speakup@linux-speakup.org, 
 selinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-serial@vger.kernel.org, llvm@lists.linux.dev, 
 Finn Behrens <me@kloenk.dev>, "Daniel Gomez (Samsung)" <d+samsung@kruces.com>,
 gost.dev@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 07 Aug 2024 20:21:51 +0000
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

On Wed, Aug 7, 2024 at 11:45=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Thu, Aug 8, 2024 at 12:39=E2=80=AFAM Nicolas Schier <nicolas@fjasle.eu=
> wrote:
> >
> > On Wed, Aug 07, 2024 at 01:09:20AM +0200, Daniel Gomez via B4 Relay wro=
te:
> > > From: Daniel Gomez <da.gomez@samsung.com>
> > >
> > > The genheaders requires the bitsperlong.h and posix_types.h headers.
> > > To ensure these headers are found during compilation on macOS hosts,
> > > add usr/include to HOST_EXTRACFLAGS in the genheaders Makefile. This
> > > adjustment allows the compiler to locate all necessary headers when t=
hey
> > > are not available by default on macOS.
> > >
> > > Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> > > ---
> > >  scripts/selinux/genheaders/Makefile | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/scripts/selinux/genheaders/Makefile b/scripts/selinux/ge=
nheaders/Makefile
> > > index 1faf7f07e8db..017149c90f8e 100644
> > > --- a/scripts/selinux/genheaders/Makefile
> > > +++ b/scripts/selinux/genheaders/Makefile
> > > @@ -2,4 +2,5 @@
> > >  hostprogs-always-y +=3D genheaders
> > >  HOST_EXTRACFLAGS +=3D \
> > >       -I$(srctree)/include/uapi -I$(srctree)/include \
> > > -     -I$(srctree)/security/selinux/include
> > > +     -I$(srctree)/security/selinux/include \
> > > +     -I$(srctree)/usr/include
> >
> > 'make headers' composes the UAPI header tree in $(objtree)/usr/include.
> > So, if you build out-of-source, -I$(srctree)/usr/include will not match=
.
> > Just remove the '$(srctree)/' prefix as '$(objtree)/' is always '.'.
>
> Right.
>
> > But I am suspecting that this break cross-building.
>
> Right.
>
> We cannot do this.

Thanks for the review and catching this :)

--=20
paul-moore.com

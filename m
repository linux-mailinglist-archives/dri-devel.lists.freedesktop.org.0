Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8AD70FA99
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 17:41:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C84510E48B;
	Wed, 24 May 2023 15:41:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE49E10E48B
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 15:41:24 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2537909d28cso304331a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 08:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684942884; x=1687534884;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qcbUUGVfTv0206jjEB8o4zl0tBTpQPMIXhfv9powgIA=;
 b=JUoEUqL9GCgT64YKyjTsSQLQyssCo2s5DjVICCVLyGVKEPYbtva9Ge94Hou/lv8gyq
 ekATbbNOC0VO/PyLa2Ep7VjZXnnzTvur5bs2GALGrLH+HNpQIycHn2U2iN8xzbm6NCGs
 N6TEpy93B1shn1wbe+dPvnPBcSVNJH89RxOyalT3qgkSP2YttLq7MLe7J6bDG6eqvfd0
 tUv7oIdZ0U+r2cqKzOceAj+u6Uw8rLTTdGRLVYycyweaWQ+P/ZwFbTXoyYulKXCTILzk
 9P6YeOun9KmQDSvlhV76rsTPsaBCf6kmxtvkRt+8Zx/BxB6hJ6jWIKhFZZsYELImuZRh
 x6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684942884; x=1687534884;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qcbUUGVfTv0206jjEB8o4zl0tBTpQPMIXhfv9powgIA=;
 b=QwyWSrN8HskYg6Dz8Qk+78he3ZPBa1ZTU5wM+ASrbFRj/pMedxyw1s4ndrLC3jutxK
 fOLf5A5moaT+ZOhDjA2UxnaRQnmL01xoR0rznnSGEV74YfKz9wKsRm8a4f+udq9M7TxH
 ogy2hUewZ4ej6oQiM7ixOaTEfXSv44CWhCbMuCZayVCmbyHIJ5yivra7NGQasnkfdPjE
 VIopb7r7EV9Nggyd9Ogjs4IvHlkHgjXD5MAQ2sYKSfs3pDBCm3iT8+i2q0IqXdksdaij
 TW8N3aTFq4vZ2vKjo6VwVd+I0pMl7uAxTMGsoWQY3uvGAo5HZxBgrEuaLIu4uwVBG+D9
 UMQQ==
X-Gm-Message-State: AC+VfDxxXmzRB0t2OBNrmO2Uy1V0iLlyx4Dw/9W4CVTdMkpq9QC8EQ/X
 lCsze8V0E6l935BXx4I7eiIUZuUQne+exx3VmM3l/w==
X-Google-Smtp-Source: ACHHUZ5dswG3Tqnl2xznNJrUJTgaWJumpj8L1ig619SMi30QFXbZx6bqoCnlMVQEF4vymExc6hDQ1r5IL1lElyMkZog=
X-Received: by 2002:a17:90a:b389:b0:255:a1db:346d with SMTP id
 e9-20020a17090ab38900b00255a1db346dmr6718829pjr.25.1684942884011; Wed, 24 May
 2023 08:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYv68V3ewK0Qj-syQj7qX-hQr0H1MFL=QFNuDoE_J2Zu-g@mail.gmail.com>
 <20230524153918.GA869320@dev-arch.thelio-3990X>
In-Reply-To: <20230524153918.GA869320@dev-arch.thelio-3990X>
From: =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
Date: Wed, 24 May 2023 09:41:12 -0600
Message-ID: <CAEUSe7-PUh4cDs_pQR6kp6GvAfz6qoqdPaOxRMMHz6YeXRuxAA@mail.gmail.com>
Subject: Re: next: clang: x86_64: /intel_display.c:6012:3: error: unannotated
 fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
To: Nathan Chancellor <nathan@kernel.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Naresh Kamboju <naresh.kamboju@linaro.org>,
 clang-built-linux <llvm@lists.linux.dev>, dri-devel@lists.freedesktop.org,
 arun.r.murthy@intel.com, Linux-Next Mailing List <linux-next@vger.kernel.org>,
 lkft-triage@lists.linaro.org, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello!

On Wed, 24 May 2023 at 09:39, Nathan Chancellor <nathan@kernel.org> wrote:
> Hi Naresh,
>
> On Wed, May 24, 2023 at 12:32:24PM +0530, Naresh Kamboju wrote:
> > Linux next-20230523 and next-20230524 the x86_64 and i386 builds failed
> > with clang.
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > make --silent --keep-going \
> >   --jobs=3D8 O=3D/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=3Dx8=
6_64 \
> >   SRCARCH=3Dx86 CROSS_COMPILE=3Dx86_64-linux-gnu- \
> >   'HOSTCC=3Dsccache clang' 'CC=3Dsccache clang' \
> >    LLVM=3D1 LLVM_IAS=3D1
> >
> > drivers/gpu/drm/i915/display/intel_display.c:6012:3: error:
> > unannotated fall-through between switch labels
> > [-Werror,-Wimplicit-fallthrough]
> >                 case I915_FORMAT_MOD_X_TILED:
> >                 ^
> > drivers/gpu/drm/i915/display/intel_display.c:6012:3: note: insert
> > 'break;' to avoid fall-through
> >                 case I915_FORMAT_MOD_X_TILED:
> >                 ^
> >                 break;
> > 1 error generated.
>
> Thanks for the report, I have sent
> https://lore.kernel.org/20230524-intel_async_flip_check_hw-implicit-fallt=
hrough-v1-1-83de89e376a1@kernel.org/
> for this.

Better link: https://lore.kernel.org/dri-devel/20230524-intel_async_flip_ch=
eck_hw-implicit-fallthrough-v1-1-83de89e376a1@kernel.org/

Greetings!

Daniel D=C3=ADaz
daniel.diaz@linaro.org

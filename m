Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A84189D4570
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 02:50:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E1210E800;
	Thu, 21 Nov 2024 01:49:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Gr6rhYxv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8563C10E800;
 Thu, 21 Nov 2024 01:49:57 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-83b430a4cfdso16545339f.2; 
 Wed, 20 Nov 2024 17:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732153797; x=1732758597; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JWUCvJsSdXoIhC6o2UMOCGwxpjGSWTPIQOwgtRNzfoc=;
 b=Gr6rhYxvR5t87rrywnwBIf9ICnHECYDMuwJsu25RjbmQcChUnswRvOxFky1lNlT1JO
 2+ltZdzlWUvle/P7oG63LdZVxYBHgVO2Sl1fnFYqM/NiQSDfsPOjnj6Utu61ddGorLwO
 cy3Sn7pLnaGDZ+T+58Jb/dZxHzYQsl2wlHucQ77Tt5nWcYoSEnXZMTxeGLDyanFpTQOe
 eAd2kf7pOTNKgihhw147B0RhHPAQp7p7pBQfv775O9qve5pMtYLe3mJIqs0TkdJiX3iY
 vHOMQ6ah26+CICfdw7xiV85gWCs2z1gDIqowKTA/qn7CzabI1YLRHk2xT7naxCi3hPa6
 OV3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732153797; x=1732758597;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JWUCvJsSdXoIhC6o2UMOCGwxpjGSWTPIQOwgtRNzfoc=;
 b=TbfMVo+F609/m/pyc3kmz9B7qT6jgszGnqZ8Mt5owbCrrWCuuqgCSTtTkFQhyom5By
 5hVHoO8khATV163TQeGgLBxceFDQ5fgpfWqJbPP0gRw8I6YKpG3bG/q+LuFOeMoX3C/F
 zQeQqmoQl+GKNoX9W1h6rfpJxZbgcF3lqsRIvIXyoiRK1aoB6sgRhor3g5XWvQGXa0gg
 mY4I0LRl0NI/ckQUf0kfUm1m2KuTqJKhY7mJLhDLBUFHFBjiDnRb5cClCQsqv57Ye3YM
 bjwCY+U+JddNkm+GqC9VbRpUgQvSYUXcTKTr/33svIko0QdriKVbUUYoTs3oI4smGLwx
 ljCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCViotE+mDPVOe1ubcNoPBqmm3TeRMX+sLNxnVEYUTdo9N7tXs0a4dJYHwLfnl+SNA3FKgSWPdG2GsM=@lists.freedesktop.org,
 AJvYcCXvfCf42PA5KO1Prt9cVHEnvaiQ8H9/JgEFzbGaRqs3Of6KuRXZNyWZVZ92Z+5WifuEwH9M3z65CZ7i@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydqglWICV1Zii0o2UI5cwEGcU3omEbXDH6fE5Na8NE/SuvpKw0
 GpuKP626CTJcWZxHTWH6LPs9iKUKk4BKeD+cIbDz2/dul2oAT5L+AR0IVp2iIB2Hv98zRgolBt5
 ppGkxNrpaI49BoNE992igcmPFDKc=
X-Gm-Gg: ASbGncsqTfSB55psmaioVKI74hnWU+jpmh4IiDjmCQErHtqoUY9kxtSsUds+52QnoeN
 y0urpnSo2iMrTU7vvfUl5ocDP154qRR8=
X-Google-Smtp-Source: AGHT+IFh8SZLjAYfaOvwEHKsujNC4f1OC6rw1sfTwjSfqOhitM4CoORxUcXQ/f2DBftwZf2WYV9HSVnid5nQordIXA4=
X-Received: by 2002:a05:6602:13d4:b0:82a:7181:200f with SMTP id
 ca18e2360f4ac-83eb5ff1397mr521065939f.9.1732153796731; Wed, 20 Nov 2024
 17:49:56 -0800 (PST)
MIME-Version: 1.0
References: <20241120204125.52644-1-pvorel@suse.cz>
 <CAK7LNASYr+pjUs-W40d_Gc+vP67nX7NHXyE0AnOpXxXgxrCtqQ@mail.gmail.com>
 <20241121011720.GA69389@pevik>
In-Reply-To: <20241121011720.GA69389@pevik>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 20 Nov 2024 17:49:44 -0800
Message-ID: <CAF6AEGuzFNVd5fE+b+hKcC8xAOg7CrkPaYuWC6tCVmioutoOOw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] init/Kconfig: add python3 availability config
To: Petr Vorel <pvorel@suse.cz>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 linux-kbuild@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Wed, Nov 20, 2024 at 5:17=E2=80=AFPM Petr Vorel <pvorel@suse.cz> wrote:
>
> > On Thu, Nov 21, 2024 at 5:41=E2=80=AFAM Petr Vorel <pvorel@suse.cz> wro=
te:
>
> > > It will be used in the next commit for DRM_MSM.
>
> > > Suggested-by: Rob Clark <robdclark@gmail.com>
> > > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > > ---
> > > Changes v3->v4:
> > > * Move definition to the end of the file
>
>
> > I prefer to not check the tool.
>
> Ack.
>
> > Why don't you install python3?
>
> Everybody installs it when it's required, the question is how to inform a=
bout
> the dependency.
>
> There build environments are minimal environments:
> * chroot (e.g. cross compilation)
> * container
>
> These are used by both developers and distros.

I don't think py3 is an _onerous_ dependency, but it has come up as a
surprise in minimal distro build environments at least once.. so I'd
be a fan of surfacing this dependency in a predictable/understandable
way (ie. I'm in favor of this patchset)

BR,
-R

> Kind regards,
> Petr
>
> > >  init/Kconfig | 3 +++
> > >  1 file changed, 3 insertions(+)
>
> > > diff --git a/init/Kconfig b/init/Kconfig
> > > index fbd0cb06a50a..c77e45484e81 100644
> > > --- a/init/Kconfig
> > > +++ b/init/Kconfig
> > > @@ -2047,3 +2047,6 @@ config ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
> > >  # <asm/syscall_wrapper.h>.
> > >  config ARCH_HAS_SYSCALL_WRAPPER
> > >         def_bool n
> > > +
> > > +config HAVE_PYTHON3
> > > +       def_bool $(success,$(PYTHON3) -V)
> > > --
> > > 2.45.2

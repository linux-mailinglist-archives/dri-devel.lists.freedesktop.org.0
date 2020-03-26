Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CF6194AA5
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 22:35:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2338B6E93A;
	Thu, 26 Mar 2020 21:34:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351766E214;
 Thu, 26 Mar 2020 20:12:02 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id t25so6774220oij.2;
 Thu, 26 Mar 2020 13:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=Q+Ax8x2vU+R+U6VbmPmYqkXtNPWfs1Jy/4mzvcdEYZg=;
 b=BphgvEckoK0ht7HlgFAnRZJk+fpNqINscW4e//FspZihcDb25k/h5kIlBffKJljiQS
 peela2MsUVMmRX7nnOcsdPdSygsxdUXaYK2jgEQUcY70x+NLHAF91LcLtSvgFx1pYMVJ
 ISXXyg7ZH8KnI/1rK5mc3eN597BYC7CEeNp6ssy3f91JILcdK3ytTmtPW7QM51hedGWS
 UC1qAymWlYlSDx2YgYJM5ISOrEaMlrp1RhnCao+KrOsOcsTexWQ4UFDeWEaL4ioawW3X
 oAUUW87wFw8TdFXqWfIXbfgAUo3rz0TWin5N6BmLHTqumXF/VuUskIM0KbJTi+kZuXzJ
 OC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Q+Ax8x2vU+R+U6VbmPmYqkXtNPWfs1Jy/4mzvcdEYZg=;
 b=cSjmYnsv9MLzVH731BKc8wmjh6L5m/KFqvsTH31w6q+y+REKH2DoYdm2pXwiaSH2R/
 VeeTE11ZUv/wFK9h3oFZOzg18MBMpkTJ467ekmWSB1a6vFiR/mvWsvTYzsgFqXdG8KZb
 35XpvHg07PhYubtZ6JV0bY6taFdlHjFETFTeSV/CO/aQWFysXA13/X+Hw25d4WBXBD+3
 KKsFS5s1KEVwrD0+v1T/OAn+Fal2qrUGwRX1bzo5LwF/iVHUASTsxcqThGf+RWEBayu4
 7Swp/T/S6ggNnDgGanFQ233DrIo6QVDnpCp6/XJfWLZLzh2o60ayszwmW6c5KPIMltAT
 YORg==
X-Gm-Message-State: ANhLgQ1Bh5YQw4mktRjp5xutZ4xqODLuspMQDItpkwg93PL5kloMxJmj
 yQ9r4NjQev0U0U7fvf4IVUQ=
X-Google-Smtp-Source: ADFU+vtPiVQu2F9SE5eGhZSoLiCecLF2dP70MsPljd+2jH7CppiNm5fY/jDEoS7okH0q+UO2gRUPPw==
X-Received: by 2002:aca:af97:: with SMTP id y145mr1534969oie.24.1585253521437; 
 Thu, 26 Mar 2020 13:12:01 -0700 (PDT)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id f45sm880530otf.30.2020.03.26.13.12.00
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 26 Mar 2020 13:12:00 -0700 (PDT)
Date: Thu, 26 Mar 2020 13:11:58 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/i915: Cast remain to unsigned long in eb_relocate_vma
Message-ID: <20200326201158.GA30083@ubuntu-m2-xlarge-x86>
References: <20200214054706.33870-1-natechancellor@gmail.com>
 <87v9o965gg.fsf@intel.com>
 <158166913989.4660.10674824117292988120@skylake-alporthouse-com>
 <87o8u1wfqs.fsf@intel.com>
 <ff302c03-d012-a80d-b818-b7feababb86b@daenzer.net>
 <CAKwvOdnaRG=7mib9vtWX4wkjQXHeUiioonTaZLStMVXfOOSUfw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKwvOdnaRG=7mib9vtWX4wkjQXHeUiioonTaZLStMVXfOOSUfw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 26 Mar 2020 21:34:52 +0000
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
Cc: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 16, 2020 at 02:41:23PM -0700, Nick Desaulniers wrote:
> On Fri, Feb 14, 2020 at 7:36 AM Michel D=E4nzer <michel@daenzer.net> wrot=
e:
> >
> > On 2020-02-14 12:49 p.m., Jani Nikula wrote:
> > > On Fri, 14 Feb 2020, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > >> Quoting Jani Nikula (2020-02-14 06:36:15)
> > >>> On Thu, 13 Feb 2020, Nathan Chancellor <natechancellor@gmail.com> w=
rote:
> > >>>> A recent commit in clang added -Wtautological-compare to -Wall, wh=
ich is
> > >>>> enabled for i915 after -Wtautological-compare is disabled for the =
rest
> > >>>> of the kernel so we see the following warning on x86_64:
> > >>>>
> > >>>>  ../drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:1433:22: warnin=
g:
> > >>>>  result of comparison of constant 576460752303423487 with expressi=
on of
> > >>>>  type 'unsigned int' is always false
> > >>>>  [-Wtautological-constant-out-of-range-compare]
> > >>>>          if (unlikely(remain > N_RELOC(ULONG_MAX)))
> > >>>>             ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
> > >>>>  ../include/linux/compiler.h:78:42: note: expanded from macro 'unl=
ikely'
> > >>>>  # define unlikely(x)    __builtin_expect(!!(x), 0)
> > >>>>                                             ^
> > >>>>  1 warning generated.
> > >>>>
> > >>>> It is not wrong in the case where ULONG_MAX > UINT_MAX but it does=
 not
> > >>>> account for the case where this file is built for 32-bit x86, where
> > >>>> ULONG_MAX =3D=3D UINT_MAX and this check is still relevant.
> > >>>>
> > >>>> Cast remain to unsigned long, which keeps the generated code the s=
ame
> > >>>> (verified with clang-11 on x86_64 and GCC 9.2.0 on x86 and x86_64)=
 and
> > >>>> the warning is silenced so we can catch more potential issues in t=
he
> > >>>> future.
> > >>>>
> > >>>> Link: https://github.com/ClangBuiltLinux/linux/issues/778
> > >>>> Suggested-by: Michel D=E4nzer <michel@daenzer.net>
> > >>>> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > >>>
> > >>> Works for me as a workaround,
> > >>
> > >> But the whole point was that the compiler could see that it was
> > >> impossible and not emit the code. Doesn't this break that?
> > >
> > > It seems that goal and the warning are fundamentally incompatible.
> >
> > Not really:
> >
> >     if (sizeof(remain) >=3D sizeof(unsigned long) &&
> >         unlikely(remain > N_RELOC(ULONG_MAX)))
> >              return -EINVAL;
> >
> > In contrast to the cast, this doesn't generate any machine code on 64-b=
it:
> >
> > https://godbolt.org/z/GmUE4S
> >
> > but still generates the same code on 32-bit:
> >
> > https://godbolt.org/z/hAoz8L
> =

> Exactly.
> =

> This check is only a tautology when `sizeof(long) =3D=3D sizeof(int)` (ie.
> ILP32 platforms, like 32b x86), notice how BOTH GCC AND Clang generate
> exactly the same code: https://godbolt.org/z/6ShrDM
> =

> Both compilers eliminate the check when `-m32` is not set, and
> generate the exact same check otherwise.  How about:
> ```
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index d3f4f28e9468..25b9d3f3ad57 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -1415,8 +1415,10 @@ static int eb_relocate_vma(struct
> i915_execbuffer *eb, struct eb_vma *ev)
> =

>         urelocs =3D u64_to_user_ptr(entry->relocs_ptr);
>         remain =3D entry->relocation_count;
> +#ifndef CONFIG_64BIT
>         if (unlikely(remain > N_RELOC(ULONG_MAX)))
>                 return -EINVAL;
> +#endif
> =

>         /*
>          * We must check that the entire relocation array is safe
> ```
> =

> We now have 4 proposed solutions:
> 1. https://lore.kernel.org/lkml/20191123195321.41305-1-natechancellor@gma=
il.com/
> 2. https://lore.kernel.org/lkml/20200211050808.29463-1-natechancellor@gma=
il.com/
> 3. https://lore.kernel.org/lkml/20200214054706.33870-1-natechancellor@gma=
il.com/
> 4. my diff above
> Let's please come to a resolution on this.

This is the only warning on an x86_64 defconfig build. Apologies if we
are being too persistent or nagging but we need guidance from the i915
maintainers on which solution they would prefer so it can be picked up.
I understand you all are busy and I appreciate the work you all do but
I do not want this to fall between the cracks because it is annoying to
constantly see this warning.

Cheers,
Nathan
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

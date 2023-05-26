Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A32B6712B13
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 18:51:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6347E10E81E;
	Fri, 26 May 2023 16:51:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF0610E1D5
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 16:51:38 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id
 6a1803df08f44-6238b15d298so9965336d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 09:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1685119897; x=1687711897;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B0EcAbr12Tz3JaIJZGOfuX6nKlF7eHCwWePp0l1EnR0=;
 b=ZQAf4LUZzgLtNI1iuErVfrDk5RtwHd5YprqowAtUBbv7Kz6xOQfmdZi/1o5/n30lQE
 /tpfYmZDRVi4NoxJIuNvdO9aqoj4c9kwfIW1rEqzNszwi76gHAD+BGX2cV/Zd3s+NTMZ
 E4LKP1wu9x8pSzqzw57xxLCOhqzW+XL9oX/UQsKnneky5T2OfUWG5XoKACPfuYsoe8Uz
 OLVd8dGzB0x+YRg7KmLHG59ArbV8g7o7IlHkeiBGwa9sKUG7yGRVlrMm1uYGu+qlM1LL
 RGjTDUiCcBQEZsGuPruFUneQF+eACEbsKJDXp5xVByVgYkV3VN6qQGHsL9fuVdYTAyeH
 GMNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685119897; x=1687711897;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B0EcAbr12Tz3JaIJZGOfuX6nKlF7eHCwWePp0l1EnR0=;
 b=V7a8Y/HzfamB+LpU11/8FtSlCBAaU05SbQbPiXx9X/eE67CxfbVAnUa3HSl45KHHBH
 uJXawIgHpb9Llk0t5fm0oL9PzXaXcRyfj+VmHgfF8ZDGqAtXQUg8V9BXg9HIrtsYXr9D
 1XgHYKbEyIRIWeuKyYAucWrNUqlKjRUzrGw3lqYQJP99gyuLzINCq+b84H1OBcCGPNiU
 dR+EMybYC4ZYEgieIn/62jcFmj3uLZkyD5HJ8AmmKJpAYbWTQWjyXYZw3bxP7R/C1gO0
 zkTPF3jd25NuozoAXk+Am2S4/V+uh0eHmFO+NYiPGvTtTDiWoCkmlNF1aalNItXcJ7+l
 FJfA==
X-Gm-Message-State: AC+VfDyheeIMhV7nBfuDLIdQRDjleasGJV4YTzWd8OGiyKICPuyAjuPq
 32RBgl6j3xYRbGSdoUQzqEd+1eeCd+2M5lfj948eYA==
X-Google-Smtp-Source: ACHHUZ7zNVT9E5+KkqBP+ZTyfqvDGI2d6bY2hRADL+qOK3dL+ftIEtrLh4N7cS11/o6IrVHRuLLfI56tUId+yu2rsJQ=
X-Received: by 2002:ad4:5ce6:0:b0:625:e039:5b03 with SMTP id
 iv6-20020ad45ce6000000b00625e0395b03mr3237442qvb.54.1685119897248; Fri, 26
 May 2023 09:51:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230524-intel_async_flip_check_hw-implicit-fallthrough-v1-1-83de89e376a1@kernel.org>
 <CAKwvOd=jZJouuNMd3Rvc--goA0EXPHcf6cHXUA6W1kXJg2ay2w@mail.gmail.com>
 <20230524184103.GA324296@dev-arch.thelio-3990X>
 <CAKwvOdm=Zk8YhrPptN3k7UQo+1n7Ws=Qox=BwTR9bbjPJJYz8A@mail.gmail.com>
 <39da7e41-dd07-b8bc-57b9-19b05fdfbeac@tessares.net>
In-Reply-To: <39da7e41-dd07-b8bc-57b9-19b05fdfbeac@tessares.net>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 26 May 2023 09:51:26 -0700
Message-ID: <CAKwvOdkFxUU4AM9WbcRK9FYHq0cK2H-x4i5_x7oYiE7=DjghhQ@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: Fix clang -Wimplicit-fallthrough in
 intel_async_flip_check_hw()
To: Matthieu Baerts <matthieu.baerts@tessares.net>
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
Cc: tvrtko.ursulin@linux.intel.com, llvm@lists.linux.dev,
 kernel test robot <lkp@intel.com>, trix@redhat.com,
 intel-gfx@lists.freedesktop.org, patches@lists.linux.dev,
 Nathan Chancellor <nathan@kernel.org>, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com, Joe Perches <joe@perches.com>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 25, 2023 at 1:30=E2=80=AFPM Matthieu Baerts
<matthieu.baerts@tessares.net> wrote:
>
> Hi Nick,
>
> On 24/05/2023 20:56, Nick Desaulniers wrote:
> > On Wed, May 24, 2023 at 11:41=E2=80=AFAM Nathan Chancellor <nathan@kern=
el.org> wrote:
> >>
> >> On Wed, May 24, 2023 at 11:32:32AM -0700, Nick Desaulniers wrote:
> >>> On Wed, May 24, 2023 at 8:38=E2=80=AFAM Nathan Chancellor <nathan@ker=
nel.org> wrote:
> >>>>
> >>>> Clang warns:
> >>>>
> >>>>   drivers/gpu/drm/i915/display/intel_display.c:6012:3: error: unanno=
tated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
> >>>>                   case I915_FORMAT_MOD_X_TILED:
> >>>>                   ^
> >>>>   drivers/gpu/drm/i915/display/intel_display.c:6012:3: note: insert =
'break;' to avoid fall-through
> >>>>                   case I915_FORMAT_MOD_X_TILED:
> >>>>                   ^
> >>>>                   break;
> >>>>   1 error generated.
> >>>>
> >>>> Clang is a little more pedantic than GCC, which does not warn when
> >>>> falling through to a case that is just break or return. Clang's vers=
ion
> >>>> is more in line with the kernel's own stance in deprecated.rst, whic=
h
> >>>> states that all switch/case blocks must end in either break,
> >>>> fallthrough, continue, goto, or return. Add the missing break to sil=
ence
> >>>> the warning.
> >>>>
> >>>> Fixes: 937859485aef ("drm/i915: Support Async Flip on Linear buffers=
")
> >>>> Reported-by: kernel test robot <lkp@intel.com>
> >>>> Closes: https://lore.kernel.org/202305241902.UvHtMoxa-lkp@intel.com/
> >>>> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> >>>> Closes: https://lore.kernel.org/CA+G9fYv68V3ewK0Qj-syQj7qX-hQr0H1MFL=
=3DQFNuDoE_J2Zu-g@mail.gmail.com/
> >>>> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> >>>
> >>> Thanks for the patch! I've never seen the closes tag before, that's
> >>> new to me. Can you tell me more about it?
> >>
> >> It is new to me (at least in the context of the kernel) as well. I onl=
y
> >> used it over Link: because checkpatch.pl told me to:
> >>
> >> WARNING: Reported-by: should be immediately followed by Closes: with a=
 URL to the report
> >> #26:
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> >>
> >> WARNING: Reported-by: should be immediately followed by Closes: with a=
 URL to the report
> >> #27:
> >> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> >> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> >>
> >> It was Link: for a bit but commit 44c31888098a ("checkpatch: allow
> >> Closes tags with links") changed it to Closes:. Looks odd to me but
> >> whatever the linter says I suppose.
> >>
> >> Thanks for the review!
> >>
> >> Cheers,
> >> Nathan
> >>
> >>> A few more tags
> >>>
> >>> Reported-by: Tom Rix <trix@redhat.com>
> >>> Link: https://lore.kernel.org/all/20230523125116.1669057-1-trix@redha=
t.com/
> >>> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> >
> > Ah then I guess my link tag should have been
> >
> > Closes: https://lore.kernel.org/all/20230523125116.1669057-1-trix@redha=
t.com/
> >
> > I hope the author of
> > commit 44c31888098a ("checkpatch: allow Closes tags with links")
> > has coordinated with the maintainer of b4, so that b4 recognizes Closes=
 tags.
> > b4 v0.12.2 does not pick up Closes tags.
>
> I'm sorry for the troubles caused by this series, that was not the
> intension.
>
> When looking at modifying b4 to support the Closes tag, I realised the
> Link tag from your previous message [1] was not taken as well. Was it
> just me?

oh? good find!

>
> If no, I just sent patches for b4, see [2]. I hope it will help!

appreciated! Thank you.

>
> Cheers,
> Matt
>
> [1]
> https://lore.kernel.org/all/CAKwvOd=3DjZJouuNMd3Rvc--goA0EXPHcf6cHXUA6W1k=
XJg2ay2w@mail.gmail.com/
> [2]
> https://lore.kernel.org/tools/20230525-closes-tags-v1-0-ed41b1773cb6@tess=
ares.net/T/
> --
> Tessares | Belgium | Hybrid Access Solutions
> www.tessares.net



--=20
Thanks,
~Nick Desaulniers

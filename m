Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B335EF120
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 11:01:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26C7710E3E3;
	Thu, 29 Sep 2022 09:01:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E31010E3C5
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 09:00:53 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id f26so377456qto.11
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 02:00:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Ir+IzupNAXvXvPBkZ1yh/qacu5xVXDJ2KC3L3ZMV+D4=;
 b=mRNKXG1DYIBAv5Zr+278wDvrAVYA694k4aeEUbJA56K71lt1fGblm6nOuDe74jCyjW
 yDolEJ1euTLR7qa0wLNyQutMX2HdhIgwW8Nb87egiiVHpyqEZ+4fNR3KieIEl7OjTcJl
 gxPpdI7IwLih0aqN9Wx0jaooLbSJc1AjkHJxQHpOirMtScz7r+Thn1Fb4ZN62tURGgiN
 Mx4srrewOOdN4laMUEV3LDCQuGKSWm9BGw5JBjueTbPK5E1yNaAqW/iKnY7O1dzO9wD2
 QIINfCLpnU5smSzuf0nhybCHQwcrcBJSIqBLCNcYNFj3ypKiI6E8dO6NNXl5QcyckwWy
 H3Xw==
X-Gm-Message-State: ACrzQf14FypEIZ7OT+2wvrOklwgOZSX7N+ksGvcHVMiRM9CQiAgIon/e
 wasCQBR9fn0Cn/EZo9yyI7wqg/iy/aAHMw==
X-Google-Smtp-Source: AMsMyM4y2zQnyrdbbqxficrjIMcxy6kWcOKZG6bOtFlLlsZnGgQmkMls9fRbkkE93LhuzpC5Zcbm0w==
X-Received: by 2002:ac8:4e89:0:b0:35d:5856:919a with SMTP id
 9-20020ac84e89000000b0035d5856919amr1402041qtp.647.1664442052054; 
 Thu, 29 Sep 2022 02:00:52 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175]) by smtp.gmail.com with ESMTPSA id
 s12-20020a05620a0bcc00b006ce7d9dea7asm5755476qki.13.2022.09.29.02.00.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 02:00:51 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 4so767030ybe.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 02:00:51 -0700 (PDT)
X-Received: by 2002:a5b:104:0:b0:6b0:429:3fe9 with SMTP id
 4-20020a5b0104000000b006b004293fe9mr2016091ybx.543.1664442041163; 
 Thu, 29 Sep 2022 02:00:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220923202822.2667581-1-keescook@chromium.org>
 <20220923202822.2667581-2-keescook@chromium.org>
 <CAMuHMdXK+UN1YVZm9DenuXAM8hZRUZJwp=SXsueP7sWiVU3a9A@mail.gmail.com>
 <202209281011.66DD717D@keescook> <874jwqfuh6.fsf@mpe.ellerman.id.au>
In-Reply-To: <874jwqfuh6.fsf@mpe.ellerman.id.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Sep 2022 11:00:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVOvs4adSV7G6ucZ8dcr+RxfZOOK=jXeO2tEAaXkv80Xg@mail.gmail.com>
Message-ID: <CAMuHMdVOvs4adSV7G6ucZ8dcr+RxfZOOK=jXeO2tEAaXkv80Xg@mail.gmail.com>
Subject: Re: [PATCH v2 01/16] slab: Remove __malloc attribute from realloc
 functions
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: Roman Gushchin <roman.gushchin@linux.dev>, dri-devel@lists.freedesktop.org,
 "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 Eric Dumazet <edumazet@google.com>, linux-hardening@vger.kernel.org,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Christoph Lameter <cl@linux.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, dev@openvswitch.org, x86@kernel.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 intel-wired-lan@lists.osuosl.org, David Rientjes <rientjes@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>, llvm@lists.linux.dev,
 Kees Cook <keescook@chromium.org>, Josef Bacik <josef@toxicpanda.com>,
 linaro-mm-sig@lists.linaro.org, Yonghong Song <yhs@fb.com>,
 David Sterba <dsterba@suse.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Vlastimil Babka <vbabka@suse.cz>, Alex Elder <elder@kernel.org>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pekka Enberg <penberg@kernel.org>, Daniel Micay <danielmicay@gmail.com>,
 netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michael,

On Thu, Sep 29, 2022 at 10:36 AM Michael Ellerman <mpe@ellerman.id.au> wrot=
e:
> Kees Cook <keescook@chromium.org> writes:
> > On Wed, Sep 28, 2022 at 09:26:15AM +0200, Geert Uytterhoeven wrote:
> >> On Fri, Sep 23, 2022 at 10:35 PM Kees Cook <keescook@chromium.org> wro=
te:
> >> > The __malloc attribute should not be applied to "realloc" functions,=
 as
> >> > the returned pointer may alias the storage of the prior pointer. Ins=
tead
> >> > of splitting __malloc from __alloc_size, which would be a huge amoun=
t of
> >> > churn, just create __realloc_size for the few cases where it is need=
ed.
> >> >
> >> > Additionally removes the conditional test for __alloc_size__, which =
is
> >> > always defined now.
> >> >
> >> > Cc: Christoph Lameter <cl@linux.com>
> >> > Cc: Pekka Enberg <penberg@kernel.org>
> >> > Cc: David Rientjes <rientjes@google.com>
> >> > Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
> >> > Cc: Andrew Morton <akpm@linux-foundation.org>
> >> > Cc: Vlastimil Babka <vbabka@suse.cz>
> >> > Cc: Roman Gushchin <roman.gushchin@linux.dev>
> >> > Cc: Hyeonggon Yoo <42.hyeyoo@gmail.com>
> >> > Cc: Marco Elver <elver@google.com>
> >> > Cc: linux-mm@kvack.org
> >> > Signed-off-by: Kees Cook <keescook@chromium.org>
> >>
> >> Thanks for your patch, which is now commit 63caa04ec60583b1 ("slab:
> >> Remove __malloc attribute from realloc functions") in next-20220927.
> >>
> >> Noreply@ellerman.id.au reported all gcc8-based builds to fail
> >> (e.g. [1], more at [2]):
> >>
> >>     In file included from <command-line>:
> >>     ./include/linux/percpu.h: In function =E2=80=98__alloc_reserved_pe=
rcpu=E2=80=99:
> >>     ././include/linux/compiler_types.h:279:30: error: expected
> >> declaration specifiers before =E2=80=98__alloc_size__=E2=80=99
> >>      #define __alloc_size(x, ...) __alloc_size__(x, ## __VA_ARGS__) __=
malloc
> >>                                   ^~~~~~~~~~~~~~
> >>     ./include/linux/percpu.h:120:74: note: in expansion of macro =E2=
=80=98__alloc_size=E2=80=99
> >>     [...]
> >>
> >> It's building fine with e.g. gcc-9 (which is my usual m68k cross-compi=
ler).
> >> Reverting this commit on next-20220927 fixes the issue.
> >>
> >> [1] http://kisskb.ellerman.id.au/kisskb/buildresult/14803908/
> >> [2] http://kisskb.ellerman.id.au/kisskb/head/1bd8b75fe6adeaa89d02968bd=
d811ffe708cf839/
> >
> > Eek! Thanks for letting me know. I'm confused about this --
> > __alloc_size__ wasn't optional in compiler_attributes.h -- but obviousl=
y
> > I broke something! I'll go figure this out.
>
> This fixes it for me.

Kees submitted a similar patch 20 minutes before:
https://lore.kernel.org/all/20220929081642.1932200-1-keescook@chromium.org

> --- a/include/linux/compiler_types.h
> +++ b/include/linux/compiler_types.h
> @@ -275,8 +275,13 @@ struct ftrace_likely_data {
>   * be performing a _reallocation_, as that may alias the existing pointe=
r.
>   * For these, use __realloc_size().
>   */
> -#define __alloc_size(x, ...)   __alloc_size__(x, ## __VA_ARGS__) __mallo=
c
> -#define __realloc_size(x, ...) __alloc_size__(x, ## __VA_ARGS__)
> +#ifdef __alloc_size__
> +# define __alloc_size(x, ...)  __alloc_size__(x, ## __VA_ARGS__) __mallo=
c
> +# define __realloc_size(x, ...)        __alloc_size__(x, ## __VA_ARGS__)
> +#else
> +# define __alloc_size(x, ...)  __malloc
> +# define __realloc_size(x, ...)
> +#endif
>
>  #ifndef asm_volatile_goto
>  #define asm_volatile_goto(x...) asm goto(x)


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

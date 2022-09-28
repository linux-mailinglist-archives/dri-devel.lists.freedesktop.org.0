Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F095ED603
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 09:26:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF1210E2E4;
	Wed, 28 Sep 2022 07:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com
 [209.85.160.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C48E10E2E4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 07:26:40 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-11e9a7135easo16254940fac.6
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 00:26:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=qLaRR+atoHoSJaoPeYCH+z3TJyk6r6Xbl1EdBW345pA=;
 b=d9wSHE34hi0ctIcCzVKdKAUZnMm7BHnAQ674O7B1EF0Zl4xrTyTCXbcADpN0h3obcP
 lpDumJjuDha5Q5y3GThJ9AsDdicAief57pXWOGP+W+j3upGFrqIXue0szTunaiOcx6c8
 uB2oT4k3XE49+RRzqRLA/13RZi/6IePNJS2tCIu103gxnJlP+Gn70uO1WpSvl1ZWAecJ
 LOUL590qHnSgIDvApwWSaBVaMdPf4FpMG5cT45e8sU8guCrxycn/G7z2zBd14QRWcvIN
 9lqewsuXS9De8i3LQr6uj1stllXmpXTg/aF5Nr8Mf7dXq/4CfuR9sGcxpdgkTAgcCxqw
 6gBg==
X-Gm-Message-State: ACrzQf0EV15UU5Tpd5zAvc4TZGvy+oPoh7p+oWI1RcR1vsTS66OK4u+3
 VB+Tc7jabme0UzWj/m9Y6pWSUxzJOTJe0Q==
X-Google-Smtp-Source: AMsMyM4zzXfy+g7m2hbMbRc/WOTQ8xlzR8XVN4dTKINJKYj5aGEjSfx1x91ILgQiypOQrOxOvCm+Sg==
X-Received: by 2002:a05:6870:568c:b0:127:d921:e81a with SMTP id
 p12-20020a056870568c00b00127d921e81amr4441996oao.30.1664349999103; 
 Wed, 28 Sep 2022 00:26:39 -0700 (PDT)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com.
 [209.85.210.51]) by smtp.gmail.com with ESMTPSA id
 b8-20020a056830104800b00637190319eesm1752178otp.29.2022.09.28.00.26.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 00:26:38 -0700 (PDT)
Received: by mail-ot1-f51.google.com with SMTP id
 f20-20020a9d7b54000000b006574e21f1b6so7687301oto.5
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 00:26:38 -0700 (PDT)
X-Received: by 2002:a81:758a:0:b0:345:450b:6668 with SMTP id
 q132-20020a81758a000000b00345450b6668mr28433710ywc.316.1664349987412; Wed, 28
 Sep 2022 00:26:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220923202822.2667581-1-keescook@chromium.org>
 <20220923202822.2667581-2-keescook@chromium.org>
In-Reply-To: <20220923202822.2667581-2-keescook@chromium.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Sep 2022 09:26:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXK+UN1YVZm9DenuXAM8hZRUZJwp=SXsueP7sWiVU3a9A@mail.gmail.com>
Message-ID: <CAMuHMdXK+UN1YVZm9DenuXAM8hZRUZJwp=SXsueP7sWiVU3a9A@mail.gmail.com>
Subject: Re: [PATCH v2 01/16] slab: Remove __malloc attribute from realloc
 functions
To: Kees Cook <keescook@chromium.org>
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
 Josef Bacik <josef@toxicpanda.com>, linaro-mm-sig@lists.linaro.org,
 Yonghong Song <yhs@fb.com>, David Sterba <dsterba@suse.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 Alex Elder <elder@kernel.org>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pekka Enberg <penberg@kernel.org>, Daniel Micay <danielmicay@gmail.com>,
 netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, "David S. Miller" <davem@davemloft.net>,
 linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kees,

On Fri, Sep 23, 2022 at 10:35 PM Kees Cook <keescook@chromium.org> wrote:
> The __malloc attribute should not be applied to "realloc" functions, as
> the returned pointer may alias the storage of the prior pointer. Instead
> of splitting __malloc from __alloc_size, which would be a huge amount of
> churn, just create __realloc_size for the few cases where it is needed.
>
> Additionally removes the conditional test for __alloc_size__, which is
> always defined now.
>
> Cc: Christoph Lameter <cl@linux.com>
> Cc: Pekka Enberg <penberg@kernel.org>
> Cc: David Rientjes <rientjes@google.com>
> Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Roman Gushchin <roman.gushchin@linux.dev>
> Cc: Hyeonggon Yoo <42.hyeyoo@gmail.com>
> Cc: Marco Elver <elver@google.com>
> Cc: linux-mm@kvack.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Thanks for your patch, which is now commit 63caa04ec60583b1 ("slab:
Remove __malloc attribute from realloc functions") in next-20220927.

Noreply@ellerman.id.au reported all gcc8-based builds to fail
(e.g. [1], more at [2]):

    In file included from <command-line>:
    ./include/linux/percpu.h: In function =E2=80=98__alloc_reserved_percpu=
=E2=80=99:
    ././include/linux/compiler_types.h:279:30: error: expected
declaration specifiers before =E2=80=98__alloc_size__=E2=80=99
     #define __alloc_size(x, ...) __alloc_size__(x, ## __VA_ARGS__) __mallo=
c
                                  ^~~~~~~~~~~~~~
    ./include/linux/percpu.h:120:74: note: in expansion of macro =E2=80=98_=
_alloc_size=E2=80=99
    [...]

It's building fine with e.g. gcc-9 (which is my usual m68k cross-compiler).
Reverting this commit on next-20220927 fixes the issue.

[1] http://kisskb.ellerman.id.au/kisskb/buildresult/14803908/
[2] http://kisskb.ellerman.id.au/kisskb/head/1bd8b75fe6adeaa89d02968bdd811f=
fe708cf839/



> ---
>  include/linux/compiler_types.h | 13 +++++--------
>  include/linux/slab.h           | 12 ++++++------
>  mm/slab_common.c               |  4 ++--
>  3 files changed, 13 insertions(+), 16 deletions(-)
>
> diff --git a/include/linux/compiler_types.h b/include/linux/compiler_type=
s.h
> index 4f2a819fd60a..f141a6f6b9f6 100644
> --- a/include/linux/compiler_types.h
> +++ b/include/linux/compiler_types.h
> @@ -271,15 +271,12 @@ struct ftrace_likely_data {
>
>  /*
>   * Any place that could be marked with the "alloc_size" attribute is als=
o
> - * a place to be marked with the "malloc" attribute. Do this as part of =
the
> - * __alloc_size macro to avoid redundant attributes and to avoid missing=
 a
> - * __malloc marking.
> + * a place to be marked with the "malloc" attribute, except those that m=
ay
> + * be performing a _reallocation_, as that may alias the existing pointe=
r.
> + * For these, use __realloc_size().
>   */
> -#ifdef __alloc_size__
> -# define __alloc_size(x, ...)  __alloc_size__(x, ## __VA_ARGS__) __mallo=
c
> -#else
> -# define __alloc_size(x, ...)  __malloc
> -#endif
> +#define __alloc_size(x, ...)   __alloc_size__(x, ## __VA_ARGS__) __mallo=
c
> +#define __realloc_size(x, ...) __alloc_size__(x, ## __VA_ARGS__)
>
>  #ifndef asm_volatile_goto
>  #define asm_volatile_goto(x...) asm goto(x)
> diff --git a/include/linux/slab.h b/include/linux/slab.h
> index 0fefdf528e0d..41bd036e7551 100644
> --- a/include/linux/slab.h
> +++ b/include/linux/slab.h
> @@ -184,7 +184,7 @@ int kmem_cache_shrink(struct kmem_cache *s);
>  /*
>   * Common kmalloc functions provided by all allocators
>   */
> -void * __must_check krealloc(const void *objp, size_t new_size, gfp_t fl=
ags) __alloc_size(2);
> +void * __must_check krealloc(const void *objp, size_t new_size, gfp_t fl=
ags) __realloc_size(2);
>  void kfree(const void *objp);
>  void kfree_sensitive(const void *objp);
>  size_t __ksize(const void *objp);
> @@ -647,10 +647,10 @@ static inline __alloc_size(1, 2) void *kmalloc_arra=
y(size_t n, size_t size, gfp_
>   * @new_size: new size of a single member of the array
>   * @flags: the type of memory to allocate (see kmalloc)
>   */
> -static inline __alloc_size(2, 3) void * __must_check krealloc_array(void=
 *p,
> -                                                                   size_=
t new_n,
> -                                                                   size_=
t new_size,
> -                                                                   gfp_t=
 flags)
> +static inline __realloc_size(2, 3) void * __must_check krealloc_array(vo=
id *p,
> +                                                                     siz=
e_t new_n,
> +                                                                     siz=
e_t new_size,
> +                                                                     gfp=
_t flags)
>  {
>         size_t bytes;
>
> @@ -774,7 +774,7 @@ static inline __alloc_size(1, 2) void *kvcalloc(size_=
t n, size_t size, gfp_t fla
>  }
>
>  extern void *kvrealloc(const void *p, size_t oldsize, size_t newsize, gf=
p_t flags)
> -                     __alloc_size(3);
> +                     __realloc_size(3);
>  extern void kvfree(const void *addr);
>  extern void kvfree_sensitive(const void *addr, size_t len);
>
> diff --git a/mm/slab_common.c b/mm/slab_common.c
> index 17996649cfe3..457671ace7eb 100644
> --- a/mm/slab_common.c
> +++ b/mm/slab_common.c
> @@ -1134,8 +1134,8 @@ module_init(slab_proc_init);
>
>  #endif /* CONFIG_SLAB || CONFIG_SLUB_DEBUG */
>
> -static __always_inline void *__do_krealloc(const void *p, size_t new_siz=
e,
> -                                          gfp_t flags)
> +static __always_inline __realloc_size(2) void *
> +__do_krealloc(const void *p, size_t new_size, gfp_t flags)
>  {
>         void *ret;
>         size_t ks;
> --
> 2.34.1
>


--
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

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5837C577192
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 23:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E11E112400;
	Sat, 16 Jul 2022 21:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B171B112400
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 21:36:13 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id mf4so14860785ejc.3
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 14:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D5MNxF6HQt18ArNx99k1EypgpgmCjDyR8Pgj+dEhqhE=;
 b=B7B0Xx/vBB5LIfAfDpoYoyPOQo37uenioUBXSGhILkCVV4sHVWRC83NB0qjuxYFTzS
 rzVH6KZBFO4wYFFdNm0C7hvH70V/FyLc0FuEtb4VuqsHQNobrz1MVOQiXpWwdXpdxmCx
 YvaLa+rtQZIXTV5+sBkl0CNz3WyXmqhFu1vac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D5MNxF6HQt18ArNx99k1EypgpgmCjDyR8Pgj+dEhqhE=;
 b=jfPXJnoRhxcIO6JNyOUb0FKTlNn+kVKHD1qOGJ4KetieTA0B735nw/0UfTyuG52qJq
 DWlhU+Sg/O1xa8GpxJJiDb7SVfAw4maOn9admtihg/L0soEdGLY/qQfDcegf2PDkGX+R
 +AU8sF8TNsSRMcFefgBcK6jLGule0Qza/4bohLHTlIbWapn5qvbv6bLfyYIz2HM4Tdhn
 Y5JaA+CrI5n1h7DkuoFlMJMQ+nYQNOMadB/hgB4xbVy456XIVyxsVPAavpL6R7uhJ4L/
 mdlZ5F7Qth6GAHQ6eEZsxkJeLGpZyXdzTHLU5OTy2CMK5oczCZ4dcd1wOi0YW8LRzmL4
 Sm+Q==
X-Gm-Message-State: AJIora8e60G3vjWZZH3D/IC/Svqwsa3xmOynRWDtUOXeT3LrUrHOgQLy
 WyZTfcp1RxpSehfpvCg/bBkAbUoLw5XIM0Kd
X-Google-Smtp-Source: AGRyM1tfuNQOuCTU67jsZOn9yFQB7uDQHEfd46V2Pdv2GUg3i4htwGWITozJOopJY52o/EndBruBXA==
X-Received: by 2002:a17:906:6a0a:b0:72b:60b8:d2e7 with SMTP id
 qw10-20020a1709066a0a00b0072b60b8d2e7mr18689593ejc.607.1658007371733; 
 Sat, 16 Jul 2022 14:36:11 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com.
 [209.85.128.47]) by smtp.gmail.com with ESMTPSA id
 vp21-20020a17090712d500b006feba31171bsm3663966ejb.11.2022.07.16.14.36.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Jul 2022 14:36:10 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id
 be14-20020a05600c1e8e00b003a04a458c54so5156632wmb.3
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 14:36:10 -0700 (PDT)
X-Received: by 2002:a05:600c:34c9:b0:3a0:5072:9abe with SMTP id
 d9-20020a05600c34c900b003a050729abemr19959278wmq.8.1658007370148; Sat, 16 Jul
 2022 14:36:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9twM75GDM9t+9-CSCPDZG3QdcEpQ-X+FzQ4CLUCM7cKLkw@mail.gmail.com>
 <YtHXe4PcWXfihF9Q@dev-arch.thelio-3990X>
In-Reply-To: <YtHXe4PcWXfihF9Q@dev-arch.thelio-3990X>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 16 Jul 2022 14:35:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh5DB+OL2QvWPqRhpLLCqW7u_bLucFJpm4v6rZT3T5+zQ@mail.gmail.com>
Message-ID: <CAHk-=wh5DB+OL2QvWPqRhpLLCqW7u_bLucFJpm4v6rZT3T5+zQ@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 5.19-rc7
To: Nathan Chancellor <nathan@kernel.org>,
 Matthew Auld <matthew.auld@intel.com>, 
 Nirmoy Das <nirmoy.das@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 15, 2022 at 2:09 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Fri, Jul 15, 2022 at 01:36:17PM +1000, Dave Airlie wrote:
> > Matthew Auld (1):
> >       drm/i915/ttm: fix sg_table construction
>
> This patch breaks i386_defconfig with both GCC and clang:
>
>   ld: drivers/gpu/drm/i915/i915_scatterlist.o: in function `i915_rsgt_from_mm_node':
>   i915_scatterlist.c:(.text+0x1a7): undefined reference to `__udivdi3'

Yeah, we definitely don't want arbitrary 64x64 divides in the kernel,
and the fact that we don't include libgcc.a once again caught this
horrid issue.

The offending code is

        if (sg_alloc_table(st, DIV_ROUND_UP(node->size, segment_pages),
                           GFP_KERNEL)) {

and I have to say that all of those games with "u64 page_alignment"
that commit aff1e0b09b54 ("drm/i915/ttm: fix sg_table construction")
introduces are absolutely disgusting.

And they are just *pointlessly* disgusting.

Why is that "page_alignment" a "u64"?

And why is it a "size", instead of being a "number of bits"?

The code literally does things like

        const u64 max_segment = round_down(UINT_MAX, page_alignment);

which means that

 (a) page_alignment must be a power-of-two for this to work
(round_down() only works in powers of two)

 (b) the result obviously must fit in an "unsigned int", since it's
rounding down a UINT_MAX!

So (a) makes it doubtful that "page_alignment" should have been a
value (as opposed to mask), and (b) then questions why was that made
an "u64" value when it cannot have a u64 range?

And if max_segments cannot have a 64-bit range, then segment_pages here:

        u64 segment_pages = max_segment >> PAGE_SHIFT;

sure cannot.

Fixing those then uncovers other things:

                len = min(block_size, max_segment - sg->length);

now complains about mixing types ("max_segment - sg->length" being
u32), because 'block_size' is 64, bit, and that does seem to make some
amount of sense:

        block_size = node->size << PAGE_SHIFT;

with the 'node->size' being from drm_mm_node, and that size is a
'u64'. That I *could* see being more than 32 bits on a 64-bit
architecture. Ok.

But then that means that 'len' cannot be a 64-bit value either, and it
should probably have been

                u32 len;
    ..
                len = min_t(u64, block_size, max_segment - sg->length);

and that would just have been a lot nicer on 32-bit x86, avoiding a
lot of pointlessly 64-bit things.

That said, even those type simplifications do not fix the fundamental
issue. That "DIV_ROUND_UP()" still ends up being a 64-bit divide,
although now it's at least a "64-by-32" bit divide.

Which needs to be handled by "do_div()" rather than the generic
DIV_ROUND_UP() helper, because sadly, at least gcc still generates a
full __udivdi3() even for the 64-by-32 divides.

Can Intel GPU people please take a look?

             Linus

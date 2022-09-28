Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD0F5EE2BE
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 19:13:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0AAF10E4C3;
	Wed, 28 Sep 2022 17:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A45610E4C3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 17:13:15 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id z20so5405306plb.10
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 10:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date;
 bh=d6n7vVcWWAUhY50nx1oX+SjTLgFqeY1Yq8iTalyfqd0=;
 b=lIRHIZiWHITqRmakxRZHSG2SU2bpWinoR3Swar+fPYJBmT1qOO/MT6WnWN5yBDlhGu
 /lQXgjvlz0O4V2+hnYy+98Yh09p4wB3YUjZ22bnBWEa9dMSwUm7gVI6Ae5kXcacwBn8L
 BoOjiPYblWsCdJGhH6goLGXzHmU5/JoB80oyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=d6n7vVcWWAUhY50nx1oX+SjTLgFqeY1Yq8iTalyfqd0=;
 b=Vw8qO79qLCqy91OQdSXT3jaPTbXeHxvmF6xSx17/IzQFK6PAFJeA6RZvwOYnm16olc
 354v7GCdxdatRpgEDTuxs3rBTmcgze3pLDzqZZKBxL728W6Fd2tAdFi+xzLwmYZMtDen
 rqYGiCVJqbRQesQfEzEo365LRlAZOesG4vbLvmIWxBkpbUQGYHdzWbmsCglZIg7+EziZ
 9ypb/2kZqnnC6k06oE3Mb3uqGRM1HP6b6226bAceNlLx2w84O3rKDCKrI3AKMQ5B6HLN
 hmXdZwSBUCRfrDvdNjrredyTiPiWaeM5Xa7MI5/jTKyh2huYJY87hpw81IXbCtfp7wmA
 8xcw==
X-Gm-Message-State: ACrzQf25rgmaIuBcRp8sxZ2/btBfN0VsNxBZ1IZHm+v20SsybjiRjkb0
 /rOZAcCrPfZiQ12Xguu+zX2c6w==
X-Google-Smtp-Source: AMsMyM6sCBBdOCLg/ekAp2unP2+2il2GSYEdTvWU2WPyIonTKW/L3Ua/pLmu7ZGbcH4WrqStMgqaPQ==
X-Received: by 2002:a17:902:db08:b0:176:d40e:4b57 with SMTP id
 m8-20020a170902db0800b00176d40e4b57mr799977plx.172.1664385194575; 
 Wed, 28 Sep 2022 10:13:14 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a170902dac300b00177faf558b5sm4082449plx.250.2022.09.28.10.13.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 10:13:13 -0700 (PDT)
Date: Wed, 28 Sep 2022 10:13:12 -0700
From: Kees Cook <keescook@chromium.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 01/16] slab: Remove __malloc attribute from realloc
 functions
Message-ID: <202209281011.66DD717D@keescook>
References: <20220923202822.2667581-1-keescook@chromium.org>
 <20220923202822.2667581-2-keescook@chromium.org>
 <CAMuHMdXK+UN1YVZm9DenuXAM8hZRUZJwp=SXsueP7sWiVU3a9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXK+UN1YVZm9DenuXAM8hZRUZJwp=SXsueP7sWiVU3a9A@mail.gmail.com>
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
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Pekka Enberg <penberg@kernel.org>, Daniel Micay <danielmicay@gmail.com>,
 netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, "David S. Miller" <davem@davemloft.net>,
 linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 28, 2022 at 09:26:15AM +0200, Geert Uytterhoeven wrote:
> Hi Kees,
> 
> On Fri, Sep 23, 2022 at 10:35 PM Kees Cook <keescook@chromium.org> wrote:
> > The __malloc attribute should not be applied to "realloc" functions, as
> > the returned pointer may alias the storage of the prior pointer. Instead
> > of splitting __malloc from __alloc_size, which would be a huge amount of
> > churn, just create __realloc_size for the few cases where it is needed.
> >
> > Additionally removes the conditional test for __alloc_size__, which is
> > always defined now.
> >
> > Cc: Christoph Lameter <cl@linux.com>
> > Cc: Pekka Enberg <penberg@kernel.org>
> > Cc: David Rientjes <rientjes@google.com>
> > Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Vlastimil Babka <vbabka@suse.cz>
> > Cc: Roman Gushchin <roman.gushchin@linux.dev>
> > Cc: Hyeonggon Yoo <42.hyeyoo@gmail.com>
> > Cc: Marco Elver <elver@google.com>
> > Cc: linux-mm@kvack.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> Thanks for your patch, which is now commit 63caa04ec60583b1 ("slab:
> Remove __malloc attribute from realloc functions") in next-20220927.
> 
> Noreply@ellerman.id.au reported all gcc8-based builds to fail
> (e.g. [1], more at [2]):
> 
>     In file included from <command-line>:
>     ./include/linux/percpu.h: In function ‘__alloc_reserved_percpu’:
>     ././include/linux/compiler_types.h:279:30: error: expected
> declaration specifiers before ‘__alloc_size__’
>      #define __alloc_size(x, ...) __alloc_size__(x, ## __VA_ARGS__) __malloc
>                                   ^~~~~~~~~~~~~~
>     ./include/linux/percpu.h:120:74: note: in expansion of macro ‘__alloc_size’
>     [...]
> 
> It's building fine with e.g. gcc-9 (which is my usual m68k cross-compiler).
> Reverting this commit on next-20220927 fixes the issue.
> 
> [1] http://kisskb.ellerman.id.au/kisskb/buildresult/14803908/
> [2] http://kisskb.ellerman.id.au/kisskb/head/1bd8b75fe6adeaa89d02968bdd811ffe708cf839/

Eek! Thanks for letting me know. I'm confused about this --
__alloc_size__ wasn't optional in compiler_attributes.h -- but obviously
I broke something! I'll go figure this out.

-Kees

-- 
Kees Cook

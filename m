Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4A55E69CB
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 19:41:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D52610E26F;
	Thu, 22 Sep 2022 17:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B93B10E074
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 17:41:19 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id y15so5276674ilq.4
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 10:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=AsxpWsr5dzcIncNfx/+Sw1HyEwfMiBKVAKBEW7wNeQA=;
 b=HG1BCa9aD7EruuXSP8vfBpl2xSAcB9NgvDE4n3t4WegezK8iPhrhfTbs3Xxfdxp/aP
 0j4XfOQ90rYJJLxvR5Fxutq+CKSR+3NwG5g3gHNWC0rGeSJkCPwM1qeiyt5MoX9kie1E
 Ogc+09wvN660uSYqTrtW/DY7BHEKikOuBqjuMNkdFuICid58Qmi9sfyROy/V1LgkIpE7
 e2Nv1gEo4Vp0GQpWl3bRqM1059jceqcIcZbW6os/ZnPJ8J1PnWKNgSi8e2+WYP/WJpYk
 +8abyMsCFGIX1fgDuD8Pv5kCGUDjVFxUFNtnD5auEWqa0LNmLWv9bnrrUipYT443cCtB
 +LNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=AsxpWsr5dzcIncNfx/+Sw1HyEwfMiBKVAKBEW7wNeQA=;
 b=Gpc3yoR56yyD+g8bmSC0XwPTSxwRsWjHr4ytH48Uf6dbgRMuOvMKTKH00Z0JgJ4B4d
 dJFmRyN8vt3hoRHCtTKaED21QXLkJ8ewHqfgbSuG365GHrvSar7nwHJYoXBaciPKXy1K
 /hJEdv9uaVSThL1QlBa0qTLXrMmlYV6TEdYyRVx6/nya3aPbR13nHBzFCrQ5Zh/Pgt+m
 sD6Uunxu1lVaNDE85hqlcRs3a8I/Sn3bcGTawQHsWFVXr6IoU8embjBExXoKavq3pgEp
 IykCQ6An+wVxHmZYT9gSGw9kvaJcQF7Y7CFTYiyAd8u1ME7jOzxVBhjia1UhfKN3ee5j
 6S7g==
X-Gm-Message-State: ACrzQf2SuKfht2q9YiZB8L77yl2sH5Y+gbrRQqaoJyPXrn8BF/a2y795
 tEiIw4kxsfks26ZnW5GDMr9ROBwkE8I+A69J3Nk=
X-Google-Smtp-Source: AMsMyM5Iawxjt3SoOGTNllk8NVk3tyvcsl1U/lS7sz1j/GB7JoPgBuMEGvT0T6zJ1tbupUccXP7nLvzrv1dgRwQijjQ=
X-Received: by 2002:a05:6e02:152a:b0:2f6:58ae:ff0c with SMTP id
 i10-20020a056e02152a00b002f658aeff0cmr2429401ilu.237.1663868478589; Thu, 22
 Sep 2022 10:41:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220922031013.2150682-1-keescook@chromium.org>
 <20220922031013.2150682-12-keescook@chromium.org>
 <CANiq72=m9VngFH9jE3s0RV7MpjX0a=ekJN4pZwcDksBkSRR_1w@mail.gmail.com>
 <202209220855.B8DA16E@keescook>
In-Reply-To: <202209220855.B8DA16E@keescook>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 22 Sep 2022 19:41:07 +0200
Message-ID: <CANiq72=unhDJOGTg+ja4UdVRp8sG7Wc+_rqQhvJideA=WNjbFA@mail.gmail.com>
Subject: Re: [PATCH 11/12] slab: Remove __malloc attribute from realloc
 functions
To: Kees Cook <keescook@chromium.org>
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
Cc: Feng Tang <feng.tang@intel.com>, linux-wireless@vger.kernel.org,
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, linux-hardening@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, dev@openvswitch.org, x86@kernel.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 intel-wired-lan@lists.osuosl.org, David Rientjes <rientjes@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Yonghong Song <yhs@fb.com>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>, Josef Bacik <josef@toxicpanda.com>,
 linaro-mm-sig@lists.linaro.org, Jakub Kicinski <kuba@kernel.org>,
 David Sterba <dsterba@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>, Hao Luo <haoluo@google.com>,
 Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Pekka Enberg <penberg@kernel.org>,
 Daniel Micay <danielmicay@gmail.com>, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 22, 2022 at 5:56 PM Kees Cook <keescook@chromium.org> wrote:
>
> I wasn't sure if this "composite macro" was sane there, especially since
> it would be using __malloc before it was defined, etc. Would you prefer
> I move it?

Hmm... On one hand, they end up being attributes, so it could make
sense to have them there (after all, the big advantage of that header
is that there is no `#ifdef` nest like in others, and that it is only
for attributes).

On the other hand, you are right that the file so far is intended to
be as simple as possible (`__always_inline` having an extra `inline`
and `fallthrough` would be closest outliers), so if we do it, I would
prefer to do so in an independent series that carries its own rationale.

So I would leave the patch as it is here.

Cheers,
Miguel

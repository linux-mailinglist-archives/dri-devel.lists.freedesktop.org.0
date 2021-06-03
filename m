Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BB239A5CB
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 18:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC2E6E21D;
	Thu,  3 Jun 2021 16:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F8D36E241
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 16:33:49 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id i12so4804489qtr.7
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 09:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7DZmud8/NtbG9baAZHHVlQy45tmMkpb0U+jSSBeyr0o=;
 b=OJtnsUj+NU3k9eUbaBLoZa3VTWFwShEc8qClgbcAydu3jpRLmFZvXo0S0GFkNEQI5m
 70zGDVy/c/F2SXrvYFzqUe9QI0Q0gdpfzp+YNtkvGdfH2q+gQoAYI1E8UDgPJ2lCKjsO
 kfdvL4JeF8H4G+Mov9iBsP3ybfNhm3/gfInNTTwBWY9AJRuCGrg6Eh/BBTy5T/m+n4V5
 dNe5UALRYPNlKYm63n6ONLLrp4eWKqEymkPfl5A4UF0ilQ9HcROTNbMPeHdb39D9NcZq
 ynWs1/W9Hwkrtco0K4VU3Or/HcFjgj4YwiGGBpMIIMvf5GXxGf0y3bgpj5rOZ7gTNgSo
 t9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7DZmud8/NtbG9baAZHHVlQy45tmMkpb0U+jSSBeyr0o=;
 b=NOhZL2EylxzT8A3bCBXb+yETbEga2OfGoegPWzIDq8j7bZYZYAL0tCG0PEthao0ZBg
 KwmLUvmW4yCJhWFWPS3GZvlE6gKpjaFZfMX9AxOut5RIijzHJhMcF7QjkMwDe021kGJ9
 G/iJKYBMoy4P840qqjnJRhhyiuOA1HXg+i/bPH40u20dkUhvVjCI6ax0CXENiV7CaewL
 rP78Q9XL5N8x/i098dnxhfn/82UhHxuGBsL6NrzN9aoRyobWvczblJhIwEpV+HNc5/l9
 4BzhwSIfXStYboXKEK6dzsdsp7aQ66goLWRHvsrVq4+t3ZXt7Lm6+zgSOh3bGoqrwq1w
 PeMA==
X-Gm-Message-State: AOAM533q5TEmvuJzhB1IiJN8Mk1iIgrI6pAexR3VTyaCNAVpcNNosdOi
 FYmg2M1R4XIAOBWvTtUlW9cSBAoLmzFrWmVsh0uO+A==
X-Google-Smtp-Source: ABdhPJzeujnPaoppD4L3W7TKyoCjppbsv+WDwxb4a7/akyjuJiDJQcS4p674wBCDV3Vht6awFUTQcfFmk6ji0AGwTas=
X-Received: by 2002:ac8:6b08:: with SMTP id w8mr335813qts.364.1622738028536;
 Thu, 03 Jun 2021 09:33:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210529002508.3839467-1-dmitry.baryshkov@linaro.org>
 <20210529002508.3839467-6-dmitry.baryshkov@linaro.org>
 <CAF6AEGsoUET_=P1YkAKb7GMRyrZV5_jmGeMHZhB1u4uE9m7B9A@mail.gmail.com>
In-Reply-To: <CAF6AEGsoUET_=P1YkAKb7GMRyrZV5_jmGeMHZhB1u4uE9m7B9A@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 3 Jun 2021 19:33:37 +0300
Message-ID: <CAA8EJpqkrkYF=DW46PWB=0huB9U6e2QqXjJv532f0PyDCC-eXA@mail.gmail.com>
Subject: Re: [RFC 5/8] lib: add small API for handling register snapshots
To: Rob Clark <robdclark@gmail.com>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Abhinav Kumar <abhinavk@codeaurora.org>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 3 Jun 2021 at 17:41, Rob Clark <robdclark@gmail.com> wrote:
>
> On Fri, May 28, 2021 at 5:25 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > Add small API covering lists of register dumps. Currently this is a part
> > of MSM DRM driver, but is extracted as it might be usefull to other
> > drivers too.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  include/linux/dump_state.h | 78 ++++++++++++++++++++++++++++++++++++++
> >  lib/Kconfig                |  3 ++
> >  lib/Makefile               |  1 +
> >  lib/dump_state.c           | 51 +++++++++++++++++++++++++
> >  4 files changed, 133 insertions(+)
> >  create mode 100644 include/linux/dump_state.h
> >  create mode 100644 lib/dump_state.c
> >
> [snip]
> > diff --git a/lib/dump_state.c b/lib/dump_state.c
> > new file mode 100644
> > index 000000000000..58d88be65c0a
> > --- /dev/null
> > +++ b/lib/dump_state.c
> > @@ -0,0 +1,51 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
> > + * Copyright (c) 2021, Linaro Ltd
> > + */
> > +
> > +#include <linux/dump_state.h>
> > +#include <linux/slab.h>
> > +
> > +void dump_state_free_blocks(struct dump_state *state)
> > +{
> > +       struct dump_state_block *block, *tmp;
> > +
> > +       list_for_each_entry_safe(block, tmp, &state->blocks, node) {
> > +               list_del(&block->node);
> > +               kfree(block);
> > +       }
> > +}
> > +EXPORT_SYMBOL(dump_state_free_blocks);
>
> nit, perhaps EXPORT_SYMBOL_GPL()?

I don't really care. What is the current recommendation?

>
> BR,
> -R
>
> > +
> > +struct dump_state_block *dump_state_allocate_block_va(void __iomem *base_addr, size_t len, gfp_t gfp, const char *fmt, va_list args)
> > +{
> > +       struct dump_state_block *block = kzalloc(sizeof(*block) + len, gfp);
> > +
> > +       if (!block)
> > +               return ERR_PTR(-ENOMEM);
> > +
> > +       vsnprintf(block->name, sizeof(block->name), fmt, args);
> > +
> > +       INIT_LIST_HEAD(&block->node);
> > +       block->size = len;
> > +       block->base_addr = base_addr;
> > +
> > +       return block;
> > +}
> > +EXPORT_SYMBOL(dump_state_allocate_block);
> > +
> > +struct dump_state_block *dump_state_allocate_block(void __iomem *base_addr, size_t len, gfp_t gfp, const char *fmt, ...)
> > +{
> > +       struct dump_state_block *block;
> > +       va_list va;
> > +
> > +       va_start(va, fmt);
> > +
> > +       block = dump_state_allocate_block_va(base_addr, len, gfp, fmt, va);
> > +
> > +       va_end(va);
> > +
> > +       return block;
> > +}
> > +EXPORT_SYMBOL(dump_state_allocate_block_va);
> > --
> > 2.30.2
> >



-- 
With best wishes
Dmitry

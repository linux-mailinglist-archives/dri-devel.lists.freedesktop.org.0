Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3017439A385
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 16:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C3F6F489;
	Thu,  3 Jun 2021 14:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD36D6F487;
 Thu,  3 Jun 2021 14:41:17 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 l11-20020a05600c4f0bb029017a7cd488f5so3892290wmq.0; 
 Thu, 03 Jun 2021 07:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S3gLIzTlRm90Fbhfv86Iy9u6F5Oz2fyU1X9eaD/GjVg=;
 b=WM9zOqh5gwb3s1mR9PW/RGNOGO0iK7n40nVvmbpNnVgKkrWMoT01LlIDTIooL47lZJ
 7wDfbvY95NRzX/etYxYVZJ0lFAbsNs2qggFooGWI9jDjT+tTsM2sleFx7MvygUqm5mNy
 tx4ths746VwyI8UlKOqNeZaaiNoaWg9Qcm+XNZinKI39t9ly9M3WH+fIrjBnS0t7hDUV
 +xNRHxXYoBlortSAdAl/cv89eXehnmCwmss/2JWB5KpXW7vJMjE7wPeLsda/wFVWmHQG
 PdLKJlv4sh3GYkdxrucmXLOeYn04K8DfEzLxyjr0IHvR5dICwZ3wB3MMY/+q222K4gCX
 GSag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S3gLIzTlRm90Fbhfv86Iy9u6F5Oz2fyU1X9eaD/GjVg=;
 b=tyVmoVcKwcNrC/NRupl2DfLLHvNEAg+BAhoOH8jfWG6hjH2nQWe7//ZYt49v/dVbCK
 BP4aPtWcsDrQ1dROQ3l5UVfjWAAGATHZfFDlKI+c6861ZL55XJo5wpXkwN+I0A658ccU
 aMq/NDuQeEBi1VSCjfl/AlfH+APCy289/hDe0wbUbjKi0arrUc5BOuK4PLJtUM8QUg0N
 IlBl0LmYNHm6X07zBPbfzQjkMR10RkL16o5QJ7VVjOWiXHC2gnBd3bMaE9rJP4G/Z1Dc
 Aa4H+gaYTgUS/3a7vOxMMajWfYzegOQBtxmD+E+6ZRPi/Yiva1gQ4knwWe3K4Hzk7hhW
 +3YA==
X-Gm-Message-State: AOAM5332wQxh/qE+epjNeUeIcqp5gxiQIM8Rh0RbHDtqY/J9cuf/aqP9
 5J9hLnhFkrsJ5V9yTXWdHq7+K2hxsfpERBhT0TQ=
X-Google-Smtp-Source: ABdhPJxLV3SbPwFjb3ZelCeB3oIW2qicl9OJM5oD+Ojp6ILkGuMfs/U2Y4M5ZPWAahsbGutVXx7C1LLUVpuzzeu/4is=
X-Received: by 2002:a7b:ca44:: with SMTP id m4mr10634794wml.123.1622731276458; 
 Thu, 03 Jun 2021 07:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210529002508.3839467-1-dmitry.baryshkov@linaro.org>
 <20210529002508.3839467-6-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210529002508.3839467-6-dmitry.baryshkov@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 3 Jun 2021 07:45:08 -0700
Message-ID: <CAF6AEGsoUET_=P1YkAKb7GMRyrZV5_jmGeMHZhB1u4uE9m7B9A@mail.gmail.com>
Subject: Re: [RFC 5/8] lib: add small API for handling register snapshots
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

On Fri, May 28, 2021 at 5:25 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Add small API covering lists of register dumps. Currently this is a part
> of MSM DRM driver, but is extracted as it might be usefull to other
> drivers too.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  include/linux/dump_state.h | 78 ++++++++++++++++++++++++++++++++++++++
>  lib/Kconfig                |  3 ++
>  lib/Makefile               |  1 +
>  lib/dump_state.c           | 51 +++++++++++++++++++++++++
>  4 files changed, 133 insertions(+)
>  create mode 100644 include/linux/dump_state.h
>  create mode 100644 lib/dump_state.c
>
[snip]
> diff --git a/lib/dump_state.c b/lib/dump_state.c
> new file mode 100644
> index 000000000000..58d88be65c0a
> --- /dev/null
> +++ b/lib/dump_state.c
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2021, Linaro Ltd
> + */
> +
> +#include <linux/dump_state.h>
> +#include <linux/slab.h>
> +
> +void dump_state_free_blocks(struct dump_state *state)
> +{
> +       struct dump_state_block *block, *tmp;
> +
> +       list_for_each_entry_safe(block, tmp, &state->blocks, node) {
> +               list_del(&block->node);
> +               kfree(block);
> +       }
> +}
> +EXPORT_SYMBOL(dump_state_free_blocks);

nit, perhaps EXPORT_SYMBOL_GPL()?

BR,
-R

> +
> +struct dump_state_block *dump_state_allocate_block_va(void __iomem *base_addr, size_t len, gfp_t gfp, const char *fmt, va_list args)
> +{
> +       struct dump_state_block *block = kzalloc(sizeof(*block) + len, gfp);
> +
> +       if (!block)
> +               return ERR_PTR(-ENOMEM);
> +
> +       vsnprintf(block->name, sizeof(block->name), fmt, args);
> +
> +       INIT_LIST_HEAD(&block->node);
> +       block->size = len;
> +       block->base_addr = base_addr;
> +
> +       return block;
> +}
> +EXPORT_SYMBOL(dump_state_allocate_block);
> +
> +struct dump_state_block *dump_state_allocate_block(void __iomem *base_addr, size_t len, gfp_t gfp, const char *fmt, ...)
> +{
> +       struct dump_state_block *block;
> +       va_list va;
> +
> +       va_start(va, fmt);
> +
> +       block = dump_state_allocate_block_va(base_addr, len, gfp, fmt, va);
> +
> +       va_end(va);
> +
> +       return block;
> +}
> +EXPORT_SYMBOL(dump_state_allocate_block_va);
> --
> 2.30.2
>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B1E2C994C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 09:24:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1AB86E4FB;
	Tue,  1 Dec 2020 08:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BF9489D00
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 22:34:13 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id f23so5154029ejt.8
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 14:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fKEdC66hJ5JGLsiLl3hBV9f87nrLsLENnZJ383Beve8=;
 b=Hl4XxdMkJ2RDEu06Xnz1qMbOpFWfnI/RbbLjZwWSXyPJJAyRVk39Q8D+aioSqvMEY3
 dMaprc0g8So5ez4Hj/80hfeEQLeZq9/9t+tGeitb43B2yb7SW3JpgNu/nrkMzRWfTIcK
 nobNVsyfNL/QcUlDv/+SD+93thS85zPFRkf+c6608NjfRq8Iu1IxwyxoBMDKASBy/pe3
 HR/5Y2p7ImfAQoikKXEBwUrLXycWd5nCUBKYbrfFf+1hTHwrnj7zOQza/VV9Ryh+Cdf1
 kf8i57L8gAMsMWdMwaWbKGTPe5XlK4hkiv01xgepkCQzMOuyxQ6TuUFdC03+dIKKY1vp
 epyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fKEdC66hJ5JGLsiLl3hBV9f87nrLsLENnZJ383Beve8=;
 b=Wlr3wn6Mla792z1vPI/55359QSKGHu58fBLELzx/kx7TtYv2z/i07zrB7HALshLRJk
 jHQ2trnLybhcjN3epsqlCOO64Wh/RjNCJZY/4uT6cmcIRiPwkzMSIeT+ZpAEaCzu8mOS
 SMaZ76VAijNJgG/7Nu1lbsrEHkO5bKLMdWDVhw7kwYHtX5jktMiih8vQUlCB7dgz/ORI
 hIxXaMrDwllnqwGD+L2DH0ej6pMw+Vr9263rnQEJEMInxAZQiYFNJxk9OfDxP61SEj6j
 BDpfKx6CEH6QIYnV5fpnmqwmS2DJQdw7zul8XNjQEenBx79N0+ly033dEdXF+IHCJR+v
 DLMw==
X-Gm-Message-State: AOAM531k0K1VWI7BA77vpbgGh8tEC9Ln2YwdN7RNJAKtEzaPAxt/EjK4
 c/5x8f+b9NdTqcEXF55gMcCGiQMgVkwnq2xU6ezI8Q==
X-Google-Smtp-Source: ABdhPJy4mx9bz7eZi5E2l30s9A9eHdahnGhj0teAoOlrytTn7Qa2iVKl14LEOUHYXZY+466a9ZU6/pKEl8bMCpCk9Jc=
X-Received: by 2002:a17:906:1c8e:: with SMTP id
 g14mr9809987ejh.5.1606775651902; 
 Mon, 30 Nov 2020 14:34:11 -0800 (PST)
MIME-Version: 1.0
References: <20200820162738.33053904@oasis.local.home>
 <20201022173434.910879-1-lpy@google.com>
 <CA+0soA=JR45Tad6+0jCDoiXPk_ctDmmFhg9NtPRrMFb9fM3V0Q@mail.gmail.com>
In-Reply-To: <CA+0soA=JR45Tad6+0jCDoiXPk_ctDmmFhg9NtPRrMFb9fM3V0Q@mail.gmail.com>
From: Peiyong Lin <lpy@google.com>
Date: Mon, 30 Nov 2020 14:33:59 -0800
Message-ID: <CA+0soAkd3nq0ys1TQ3m8DxMAT4-EGfo7obQ9OrGQ15bipT=wTA@mail.gmail.com>
Subject: Re: [PATCH v4] Add power/gpu_frequency tracepoint.
To: Steven Rostedt <rostedt@goodmis.org>, alexdeucher@gmail.com
X-Mailman-Approved-At: Tue, 01 Dec 2020 08:23:37 +0000
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sidath Senanayake <sidaths@google.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Prahlad Kilambi <prahladk@google.com>, Ingo Molnar <mingo@redhat.com>,
 Pavel Machek <pavel@ucw.cz>, Paul Walmsley <paul.walmsley@sifive.com>,
 zzyiwei@android.com, android-kernel@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 17, 2020 at 1:31 PM Peiyong Lin <lpy@google.com> wrote:
>
> On Thu, Oct 22, 2020 at 10:34 AM Peiyong Lin <lpy@google.com> wrote:
> >
> > Historically there is no common trace event for GPU frequency, in
> > downstream Android each different hardware vendor implements their own
> > way to expose GPU frequency, for example as a debugfs node.  This patch
> > standardize it as a common trace event in upstream linux kernel to help
> > the ecosystem have a common implementation across hardware vendors.
> > Toolings in the Linux ecosystem will benefit from this especially in the
> > downstream Android, where this information is critical to graphics
> > developers.
> >
> > Signed-off-by: Peiyong Lin <lpy@google.com>
> > ---
> >
> > Changelog since v3:
> >  - Correct copyright title.
> >
> > Changelog since v2:
> >  - Add more comments to indicate when the event should be emitted.
> >  - Change state to frequency.
> >
> > Changelog since v1:
> >  - Use %u in TP_printk
> >
> >  drivers/gpu/Makefile                    |  1 +
> >  drivers/gpu/trace/Kconfig               |  3 +++
> >  drivers/gpu/trace/Makefile              |  1 +
> >  drivers/gpu/trace/trace_gpu_frequency.c | 13 ++++++++++
> >  include/trace/events/power.h            | 33 +++++++++++++++++++++++++
> >  5 files changed, 51 insertions(+)
> >  create mode 100644 drivers/gpu/trace/trace_gpu_frequency.c
> >
> > diff --git a/drivers/gpu/Makefile b/drivers/gpu/Makefile
> > index 835c88318cec..f289a47eb031 100644
> > --- a/drivers/gpu/Makefile
> > +++ b/drivers/gpu/Makefile
> > @@ -6,3 +6,4 @@ obj-$(CONFIG_TEGRA_HOST1X)      += host1x/
> >  obj-y                  += drm/ vga/
> >  obj-$(CONFIG_IMX_IPUV3_CORE)   += ipu-v3/
> >  obj-$(CONFIG_TRACE_GPU_MEM)            += trace/
> > +obj-$(CONFIG_TRACE_GPU_FREQUENCY)              += trace/
> > diff --git a/drivers/gpu/trace/Kconfig b/drivers/gpu/trace/Kconfig
> > index c24e9edd022e..ac4aec8d5845 100644
> > --- a/drivers/gpu/trace/Kconfig
> > +++ b/drivers/gpu/trace/Kconfig
> > @@ -2,3 +2,6 @@
> >
> >  config TRACE_GPU_MEM
> >         bool
> > +
> > +config TRACE_GPU_FREQUENCY
> > +       bool
> > diff --git a/drivers/gpu/trace/Makefile b/drivers/gpu/trace/Makefile
> > index b70fbdc5847f..2b7ae69327d6 100644
> > --- a/drivers/gpu/trace/Makefile
> > +++ b/drivers/gpu/trace/Makefile
> > @@ -1,3 +1,4 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >
> >  obj-$(CONFIG_TRACE_GPU_MEM) += trace_gpu_mem.o
> > +obj-$(CONFIG_TRACE_GPU_FREQUENCY) += trace_gpu_frequency.o
> > diff --git a/drivers/gpu/trace/trace_gpu_frequency.c b/drivers/gpu/trace/trace_gpu_frequency.c
> > new file mode 100644
> > index 000000000000..668fabd6b77a
> > --- /dev/null
> > +++ b/drivers/gpu/trace/trace_gpu_frequency.c
> > @@ -0,0 +1,13 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * GPU frequency trace points
> > + *
> > + * Copyright (C) 2020 Google LLC
> > + */
> > +
> > +#include <linux/module.h>
> > +
> > +#define CREATE_TRACE_POINTS
> > +#include <trace/events/power.h>
> > +
> > +EXPORT_TRACEPOINT_SYMBOL(gpu_frequency);
> > diff --git a/include/trace/events/power.h b/include/trace/events/power.h
> > index af5018aa9517..343825a76953 100644
> > --- a/include/trace/events/power.h
> > +++ b/include/trace/events/power.h
> > @@ -500,6 +500,39 @@ DEFINE_EVENT(dev_pm_qos_request, dev_pm_qos_remove_request,
> >
> >         TP_ARGS(name, type, new_value)
> >  );
> > +
> > +/**
> > + * gpu_frequency - Reports the GPU frequency in GPU clock domains.
> > + *
> > + * This event should be emitted whenever there's a GPU frequency change happens,
> > + * or a GPU goes from idle state to active state, or vice versa.
> > + *
> > + * When the GPU goes from idle state to active state, this event should report
> > + * the GPU frequency of the active state. When the GPU goes from active state to
> > + * idle state, this event should report a zero frequency value.
> > + *
> > + * @frequency:  New frequency (in KHz)
> > + * @gpu_id: Id for each GPU clock domain
> > + */
> > +TRACE_EVENT(gpu_frequency,
> > +
> > +       TP_PROTO(unsigned int frequency, unsigned int gpu_id),
> > +
> > +       TP_ARGS(frequency, gpu_id),
> > +
> > +       TP_STRUCT__entry(
> > +               __field(unsigned int, frequency)
> > +               __field(unsigned int, gpu_id)
> > +       ),
> > +
> > +       TP_fast_assign(
> > +               __entry->frequency = frequency;
> > +               __entry->gpu_id = gpu_id;
> > +       ),
> > +
> > +       TP_printk("frequency=%u gpu_id=%u",
> > +               __entry->frequency, __entry->gpu_id)
> > +);
> >  #endif /* _TRACE_POWER_H */
> >
> >  /* This part must be outside protection */
> > --
> > 2.29.0.rc1.297.gfa9743e501-goog
> >
>
>
> Hi there,
>
> Per request, re-send this patch with dri-devel@ list CCed.
>
> Thanks,
> Peiyong

Hi there,

For GPU drivers folks in dri-devel@ list, any input?

Thanks,
Peiyong
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

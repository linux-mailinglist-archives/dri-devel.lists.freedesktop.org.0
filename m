Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A01E02B77DD
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 09:01:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D101F6E402;
	Wed, 18 Nov 2020 08:01:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8694F6E090
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 21:31:58 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id d17so252259ion.4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 13:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s/WA2WgXM/4hi+nIHdbZk2wWjL43ZVrN1Ej/Ug1O0jU=;
 b=C2WWJCFVP6egPTg0RH6Y8HAnt9uwIJDpVs97AnbgbSmBqjHnQDT1oTxLPAM1rCJ8tf
 OGQpXD9Eq+Vr3KRY+snc5jD021wXrPEKOG02s6qRbfLierDKNjHwXcG2mFnXlRFsXz5Z
 ie0+AtOiKarcuutOqx38TLa1FmBollVrUv59zrLAQi9mCAoI6aGyTVtolFthBIRsMlG/
 rAyknYCayWgp5EqiIHmjA1DzEBkm0rB/Te51OtQi5ILPr6v/Heacr7YJxPiFFSbokYlK
 vzdzbXV9MzS33nucjy/+v81LGE3X+/8Ta9PgPBxoO88el/Dei4HLNrwdt9I5DR4p5M9P
 7+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s/WA2WgXM/4hi+nIHdbZk2wWjL43ZVrN1Ej/Ug1O0jU=;
 b=byAjf+KKnxoB11kJ524qhqa6Lk/033yNUWIUgockbIXMN6HiN3CV/tmrTXxan5Q771
 +OyobSPv7RYibvyrpRDupMENtFpXEzTtaKuQUt1qW3+6CSnQE2hcCymUTKv3eTWQ783Q
 Tt7hXxoKhLOdQLHyiu2qzh0xCx4YMOiGRRNKb9qRyaUmmimqcVAEsLbqsjsPtxNCGp0H
 f1soZBfF2yMJUh5DZLqVXgGM3UZOfTum41wL3VPSW9X62THlYqi3hXu68TBzsnMONf3v
 K1H3KJQOV8rQ+0tueDGl7XTyy5COrtVKEUIWKgXK1lUJyKDfI1syEo2ranm6Nnoytwex
 7Mgw==
X-Gm-Message-State: AOAM5327QAqQz3UxLrToOQCI8JQbUOqpd953JdMCQFYEgLsLnpX0ab4W
 NCQzvyccxT5x4FiRyPd1XRTy/+U/gp2hG09LTrS9aA==
X-Google-Smtp-Source: ABdhPJwCfmx5LySHXxy0Co31UgbQUSlajKv0cRQbzTqEWUy3zfqz83SZo/0+hHzad8/gE06cb6OebySDgJNaoJ5nl08=
X-Received: by 2002:a5d:89ce:: with SMTP id a14mr12728026iot.85.1605648717515; 
 Tue, 17 Nov 2020 13:31:57 -0800 (PST)
MIME-Version: 1.0
References: <20200820162738.33053904@oasis.local.home>
 <20201022173434.910879-1-lpy@google.com>
In-Reply-To: <20201022173434.910879-1-lpy@google.com>
From: Peiyong Lin <lpy@google.com>
Date: Tue, 17 Nov 2020 13:31:46 -0800
Message-ID: <CA+0soA=JR45Tad6+0jCDoiXPk_ctDmmFhg9NtPRrMFb9fM3V0Q@mail.gmail.com>
Subject: Re: [PATCH v4] Add power/gpu_frequency tracepoint.
To: Steven Rostedt <rostedt@goodmis.org>, alexdeucher@gmail.com
X-Mailman-Approved-At: Wed, 18 Nov 2020 08:01:05 +0000
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

On Thu, Oct 22, 2020 at 10:34 AM Peiyong Lin <lpy@google.com> wrote:
>
> Historically there is no common trace event for GPU frequency, in
> downstream Android each different hardware vendor implements their own
> way to expose GPU frequency, for example as a debugfs node.  This patch
> standardize it as a common trace event in upstream linux kernel to help
> the ecosystem have a common implementation across hardware vendors.
> Toolings in the Linux ecosystem will benefit from this especially in the
> downstream Android, where this information is critical to graphics
> developers.
>
> Signed-off-by: Peiyong Lin <lpy@google.com>
> ---
>
> Changelog since v3:
>  - Correct copyright title.
>
> Changelog since v2:
>  - Add more comments to indicate when the event should be emitted.
>  - Change state to frequency.
>
> Changelog since v1:
>  - Use %u in TP_printk
>
>  drivers/gpu/Makefile                    |  1 +
>  drivers/gpu/trace/Kconfig               |  3 +++
>  drivers/gpu/trace/Makefile              |  1 +
>  drivers/gpu/trace/trace_gpu_frequency.c | 13 ++++++++++
>  include/trace/events/power.h            | 33 +++++++++++++++++++++++++
>  5 files changed, 51 insertions(+)
>  create mode 100644 drivers/gpu/trace/trace_gpu_frequency.c
>
> diff --git a/drivers/gpu/Makefile b/drivers/gpu/Makefile
> index 835c88318cec..f289a47eb031 100644
> --- a/drivers/gpu/Makefile
> +++ b/drivers/gpu/Makefile
> @@ -6,3 +6,4 @@ obj-$(CONFIG_TEGRA_HOST1X)      += host1x/
>  obj-y                  += drm/ vga/
>  obj-$(CONFIG_IMX_IPUV3_CORE)   += ipu-v3/
>  obj-$(CONFIG_TRACE_GPU_MEM)            += trace/
> +obj-$(CONFIG_TRACE_GPU_FREQUENCY)              += trace/
> diff --git a/drivers/gpu/trace/Kconfig b/drivers/gpu/trace/Kconfig
> index c24e9edd022e..ac4aec8d5845 100644
> --- a/drivers/gpu/trace/Kconfig
> +++ b/drivers/gpu/trace/Kconfig
> @@ -2,3 +2,6 @@
>
>  config TRACE_GPU_MEM
>         bool
> +
> +config TRACE_GPU_FREQUENCY
> +       bool
> diff --git a/drivers/gpu/trace/Makefile b/drivers/gpu/trace/Makefile
> index b70fbdc5847f..2b7ae69327d6 100644
> --- a/drivers/gpu/trace/Makefile
> +++ b/drivers/gpu/trace/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
>
>  obj-$(CONFIG_TRACE_GPU_MEM) += trace_gpu_mem.o
> +obj-$(CONFIG_TRACE_GPU_FREQUENCY) += trace_gpu_frequency.o
> diff --git a/drivers/gpu/trace/trace_gpu_frequency.c b/drivers/gpu/trace/trace_gpu_frequency.c
> new file mode 100644
> index 000000000000..668fabd6b77a
> --- /dev/null
> +++ b/drivers/gpu/trace/trace_gpu_frequency.c
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * GPU frequency trace points
> + *
> + * Copyright (C) 2020 Google LLC
> + */
> +
> +#include <linux/module.h>
> +
> +#define CREATE_TRACE_POINTS
> +#include <trace/events/power.h>
> +
> +EXPORT_TRACEPOINT_SYMBOL(gpu_frequency);
> diff --git a/include/trace/events/power.h b/include/trace/events/power.h
> index af5018aa9517..343825a76953 100644
> --- a/include/trace/events/power.h
> +++ b/include/trace/events/power.h
> @@ -500,6 +500,39 @@ DEFINE_EVENT(dev_pm_qos_request, dev_pm_qos_remove_request,
>
>         TP_ARGS(name, type, new_value)
>  );
> +
> +/**
> + * gpu_frequency - Reports the GPU frequency in GPU clock domains.
> + *
> + * This event should be emitted whenever there's a GPU frequency change happens,
> + * or a GPU goes from idle state to active state, or vice versa.
> + *
> + * When the GPU goes from idle state to active state, this event should report
> + * the GPU frequency of the active state. When the GPU goes from active state to
> + * idle state, this event should report a zero frequency value.
> + *
> + * @frequency:  New frequency (in KHz)
> + * @gpu_id: Id for each GPU clock domain
> + */
> +TRACE_EVENT(gpu_frequency,
> +
> +       TP_PROTO(unsigned int frequency, unsigned int gpu_id),
> +
> +       TP_ARGS(frequency, gpu_id),
> +
> +       TP_STRUCT__entry(
> +               __field(unsigned int, frequency)
> +               __field(unsigned int, gpu_id)
> +       ),
> +
> +       TP_fast_assign(
> +               __entry->frequency = frequency;
> +               __entry->gpu_id = gpu_id;
> +       ),
> +
> +       TP_printk("frequency=%u gpu_id=%u",
> +               __entry->frequency, __entry->gpu_id)
> +);
>  #endif /* _TRACE_POWER_H */
>
>  /* This part must be outside protection */
> --
> 2.29.0.rc1.297.gfa9743e501-goog
>


Hi there,

Per request, re-send this patch with dri-devel@ list CCed.

Thanks,
Peiyong
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

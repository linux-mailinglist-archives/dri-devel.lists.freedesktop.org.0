Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01622C91737
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 10:32:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 089A310E76D;
	Fri, 28 Nov 2025 09:32:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KrbdCb96";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6B410E76D
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 09:31:59 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-8b1bfd4b3deso124647085a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 01:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764322318; x=1764927118; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OI0OcmHjeFyb484sjgiydBSlKc/rrUkdQjscOLrNcP0=;
 b=KrbdCb96PANl2QjAo2bHh1/RXQYXh+evpabkan5UQ/48vnz3Sge5pXanasfio/XtlL
 dfD6XjTUAV6ewyZvQvha8TMQ82T0ql0wVuyNjPcfWs/z+z6KRulH+Q/BmBY0cQp9Eg8V
 Rl8lBL3mP8xXMaklwKwr3LOyemVN2wOBOzd+x0iJy4+nnriJsfjzuffFQAkOhlEOf2uX
 krZkEfAY5PVYxYOq4FAhUAJ6mqeJy5RE9MIn7ajlUCOOORNsswrnQdIgwudICQpz4RXz
 jTkM8boie+OcOsX/6dgRrBdCrmYrcgdNKH2hNSl+AJvKFXjxWnWjsya+539Uz6dhbgrH
 /eYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764322318; x=1764927118;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OI0OcmHjeFyb484sjgiydBSlKc/rrUkdQjscOLrNcP0=;
 b=bPVRfT3Z5u2K101OxS3EUzU4FEwEhuwo9J9Yh5KL5cSrzmIP8bkqsFJccV3befeiKN
 jRQtpGNcKJtcrew4urtNiKW9h/iEKX8/4B+CmsciHzF++2D8NfeO8qWE8RG2LHKA4U+F
 C1QEYExZz8oBKkxF1oU/PXpKqhnZG8oL4E1tG8TpOSiRG3eM3V2zlrpkpWA9AHuPROnF
 GaI4SS8o+Zk0NQElU5Vgz+wM6ajpaKLW3IjSpqJK6OWgmxPmEJH6ae/5uNvM9pMirUQi
 T9A3gRsZ1aT9Gba/JmOMD5sFl2w5r94U5Em/wr/bHRebwpbrRuqFfFYglHAqcICBtU2B
 eVhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/wmu7WqoOI1YjmpTsZqnm35dk8zjViZvUzD7bJnx5CxSxdKxoR4MuESokmFM03eHDkqslnprg7zU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJzme7yi00jk5w2sqt9JXIyXhd1rXsuL2/F91vPOlmFInqXR22
 /Y33SLMyQ8kl5qZZEBmuZLkHoftlykQz+r3srYFcE5My1FnpXwp7yZK5aU94I2K+kqmIT+Cje+q
 N1/ktLERrE9iuNzvFIrbyqm8C6467mg0=
X-Gm-Gg: ASbGnctreybnWSxB73mLuistPJbMJtL0Z94wAldmBGqBlM42AfqJ2/1yS6IBVabFr6J
 sWpcuqfzT0gDAbVxTmgN6XbjG4MEBKa2mA3yrSFPUSppFTdJMhObP491yY7yji/P2uFlIbaZFGn
 z04tk/LlU80rye2lGX9lctkXZgukmkXL2VwctbiecUYljJGFZjqcSlRNygtm8pkdtVl96dcoHW0
 lGT+pYlBm9sDHoI6wOgrO8XRWpun35tC4kaE4uExaIGU3byYOH1aks/DYK+/68T+hoJQRFQ++45
 MGPU
X-Google-Smtp-Source: AGHT+IE4dLyJsJbrTAn1B7Yr4GO+0YuLUAXeUBEruxFfx8P+JadOGQI4/wwbpqcWoRl4WtDLsxhuJc9tFjSM6xJVzGA=
X-Received: by 2002:a05:620a:2988:b0:8b2:74e5:b36 with SMTP id
 af79cd13be357-8b33d469d5emr3375756385a.68.1764322318278; Fri, 28 Nov 2025
 01:31:58 -0800 (PST)
MIME-Version: 1.0
References: <20251128085215.550100-1-gxxa03070307@gmail.com>
In-Reply-To: <20251128085215.550100-1-gxxa03070307@gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 28 Nov 2025 17:31:46 +0800
X-Gm-Features: AWmQ_bnxT-AMRvL6QfqA8HugYaI3Ly525_HuvsNqNPfROHBjXW-vjwdRajjQ0jk
Message-ID: <CAGsJ_4y0zc_nh2q=w4uR04vtveCf6L7+hgafznHuL8ByWbyNOQ@mail.gmail.com>
Subject: Re: [PATCH v4] dma-buf: add some tracepoints to debug.
To: Xiang Gao <gxxa03070307@gmail.com>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, rostedt@goodmis.org, 
 mhiramat@kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 mathieu.desnoyers@efficios.com, dhowells@redhat.com, kuba@kernel.org, 
 brauner@kernel.org, akpm@linux-foundation.org, 
 linux-trace-kernel@vger.kernel.org, gaoxiang17 <gaoxiang17@xiaomi.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 28, 2025 at 4:53=E2=80=AFPM Xiang Gao <gxxa03070307@gmail.com> =
wrote:
>
> From: gaoxiang17 <gaoxiang17@xiaomi.com>
>
> I want to track the status of dmabuf in real time in the production envir=
onment.
> But now we can only check it by traversing the fd in the process or dmabu=
f_list.

might be:

Since we can only inspect dmabuf by iterating over process FDs or the
dmabuf_list, we need to add our own tracepoints to track its status in
real time in production.

>
> For example:
>    binder:3031_4-18348   [005] ...1.   545.568275: dma_buf_export: exp_na=
me=3Dqcom,system name=3D(null) size=3D217088 ino=3D2750
>    binder:3031_4-18348   [005] ...1.   545.568284: dma_buf_fd: exp_name=
=3Dqcom,system name=3D(null) size=3D217088 ino=3D2750 fd=3D8
>    binder:3031_4-18348   [005] ...1.   545.568399: dma_buf_mmap_internal:=
 exp_name=3Dqcom,system name=3Dqcom,system size=3D28672 ino=3D2751
>      kworker/5:1-130     [005] ...1.   545.570193: dma_buf_put: exp_name=
=3Dqcom,system name=3Dab size=3D28672 ino=3D2751
>     RenderThread-18891   [005] ...1.   545.602994: dma_buf_get: exp_name=
=3Dqcom,system name=3Dab size=3D217088 ino=3D2750 fd=3D1087
>     RenderThread-9409    [000] .n.1.   545.745004: dma_buf_dynamic_attach=
: exp_name=3Dqcom,system name=3Dab size=3D217088 ino=3D2750 is_dynamic=3D0 =
dev_name=3Dkgsl-3d0
>     RenderThread-9409    [005] ...1.   545.747802: dma_buf_detach: exp_na=
me=3Dqcom,system name=3Dbq size=3D12771328 ino=3D2764 is_dynamic=3D0 dev_na=
me=3Dkgsl-3d0
>
> Signed-off-by: Xiang Gao <gaoxiang17@xiaomi.com>
> ---
>  drivers/dma-buf/dma-buf.c      |  48 +++++++++-
>  include/trace/events/dma_buf.h | 160 +++++++++++++++++++++++++++++++++
>  2 files changed, 207 insertions(+), 1 deletion(-)
>  create mode 100644 include/trace/events/dma_buf.h
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 2bcf9ceca997..6e04e12f149e 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -35,6 +35,9 @@
>
>  #include "dma-buf-sysfs-stats.h"
>
> +#define CREATE_TRACE_POINTS
> +#include <trace/events/dma_buf.h>
> +
>  static inline int is_dma_buf_file(struct file *);
>
>  static DEFINE_MUTEX(dmabuf_list_mutex);
> @@ -220,6 +223,11 @@ static int dma_buf_mmap_internal(struct file *file, =
struct vm_area_struct *vma)
>             dmabuf->size >> PAGE_SHIFT)
>                 return -EINVAL;
>
> +       if (trace_dma_buf_mmap_internal_enabled()) {
> +               guard(spinlock)(&dmabuf->name_lock);
> +               trace_dma_buf_mmap_internal(dmabuf);
> +       }
> +
>         return dmabuf->ops->mmap(dmabuf, vma);
>  }
>
> @@ -745,6 +753,11 @@ struct dma_buf *dma_buf_export(const struct dma_buf_=
export_info *exp_info)
>
>         __dma_buf_list_add(dmabuf);
>
> +       if (trace_dma_buf_export_enabled()) {
> +               guard(spinlock)(&dmabuf->name_lock);
> +               trace_dma_buf_export(dmabuf);
> +       }
> +

perhaps a macro similar to the one below

#define DMA_BUF_TRACE(FUNC, ...)                  \
    do {                                          \
        if (FUNC##_enabled()) {                   \
            guard(spinlock)(&dmabuf->name_lock); \
            FUNC(__VA_ARGS__);                    \
        }                                         \
    } while (0)


This would help us avoid duplicating a lot of code.

could be:
DMA_BUF_TRACE(trace_dma_buf_put, dmabuf);
DMA_BUF_TRACE(trace_dma_buf_attach, dmabuf, dev);

?

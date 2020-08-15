Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AC624506D
	for <lists+dri-devel@lfdr.de>; Sat, 15 Aug 2020 05:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6ABA6EC59;
	Sat, 15 Aug 2020 03:04:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 529BD6EC59
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Aug 2020 03:04:41 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id bs17so8245251edb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 20:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iQxrH2bO/NJ0aDrFkDf6zxmw410k4uG/ojP6CEQt11o=;
 b=Jh/QcNG7MiIoQ6ctk5ILvIkYVGMh122DgVSCyHzYIZt3SpgGkZz7s/L0PjKzHsKlfK
 atKdwKpVg2uzOp27aW83yzPghBb1xUNOMPpHApJ3vNjsplD7je7tXOV/MRl5ndGVAMxV
 s9yPO7WM5x799+WhYMh+xBCDFBUE2/oKC3JSHcP3R/S7MZuiR6MgSTBt6xsMVerVCZ0O
 uEt0VeW/pE/NoiVPdLJVUwDIXdx7TVMpbKGvgdr4sz+fvumqlchYD25tdOCIeDc/jadl
 DG4qn3mPvHo8sCAWzCFEJrUV8ZMT5T0Z6hh/XJQ01TnFuB5FmBHEHcMpsQF0qaRLpzJR
 AmvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iQxrH2bO/NJ0aDrFkDf6zxmw410k4uG/ojP6CEQt11o=;
 b=cPM7Ry8LPFoxbT0SKZos2IHqbmk/+pVRwBwtuh76fguZK39agP8wUDZ5ar2m0muItJ
 Q6S8/pL4e12YwXOEEA927+kROCkPIQsm+e7RtRJXbR5VhQHcbp6C3A0p/1+oT1egYg9f
 y36aetSNhvfii5d7EoTfJCjlX32CgoilqZp+mXVw3WAapZ8di6EY9YVgEpdkPSK8bbXG
 9V5ycgxW5VD05/aM4MmeGh6h4xHwfJXBHV7JJmbDgALI94RScqvcoGiaTrieu7gAqRAU
 pvKflML3JhXywDLKyLD1tO6HgzxJfetxtts5l8N8I355vFZvbz32ZqMDJ8F0O0gJD0o7
 /BpQ==
X-Gm-Message-State: AOAM532jl35HvO4TEFyKggglEOtAkQs+b3ZfnSEZD9ntKuSVSM0T74Lf
 UnHKEsn1f6/Y99zxKPZWuWuNlz7Ni7xpsakKXlDp6g==
X-Google-Smtp-Source: ABdhPJzu3orbYkICYstELHkjjr8NzSTEFqXWN0XO7KRL3CgSHw/6s/CVfJ13Yf61PifEZfxCSO0nwdcPtdSXnCqd7Uk=
X-Received: by 2002:a05:6402:1587:: with SMTP id
 c7mr5269572edv.213.1597460679796; 
 Fri, 14 Aug 2020 20:04:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200814142516.148934-1-ezequiel@collabora.com>
 <CALAqxLWytSnPugPH2Ux5=C_bzC0DLGKQyB+Szcp4LOVfhKPFqg@mail.gmail.com>
In-Reply-To: <CALAqxLWytSnPugPH2Ux5=C_bzC0DLGKQyB+Szcp4LOVfhKPFqg@mail.gmail.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sat, 15 Aug 2020 00:04:28 -0300
Message-ID: <CAAEAJfCEkhD8jcsmE4R+G7nv+8+N0+u1cUxW_ivUZVSxm_eHAg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heap-helpers: Set dma-buf exporter name
To: John Stultz <john.stultz@linaro.org>
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
Cc: Liam Mark <lmark@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Andrew F . Davis" <afd@ti.com>,
 Laura Abbott <labbott@kernel.org>, kernel@collabora.com,
 Ezequiel Garcia <ezequiel@collabora.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 14 Aug 2020 at 23:20, John Stultz <john.stultz@linaro.org> wrote:
>
> On Fri, Aug 14, 2020 at 7:25 AM Ezequiel Garcia <ezequiel@collabora.com> wrote:
> >
> > Currently the heap helper uses DEFINE_DMA_BUF_EXPORT_INFO,
> > which uses KBUILD_MODNAME for the dma_buf_export_info.exp_name.
> >
> > This effectively makes all dma-bufs exported by the heap
> > helper as coming from "heap-helpers", instead of the actual heap name
> > (cma, system, etc).
> >
> > Fix this by adding a dma-heap name getter, and then setting
> > dma_buf_export_info.exp_name.
> >
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>
> Untested, but looks sane to me.
>
> Acked-by: John Stultz <john.stultz@linaro.org>
>

Cool.

> On a slightly related note, I'm starting to regret the current
> heap-helpers approach (Andrew probably gets an "I told you so" there
> :). While it avoids a lot of duplication, it's really an all or
> nothing approach, and doesn't really compare well to other drm style
> helper functions.  I may eventually try to break the system and cma
> implementations out of the helper code and try to consider a different
> approach to avoid the duplication.
>

Fully agreed :-) It definitely looks too rigid right now.

Cheers,
Ezequiel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

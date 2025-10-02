Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBD5BB3DCD
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 14:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BBC610E7C5;
	Thu,  2 Oct 2025 12:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HPDmxguC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA16510E7C5
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 12:17:39 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id
 5614622812f47-43f4fca2f43so552780b6e.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 05:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759407459; x=1760012259; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JGsaoeFP4OZoz2ETAlY65ICprHno78vJEjUPKXAIoTc=;
 b=HPDmxguCx8CWlEzzs3W3sXWfgJnZabuLKpxahxyJ/Gxzdm+2aes6iWKJvfJ3oiEuNM
 WCDa1Ut3uXp0Oq1RVwj2Amz88VER9cqPvgTVkypDtKD0RpQ1fwWc8S3YBwyIapbx5Qb3
 9e20ty4wEsBylVR5pqUSdQfRPWh9/xK6pCqpc5KHnclRg8LsXKMC+IQZ5XLQWbsXMgms
 bAIfTY/ztz/vztSxYd8wVX09QXuvPPDxkHDIU3sSTIUme2wbDxcB/5cJsItey34oUKMu
 9QjEEh8uWdnvlG/oiRkWexevCW522SeTzGJaBom7fheHJ/701TE4MAxlane/tm/gT/q3
 kpGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759407459; x=1760012259;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JGsaoeFP4OZoz2ETAlY65ICprHno78vJEjUPKXAIoTc=;
 b=laeryE6wmri4500EKSY4yCTbaJSeAv8LkTUCQXIeKBe50E/El3C+ne8wTJYFiPlsRg
 QucwyCFdmGz2tXAeW/e2K2tEzOWlxDZ4pWDJUPFv1koizyH6yb2zz/dChMoDA1ZCM0rc
 lanLEBzyW9vsyoBGlzbM9Yb5zAoUsavLKg6wfOKi6cusJb8UVl1nMJnS/ZpEKarls57T
 fEa0R+ynfl0IoIBd6hodTXzF+r2QhkB/xpsevdfwDJkJoUiWNcBrD/T2wqFIx2rO3Vww
 AfD7T40cRcMlbi7m7YSTpb7CJaEhapTgqCQ9YN2VZw8W/FaZk9L4ptmTMbiQArXp0aHy
 9Bfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWX9lJMyC65VCpJSZiLgLvffVHa/680Eta+5STnORj5RHEUWKtB0iT2Mh1L8Gu+cuoWeMz0X07h0jM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNxXKSueAdXDuJFt7mmdcxxDzrymj3bu7uGCIvgEt1ddrpeM3y
 ZiUNVgC9liuUWhtWX2zcN3XXnHASeEdYXOFttK+Lila0t1A/E2a68Pzfu6ZIuqlea5+tx/xN/XR
 ZgWqnK5z2QP6bt+t+wmL8QJM4HgG9L7aRIlAof6CLjQ==
X-Gm-Gg: ASbGncslImcbtNQOkBHsHeIvgOQcMdLpb04uHgJIyLhO3BuPvVKWpORQbjGFFY4NKwP
 fUSI5nYdUSLAdG7q1PZoGysviaWtXbp3xZxOgqoAffVQfJhBV+EDaoPlLMANWfqF1+fSmmBF1XP
 HHO7jzWl9UFj7B1Zph3HiOj0Xr+0IZ05Ve1upboofIP+UubaIeBVhZ7jSo7QRBvDZaBSgb41saX
 iP0mMDMfabvCjxMs2z0G4yCOCwvPKHsK45dqhyJkjNlKIQ=
X-Google-Smtp-Source: AGHT+IEfetTH6APo2ttHfmQ/HD9OGM73G7JSFHlGpVInBdI/YWyuV7C6xZbIUTpTHqoh4vyg+PN0N+hbiXUnxi0n74U=
X-Received: by 2002:a05:6808:6f92:b0:43f:7287:a5de with SMTP id
 5614622812f47-43fa41ccaafmr3695885b6e.41.1759407458820; Thu, 02 Oct 2025
 05:17:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250911135007.1275833-1-jens.wiklander@linaro.org>
 <20250911135007.1275833-3-jens.wiklander@linaro.org>
 <20251002-shaggy-mastiff-of-elevation-c8e1f0@houat>
In-Reply-To: <20251002-shaggy-mastiff-of-elevation-c8e1f0@houat>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 2 Oct 2025 14:17:27 +0200
X-Gm-Features: AS18NWAi5-v--TYVxyZOnQiOgWgAxWVYCjBvI6uxhCSDTvPtA0sa1z_it1UPtE8
Message-ID: <CAHUa44GtAY7=r_bA7ETOsBq+K4w6r1CtY7T9rFn224mshA5GYg@mail.gmail.com>
Subject: Re: [PATCH v12 2/9] dma-buf: dma-heap: export declared functions
To: Maxime Ripard <mripard@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, 
 Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com, 
 Sumit Garg <sumit.garg@oss.qualcomm.com>
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

Hi,

On Thu, Oct 2, 2025 at 9:47=E2=80=AFAM Maxime Ripard <mripard@redhat.com> w=
rote:
>
> Hi,
>
> On Thu, Sep 11, 2025 at 03:49:43PM +0200, Jens Wiklander wrote:
> > Export the dma-buf heap functions to allow them to be used by the OP-TE=
E
> > driver. The OP-TEE driver wants to register and manage specific secure
> > DMA heaps with it.
> >
> > Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > Reviewed-by: T.J. Mercier <tjmercier@google.com>
> > Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  drivers/dma-buf/dma-heap.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > index 3cbe87d4a464..8ab49924f8b7 100644
> > --- a/drivers/dma-buf/dma-heap.c
> > +++ b/drivers/dma-buf/dma-heap.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/dma-buf.h>
> >  #include <linux/dma-heap.h>
> >  #include <linux/err.h>
> > +#include <linux/export.h>
> >  #include <linux/list.h>
> >  #include <linux/nospec.h>
> >  #include <linux/syscalls.h>
> > @@ -202,6 +203,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
> >  {
> >       return heap->priv;
> >  }
> > +EXPORT_SYMBOL_NS_GPL(dma_heap_get_drvdata, "DMA_BUF_HEAP");
> >
> >  /**
> >   * dma_heap_get_name - get heap name
> > @@ -214,6 +216,7 @@ const char *dma_heap_get_name(struct dma_heap *heap=
)
> >  {
> >       return heap->name;
> >  }
> > +EXPORT_SYMBOL_NS_GPL(dma_heap_get_name, "DMA_BUF_HEAP");
> >
> >  /**
> >   * dma_heap_add - adds a heap to dmabuf heaps
> > @@ -303,6 +306,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap=
_export_info *exp_info)
> >       kfree(heap);
> >       return err_ret;
> >  }
> > +EXPORT_SYMBOL_NS_GPL(dma_heap_add, "DMA_BUF_HEAP");
>
> It's not clear to me why we would need to export those symbols.
>
> As far as I know, heaps cannot be removed, and compiling them as module
> means that we would be able to remove them.
>
> Now, if we don't expect the users to be compiled as modules, then we
> don't need to export these symbols at all.
>
> Am I missing something?

In this case, it's the TEE module that _might_ need to instantiate a
DMA heap. Whether it will be instantiated depends on the TEE backend
driver and the TEE firmware. If a heap is instantiated, then it will
not be possible to unload the TEE module. That might not be perfect,
but in my opinion, it's better than other options, such as always
making the TEE subsystem built-in or disabling DMA-heap support when
compiled as a module.

Thanks,
Jens

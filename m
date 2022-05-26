Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B09E535268
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 19:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD3510EB14;
	Thu, 26 May 2022 17:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 420CD10EB14
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 17:08:09 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 n2-20020a9d6f02000000b0060b22af84d4so1390441otq.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 10:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YpXK3gU1MFrHzWk9GkFkwxgitDAYXCU/14PJ3rQlleM=;
 b=TCrIjK41AJGEsuhdkM1irrrtYELkoO24Fw2pv5clw8iJlLPBWPWPhs5kKiHZvrT3YX
 HY5XjToUXI7aw9uY2zLgWD24KjdXNhPVLExNli1JOpnT+1DJGij9fMvUqCeX3vPxTypT
 FZvELruVNOEXJzwuidrsaA9GDRCl+vVDcZb54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YpXK3gU1MFrHzWk9GkFkwxgitDAYXCU/14PJ3rQlleM=;
 b=6WyVVHfsnIgYDn5ch89+GM31eWmM8A5HjZ8YujufJktJF5rQI1Kymhrt+Vd1/2PJPt
 Q0OG9w+eitbqf9/ZKEIZDDG24/w2ThISlzitBQSU7Kn3M1EK2mSY/e4LYMLCxVE22W/p
 sHe03KWRuY2jgske+9WTs18aoh2N7bpK2RWFzF4m6hoMWcN+vQAY51ydCcZfJBLCYzv+
 Zp53tEbCt4xFXIHDRyTc4j04uPi3dgCOQhuQ7zOdjWf0TbglzoRwrrmnBnC8a+OdmkOx
 r9aFgtU1vfWbqVnbb1AkbCKvLArh9XxBv0rWbzAZsBgGdfvuynPZC57ecOWSrLQZEZt0
 vfQQ==
X-Gm-Message-State: AOAM533DW6qCQSYpaJLYTHt83Qnsb89p+fNtUPtQ/vtj23jjVBdDCE39
 gPhVzmI8kvVFnA/JP7Yr+F7SycFs4MSRYKNac0rRFHShkHs=
X-Google-Smtp-Source: ABdhPJxquIBGrppiDY/QO2+Z9I10UprWafsoAaPskpB+ge+tOK5juIwQrcMNrFxmcHyXrEP65g/9jVdjEroSb8y/Bzw=
X-Received: by 2002:a9d:470e:0:b0:60b:127a:9512 with SMTP id
 a14-20020a9d470e000000b0060b127a9512mr8581849otf.301.1653584888513; Thu, 26
 May 2022 10:08:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220526163033.341425-1-contact@emersion.fr>
In-Reply-To: <20220526163033.341425-1-contact@emersion.fr>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 26 May 2022 19:07:57 +0200
Message-ID: <CAKMK7uFvwXVZu-ZZgSVNdd8HzMyETzZOMo+-LY9Tiwo9n3rEjg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: document how to find size,
 mention kernel versions
To: Simon Ser <contact@emersion.fr>
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
Cc: Jason Ekstrand <jason@jlekstrand.net>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 26 May 2022 at 18:30, Simon Ser <contact@emersion.fr> wrote:
>
> Document how to obtain the size of a DMA-BUF. This is what
> Wayland compositors are doing.
>
> Mention the kernel version numbers from which DMA-BUF features are
> available.
>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> ---
>  include/uapi/linux/dma-buf.h | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
> index 8e4a2ca0bcbf..c95f6d3457d2 100644
> --- a/include/uapi/linux/dma-buf.h
> +++ b/include/uapi/linux/dma-buf.h
> @@ -47,9 +47,13 @@
>   *
>   * If the driver or API with which the client is interacting uses implicit
>   * synchronization, waiting for prior work to complete can be done via
> - * poll() on the DMA buffer file descriptor.  If the driver or API requires
> - * explicit synchronization, the client may have to wait on a sync_file or
> - * other synchronization primitive outside the scope of the DMA buffer API.
> + * poll() on the DMA buffer file descriptor from kernel version 3.17.  If the
> + * driver or API requires explicit synchronization, the client may have to wait
> + * on a sync_file or other synchronization primitive outside the scope of the
> + * DMA buffer API.

This looks good, but you missed the DOC: implicit fence polling in
dma-buf.c. Probably good to update that too.

> + *
> + * From kernel version 3.12, user-space can use llseek(2) with the ``SEEK_END``
> + * whence to obtain the size of a DMA-BUF.

This feels misplaced, especially since this ends up under the "DMA
Buffer ioctls" heading.

Maybe simplest to just put a "DMA Buffer misc uAPI" section directly
into dma-buf.rst and put that section there? Also probably good to add
that the size is invariant.

Or if you don't want a new heading, put it somewhere sensible in the
mmap section? Also just noticed that the DOC: cpu access section could
perhaps link to the relevant ioctl docs here to connect things better.
-Daniel


>   */
>  struct dma_buf_sync {
>         /**
> --
> 2.36.1
>
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AACF34EA1DB
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 22:46:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 959DC10E05C;
	Mon, 28 Mar 2022 20:46:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B648C10E05C
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 20:46:39 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id bq8so17176459ejb.10
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 13:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JtOIKDwYEmY0G6ZwVjCPJc+EKV3kxgQ9Fb0rQsgCgxk=;
 b=Au6XxjoO3TuN885D6RISvoi4b+Imy6m9ma8wBo5nZXyzrl8us8an+07UXpqcYW8zs0
 MCSmvT+BgeqF+LC5cDbAfNpCwtLF5xXOPMaS88l46OSA1XZAyK5odoPL2mbvJ6cB4vSl
 o1GWvonXJuK6WI14daDAyrKhkAi2IwZs9OFfthpp9zgCke8yrCTZm95PoWNuAOFPK+d/
 SOtOyAdzCfpdQ3lGnMfmrpx1n2bZellSprH310zAmA2p10nge7zkW5yvynqjJUTrYqLj
 Ef4LLKkBC/m64hzJyhYmDT+bEFN9A8v++0Xe/yWHq8Gquj0Yw/CTSjM09awB/tS3ohu6
 ZXSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JtOIKDwYEmY0G6ZwVjCPJc+EKV3kxgQ9Fb0rQsgCgxk=;
 b=CBvUILT/mzMhQ0libc6YSc/GeyY6tsuY5OVse4tb70rKagSq++iy0ymgThbCtUqfBo
 kVz7lihOHxKsdI/S0MN8hl+QDVVp7yRuvqvW2tC/RoLoG+iZnjcugPTw+B+k9J25qRu8
 LI+W/FzMJAIsrc1Di5pINKESliUfbf1NXY+VGdVxtg9kNhKPWxs59SpWDt/h4hyN3F2Z
 5iBitf/8XWyorLMNDdGIWLs1Kfe5jsWjH8Q9t1gS+oU7TaKaAtVfOCs69oTBhi3wW5/7
 wqOjxbfk9Pv0ONZJe58VUVsYnW3Fk1vEpfFBrKzQ/fMtnFiu2EogivzFwzUYcDag32qr
 nYhg==
X-Gm-Message-State: AOAM533qITiB5vZyFxwIjzLUzp4fXR5M9kI0e/i7jV760upMktPPA10V
 7N8vyw726o82RN5Onu7I67VSY4O4RQnFdjHI288=
X-Google-Smtp-Source: ABdhPJxuunfwUkBAnwXYx6Ny/ga6aWVlv3hTy52B/L+8KibeTrMHKVtaauHv16KEa6mM9fV/P7rh8AZODW2UuLnRBgI=
X-Received: by 2002:a17:907:e8d:b0:6e0:19e7:9549 with SMTP id
 ho13-20020a1709070e8d00b006e019e79549mr30132608ejc.44.1648500398124; Mon, 28
 Mar 2022 13:46:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220207125933.81634-1-paul@crapouillou.net>
 <20220207125933.81634-6-paul@crapouillou.net>
In-Reply-To: <20220207125933.81634-6-paul@crapouillou.net>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 28 Mar 2022 23:46:02 +0300
Message-ID: <CAHp75Vf8QhosJw79U97rA6u0KHY9avmzTMBUqEyWkY6jxBuPYg@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] iio: core: Add new DMABUF interface
 infrastructure
To: Paul Cercueil <paul@crapouillou.net>
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-iio <linux-iio@vger.kernel.org>,
 Linux Documentation List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Alexandru Ardelean <ardeleanalex@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 8, 2022 at 5:26 PM Paul Cercueil <paul@crapouillou.net> wrote:
>
> Add the necessary infrastructure to the IIO core to support a new
> optional DMABUF based interface.
>
> The advantage of this new DMABUF based interface vs. the read()
> interface, is that it avoids an extra copy of the data between the
> kernel and userspace. This is particularly userful for high-speed

useful

> devices which produce several megabytes or even gigabytes of data per
> second.
>
> The data in this new DMABUF interface is managed at the granularity of
> DMABUF objects. Reducing the granularity from byte level to block level
> is done to reduce the userspace-kernelspace synchronization overhead
> since performing syscalls for each byte at a few Mbps is just not
> feasible.
>
> This of course leads to a slightly increased latency. For this reason an
> application can choose the size of the DMABUFs as well as how many it
> allocates. E.g. two DMABUFs would be a traditional double buffering
> scheme. But using a higher number might be necessary to avoid
> underflow/overflow situations in the presence of scheduling latencies.
>
> As part of the interface, 2 new IOCTLs have been added:
>
> IIO_BUFFER_DMABUF_ALLOC_IOCTL(struct iio_dmabuf_alloc_req *):
>  Each call will allocate a new DMABUF object. The return value (if not
>  a negative errno value as error) will be the file descriptor of the new
>  DMABUF.
>
> IIO_BUFFER_DMABUF_ENQUEUE_IOCTL(struct iio_dmabuf *):
>  Place the DMABUF object into the queue pending for hardware process.
>
> These two IOCTLs have to be performed on the IIO buffer's file
> descriptor, obtained using the IIO_BUFFER_GET_FD_IOCTL() ioctl.
>
> To access the data stored in a block by userspace the block must be
> mapped to the process's memory. This is done by calling mmap() on the
> DMABUF's file descriptor.
>
> Before accessing the data through the map, you must use the
> DMA_BUF_IOCTL_SYNC(struct dma_buf_sync *) ioctl, with the
> DMA_BUF_SYNC_START flag, to make sure that the data is available.
> This call may block until the hardware is done with this block. Once
> you are done reading or writing the data, you must use this ioctl again
> with the DMA_BUF_SYNC_END flag, before enqueueing the DMABUF to the
> kernel's queue.
>
> If you need to know when the hardware is done with a DMABUF, you can
> poll its file descriptor for the EPOLLOUT event.
>
> Finally, to destroy a DMABUF object, simply call close() on its file
> descriptor.

...

> v2: Only allow the new IOCTLs on the buffer FD created with
>     IIO_BUFFER_GET_FD_IOCTL().

Move changelogs after the cutter '--- ' line.

...

>  static const struct file_operations iio_buffer_chrdev_fileops = {
>         .owner = THIS_MODULE,
>         .llseek = noop_llseek,
>         .read = iio_buffer_read,
>         .write = iio_buffer_write,
> +       .unlocked_ioctl = iio_buffer_chrdev_ioctl,

> +       .compat_ioctl = compat_ptr_ioctl,

Is this member always available (implying the kernel configuration)?

...

> +#define IIO_BUFFER_DMABUF_SUPPORTED_FLAGS      0x00000000

No flags available right now?

...

> + * @bytes_used:        number of bytes used in this DMABUF for the data transfer.
> + *             If zero, the full buffer is used.

Wouldn't be error prone to have 0 defined like this?

-- 
With Best Regards,
Andy Shevchenko

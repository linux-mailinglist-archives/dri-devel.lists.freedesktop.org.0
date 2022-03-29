Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CE94EA9D9
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 10:54:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 980F010E770;
	Tue, 29 Mar 2022 08:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C56C10E770
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 08:54:48 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r13so23728446wrr.9
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 01:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=AKQCa5BXj3nCU08wphZwQiPGLu+26prlcxnHAtm3VJI=;
 b=JptjAoEckriZUf4zPujrteZ8s/NjMjT2ifzJiasv3jr8gD6d2FEM3pB0Uo5ATE9iAI
 VBHJZ8AQuo7sU274dzli6jcmkRGhGsJBfZxO9ClibftgH1ggxrUC7fkoULKC0iPqnfZ7
 683RUPXa73EJ+BaZYfown49PfOmqyEzjPkES4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=AKQCa5BXj3nCU08wphZwQiPGLu+26prlcxnHAtm3VJI=;
 b=Dom3rb3/YXSmNPtevyCglAK91iQII73dCbPam8sHi5Ny7Ot0QmtEsAbvmzmE5nXvLr
 h82XsUs/LUT1+cNfmvQ0257v08YX9Y0LqUjiiKUFXxcM/Z+CSB/I6/EvVI8wq1vfbccj
 o65o/ItTXNum7A4sJAc62DQXK8vh57/hEJCalXXRcR6OVQWVuPXOZyvYlwCM+Y0uk4Nu
 Tl15C5zzNl54J7BGDSqQ7jI1Zgcefzv6UdTw+4vEtFIWKkEIniGJ7yvvaQAhK+UuPEtz
 Po/iHNfmVJGPfnMoJDTu7EgpAxFSA4DLFiL9c/oBlNyMAJWFIAzkb8a3ciyMTwBkpqzX
 orHg==
X-Gm-Message-State: AOAM532fxm6XozdoSugADs0zk52jvoF5Sh+J84MQMfN8dfvCK7S/Jh+8
 /fFjG6kNnUIBxV/ElQjJNayP3g==
X-Google-Smtp-Source: ABdhPJyh7a/JYQQVslvrEv4/VrglTy3NUcoYOA6Ic3/C5QjREHupUrY0ULUNmJyK+0rJ6Zuz0toy4A==
X-Received: by 2002:a05:6000:186d:b0:204:110a:d832 with SMTP id
 d13-20020a056000186d00b00204110ad832mr29779909wri.47.1648544086671; 
 Tue, 29 Mar 2022 01:54:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a05600c0a4b00b0037c91e085ddsm1902614wmq.40.2022.03.29.01.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 01:54:45 -0700 (PDT)
Date: Tue, 29 Mar 2022 10:54:43 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 12/12] Documentation: iio: Document high-speed DMABUF
 based API
Message-ID: <YkLJU7Pp98CPIHfY@phenom.ffwll.local>
Mail-Followup-To: Paul Cercueil <paul@crapouillou.net>,
 Jonathan Cameron <jic23@kernel.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Alexandru Ardelean <ardeleanalex@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
References: <20220207125933.81634-1-paul@crapouillou.net>
 <20220207130140.81891-1-paul@crapouillou.net>
 <20220207130140.81891-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220207130140.81891-2-paul@crapouillou.net>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, linux-doc@vger.kernel.org,
 linux-iio@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Alexandru Ardelean <ardeleanalex@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 07, 2022 at 01:01:40PM +0000, Paul Cercueil wrote:
> Document the new DMABUF based API.
> 
> v2: - Explicitly state that the new interface is optional and is
>       not implemented by all drivers.
>     - The IOCTLs can now only be called on the buffer FD returned by
>       IIO_BUFFER_GET_FD_IOCTL.
>     - Move the page up a bit in the index since it is core stuff and not
>       driver-specific.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  Documentation/driver-api/dma-buf.rst |  2 +
>  Documentation/iio/dmabuf_api.rst     | 94 ++++++++++++++++++++++++++++
>  Documentation/iio/index.rst          |  2 +
>  3 files changed, 98 insertions(+)
>  create mode 100644 Documentation/iio/dmabuf_api.rst
> 
> diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
> index 2cd7db82d9fe..d3c9b58d2706 100644
> --- a/Documentation/driver-api/dma-buf.rst
> +++ b/Documentation/driver-api/dma-buf.rst
> @@ -1,3 +1,5 @@
> +.. _dma-buf:
> +
>  Buffer Sharing and Synchronization
>  ==================================
>  
> diff --git a/Documentation/iio/dmabuf_api.rst b/Documentation/iio/dmabuf_api.rst
> new file mode 100644
> index 000000000000..43bb2c1b9fdc
> --- /dev/null
> +++ b/Documentation/iio/dmabuf_api.rst
> @@ -0,0 +1,94 @@
> +===================================
> +High-speed DMABUF interface for IIO
> +===================================
> +
> +1. Overview
> +===========
> +
> +The Industrial I/O subsystem supports access to buffers through a file-based
> +interface, with read() and write() access calls through the IIO device's dev
> +node.
> +
> +It additionally supports a DMABUF based interface, where the userspace
> +application can allocate and append DMABUF objects to the buffer's queue.
> +This interface is however optional and is not available in all drivers.
> +
> +The advantage of this DMABUF based interface vs. the read()
> +interface, is that it avoids an extra copy of the data between the
> +kernel and userspace. This is particularly useful for high-speed
> +devices which produce several megabytes or even gigabytes of data per
> +second.
> +
> +The data in this DMABUF interface is managed at the granularity of
> +DMABUF objects. Reducing the granularity from byte level to block level
> +is done to reduce the userspace-kernelspace synchronization overhead
> +since performing syscalls for each byte at a few Mbps is just not
> +feasible.
> +
> +This of course leads to a slightly increased latency. For this reason an
> +application can choose the size of the DMABUFs as well as how many it
> +allocates. E.g. two DMABUFs would be a traditional double buffering
> +scheme. But using a higher number might be necessary to avoid
> +underflow/overflow situations in the presence of scheduling latencies.

So this reads a lot like reinventing io-uring with pre-registered O_DIRECT
memory ranges. Except it's using dma-buf and hand-rolling a lot of pieces
instead of io-uring and O_DIRECT.

At least if the entire justification for dma-buf support is zero-copy
support between the driver and userspace it's _really_ not the right tool
for the job. dma-buf is for zero-copy between devices, with cpu access
from userpace (or kernel fwiw) being very much the exception (and often
flat-out not supported at all).
-Daniel

> +
> +2. User API
> +===========
> +
> +``IIO_BUFFER_DMABUF_ALLOC_IOCTL(struct iio_dmabuf_alloc_req *)``
> +----------------------------------------------------------------
> +
> +Each call will allocate a new DMABUF object. The return value (if not
> +a negative errno value as error) will be the file descriptor of the new
> +DMABUF.
> +
> +``IIO_BUFFER_DMABUF_ENQUEUE_IOCTL(struct iio_dmabuf *)``
> +--------------------------------------------------------
> +
> +Place the DMABUF object into the queue pending for hardware process.
> +
> +These two IOCTLs have to be performed on the IIO buffer's file
> +descriptor, obtained using the `IIO_BUFFER_GET_FD_IOCTL` ioctl.
> +
> +3. Usage
> +========
> +
> +To access the data stored in a block by userspace the block must be
> +mapped to the process's memory. This is done by calling mmap() on the
> +DMABUF's file descriptor.
> +
> +Before accessing the data through the map, you must use the
> +DMA_BUF_IOCTL_SYNC(struct dma_buf_sync *) ioctl, with the
> +DMA_BUF_SYNC_START flag, to make sure that the data is available.
> +This call may block until the hardware is done with this block. Once
> +you are done reading or writing the data, you must use this ioctl again
> +with the DMA_BUF_SYNC_END flag, before enqueueing the DMABUF to the
> +kernel's queue.
> +
> +If you need to know when the hardware is done with a DMABUF, you can
> +poll its file descriptor for the EPOLLOUT event.
> +
> +Finally, to destroy a DMABUF object, simply call close() on its file
> +descriptor.
> +
> +For more information about manipulating DMABUF objects, see: :ref:`dma-buf`.
> +
> +A typical workflow for the new interface is:
> +
> +    for block in blocks:
> +      DMABUF_ALLOC block
> +      mmap block
> +
> +    enable buffer
> +
> +    while !done
> +      for block in blocks:
> +        DMABUF_ENQUEUE block
> +
> +        DMABUF_SYNC_START block
> +        process data
> +        DMABUF_SYNC_END block
> +
> +    disable buffer
> +
> +    for block in blocks:
> +      close block
> diff --git a/Documentation/iio/index.rst b/Documentation/iio/index.rst
> index 58b7a4ebac51..669deb67ddee 100644
> --- a/Documentation/iio/index.rst
> +++ b/Documentation/iio/index.rst
> @@ -9,4 +9,6 @@ Industrial I/O
>  
>     iio_configfs
>  
> +   dmabuf_api
> +
>     ep93xx_adc
> -- 
> 2.34.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

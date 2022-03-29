Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDA04EB2C2
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 19:35:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF71910E314;
	Tue, 29 Mar 2022 17:35:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6360310E314
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 17:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1648575309; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ydnHfdEEE0cGh6LLp0gLHchr/PKeynmaO3DCRfqS8HA=;
 b=zT3ds71tygHqEtam0GxwVSYvIN6zC+o3vlPdEROo1KmNjd9Lytb/tuDBWH0+ngULRl6ZOg
 tR3AOOUrxW6Ix95y5pMyo13nJCcMvQpGhR6U6otajP+TZK2x9dkWwrIhlc6D0alP4pw9gh
 cHm/9lTvIKvCdZHpN/Xwuy0xbSzswww=
Date: Tue, 29 Mar 2022 18:34:58 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 12/12] Documentation: iio: Document high-speed DMABUF
 based API
To: Daniel Vetter <daniel@ffwll.ch>
Message-Id: <AUOI9R.I8SSZ2CC5S2W2@crapouillou.net>
In-Reply-To: <YkMSmcQy1sKQJ5rJ@phenom.ffwll.local>
References: <20220207125933.81634-1-paul@crapouillou.net>
 <20220207130140.81891-1-paul@crapouillou.net>
 <20220207130140.81891-2-paul@crapouillou.net>
 <YkLJU7Pp98CPIHfY@phenom.ffwll.local> <Z63I9R.MKYUKBH4V8L41@crapouillou.net>
 <YkMSmcQy1sKQJ5rJ@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Alexandru Ardelean <ardeleanalex@gmail.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>,
 Christian =?iso-8859-1?b?S/ZuaWc=?= <christian.koenig@amd.com>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Le mar., mars 29 2022 at 16:07:21 +0200, Daniel Vetter=20
<daniel@ffwll.ch> a =E9crit :
> On Tue, Mar 29, 2022 at 10:47:23AM +0100, Paul Cercueil wrote:
>>  Hi Daniel,
>>=20
>>  Le mar., mars 29 2022 at 10:54:43 +0200, Daniel Vetter=20
>> <daniel@ffwll.ch> a
>>  =E9crit :
>>  > On Mon, Feb 07, 2022 at 01:01:40PM +0000, Paul Cercueil wrote:
>>  > >  Document the new DMABUF based API.
>>  > >
>>  > >  v2: - Explicitly state that the new interface is optional and=20
>> is
>>  > >        not implemented by all drivers.
>>  > >      - The IOCTLs can now only be called on the buffer FD=20
>> returned by
>>  > >        IIO_BUFFER_GET_FD_IOCTL.
>>  > >      - Move the page up a bit in the index since it is core=20
>> stuff
>>  > > and not
>>  > >        driver-specific.
>>  > >
>>  > >  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  > >  ---
>>  > >   Documentation/driver-api/dma-buf.rst |  2 +
>>  > >   Documentation/iio/dmabuf_api.rst     | 94
>>  > > ++++++++++++++++++++++++++++
>>  > >   Documentation/iio/index.rst          |  2 +
>>  > >   3 files changed, 98 insertions(+)
>>  > >   create mode 100644 Documentation/iio/dmabuf_api.rst
>>  > >
>>  > >  diff --git a/Documentation/driver-api/dma-buf.rst
>>  > > b/Documentation/driver-api/dma-buf.rst
>>  > >  index 2cd7db82d9fe..d3c9b58d2706 100644
>>  > >  --- a/Documentation/driver-api/dma-buf.rst
>>  > >  +++ b/Documentation/driver-api/dma-buf.rst
>>  > >  @@ -1,3 +1,5 @@
>>  > >  +.. _dma-buf:
>>  > >  +
>>  > >   Buffer Sharing and Synchronization
>>  > >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>  > >
>>  > >  diff --git a/Documentation/iio/dmabuf_api.rst
>>  > > b/Documentation/iio/dmabuf_api.rst
>>  > >  new file mode 100644
>>  > >  index 000000000000..43bb2c1b9fdc
>>  > >  --- /dev/null
>>  > >  +++ b/Documentation/iio/dmabuf_api.rst
>>  > >  @@ -0,0 +1,94 @@
>>  > >  +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>  > >  +High-speed DMABUF interface for IIO
>>  > >  +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>  > >  +
>>  > >  +1. Overview
>>  > >  +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>  > >  +
>>  > >  +The Industrial I/O subsystem supports access to buffers=20
>> through a
>>  > > file-based
>>  > >  +interface, with read() and write() access calls through the=20
>> IIO
>>  > > device's dev
>>  > >  +node.
>>  > >  +
>>  > >  +It additionally supports a DMABUF based interface, where the
>>  > > userspace
>>  > >  +application can allocate and append DMABUF objects to the=20
>> buffer's
>>  > > queue.
>>  > >  +This interface is however optional and is not available in all
>>  > > drivers.
>>  > >  +
>>  > >  +The advantage of this DMABUF based interface vs. the read()
>>  > >  +interface, is that it avoids an extra copy of the data=20
>> between the
>>  > >  +kernel and userspace. This is particularly useful for=20
>> high-speed
>>  > >  +devices which produce several megabytes or even gigabytes of=20
>> data
>>  > > per
>>  > >  +second.
>>  > >  +
>>  > >  +The data in this DMABUF interface is managed at the=20
>> granularity of
>>  > >  +DMABUF objects. Reducing the granularity from byte level to=20
>> block
>>  > > level
>>  > >  +is done to reduce the userspace-kernelspace synchronization
>>  > > overhead
>>  > >  +since performing syscalls for each byte at a few Mbps is just=20
>> not
>>  > >  +feasible.
>>  > >  +
>>  > >  +This of course leads to a slightly increased latency. For this
>>  > > reason an
>>  > >  +application can choose the size of the DMABUFs as well as how=20
>> many
>>  > > it
>>  > >  +allocates. E.g. two DMABUFs would be a traditional double=20
>> buffering
>>  > >  +scheme. But using a higher number might be necessary to avoid
>>  > >  +underflow/overflow situations in the presence of scheduling
>>  > > latencies.
>>  >
>>  > So this reads a lot like reinventing io-uring with pre-registered
>>  > O_DIRECT
>>  > memory ranges. Except it's using dma-buf and hand-rolling a lot of
>>  > pieces
>>  > instead of io-uring and O_DIRECT.
>>=20
>>  I don't see how io_uring would help us. It's an async I/O=20
>> framework, does it
>>  allow us to access a kernel buffer without copying the data? Does=20
>> it allow
>>  us to zero-copy the data to a network interface?
>=20
> With networking, do you mean rdma, or some other kind of networking?
> Anything else than rdma doesn't support dma-buf, and I don't think it=20
> will
> likely ever do so. Similar it's really tricky to glue dma-buf support=20
> into
> the block layer.

By networking I mean standard sockets. If I'm not mistaken, Jonathan=20
Lemon's work on zctap was to add dma-buf import/export support to=20
standard sockets.

> Wrt io_uring, yes it's async, but that's not the point. The point is=20
> that
> with io_uring you pre-register ranges for reads and writes to target,
> which in combination with O_DIRECT, makes it effectively (and=20
> efficient!)
> zero-copy. Plus it has full integration with both networking and=20
> normal
> file io, which dma-buf just doesn't have.
>=20
> Like you _cannot_ do zero copy from a dma-buf into a normal file. You
> absolutely can do the same with io_uring.

I believe io_uring does zero-copy the same way as splice(), by=20
duplicating/moving pages? Because that wouldn't work with DMA coherent=20
memory, which is contiguous and not backed by pages.

>>  > At least if the entire justification for dma-buf support is=20
>> zero-copy
>>  > support between the driver and userspace it's _really_ not the=20
>> right
>>  > tool
>>  > for the job. dma-buf is for zero-copy between devices, with cpu=20
>> access
>>  > from userpace (or kernel fwiw) being very much the exception (and=20
>> often
>>  > flat-out not supported at all).
>>=20
>>  We want both. Using dma-bufs for the driver/userspace interface is a
>>  convenience as we then have a unique API instead of two distinct=20
>> ones.
>>=20
>>  Why should CPU access from userspace be the exception? It works=20
>> fine for IIO
>>  dma-bufs. You keep warning about this being a terrible design, but=20
>> I simply
>>  don't see it.
>=20
> It depends really on what you're trying to do, and there's extremely=20
> high
> chances it will simply not work.

Well it does work though. The userspace interface is stupidly simple=20
here - one dma-buf, backed by DMA coherent memory, is enqueued for=20
processing by the DMA. The userspace calling the "sync" ioctl on the=20
dma-buf will block until the transfer is complete, and then userspace=20
can access it again.


> Unless you want to do zero copy with a gpu, or something which is in=20
> that
> ecosystem of accelerators and devices, then dma-buf is probably not=20
> what
> you're looking for.
> -Daniel

I want to do zero-copy between a IIO device and the network/USB, and=20
right now there is absolutely nothing in place that allows me to do=20
that. So I have to get creative.

Cheers,
-Paul

>>=20
>>  > >  +
>>  > >  +2. User API
>>  > >  +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>  > >  +
>>  > >  +``IIO_BUFFER_DMABUF_ALLOC_IOCTL(struct iio_dmabuf_alloc_req=20
>> *)``
>>  > > =20
>> +----------------------------------------------------------------
>>  > >  +
>>  > >  +Each call will allocate a new DMABUF object. The return value=20
>> (if
>>  > > not
>>  > >  +a negative errno value as error) will be the file descriptor=20
>> of
>>  > > the new
>>  > >  +DMABUF.
>>  > >  +
>>  > >  +``IIO_BUFFER_DMABUF_ENQUEUE_IOCTL(struct iio_dmabuf *)``
>>  > >  +--------------------------------------------------------
>>  > >  +
>>  > >  +Place the DMABUF object into the queue pending for hardware
>>  > > process.
>>  > >  +
>>  > >  +These two IOCTLs have to be performed on the IIO buffer's file
>>  > >  +descriptor, obtained using the `IIO_BUFFER_GET_FD_IOCTL`=20
>> ioctl.
>>  > >  +
>>  > >  +3. Usage
>>  > >  +=3D=3D=3D=3D=3D=3D=3D=3D
>>  > >  +
>>  > >  +To access the data stored in a block by userspace the block=20
>> must be
>>  > >  +mapped to the process's memory. This is done by calling=20
>> mmap() on
>>  > > the
>>  > >  +DMABUF's file descriptor.
>>  > >  +
>>  > >  +Before accessing the data through the map, you must use the
>>  > >  +DMA_BUF_IOCTL_SYNC(struct dma_buf_sync *) ioctl, with the
>>  > >  +DMA_BUF_SYNC_START flag, to make sure that the data is=20
>> available.
>>  > >  +This call may block until the hardware is done with this=20
>> block.
>>  > > Once
>>  > >  +you are done reading or writing the data, you must use this=20
>> ioctl
>>  > > again
>>  > >  +with the DMA_BUF_SYNC_END flag, before enqueueing the DMABUF=20
>> to the
>>  > >  +kernel's queue.
>>  > >  +
>>  > >  +If you need to know when the hardware is done with a DMABUF,=20
>> you
>>  > > can
>>  > >  +poll its file descriptor for the EPOLLOUT event.
>>  > >  +
>>  > >  +Finally, to destroy a DMABUF object, simply call close() on=20
>> its
>>  > > file
>>  > >  +descriptor.
>>  > >  +
>>  > >  +For more information about manipulating DMABUF objects, see:
>>  > > :ref:`dma-buf`.
>>  > >  +
>>  > >  +A typical workflow for the new interface is:
>>  > >  +
>>  > >  +    for block in blocks:
>>  > >  +      DMABUF_ALLOC block
>>  > >  +      mmap block
>>  > >  +
>>  > >  +    enable buffer
>>  > >  +
>>  > >  +    while !done
>>  > >  +      for block in blocks:
>>  > >  +        DMABUF_ENQUEUE block
>>  > >  +
>>  > >  +        DMABUF_SYNC_START block
>>  > >  +        process data
>>  > >  +        DMABUF_SYNC_END block
>>  > >  +
>>  > >  +    disable buffer
>>  > >  +
>>  > >  +    for block in blocks:
>>  > >  +      close block
>>  > >  diff --git a/Documentation/iio/index.rst
>>  > > b/Documentation/iio/index.rst
>>  > >  index 58b7a4ebac51..669deb67ddee 100644
>>  > >  --- a/Documentation/iio/index.rst
>>  > >  +++ b/Documentation/iio/index.rst
>>  > >  @@ -9,4 +9,6 @@ Industrial I/O
>>  > >
>>  > >      iio_configfs
>>  > >
>>  > >  +   dmabuf_api
>>  > >  +
>>  > >      ep93xx_adc
>>  > >  --
>>  > >  2.34.1
>>  > >
>>  >
>>  > --
>>  > Daniel Vetter
>>  > Software Engineer, Intel Corporation
>>  > http://blog.ffwll.ch
>>=20
>>=20
>=20
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



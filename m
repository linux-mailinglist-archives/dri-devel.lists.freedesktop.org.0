Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBFD45858E
	for <lists+dri-devel@lfdr.de>; Sun, 21 Nov 2021 18:46:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30EA66ECD7;
	Sun, 21 Nov 2021 17:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 306026ECD7
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Nov 2021 17:46:34 +0000 (UTC)
Date: Sun, 21 Nov 2021 17:46:21 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 15/15] Documentation: iio: Document high-speed DMABUF
 based API
To: Jonathan Cameron <jic23@kernel.org>
Message-Id: <91OX2R.MG3TG0PKKKRK3@crapouillou.net>
In-Reply-To: <20211121151026.0cc95f40@jic23-huawei>
References: <20211115141925.60164-1-paul@crapouillou.net>
 <20211115142243.60605-1-paul@crapouillou.net>
 <20211115142243.60605-4-paul@crapouillou.net>
 <20211121151026.0cc95f40@jic23-huawei>
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?b?S/ZuaWc=?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Alexandru Ardelean <ardeleanalex@gmail.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jonathan,

Le dim., nov. 21 2021 at 15:10:26 +0000, Jonathan Cameron=20
<jic23@kernel.org> a =E9crit :
> On Mon, 15 Nov 2021 14:22:43 +0000
> Paul Cercueil <paul@crapouillou.net> wrote:
>=20
>>  Document the new DMABUF based API.
>>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>=20
> Hi Paul,
>=20
> A few trivial things inline but looks good to me if we do end up=20
> using DMABUF
> anyway.
>=20
> Jonathan
>=20
>>  ---
>>   Documentation/driver-api/dma-buf.rst |  2 +
>>   Documentation/iio/dmabuf_api.rst     | 94=20
>> ++++++++++++++++++++++++++++
>>   Documentation/iio/index.rst          |  2 +
>>   3 files changed, 98 insertions(+)
>>   create mode 100644 Documentation/iio/dmabuf_api.rst
>>=20
>>  diff --git a/Documentation/driver-api/dma-buf.rst=20
>> b/Documentation/driver-api/dma-buf.rst
>>  index 2cd7db82d9fe..d3c9b58d2706 100644
>>  --- a/Documentation/driver-api/dma-buf.rst
>>  +++ b/Documentation/driver-api/dma-buf.rst
>>  @@ -1,3 +1,5 @@
>>  +.. _dma-buf:
>>  +
>=20
> Why this change?

I have this line in the file:
For more information about manipulating DMABUF objects, see:=20
:ref:`dma-buf`.

For the :ref: to work I need a label at the reference point, if I=20
understood correctly.

>>   Buffer Sharing and Synchronization
>>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>=20
>>  diff --git a/Documentation/iio/dmabuf_api.rst=20
>> b/Documentation/iio/dmabuf_api.rst
>>  new file mode 100644
>>  index 000000000000..b4e120a4ef0c
>>  --- /dev/null
>>  +++ b/Documentation/iio/dmabuf_api.rst
>>  @@ -0,0 +1,94 @@
>>  +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>  +High-speed DMABUF interface for IIO
>>  +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>  +
>>  +1. Overview
>>  +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>  +
>>  +The Industrial I/O subsystem supports access to buffers through a=20
>> file-based
>>  +interface, with read() and write() access calls through the IIO=20
>> device's dev
>>  +node.
>>  +
>>  +It additionally supports a DMABUF based interface, where the=20
>> userspace
>>  +application can allocate and append DMABUF objects to the buffer's=20
>> queue.
>=20
> I would note somewhere that this interface is optional for a given=20
> IIO driver.
> I don't want people to start assuming their i2c ADC will support this=20
> and
> wondering why it doesn't work :)

Their I2C ADC will support it, as long as the driver supports the=20
dmaengine buffer interface. I can make that explicit, yes.

>>  +
>>  +The advantage of this DMABUF based interface vs. the fileio
>>  +interface, is that it avoids an extra copy of the data between the
>>  +kernel and userspace. This is particularly userful for high-speed
>>  +devices which produce several megabytes or even gigabytes of data=20
>> per
>>  +second.
>>  +
>>  +The data in this DMABUF interface is managed at the granularity of
>>  +DMABUF objects. Reducing the granularity from byte level to block=20
>> level
>>  +is done to reduce the userspace-kernelspace synchronization=20
>> overhead
>>  +since performing syscalls for each byte at a few Mbps is just not
>>  +feasible.
>>  +
>>  +This of course leads to a slightly increased latency. For this=20
>> reason an
>>  +application can choose the size of the DMABUFs as well as how many=20
>> it
>>  +allocates. E.g. two DMABUFs would be a traditional double buffering
>>  +scheme. But using a higher number might be necessary to avoid
>>  +underflow/overflow situations in the presence of scheduling=20
>> latencies.
>>  +
>>  +2. User API
>>  +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>  +
>>  +``IIO_BUFFER_DMABUF_ALLOC_IOCTL(struct iio_dmabuf_alloc_req *)``
>>  +----------------------------------------------------------------
>>  +
>>  +Each call will allocate a new DMABUF object. The return value (if=20
>> not
>>  +a negative errno value as error) will be the file descriptor of=20
>> the new
>>  +DMABUF.
>>  +
>>  +``IIO_BUFFER_DMABUF_ENQUEUE_IOCTL(struct iio_dmabuf *)``
>>  +--------------------------------------------------------
>>  +
>>  +Place the DMABUF object into the queue pending for hardware=20
>> process.
>>  +
>>  +These two IOCTLs have to be performed on the IIO buffer's file
>>  +descriptor (either opened from the corresponding /dev/iio:deviceX,=20
>> or
>>  +obtained using the `IIO_BUFFER_GET_FD_IOCTL` ioctl).
>>  +
>>  +3. Usage
>>  +=3D=3D=3D=3D=3D=3D=3D=3D
>>  +
>>  +To access the data stored in a block by userspace the block must be
>>  +mapped to the process's memory. This is done by calling mmap() on=20
>> the
>>  +DMABUF's file descriptor.
>>  +
>>  +Before accessing the data through the map, you must use the
>>  +DMA_BUF_IOCTL_SYNC(struct dma_buf_sync *) ioctl, with the
>>  +DMA_BUF_SYNC_START flag, to make sure that the data is available.
>>  +This call may block until the hardware is done with this block.=20
>> Once
>>  +you are done reading or writing the data, you must use this ioctl=20
>> again
>>  +with the DMA_BUF_SYNC_END flag, before enqueueing the DMABUF to the
>>  +kernel's queue.
>>  +
>>  +If you need to know when the hardware is done with a DMABUF, you=20
>> can
>>  +poll its file descriptor for the EPOLLOUT event.
>>  +
>>  +Finally, to destroy a DMABUF object, simply call close() on its=20
>> file
>>  +descriptor.
>>  +
>>  +For more information about manipulating DMABUF objects, see:=20
>> :ref:`dma-buf`.
>>  +
>>  +A typical workflow for the new interface is:
>>  +
>>  +    for block in blocks:
>>  +      DMABUF_ALLOC block
>>  +      mmap block
>>  +
>>  +    enable buffer
>>  +
>>  +    while !done
>>  +      for block in blocks:
>>  +        DMABUF_ENQUEUE block
>>  +
>>  +        DMABUF_SYNC_START block
>>  +        process data
>>  +        DMABUF_SYNC_END block
>>  +
>>  +    disable buffer
>>  +
>>  +    for block in blocks:
>>  +      close block
>>  diff --git a/Documentation/iio/index.rst=20
>> b/Documentation/iio/index.rst
>>  index 58b7a4ebac51..9ce799fbf262 100644
>>  --- a/Documentation/iio/index.rst
>>  +++ b/Documentation/iio/index.rst
>>  @@ -10,3 +10,5 @@ Industrial I/O
>>      iio_configfs
>>=20
>>      ep93xx_adc
>>  +
>>  +   dmabuf_api
>=20
> Given this is core stuff rather than driver specific, perhaps move it=20
> up a few lines?

Alright.

Cheers,
-Paul



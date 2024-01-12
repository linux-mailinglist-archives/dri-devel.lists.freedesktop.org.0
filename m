Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 908E082BF40
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 12:33:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6075110E10C;
	Fri, 12 Jan 2024 11:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8941610E10C
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 11:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1705059226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=sH64oullDZ7RJP3FM9t7ObORfwdWzEysNhg/bsqbBbI=;
 b=TXOZno8nifkzr/D8qdkXHWJBjg5xOBoR0ZMOc1+7oBP5NygZuRxJp1mm3873Yf/lMsGCLw
 v/pYr6F6O8jn7b9RVGyypMgMPIPVME7NgRZ1V1uXFx7d0+CMqZD7ihVYgPLxeYB4c80rPf
 WUugyFQ9TWd2Ba0zRZ+vyYjt1yEzgNY=
Message-ID: <61d1708a309e3873978992feb0d068b36c6924ea.camel@crapouillou.net>
Subject: Re: [PATCH v5 0/8] iio: new DMABUF based API, v5
From: Paul Cercueil <paul@crapouillou.net>
To: Andrew Davis <afd@ti.com>, Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen
 <lars@metafoo.de>, Sumit Semwal <sumit.semwal@linaro.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Vinod Koul <vkoul@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>
Date: Fri, 12 Jan 2024 12:33:44 +0100
In-Reply-To: <d67aba3f-d95a-4dfc-8fdb-234843047432@ti.com>
References: <20231219175009.65482-1-paul@crapouillou.net>
 <6ec8c7c4-588a-48b5-b0c5-56ca5216a757@ti.com>
 <bbd6e9d6f239efee8886e08f3c3493fc968e53ce.camel@crapouillou.net>
 <d67aba3f-d95a-4dfc-8fdb-234843047432@ti.com>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZMLQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5UzFZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtNz8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe+rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIPdlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7Urf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KFlBwgAhlGy6nqP7O3u7q23hRW5AQ0EXQqFwQEIAMo+MgvYHsyjX3Ja4Oolg1Txzm8woj30ch2nACFCqaO0R/1kLj2VVeLrDyQUOlXx9PD6IQI4M8wy8m0sR4wV2p/g/paw7k65cjzYYLh+FdLNyO7IW
 YXndJO+wDPi3aK/YKUYepqlP+QsmaHNYNdXEQDRKqNfJg8t0f5rfzp9ryxd1tCnbV+tG8VHQWiZXNqN7062DygSNXFUfQ0vZ3J2D4oAcIAEXTymRQ2+hr3Hf7I61KMHWeSkCvCG2decTYsHlw5Erix/jYWqVOtX0roOOLqWkqpQQJWtU+biWrAksmFmCp5fXIg1Nlg39v21xCXBGxJkxyTYuhdWyu1yDQ+LSIUAEQEAAYkBNgQYAQoAIBYhBNdHYd8OeCBwpMuVxnPua9InSr1BBQJdCoXBAhsMAAoJEHPua9InSr1B4wsH/Az767YCT0FSsMNt1jkkdLCBi7nY0GTW+PLP1a4zvVqFMo/vD6uz1ZflVTUAEvcTi3VHYZrlgjcxmcGu239oruqUS8Qy/xgZBp9KF0NTWQSl1iBfVbIU5VV1vHS6r77W5x0qXgfvAUWOH4gmN3MnF01SH2zMcLiaUGF+mcwl15rHbjnT3Nu2399aSE6cep86igfCAyFUOXjYEGlJy+c6UyT+DUylpjQg0nl8MlZ/7Whg2fAU9+FALIbQYQzGlT4c71SibR9T741jnegHhlmV4WXXUD6roFt54t0MSAFSVxzG8mLcSjR2cLUJ3NIPXixYUSEn3tQhfZj07xIIjWxAYZo=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrew,

Le jeudi 11 janvier 2024 =C3=A0 11:30 -0600, Andrew Davis a =C3=A9crit=C2=
=A0:
> On 1/11/24 3:20 AM, Paul Cercueil wrote:
> > Hi Andrew,
> >=20
> > Le lundi 08 janvier 2024 =C3=A0 15:12 -0600, Andrew Davis a =C3=A9crit=
=C2=A0:
> > > On 12/19/23 11:50 AM, Paul Cercueil wrote:
> > > > [V4 was: "iio: Add buffer write() support"][1]
> > > >=20
> > > > Hi Jonathan,
> > > >=20
> > > > This is a respin of the V3 of my patchset that introduced a new
> > > > interface based on DMABUF objects [2].
> > > >=20
> > > > The V4 was a split of the patchset, to attempt to upstream
> > > > buffer
> > > > write() support first. But since there is no current user
> > > > upstream,
> > > > it
> > > > was not merged. This V5 is about doing the opposite, and
> > > > contains
> > > > the
> > > > new DMABUF interface, without adding the buffer write()
> > > > support. It
> > > > can
> > > > already be used with the upstream adi-axi-adc driver.
> > > >=20
> > > > In user-space, Libiio uses it to transfer back and forth blocks
> > > > of
> > > > samples between the hardware and the applications, without
> > > > having
> > > > to
> > > > copy the data.
> > > >=20
> > > > On a ZCU102 with a FMComms3 daughter board, running Libiio from
> > > > the
> > > > pcercuei/dev-new-dmabuf-api branch [3], compiled with
> > > > WITH_LOCAL_DMABUF_API=3DOFF (so that it uses fileio):
> > > > =C2=A0=C2=A0=C2=A0 sudo utils/iio_rwdev -b 4096 -B cf-ad9361-lpc
> > > > =C2=A0=C2=A0=C2=A0 Throughput: 116 MiB/s
> > > >=20
> > > > Same hardware, with the DMABUF API (WITH_LOCAL_DMABUF_API=3DON):
> > > > =C2=A0=C2=A0=C2=A0 sudo utils/iio_rwdev -b 4096 -B cf-ad9361-lpc
> > > > =C2=A0=C2=A0=C2=A0 Throughput: 475 MiB/s
> > > >=20
> > > > This benchmark only measures the speed at which the data can be
> > > > fetched
> > > > to iio_rwdev's internal buffers, and does not actually try to
> > > > read
> > > > the
> > > > data (e.g. to pipe it to stdout). It shows that fetching the
> > > > data
> > > > is
> > > > more than 4x faster using the new interface.
> > > >=20
> > > > When actually reading the data, the performance difference
> > > > isn't
> > > > that
> > > > impressive (maybe because in case of DMABUF the data is not in
> > > > cache):
> > > >=20
> > > > WITH_LOCAL_DMABUF_API=3DOFF (so that it uses fileio):
> > > > =C2=A0=C2=A0=C2=A0 sudo utils/iio_rwdev -b 4096 cf-ad9361-lpc | dd
> > > > of=3D/dev/zero
> > > > status=3Dprogress
> > > > =C2=A0=C2=A0=C2=A0 2446422528 bytes (2.4 GB, 2.3 GiB) copied, 22 s,=
 111 MB/s
> > > >=20
> > > > WITH_LOCAL_DMABUF_API=3DON:
> > > > =C2=A0=C2=A0=C2=A0 sudo utils/iio_rwdev -b 4096 cf-ad9361-lpc | dd
> > > > of=3D/dev/zero
> > > > status=3Dprogress
> > > > =C2=A0=C2=A0=C2=A0 2334388736 bytes (2.3 GB, 2.2 GiB) copied, 21 s,=
 114 MB/s
> > > >=20
> > > > One interesting thing to note is that fileio is (currently)
> > > > actually
> > > > faster than the DMABUF interface if you increase a lot the
> > > > buffer
> > > > size.
> > > > My explanation is that the cache invalidation routine takes
> > > > more
> > > > and
> > > > more time the bigger the DMABUF gets. This is because the
> > > > DMABUF is
> > > > backed by small-size pages, so a (e.g.) 64 MiB DMABUF is backed
> > > > by
> > > > up
> > > > to 16 thousands pages, that have to be invalidated one by one.
> > > > This
> > > > can
> > > > be addressed by using huge pages, but the udmabuf driver does
> > > > not
> > > > (yet)
> > > > support creating DMABUFs backed by huge pages.
> > > >=20
> > >=20
> > > Have you tried DMABUFs created using the DMABUF System heap
> > > exporter?
> > > (drivers/dma-buf/heaps/system_heap.c) It should be able to handle
> > > larger allocation better here, and if you don't have any active
> > > mmaps or vmaps then it can skip CPU-side coherency maintenance
> > > (useful for device to device transfers).
> >=20
> > I didn't know about it!
> >=20
> > But udmabuf also allows you to skip CPU-side coherency maintenance,
> > since DMABUFs have two ioctls to start/finish CPU access anyway.
> >=20
>=20
> The only way it lets you skip that is if your application just
> doesn't
> call those begin/end ioctls, which is wrong. That may work on a
> system
> where CPU caches can be snooped by all devices that could attach to
> a buffer(x86), but that might not work on others(ARM). So calling
> those begin/end ioctls is required[0]. If maintenance is not actually
> needed then the kernel will turn those calls into NOPs for you, but
> only
> the kernel can know when that is correct (based on the running system
> and the devices attached to that buffer), not userspace.

My application only calls these begin/end IOCTLs when the DMABUF's data
is accessed (through its mmapped address), and not ie. when I just pass
around the DMABUF to another device driver. In that case I don't care
that the CPU caches aren't sync'd.

>=20
> > > Allocating DMABUFs out of user pages has a bunch of other issues
> > > you
> > > might run into also. I'd argue udmabuf is now completely
> > > superseded
> > > by DMABUF system heaps. Try it out :)
> >=20
> > I'm curious, what other issues?
> >=20
>=20
> For starters the {begin,end}_cpu_access() callbacks don't actually
> sync the pages for any of the devices attached to the DMABUF, it
> only makes a fake mapping for the misc device(CPU) then syncs with
> that. That probably works for the QEMU case it was designed for where
> the device is always a VM instance running on the same CPU, but for
> any real devices the sync never happens towards them.
>=20
> I have some patches fixing the above I'll post this cycle, but it
> wont help with folks doing reads/wrties on the original shmem/memfd
> outside of the begin/end ioctls. So there is a fundamental issue
> with the buffer's backing memory's ownership/lifecycle that makes
> udmabuf broken by design.
>=20
> The DMABUF System Heap owns the backing memory and manages that
> memory's lifecycle as all correct DMABUF exporters must.

Sounds good.

One other issue I was having with udmabuf is that it does not like huge
pages, so I had to use small 4096 bytes pages. Since my DMABUFs can be
huge (half of the RAM) this caused my SGs to be very long, and in turn
cause the CPU to spend an enormous amount of time inside
dma_sg_sync_for_cpu().

At least the DMABUF system heap seems better designed in that regard.

>=20
> > The good thing about udmabuf is that the memory is backed by pages,
> > so
> > we can use MSG_ZEROCOPY on sockets to transfer the mmapped data
> > over
> > the network (having a DMABUF interface to the network stack would
> > be
> > better, but I'm not opening that can of worms).
> >=20
>=20
> Yes, having a DMABUF importer interface for the network stack would
> be
> the best long-term solution here, and one will probably end up being
> needed for zero-copy buffer passing directly between HW and network
> which seems to be a growing area of interest. And would help solve
> some cases where MSG_ZEROCOPY fails (such as devices without
> scatter-gather) by making sure the backing buffer meets the needs
> of all attached devices, etc.. But I do agree let's leave those
> worm-cans for someone else to open :)
>=20
> I wonder what would happen if you tried a MSG_ZEROCOPY on a buffer
> that was an mmap'd address from a DMABUF.. probably nothing good
> but might be worth looking into.

I'll give it a try at some point.

Cheers,
-Paul

>=20
> Andrew
>=20
> [0]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/dma-buf/dma-buf.c#n1323
>=20
> > > Andrew
> >=20
> > Cheers,
> > -Paul
> >=20
> > > > Anyway, the real benefits happen when the DMABUFs are either
> > > > shared
> > > > between IIO devices, or between the IIO subsystem and another
> > > > filesystem. In that case, the DMABUFs are simply passed around
> > > > drivers,
> > > > without the data being copied at any moment.
> > > >=20
> > > > We use that feature to transfer samples from our transceivers
> > > > to
> > > > USB,
> > > > using a DMABUF interface to FunctionFS [4].
> > > >=20
> > > > This drastically increases the throughput, to about 274 MiB/s
> > > > over
> > > > a
> > > > USB3 link, vs. 127 MiB/s using IIO's fileio interface + write()
> > > > to
> > > > the
> > > > FunctionFS endpoints, for a lower CPU usage (0.85 vs. 0.65 load
> > > > avg.).
> > > >=20
> > > > Based on linux-next/next-20231219.
> > > >=20
> > > > Cheers,
> > > > -Paul
> > > >=20
> > > > [1]
> > > > https://lore.kernel.org/all/20230807112113.47157-1-paul@crapouillou=
.net/
> > > > [2]
> > > > https://lore.kernel.org/all/20230403154800.215924-1-paul@crapouillo=
u.net/
> > > > [3]
> > > > https://github.com/analogdevicesinc/libiio/tree/pcercuei/dev-new-dm=
abuf-api
> > > > [4]
> > > > https://lore.kernel.org/all/20230322092118.9213-1-paul@crapouillou.=
net/
> > > >=20
> > > > ---
> > > > Changelog:
> > > > - [3/8]: Replace V3's dmaengine_prep_slave_dma_array() with a
> > > > new
> > > > =C2=A0=C2=A0=C2=A0 dmaengine_prep_slave_dma_vec(), which uses a new=
 'dma_vec'
> > > > struct.
> > > > =C2=A0=C2=A0=C2=A0 Note that at some point we will need to support =
cyclic
> > > > transfers
> > > > =C2=A0=C2=A0=C2=A0 using dmaengine_prep_slave_dma_vec(). Maybe with=
 a new
> > > > "flags"
> > > > =C2=A0=C2=A0=C2=A0 parameter to the function?
> > > >=20
> > > > - [4/8]: Implement .device_prep_slave_dma_vec() instead of V3's
> > > > =C2=A0=C2=A0=C2=A0 .device_prep_slave_dma_array().
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0 @Vinod: this patch will cause a small conflict w=
ith my
> > > > other
> > > > =C2=A0=C2=A0=C2=A0 patchset adding scatter-gather support to the ax=
i-dmac
> > > > driver.
> > > > =C2=A0=C2=A0=C2=A0 This patch adds a call to axi_dmac_alloc_desc(nu=
m_sgs), but
> > > > the
> > > > =C2=A0=C2=A0=C2=A0 prototype of this function changed in my other p=
atchset -
> > > > it
> > > > would
> > > > =C2=A0=C2=A0=C2=A0 have to be passed the "chan" variable. I don't k=
now how you
> > > > prefer it
> > > > =C2=A0=C2=A0=C2=A0 to be resolved. Worst case scenario (and if @Jon=
athan is
> > > > okay
> > > > with
> > > > =C2=A0=C2=A0=C2=A0 that) this one patch can be re-sent later, but i=
t would
> > > > make
> > > > this
> > > > =C2=A0=C2=A0=C2=A0 patchset less "atomic".
> > > >=20
> > > > - [5/8]:
> > > > =C2=A0=C2=A0=C2=A0 - Use dev_err() instead of pr_err()
> > > > =C2=A0=C2=A0=C2=A0 - Inline to_iio_dma_fence()
> > > > =C2=A0=C2=A0=C2=A0 - Add comment to explain why we unref twice when=
 detaching
> > > > dmabuf
> > > > =C2=A0=C2=A0=C2=A0 - Remove TODO comment. It is actually safe to fr=
ee the
> > > > file's
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 private data even when transfers are=
 still pending
> > > > because it
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 won't be accessed.
> > > > =C2=A0=C2=A0=C2=A0 - Fix documentation of new fields in struct
> > > > iio_buffer_access_funcs
> > > > =C2=A0=C2=A0=C2=A0 - iio_dma_resv_lock() does not need to be export=
ed, make it
> > > > static
> > > >=20
> > > > - [7/8]:
> > > > =C2=A0=C2=A0=C2=A0 - Use the new dmaengine_prep_slave_dma_vec().
> > > > =C2=A0=C2=A0=C2=A0 - Restrict to input buffers, since output buffer=
s are not
> > > > yet
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 supported by IIO buffers.
> > > >=20
> > > > - [8/8]:
> > > > =C2=A0=C2=A0=C2=A0 Use description lists for the documentation of t=
he three
> > > > new
> > > > IOCTLs
> > > > =C2=A0=C2=A0=C2=A0 instead of abusing subsections.
> > > >=20
> > > > ---
> > > > Alexandru Ardelean (1):
> > > > =C2=A0=C2=A0=C2=A0 iio: buffer-dma: split iio_dma_buffer_fileio_fre=
e()
> > > > function
> > > >=20
> > > > Paul Cercueil (7):
> > > > =C2=A0=C2=A0=C2=A0 iio: buffer-dma: Get rid of outgoing queue
> > > > =C2=A0=C2=A0=C2=A0 dmaengine: Add API function dmaengine_prep_slave=
_dma_vec()
> > > > =C2=A0=C2=A0=C2=A0 dmaengine: dma-axi-dmac: Implement
> > > > device_prep_slave_dma_vec
> > > > =C2=A0=C2=A0=C2=A0 iio: core: Add new DMABUF interface infrastructu=
re
> > > > =C2=A0=C2=A0=C2=A0 iio: buffer-dma: Enable support for DMABUFs
> > > > =C2=A0=C2=A0=C2=A0 iio: buffer-dmaengine: Support new DMABUF based =
userspace
> > > > API
> > > > =C2=A0=C2=A0=C2=A0 Documentation: iio: Document high-speed DMABUF b=
ased API
> > > >=20
> > > > =C2=A0=C2=A0 Documentation/iio/dmabuf_api.rst=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 54 +++
> > > > =C2=A0=C2=A0 Documentation/iio/index.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 2 +
> > > > =C2=A0=C2=A0 drivers/dma/dma-axi-dmac.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 40 ++
> > > > =C2=A0=C2=A0 drivers/iio/buffer/industrialio-buffer-dma.c=C2=A0 | 2=
42
> > > > ++++++++---
> > > > =C2=A0=C2=A0 .../buffer/industrialio-buffer-dmaengine.c=C2=A0=C2=A0=
=C2=A0 |=C2=A0 52 ++-
> > > > =C2=A0=C2=A0 drivers/iio/industrialio-buffer.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 402
> > > > ++++++++++++++++++
> > > > =C2=A0=C2=A0 include/linux/dmaengine.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 25 ++
> > > > =C2=A0=C2=A0 include/linux/iio/buffer-dma.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
33 +-
> > > > =C2=A0=C2=A0 include/linux/iio/buffer_impl.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 26 =
++
> > > > =C2=A0=C2=A0 include/uapi/linux/iio/buffer.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 22 =
+
> > > > =C2=A0=C2=A0 10 files changed, 836 insertions(+), 62 deletions(-)
> > > > =C2=A0=C2=A0 create mode 100644 Documentation/iio/dmabuf_api.rst
> > > >=20
> >=20


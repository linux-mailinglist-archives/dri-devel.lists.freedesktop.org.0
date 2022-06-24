Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 394235594D0
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 10:10:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 305F010F240;
	Fri, 24 Jun 2022 08:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AF6410E82D
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 08:10:51 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1o4eOr-0000PV-Tp; Fri, 24 Jun 2022 10:10:46 +0200
Message-ID: <2e87590102f9a1315ce0903705245a1e669234bd.camel@pengutronix.de>
Subject: Re: DMA-buf and uncached system memory
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Pekka
 Paalanen <ppaalanen@gmail.com>
Date: Fri, 24 Jun 2022 10:10:44 +0200
In-Reply-To: <a3d783b4-4d38-c5c1-12d1-80496c1138c0@amd.com>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
 <CAPj87rPYQNkgVEdHECQcHcYe2nCpgF3RYQKk_=wwhvJSxwHXCg@mail.gmail.com>
 <c6e65ee1-531e-d72c-a6a6-da7149e34f18@amd.com>
 <20220623101326.18beeab3@eldfell>
 <954d0a9b-29ef-52ef-f6ca-22d7e6aa3f4d@amd.com>
 <4b69f9f542d6efde2190b73c87096e87fa24d8ef.camel@pengutronix.de>
 <adc626ec-ff5a-5c06-44ce-09111be450cd@amd.com>
 <fbb228cd78e9bebd7e7921c19e0c4c09d0891f23.camel@pengutronix.de>
 <e691bccc-171d-f674-2817-13a945970f4a@amd.com>
 <95cca943bbfda6af07339fb8d2dc7f4da3aa0280.camel@pengutronix.de>
 <05814ddb-4f3e-99d8-025a-c31db7b2c46b@amd.com>
 <708e27755317a7650ca08ba2e4c14691ac0d6ba2.camel@pengutronix.de>
 <6287f5f8-d9af-e03d-a2c8-ea8ddcbdc0d8@amd.com>
 <f3c32cdd2ab4e76546c549b0cebba8e1d19d1cb0.camel@pengutronix.de>
 <34a1efd9-5447-848b-c08c-de75b48e997e@amd.com>
 <3c088a9a511762f7868b10dbe431942d3724917a.camel@pengutronix.de>
 <4ea37684-5dda-94e4-a544-74d3812e8d9d@amd.com>
 <0edd288595cb53768822c3d9dc18b8506e07a244.camel@pengutronix.de>
 <a3d783b4-4d38-c5c1-12d1-80496c1138c0@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: "Sharma, Shashank" <Shashank.Sharma@amd.com>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, linaro-mm-sig@lists.linaro.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Freitag, dem 24.06.2022 um 08:54 +0200 schrieb Christian König:
> Am 23.06.22 um 17:26 schrieb Lucas Stach:
> > Am Donnerstag, dem 23.06.2022 um 14:52 +0200 schrieb Christian König:
> > > Am 23.06.22 um 14:14 schrieb Lucas Stach:
> > > > Am Donnerstag, dem 23.06.2022 um 13:54 +0200 schrieb Christian König:
> > > > > Am 23.06.22 um 13:29 schrieb Lucas Stach:
> > > > > [SNIP]
> > > > > I mean I even had somebody from ARM which told me that this is not going
> > > > > to work with our GPUs on a specific SoC. That there are ARM internal use
> > > > > cases which just seem to work because all the devices are non-coherent
> > > > > is completely new to me.
> > > > > 
> > > > Yes, trying to hook up a peripheral that assumes cache snooping in some
> > > > design details to a non coherent SoC may end up exploding in various
> > > > ways. On the other hand you can work around most of those assumptions
> > > > by marking the memory as uncached to the CPU, which may tank
> > > > performance, but will work from a correctness PoV.
> > > Yeah, and exactly that's what I meant with "DMA-buf is not the framework
> > > for this".
> > > 
> > > See we do support using uncached/not snooped memory in DMA-buf, but only
> > > for the exporter side.
> > > 
> > > For example the AMD and Intel GPUs have a per buffer flag for this.
> > > 
> > > The importer on the other hand needs to be able to handle whatever the
> > > exporter provides.
> > > 
> > I fail to construct a case where you want the Vulkan/GL "no domain
> > transition" coherent semantic without the allocator knowing about this.
> > If you need this and the system is non-snooping, surely the allocator
> > will choose uncached memory.
> 
> No it won't. The allocator in the exporter is independent of the importer.
> 
> That is an important and intentional design decision, cause otherwise 
> you wouldn't have exporters/importers in the first place and rather a 
> centralized allocation pool like what dma-heap implements.
> 
> See the purpose of DMA-buf is to expose the buffers in the way the 
> exporter wants to expose them. So when the exporting driver wants to 
> allocate normal cached system memory then that is perfectly fine and 
> completely fits into this design.
> 
I'm specifically talking about the case where a snooping exporter would
allocate the GL coherent buffer and a non-snooping importer would need
to access that buffer with the same "no domain transition needed"
semantic. That is the thing which we can not make work at all and need
to fail the attach. If both the exporter and importer are non-snooping
you would probably get uncached memory, as long as the exporter knows
how the buffer will be used. Is there a real use-case where the
exporter doesn't know that the buffer will be used as GL/Vulkan
coherent and we can't do fallback on the importer side?

> Otherwise we would need to adjust all exporters to the importers, which 
> is potentially not even possible.
> 
> > I agree that you absolutely need to fail the usage when someone imports
> > a CPU cached buffer and then tries to use it as GL coherent on a non-
> > snooping system. That simply will not work.
> 
> Exactly that, yes. That's what the attach callback is good for.
> 
> See we already have tons of cases where buffers can't be shared because 
> they wasn't initially allocated in a way the importer can deal with 
> them. But that's perfectly ok and intentional.
> 
> For example just take a configuration where a dedicated GPU clones the 
> display with an integrated GPU. The dedicated GPU needs the image in 
> local memory for scanout which is usually not accessible to the 
> integrated GPU.
> 
> So either attaching the DMA-buf or creating the KMS framebuffer config 
> will fail and we are running into the fallback path which involves an 
> extra copy. And that is perfectly fine and intentional since this 
> configuration is not supported by the hardware.
> 
> > > > > [SNIP]
> > And here is where our line of thought diverges: the DMA API allows
> > snooping and non-snooping devices to work together just fine, as it has
> > explicit domain transitions, which are no-ops if both devices are
> > snooping, but will do the necessary cache maintenance when one of them
> > is non-snooping but the memory is CPU cached.
> > 
> > I don't see why DMA-buf should be any different here. Yes, you can not
> > support the "no domain transition" sharing when the memory is CPU
> > cached and one of the devices in non-snooping, but you can support 99%
> > of real use-cases like the non-snooped scanout or the UVC video import.
> 
> Well I didn't say we couldn't do it that way. What I'm saying that it 
> was intentionally decided against it.
> 
> We could re-iterate that decision, but this would mean that all existing 
> exporters would now need to provide additional functionality.
> 
The way I see it we would only need this for exporters that potentially
export CPU cached memory, but need to interop with non-snooping
importers. I guess that can be done on a case-by-case basis and
wouldn't be a big flag day operation.

> > > The importer on the other hand needs to be able to deal with that. When
> > > this is not the case then the importer somehow needs to work around that.
> > > 
> > Why? The importer maps the dma-buf via dma_buf_map_attachment, which in
> > most cases triggers a map via the DMA API on the exporter side. This
> > map via the DMA API will already do the right thing in terms of cache
> > management, it's just that we explicitly disable it via
> > DMA_ATTR_SKIP_CPU_SYNC in DRM because we know that the mapping will be
> > cached, which violates the DMA API explicit domain transition anyway.
> 
> Why doesn't the importer simply calls dma_sync_sg_for_device() as 
> necessary? See the importer does already know when it needs to access 
> the buffer and as far as I can see has all the necessary variable to do 
> the sync.
> 
First, it wouldn't be symmetric with the dma_buf_map_attachment, where
the actual dma_map_sg also happens on the exporter side.

Second, that is again a very x86 with PCI centric view. The importer
flushing CPU caches by calling dma_sync_sg_for_device will only suffice
in a world where devices are IO coherent, i.e. they snoop the CPU cache
but don't participate fully in the system coherency due to never
keeping dirty cache lines for buffers in system memory.

On fully coherent systems like ARM with AMBA CHI or x86 with CXL.cache
all devices with access to the buffer can keep dirty cache lines in
their device private caches, so any access from a non-snooping agent
will require a cache clean on all those devices, which would basically
require the the dma_buf_sync to be a broadcast operation to the
exporter and all attached fully coherent importers.

> The exporter on the other hand doesn't know that. So we would need to 
> transport this information.
> 
> Another fundamental problem is that the DMA API isn't designed for 
> device to device transitions. In other words you have CPU->device and 
> device->CPU transition, but not device->device. As far as I can see the 
> DMA API should already have the necessary information if things like 
> cache flushes are necessary or not.
> 
Don't you contradict the second part here with the first? The DMA API
doesn't have the necessary information about needed cache cleaning on
the exporters or other attached importers side, when you only call the
dma_sync on the importer, which is exactly why I'm arguing for putting
it in the dma_buf ops so we can do the necessary operations on other
attached clients to make a device->device transition working reliably.

> > > Either by flushing the CPU caches or by rejecting using the imported
> > > buffer for this specific use case (like AMD and Intel drivers should be
> > > doing).
> > > 
> > > If the Intel or ARM display drivers need non-cached memory and don't
> > > reject buffer where they don't know this then that's certainly a bug in
> > > those drivers.
> > It's not just display drivers, video codec accelerators and most GPUs
> > in this space are also non-snooping. In the ARM SoC world everyone just
> > assumes you are non-snooping, which is why things work for most cases
> > and only a handful like the UVC video import is broken.
> 
> That is really interesting to know, but I still think that DMA-buf was 
> absolutely not designed for this use case.
> 
>  From the point of view the primary reason for this was laptops with 
> both dedicated and integrated GPUs, webcams etc...
> 
> That you have a huge number of ARM specific devices which can interop 
> with themselves, but not with devices outside of their domain is not 
> something foreseen here.
> 
Our recollection of history might differ here, but as Daniel remarked
kind of snarkily, most of the initial contributors to dma-buf were from
Linaro and TI, both of which were focused on getting device interop
working on ARM devices, which at the time were overwhelmingly non-
snooping. So I kind of doubt that dma-buf wasn't designed for this use-
case.

Regards,
Lucas


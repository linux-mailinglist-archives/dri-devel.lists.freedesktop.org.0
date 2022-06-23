Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7858D557E8D
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 17:26:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE8A310E49B;
	Thu, 23 Jun 2022 15:26:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE1E10E471
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 15:26:13 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1o4Oic-00078y-6V; Thu, 23 Jun 2022 17:26:06 +0200
Message-ID: <0edd288595cb53768822c3d9dc18b8506e07a244.camel@pengutronix.de>
Subject: Re: DMA-buf and uncached system memory
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Pekka
 Paalanen <ppaalanen@gmail.com>
Date: Thu, 23 Jun 2022 17:26:04 +0200
In-Reply-To: <4ea37684-5dda-94e4-a544-74d3812e8d9d@amd.com>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
 <YCuPhOT4GhY3RR/6@phenom.ffwll.local>
 <9178e19f5c0e141772b61b759abaa0d176f902b6.camel@ndufresne.ca>
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

Am Donnerstag, dem 23.06.2022 um 14:52 +0200 schrieb Christian König:
> Am 23.06.22 um 14:14 schrieb Lucas Stach:
> > Am Donnerstag, dem 23.06.2022 um 13:54 +0200 schrieb Christian König:
> > > Am 23.06.22 um 13:29 schrieb Lucas Stach:
> > > [SNIP]
> > > I mean I even had somebody from ARM which told me that this is not going
> > > to work with our GPUs on a specific SoC. That there are ARM internal use
> > > cases which just seem to work because all the devices are non-coherent
> > > is completely new to me.
> > > 
> > Yes, trying to hook up a peripheral that assumes cache snooping in some
> > design details to a non coherent SoC may end up exploding in various
> > ways. On the other hand you can work around most of those assumptions
> > by marking the memory as uncached to the CPU, which may tank
> > performance, but will work from a correctness PoV.
> 
> Yeah, and exactly that's what I meant with "DMA-buf is not the framework 
> for this".
> 
> See we do support using uncached/not snooped memory in DMA-buf, but only 
> for the exporter side.
> 
> For example the AMD and Intel GPUs have a per buffer flag for this.
> 
> The importer on the other hand needs to be able to handle whatever the 
> exporter provides.
> 
I fail to construct a case where you want the Vulkan/GL "no domain
transition" coherent semantic without the allocator knowing about this.
If you need this and the system is non-snooping, surely the allocator
will choose uncached memory.

I agree that you absolutely need to fail the usage when someone imports
a CPU cached buffer and then tries to use it as GL coherent on a non-
snooping system. That simply will not work.

> > > [SNIP]
> > > > Non coherent access, including your non-snoop scanout, and no domain
> > > > transition signal just doesn't go together when you want to solve
> > > > things in a generic way.
> > > Yeah, that's the stuff I totally agree on.
> > > 
> > > See we absolutely do have the requirement of implementing coherent
> > > access without domain transitions for Vulkan and OpenGL+extensions.
> > > 
> > Coherent can mean 2 different things:
> > 1. CPU cached with snooping from the IO device
> > 2. CPU uncached
> > 
> > The Vulkan and GL "coherent" uses are really coherent without explicit
> > domain transitions, so on non coherent arches that require the
> > transitions the only way to implement this is by making the memory CPU
> > uncached. Which from a performance PoV will probably not be what app
> > developers expect, but will still expose the correct behavior.
> 
> Quite a boomer for performance, but yes that should work.
> 
> > > > Remember that in a fully (not only IO) coherent system the CPU isn't
> > > > the only agent that may cache the content you are trying to access
> > > > here. The dirty cacheline could reasonably still be sitting in a GPU or
> > > > VPU cache, so you need some way to clean those cachelines, which isn't
> > > > a magic "importer knows how to call CPU cache clean instructions".
> > > IIRC we do already have/had a SYNC_IOCTL for cases like this, but (I
> > > need to double check as well, that's way to long ago) this was kicked
> > > out because of the requirements above.
> > > 
> > The DMA_BUF_IOCTL_SYNC is available in upstream, with the explicit
> > documentation that "userspace can not rely on coherent access".
> 
> Yeah, double checked that as well. This is for the coherency case on the 
> exporter side.
> 
> > > > > You can of course use DMA-buf in an incoherent environment, but then you
> > > > > can't expect that this works all the time.
> > > > > 
> > > > > This is documented behavior and so far we have bluntly rejected any of
> > > > > the complains that it doesn't work on most ARM SoCs and I don't really
> > > > > see a way to do this differently.
> > > > Can you point me to that part of the documentation? A quick grep for
> > > > "coherent" didn't immediately turn something up within the DMA-buf
> > > > dirs.
> > > Search for "cache coherency management". It's quite a while ago, but I
> > > do remember helping to review that stuff.
> > > 
> > That only turns up the lines in DMA_BUF_IOCTL_SYNC doc, which are
> > saying the exact opposite of the DMA-buf is always coherent.
> 
> Sounds like I'm not making clear what I want to say here: For the 
> exporter using cache coherent memory is optional, for the importer it isn't.
> 
> For the exporter it is perfectly valid to use kmalloc, get_free_page 
> etc... on his buffers as long as it uses the DMA API to give the 
> importer access to it.
> 
And here is where our line of thought diverges: the DMA API allows
snooping and non-snooping devices to work together just fine, as it has
explicit domain transitions, which are no-ops if both devices are
snooping, but will do the necessary cache maintenance when one of them
is non-snooping but the memory is CPU cached.

I don't see why DMA-buf should be any different here. Yes, you can not
support the "no domain transition" sharing when the memory is CPU
cached and one of the devices in non-snooping, but you can support 99%
of real use-cases like the non-snooped scanout or the UVC video import.

> The importer on the other hand needs to be able to deal with that. When 
> this is not the case then the importer somehow needs to work around that.
> 
Why? The importer maps the dma-buf via dma_buf_map_attachment, which in
most cases triggers a map via the DMA API on the exporter side. This
map via the DMA API will already do the right thing in terms of cache
management, it's just that we explicitly disable it via
DMA_ATTR_SKIP_CPU_SYNC in DRM because we know that the mapping will be
cached, which violates the DMA API explicit domain transition anyway.

> Either by flushing the CPU caches or by rejecting using the imported 
> buffer for this specific use case (like AMD and Intel drivers should be 
> doing).
> 
> If the Intel or ARM display drivers need non-cached memory and don't 
> reject buffer where they don't know this then that's certainly a bug in 
> those drivers.

It's not just display drivers, video codec accelerators and most GPUs
in this space are also non-snooping. In the ARM SoC world everyone just
assumes you are non-snooping, which is why things work for most cases
and only a handful like the UVC video import is broken.
> 
> Otherwise we would need to change all DMA-buf exporters to use a special 
> function for allocation non-coherent memory and that is certainly not 
> going to fly.
> 
> > I also don't see why you think that both world views are so totally
> > different. We could just require explicit domain transitions for non-
> > snoop access, which would probably solve your scanout issue and would
> > not be a problem for most ARM systems, where we could no-op this if the
> > buffer is already in uncached memory and at the same time keep the "x86
> > assumes cached + snooped access by default" semantics.
> 
> Well the key point is we intentionally rejected that design previously 
> because it created all kind of trouble as well.
> 
I would really like to know what issues popped up there. Moving the
dma-buf attachment to work more like a buffer used with the DMA API
seems like a good thing to me.

> For this limited use case of doing a domain transition right before 
> scanout it might make sense, but that's just one use case.
> 
The only case I see that we still couldn't support with a change in
that direction is the GL coherent access to a imported buffer that has
been allocated from CPU cached memory on a system with non-snooping
agents. Which to me sounds like a pretty niche use-case, but I would be
happy to be proven wrong.

Regards,
Lucas


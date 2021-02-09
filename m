Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9593144D6
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 01:25:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DFBC6EA42;
	Tue,  9 Feb 2021 00:25:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A2CD6EA42
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 00:25:08 +0000 (UTC)
IronPort-SDR: caGvwalQNw/FDqnBhnefXGBASCExdpqhKOPWkJhcUtozGX/u4mjFaLMb9cNpiA8bri4oit8tmk
 n+HZx5ppZ22Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="160958097"
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="160958097"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 16:25:07 -0800
IronPort-SDR: 8cXSzg6B06Zwof+mHWXy6smKkPSQ+JKRoAEUvaZZxmOIT96pmjvWFFeEffAGf1gRiT1gIId+KE
 4eXyAgtKGpJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="585866831"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga005.fm.intel.com with ESMTP; 08 Feb 2021 16:25:07 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 8 Feb 2021 16:25:06 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 8 Feb 2021 16:25:06 -0800
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2106.002;
 Mon, 8 Feb 2021 16:25:06 -0800
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [RFC v3 2/3] virtio: Introduce Vdmabuf driver
Thread-Topic: [RFC v3 2/3] virtio: Introduce Vdmabuf driver
Thread-Index: AQHW+gCTpvRVWdGfdEuO7KEMCe95EKpKQvKAgAQvVwCAABxAAIAAXFfg
Date: Tue, 9 Feb 2021 00:25:06 +0000
Message-ID: <8ba4ad64be3546bda9a2ed2129bf98e4@intel.com>
References: <20210203073517.1908882-1-vivek.kasireddy@intel.com>
 <20210203073517.1908882-3-vivek.kasireddy@intel.com>
 <YB1sRx1GrT8rATEg@phenom.ffwll.local>
 <20210208075748.xejgcb4il2egow2u@sirius.home.kraxel.org>
 <YCEGrrT0/eqqz/ok@phenom.ffwll.local>
In-Reply-To: <YCEGrrT0/eqqz/ok@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.22.254.132]
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, "Vetter, 
 Daniel" <daniel.vetter@intel.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Gerd, Daniel,

> -----Original Message-----
> From: Daniel Vetter <daniel@ffwll.ch>
> Sent: Monday, February 08, 2021 1:39 AM
> To: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>; Kasireddy, Vivek <vivek.kasireddy@intel.com>;
> virtualization@lists.linux-foundation.org; dri-devel@lists.freedesktop.org; Vetter, Daniel
> <daniel.vetter@intel.com>; daniel.vetter@ffwll.ch; Kim, Dongwon
> <dongwon.kim@intel.com>; sumit.semwal@linaro.org; christian.koenig@amd.com;
> linux-media@vger.kernel.org
> Subject: Re: [RFC v3 2/3] virtio: Introduce Vdmabuf driver
> 
> On Mon, Feb 08, 2021 at 08:57:48AM +0100, Gerd Hoffmann wrote:
> >   Hi,
> >
> > > > +/* extract pages referenced by sgt */ static struct page
> > > > +**extr_pgs(struct sg_table *sgt, int *nents, int *last_len)
> > >
> > > Nack, this doesn't work on dma-buf. And it'll blow up at runtime
> > > when you enable the very recently merged CONFIG_DMABUF_DEBUG (would
> > > be good to test with that, just to make sure).
[Kasireddy, Vivek] Although, I have not tested it yet but it looks like this will
throw a wrench in our solution as we use sg_next to iterate over all the struct page *
and get their PFNs. I wonder if there is any other clean way to get the PFNs of all 
the pages associated with a dmabuf.

> >
> > > Aside from this, for virtio/kvm use-cases we've already merged the
> > > udmabuf driver. Does this not work for your usecase?
> >
> > udmabuf can be used on the host side to make a collection of guest
> > pages available as host dmabuf.  It's part of the puzzle, but not a
> > complete solution.
> >
> > As I understand it the intended workflow is this:
> >
> >   (1) guest gpu driver exports some object as dma-buf
> >   (2) dma-buf is imported into this new driver.
> >   (3) driver sends the pages to the host.
> >   (4) hypervisor uses udmabuf to create a host dma-buf.
> >   (5) host dma-buf is passed on.
> >
> > And step (3) is the problematic one as this will not work in case the
> > dma-buf doesn't live in guest ram but in -- for example -- gpu device
> > memory.
> 
> Yup, vram or similar special ram is the reason why an importer can't look at the pages
> behind a dma-buf sg table.
[Kasireddy, Vivek] To exclude such cases, would it not be OK to limit the scope 
of this solution (Vdmabuf) to make it clear that the dma-buf has to live in Guest RAM?
Or, are there any ways to pin the dma-buf pages in Guest RAM to make this
solution work?

> 
> > Reversing the driver roles in the guest (virtio driver allocates pages
> > and exports the dma-buf to the guest gpu driver) should work fine.
> 
> Yup, this needs to flow the other way round than in these patches.
[Kasireddy, Vivek] That might work but I am afraid it means making invasive changes
to the Guest GPU driver (i915 in our case) which we are trying to avoid to
keep this solution more generic.

> 
> > Which btw is something you can do today with virtio-gpu.
> > Maybe it makes sense to have the option to run virtio-gpu in
> > render-only mode for that use case.
> 
> Yeah that sounds like a useful addition.
> 
> Also, the same flow should work for real gpus passed through as pci devices. What we
> need is some way to surface the dma-buf on the guest side, which I think doesn't exist yet
> stand-alone. But this role could be fulfilled by virtio-gpu in render-only mode I think. And
> (assuming I've understood the recent discussions around virtio dma-buf sharing using
> virtio ids) this would give you some neat zero-copy tricks for free if you share multiple
> devices.
> 
> Also if you really want seamless buffer sharing between devices that are passed to the
> guest and devices on the host side (like displays I guess?
> or maybe video encode if this is for cloug gaming?), then using virtio-gpu in render mode
> should also allow you to pass the dma_fence back&forth.
> Which we'll need too, not just the dma-buf.
> 
> So at a first guess I'd say "render-only virtio-gpu mode" sounds like something rather
> useful. But I might be totally off here.
[Kasireddy, Vivek] Let me present more details about the use-case we are trying to solve;
Sorry for the crude graphic below:

Guest:						Host:
+-----------+					+----------------+
|   Weston  |					|    Qemu UI	|
|(Headless)|					|		|
+-----------+					+-^--------------+
         |  (1. Export prime fd	  (3.Share UUID |	       |  (4. Qemu calls Import using this UUID and a gets a new Dmabuf
         |   of scanout buffer)	     with Qemu)   |	       |   fd that is used with EGL_LINUX_DMA_BUF_EXT)
+-----v-------------+				+------------v-----+
|Virtio-Vdmabuf  |------------------------------->|Vhost-Vdmabuf|
|                            | (2.Generate & share UUID|	                |
+--------------------+ and PFNs for this buffer) +------------------+

Here is a link to the Weston Headless backend that we tested:
https://github.com/vivekkreddy/Intel-Distribution-of-Weston/blob/vdmabuf/libweston/backend-headless/headless.c#L287
And, here is the link to the Qemu part:
https://lists.nongnu.org/archive/html/qemu-devel/2021-02/msg02976.html

IIUC, Virtio GPU is used to present a virtual GPU to the Guest and all the rendering 
commands are captured and forwarded to the Host GPU via Virtio. However, in our
use-case, we are passthrough'ing a real GPU (claimed by i915 running in the Guest)
that is Headless; hence, we need to use Weston with the headless backend. The 
rendering in the Guest is accomplished via the unmodified native stack that includes 
Iris and i915. Therefore, it would not be efficient to use virtio-gpu for rendering or
for any other purpose in the Guest given that we could use the native stack which
is definitely faster. 

We really want to make this solution GPU driver (Host and Guest) agnostic and for
that reason it would need to rely on Dmabuf interfaces/APIs and preferrably avoid
making modifications to the native DRM drivers.

Thanks,
Vivek

> 
> Cheers, Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

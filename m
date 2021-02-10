Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2581D315E4D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 05:47:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 348436E156;
	Wed, 10 Feb 2021 04:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F07406E156
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 04:47:38 +0000 (UTC)
IronPort-SDR: boGBhMzD0PT1afsVEt9SiTkwXgOXUhPLp8I8ZKY2iiJHBTCkG9F/pUQX8WtO6xH55rmd1LOrVE
 tgP8lRdYw0vg==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="182077911"
X-IronPort-AV: E=Sophos;i="5.81,167,1610438400"; d="scan'208";a="182077911"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 20:47:38 -0800
IronPort-SDR: 8EC8R07VArU+UoK5+habZ6og9xLT3HySHjD+4ostF+kznOsPB6hf5vjVM/Qp88JpYTG6GYi2Dz
 +8fORKQQ+f4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,167,1610438400"; d="scan'208";a="361167002"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga007.fm.intel.com with ESMTP; 09 Feb 2021 20:47:37 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 9 Feb 2021 20:47:37 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 9 Feb 2021 20:47:36 -0800
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2106.002;
 Tue, 9 Feb 2021 20:47:36 -0800
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [RFC v3 2/3] virtio: Introduce Vdmabuf driver
Thread-Topic: [RFC v3 2/3] virtio: Introduce Vdmabuf driver
Thread-Index: AQHW+gCTpvRVWdGfdEuO7KEMCe95EKpKQvKAgAQvVwCAABxAAIAAXFfggAEm5oCAAH4bcA==
Date: Wed, 10 Feb 2021 04:47:36 +0000
Message-ID: <2ef01dc941684a15a4f30e6239ae42df@intel.com>
References: <20210203073517.1908882-1-vivek.kasireddy@intel.com>
 <20210203073517.1908882-3-vivek.kasireddy@intel.com>
 <YB1sRx1GrT8rATEg@phenom.ffwll.local>
 <20210208075748.xejgcb4il2egow2u@sirius.home.kraxel.org>
 <YCEGrrT0/eqqz/ok@phenom.ffwll.local>
 <8ba4ad64be3546bda9a2ed2129bf98e4@intel.com>
 <20210209084453.5oqepy7zdwtxgrpu@sirius.home.kraxel.org>
In-Reply-To: <20210209084453.5oqepy7zdwtxgrpu@sirius.home.kraxel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.1.200.100]
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

Hi Gerd,

> -----Original Message-----
> From: Gerd Hoffmann <kraxel@redhat.com>
> Sent: Tuesday, February 09, 2021 12:45 AM
> To: Kasireddy, Vivek <vivek.kasireddy@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>; virtualization@lists.linux-foundation.org; dri-
> devel@lists.freedesktop.org; Vetter, Daniel <daniel.vetter@intel.com>;
> daniel.vetter@ffwll.ch; Kim, Dongwon <dongwon.kim@intel.com>;
> sumit.semwal@linaro.org; christian.koenig@amd.com; linux-media@vger.kernel.org
> Subject: Re: [RFC v3 2/3] virtio: Introduce Vdmabuf driver
> 
>   Hi,
> 
> > > > > Nack, this doesn't work on dma-buf. And it'll blow up at runtime
> > > > > when you enable the very recently merged CONFIG_DMABUF_DEBUG (would
> > > > > be good to test with that, just to make sure).
> > [Kasireddy, Vivek] Although, I have not tested it yet but it looks like this will
> > throw a wrench in our solution as we use sg_next to iterate over all the struct page *
> > and get their PFNs. I wonder if there is any other clean way to get the PFNs of all
> > the pages associated with a dmabuf.
> 
> Well, there is no guarantee that dma-buf backing storage actually has
> struct page ...
[Kasireddy, Vivek] What if I do mmap() on the fd followed by mlock() or mmap()
followed by get_user_pages()? If it still fails, would ioremapping the device memory
and poking at the backing storage be an option? Or, if I bind the passthrough'd GPU device
to vfio-pci and tap into the memory region associated with the device memory, can it be
made to work? 

And, I noticed that for PFNs that do not have valid struct page associated with it, KVM
does a memremap() to access/map them. Is this an option?

> 
> > [Kasireddy, Vivek] To exclude such cases, would it not be OK to limit the scope
> > of this solution (Vdmabuf) to make it clear that the dma-buf has to live in Guest RAM?
> > Or, are there any ways to pin the dma-buf pages in Guest RAM to make this
> > solution work?
> 
> At that point it becomes (i915) driver-specific.  If you go that route
> it doesn't look that useful to use dma-bufs in the first place ...
[Kasireddy, Vivek] I prefer not to make this driver specific if possible.

> 
> > IIUC, Virtio GPU is used to present a virtual GPU to the Guest and all the rendering
> > commands are captured and forwarded to the Host GPU via Virtio.
> 
> You don't have to use the rendering pipeline.  You can let the i915 gpu
> render into a dma-buf shared with virtio-gpu, then use virtio-gpu only for
> buffer sharing with the host.
[Kasireddy, Vivek] Is this the most viable path forward? I am not sure how complex or 
feasible it would be but I'll look into it.
Also, not using the rendering capabilities of virtio-gpu and turning it into a sharing only
device means there would be a giant mode switch with a lot of if() conditions sprinkled
across. Are you OK with that?

Thanks,
Vivek
> 
> take care,
>   Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

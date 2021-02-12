Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B03319B48
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 09:36:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FED6E544;
	Fri, 12 Feb 2021 08:36:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE7C36E544
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Feb 2021 08:36:46 +0000 (UTC)
IronPort-SDR: aaDmxSAzIlJFVnI9Ks/tXqO4aTYFzD/ExnUMSwzih8rtylpNu/ni/X82Y6UAiLRrWiFUHXQsbE
 1MT22G2z7TOw==
X-IronPort-AV: E=McAfee;i="6000,8403,9892"; a="246446439"
X-IronPort-AV: E=Sophos;i="5.81,173,1610438400"; d="scan'208";a="246446439"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2021 00:36:46 -0800
IronPort-SDR: QUomUn6GF7IRl2CrcExR/qIj5JqxA0On8b8Z5x0sj+79oToDKfk7epDr3YDf0XgUktQ4MaLR1K
 mjToj06XNF1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,173,1610438400"; d="scan'208";a="490835235"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 12 Feb 2021 00:36:45 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 12 Feb 2021 00:36:45 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 12 Feb 2021 00:36:44 -0800
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2106.002;
 Fri, 12 Feb 2021 00:36:44 -0800
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Gerd
 Hoffmann" <kraxel@redhat.com>
Subject: RE: [RFC v3 2/3] virtio: Introduce Vdmabuf driver
Thread-Topic: [RFC v3 2/3] virtio: Introduce Vdmabuf driver
Thread-Index: AQHW+gCTpvRVWdGfdEuO7KEMCe95EKpKQvKAgAQvVwCAABxAAIAAXFfggAEm5oCAAH4bcIABCTWAgAKhj6A=
Date: Fri, 12 Feb 2021 08:36:44 +0000
Message-ID: <fd23d4d08ea84ca3b8a7610a8fb866d5@intel.com>
References: <20210203073517.1908882-1-vivek.kasireddy@intel.com>
 <20210203073517.1908882-3-vivek.kasireddy@intel.com>
 <YB1sRx1GrT8rATEg@phenom.ffwll.local>
 <20210208075748.xejgcb4il2egow2u@sirius.home.kraxel.org>
 <YCEGrrT0/eqqz/ok@phenom.ffwll.local>
 <8ba4ad64be3546bda9a2ed2129bf98e4@intel.com>
 <20210209084453.5oqepy7zdwtxgrpu@sirius.home.kraxel.org>
 <2ef01dc941684a15a4f30e6239ae42df@intel.com>
 <8ac10b1d-3d64-4e39-42e6-6c65b61f0794@amd.com>
In-Reply-To: <8ac10b1d-3d64-4e39-42e6-6c65b61f0794@amd.com>
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

Hi Christian,

> 
> Hi Vivek,
> 
> > [Kasireddy, Vivek] What if I do mmap() on the fd followed by mlock()
> > or mmap() followed by get_user_pages()? If it still fails, would
> > ioremapping the device memory and poking at the backing storage be an
> > option? Or, if I bind the passthrough'd GPU device to vfio-pci and tap
> > into the memory region associated with the device memory, can it be made to work?
> 
> get_user_pages() is not allowed on mmaped DMA-bufs in the first place.
> 
> Daniel is currently adding code to make sure that this is never ever used.
> 
> > And, I noticed that for PFNs that do not have valid struct page
> > associated with it, KVM does a memremap() to access/map them. Is this an option?
> 
> No, even for system memory which has a valid struct page touching it when it is part of a
> DMA-buf is illegal since the reference count and mapping fields in struct page might be
> used for something different.
> 
> Keep in mind that struct page is a heavily overloaded structure for different use cases. You
> can't just use it for a different use case than what the owner of the page has intended it.
[Kasireddy, Vivek] What is your recommended/acceptable way for doing what I am trying to 
do?

Thanks,
Vivek

> 
> Regards,
> Christian.
> 
> >
> >
> > Thanks,
> > Vivek
> >> take care,
> >>    Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

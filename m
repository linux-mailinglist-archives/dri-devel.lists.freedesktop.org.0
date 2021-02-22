Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EB4321251
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 09:52:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5AA6E90E;
	Mon, 22 Feb 2021 08:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77CAE6E90E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 08:52:39 +0000 (UTC)
IronPort-SDR: 7wVgNrEHo+S5TM6kaf6Rcs5jUW1elvOvdTobIrprl2amojK81veyg7UnToW36tlvH4dvlsNiwF
 p0G+UbUiN7wA==
X-IronPort-AV: E=McAfee;i="6000,8403,9902"; a="184436412"
X-IronPort-AV: E=Sophos;i="5.81,196,1610438400"; d="scan'208";a="184436412"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2021 00:52:38 -0800
IronPort-SDR: 0twkZkBUwsao/I/fnAmgvSnMGMYP0oORkdCThigG63zVCwlMhUsz3n8Znp4NAPKkeSWhrtpPYb
 yDc+GImtn6+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,196,1610438400"; d="scan'208";a="366085233"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga006.jf.intel.com with ESMTP; 22 Feb 2021 00:52:38 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 22 Feb 2021 00:52:37 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 22 Feb 2021 00:52:37 -0800
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2106.002;
 Mon, 22 Feb 2021 00:52:37 -0800
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [RFC v3 2/3] virtio: Introduce Vdmabuf driver
Thread-Topic: [RFC v3 2/3] virtio: Introduce Vdmabuf driver
Thread-Index: AQHW+gCTpvRVWdGfdEuO7KEMCe95EKpKQvKAgAQvVwCAABxAAIAAXFfggAEm5oCAAH4bcIABHRyAgAJ/T4CAAMKwAIAPAfWQ
Date: Mon, 22 Feb 2021 08:52:37 +0000
Message-ID: <ace6db071cdf4cb89c4155006b19792d@intel.com>
References: <20210203073517.1908882-1-vivek.kasireddy@intel.com>
 <20210203073517.1908882-3-vivek.kasireddy@intel.com>
 <YB1sRx1GrT8rATEg@phenom.ffwll.local>
 <20210208075748.xejgcb4il2egow2u@sirius.home.kraxel.org>
 <YCEGrrT0/eqqz/ok@phenom.ffwll.local>
 <8ba4ad64be3546bda9a2ed2129bf98e4@intel.com>
 <20210209084453.5oqepy7zdwtxgrpu@sirius.home.kraxel.org>
 <2ef01dc941684a15a4f30e6239ae42df@intel.com>
 <20210210091641.ahjtgcdalw7viuei@sirius.home.kraxel.org>
 <bad576177eb24085a73570e8ad03d2cc@intel.com>
 <20210212110140.gdpu7kapnr7ovdcn@sirius.home.kraxel.org>
In-Reply-To: <20210212110140.gdpu7kapnr7ovdcn@sirius.home.kraxel.org>
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

Hi Gerd,

> 
> On Fri, Feb 12, 2021 at 08:15:12AM +0000, Kasireddy, Vivek wrote:
> > Hi Gerd,
> > [Kasireddy, Vivek] Just to confirm my understanding of what you are
> > suggesting, are you saying that we need to either have Weston allocate
> > scanout buffers (GBM surface/BO) using virtio-gpu and render into them
> > using i915; or have virtio-gpu allocate pages and export a dma-buf and
> > have Weston create a GBM BO by calling gbm_bo_import(fd) and render into the BO
> using i915?
> 
> Not sure what the difference between the former and the latter is.
[Kasireddy, Vivek] Oh, what I meant is whether you were suggesting that we 
create a GBM device and create a GBM surface and BOs using this device or
just create a raw/dumb GEM object and create a GBM BO by importing it. As
we just discovered, the former means we have to initialize virgl which complicates
things so we went with the latter.

> 
> > [Kasireddy, Vivek] We are only interested in Qemu UI at the moment but
> > if we were to use virtio-gpu, we are going to need to add one more vq
> > and support for managing buffers, events, etc.
> 
> Should be easy and it should not need any virtio-gpu driver changes.
[Kasireddy, Vivek] Vdmabuf v4, that implements your suggestion -- to have
Vdmabuf allocate pages --  is posted here:
https://lists.freedesktop.org/archives/dri-devel/2021-February/297841.html
and tested it with Weston Headless and Qemu:
https://gitlab.freedesktop.org/Vivek/weston/-/blob/vdmabuf/libweston/backend-headless/headless.c#L522
https://lists.nongnu.org/archive/html/qemu-devel/2021-02/msg02976.html

Having said that, after discussing with Daniel Vetter, we are now switching our
focus to virtio-gpu to compare and contrast both solutions. 

> 
> You can use virtio-gpu like a dumb scanout device.  Create a dumb bo, create a
> framebuffer for the bo, map the framebuffer to the crtc.
> 
> Then export the bo, import into i915, use it as render target.  When rendering is done flush
> (DRM_IOCTL_MODE_DIRTYFB).  Alternatively allocate multiple bo's + framebuffers
> and pageflip.
[Kasireddy, Vivek] Since we are testing with Weston, we are looking at pageflips (4 color
buffers). And, this part so far seems to work where virtio-gpu is used for kms (max_outputs=1)
and Iris/i915 is used for rendering. We are currently glueing virtio-gpu and i915 in Weston but
eventually the plan is to glue them (virgl/virtio-gpu and Iris) in Mesa if possible using KMSRO
(KMS render only) to avoid having to change Weston or X or other user-space components.

> 
> Pretty standard workflow for cases where rendering and scanout are handled by different
> devices.  As far I know not uncommon in the arm world.
> 
> Right now this will involve a memcpy() for any display update because qemu is a bit
> behind on supporting recent virtio-gpu features.
[Kasireddy, Vivek] IIUC, I think you are referring to creating the Pixman image in set_scanout.
What additional features need to be implemented or what is your recommendation in terms of
what needs to be done to turn the memcpy() into a dma-buf? Also, how should we ensure that
access to the guest fb/dmabuf is synchronized to ensure that the Guest and the Host do not access
the backing storage of the dmabuf at the same time?

Thanks,
Vivek

> 
> take care,
>   Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

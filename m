Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27ECA319B0B
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 09:15:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A356E52F;
	Fri, 12 Feb 2021 08:15:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD9826E52F
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Feb 2021 08:15:15 +0000 (UTC)
IronPort-SDR: 9D15rMUteMwSeWzclZv9ac4Oy8lQMRKoHKTsnqd8Pvtc4LHhl4JkZZnP4EpIDD1DElbqFcvEhO
 cULA/qCmnlhw==
X-IronPort-AV: E=McAfee;i="6000,8403,9892"; a="162137210"
X-IronPort-AV: E=Sophos;i="5.81,173,1610438400"; d="scan'208";a="162137210"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2021 00:15:14 -0800
IronPort-SDR: FZHRZjqH+kTqIdMXXK2PFg7ilnH+URbu5ff2N6QHIBSgFsSFDHbgCoaDH1rkO+ypE/MVZz9EcL
 /kaI4IuOpLwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,173,1610438400"; d="scan'208";a="511233670"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 12 Feb 2021 00:15:13 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 12 Feb 2021 00:15:13 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 12 Feb 2021 00:15:12 -0800
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2106.002;
 Fri, 12 Feb 2021 00:15:12 -0800
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [RFC v3 2/3] virtio: Introduce Vdmabuf driver
Thread-Topic: [RFC v3 2/3] virtio: Introduce Vdmabuf driver
Thread-Index: AQHW+gCTpvRVWdGfdEuO7KEMCe95EKpKQvKAgAQvVwCAABxAAIAAXFfggAEm5oCAAH4bcIABHRyAgAJ/T4A=
Date: Fri, 12 Feb 2021 08:15:12 +0000
Message-ID: <bad576177eb24085a73570e8ad03d2cc@intel.com>
References: <20210203073517.1908882-1-vivek.kasireddy@intel.com>
 <20210203073517.1908882-3-vivek.kasireddy@intel.com>
 <YB1sRx1GrT8rATEg@phenom.ffwll.local>
 <20210208075748.xejgcb4il2egow2u@sirius.home.kraxel.org>
 <YCEGrrT0/eqqz/ok@phenom.ffwll.local>
 <8ba4ad64be3546bda9a2ed2129bf98e4@intel.com>
 <20210209084453.5oqepy7zdwtxgrpu@sirius.home.kraxel.org>
 <2ef01dc941684a15a4f30e6239ae42df@intel.com>
 <20210210091641.ahjtgcdalw7viuei@sirius.home.kraxel.org>
In-Reply-To: <20210210091641.ahjtgcdalw7viuei@sirius.home.kraxel.org>
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

> > > You don't have to use the rendering pipeline.  You can let the i915
> > > gpu render into a dma-buf shared with virtio-gpu, then use
> > > virtio-gpu only for buffer sharing with the host.
[Kasireddy, Vivek] Just to confirm my understanding of what you are suggesting, are
you saying that we need to either have Weston allocate scanout buffers (GBM surface/BO)
using virtio-gpu and render into them using i915; or have virtio-gpu allocate pages and 
export a dma-buf and have Weston create a GBM BO by calling gbm_bo_import(fd) and
render into the BO using i915?

> Hmm, why a big mode switch?  You should be able to do that without modifying the
> virtio-gpu guest driver.  On the host side qemu needs some work to support the most
> recent virtio-gpu features like the buffer uuids (assuming you use qemu userspace), right
> now those are only supported by crosvm.
[Kasireddy, Vivek] We are only interested in Qemu UI at the moment but if we were to use
virtio-gpu, we are going to need to add one more vq and support for managing buffers, 
events, etc.

Thanks,
Vivek

> 
> It might be useful to add support for display-less virtio-gpu, i.e.
> "qemu -device virtio-gpu-pci,max_outputs=0".  Right now the linux driver throws an error
> in case no output (crtc) is present.  Should be fixable without too much effort though,
> effectively the sanity check would have to be moved from driver initialization to
> commands like SET_SCANOUT which manage the outputs.
> 
> take care,
>   Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

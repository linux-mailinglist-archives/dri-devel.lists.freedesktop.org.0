Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62448319C6B
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 11:14:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F6EF6E578;
	Fri, 12 Feb 2021 10:14:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B9C6E588
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Feb 2021 10:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613124880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hQ4s2GKq0YTzgoAQssPGg5wIJASO0/s1pAuGBl1EvYw=;
 b=FsKw44aeNZkaiaZt/ss6LD5YyC8ndbiRUjUzOpW/Jspu3rulyYTALhh+E1BDJGN/S+DF/y
 2KYEAVoAb/9YzW7x58j4IxWQ7Wpp43C2HgZ/jQ0geVVdHztpdTzB17pox9k6ldfut1SYiF
 YHeJB9weMOK/QFLl76d96FUj00QUHlY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-lK_x5n1dMNiEVwnPBr3ZVg-1; Fri, 12 Feb 2021 05:14:38 -0500
X-MC-Unique: lK_x5n1dMNiEVwnPBr3ZVg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D072801962;
 Fri, 12 Feb 2021 10:14:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-161.ams2.redhat.com
 [10.36.112.161])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E423A10016F9;
 Fri, 12 Feb 2021 10:14:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B8A5418003AF; Fri, 12 Feb 2021 11:14:33 +0100 (CET)
Date: Fri, 12 Feb 2021 11:14:33 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [RFC v3 2/3] virtio: Introduce Vdmabuf driver
Message-ID: <20210212101433.prcjjktmhqyjasnj@sirius.home.kraxel.org>
References: <20210203073517.1908882-3-vivek.kasireddy@intel.com>
 <YB1sRx1GrT8rATEg@phenom.ffwll.local>
 <20210208075748.xejgcb4il2egow2u@sirius.home.kraxel.org>
 <YCEGrrT0/eqqz/ok@phenom.ffwll.local>
 <8ba4ad64be3546bda9a2ed2129bf98e4@intel.com>
 <20210209084453.5oqepy7zdwtxgrpu@sirius.home.kraxel.org>
 <2ef01dc941684a15a4f30e6239ae42df@intel.com>
 <8ac10b1d-3d64-4e39-42e6-6c65b61f0794@amd.com>
 <fd23d4d08ea84ca3b8a7610a8fb866d5@intel.com>
 <e3222c34-31ee-b43e-65b0-6ab01423d52b@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e3222c34-31ee-b43e-65b0-6ab01423d52b@amd.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>, "Kasireddy,
 Vivek" <vivek.kasireddy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, "Vetter,
 Daniel" <daniel.vetter@intel.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> This is because of the fundamental concept of DMA-buf that the exporter
> needs to setup mappings (both CPU page tables as well as stuff like IOMMU).
> When the guest exports something it would mean that you give the guest
> control over the IOMMU and/or host page tables. And that is not something
> you can do as far as I can see.

Correct.

> You can only export stuff the other way around so that the host is providing
> the memory and the guest is consuming it. If I understand it correctly
> that's exactly what Gerd is suggesting here.

It can also work the other way around (guest allocating and host
consuming).  That is just an implementation detail.  The /important/
thing is that the driver which exports the dma-buf (and thus handles the
mappings) must be aware of the virtualization so it can properly
coordinate things with the host side.

So vdmabuf allocating and exporting dma-bufs works.

But vdmabuf importing dma-bufs doesn't because you can't ask the
exporter to create *host* mappings as Christian outlined above.  Sure,
you can try to sidestep the exporter, fish the list of pages out of the
scatter list and run with that.  That will explode as soon as you meet a
dma-buf which is not backed by pages in the first place.  And even for
page-backed dma-bufs you can run into trouble, for example due to
mapping pages with the wrong caching attributes.  Alternatively you can
double-buffer and copy data from the imported dma-buf to some
host-shared memory, but I guess you don't want that for performance
reasons ...

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

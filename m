Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB0E314B9F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 10:30:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E5AA6EACA;
	Tue,  9 Feb 2021 09:30:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A61116EACA
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 09:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612863012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EV1+m5DoEAyc5L/tDny8qGFku+twc3qNo0KqVy7dbZ4=;
 b=aQvV7IP/rwW0xZgXE0lGrlPzFOlJP7xOihPsjDG2eJbDRwKO2CQckruRxMCHQGaZkKkqNX
 BawJlFSBZ98nKNSmtrh2gJDm/9ViE/Ggu6SQO4HOrrdkkCrWueUsiOlW1nuQyXMTQ97gsi
 4lrL1Zr5s6jIhZ6rmoG4Ae7GtDQ40LY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-igZyy2_6Ncy8a--aTqtbwg-1; Tue, 09 Feb 2021 03:44:57 -0500
X-MC-Unique: igZyy2_6Ncy8a--aTqtbwg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 686C91020C27;
 Tue,  9 Feb 2021 08:44:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-170.ams2.redhat.com
 [10.36.112.170])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC2D019CA8;
 Tue,  9 Feb 2021 08:44:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4665118003B6; Tue,  9 Feb 2021 09:44:53 +0100 (CET)
Date: Tue, 9 Feb 2021 09:44:53 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [RFC v3 2/3] virtio: Introduce Vdmabuf driver
Message-ID: <20210209084453.5oqepy7zdwtxgrpu@sirius.home.kraxel.org>
References: <20210203073517.1908882-1-vivek.kasireddy@intel.com>
 <20210203073517.1908882-3-vivek.kasireddy@intel.com>
 <YB1sRx1GrT8rATEg@phenom.ffwll.local>
 <20210208075748.xejgcb4il2egow2u@sirius.home.kraxel.org>
 <YCEGrrT0/eqqz/ok@phenom.ffwll.local>
 <8ba4ad64be3546bda9a2ed2129bf98e4@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8ba4ad64be3546bda9a2ed2129bf98e4@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

  Hi,

> > > > Nack, this doesn't work on dma-buf. And it'll blow up at runtime
> > > > when you enable the very recently merged CONFIG_DMABUF_DEBUG (would
> > > > be good to test with that, just to make sure).
> [Kasireddy, Vivek] Although, I have not tested it yet but it looks like this will
> throw a wrench in our solution as we use sg_next to iterate over all the struct page *
> and get their PFNs. I wonder if there is any other clean way to get the PFNs of all 
> the pages associated with a dmabuf.

Well, there is no guarantee that dma-buf backing storage actually has
struct page ...

> [Kasireddy, Vivek] To exclude such cases, would it not be OK to limit the scope 
> of this solution (Vdmabuf) to make it clear that the dma-buf has to live in Guest RAM?
> Or, are there any ways to pin the dma-buf pages in Guest RAM to make this
> solution work?

At that point it becomes (i915) driver-specific.  If you go that route
it doesn't look that useful to use dma-bufs in the first place ...

> IIUC, Virtio GPU is used to present a virtual GPU to the Guest and all the rendering 
> commands are captured and forwarded to the Host GPU via Virtio.

You don't have to use the rendering pipeline.  You can let the i915 gpu
render into a dma-buf shared with virtio-gpu, then use virtio-gpu only for
buffer sharing with the host.

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

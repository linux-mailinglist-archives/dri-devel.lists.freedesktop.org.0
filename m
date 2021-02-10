Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C96D3161E2
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 10:16:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C7389854;
	Wed, 10 Feb 2021 09:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E12AF6E196
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 09:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612948610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KajS67I+i5BpKQ99uXSNDjgQPmQkOT9qLUWTp/ktN+o=;
 b=PLq6EPJBW+Ee2F9pHWyQI6hqKRIkapzsQGZHEpckVtcxmEHNylt0M2zu+DB8u+G0StkTTD
 tkHv/mqOPPG36h3B1F1TT5Vl1OCYDRW5H1mdXPGhK0mphv6OzITFFO1h0sOBIN2HPS6/me
 E5SjbECl5BcDCCXm0CfBWocxqZQ6Zt4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-1xqaUBcyOBi7KIZWJaDH_w-1; Wed, 10 Feb 2021 04:16:45 -0500
X-MC-Unique: 1xqaUBcyOBi7KIZWJaDH_w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC397BBEE4;
 Wed, 10 Feb 2021 09:16:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-161.ams2.redhat.com
 [10.36.112.161])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B68C10016F6;
 Wed, 10 Feb 2021 09:16:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B59A418000AB; Wed, 10 Feb 2021 10:16:41 +0100 (CET)
Date: Wed, 10 Feb 2021 10:16:41 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [RFC v3 2/3] virtio: Introduce Vdmabuf driver
Message-ID: <20210210091641.ahjtgcdalw7viuei@sirius.home.kraxel.org>
References: <20210203073517.1908882-1-vivek.kasireddy@intel.com>
 <20210203073517.1908882-3-vivek.kasireddy@intel.com>
 <YB1sRx1GrT8rATEg@phenom.ffwll.local>
 <20210208075748.xejgcb4il2egow2u@sirius.home.kraxel.org>
 <YCEGrrT0/eqqz/ok@phenom.ffwll.local>
 <8ba4ad64be3546bda9a2ed2129bf98e4@intel.com>
 <20210209084453.5oqepy7zdwtxgrpu@sirius.home.kraxel.org>
 <2ef01dc941684a15a4f30e6239ae42df@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2ef01dc941684a15a4f30e6239ae42df@intel.com>
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

> > You don't have to use the rendering pipeline.  You can let the i915 gpu
> > render into a dma-buf shared with virtio-gpu, then use virtio-gpu only for
> > buffer sharing with the host.
> [Kasireddy, Vivek] Is this the most viable path forward? I am not sure how complex or 
> feasible it would be but I'll look into it.
> Also, not using the rendering capabilities of virtio-gpu and turning it into a sharing only
> device means there would be a giant mode switch with a lot of if() conditions sprinkled
> across. Are you OK with that?

Hmm, why a big mode switch?  You should be able to do that without
modifying the virtio-gpu guest driver.  On the host side qemu needs
some work to support the most recent virtio-gpu features like the
buffer uuids (assuming you use qemu userspace), right now those
are only supported by crosvm.

It might be useful to add support for display-less virtio-gpu, i.e.
"qemu -device virtio-gpu-pci,max_outputs=0".  Right now the linux
driver throws an error in case no output (crtc) is present.  Should
be fixable without too much effort though, effectively the sanity
check would have to be moved from driver initialization to commands
like SET_SCANOUT which manage the outputs.

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

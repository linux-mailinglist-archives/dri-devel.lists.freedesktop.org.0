Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E929C3596B5
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 09:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC016E471;
	Fri,  9 Apr 2021 07:48:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A0B46E471
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 07:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617954525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=023VJvz27zU8RynS9PfVAal8Xn/r3sXh9uMQX6OQuxI=;
 b=EoKUQlmnsaQBCwnTXIcmPm5+ZHUirq4mobgmK5/9bEIcPt9g82igLdhGlI3W11udwMlrOT
 apRMZ6g4BHhuVk0NHkv5zY2iCbgkTmc86myUGHfSeKaYCDtyUR3jGnSOL2C3zdharVhZtV
 ZfzHAd+8DM1v6Xc4OZFntuKaI45G5Mw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-H8x9FB8_PIuuGP2GjsghRQ-1; Fri, 09 Apr 2021 03:48:44 -0400
X-MC-Unique: H8x9FB8_PIuuGP2GjsghRQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 220125B38D;
 Fri,  9 Apr 2021 07:48:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-165.ams2.redhat.com
 [10.36.114.165])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A59C910074FC;
 Fri,  9 Apr 2021 07:48:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 33F3418000AB; Fri,  9 Apr 2021 09:48:40 +0200 (CEST)
Date: Fri, 9 Apr 2021 09:48:40 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH] drm/virtio: Create Dumb BOs as guest Blobs (v2)
Message-ID: <20210409074840.y3ddwbfanpscgydj@sirius.home.kraxel.org>
References: <20210401065324.vb44nfodohcgrdex@sirius.home.kraxel.org>
 <20210406203625.1727955-1-vivek.kasireddy@intel.com>
 <CAAfnVB=NUjUUUcABQhR3AhQPtdDu9uHZCsi+9Q90babp2AfOpg@mail.gmail.com>
 <20210408092740.c42sp32hku5d66ec@sirius.home.kraxel.org>
 <CAAfnVBkSVnDw23XkeaB-oj-bD5wu_-2rg3F+qMkBMezuD5mCkg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAfnVBkSVnDw23XkeaB-oj-bD5wu_-2rg3F+qMkBMezuD5mCkg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, "Zhang,
 Tina" <tina.zhang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> > IIRC the VIRTGPU_BLOB_FLAG_USE_SHAREABLE flag means that the host *can*
> > create a shared mapping (i.e. the host seeing guest-side changes without
> > explicit transfer doesn't cause problems for the guest).  It doesn not
> > mean the host *must* create a shared mapping (note that there is no
> > negotiation whenever the host supports shared mappings or not).
> >
> 
> VIRTGPU_BLOB_FLAG_USE_SHAREABLE means guest userspace intends to share the
> blob resource with another virtgpu driver instance via drmPrimeHandleToFd.
> It's a rough analogue to VkExportMemoryAllocateInfoKHR or
> PIPE_BIND_USE_SHARED.

Oh.  My memory was failing me then.  We should *really* clarify the spec
for BLOB_MEM_GUEST.

So shared mappings are allowed for all BLOB_MEM_GUEST resources, right?

> > So the transfer calls are still needed, and the host can decide to
> > shortcut them in case it can create a shared mapping.  In case there is
> > no shared mapping (say due to missing udmabuf support) the host can
> > fallback to copying.
> 
> Transfers are a bit under-defined for BLOB_MEM_GUEST.  Even without udmabuf
> on the host, there is no host side resource for guest-only blobs?  Before
> blob resources, the dumb flow was:
> 
> 1) update guest side resource
> 2) TRANSFER_TO_HOST_2D to copy guest side contents to host side private
> resource [Pixman??]
> 3) RESOURCE_FLUSH to copy the host-side contents to the framebuffer and
> page-flip

Yes.

> At least for crosvm, this is possible:
> 
> 1) update guest side resource
> 2) RESOURCE_FLUSH to copy the guest-side contents to the framebuffer and
> pageflip
> 
> With implicit udmabuf, it may be possible to do this:
> 
> 1) update guest side resource
> 2) RESOURCE_FLUSH to page-flip
> 
> > So I think crosvm should be fixed to not consider transfer commands for
> > VIRTGPU_BLOB_MEM_GUEST resources an error.
> 
> It's a simple change to make and we can definitely do it, if TRANSFER_2D is
> helpful for the QEMU case.  I haven't looked at the QEMU side patches.

Well, we have two different cases:

  (1) No udmabuf available.  qemu will have a host-side shadow then and
      the workflow will be largely identical to the non-blob resource
      workflow.

  (2) With udmabuf support.  qemu can create udmabufs for the resources,
      mmap() the dmabuf to get a linear mapping, create a pixman buffer
      backed by that dmabuf (no copying needed then).  Depending on
      capabilities pass either the pixman image (gl=off) or the dmabuf
      handle (gl=on) to the UI code to actually show the guest display.

The guest doesn't need to know any of this, it'll just send transfer and
flush commands.  In case (1) qemu must process the transfer commands and
for case (2) qemu can simply ignore them.

> For the PCI-passthrough + guest blob case, the end goal is to share it with
> the host compositor.  If there is no guarantee the guest memory can be
> converted to an OS-handle (to share with the host compositor), then I think
> the guest user space should fallback to another technique involving
> memcpy() to share the memory.

This is what happens today (using non-blob resources).

> So essentially, thinking for two new protocol additions:
> 
> F_CREATE_GUEST_HANDLE (or F_HANDLE_FROM_GUEST) --> means an OS-specific
> udmabuf-like mechanism exists on the host.
> 
> BLOB_FLAG_CREATE_GUEST_HANDLE (or BLOB_FLAG_HANDLE_FROM_GUEST)--> tells
> host userspace "you must create a udmabuf" [or OS-specific equivalent] upon
> success

Again:  Why do we actually need that?  Is there any benefit other than
the guest knowing it doesn't need to send transfer commands?

I see the whole udmabuf thing as a host-side performance optimization
and I think this should be fully transparent to the guest as the host
can easily just ignore the transfer commands.  Given we batch commands
the extra commands don't lead to extra context switches, so there
shouldn't be much overhead.

If we really want make the guest aware of the hosts udmabuf state I
think this should be designed the other way around:  Add some way for
the host to tell the guest transfer commands are not needed for a
specific BLOB_MEM_GUEST resource.

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

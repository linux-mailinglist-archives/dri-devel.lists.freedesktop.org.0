Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 066AC3DE797
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 09:52:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8039989FD3;
	Tue,  3 Aug 2021 07:51:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03CDC89FD3
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 07:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627977115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i0OO4fYo3TxuwTAqaCoXiRo+P2eULB/jkV14GZURpmk=;
 b=ICVJ+VOxsf8nPxxHW5JN7p90EyUtSfxUeDWiM7gcbF4JvCUWNh3IDS2H08bvGDTdsw1Pjx
 dGqE9Ghy/MWxrMP57EO38l2kOCVgvhgXa+k484wfNjdhu2D3Yerj7tpebgmfgSU2yEyaTv
 5FW526aJm6btiXAoblK6Em1V6IqpLTE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-kEDNkOtsOwCF4Ps0NnipXg-1; Tue, 03 Aug 2021 03:51:52 -0400
X-MC-Unique: kEDNkOtsOwCF4Ps0NnipXg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A5421006C82;
 Tue,  3 Aug 2021 07:51:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 96A4C4A66;
 Tue,  3 Aug 2021 07:51:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 40B5E1800393; Tue,  3 Aug 2021 09:51:47 +0200 (CEST)
Date: Tue, 3 Aug 2021 09:51:47 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Simon Ser <contact@emersion.fr>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel@daenzer.net>,
 "Zhang, Tina" <tina.zhang@intel.com>,
 "Kim, Dongwon" <dongwon.kim@intel.com>
Subject: Re: [RFC v1 0/4] drm: Add support for DRM_CAP_DEFERRED_OUT_FENCE
 capability
Message-ID: <20210803075147.n5rbmdsrbhh5auk5@sirius.home.kraxel.org>
References: <20210729081659.2255499-1-vivek.kasireddy@intel.com>
 <YQPTo0D5SZfX44dn@phenom.ffwll.local>
 <20210730133850.bbje7uxvrvsmuopt@sirius.home.kraxel.org>
 <YQe2RfK0wCY6Q2y/@phenom.ffwll.local>
 <20210802125056.pdcfle4aziyjh32r@sirius.home.kraxel.org>
 <bede286bbe80421585cc9b9dd798bfe6@intel.com>
MIME-Version: 1.0
In-Reply-To: <bede286bbe80421585cc9b9dd798bfe6@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> > virtio_gpu_primary_plane_update() will send RESOURCE_FLUSH only for
> > DIRTYFB and both SET_SCANOUT + RESOURCE_FLUSH for page-flip, and I
> > think for the page-flip case the host (aka qemu) doesn't get the
> > "wait until old framebuffer is not in use any more" right yet.
> [Kasireddy, Vivek] As you know, with the GTK UI backend and this patch series: 
> https://lists.nongnu.org/archive/html/qemu-devel/2021-06/msg06745.html
> we do create a sync file fd -- after the Blit -- and wait (adding it to Qemu's main
> event loop) for it to ensure that the Guest scanout FB is longer in use on the Host.
> This mechanism works in a similarly way for both frontbuffer DIRTYFB case and
> also the double-buffer case. 

Well, we don't explicitly wait on the old framebuffer.  Not fully sure
this is actually needed, maybe the command ordering (SET_SCANOUT goes
first) is enough.

> > So we'll need a host-side fix for that and a guest-side fix to switch
> > from a blocking wait on the fence to vblank events.
> [Kasireddy, Vivek] Do you see any concerns with the blocking wait?

Well, it's sync vs. async for userspace.

With the blocking wait the userspace ioctl (PAGE_FLIP or the atomic
version of it) will return when the host is done.

Without the blocking wait the userspace ioctl will return right away and
userspace can do something else until the host is done (and the vbland
event is sent to notify userspace).

> And, are you
> suggesting that we use a vblank timer?

I think we should send the vblank event when the RESOURCE_FLUSH fence
signals the host is done.

take care,
  Gerd


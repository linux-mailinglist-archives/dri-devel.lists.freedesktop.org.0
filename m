Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4671260DC
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 12:32:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B7836EB50;
	Thu, 19 Dec 2019 11:32:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE0C6EB50
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 11:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576755128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KQVy1060cIcwdmA+aV3D7jzIs8ekG/8Yaj3TYu2HIws=;
 b=eeVhEDPfbk7YMhqxUDgi4yMtzYg7eQ3bYY9Hq1je21RrAG//+efOEZVmCCprUD61JQ3YYl
 7gc9jgm1c/W38tOAUB+TpBQ0DAC6RBH0xlEd2aWNAOF2VK9jnldpGXu9qxGdNL9WJWsTsq
 zmS7jBdb5TcNg4GRSCUfbe6PEM5gs+8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-1dfDxRcXPu6wUynMAn751g-1; Thu, 19 Dec 2019 06:32:02 -0500
X-MC-Unique: 1dfDxRcXPu6wUynMAn751g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34B2D803A4C;
 Thu, 19 Dec 2019 11:31:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-98.ams2.redhat.com
 [10.36.116.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D99963B89;
 Thu, 19 Dec 2019 11:31:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C695311AAA; Thu, 19 Dec 2019 12:31:51 +0100 (CET)
Date: Thu, 19 Dec 2019 12:31:51 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: Warnings in DRM code when removing/unbinding a driver
Message-ID: <20191219113151.sytkoi3m7rrxzps2@sirius.home.kraxel.org>
References: <07899bd5-e9a5-cff0-395f-b4fb3f0f7f6c@huawei.com>
 <f867543cf5d0fc3fdd0534749326411bcfc5e363.camel@collabora.com>
 <c2e5f5a5-5839-42a9-2140-903e99e166db@huawei.com>
 <fde72f73-d678-2b77-3950-d465f0afe904@huawei.com>
 <CAKMK7uFr03euoB6rY8z9zmRyznP41vwfdaKApZ_0HfYZT4Hq_w@mail.gmail.com>
 <fcca5732-c7dc-6e1d-dcbe-bfd914a4295b@huawei.com>
 <CAKMK7uE+nfR2hv1ybfv1ZApZbGnnX7ZHfjFCv5K72ZaAmdtfug@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uE+nfR2hv1ybfv1ZApZbGnnX7ZHfjFCv5K72ZaAmdtfug@mail.gmail.com>
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
Cc: dbueso@suse.de, "airlied@linux.ie" <airlied@linux.ie>,
 "Chenfeng \(puck\)" <puck.chen@hisilicon.com>,
 John Garry <john.garry@huawei.com>, Linuxarm <linuxarm@huawei.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kongxinwei \(A\)" <kong.kongxinwei@hisilicon.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> >   Like I said, for most drivers
> > > you can pretty much assume that their unload sequence has been broken
> > > since forever. It's not often tested, and especially the hotunbind
> > > from a device (as opposed to driver unload) stuff wasn't even possible
> > > to get right until just recently.
> >
> > Do you think it's worth trying to fix this for 5.5 and earlier, or just
> > switch to the device-managed interface for 5.6 and forget about 5.5 and
> > earlier?
> 
> I suspect it's going to be quite some trickery to fix this properly
> and everywhere, even for just one driver. Lots of drm drivers
> unfortunately use anti-patterns with wrong lifetimes (e.g. you can't
> use devm_kmalloc for anything that hangs of a drm_device, like
> plane/crtc/connector). Except when it's for a real hotunpluggable
> device (usb) we've never bothered backporting these fixes. Too much
> broken stuff unfortunately.

While being at it:  How would a driver cleanup properly cleanup gem
objects created by userspace on hotunbind?  Specifically a gem object
pinned to vram?

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEA82CA120
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 12:20:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D2EB89E69;
	Tue,  1 Dec 2020 11:20:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2239289E69
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 11:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606821629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gQl3DpHIpoBeXGbiOMpJzHg8IZwbx7pQYj+PTlee4Ow=;
 b=eUnpfWlBOSCxAoyU4SFMkOjiAWMKNQvaOTDb5AyU1QpToSlvsTXD5ilV7i6w6ZQ6M2yMCB
 2ckI1lMFwH1hxkMWdiCzXod67rSgV6kKy5vI7qSwc5mz8TUDN9hFqe7IcR5xePPH17/RqM
 KySmgA1ndm51oWYTHitsuz0gIs6orAw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-tkB4tctQMO2e-vCdhLOYZA-1; Tue, 01 Dec 2020 06:20:25 -0500
X-MC-Unique: tkB4tctQMO2e-vCdhLOYZA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95A5C805BE0;
 Tue,  1 Dec 2020 11:20:23 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1083F60BE5;
 Tue,  1 Dec 2020 11:20:23 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 0B1BKMEq003279; Tue, 1 Dec 2020 06:20:22 -0500
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 0B1BKMvs003264; Tue, 1 Dec 2020 06:20:22 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Tue, 1 Dec 2020 06:20:22 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] fbdev: Remove udlfb driver
In-Reply-To: <ac639546-d97e-b197-8998-180b0535fae2@suse.de>
Message-ID: <alpine.LRH.2.02.2012010615080.1371@file01.intranet.prod.int.rdu2.redhat.com>
References: <20201130125200.10416-1-tzimmermann@suse.de>
 <alpine.LRH.2.02.2011300843270.29199@file01.intranet.prod.int.rdu2.redhat.com>
 <20201130154147.GT401619@phenom.ffwll.local>
 <alpine.LRH.2.02.2011301241470.21432@file01.intranet.prod.int.rdu2.redhat.com>
 <ac639546-d97e-b197-8998-180b0535fae2@suse.de>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: linux-fbdev@vger.kernel.org, geert+renesas@glider.be,
 linux-doc@vger.kernel.org, daniel.vetter@ffwll.ch, corbet@lwn.net,
 bernie@plugable.com, dri-devel@lists.freedesktop.org, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On Tue, 1 Dec 2020, Thomas Zimmermann wrote:

> Hi
> 
> Am 30.11.20 um 19:39 schrieb Mikulas Patocka:
> > 
> > 
> > On Mon, 30 Nov 2020, Daniel Vetter wrote:
> > 
> > > On Mon, Nov 30, 2020 at 09:31:15AM -0500, Mikulas Patocka wrote:
> > > > 
> > > > The framebuffer driver supports programs running full-screen directly on
> > > > the framebuffer console, such as web browser "links -g", image viewer
> > > > "fbi", postscript+pdf viewer "fbgs", ZX Spectrum emulator "fuse-sdl",
> > > > movie player "mplayer -vo fbdev". The DRM driver doesn't run them.
> > > 
> > > Hm this should in general work on drm drivers. Without that it's clear the
> > > switch-over isn't really ready yet.
> > 
> > I fixed it with this patch two years ago:
> > https://lists.freedesktop.org/archives/dri-devel/2018-June/179023.html
> > 
> > But the patch never went through and the fb_defio feature was removed in
> > the kernel 5.6 (commit d0c4fc5a4814e431c15272935c8dc973c18073aa).
> > 
> > 
> > Without fb_defio, the only other possibility how to update the screen is
> > the ioctl DRM_IOCTL_MODE_DIRTYFB. But this ioctl requires master mode, so
> > user programs like "links -g" can't issue it.
> 
> That's confusing. DIRTYFB is only for DRM.

Yes, you're right.

> And why can links not run as DRM master mode? If it renders to the terminal,
> it should act like a composer. In that case it almost certainly wants master
> status.
> 
> Best regards
> Thomas

How can a userspace program acquire master mode without being suid?

Is there some "Hello World!" program that shows how to use DRM? I'm not an 
expert in DRM, but if there were some tutorial+documentation, I could 
consider porting "links" to it.

Mikulas

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

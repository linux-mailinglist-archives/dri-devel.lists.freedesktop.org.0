Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D15372056EE
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 18:17:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F6C6E9F7;
	Tue, 23 Jun 2020 16:17:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF1D6E9F7
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 16:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592929070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ev9nrM16MiclfzIlla2poCCvKsAQZMXql22WZ3Is1Yo=;
 b=VstwaOSGH6xJ9OgZzZiS/uXnsDpTt5vpNolMCkg4HbK1ZWRXkfe5jVE19mrDXyzCyEsHC2
 AZ/PZNV+qmd70KQ8nWpTxDtImuRQLiLHlWpXD4x9r2PZG4J/w5QGOPgblL2E6GcU0a+QzD
 S7AspVgdXS7ou+zwV1fGbrXe0YWnsds=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-nLrOfufyNa2Ppi-JKyNCBw-1; Tue, 23 Jun 2020 12:17:45 -0400
X-MC-Unique: nLrOfufyNa2Ppi-JKyNCBw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21871106B250;
 Tue, 23 Jun 2020 16:17:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-67.ams2.redhat.com
 [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AEDB178FD9;
 Tue, 23 Jun 2020 16:17:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BF7F6783B; Tue, 23 Jun 2020 18:17:42 +0200 (CEST)
Date: Tue, 23 Jun 2020 18:17:42 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC PATCH 1/2] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
Message-ID: <20200623161742.u6hnb7iodptv4s6t@sirius.home.kraxel.org>
References: <20200622110623.113546-1-drawat.floss@gmail.com>
 <20200622110623.113546-2-drawat.floss@gmail.com>
 <20200622124622.yioa53bvipvd4c42@sirius.home.kraxel.org>
 <f6923296368dc676df10e75593ebc18575efc476.camel@gmail.com>
 <20200623094225.GJ20149@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200623094225.GJ20149@phenom.ffwll.local>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: linux-hyperv@vger.kernel.org, Stephen Hemminger <sthemmin@microsoft.com>,
 David Airlie <airlied@linux.ie>, Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, dri-devel@lists.freedesktop.org,
 Michael Kelley <mikelley@microsoft.com>, Jork Loeser <jloeser@microsoft.com>,
 Deepak Rawat <drawat.floss@gmail.com>, Wei Hu <weh@microsoft.com>,
 K Y Srinivasan <kys@microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> > > > +	msg->vram.user_ctx = msg->vram.vram_gpa = vram_pp;
> > > > +	msg->vram.is_vram_gpa_specified = 1;
> > > > +	synthvid_send(hdev, msg);
> > > 
> > > That suggests it is possible to define multiple framebuffers in vram,
> > > then pageflip by setting vram.vram_gpa.  If that is the case I'm
> > > wondering whenever vram helpers are a better fit maybe?  You don't
> > > have
> > > to blit each and every display update then.
> > 
> > Thanks for the review. Unfortunately only the first vmbus message take
> > effect and subsequent calls are ignored. I originally implemented using
> > vram helpers but I figured out calling this vmbus message again won't
> > change the vram location.

/me notices there also is user_ctx.  What is this?

> I think that needs a very big comment. Maybe even enforce that with a
> "vram_gpa_set" boolean in the device structure, and complain if we try to
> do that twice.
> 
> Also I guess congrats to microsoft for defining things like that :-/

I would be kind of surprised if the virtual device doesn't support
pageflips.  Maybe setting vram_gpa just isn't the correct way to do
it.  Is there a specification available?

There are a number of microsoft folks in Cc:  Anyone willing to comment?

thanks,
  Gerd

PS: And, yes, in case pageflips really don't work going with shmem
    helpers + blits is reasonable.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

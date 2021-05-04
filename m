Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CEC372AAC
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 15:09:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4319A6EAD5;
	Tue,  4 May 2021 13:09:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A376EAD5
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 13:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620133747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I+a3Gqq/AQH86AQgX5MsIHGOIG8nweku9Ika1zopWOs=;
 b=OrG7CH+dmKwc0rUWbsSyQE7YIRE0F/5PFJaLBOPNH5Z2pG8jUaTfcSqdBZT96ognY1tHoB
 jhaMzv84G/lbK3ws3khdEujkoV42CDNjso0GTwWsEXkTJ7GEBRJBE1J7qAdiI8632ybV0p
 7Hrl7l5vpMeXRF2BHmrO+lC9arQYPDM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-sAMffVlyOI2oanb_IGH7cQ-1; Tue, 04 May 2021 09:09:03 -0400
X-MC-Unique: sAMffVlyOI2oanb_IGH7cQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4102964157;
 Tue,  4 May 2021 13:09:01 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-126.ams2.redhat.com
 [10.36.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 37B075D72F;
 Tue,  4 May 2021 13:08:53 +0000 (UTC)
Date: Tue, 4 May 2021 15:08:51 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: remove the nvlink2 pci_vfio subdriver v2
Message-ID: <20210504150851.54e278f8.cohuck@redhat.com>
In-Reply-To: <20210504130039.GA7711@lst.de>
References: <20210326061311.1497642-1-hch@lst.de>
 <20210504142236.76994047@bahia.lan> <YJFFG1tSP0dUCxcX@kroah.com>
 <20210504130039.GA7711@lst.de>
Organization: Red Hat GmbH
MIME-Version: 1.0
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
Cc: Jason Gunthorpe <jgg@nvidia.com>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, qemu-devel@nongnu.org,
 dri-devel@lists.freedesktop.org, Greg Kurz <groug@kaod.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 qemu-ppc@nongnu.org, linux-api@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 4 May 2021 15:00:39 +0200
Christoph Hellwig <hch@lst.de> wrote:

> On Tue, May 04, 2021 at 02:59:07PM +0200, Greg Kroah-Hartman wrote:
> > > Hi Christoph,
> > > 
> > > FYI, these uapi changes break build of QEMU.  
> > 
> > What uapi changes?
> > 
> > What exactly breaks?
> > 
> > Why does QEMU require kernel driver stuff?  
> 
> Looks like it pull in the uapi struct definitions unconditionally
> instead of having a local copy.  We could fix that by just putting
> them back, but to me this seems like a rather broken configuration
> in qemu when it pulls in headers from the running/installed kernel
> without any feature checks before using them.
> 

It is not pulling them from the installed kernel, but from a
development version to get new definitions. Removing things in the
kernel requires workarounds in QEMU until it can remove those things as
well. It is not a dumb update...

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

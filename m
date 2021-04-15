Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF49360546
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 11:08:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AFD26EA13;
	Thu, 15 Apr 2021 09:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E936EA13
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 09:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618477687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aJ9JfC7bzpZdnV2nN3MJlzZnQVH9tjix89dDNgwsTzg=;
 b=UXl89MVt4MhAzezYSNevqlKXhhJs9LaEIr4SIpte+Ijcuke/dvAfCVYUoD8OlAxfmVtX6j
 5fRNORyHlJtNVVCp494vM6PKo6ML2Bx6dFJqGzz77P+bTx3LD1vVPawN62nI5MJeXOz2FY
 Xb/pnQPndw71OjVJNEOJVaUCVv8xsZo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-VdL0TM9UND6mcdKwUn2NFw-1; Thu, 15 Apr 2021 05:08:03 -0400
X-MC-Unique: VdL0TM9UND6mcdKwUn2NFw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79E4683DD22;
 Thu, 15 Apr 2021 09:08:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-165.ams2.redhat.com
 [10.36.114.165])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A4F7610A8;
 Thu, 15 Apr 2021 09:08:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 32B0A18000A1; Thu, 15 Apr 2021 11:07:59 +0200 (CEST)
Date: Thu, 15 Apr 2021 11:07:59 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH] drm/virtio: Create Dumb BOs as guest Blobs (v3)
Message-ID: <20210415090759.yd5fkwqsefft7jlj@sirius.home.kraxel.org>
References: <CAAfnVBmkEHB=j3rJyLPOixFRfPD=WQGVs85PuS0RYmViOgVAQA@mail.gmail.com>
 <20210413052614.2486768-1-vivek.kasireddy@intel.com>
 <CAAfnVBm5UUrW-j0OnokPHCzGo35UNkmpLNTqCWdQF-arR7e1ig@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAfnVBm5UUrW-j0OnokPHCzGo35UNkmpLNTqCWdQF-arR7e1ig@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 14, 2021 at 04:31:45PM -0700, Gurchetan Singh wrote:
> On Mon, Apr 12, 2021 at 10:36 PM Vivek Kasireddy <vivek.kasireddy@intel.com>
> wrote:
> 
> > If support for Blob resources is available, then dumb BOs created
> > by the driver can be considered as guest Blobs.
> >
> > v2: Don't skip transfer and flush commands as part of plane update
> > as the device may have created a shared mapping. (Gerd)
> >
> > v3: Don't create dumb BOs as Guest blobs if Virgl is enabled. (Gurchetan)
> >
> 
> I think it is a good start and advances QEMU blobs.  Improvements are
> always possible, but may be made at a future time.
> 
> Acked-by: Gurchetan Singh <gurchetansingh@chromium.org>

Agree.  Future improvements (like maybe use HOST3D blobs for virgl=on)
can easily go on top of this.

Pushed to drm-misc-next.

thanks,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

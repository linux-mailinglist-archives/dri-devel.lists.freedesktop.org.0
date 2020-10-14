Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7D728DACC
	for <lists+dri-devel@lfdr.de>; Wed, 14 Oct 2020 10:01:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B80D6EA1E;
	Wed, 14 Oct 2020 08:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706BC6EA21
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Oct 2020 08:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602662464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pkgGqDcKwPNInWK5gD36RJGreZG4CpyExPIqHD2mYAk=;
 b=N33Gc81kUFOaJCZxuQGSdf7fbjQl8t8Ux67aawE7dsRztLtrYxLYtpKXJISy1NgXQ+0rj5
 b3zTrCa+mFDU63Zr/Mx+FFah5kWoFTNI/c4WT8Ejcg2mMv87cUm8lPGdDoQZiTicUEUJWU
 +YKe8OhvDGpBdJMTjBG27rzAII0NlcI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-P3emRcGEOzeVO65d3cimIg-1; Wed, 14 Oct 2020 04:01:00 -0400
X-MC-Unique: P3emRcGEOzeVO65d3cimIg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E427879528;
 Wed, 14 Oct 2020 08:00:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86D127366B;
 Wed, 14 Oct 2020 08:00:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BEAE29CBC; Wed, 14 Oct 2020 10:00:54 +0200 (CEST)
Date: Wed, 14 Oct 2020 10:00:54 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2] drm/virtio: Use UUID API for importing the UUID
Message-ID: <20201014080054.w35hdxsbzjmgktwo@sirius.home.kraxel.org>
References: <20201013132714.70973-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20201013132714.70973-1-andriy.shevchenko@linux.intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 David Stevens <stevensd@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 13, 2020 at 04:27:14PM +0300, Andy Shevchenko wrote:
> There is import_uuid() function which imports u8 array to the uuid_t.
> Use it instead of open coding variant.
> 
> This allows to hide the uuid_t internals.
> 
> Reviewed-by: David Stevens <stevensd@chromium.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Pushed to drm-misc-next.

thanks,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

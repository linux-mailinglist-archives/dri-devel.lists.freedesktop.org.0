Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1115128CAAB
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 10:54:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 967A26E0B8;
	Tue, 13 Oct 2020 08:54:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FFED6E0B8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 08:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602579275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tTorjtxCCUYn5sxnNn2sovTqfPXPpVXvu20v4jV0oXg=;
 b=T8za4aP97KsQ1bHfhQrmGOssYYsa5cnIrsNLO+r9CcXsPzzxRpKhfXxApFodqZN7YrME8k
 dPbkOgfGPyFbH+bDIO10UeGv7xyW/lee23jsORkJvk41XPgoMDDzN7EbWGY2mB2IIJScRX
 p5CzVU6rZVgNWWRfnRfd+qS0WzD2n+g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-Gxl_QddkMduWKTo0LWE3dA-1; Tue, 13 Oct 2020 04:54:32 -0400
X-MC-Unique: Gxl_QddkMduWKTo0LWE3dA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC61E8030A9;
 Tue, 13 Oct 2020 08:54:29 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B62C5D9CD;
 Tue, 13 Oct 2020 08:54:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7DD781750A; Tue, 13 Oct 2020 10:54:25 +0200 (CEST)
Date: Tue, 13 Oct 2020 10:54:25 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1] drm/virtio: Use UUID API for importing the UUID
Message-ID: <20201013085425.camu3bajxi4jaldo@sirius.home.kraxel.org>
References: <20201012171826.76509-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20201012171826.76509-1-andriy.shevchenko@linux.intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

On Mon, Oct 12, 2020 at 08:18:26PM +0300, Andy Shevchenko wrote:
> There is import_uuid() function which imports u8 array to the uuid_t.
> Use it instead of open coding variant.
> 
> This allows to hide the uuid_t internals.

Doesn't apply to drm-misc-next, please rebase.

thanks,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

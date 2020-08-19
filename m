Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F16D1249516
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 08:38:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3553289F3C;
	Wed, 19 Aug 2020 06:38:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A77E89F3C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 06:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597819108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NHHZyWpx/1xfNXWHIeRqIedH3/T8wSSk7Z+TEpnvLCQ=;
 b=GR7buv4LiqAL70HPMxIfOGu0FXgETMLlSmgcZ8JBKYgfAli9HlIyMyWkyqey1SScmynAUt
 bj6KahuzLOjBa5P9z5PxOayqHHNJJy7tH1MbD9iQfT3bKFSLaaPNOFGa5plxg1PWN7R23+
 kdOOSz7lBEWWiNY+mBJkF6YOO1ErEJw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-HsSWCJzMPcKMoHTZmLbSsQ-1; Wed, 19 Aug 2020 02:38:26 -0400
X-MC-Unique: HsSWCJzMPcKMoHTZmLbSsQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 057A91084C84;
 Wed, 19 Aug 2020 06:38:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-195.ams2.redhat.com
 [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A92767DFD4;
 Wed, 19 Aug 2020 06:38:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C83FD9D8F; Wed, 19 Aug 2020 08:38:23 +0200 (CEST)
Date: Wed, 19 Aug 2020 08:38:23 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH] virtio: fix build for configs without dma-bufs
Message-ID: <20200819063823.j5njabobxc767557@sirius.home.kraxel.org>
References: <20200819031011.310180-1-stevensd@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200819031011.310180-1-stevensd@chromium.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
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
Cc: virtio-dev@lists.oasis-open.org, kernel test robot <lkp@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 19, 2020 at 12:10:11PM +0900, David Stevens wrote:
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: David Stevens <stevensd@chromium.org>

Pushed to drm-misc-next

thanks for the qick fix,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

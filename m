Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D511241C4
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 09:32:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E1C6E25B;
	Wed, 18 Dec 2019 08:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F536E25B
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 08:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576657917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dPNVFv2FTSXJXvkQ+SpfSzIyJAuZRNDkf8TvFSJUKfM=;
 b=NjmDdFKgjn+j83lSgP5ZSd5tYdjUjeD5A8kQHxdWgqmAfxz5KFx9DL3KdjYbkttM1vdiKl
 UteWjQHPaS8hDR9BLFgLN4TM5ei3fA8jN6zhCZLLaIkpAtBEHUtDTqztpPWyOI8qB5mmdi
 tm3agTDVvLlHiIXyIp24yxod43DJrr8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-5EyY49i0OwuF4ath47fjIw-1; Wed, 18 Dec 2019 03:31:53 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92407801E66;
 Wed, 18 Dec 2019 08:31:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-39.ams2.redhat.com
 [10.36.117.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FA58620BF;
 Wed, 18 Dec 2019 08:31:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 658119B13; Wed, 18 Dec 2019 09:31:51 +0100 (CET)
Date: Wed, 18 Dec 2019 09:31:51 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH 0/9] *** virtgpu cleanups ***
Message-ID: <20191218083151.mpndvnneud4k4mhd@sirius.home.kraxel.org>
References: <20191218005929.6709-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20191218005929.6709-1-gurchetansingh@chromium.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 5EyY49i0OwuF4ath47fjIw-1
X-Mimecast-Spam-Score: 0
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 17, 2019 at 04:59:20PM -0800, Gurchetan Singh wrote:
> With so many new features on the horizon, perhaps it's
> time to do a little "winter cleaning" beforehand. Enjoy!
> 
>   drm/virtio: static-ify virtio_gpu_framebuffer_init

Doesn't apply cleanly.  What kernel is this against?

>   drm/virtio: remove virtgpu_gem_prime_import_sg_table

I'd prefer to keep that.  Once we have blob resource support we can
actually handle dma-buf imports.

>   drm/virtio: split out vq functions from virtgpu_drv.h
>   drm/virtio: split out gem functions from virtgpu_drv.h

Hmm, I'd prefer to have everything in one header, and the file isn't
that big that it is unmanageable...

The other patches look fine to me.  Didn't test whenever they apply
though, tried only the whole series which stopped at patch #2).

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

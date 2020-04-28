Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B9C1BB9F5
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 11:37:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A47389F77;
	Tue, 28 Apr 2020 09:37:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0086389FE6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 09:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588066645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U7NX3Akb2N82QV1r2tS6y9KswzrodTDOTwMzP2IUL+o=;
 b=VJczQLDqgUh3+jdDv6/7+hSF/DLji+7k6Tt6s3rjJzYXUtqdsgbpv/v5xq97OCIhcmdgfu
 b9GiT5UdSCxRrJ7+o7fKef5bBwRBlhtKjI0cBs+xZxzgVNBa8WLudxlp9itAoJJpufYeG7
 gEbA7nzpEsFAZ7T+VoLTsoXPfcAlrfA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-u2kRo69yM1ekoSKZ6XinNQ-1; Tue, 28 Apr 2020 05:37:23 -0400
X-MC-Unique: u2kRo69yM1ekoSKZ6XinNQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 956A9835B74;
 Tue, 28 Apr 2020 09:37:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 589D65C241;
 Tue, 28 Apr 2020 09:37:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6762B9D98; Tue, 28 Apr 2020 11:37:21 +0200 (CEST)
Date: Tue, 28 Apr 2020 11:37:21 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH] drm/virtio: only destroy created contexts
Message-ID: <20200428093721.xwzfqwgy6jhiov73@sirius.home.kraxel.org>
References: <20200408232938.55816-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200408232938.55816-1-gurchetansingh@chromium.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 08, 2020 at 04:29:38PM -0700, Gurchetan Singh wrote:
> This can happen if userspace doesn't issue any 3D ioctls before
> closing the DRM fd.
> 
> Fixes: 72b48ae800da ("drm/virtio: enqueue virtio_gpu_create_context
> after the first 3D ioctl")
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>

Pushed to drm-misc-fixes.

thanks,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

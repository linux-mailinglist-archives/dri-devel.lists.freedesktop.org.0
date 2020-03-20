Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F2718C7A9
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 07:48:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BA5E6E119;
	Fri, 20 Mar 2020 06:48:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28CC76E119
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 06:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584686923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I8J6IN+TuY0BJsRchoBI9oAN0K/XoUEqJ8kuURXbQjM=;
 b=ghp/qxRR52Pa0JwCFG1E1YEfoc/yEsoQuokJKQ7Qn+eBjtTomqE5VsuzSSGL0dEopJ+JgE
 GQSzSWq2WSjhIjWhsekd4nZnvM6dSh1OlzHr5FxrMTACUY6wVVDVnLUqjUHu0Tiatpyb3E
 FkumCf2/05Vox2eY/VnX20B1//K6QAs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-hj1uEHnlPI2nAfHMwlmZAQ-1; Fri, 20 Mar 2020 02:48:37 -0400
X-MC-Unique: hj1uEHnlPI2nAfHMwlmZAQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBE23477;
 Fri, 20 Mar 2020 06:48:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-49.ams2.redhat.com
 [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C96EEBBBF2;
 Fri, 20 Mar 2020 06:48:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 954249DB3; Fri, 20 Mar 2020 07:48:30 +0100 (CET)
Date: Fri, 20 Mar 2020 07:48:30 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v3 0/4] Support virtio cross-device resources
Message-ID: <20200320064830.svdgh4xuxbxz6bc4@sirius.home.kraxel.org>
References: <20200311112004.47138-1-stevensd@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311112004.47138-1-stevensd@chromium.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: virtio-dev@lists.oasis-open.org, Thomas Zimmermann <tzimmermann@suse.de>,
 "Michael S . Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 11, 2020 at 08:20:00PM +0900, David Stevens wrote:
> This patchset implements the current proposal for virtio cross-device
> resource sharing [1], with minor changes based on recent comments. It
> is expected that this will be used to import virtio resources into the
> virtio-video driver currently under discussion [2].
> 
> This patchset adds a new hook to dma-buf, for querying the dma-buf's
> underlying virtio UUID. This hook is then plumbed through DRM PRIME
> buffers, and finally implemented in virtgpu.

Looks all fine to me.  We should wait for the virtio protocol update
(patch 3/4) being accepted into the virtio specification.  When this is
done I'll go commit this to drm-misc-next.

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

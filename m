Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8CB38761F
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 12:09:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C94D08828C;
	Tue, 18 May 2021 10:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C83B8828C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 10:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621332572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r098tHE0nlpPy8H+tzPNv+PPdJXPs/G8lc3vpf4k9jM=;
 b=CjT5oPWMxurshozLWQt6eSi85GsQYPhDOiHgxkzmAeIhfHykcvb6mTIh/wt+uIpMC28APq
 svoynQUzeI+VFH0FkkVLgW4s7hPiixmsxhZdRLUEvVeDVslzTj/eSt0gNKSpWI13ZxFi/E
 w4SFkjF+QufPwDGEEhmt7M8TpUKffQE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-lX7iFzYyPlmd8sTiiq0pqw-1; Tue, 18 May 2021 06:09:30 -0400
X-MC-Unique: lX7iFzYyPlmd8sTiiq0pqw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C8BF802B78;
 Tue, 18 May 2021 10:09:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-0.ams2.redhat.com
 [10.36.114.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 663FC5D703;
 Tue, 18 May 2021 10:09:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BBDEF180079B; Tue, 18 May 2021 12:09:25 +0200 (CEST)
Date: Tue, 18 May 2021 12:09:25 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Subject: Re: [PATCH 1/3] drm/virtio: Fixes a potential NULL pointer
 dereference on probe failure
Message-ID: <20210518100925.uvddw6y5ya4ddope@sirius.home.kraxel.org>
References: <20210517084913.403-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517084913.403-1-xieyongji@bytedance.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 17, 2021 at 04:49:11PM +0800, Xie Yongji wrote:
> The dev->dev_private might not be allocated if virtio_gpu_pci_quirk()
> or virtio_gpu_init() failed. In this case, we should avoid the cleanup
> in virtio_gpu_release().

Pushed all three to drm-misc-next.

thanks,
  Gerd


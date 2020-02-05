Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A02615298A
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 12:00:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE4D6F547;
	Wed,  5 Feb 2020 11:00:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB0136F549
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 11:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580900407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=N7yIwRjgsyZK3/TJwc6yC4On/1ER+DWw2XdE8QprL8o=;
 b=PUPtDAyd41IwCa9H3QBWLfPazpqSp0kHfhC4NTFew+Rs6WR6OCfxw3mLm1n7EI+1OHFey8
 2kHk/Tln6EYoKyVxjMM1sQCD1QYpLINL9hEnWaNeUXroD2GkyrBaKXovOnbs/Lce7Ax/1M
 qZT6Xoyla+a5YAe/xlsEPblB7sEpNkQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-GXoAviTcPY-ovdj2A5Wekw-1; Wed, 05 Feb 2020 06:00:03 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B83551005F6C;
 Wed,  5 Feb 2020 10:59:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C9D7790CC;
 Wed,  5 Feb 2020 10:59:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 476399D1E; Wed,  5 Feb 2020 11:59:55 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/4] drm/virtio: rework backing storage handling
Date: Wed,  5 Feb 2020 11:59:51 +0100
Message-Id: <20200205105955.28143-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: GXoAviTcPY-ovdj2A5Wekw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, gurchetansingh@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Gerd Hoffmann (4):
  drm/virtio: simplify virtio_gpu_alloc_cmd
  drm/virtio: resource teardown tweaks
  drm/virtio: move mapping teardown to virtio_gpu_cleanup_object()
  drm/virtio: move virtio_gpu_mem_entry initialization to new function

 drivers/gpu/drm/virtio/virtgpu_drv.h    |   9 +-
 drivers/gpu/drm/virtio/virtgpu_object.c |  82 +++++++++++--
 drivers/gpu/drm/virtio/virtgpu_vq.c     | 155 +++++++-----------------
 3 files changed, 124 insertions(+), 122 deletions(-)

-- 
2.18.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

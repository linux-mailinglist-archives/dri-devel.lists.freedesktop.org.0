Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E76215532E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 08:46:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E13A6E9B3;
	Fri,  7 Feb 2020 07:46:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87386E9B3
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 07:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581061606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dQgfR6KV06kDqIBqN65ptfTpoHnEIFXU9Uq4NRTjke4=;
 b=KMgePL0YUcIDGQPM/0c/zalLJEK7xV50882nS2ztFxE8Fmn6xCapDknS7x0GLY0yzgCW0m
 CL1l3RciUe2qyd0dz3Pr0RTMAR+I8l338/I0TEKy2gZcsmBhD59vM4WdR29IdRJHTFjKNu
 bc0aRUXqpfhSvtnr8sUrYMf+vL0aYss=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-6Rbjp085MO-NcH9Wfy9oeg-1; Fri, 07 Feb 2020 02:46:42 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBE3E800D54;
 Fri,  7 Feb 2020 07:46:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1DE9790D8;
 Fri,  7 Feb 2020 07:46:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5417331F2A; Fri,  7 Feb 2020 08:46:38 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/4] drm/virtio: rework backing storage handling
Date: Fri,  7 Feb 2020 08:46:34 +0100
Message-Id: <20200207074638.26386-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: 6Rbjp085MO-NcH9Wfy9oeg-1
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

 drivers/gpu/drm/virtio/virtgpu_drv.h    |  10 +-
 drivers/gpu/drm/virtio/virtgpu_object.c |  88 ++++++++++++--
 drivers/gpu/drm/virtio/virtgpu_vq.c     | 152 ++++++------------------
 3 files changed, 124 insertions(+), 126 deletions(-)

-- 
2.18.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

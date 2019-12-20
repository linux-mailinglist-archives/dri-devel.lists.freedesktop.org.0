Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 751A3127A66
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2019 12:59:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA6916EC14;
	Fri, 20 Dec 2019 11:59:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F656EC13
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 11:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576843182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=on7M6DYkL3LN7Af9v033QH5Z3XPAJIZt0Dy7GNDlSpI=;
 b=Cdx0k5ZSsOCJARs/jWuMTg9CQz9ttpRIAhuu7henpmBrm5HqsfftFD6FNEfN1EP4lCmP+k
 Kg6EJA3TJUlHgodpJe9aeNhU5zjuZochBUWEGJzH8vHiboglrF0beLaD54WRsfNlnu6Qmu
 hIL+moV/BjVfHJ0Xpub9PaEun81VapE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-2DSfQ71QPcyrye-h0oHKYg-1; Fri, 20 Dec 2019 06:59:39 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D29A7107ACC5
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 11:59:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-98.ams2.redhat.com
 [10.36.116.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3730C60BEC;
 Fri, 20 Dec 2019 11:59:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 617993F13C; Fri, 20 Dec 2019 12:59:35 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/4] drm: add release callbacks to qemu drivers.
Date: Fri, 20 Dec 2019 12:59:31 +0100
Message-Id: <20191220115935.15152-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 2DSfQ71QPcyrye-h0oHKYg-1
X-Mimecast-Spam-Score: 0
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Gerd Hoffmann (3):
  drm/cirrus: add drm_driver.release callback.
  drm/virtio: add drm_driver.release callback.
  drm/qxl: add drm_driver.release callback.

Gurchetan Singh (1):
  drm/bochs: add drm_driver.release callback.

 drivers/gpu/drm/virtio/virtgpu_drv.h |  1 +
 drivers/gpu/drm/bochs/bochs_drv.c    |  9 +++++++--
 drivers/gpu/drm/cirrus/cirrus.c      | 17 ++++++++++++-----
 drivers/gpu/drm/qxl/qxl_drv.c        | 21 ++++++++++++++-------
 drivers/gpu/drm/qxl/qxl_kms.c        |  8 ++++----
 drivers/gpu/drm/virtio/virtgpu_drv.c |  4 ++++
 drivers/gpu/drm/virtio/virtgpu_kms.c |  5 +++++
 drivers/gpu/drm/virtio/virtgpu_vq.c  |  8 ++++++--
 8 files changed, 53 insertions(+), 20 deletions(-)

-- 
2.18.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

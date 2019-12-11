Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8484D11A5B8
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 09:18:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D1206EA88;
	Wed, 11 Dec 2019 08:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C006D6EA88
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 08:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576052296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7CU/WlAtjLQAVnDOlGUg1AmODiD0ggZlJebLCB9n44s=;
 b=cziyXSoEa9jlWB5mFuKPgGhrPUzXEWlGj6z1UgIJgsvbdHu1uCrSPmLiTDo4PXLwRKCDnb
 boBDGjv71mVt1FMU5gQuzaUNE+H9mq5M4cfMcFtQgP0Ir2YOidqT4RwKpGmZwLww/9KION
 9BxgALdjpsmxCL0fLK+9cFZvh2YTUTs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-85q3rVkWMvubiodk_6ybyg-1; Wed, 11 Dec 2019 03:18:14 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03F0918AAFA3;
 Wed, 11 Dec 2019 08:18:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 515A060BE1;
 Wed, 11 Dec 2019 08:18:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9EAC916E08; Wed, 11 Dec 2019 09:18:10 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] drm/virtio: fix mmap page attributes
Date: Wed, 11 Dec 2019 09:18:08 +0100
Message-Id: <20191211081810.20079-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 85q3rVkWMvubiodk_6ybyg-1
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, gurchetansingh@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v2: make shmem helper caching configurable.

Gerd Hoffmann (2):
  drm/shmem: add support for per object caching attributes
  drm/virtio: fix mmap page attributes

 include/drm/drm_gem_shmem_helper.h      | 12 ++++++++++++
 drivers/gpu/drm/drm_gem_shmem_helper.c  | 24 +++++++++++++++++++++---
 drivers/gpu/drm/virtio/virtgpu_object.c |  1 +
 3 files changed, 34 insertions(+), 3 deletions(-)

-- 
2.18.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

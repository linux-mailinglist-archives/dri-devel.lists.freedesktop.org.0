Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F211159055
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 14:51:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFCD36E4C9;
	Tue, 11 Feb 2020 13:50:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B29626E4C9
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 13:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581429056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LA/xKvKtWDkPcF5FkG8GiNmoITjnbkXzXw85ObFsfi4=;
 b=Cj9x6MPGdVOd9x2EWlVrrSV8QJdlIeaUnRFxCkIqlXejJI+Uc1HUTSMghEW74qfHHtwz96
 Te3N96XAgvhOPCtggaMq3e1f2naJfMmQGJz4Am86tJBpXvqw22ZCfMW8NuN2UeGcEfj5JR
 xOKLY/FJ5Fx07ChDNN3eX9AKynx3jfE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-3iBq8J8GN1ukYMofgze32g-1; Tue, 11 Feb 2020 08:50:52 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AAAB107ACC4;
 Tue, 11 Feb 2020 13:50:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD5CE10021B3;
 Tue, 11 Feb 2020 13:50:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E4DFA17447; Tue, 11 Feb 2020 14:50:47 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/virtio: locking/reservation fixes
Date: Tue, 11 Feb 2020 14:50:45 +0100
Message-Id: <20200211135047.22261-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 3iBq8J8GN1ukYMofgze32g-1
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



Gerd Hoffmann (2):
  drm/virtio: fix virtio_gpu_execbuffer_ioctl locking
  drm/virtio: fix virtio_gpu_cursor_plane_update().

 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 20 ++++++++++----------
 drivers/gpu/drm/virtio/virtgpu_plane.c |  1 +
 2 files changed, 11 insertions(+), 10 deletions(-)

-- 
2.18.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

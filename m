Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D974FB76F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 11:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0300510F7C9;
	Mon, 11 Apr 2022 09:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 850BE10F7C9;
 Mon, 11 Apr 2022 09:26:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 255D6B81195;
 Mon, 11 Apr 2022 09:26:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DACDC385A3;
 Mon, 11 Apr 2022 09:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1649669174;
 bh=sTQUBd7oiAGHa3dSrCFnBIdD/YCqlpDwi9J4nKbD5Ik=;
 h=Subject:To:Cc:From:Date:From;
 b=wt5kElmC1rBlGewGNxEGKK9qk3yjxPJGERvDF4E7Hh00KtkPYyBWZub2FYkflXqVP
 Rj/WOsxJ9vX4Qv520V7V4YlRkga1/DHR2H6MG/+aw5sWDGKFF7N56490UBQkxXMRbr
 mDHKQg5IYCb9dz3niNGtqN4C1O12marrnyqJnz2c=
Subject: Patch "drm/amdkfd: Create file descriptor after client is added to
 smi_clients list" has been added to the 5.17-stable tree
To: Felix.Kuehling@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, lee.jones@linaro.org
From: <gregkh@linuxfoundation.org>
Date: Mon, 11 Apr 2022 11:25:25 +0200
Message-ID: <16496691253594@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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
Cc: stable-commits@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    drm/amdkfd: Create file descriptor after client is added to smi_clients list

to the 5.17-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-amdkfd-create-file-descriptor-after-client-is-added-to-smi_clients-list.patch
and it can be found in the queue-5.17 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From e79a2398e1b2d47060474dca291542368183bc0f Mon Sep 17 00:00:00 2001
From: Lee Jones <lee.jones@linaro.org>
Date: Thu, 31 Mar 2022 13:21:17 +0100
Subject: drm/amdkfd: Create file descriptor after client is added to smi_clients list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lee Jones <lee.jones@linaro.org>

commit e79a2398e1b2d47060474dca291542368183bc0f upstream.

This ensures userspace cannot prematurely clean-up the client before
it is fully initialised which has been proven to cause issues in the
past.

Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c |   24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

--- a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
@@ -268,15 +268,6 @@ int kfd_smi_event_open(struct kfd_dev *d
 		return ret;
 	}
 
-	ret = anon_inode_getfd(kfd_smi_name, &kfd_smi_ev_fops, (void *)client,
-			       O_RDWR);
-	if (ret < 0) {
-		kfifo_free(&client->fifo);
-		kfree(client);
-		return ret;
-	}
-	*fd = ret;
-
 	init_waitqueue_head(&client->wait_queue);
 	spin_lock_init(&client->lock);
 	client->events = 0;
@@ -286,5 +277,20 @@ int kfd_smi_event_open(struct kfd_dev *d
 	list_add_rcu(&client->list, &dev->smi_clients);
 	spin_unlock(&dev->smi_lock);
 
+	ret = anon_inode_getfd(kfd_smi_name, &kfd_smi_ev_fops, (void *)client,
+			       O_RDWR);
+	if (ret < 0) {
+		spin_lock(&dev->smi_lock);
+		list_del_rcu(&client->list);
+		spin_unlock(&dev->smi_lock);
+
+		synchronize_rcu();
+
+		kfifo_free(&client->fifo);
+		kfree(client);
+		return ret;
+	}
+	*fd = ret;
+
 	return 0;
 }


Patches currently in stable-queue which might be from lee.jones@linaro.org are

queue-5.17/drm-amdkfd-create-file-descriptor-after-client-is-added-to-smi_clients-list.patch

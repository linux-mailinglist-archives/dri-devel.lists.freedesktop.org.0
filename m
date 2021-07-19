Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FC83CD578
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 15:07:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6891C6E123;
	Mon, 19 Jul 2021 13:06:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B09D6E123
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 13:06:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C36486100C;
 Mon, 19 Jul 2021 13:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1626700018;
 bh=G+BP3jmD1IRAwERIozsr5mR6/DhD1QsXpZb2kFJR3YU=;
 h=Subject:To:Cc:From:Date:From;
 b=Fkp6zoASAOZFDyfEUWYJJ0ivwSCuHQhmrHLeugR9X+nYlKP/8UU63mFaDvytMJG13
 sZ8ekD446R6AYXiJgO/JWf/F+gSph3go/vwYdgmDCn5qfa0WVD4Bm1sMHb/bk9pUYj
 C+A0N2r5DxZzOBf6jqrd09hUze/u2iB4PJfH7M7Y=
Subject: Patch "drm/dp_mst: Add missing drm parameters to recently added call
 to drm_dbg_kms()" has been added to the 5.12-stable tree
To: Wayne.Lin@amd.com, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jose.souza@intel.com, lyude@redhat.com
From: <gregkh@linuxfoundation.org>
Date: Mon, 19 Jul 2021 15:06:38 +0200
Message-ID: <1626699998186183@kroah.com>
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

    drm/dp_mst: Add missing drm parameters to recently added call to drm_dbg_kms()

to the 5.12-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-dp_mst-add-missing-drm-parameters-to-recently-added-call-to-drm_dbg_kms.patch
and it can be found in the queue-5.12 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 24ff3dc18b99c4b912ab1746e803ddb3be5ced4c Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Wed, 16 Jun 2021 12:44:15 -0700
Subject: drm/dp_mst: Add missing drm parameters to recently added call to drm_dbg_kms()
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: José Roberto de Souza <jose.souza@intel.com>

commit 24ff3dc18b99c4b912ab1746e803ddb3be5ced4c upstream.

Commit 3769e4c0af5b ("drm/dp_mst: Avoid to mess up payload table by
ports in stale topology") added to calls to drm_dbg_kms() but it
missed the first parameter, the drm device breaking the build.

Fixes: 3769e4c0af5b ("drm/dp_mst: Avoid to mess up payload table by ports in stale topology")
Cc: Wayne Lin <Wayne.Lin@amd.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20210616194415.36926-1-jose.souza@intel.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/drm_dp_mst_topology.c |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -3385,7 +3385,9 @@ int drm_dp_update_payload_part1(struct d
 			mutex_unlock(&mgr->lock);
 
 			if (skip) {
-				drm_dbg_kms("Virtual channel %d is not in current topology\n", i);
+				drm_dbg_kms(mgr->dev,
+					    "Virtual channel %d is not in current topology\n",
+					    i);
 				continue;
 			}
 			/* Validated ports don't matter if we're releasing
@@ -3400,7 +3402,8 @@ int drm_dp_update_payload_part1(struct d
 						payload->start_slot = req_payload.start_slot;
 						continue;
 					} else {
-						drm_dbg_kms("Fail:set payload to invalid sink");
+						drm_dbg_kms(mgr->dev,
+							    "Fail:set payload to invalid sink");
 						mutex_unlock(&mgr->payload_lock);
 						return -EINVAL;
 					}


Patches currently in stable-queue which might be from jose.souza@intel.com are

queue-5.12/drm-dp_mst-add-missing-drm-parameters-to-recently-added-call-to-drm_dbg_kms.patch

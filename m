Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F311A00AD
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 00:13:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA3D6E4D4;
	Mon,  6 Apr 2020 22:13:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7B66E4DD
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 22:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586211189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=61pSeHFI0mHGhKeOKlyyVpQ4t+B+NWcRA1rpl6V74kU=;
 b=OQSSHqaZBEdM5XiTiJcD6R9zlxEYsQdCCfRN70XLZlQs77Aj5W3bMgV5jpEFXGhZkkpFcr
 RwCFX8a6yB/84IFvfj2oIkUHDwngyfW25FVTRuQ/R/ki4JYkGxfMbq3bQTvrBujQWvAtTh
 TDrQUnvHZ4/EcPKdnLP+XMYk68vXnJE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-ygKCmBA-PjC_Bdt7SrkVcw-1; Mon, 06 Apr 2020 18:13:08 -0400
X-MC-Unique: ygKCmBA-PjC_Bdt7SrkVcw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61FEE18AB2CC;
 Mon,  6 Apr 2020 22:13:06 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-117-12.rdu2.redhat.com [10.10.117.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FB4E608E1;
 Mon,  6 Apr 2020 22:13:05 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/4] drm/dp_mst: Reformat drm_dp_check_act_status() a bit
Date: Mon,  6 Apr 2020 18:12:51 -0400
Message-Id: <20200406221253.1307209-3-lyude@redhat.com>
In-Reply-To: <20200406221253.1307209-1-lyude@redhat.com>
References: <20200406221253.1307209-1-lyude@redhat.com>
MIME-Version: 1.0
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
Cc: Todd Previte <tprevite@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just add a bit more line wrapping, get rid of some extraneous
whitespace, remove an unneeded goto label, and move around some variable
declarations. No functional changes here.

Signed-off-by: Lyude Paul <lyude@redhat.com>
[this isn't a fix, but it's needed for the fix that comes after this]
Fixes: ad7f8a1f9ced ("drm/helper: add Displayport multi-stream helper (v0.6)")
Cc: Sean Paul <sean@poorly.run>
Cc: <stable@vger.kernel.org> # v3.17+
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 828ca63cc576..c83adbdfc1cd 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -4473,33 +4473,31 @@ static int drm_dp_dpcd_write_payload(struct drm_dp_mst_topology_mgr *mgr,
  */
 int drm_dp_check_act_status(struct drm_dp_mst_topology_mgr *mgr)
 {
+	int count = 0, ret;
 	u8 status;
-	int ret;
-	int count = 0;
 
 	do {
-		ret = drm_dp_dpcd_readb(mgr->aux, DP_PAYLOAD_TABLE_UPDATE_STATUS, &status);
-
+		ret = drm_dp_dpcd_readb(mgr->aux,
+					DP_PAYLOAD_TABLE_UPDATE_STATUS,
+					&status);
 		if (ret < 0) {
-			DRM_DEBUG_KMS("failed to read payload table status %d\n", ret);
-			goto fail;
+			DRM_DEBUG_KMS("failed to read payload table status %d\n",
+				      ret);
+			return ret;
 		}
 
 		if (status & DP_PAYLOAD_ACT_HANDLED)
 			break;
 		count++;
 		udelay(100);
-
 	} while (count < 30);
 
 	if (!(status & DP_PAYLOAD_ACT_HANDLED)) {
-		DRM_DEBUG_KMS("failed to get ACT bit %d after %d retries\n", status, count);
-		ret = -EINVAL;
-		goto fail;
+		DRM_DEBUG_KMS("failed to get ACT bit %d after %d retries\n",
+			      status, count);
+		return -EINVAL;
 	}
 	return 0;
-fail:
-	return ret;
 }
 EXPORT_SYMBOL(drm_dp_check_act_status);
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

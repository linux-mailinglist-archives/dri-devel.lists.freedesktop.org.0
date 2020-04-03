Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C7119DEFB
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 22:08:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 133F26EC76;
	Fri,  3 Apr 2020 20:08:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E0DE6EC73
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 20:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585944495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p7uc0abaBqg3jPG1aiHeqKdJXYGxUjBqIactIjvdhvw=;
 b=et256fiQ7j4YmuxdEHzeOaqdWUvValS0FAc/1N1fvIfUo/yAW+dVuNYlVFlgA7S0mZJpHj
 9h0K2rqiFsERxiO+mRkrclwgjcnHh4yukhE7KuO/jcWNGFEZjhB0CoJEZI0qDypUdLcKCt
 gdH6xYfxULCigSEPt8Mc/kisXrSQdVM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-nDPF8ENjP6myDwElzna6ag-1; Fri, 03 Apr 2020 16:08:11 -0400
X-MC-Unique: nDPF8ENjP6myDwElzna6ag-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8B9D801A00;
 Fri,  3 Apr 2020 20:08:09 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-117-203.rdu2.redhat.com [10.10.117.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 916095C28F;
 Fri,  3 Apr 2020 20:08:06 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/dp_mst: Reformat drm_dp_check_act_status() a bit
Date: Fri,  3 Apr 2020 16:07:54 -0400
Message-Id: <20200403200757.886443-3-lyude@redhat.com>
In-Reply-To: <20200403200757.886443-1-lyude@redhat.com>
References: <20200403200757.886443-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
index 2b9ce965f044..7aaf184a2e5f 100644
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

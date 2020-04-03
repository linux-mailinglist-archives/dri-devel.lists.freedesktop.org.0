Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BFD19DEF9
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 22:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EDED6EC75;
	Fri,  3 Apr 2020 20:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D16406EC73
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 20:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585944491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LMriJrQ1riXNc8bvUY/SAdc3wYKQUG6oet7C9PfKLgg=;
 b=VDaWEnWaHywJsluI3ZyD/K3Gl26vLkh84/Lrf/M8TtVSQjoW1efsdd4KFjfoI/5aw4vpta
 9qQRYDJSSnFX0z9V7qQf8oSss6NekdtiJa5syddTCGp4fU8Ya9fOrGqje8EtHe6E3GSyvp
 +RuyqUVBqitNPu+rNpJwoAR4KjD/uAE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-fQ1kpNknOHOzZ_y8xkbZXw-1; Fri, 03 Apr 2020 16:08:07 -0400
X-MC-Unique: fQ1kpNknOHOzZ_y8xkbZXw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43D3B8017F4;
 Fri,  3 Apr 2020 20:08:06 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-117-203.rdu2.redhat.com [10.10.117.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BFA675C64E;
 Fri,  3 Apr 2020 20:08:04 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] drm/dp_mst: Improve kdocs for drm_dp_check_act_status()
Date: Fri,  3 Apr 2020 16:07:53 -0400
Message-Id: <20200403200757.886443-2-lyude@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No functional changes.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Sean Paul <sean@poorly.run>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 10d0315af513..2b9ce965f044 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -4462,10 +4462,14 @@ static int drm_dp_dpcd_write_payload(struct drm_dp_mst_topology_mgr *mgr,
 
 
 /**
- * drm_dp_check_act_status() - Check ACT handled status.
+ * drm_dp_check_act_status() - Polls for ACT handled status.
  * @mgr: manager to use
  *
- * Check the payload status bits in the DPCD for ACT handled completion.
+ * Tries waiting for the MST hub to finish updating it's payload table by
+ * polling for the ACT handled bit.
+ *
+ * Returns:
+ * 0 if the ACT was handled in time, negative error code on failure.
  */
 int drm_dp_check_act_status(struct drm_dp_mst_topology_mgr *mgr)
 {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

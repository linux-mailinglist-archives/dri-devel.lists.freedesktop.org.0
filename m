Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8244673AE
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 10:08:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27FFA738C1;
	Fri,  3 Dec 2021 09:08:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 713 seconds by postgrey-1.36 at gabe;
 Fri, 03 Dec 2021 09:08:02 UTC
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25106738C0
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 09:08:01 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1B3849ZO003734;
 Fri, 3 Dec 2021 09:59:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : subject
 : date : message-id : mime-version : content-type; s=selector1;
 bh=xJbkzbTOcFXwhysz0nkb+xey1rfJAjwt5y6oXXuNsqE=;
 b=XyrZ0pSc2HHP9AroIS5gL/rjovV0b7DJJMkICoxtIIJYgRe4mR2D+CweievkEFg+40wt
 D4vyjhwjnIXVAk+EknkTh+rKqSGZGVp4L/oEC84o8stoCJ6hk9jO44ljatXXs9hGnUKS
 LdFuzshA97oqXqXk2a1OKfOIQrABc56xSWyvkdotUDFQji13ZZbJ13inexzCM9dD5exq
 YLV3bx2bj+B9x12z8Jy82eujeXX/zO+fMWYlAvqMWFLFCDp+l7OsR6hX2gxUNyEMFfqu
 6FBCGvoivRcp81/DUltFmCf1iHqXk/jfaM5wVaDcRfnVceyWoK+VVQSq5BQ1KsRmdgEm VA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cpxs3ms3r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 09:59:34 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A6B32100034;
 Fri,  3 Dec 2021 09:59:33 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9F233226FC9;
 Fri,  3 Dec 2021 09:59:33 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 3 Dec 2021 09:59:33
 +0100
From: Yannick Fertre <yannick.fertre@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm: bridge: remove error message for EPROBE_DEFER in
 bridge_attach
Date: Fri, 3 Dec 2021 09:59:31 +0100
Message-ID: <20211203085931.11693-1-yannick.fertre@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-03_05,2021-12-02_01,2021-12-02_01
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Probe deferred is not an error, don't print it.

Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
---
 drivers/gpu/drm/drm_bridge.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c96847fc0ebc..cef0a62ef5d0 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -288,11 +288,13 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 	list_del(&bridge->chain_node);
 
 #ifdef CONFIG_OF
-	DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d\n",
-		  bridge->of_node, encoder->name, ret);
+	if (ret != -EPROBE_DEFER)
+		DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d\n",
+			  bridge->of_node, encoder->name, ret);
 #else
-	DRM_ERROR("failed to attach bridge to encoder %s: %d\n",
-		  encoder->name, ret);
+	if (ret != -EPROBE_DEFER)
+		DRM_ERROR("failed to attach bridge to encoder %s: %d\n",
+			  encoder->name, ret);
 #endif
 
 	return ret;
-- 
2.17.1


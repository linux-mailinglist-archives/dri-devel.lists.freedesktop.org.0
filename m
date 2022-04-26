Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9BC50FEB7
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 15:19:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0578610F042;
	Tue, 26 Apr 2022 13:19:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F17B310F042
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 13:19:52 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23QAWpT4025876;
 Tue, 26 Apr 2022 15:19:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=6vDfFWt5DqxBN+l8Zc4TuK5apUkvbBDEvZBSbTNYP4k=;
 b=AIDJ7gPwxst+Seoxpcd7bsziDxkHxoj7xIQqsfHCvbY6fZ41wJXRpILmGqV4yZcc0Z42
 yyZ9wpdwUJ0lqO/G9PEtiae9GDHo81rKSd+L96wU3tX4z7egeRTaxAi5iI2rr/GsRMeA
 hURrhTW2GNuOZMvw1MUWNOHdljPGtuOre8L+smcNHuv1ygN0oOxzLBaoJRlmUR/rqpfp
 PxlLnrdd91Uc8qXFZf2SXK5OqVT3tHU7SMTUmP9IBrY+tjegYPGiRnv1Gal4Dm+uoEjJ
 IxkQKZyqFddsqxvpejqu+C1odVS7W8Dej6uLizeKeX/XbUwVHQJNmuXxEJpOyqFZOMCO 8g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fm8t1q5vv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Apr 2022 15:19:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7874A10002A;
 Tue, 26 Apr 2022 15:19:42 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 64F4E2278AD;
 Tue, 26 Apr 2022 15:19:42 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 26 Apr 2022 15:19:41
 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm: fix typo in comment
Date: Tue, 26 Apr 2022 15:19:12 +0200
Message-ID: <20220426131912.3850354-1-raphael.gallais-pou@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-26_02,2022-04-26_02,2022-02-23_01
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix typo in a doxygen comment (replaced green by blue) in drm_color_mgmt.c

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 drivers/gpu/drm/drm_color_mgmt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 9079fbe21d2f..17c6c3eefcd6 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -259,7 +259,7 @@ static bool drm_crtc_supports_legacy_gamma(struct drm_crtc *crtc)
  * @crtc: CRTC object
  * @red: red correction table
  * @green: green correction table
- * @blue: green correction table
+ * @blue: blue correction table
  * @size: size of the tables
  * @ctx: lock acquire context
  *
-- 
2.25.1


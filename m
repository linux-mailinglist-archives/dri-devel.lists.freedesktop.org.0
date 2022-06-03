Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EF153CC0D
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 17:11:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD631139A7;
	Fri,  3 Jun 2022 15:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B2D11399C
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 15:11:53 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 253AQph1032463;
 Fri, 3 Jun 2022 17:11:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : subject
 : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=e7pjrqv87DPLuFOtrjphDGSnoNc9nvojEopc8c3+tCs=;
 b=PyO1QybQv/tDV+iLPyTv0umboVADZZUk801bnXbZMbFEkE695MhQKW48keYFvZFW5hCK
 Lr4f+lsHJrR2Le3QoLALN7luhA0yaDlX/sv9riosJP1Gp83H870fslA1l6lzvK9yEJ3K
 Z6NNh4w+UEcEyFoYgSh3AyBfUJhaJ3Dme4f2JbceHsIf0uU3DL2D6JJJMVn0Yfyj9b/M
 MZBjng12IeEpnHj8eqTv1BiajJ8PGLBLYAYRCph7uq6+tg65YejaUjFVTV7aMnkTinSh
 XGIo9zNFxUtX7wH3wjyt9Z/TcPIqH1p5uxbqq6pBflgX5pPITcP1LaMAP+SvvYmd55rg ng== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3get03re8t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Jun 2022 17:11:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9A0C140103;
 Fri,  3 Jun 2022 15:44:12 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B14A721ED29;
 Fri,  3 Jun 2022 15:43:39 +0200 (CEST)
Received: from localhost (10.75.127.51) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 3 Jun
 2022 15:43:39 +0200
From: Yannick Fertre <yannick.fertre@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/stm: ltdc: fix various coding-style warnings
Date: Fri, 3 Jun 2022 15:43:34 +0200
Message-ID: <20220603134334.592805-1-yannick.fertre@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-03_05,2022-06-03_01,2022-02-23_01
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

Fix issues reported by checkpatch.pl:
- Braces {} should be used on all arms
- Blank lines

Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
---
 drivers/gpu/drm/stm/ltdc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index a4098aaff243..6a9f613839b5 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -908,9 +908,9 @@ static void ltdc_crtc_mode_set_nofb(struct drm_crtc *crtc)
 		drm_connector_list_iter_end(&iter);
 	}
 
-	if (bridge && bridge->timings)
+	if (bridge && bridge->timings) {
 		bus_flags = bridge->timings->input_bus_flags;
-	else if (connector) {
+	} else if (connector) {
 		bus_flags = connector->display_info.bus_flags;
 		if (connector->display_info.num_bus_formats)
 			bus_formats = connector->display_info.bus_formats[0];
@@ -1917,7 +1917,6 @@ int ltdc_load(struct drm_device *ddev)
 			DRM_ERROR("Failed to register LTDC interrupt\n");
 			goto err;
 		}
-
 	}
 
 	crtc = devm_kzalloc(dev, sizeof(*crtc), GFP_KERNEL);
-- 
2.25.1


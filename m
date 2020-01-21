Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F46E143A91
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 11:14:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3B26EC40;
	Tue, 21 Jan 2020 10:14:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123A36EC40
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 10:14:03 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00LA7m7m015244; Tue, 21 Jan 2020 11:14:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=aeYoT+FbX2uK00Gipe/mKHNPFAN0KIzPJU70uie272A=;
 b=ChmW7+hAhBko1pQ9BTS2bhY1LjykTUkISaGS7PWDj5KLriquSRvz+s+M9dw1XZP/Uuzb
 W7CtFP0PqYWrVGROSZpfw5W/vGGSpE/dQdPeVNzsgTWB5Fwq82pP6YkToiY7+0yQH4PI
 B0yBhCj64+gE4+LFQPIQX+mQ0us1e3rwNJkuGAnvvKsDx4nvR409uthMq1eRux7dud4a
 wMUwrdG+97ASDBha3lKKmSghRi0T7JC64Ro0XNi8PC2ct0z621WBZR5G0fntCYFy9ERj
 7Kwn9vBT0F+k1fc/Vjiq5qZ9Q6WhtMQXMsKgjZJY92tt9suJwiV/cgPM7l0LEhZ3ak22 pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xkr1dx2p6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jan 2020 11:14:01 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D20EC100038;
 Tue, 21 Jan 2020 11:13:55 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7F0332B1872;
 Tue, 21 Jan 2020 11:13:55 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 21 Jan 2020 11:13:54 +0100
From: Yannick Fertre <yannick.fertre@st.com>
To: Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu
 <philippe.cornu@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/stm: ltdc: add number of interrupts
Date: Tue, 21 Jan 2020 11:13:52 +0100
Message-ID: <1579601632-7001-1-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-21_02:2020-01-21,
 2020-01-21 signatures=0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The number of interrupts depends on the ltdc version.
Don't try to get interrupt which not exist, avoiding
kernel warning messages.

Signed-off-by: Yannick Fertre <yannick.fertre@st.com>
---
 drivers/gpu/drm/stm/ltdc.c | 30 +++++++++++++++---------------
 drivers/gpu/drm/stm/ltdc.h |  1 +
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index c2815e8..58092b0 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -1146,12 +1146,14 @@ static int ltdc_get_caps(struct drm_device *ddev)
 		ldev->caps.pad_max_freq_hz = 90000000;
 		if (ldev->caps.hw_version == HWVER_10200)
 			ldev->caps.pad_max_freq_hz = 65000000;
+		ldev->caps.nb_irq = 2;
 		break;
 	case HWVER_20101:
 		ldev->caps.reg_ofs = REG_OFS_4;
 		ldev->caps.pix_fmt_hw = ltdc_pix_fmt_a1;
 		ldev->caps.non_alpha_only_l1 = false;
 		ldev->caps.pad_max_freq_hz = 150000000;
+		ldev->caps.nb_irq = 4;
 		break;
 	default:
 		return -ENODEV;
@@ -1251,13 +1253,21 @@ int ltdc_load(struct drm_device *ddev)
 	reg_clear(ldev->regs, LTDC_IER,
 		  IER_LIE | IER_RRIE | IER_FUIE | IER_TERRIE);
 
-	for (i = 0; i < MAX_IRQ; i++) {
+	ret = ltdc_get_caps(ddev);
+	if (ret) {
+		DRM_ERROR("hardware identifier (0x%08x) not supported!\n",
+			  ldev->caps.hw_version);
+		goto err;
+	}
+
+	DRM_DEBUG_DRIVER("ltdc hw version 0x%08x\n", ldev->caps.hw_version);
+
+	for (i = 0; i < ldev->caps.nb_irq; i++) {
 		irq = platform_get_irq(pdev, i);
-		if (irq == -EPROBE_DEFER)
+		if (irq < 0) {
+			ret = irq;
 			goto err;
-
-		if (irq < 0)
-			continue;
+		}
 
 		ret = devm_request_threaded_irq(dev, irq, ltdc_irq,
 						ltdc_irq_thread, IRQF_ONESHOT,
@@ -1268,16 +1278,6 @@ int ltdc_load(struct drm_device *ddev)
 		}
 	}
 
-
-	ret = ltdc_get_caps(ddev);
-	if (ret) {
-		DRM_ERROR("hardware identifier (0x%08x) not supported!\n",
-			  ldev->caps.hw_version);
-		goto err;
-	}
-
-	DRM_DEBUG_DRIVER("ltdc hw version 0x%08x\n", ldev->caps.hw_version);
-
 	/* Add endpoints panels or bridges if any */
 	for (i = 0; i < MAX_ENDPOINTS; i++) {
 		if (panel[i]) {
diff --git a/drivers/gpu/drm/stm/ltdc.h b/drivers/gpu/drm/stm/ltdc.h
index a1ad0ae..310e87f 100644
--- a/drivers/gpu/drm/stm/ltdc.h
+++ b/drivers/gpu/drm/stm/ltdc.h
@@ -19,6 +19,7 @@ struct ltdc_caps {
 	const u32 *pix_fmt_hw;	/* supported pixel formats */
 	bool non_alpha_only_l1; /* non-native no-alpha formats on layer 1 */
 	int pad_max_freq_hz;	/* max frequency supported by pad */
+	int nb_irq;		/* number of hardware interrupts */
 };
 
 #define LTDC_MAX_LAYER	4
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

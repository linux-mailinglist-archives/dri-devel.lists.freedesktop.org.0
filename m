Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 983EC143ADD
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 11:24:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03286EC44;
	Tue, 21 Jan 2020 10:24:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6321E6EC44
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 10:24:10 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00LANZwU018454; Tue, 21 Jan 2020 11:24:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=pI7AA/Y71uPaqPIJ2pPaaj7cAY0VgViFKDQM2Xpcc1k=;
 b=CiUaDZU4k7zp94wz705BhuSlfRLEp2QM2zhKnKrTogvJGrh5BkF0g98tcECrCnUQoKXg
 n+a38j1ooP1+JMOXMq+DMH3BCRWBP/pqO8dYvr7Sf0t/FFhJHa8tShfgWTiiSrqs6K8e
 XfDJa33JAH+DlNRBwgxCCLuGvMiYllHevBVHWTDHJn7jxuy9oPwvkmEck84VsD77WFpZ
 wcB0ftzbWvbQ+QL8z826tsOlXDP0NOr2NvjSrIwyXBvsfquG1H8p2auONvgLYupu6S+0
 g4mmzqCdf9bx4n0cKpz0BjhIeMT415jkJDXYRauDNUee4SCXNJBdUsJZMsiAX9KrOlEZ Mg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xkssnwsjp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jan 2020 11:24:08 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C8F7D10003D;
 Tue, 21 Jan 2020 11:24:06 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BA1F52B1874;
 Tue, 21 Jan 2020 11:24:06 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 21 Jan 2020 11:24:06 +0100
From: Yannick Fertre <yannick.fertre@st.com>
To: Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu
 <philippe.cornu@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/stm: dsi: stm mipi dsi doesn't print error on probe
 deferral
Date: Tue, 21 Jan 2020 11:24:05 +0100
Message-ID: <1579602245-7577-1-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG6NODE1.st.com
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

From: Etienne Carriere <etienne.carriere@st.com>

Change DSI driver to not print an error trace when probe
is deferred for a clock resource.

Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
---
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
index 4b16563..2e1f266 100644
--- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
+++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
@@ -377,7 +377,9 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
 	dsi->pllref_clk = devm_clk_get(dev, "ref");
 	if (IS_ERR(dsi->pllref_clk)) {
 		ret = PTR_ERR(dsi->pllref_clk);
-		DRM_ERROR("Unable to get pll reference clock: %d\n", ret);
+		if (ret != -EPROBE_DEFER)
+			DRM_ERROR("Unable to get pll reference clock: %d\n",
+				  ret);
 		goto err_clk_get;
 	}
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

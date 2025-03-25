Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3057DA6EAD2
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 08:47:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8572710E4F6;
	Tue, 25 Mar 2025 07:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from unicom146.biz-email.net (unknown [210.51.26.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5143F10E4F6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 07:47:18 +0000 (UTC)
Received: from jtjnmail201621.home.langchao.com
 by unicom146.biz-email.net ((D)) with ASMTP (SSL) id 202503251546589330;
 Tue, 25 Mar 2025 15:46:58 +0800
Received: from jtjnmail201607.home.langchao.com (10.100.2.7) by
 jtjnmail201621.home.langchao.com (10.100.2.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Mar 2025 15:46:57 +0800
Received: from locahost.localdomain.com (10.94.16.22) by
 jtjnmail201607.home.langchao.com (10.100.2.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Mar 2025 15:46:56 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "Charles Han" <hanchunchao@inspur.com>
Subject: [PATCH] drm/bridge: dw-hdmi-cec: fix inconsistent indenting warning
Date: Tue, 25 Mar 2025 15:46:54 +0800
Message-ID: <20250325074654.3669-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.16.22]
X-ClientProxiedBy: Jtjnmail201613.home.langchao.com (10.100.2.13) To
 jtjnmail201607.home.langchao.com (10.100.2.7)
tUid: 20253251546589baccb332c493b841dce48370d458980
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
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

Fix below inconsistent indenting smatch warning.
smatch warnings:
drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c:336 dw_hdmi_cec_suspend() warn: inconsistent indenting

Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
index 9549dabde941..9d5bded54e8b 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
@@ -333,9 +333,9 @@ static int dw_hdmi_cec_suspend(struct device *dev)
 	struct dw_hdmi_cec *cec = dev_get_drvdata(dev);
 
 	/* store interrupt status/mask registers */
-	 cec->regs_polarity = dw_hdmi_read(cec, HDMI_CEC_POLARITY);
-	 cec->regs_mask = dw_hdmi_read(cec, HDMI_CEC_MASK);
-	 cec->regs_mute_stat0 = dw_hdmi_read(cec, HDMI_IH_MUTE_CEC_STAT0);
+	cec->regs_polarity = dw_hdmi_read(cec, HDMI_CEC_POLARITY);
+	cec->regs_mask = dw_hdmi_read(cec, HDMI_CEC_MASK);
+	cec->regs_mute_stat0 = dw_hdmi_read(cec, HDMI_IH_MUTE_CEC_STAT0);
 
 	return 0;
 }
-- 
2.43.0


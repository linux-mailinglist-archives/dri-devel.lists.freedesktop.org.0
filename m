Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 641CCB4A6CB
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 11:09:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E1F10E66C;
	Tue,  9 Sep 2025 09:09:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="p+tjkMj6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A0B10E66B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 09:09:27 +0000 (UTC)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
 by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58999D4D305755;
 Tue, 9 Sep 2025 04:09:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1757408953;
 bh=gc0/97AjG+cQN4wP/3/woJAn0XVv0CdqoOhUkR8ViwY=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=p+tjkMj60rw8+Uli7z28JuIeNuFsOMLvxQJ80iC+SjbCEykwxmcDt9K/kqnpzSEsx
 Hahvqn8yksAruYKBQ0cP1pkQBM0a4AVhaVeQVKnp7anpqL0vmwxjf5NrCL7EHhpRfE
 +BEK6LtVbloB0tivejBxiUkzvfSOWq2UIPQCws9c=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58999DVA247898
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Tue, 9 Sep 2025 04:09:13 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 9
 Sep 2025 04:09:12 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 9 Sep 2025 04:09:12 -0500
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58998Pkv2399851;
 Tue, 9 Sep 2025 04:09:05 -0500
From: Harikrishna Shenoy <h-shenoy@ti.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <lumag@kernel.org>, <dianders@chromium.org>,
 <andy.yan@rock-chips.com>, <mordan@ispras.ru>, <linux@treblig.org>,
 <viro@zeniv.linux.org.uk>, <aradhya.bhatia@linux.dev>,
 <javierm@redhat.com>, <tomi.valkeinen@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devarsht@ti.com>, <u-kumar1@ti.com>, <s-jain1@ti.com>
CC: <lyude@redhat.com>, <luca.ceresoli@bootlin.com>
Subject: [PATCH v6 5/6] drm/bridge: cadence: cdns-mhdp8546-core: Reduce log
 level for DPCD read/write
Date: Tue, 9 Sep 2025 14:38:23 +0530
Message-ID: <20250909090824.1655537-6-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250909090824.1655537-1-h-shenoy@ti.com>
References: <20250909090824.1655537-1-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

From: Jayesh Choudhary <j-choudhary@ti.com>

Reduce the log level for cdns_mhdp_dpcd_read and cdns_mhdp_dpcd_write
errors in cdns_mhdp_transfer function as in case of failure, there is
flooding of these prints along with other indicators like EDID failure
logs which are fairly intuitive in themselves rendering these error logs
useless.
Also, the caller functions for the cdns_mhdp_transfer in drm_dp_helper.c
(which calls it 32 times), has debug log level in case transfer fails.
So having a superseding log level in cdns_mhdp_transfer seems bad.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 47c657237c37..4fb1db3e030c 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -778,7 +778,7 @@ static ssize_t cdns_mhdp_transfer(struct drm_dp_aux *aux,
 			if (!ret)
 				continue;
 
-			dev_err(mhdp->dev,
+			dev_dbg(mhdp->dev,
 				"Failed to write DPCD addr %u\n",
 				msg->address + i);
 
@@ -788,7 +788,7 @@ static ssize_t cdns_mhdp_transfer(struct drm_dp_aux *aux,
 		ret = cdns_mhdp_dpcd_read(mhdp, msg->address,
 					  msg->buffer, msg->size);
 		if (ret) {
-			dev_err(mhdp->dev,
+			dev_dbg(mhdp->dev,
 				"Failed to read DPCD addr %u\n",
 				msg->address);
 
-- 
2.34.1


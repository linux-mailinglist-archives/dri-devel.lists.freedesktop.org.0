Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97044381756
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 11:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD3876E223;
	Sat, 15 May 2021 09:50:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 417236E223
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 09:50:58 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14F9ooUX015223; Sat, 15 May 2021 09:50:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=2wenIP4PRtmI//nVjFMumKuzna/LNMbkOwCNVqgYZ+A=;
 b=MsbW5sl/d5BBtOV/VxuOpO5yA1dcHGP2iH5VRFTeAqNAo5sz2kjhWqt5NEkYPP/QWgmV
 +AEty+G4mnMuSZ/W45W8WxIgYFeYi0jLsrPLNEZSG5RSBvE/Iuil/kQR51yFMHpXI8If
 ViSZbdT6eRpMBIGBDjo/Hygr5dMk7DhpleTF3LONHxe2ubqyMM4oeQR6r9vaw7DSlvfX
 y2o/Ae/iRrCLa+ySAi5kb1oju0ZgdVFsAU4mkoZ+08nD3zRU6sLkXp4ZRZxVKj8lXBQ/
 ltRRD8qSZhS/EcmK5MBDybVOVlD8MiGieo3I+7FaLK6O20G+RcYI7I5BT7Bv0zbIEfyY rQ== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 38j4qc034y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 15 May 2021 09:50:50 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14F9onOt104264;
 Sat, 15 May 2021 09:50:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 38j641ffhu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 15 May 2021 09:50:49 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14F9nGeE099425;
 Sat, 15 May 2021 09:50:49 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 38j641ffhe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 15 May 2021 09:50:49 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14F9oVI4017322;
 Sat, 15 May 2021 09:50:31 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sat, 15 May 2021 02:50:30 -0700
Date: Sat, 15 May 2021 12:50:23 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Phong LE <ple@baylibre.com>
Subject: [PATCH 1/2] drm: bridge: it66121: fix an error code in it66121_probe()
Message-ID: <YJ+ZX3BdKPAN0pUZ@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-GUID: ZVeIseb27CAkdyVJGUdYBdF7rUYQVh-_
X-Proofpoint-ORIG-GUID: ZVeIseb27CAkdyVJGUdYBdF7rUYQVh-_
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This code is passing the wrong variable to PTR_ERR() so it doesn't
return the correct error code.

Fixes: 988156dc2fc9 ("drm: bridge: add it66121 driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/bridge/ite-it66121.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index d8a60691fd32..6980c9801d0d 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -943,7 +943,7 @@ static int it66121_probe(struct i2c_client *client,
 	ctx->regmap = devm_regmap_init_i2c(client, &it66121_regmap_config);
 	if (IS_ERR(ctx->regmap)) {
 		ite66121_power_off(ctx);
-		return PTR_ERR(ctx);
+		return PTR_ERR(ctx->regmap);
 	}
 
 	regmap_read(ctx->regmap, IT66121_VENDOR_ID0_REG, &vendor_ids[0]);
-- 
2.30.2


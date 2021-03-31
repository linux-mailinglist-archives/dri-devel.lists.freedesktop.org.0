Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D65634FF61
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 13:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C5226EA61;
	Wed, 31 Mar 2021 11:21:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0553F6EA5E
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 11:21:49 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 t5-20020a1c77050000b029010e62cea9deso990281wmi.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 04:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0AE7GiP643db9cRMiA9Z6fxSPW9PnA+qv8yDMUl5/xM=;
 b=COX6mQLUpqRJtL2A6BXvL+ybabQdvRt7K9FRNmb4fRUqB1eqv6oFnJ6jFwNDSE/kmX
 BxhFS4We8ooxmuDdVWYZ7xBNX3ggJ/7GO8Zh6mTCalIkDfIZskWTi7xIEYpTiALWPMHI
 2DKsfDbL3cmM7BVyApJSpQh/bQrQN/U4C9mR4un/vEdQSVrB+ehmRQxrzOU9OJsmdFYG
 LPyqttJeg6Fevl8wZxc68rtUpOYaRwBqOdM8DlklFbfZ4TJkbPWdpvYhYYuJCz9gkNGB
 fD1PbTzKlLQVKGnCK+R/6JLF5FFX13GQckKEomMVOI9ESOYTrlorJTWGY41IZdmIRyOB
 qPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0AE7GiP643db9cRMiA9Z6fxSPW9PnA+qv8yDMUl5/xM=;
 b=k28PIv5EVLapDTBXniEzdaWoYgXpG+iNHF34OH6rsZvrrEoPvl0evhSCf3Gr9e6p7V
 yCbj3F20SOxbuzwEM9X3gow0Cx0nmTbjGqDPRcGZQTD65LHWJDk4s7D+glZt6WGR13gx
 od3CjvDBCwe4UOT0mKuSJsHtwIctsO392L4zEgcfBjIMj2DDfuhIarUnU9I79jeazG+g
 ckXCf/LJR43WscLyOV7ImediPl3CqgULdc3ijrymBaoi+KxbR0lPyeb9hWFsVGGixhH/
 f1zVXTb53wjz6iwSMDwllIt3m8rxxD7PzEpH0Bji2DOZowF7M5xVn4Yz7MkUUKXqdH5J
 aHNg==
X-Gm-Message-State: AOAM531lHfBp98fenegqm259kUHSSBVv8a++cqfvLxEn4mELi+2H9xw0
 iva58+6D0LmfKGvIBk4NH7c=
X-Google-Smtp-Source: ABdhPJxACJy9dlNlMdPu4ztsSK9hiRdkK0Jou9QpgLSUFmAIZa3RyNmeS3smJflGIPWGT65GxvCv7A==
X-Received: by 2002:a05:600c:3515:: with SMTP id
 h21mr2733092wmq.35.1617189707709; 
 Wed, 31 Mar 2021 04:21:47 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb0008bd27007d57ea0d08d946c1.ipv6.abo.wanadoo.fr.
 [2a01:cb00:8bd:2700:7d57:ea0d:8d9:46c1])
 by smtp.gmail.com with ESMTPSA id c11sm4095442wrm.67.2021.03.31.04.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 04:21:47 -0700 (PDT)
From: Adrien Grassein <adrien.grassein@gmail.com>
To: 
Subject: [PATCH v3 1/1] drm/bridge: lt8912b: Fix issues found during static
 analysis
Date: Wed, 31 Mar 2021 13:21:37 +0200
Message-Id: <20210331112137.368641-2-adrien.grassein@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210331112137.368641-1-adrien.grassein@gmail.com>
References: <20210331112137.368641-1-adrien.grassein@gmail.com>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, dan.carpenter@oracle.com,
 Adrien Grassein <adrien.grassein@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some issues where found during static analysis of this driver.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Suggested-by: Dan Carpenter  <dan.carpenter@oracle.com>
Signed-off-by: Adrien Grassein <adrien.grassein@gmail.com>
---
 drivers/gpu/drm/bridge/lontium-lt8912b.c | 27 +++++++++++++++---------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 61491615bad0..dcaceab818ee 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -621,7 +621,8 @@ static int lt8912_parse_dt(struct lt8912 *lt)
 {
 	struct gpio_desc *gp_reset;
 	struct device *dev = lt->dev;
-	int ret = 0;
+	int ret;
+	int data_lanes;
 	struct device_node *port_node;
 	struct device_node *endpoint;
 
@@ -635,13 +636,16 @@ static int lt8912_parse_dt(struct lt8912 *lt)
 	lt->gp_reset = gp_reset;
 
 	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
-	if (IS_ERR(endpoint)) {
-		ret = PTR_ERR(endpoint);
-		goto end;
-	}
+	if (!endpoint)
+		return -ENODEV;
 
-	lt->data_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
+	data_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
 	of_node_put(endpoint);
+	if (data_lanes < 0) {
+		dev_err(lt->dev, "%s: Bad data-lanes property\n", __func__);
+		return lt->data_lanes;
+	}
+	lt->data_lanes = data_lanes;
 
 	lt->host_node = of_graph_get_remote_node(dev->of_node, 0, -1);
 	if (!lt->host_node) {
@@ -658,19 +662,22 @@ static int lt8912_parse_dt(struct lt8912 *lt)
 	}
 
 	lt->hdmi_port = of_drm_find_bridge(port_node);
-	if (IS_ERR(lt->hdmi_port)) {
+	if (!lt->hdmi_port) {
 		dev_err(lt->dev, "%s: Failed to get hdmi port\n", __func__);
-		ret = PTR_ERR(lt->hdmi_port);
-		of_node_put(lt->host_node);
-		goto end;
+		ret = -ENODEV;
+		of_node_put(port_node);
+		goto err_free_host_node;
 	}
 
 	if (!of_device_is_compatible(port_node, "hdmi-connector")) {
 		dev_err(lt->dev, "%s: Failed to get hdmi port\n", __func__);
+		of_node_put(port_node);
 		ret = -EINVAL;
+		goto err_free_host_node;
 	}
 
 	of_node_put(port_node);
+	return 0;
 
 end:
 	return ret;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

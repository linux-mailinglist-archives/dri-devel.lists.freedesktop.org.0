Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC3034FE41
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 12:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6EAE6EA40;
	Wed, 31 Mar 2021 10:43:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17FD56E1B4
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 10:43:17 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id v4so19134936wrp.13
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 03:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nFoCdtwrOTcJ2rvAhQk4vH/3/OsTVjD6V/wOxsMaduc=;
 b=oKokIEMW8Tfkxj1Vfj26NDbPuKmx70LxEaZhMvM09OA8GK5EcwSkloy32yHYBAQfN8
 V7n63TuyoZLIwWetHpMGxgf5dJPgZYDyziaaKtFD7mY5sPHjfTEGwuDLdilQQAUoVd7w
 SU+dHvEq25TYvcR6+mQR8Y4FNRLF7vAnadRgrYN/Lq5lEV8tFbZzxh2SvZ4u4Z1HQKIK
 l86xDzJjY62pAXXdnC4F8d21lWQ1r2aVTs/myq+wALwgyGiL5f0iV/0leX5ELPN6tc4O
 lY1r0Utaotn1zzM0OcmuC6ePIy8aoydXw8zIszPGOk1U/Pxz9/xptFnSh/anoeIMeIP4
 LCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nFoCdtwrOTcJ2rvAhQk4vH/3/OsTVjD6V/wOxsMaduc=;
 b=qHLoxOIbOyEpO53cBTRZV1GGNjBhuGMXLTACBHuHvz5Qn9kF3SIaPD9uriQTIownfL
 TStdELNGwumpYPyDbVnkwDV5ulGUmgMfOtasZcq89Ot3MSVx5sxeeel0GJaDC9Gx7IIC
 juO0FFzzPzRJDnDkutUZeOMx5abgvxyJ36BjaDW9jQtojDlDyBw8p88tEWqGp32yjsMn
 uupYIiQslxEEFnjI6E7sx/hK4izvKXKMlAjQwGX9RlkYC3acvy+3+DcOko1qg1UGmdVE
 QeIWe6nZ5K6OJ4ppN+T1IFVpTWpyGo69EZvjqAXx8TRa/rVFEDC+IH+sfPRc5EKBhj0I
 TOaA==
X-Gm-Message-State: AOAM533BIkiYO3x9EhAF0HRa5lb8lAVcBew40SQz+zeKwArhQQpjbA0m
 bcmdiEKpShypYaEw5S0sI1Y=
X-Google-Smtp-Source: ABdhPJzJmZRdiGisssi8AN3d5xNQz8cJrxinH2DYgeAeZ+hHCcmvons+BUOF/3G4aVcttvO8BEzFXQ==
X-Received: by 2002:a5d:5083:: with SMTP id a3mr2987340wrt.38.1617187395723;
 Wed, 31 Mar 2021 03:43:15 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb0008bd27007d57ea0d08d946c1.ipv6.abo.wanadoo.fr.
 [2a01:cb00:8bd:2700:7d57:ea0d:8d9:46c1])
 by smtp.gmail.com with ESMTPSA id l8sm3780872wrx.83.2021.03.31.03.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 03:43:15 -0700 (PDT)
From: Adrien Grassein <adrien.grassein@gmail.com>
To: 
Subject: [PATCH v2 1/1] drm/bridge: lt8912b: Fix issues found during static
 analysis
Date: Wed, 31 Mar 2021 12:43:12 +0200
Message-Id: <20210331104312.328820-2-adrien.grassein@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210331104312.328820-1-adrien.grassein@gmail.com>
References: <20210331104312.328820-1-adrien.grassein@gmail.com>
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
 drivers/gpu/drm/bridge/lontium-lt8912b.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 61491615bad0..dc903f793dbc 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -622,6 +622,7 @@ static int lt8912_parse_dt(struct lt8912 *lt)
 	struct gpio_desc *gp_reset;
 	struct device *dev = lt->dev;
 	int ret = 0;
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
@@ -658,16 +662,18 @@ static int lt8912_parse_dt(struct lt8912 *lt)
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
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

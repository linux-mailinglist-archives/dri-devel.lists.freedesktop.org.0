Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FA734FFB3
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 13:49:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F20B6EA6C;
	Wed, 31 Mar 2021 11:49:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E3E6EA6C
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 11:49:24 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 u5-20020a7bcb050000b029010e9316b9d5so1000958wmj.2
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 04:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cIhKyg4y3+sWX6etXiqAF9daZ8GeE0mE/r/SI1B0IPk=;
 b=mc1na+I6cW6s6q9O2oBVieuWwcWsX7bZvdYOognY6UDFWWkmWjdVSk3HRGA8YXg6ha
 jTUsxrackTDvOn2gCKwvvWb36LMF387w8OGr3tNj/7SaKRMgNTE8VXOK9kAIiiP6p3Ez
 qDaaMKr+f7eFsSsfY+MfCF+a6vAM9kBIEmDSZDWcpOd5GystnA8cWNLgDVMRSZEwvqh4
 rR1f2DrEfL8ei1y6d+Kz14E7UwgLgbCZpsZPyH/UNcN2XwBjGihcJi0dw7UjsvyxsLev
 zhIkAuQ8JORQQmnmk80KUyt/GHLaRmrklDEMgcvjrnfJK8L3qtHcCWEeRrIsNM6WYkBm
 6hUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cIhKyg4y3+sWX6etXiqAF9daZ8GeE0mE/r/SI1B0IPk=;
 b=iDEvJJUUFc35z6Sk/ehxXV7Sl/l24H/qF3JDN4COdAwf/wJ2ajgZD5HzWNJmwkwNG0
 O/LbNwGJ/2hDPYnRpwZnkBf1I63bhLoePkGN08fRBkV8SWLP8PDcQroWbCJmMLUQmhwC
 02YnykoTwnwT3Ez/0cfjsotI/4g4rGuDO8SgIb3aeALaw5VMmgW/2Lq1jkdSv8MoeX6a
 nqnCcRDik10UCB1w/fvVM9ovPHLb/3caInemBFJCHO7TzvPAH3BJNc4t4/NoOu6x2/5P
 7nxQyUBb4fri+GJVF6Zf+owllsFL+YHvNtoPPPzm2AOo0iQF93oxe5OEebeVPOhSDEkz
 FADA==
X-Gm-Message-State: AOAM531ipZ72MW2Yp/UKTaxVeubwiW2N5FCE7J8/IDqnMzXzsqHO7CRZ
 7wxQpxCxk8gjwHPsOwVk7wA=
X-Google-Smtp-Source: ABdhPJwFaB8wK/DSY9bfywKBREVmWYIhxhB1WROGgxRxsgNKVhNNuiKjjXTCF4aj66u5CJQaEQKbMg==
X-Received: by 2002:a1c:e244:: with SMTP id z65mr2871823wmg.130.1617191363272; 
 Wed, 31 Mar 2021 04:49:23 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb0008bd27007d57ea0d08d946c1.ipv6.abo.wanadoo.fr.
 [2a01:cb00:8bd:2700:7d57:ea0d:8d9:46c1])
 by smtp.gmail.com with ESMTPSA id o8sm3622299wmr.28.2021.03.31.04.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 04:49:22 -0700 (PDT)
From: Adrien Grassein <adrien.grassein@gmail.com>
To: 
Subject: [PATCH v4 1/1] drm/bridge: lt8912b: Fix issues found during static
 analysis
Date: Wed, 31 Mar 2021 13:49:19 +0200
Message-Id: <20210331114919.370053-2-adrien.grassein@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210331114919.370053-1-adrien.grassein@gmail.com>
References: <20210331114919.370053-1-adrien.grassein@gmail.com>
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
index 61491615bad0..4c8d79142262 100644
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
+		return data_lanes;
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

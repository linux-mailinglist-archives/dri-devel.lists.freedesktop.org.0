Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BDF34FD15
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 11:38:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74CF76EA2D;
	Wed, 31 Mar 2021 09:38:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36AA889BCD
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 09:38:33 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id j7so18999618wrd.1
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 02:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h0xPKy60RGRlrev5fEcU3M4WrFhStqfph3HoV43RDcQ=;
 b=gYpv3RLiQWU/W3F7huLe1EQl8/VbHH0JJNmMpS09zAejEUFBuKzdhuXlAHxYVBdvO2
 dqIvkUqlJyYp3505guwSUNBVMEVN7o/RZgGXL7lByqfpLsklNNcXBowLExDYvrKAJUJe
 H4e6IcI+0rVyzV2sdyh0NydRWUPAZF7Zs92UURZpNK0uKA33I7xAK7c5oeZUqRd7MV88
 VfDTi8yHYAEU5mu3sC1eRofEsovmXetvgIQ12yhw6dvOncP3Sp1zkWV7z3JZYvPgvTFV
 MfqZ83g+iNYe6qT7wVyxB5buYRJdoo3Qn7PnIa+6ruwMe15ZYmGHDY2EEkNbisWeBct+
 LTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h0xPKy60RGRlrev5fEcU3M4WrFhStqfph3HoV43RDcQ=;
 b=BKxjq3yptIIF0WopAQdwu4/PxF92lutcaSSxTYbt89iQzuJA0dmXHbniB8XqFjw2Gu
 ZT+Uw54Jg6RkSP0KvCTvlsAR2huNl6ZGOVn4i6sEZ5TVNG7oVzKwarD0IYFC13ELwvg6
 PtYDnDy/fdXBYi4INr+UjznFI71oUTSZpdqPsD9TQfW0ubL4qTd/RJ91yYocAunpBcat
 Cn32acp2bqsbpRjsgnWIX3aYJoDtBqx9L+klHqGahV6EaxHTHZ6HWHuYgvfmIISReSoG
 QrTNOKzPO8NRNb0A9Y0rzlU6sIiTVrgwXnN7WqUX55H0wk7Wd0z4Un0zMRU/X26zo0DW
 cXrQ==
X-Gm-Message-State: AOAM531dhpX01+Ej8OJPHEfsFK3KnI2ONNdtVikWqENULJsKWIsigLl5
 WfIJIciSUvP++MPxNZoOcNw=
X-Google-Smtp-Source: ABdhPJwqq3Y4TGttxKb5oxuoasweoUD/Uw+BGwiTmpy+ohchjAWFEoS8GoIx3n2MA4N7s3ytTuu/Cg==
X-Received: by 2002:adf:bb4c:: with SMTP id x12mr2567753wrg.271.1617183511903; 
 Wed, 31 Mar 2021 02:38:31 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb0008bd27007d57ea0d08d946c1.ipv6.abo.wanadoo.fr.
 [2a01:cb00:8bd:2700:7d57:ea0d:8d9:46c1])
 by smtp.gmail.com with ESMTPSA id n8sm3037594wrm.70.2021.03.31.02.38.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 02:38:31 -0700 (PDT)
From: Adrien Grassein <adrien.grassein@gmail.com>
To: 
Subject: [PATCH v1 1/1] drm/bridge: lt8912b: Fix issues found during static
 analysis
Date: Wed, 31 Mar 2021 11:38:22 +0200
Message-Id: <20210331093822.251839-2-adrien.grassein@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210331093822.251839-1-adrien.grassein@gmail.com>
References: <20210331093822.251839-1-adrien.grassein@gmail.com>
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
 drivers/gpu/drm/bridge/lontium-lt8912b.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 61491615bad0..9a5a19655362 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -635,13 +635,15 @@ static int lt8912_parse_dt(struct lt8912 *lt)
 	lt->gp_reset = gp_reset;
 
 	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
-	if (IS_ERR(endpoint)) {
-		ret = PTR_ERR(endpoint);
-		goto end;
-	}
+	if (!endpoint)
+		return -ENODEV;
 
 	lt->data_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
 	of_node_put(endpoint);
+	if (lt->data_lanes < 0) {
+		dev_err(lt->dev, "%s: Bad data-lanes property\n", __func__);
+		return lt->data_lanes;
+	}
 
 	lt->host_node = of_graph_get_remote_node(dev->of_node, 0, -1);
 	if (!lt->host_node) {
@@ -658,16 +660,18 @@ static int lt8912_parse_dt(struct lt8912 *lt)
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

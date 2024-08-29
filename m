Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE13B963F86
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 11:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAEE210E2A7;
	Thu, 29 Aug 2024 09:09:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EQEiukV9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F170210E2A7
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 09:09:19 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-42bb72a5e0bso2911305e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 02:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724922558; x=1725527358; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TpmFTkPz1YG0M0jj2i80yQT55v49mlOkRi1Qh1Zks48=;
 b=EQEiukV9W8xk+XPctEXLSq1lvj7h8q5vMv7nh86B5el867sKzZOlV10x047r6K11vx
 sOkuYCLY/Wkw/mJET4b43HejNupprsQcTJNPm+BsJIaESeYiWtq8k3d7/SaRUDYFVF+M
 QNgRnXArCAqZD2SKrl6egTE49MIE3HY0nmgjnoZ3VklOiHt/yX92aU9pQkMOlX21y/YY
 7NZefKLcxXiCW1Kgb3gJUcP+qwtTlpsV9Line4T84Nqh2Fp+nhkxi9dL7kN7qpDutyjI
 2NWtsDwBJeWxQ2u8zR3Wm2I7aUI6G1BJcFv3Y52nIZDgmZTyQ9lpHHm+EZyqbxuM7QkZ
 gdIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724922558; x=1725527358;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TpmFTkPz1YG0M0jj2i80yQT55v49mlOkRi1Qh1Zks48=;
 b=ek4Yk0jbVc+mmGrxTn56JgSkt+1Kt/gozebiDuycjEU1xcgWbdX9mY2bIqcdYlYhho
 TBgstu/S7SaPPMGQ/rUcuRsBvf/iaZ0jLpIiUV6P2ezLQQwa2oDYnOKKHHKRjxD8XE5X
 8NHOIhaelBWgeVsu87qoBp5qBvgRG9qWr4F1RetX+DWIcYVEdlVmhxZBLarn+42HWW3v
 3q6NLxxu3F70H/c36EeYc3A1FVInD7+GOxx7DmtUVNdf7Xvw23jw0ZRXckBfLL9P6U/L
 4CkGFyvvLWAHlDsmjrBc4OwchsX+pOvBfLufV9ZM7LfLoe5cYkdErrIVolsFj3VhN/zk
 R28A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhLtvBOhzNLf9o+zdiq7NonSmXnDKTA96WDKQ/WMFqZOAgZn0siiMg7HSLZaeW/PCbLmt/I12bVpw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxanweBSgfgRj1cFea8OWzVMNF28LbSbTLA+YyDBLOGyoki3LHe
 wAiM9YUqeLCQ/nL4xJ5WILBQ6+f2qGM/SRxQ/m4+AuK23ZU1Qez1wX1u7W+S
X-Google-Smtp-Source: AGHT+IEtOMsXr2r46yNUszOdtQkbgbN1ukMUWBeH7AR9SyULdpdIWnw8AqSrNgivb4x/tqIxlMl+Cw==
X-Received: by 2002:a05:600c:3b11:b0:429:a05:32fb with SMTP id
 5b1f17b1804b1-42bb01b4428mr16739085e9.10.1724922557396; 
 Thu, 29 Aug 2024 02:09:17 -0700 (PDT)
Received: from localhost
 (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42baf1b0c18sm26347855e9.37.2024.08.29.02.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 02:09:16 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] Revert "drm/tegra: gr3d: Convert into
 dev_pm_domain_attach|detach_list()"
Date: Thu, 29 Aug 2024 11:09:16 +0200
Message-ID: <20240829090916.1288854-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Thierry Reding <treding@nvidia.com>

This reverts commit f790b5c09665cab0d51dfcc84832d79d2b1e6c0e. An updated
version of patch was applied to the PM tree. Sorry for the mixup.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/gr3d.c | 46 ++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
index 4de1ea0fc7c0..00c8564520e7 100644
--- a/drivers/gpu/drm/tegra/gr3d.c
+++ b/drivers/gpu/drm/tegra/gr3d.c
@@ -46,7 +46,6 @@ struct gr3d {
 	unsigned int nclocks;
 	struct reset_control_bulk_data resets[RST_GR3D_MAX];
 	unsigned int nresets;
-	struct dev_pm_domain_list *pd_list;
 
 	DECLARE_BITMAP(addr_regs, GR3D_NUM_REGS);
 };
@@ -370,12 +369,18 @@ static int gr3d_power_up_legacy_domain(struct device *dev, const char *name,
 	return 0;
 }
 
+static void gr3d_del_link(void *link)
+{
+	device_link_del(link);
+}
+
 static int gr3d_init_power(struct device *dev, struct gr3d *gr3d)
 {
-	struct dev_pm_domain_attach_data pd_data = {
-		.pd_names = (const char *[]) { "3d0", "3d1" },
-		.num_pd_names = 2,
-	};
+	static const char * const opp_genpd_names[] = { "3d0", "3d1", NULL };
+	const u32 link_flags = DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME;
+	struct device **opp_virt_devs, *pd_dev;
+	struct device_link *link;
+	unsigned int i;
 	int err;
 
 	err = of_count_phandle_with_args(dev->of_node, "power-domains",
@@ -409,10 +414,29 @@ static int gr3d_init_power(struct device *dev, struct gr3d *gr3d)
 	if (dev->pm_domain)
 		return 0;
 
-	err = dev_pm_domain_attach_list(dev, &pd_data, &gr3d->pd_list);
-	if (err < 0)
+	err = devm_pm_opp_attach_genpd(dev, opp_genpd_names, &opp_virt_devs);
+	if (err)
 		return err;
 
+	for (i = 0; opp_genpd_names[i]; i++) {
+		pd_dev = opp_virt_devs[i];
+		if (!pd_dev) {
+			dev_err(dev, "failed to get %s power domain\n",
+				opp_genpd_names[i]);
+			return -EINVAL;
+		}
+
+		link = device_link_add(dev, pd_dev, link_flags);
+		if (!link) {
+			dev_err(dev, "failed to link to %s\n", dev_name(pd_dev));
+			return -EINVAL;
+		}
+
+		err = devm_add_action_or_reset(dev, gr3d_del_link, link);
+		if (err)
+			return err;
+	}
+
 	return 0;
 }
 
@@ -503,13 +527,13 @@ static int gr3d_probe(struct platform_device *pdev)
 
 	err = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
 	if (err)
-		goto err;
+		return err;
 
 	err = host1x_client_register(&gr3d->client.base);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
 			err);
-		goto err;
+		return err;
 	}
 
 	/* initialize address register map */
@@ -517,9 +541,6 @@ static int gr3d_probe(struct platform_device *pdev)
 		set_bit(gr3d_addr_regs[i], gr3d->addr_regs);
 
 	return 0;
-err:
-	dev_pm_domain_detach_list(gr3d->pd_list);
-	return err;
 }
 
 static void gr3d_remove(struct platform_device *pdev)
@@ -528,7 +549,6 @@ static void gr3d_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 	host1x_client_unregister(&gr3d->client.base);
-	dev_pm_domain_detach_list(gr3d->pd_list);
 }
 
 static int __maybe_unused gr3d_runtime_suspend(struct device *dev)
-- 
2.45.2


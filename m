Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 297A6AE18E7
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 12:31:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D016810EB34;
	Fri, 20 Jun 2025 10:31:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="Tc9aGQRc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD75410E217
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 10:31:37 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-606b58241c9so2524916a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 03:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1750415496; x=1751020296; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rx+JsSfgW45704ajaCZP3Z6JsbN0dOsJusfnG4fSCwM=;
 b=Tc9aGQRclKbqDjofZVgmgVTwxm4DQ6HX/7myTd0PIUuNb22owivGVT1t4hAaJFwn5m
 d1bJD+yS+h28DFM4fnlAIhiMr9omwUz/4ieBKFcU1BcYMZab55FdZdjmK5KGZKMgI0Us
 Evesd7ndTb3m+wmpfP1Ckr7QhNHfpA7+2oUD6DktpigeLJLXtvJ56Wwd5X/2Lz9TDkqL
 o13Nig6BSLtgnb7qVNi01axuTp0U8KH2F5phYvB/+ehH9G9trWFXSYdiT8I19b1ZzPdH
 8SfpTDcd76Uh6ndSQJ/fXZqHWWcIV4SGxghdZXVeEkAazEcieyt2ddMRa1dIpxLw8dww
 FHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750415496; x=1751020296;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rx+JsSfgW45704ajaCZP3Z6JsbN0dOsJusfnG4fSCwM=;
 b=RZ2zcWIN/tw4QpVIx2ynwfCGU+chZvIz6TdhzpFQON+5CWGKtv/82cJml0121H2l2E
 QTLmZftv/mpgqv0Iv9H071xV8UxfF+L+efPRjr6uXCAVM1iTtDDmDK0I4SaA0L2uRAM1
 jEtNNcYQk7SH5yuBjT48kgNPtgtg3/j7Ihto5LVdRzgv6iAxkylTrcmbn4Qi+ioQNx3o
 dUpQ8ma1wdSYMaVX9LoiVzd+avDDwqmPQjNE0Z81/z7dH1zBXRNAPeou/71bF9cb/xiq
 b4KbXT2p61nxu2S+fU6TEOdGc8bHHbBQ2LHvQObiBKFSa7KtYYodNMb8wjl6nUi5RUvw
 3++Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/G88ioLuoNzIZhA5BX8AuMM0ZDmE16nY3s6cszi56kLXAwvtSvcb9/uMNx2jOkrdIO7sFweERRnM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyzao/KTZ41WfK5uQpNRPJZ+3Rm9JC0iqn240hTXi+SPqUrvCRG
 sitLFj010lNbxtrV2J27d+FyIAdj0ggqGpPBGpol/OPtr0DYoua77RnC2ObiwN7smhQ=
X-Gm-Gg: ASbGnct0HVy3K/AOohSWVKOz5g0LNnSJrLU+2oYC1ptlSrCFF1KSjNZifN/Re787pfL
 QqP+b2o2dV6qFcyCg1ZL8Nxkk9627wjm1Wokcpn4CzocNDlmvhhIe+PB+t5Kjof61SnvmsfxAFN
 T8Q4pB5lqQJhdRYY+1nL4gytVGtckY2c7YmNYlsbvYZDb5rfmmDEYCRkwPfw6/sHgTaoSXMWuFm
 ft8U3qptwvxC53dHLjyji9gU/zMGEMKaB5xttv4xkABEkl5vQVvl3XZjqy8GM+h69/H/DXoyH2E
 eL9cdtJu/Dwoqf95F4Yd66RDvAcea3Z+nFBY2hoP5y+fDMGuJEK3/iN8PU3UNSKlmjLluyTLrfZ
 pWUgJi52CXlVK3kJ7ERlUFDtdMqVHsxuy
X-Google-Smtp-Source: AGHT+IFojvse3lqX+gqKA0HNP3nkQ76ONpxVInRK6fKU0+nbCKCU4x5vFpvTAQSlT7CHl0bt8sS96g==
X-Received: by 2002:a17:907:3ccb:b0:ad5:4440:23 with SMTP id
 a640c23a62f3a-ae057f21fcdmr207244766b.50.1750415496144; 
 Fri, 20 Jun 2025 03:31:36 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl.
 [144.178.202.138]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae0541b6f5csm138047366b.122.2025.06.20.03.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 03:31:35 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 20 Jun 2025 12:31:27 +0200
Subject: [PATCH 3/3] fbdev/simplefb: Add support for interconnect paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-simple-drm-fb-icc-v1-3-d92142e8f74f@fairphone.com>
References: <20250620-simple-drm-fb-icc-v1-0-d92142e8f74f@fairphone.com>
In-Reply-To: <20250620-simple-drm-fb-icc-v1-0-d92142e8f74f@fairphone.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750415493; l=3509;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=aUgglQRYn7bTkMkwBI8lk1cjN4alca4VUVFQsxvzbtU=;
 b=q76OcxFnlNqs8zk3v5IaY0TIGBj4kLjAwREPukb0aGjW2/MaP/fIm50kqwa8fh+iuaE1x69fK
 +4EOmwW3pikCwZOl7W1EI5MmfpyvVdzGesSDUA4icHlf9y6PepTL2jt
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
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

Some devices might require keeping an interconnect path alive so that
the framebuffer continues working. Add support for that by setting the
bandwidth requirements appropriately for all provided interconnect
paths.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/video/fbdev/simplefb.c | 83 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
index be95fcddce4c8ca794826b805cd7dad2985bd637..ca73e079fd13550ddc779e84db80f7f9b743d074 100644
--- a/drivers/video/fbdev/simplefb.c
+++ b/drivers/video/fbdev/simplefb.c
@@ -27,6 +27,7 @@
 #include <linux/parser.h>
 #include <linux/pm_domain.h>
 #include <linux/regulator/consumer.h>
+#include <linux/interconnect.h>
 
 static const struct fb_fix_screeninfo simplefb_fix = {
 	.id		= "simple",
@@ -89,6 +90,10 @@ struct simplefb_par {
 	u32 regulator_count;
 	struct regulator **regulators;
 #endif
+#if defined CONFIG_OF && defined CONFIG_INTERCONNECT
+	unsigned int icc_count;
+	struct icc_path **icc_paths;
+#endif
 };
 
 static void simplefb_clocks_destroy(struct simplefb_par *par);
@@ -525,6 +530,80 @@ static int simplefb_attach_genpds(struct simplefb_par *par,
 }
 #endif
 
+#if defined CONFIG_OF && defined CONFIG_PM_GENERIC_DOMAINS
+/*
+ * Generic interconnect path handling code.
+ */
+static void simplefb_detach_icc(void *res)
+{
+	struct simplefb_par *par = res;
+	int i;
+
+	for (i = par->icc_count - 1; i >= 0; i--) {
+		if (!IS_ERR_OR_NULL(par->icc_paths[i]))
+			icc_put(par->icc_paths[i]);
+	}
+}
+
+static int simplefb_attach_icc(struct simplefb_par *par,
+			       struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	int ret, count, i;
+
+	count = of_count_phandle_with_args(dev->of_node, "interconnects",
+							 "#interconnect-cells");
+	if (count < 0)
+		return 0;
+
+	/* An interconnect path consists of two elements */
+	if (count % 2) {
+		dev_err(dev, "invalid interconnects value\n");
+		return -EINVAL;
+	}
+	par->icc_count = count / 2;
+
+	par->icc_paths = devm_kcalloc(dev, par->icc_count,
+				      sizeof(*par->icc_paths),
+				      GFP_KERNEL);
+	if (!par->icc_paths)
+		return -ENOMEM;
+
+	for (i = 0; i < par->icc_count; i++) {
+		par->icc_paths[i] = of_icc_get_by_index(dev, i);
+		if (IS_ERR_OR_NULL(par->icc_paths[i])) {
+			ret = PTR_ERR(par->icc_paths[i]);
+			if (ret == -EPROBE_DEFER)
+				goto err;
+			dev_err(dev, "failed to get interconnect path %u: %d\n", i, ret);
+			continue;
+		}
+
+		ret = icc_set_bw(par->icc_paths[i], 0, UINT_MAX);
+		if (ret) {
+			dev_err(dev, "failed to set interconnect bandwidth %u: %d\n", i, ret);
+			continue;
+		}
+	}
+
+	return devm_add_action_or_reset(dev, simplefb_detach_icc, par);
+
+err:
+	while (i) {
+		--i;
+		if (!IS_ERR_OR_NULL(par->icc_paths[i]))
+			icc_put(par->icc_paths[i]);
+	}
+	return ret;
+}
+#else
+static int simplefb_attach_icc(struct simplefb_par *par,
+			       struct platform_device *pdev)
+{
+	return 0;
+}
+#endif
+
 static int simplefb_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -615,6 +694,10 @@ static int simplefb_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto error_regulators;
 
+	ret = simplefb_attach_icc(par, pdev);
+	if (ret < 0)
+		goto error_regulators;
+
 	simplefb_clocks_enable(par, pdev);
 	simplefb_regulators_enable(par, pdev);
 

-- 
2.50.0


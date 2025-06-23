Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB77AE3607
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 08:45:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E406910E1BB;
	Mon, 23 Jun 2025 06:45:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="e5+3NLSJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46BA610E197
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 06:45:02 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-ad56cbc7b07so604566466b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jun 2025 23:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1750661101; x=1751265901; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pA+Rs4BuhZMiD1TZXkrsma5mRVhifaFNd7IRaZKnnaY=;
 b=e5+3NLSJR0aYmRGkOKKcfpfasxskUKBkv1pWWLGuNT3yXvBNMBBjqHx+QHcX9cOff7
 b4bTqTPNdWsiXQKjAbxpFPI2RHvshUb1ePJiN6Yq2ZMtJI9AaXatlxx/xCe02ozSh+kE
 FPuKaQU4hTZtK/5Rmf8kNWplKV1wmL2rW+NOShb9P+ydDJexvu+LJ8S487ZBmLgCco/7
 N2CaIN/4Sb4+XmNCVBFy4a4tAXIAfVnd0oNQuqk/adOJGPmeel7xTP54V54kNY2ifC1G
 3qzBdjJorI2L+zJ0q6lm4zXhAoBzUT2kUNFWCCZMYvkngMvfmnwztU3Xj9K23N/BAcNV
 li/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750661101; x=1751265901;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pA+Rs4BuhZMiD1TZXkrsma5mRVhifaFNd7IRaZKnnaY=;
 b=Mf5TQBrxcs8YjQp8WqlEEsfpgv7pXegju0JxE8q069V6m8ADoAB1MmoLJNYnfUE7l0
 gYM698epDOYEhsj1Ff2IjfhRUTg+GNLDGPfjJXXIrwMJ211z9Ndrsdh3vr0qk4tqHOkR
 BQjngDjVp+1fvoBgs11T9+P94is5OQUd6AqbWPaqH9MXhWaC/28HiQ5kPv7oI4I2UjYW
 5xtfiK7JBYH0QGVpsFtv5xMhWV1h3It7lgapz+0og10+ThtWr20cIzDe6Fy0mnc5stk2
 TdZY9ibWccPx05sBtWdjUHjlt1LFh0xREUCy/JE+qu0IVPLxR22pArus9kbCzaT+KeyM
 frEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZxHPRyuEcctfOU/pF2e2G3MO7LU/hIilAe77CQ2FAOoDAHoVNSqtkqSoy9uwjyY6LU87Hdle5D60=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUNOB616M2WOUolYKorYePrX5kiyzdFkOFUB93dGh2Os6KYa5Q
 VITfY0gn4eg0PRBppz5OQK/3/clXMkQL6a7rMGNTPsjq5ZJoYOsHWID0Ud8jc+6TeHU=
X-Gm-Gg: ASbGncv1RxyAf/5h72lx6bT+l7saI5i+y4GwcwTjsvdjEKEVESyM8jUg/UuOFs8I62c
 NO69YdRT/1VGKfc04Kdg8ytcJpHGO3bc/EOMSXlgwI4DR2Hqt6tfeKjTm1SFHuk0zcxihMyDcyY
 QVggdcv9n4RRLv+UeSED5Ht2+BKjPKHpHktPQAuEBVuSztjEHhKzoKf/ExEck4Qy+x5PTZiKRih
 DRYWuALkFhF8E6Rp59rYQBNWPVV3nUJUJJegJywuFoZdBDPr0hPuCOTQPSphJm2j2OGCYiHfEfG
 ntEFTb1ZfltbTGb4xY1f7RhefpzU+ZeoqHnkIMVHXKE8ZXQ5ZQtvhVMaqH7uGzFcSNhsGGVniZ0
 tDemWNb1Dht/B49108qVEfkjt+a0DqLwp
X-Google-Smtp-Source: AGHT+IEfG/ia8MXFZvWV63xW+2WDm+wmIGfKUT095APiD93iFktsSDhtmQlj2MFUGu0vl47bkbkh1w==
X-Received: by 2002:a17:906:6a17:b0:adb:23e0:9297 with SMTP id
 a640c23a62f3a-ae057a51258mr1096084666b.17.1750661100690; 
 Sun, 22 Jun 2025 23:45:00 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl.
 [144.178.202.138]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae053ee4ce9sm659258266b.69.2025.06.22.23.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Jun 2025 23:45:00 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 23 Jun 2025 08:44:49 +0200
Subject: [PATCH v2 5/5] fbdev/simplefb: Add support for interconnect paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-simple-drm-fb-icc-v2-5-f69b86cd3d7d@fairphone.com>
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
In-Reply-To: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750661095; l=3530;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=dQKTaoJFbvazyp9Q1oPhqhjuJEvK2SxhdOtUQkhZwj0=;
 b=wtrWkFVrQxjznBKN4+vCIM0v5OnZoKSUD8HoOPwct17rZ2GLmAHgCNrxQRvIjIg0dfn6SBO3p
 fX8nbdxIEsCBstf3uSct7cS/lYQd1s5Ww4P7FLDYTDBXJ1Mt6boZXXC
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

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/video/fbdev/simplefb.c | 83 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
index db27d51046af5cc3c46a0bc81ad9d9ed9a0783cc..b7e2f2374e3149866fd6f1803931e7f34dbbd75f 100644
--- a/drivers/video/fbdev/simplefb.c
+++ b/drivers/video/fbdev/simplefb.c
@@ -16,6 +16,7 @@
 #include <linux/clk.h>
 #include <linux/errno.h>
 #include <linux/fb.h>
+#include <linux/interconnect.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
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
 
+#if defined CONFIG_OF && defined CONFIG_INTERCONNECT
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


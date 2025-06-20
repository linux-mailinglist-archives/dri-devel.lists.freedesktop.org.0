Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7EFAE18EC
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 12:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A7D10EB42;
	Fri, 20 Jun 2025 10:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="WqTHMYHa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DFE710E217
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 10:31:36 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-607434e1821so2471085a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 03:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1750415495; x=1751020295; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=t2iMhnvf5EQaGrzDAr8D2TdFfXYKdA4ikA05GtxeBtI=;
 b=WqTHMYHabIzADM7K9vf8RBTTPCw1yVGh+t9UKn05IbxaBGwFsP5YcARQkv5EqGAaup
 7qM8zUu5GNsM3fP09R1TyHE33gr3cdmrEjEVb/Olk+xhDPo1Zx+dHR4u96MtQIF6zfBm
 VOVF2/9a65L97YpIUFcOneh1LalEZrZ5wE9VJ6OSfG7qDVkQXw8VfltQje/7DMetEA0n
 8PhDv4IFS0aFUWoUHeu6dtxKs9H0jr5LLB/SYw5WK673qXGusBGW1wV0XRdF06OrUeao
 89hkR13jOCJYq0htiJh/Oy0fy6TY46kmFoQ8CBXdRdDJQHR/g+rV1Msopv+u7YTaEGc3
 +Keg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750415495; x=1751020295;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t2iMhnvf5EQaGrzDAr8D2TdFfXYKdA4ikA05GtxeBtI=;
 b=Zwt80XPzsVzjd6NINixIlI//6Z6Jks2i3gkJej6JURrWmB7hZHOPuWB1dMOMD2KItJ
 M0tL3gAghTAotgsqd5LC6hR2iR0a+1WfUss2wloG+zdQSutV6TlxpK850LuCKA60v/hn
 gJrSSyNKlof1JnmUcOi6g72HiG6XbYsOKpd+KKFEgl7dfmUrkYGt4aChxxC0ZuOUaiWF
 4MsGgsd5fHFCgs3jSRyRgGJfJiNBUXFuMxWPOECCcGEuNXHuvnNY/UN8SIFsS+0EiAo2
 uFQ0+sw0V4B3ef58CMsXmxhZx797pIbVoKYq6NjQFTJim9X/xbNylvfBiHimWZDnXbUh
 euIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXM5X77SQ4i5t74BWI9PQRO3goZmfbB8xnq/fxXS7H7cztQ9VmWEj8+R/UQBuH3XMlXRokJUz0wzVk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmZCNrqpFZ9xxrV0thQmS1MIaU9GcKzY0HbX9gvKpuS45QSoQA
 64ukKjWsEG4OvW1p/f4BZaYZqd6NHn7ZYRjmaev1CVL/DOyo+rDTRUI8PfEYxR3cT48=
X-Gm-Gg: ASbGncsPH4DQtx1qAMbWuV2+uEMn6mfJ6shWGszTkZM+CcY/n1bc+xe3ly/RKyXjbth
 v5F+Cokz40kFsQ8it1GdBo0cmWRp47wW4CupPPCewSWP/5q4SlJSwbJYFKy7KdsLxYelK6NQ3dw
 hK35GMuwSvkcscgAkK64POU5TP04TmlocLjWweOX8/pnlVEY2mwlvAPdDw+JmsbdnVAtdlgh0Nw
 gpJ/U1Wgg8fvdNByuDpDHc8OsJHKazxibNmXr0YLIwCLV5smpygarqbS1r+k8msSq6D3Qx889sW
 O/oDRCv/uI1oBMcf9s+axuEJvLo+vDLxHf57PDwCoppbKdcfKLmUKt59/ZWmlnPmOImAOx/KIM6
 IMYW8ji9VNhwYtaqurGfYerFJUFERH/ibyUVJtX9/wo0=
X-Google-Smtp-Source: AGHT+IFSpq+n0pTlSttcHCNoQdEWNKKFQKqrUEc9bXWtRz+fgibBvmNaNt5W95K1E/I9mpYWKSpYIQ==
X-Received: by 2002:a17:907:2d89:b0:adb:e08:5e71 with SMTP id
 a640c23a62f3a-ae0579930e0mr234979566b.17.1750415495176; 
 Fri, 20 Jun 2025 03:31:35 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl.
 [144.178.202.138]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae0541b6f5csm138047366b.122.2025.06.20.03.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 03:31:34 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 20 Jun 2025 12:31:26 +0200
Subject: [PATCH 2/3] drm/sysfb: simpledrm: Add support for interconnect paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-simple-drm-fb-icc-v1-2-d92142e8f74f@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750415493; l=3566;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=d04Nc6/zavO+68KQ3Z8w4PpWXB7iws3XS1jyTPHwCgw=;
 b=OSCxYbk+zEmgHOxlnlJRAUggV3hgQS7+vk3wWQc+tTa51GNZjK7RbLR0z3Knt58EHBfB/eyny
 jamZmL7PXsQAdWIECU8g+Y44oAzAB4KcTf8rQG9xPOUXnsp8dcOdowe
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
 drivers/gpu/drm/sysfb/simpledrm.c | 83 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/gpu/drm/sysfb/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
index a1c3119330deffc9e122b83941f3697e5b87f277..9643f7c1734ab558d52779d7c45465dbe1d85762 100644
--- a/drivers/gpu/drm/sysfb/simpledrm.c
+++ b/drivers/gpu/drm/sysfb/simpledrm.c
@@ -9,6 +9,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/regulator/consumer.h>
+#include <linux/interconnect.h>
 
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic.h>
@@ -225,6 +226,10 @@ struct simpledrm_device {
 	struct device **pwr_dom_devs;
 	struct device_link **pwr_dom_links;
 #endif
+#if defined CONFIG_OF && defined CONFIG_INTERCONNECT
+	unsigned int icc_count;
+	struct icc_path **icc_paths;
+#endif
 
 	/* modesetting */
 	u32 formats[DRM_SYSFB_PLANE_NFORMATS(1)];
@@ -547,6 +552,81 @@ static int simpledrm_device_attach_genpd(struct simpledrm_device *sdev)
 }
 #endif
 
+#if defined CONFIG_OF && defined CONFIG_PM_GENERIC_DOMAINS
+/*
+ * Generic interconnect path handling code.
+ */
+static void simpledrm_device_detach_icc(void *res)
+{
+	struct simpledrm_device *sdev = res;
+	int i;
+
+	for (i = sdev->icc_count - 1; i >= 0; i--) {
+		if (!IS_ERR_OR_NULL(sdev->icc_paths[i]))
+			icc_put(sdev->icc_paths[i]);
+	}
+}
+
+static int simpledrm_device_attach_icc(struct simpledrm_device *sdev)
+{
+	struct device *dev = sdev->sysfb.dev.dev;
+	int ret, count, i;
+
+	count = of_count_phandle_with_args(dev->of_node, "interconnects",
+							 "#interconnect-cells");
+	if (count < 0)
+		return 0;
+
+	/* An interconnect path consists of two elements */
+	if (count % 2) {
+		drm_err(&sdev->sysfb.dev,
+			"invalid interconnects value\n");
+		return -EINVAL;
+	}
+	sdev->icc_count = count / 2;
+
+	sdev->icc_paths = devm_kcalloc(dev, sdev->icc_count,
+					       sizeof(*sdev->icc_paths),
+					       GFP_KERNEL);
+	if (!sdev->icc_paths)
+		return -ENOMEM;
+
+	for (i = 0; i < sdev->icc_count; i++) {
+		sdev->icc_paths[i] = of_icc_get_by_index(dev, i);
+		if (IS_ERR_OR_NULL(sdev->icc_paths[i])) {
+			ret = PTR_ERR(sdev->icc_paths[i]);
+			if (ret == -EPROBE_DEFER)
+				goto err;
+			drm_err(&sdev->sysfb.dev, "failed to get interconnect path %u: %d\n",
+				i, ret);
+			continue;
+		}
+
+		ret = icc_set_bw(sdev->icc_paths[i], 0, UINT_MAX);
+		if (ret) {
+			drm_err(&sdev->sysfb.dev, "failed to set interconnect bandwidth %u: %d\n",
+				i, ret);
+			continue;
+		}
+	}
+
+	return devm_add_action_or_reset(dev, simpledrm_device_detach_icc, sdev);
+
+err:
+	while (i) {
+		--i;
+		if (!IS_ERR_OR_NULL(sdev->icc_paths[i]))
+			icc_put(sdev->icc_paths[i]);
+	}
+	return ret;
+}
+#else
+static int simpledrm_device_attach_icc(struct simpledrm_device *sdev)
+{
+	return 0;
+}
+#endif
+
 /*
  * Modesetting
  */
@@ -633,6 +713,9 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	if (ret)
 		return ERR_PTR(ret);
 	ret = simpledrm_device_attach_genpd(sdev);
+	if (ret)
+		return ERR_PTR(ret);
+	ret = simpledrm_device_attach_icc(sdev);
 	if (ret)
 		return ERR_PTR(ret);
 

-- 
2.50.0


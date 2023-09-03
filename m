Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D86BD790E7D
	for <lists+dri-devel@lfdr.de>; Sun,  3 Sep 2023 23:42:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C0B10E254;
	Sun,  3 Sep 2023 21:42:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A4C10E21E
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Sep 2023 21:42:02 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b95d5ee18dso13230141fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 14:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693777320; x=1694382120; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VRU3YcmHhtMgrEwiKr0jiCPmTZjWFsu5C3QySeLjrFk=;
 b=QqA+5fOah4cvJAtNFLHf8p8CDsWk4rNySNqzloCusqM87N7nXBzmOlzgkQYH/4CJUw
 9fla1/WMmTRWLTSFAOD1RdNQtaydC7gN6e2npU+LH6mKLVSWfm4GdJ4vN+c5Qf6FHVWC
 AlbRbmCEENlCZd7fkAKGBQa5E/skTBqA3JRiulTbMEdrbNUWVYIz08L71UJtArWl89eH
 hFLggvG+o68hD+2IXIgsSCMQShZh277i7JOD10xGMqe8PML7L+GLEiItlAeKbu7luKBY
 2L6gDcx8FyJb45Ku1TYaM9UANPsgoPC8YixQQx5SZh3YyNDolUrHb/zaTP7Y3c7ou38k
 dHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693777320; x=1694382120;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VRU3YcmHhtMgrEwiKr0jiCPmTZjWFsu5C3QySeLjrFk=;
 b=Ae/JpbxO0pu18Uij0kcB0qsMY62xHJdjsg2VFWPXZuuUMlDz6g37P+tzypVV3xw7WS
 tPNQmd938lNeUE1neU1T9tM6Mc611zTsunJU8twE/0QM2rxgjMdJTC/ssUJRX3e5iISc
 s6V2F5SXEH2uCoeOHRKKEpUVxU1zD72OuCPpL+JnOndmRLDiMLh/ZggxBmKmI0Fr7DN5
 xi1XdP3+R/j5RDhEdDXPszZa+X0hcFySikDmtURl8Xv8VTqNDaow9tj7P279IrqC8jvq
 RWJ3iNK18D8o7femis63cI0sYJJB02as44RZ5pngmjreWdmuzh/8E0sjRJb6MTm89zLh
 BZIg==
X-Gm-Message-State: AOJu0YykLFARsOq2TLzpNSQbrNDu35ravT8PcuHFGLszl8579W7rXPxd
 s1VX+2otkCuUNdZ+4qfYvOFO4A==
X-Google-Smtp-Source: AGHT+IFsqgNhsNbkZVa3cNm+AdNIgulADr18z4rrsHYsJZU44KXFgwMqPl+5UxHTsBskue63qdvb8w==
X-Received: by 2002:a05:6512:3b26:b0:4fb:caed:95c3 with SMTP id
 f38-20020a0565123b2600b004fbcaed95c3mr5991678lfv.53.1693777320290; 
 Sun, 03 Sep 2023 14:42:00 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x17-20020ac25dd1000000b004f8555f7aa1sm1422506lfq.52.2023.09.03.14.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 14:41:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Janne Grunau <j@jannau.net>, Simon Ser <contact@emersion.fr>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [RFC PATCH v1 12/12] usb: typec: qcom: define the bridge's path
Date: Mon,  4 Sep 2023 00:41:50 +0300
Message-Id: <20230903214150.2877023-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to notify the userspace about the DRM connector's USB-C port,
export the corresponding port's name as the bridge's path field.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c     | 11 +++++++----
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.c |  4 +++-
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.h |  6 ++++--
 3 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
index b9d4856101c7..452dc6437861 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
@@ -156,6 +156,7 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	const struct pmic_typec_resources *res;
 	struct regmap *regmap;
+	char *tcpm_name;
 	u32 base[2];
 	int ret;
 
@@ -211,10 +212,6 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
 	mutex_init(&tcpm->lock);
 	platform_set_drvdata(pdev, tcpm);
 
-	tcpm->pmic_typec_drm = qcom_pmic_typec_init_drm(dev);
-	if (IS_ERR(tcpm->pmic_typec_drm))
-		return PTR_ERR(tcpm->pmic_typec_drm);
-
 	tcpm->tcpc.fwnode = device_get_named_child_node(tcpm->dev, "connector");
 	if (!tcpm->tcpc.fwnode)
 		return -EINVAL;
@@ -225,6 +222,12 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
 		goto fwnode_remove;
 	}
 
+	tcpm_name = tcpm_port_get_name(tcpm->tcpm_port);
+	tcpm->pmic_typec_drm = qcom_pmic_typec_init_drm(dev, tcpm_name);
+	kfree(tcpm_name);
+	if (IS_ERR(tcpm->pmic_typec_drm))
+		return PTR_ERR(tcpm->pmic_typec_drm);
+
 	ret = qcom_pmic_typec_port_start(tcpm->pmic_typec_port,
 					 tcpm->tcpm_port);
 	if (ret)
diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.c
index e202eb7b52db..7bd7f4bf3539 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.c
@@ -21,7 +21,8 @@ static const struct drm_bridge_funcs qcom_pmic_typec_bridge_funcs = {
 	.attach = qcom_pmic_typec_attach,
 };
 
-struct pmic_typec_drm *qcom_pmic_typec_init_drm(struct device *dev)
+struct pmic_typec_drm *qcom_pmic_typec_init_drm(struct device *dev,
+						const char *path)
 {
 	struct pmic_typec_drm *tcpm_drm;
 
@@ -33,6 +34,7 @@ struct pmic_typec_drm *qcom_pmic_typec_init_drm(struct device *dev)
 	tcpm_drm->bridge.of_node = of_get_child_by_name(dev->of_node, "connector");
 	tcpm_drm->bridge.ops = DRM_BRIDGE_OP_HPD;
 	tcpm_drm->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
+	tcpm_drm->bridge.path = devm_kstrdup(dev, path, GFP_KERNEL);
 
 	return ERR_PTR(devm_drm_bridge_add(dev, &tcpm_drm->bridge));
 }
diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.h b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.h
index 01f4bb71346b..259c047265f7 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.h
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.h
@@ -9,9 +9,11 @@
 struct pmic_typec_drm;
 
 #if IS_ENABLED(CONFIG_DRM)
-struct pmic_typec_drm *qcom_pmic_typec_init_drm(struct device *dev);
+struct pmic_typec_drm *qcom_pmic_typec_init_drm(struct device *dev,
+						const char *path);
 #else
-static inline pmic_typec_drm *qcom_pmic_typec_init_drm(struct device *dev)
+static inline pmic_typec_drm *qcom_pmic_typec_init_drm(struct device *dev,
+						       const char *path)
 {
 	return NULL;
 }
-- 
2.39.2


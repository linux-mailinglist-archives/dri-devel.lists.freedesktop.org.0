Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A6B6E8B1E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 09:14:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA5610EBB9;
	Thu, 20 Apr 2023 07:14:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0E510E842
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 18:11:20 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-2fe3fb8e2f7so269948f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 11:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20221208.gappssmtp.com; s=20221208; t=1681841478; x=1684433478;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HWgjCk8Y5OqaGe2854pshW/+RKD+sr2jN2Xg3ngYTlU=;
 b=yOZHP2I/mS+lFMDLCQczZZXxAbDnspVnWlHsfl3etb3QG5ANp4LKBkd4JTK6lqMTsx
 MxJR3YSGDZP3hwFFOYUuNxcV/bsdUViEKNH2smVsc7QtMJgSTIxsqcFaZDlBF1L+76is
 dNt+lKAbi1SRiNPk/D3IUNMRCEHFiv/0M86wmaop8moGlXTycE8oOA/+NmbakwQ3c2Q6
 +lk5SpS/MCtKefePvEfz47mdktk0lHPO3iZDNRX8kmEBs9HXusDrXZm0rXK0vZxYNDaW
 DHqGQY/1zGbR27p46IyKT+WRJP1IM9QnGeaflvmC4WalLIlylTOnQdPoea3ZLPIAvTGY
 JEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681841478; x=1684433478;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HWgjCk8Y5OqaGe2854pshW/+RKD+sr2jN2Xg3ngYTlU=;
 b=a3H0sGDTTPsOhv8HnXoxhZ/aYyo4km/gjz0SYoyhqWEnD5MfjwyBtmGetkHPv3LqpH
 sPTmwcJVXHjjTXQ/OvVRj8WuQHT+9RoPw+11mPqI3LPNr7oLYmoo0J/qy7gVZJCwBDz4
 rKvdCDZ9hTWn7K7RRM8nO3IsDNwnSPdhj3CxfQyyAgmH1wBEdKH2F+AQykdwCTB7pDku
 HMq5Ens7sYNLXo5RQf+P6ctZ5cwg95HNkC8l3RBEaLd2FMiLCjmJv0pVRizGDAAqzy4j
 eCT3HjWFgUV30AT2PSJLGR8QOA5CD4Rhe6kTFhaMZtvUortiWNs936yJ8Jo760oABaEc
 O7sQ==
X-Gm-Message-State: AAQBX9dwlqOQjEsTjD+ZBN5eZmBx5uRPpxIgi5+r7nyCWn+6wiUVodR9
 IVlJvjapuOzFd0d04e+Mndfm
X-Google-Smtp-Source: AKy350YmOcATgDshwW4I3Oio+Q2jGgQ1DWDUTEWU/4AbCu5wFYbOM1dZlkwuEXRePapgQy0lKWCsPA==
X-Received: by 2002:adf:eb0b:0:b0:2f5:5d74:4f9f with SMTP id
 s11-20020adfeb0b000000b002f55d744f9fmr2503261wrn.11.1681841478364; 
 Tue, 18 Apr 2023 11:11:18 -0700 (PDT)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a5d4e51000000b002f01e181c4asm13727898wrt.5.2023.04.18.11.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 11:11:18 -0700 (PDT)
From: Arnaud Vrac <avrac@freebox.fr>
Date: Tue, 18 Apr 2023 20:10:45 +0200
Subject: [PATCH 3/4] drm/msm: expose edid to hdmi cec adapter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230418-msm8998-hdmi-cec-v1-3-176479fb2fce@freebox.fr>
References: <20230418-msm8998-hdmi-cec-v1-0-176479fb2fce@freebox.fr>
In-Reply-To: <20230418-msm8998-hdmi-cec-v1-0-176479fb2fce@freebox.fr>
To: Rob Clark <robdclark@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2444; i=avrac@freebox.fr;
 h=from:subject:message-id; bh=yMD8mdwL4UzuJ4urozm6hkE+ei92Sv5WQC0tT/4Y284=;
 b=owEBbQKS/ZANAwAIAXED/9m7NDSrAcsmYgBkPt1Au6G3IkSntJhVUGBaSFWYzjeSj1NkCTBEJ
 2uswfMwbxeJAjMEAAEIAB0WIQSUwb/ndwkXHdZ/QQZxA//ZuzQ0qwUCZD7dQAAKCRBxA//ZuzQ0
 q/Z5D/oD2ynykDobHdfCHo4jJyvHCyzcEClszedW90E66HWQkHzocu8iInucyPKIJBw7jwUVhu/
 5QEH1stGvm4psJzhRZygTYp97ZWaowMkkFU8cQ2E36mNkHkd4UnYgzd7Zu/Fb64tk9IkY0DalVa
 FeKCUacXpHz8jfU5VUB6gV+XgzwIO0aCvoFhuDqbNuNbedlPBUPne1lU5rDGxQexvcrc7YV8vUg
 vOVy0F81ppX3Na5k/bZvjz30L2QV4dWmLryMcKi5PbmbhWme611xnledh7sA6TVc4VZNGjM9A0M
 tGrf6azq2/otDOPSD7zXSPcbPcTf2lXdIhGyI+m9g/zAsNEFkCwSGsbUyBN8b/b90tCipeEaiXD
 ZBZk3oooZvtcOVlDEzequ2KxNBWSPhV+czQR4C7ijyveRip2uneKEUgcSLfwrIRO6ikTA0lp1+L
 sTjOrepDFAGt4dlju9+ej+U/aWuFpuhFxK15g6utEIW2E9SPChSRN+NjEVpjpZe0Q/1leOUK8EK
 QNpdvPpH0WEohlEqexojwNpRXzzZqBiTo9btswZygERbRAYL2q39XWq153dce1yMPxd9lfK2wkz
 hCGPnxV2izV69PTzbAiRAcJGQuMBphx5uROUM7YpUGXkQsT1jxouQLe9aIaQ8vY+kaWZR9xSiy2
 XXqaMH2SFM4z3EQ==
X-Developer-Key: i=avrac@freebox.fr; a=openpgp;
 fpr=6225092072BB58E3CEEC091E75392A176D952DB4
X-Mailman-Approved-At: Thu, 20 Apr 2023 07:12:56 +0000
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Arnaud Vrac <avrac@freebox.fr>,
 freedreno@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When edid has been read after hpd, pass it to the cec adapter so that it
can extract the physical address of the device on the cec bus.
Invalidate the physical address when hpd is low.

Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c |  2 ++
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 17 +++++++++++++----
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 9b1391d27ed39..efc3bd4908e83 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -7,6 +7,7 @@
 #include <linux/delay.h>
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_edid.h>
+#include <media/cec.h>
 
 #include "msm_kms.h"
 #include "hdmi.h"
@@ -256,6 +257,7 @@ static struct edid *msm_hdmi_bridge_get_edid(struct drm_bridge *bridge,
 	hdmi_write(hdmi, REG_HDMI_CTRL, hdmi_ctrl | HDMI_CTRL_ENABLE);
 
 	edid = drm_get_edid(connector, hdmi->i2c);
+	cec_s_phys_addr_from_edid(hdmi->cec_adap, edid);
 
 	hdmi_write(hdmi, REG_HDMI_CTRL, hdmi_ctrl);
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index bfa827b479897..cb3eb2625ff63 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -7,6 +7,7 @@
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/pinctrl/consumer.h>
+#include <media/cec.h>
 
 #include "msm_kms.h"
 #include "hdmi.h"
@@ -230,15 +231,17 @@ enum drm_connector_status msm_hdmi_bridge_detect(
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	enum drm_connector_status stat_gpio, stat_reg;
+	enum drm_connector_status status, stat_gpio, stat_reg;
 	int retry = 20;
 
 	/*
 	 * some platforms may not have hpd gpio. Rely only on the status
 	 * provided by REG_HDMI_HPD_INT_STATUS in this case.
 	 */
-	if (!hdmi->hpd_gpiod)
-		return detect_reg(hdmi);
+	if (!hdmi->hpd_gpiod) {
+		status = detect_reg(hdmi);
+		goto out;
+	}
 
 	do {
 		stat_gpio = detect_gpio(hdmi);
@@ -259,5 +262,11 @@ enum drm_connector_status msm_hdmi_bridge_detect(
 		DBG("hpd gpio tells us: %d", stat_gpio);
 	}
 
-	return stat_gpio;
+	status = stat_gpio;
+
+out:
+	if (!status)
+		cec_phys_addr_invalidate(hdmi->cec_adap);
+
+	return status;
 }

-- 
2.40.0


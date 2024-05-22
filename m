Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C13078CBF92
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 12:51:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2648D10F4BF;
	Wed, 22 May 2024 10:51:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cR3IKvtY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D69310F4C5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 10:51:08 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-51f60817e34so7336787e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 03:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716375066; x=1716979866; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sH41O+MLWcEGoOFILncrbRDXVEgD8N3mxfmUHLQKrxo=;
 b=cR3IKvtYXwi0t+XMkJsotuyRiBbJXoL35epEAyzMAgWSZJBqB/X0FxnF2tFOLT3YCR
 4vPOKhS9ySksS/OGAcMkW14HKDKinzSBsYWSxS9H3I6lTL8kRB8fFYp0l7BjKjtHoDsm
 MfoP/apCSUGAhW8F4fI7HyJaYxVTeIzk/sOnRwqpinmQhV8fIyUIRBeAtOs6i4pYK3wq
 yC9exV12IQRumHe5E6Y9OXw0TLdJ5Ai1v6GcsqnB7VAILUd4W4iRBaLr/GBpYiqQHCpO
 AGWX+b9g8PHwr8cJL86vHiDfaPNs//YlCMLUF84j/YQZGaS5rvf6HEm7FKrnMoJx8yzj
 MF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716375066; x=1716979866;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sH41O+MLWcEGoOFILncrbRDXVEgD8N3mxfmUHLQKrxo=;
 b=AgzTQNbbGSfeecKTIqs1o88MX7ToFYvkyy9BJRZtdOlClD/aeuy9fYBfofdWFM4206
 fgt0/N1adERslDy+gTStBsfJQ0yBCXkFBANA+XnjDZ1aIJK+VFUTCBfXrGgomNHNSjRS
 RFTxABL8CGxgbgevMank4oEq93O848Eb8acOMGRQkLc+9w6jgkW7ztP3kGe3MbLUGfHP
 2zeuGt29X3DZLh3gVGXEpjdWLsidkESuXSLN3kRqtyDrRZ3HyZoaeazHRD9NgU7us7UC
 k7g1Py5wxFYihlQFlIx6pnX89EKqLTNHUexT1VnGbS2CIIE65KA5g2tY4+1+Sqh4bLUl
 +VeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIr6zG/iyCYR0bEcyopUID0LQq6tqshVw+kEUl0unP6ZzqJLKdzoeuPwvqGcxyTvNiMAf+DTkTZ4bBdheS2sV4PH96cMmyUgsCDoP2iaQU
X-Gm-Message-State: AOJu0YyRV89Ml8R7LiwAk9IxiOE1GCQgeqkSXVYVJN9xW18/gE5MncWO
 H83LDRZ+Z3MNtfrqrH0YWdi6UoqcDJ31jNdlobRiwDzYMVh6RVKUNwKCGf7Cssk=
X-Google-Smtp-Source: AGHT+IGCxr96bjX8x1MG+g9F95qGyDTdggpyJqocrQW/lh29CygQ0vqX1n7hNrmg1HrGHeu4jOLkDA==
X-Received: by 2002:a05:6512:239d:b0:523:6354:881e with SMTP id
 2adb3069b0e04-526bf82d6ddmr1341359e87.39.1716375066683; 
 Wed, 22 May 2024 03:51:06 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52431778ec8sm1279126e87.194.2024.05.22.03.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 03:51:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 May 2024 13:51:03 +0300
Subject: [PATCH v2 11/14] drm/msm/hdmi: expand the HDMI_CFG macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240522-fd-hdmi-hpd-v2-11-c30bdb7c5c7e@linaro.org>
References: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
In-Reply-To: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2180;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=5oIxEFONp2G3t75XHmnnmPd77025c+YPgV0mxBOxves=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmTc4QI5yArcsRgIC1Y5yDdP4FZ3iATW4eltThT
 TQdTVy+bJiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZk3OEAAKCRCLPIo+Aiko
 1R0yB/4m6I8/Jn6RfH4DWx6uVdIDZq8+GTkaMxoun5+Z75RRwIBgaFMUeP+IcJTMIJrdQqZ4elt
 DwLqUTU10+3iq8msyPPUrOm168PRnHpiR/R/z9bpquMLQ3folJJy8ss20tOqwdO79yCGJNDm7kj
 /lTzIDraU6Yvjrkzp+lkWsVn50eehgungQNNl/0t695TOt4CfwGMUXFCJKhFNetbYeOb6k/tvgS
 eXkuclZcuQztNyXp+W4JlYGEquZT85pNDH5RtTLW+DcsXEH5J0md45zD9mArVGIgNMMbnHhzvCe
 g5kUTL/W3PO+9QdbjRUczy9tvLveerr/9GEBVQYOASrvtXLR
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Expand the HDMI_CFG() macro in HDMI config description. It has no added
value other than hiding some boilerplate declarations.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 16 ++++++++--------
 drivers/gpu/drm/msm/hdmi/hdmi.h |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index c39a1f3a7505..e160a23e962e 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -223,24 +223,24 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
  * The hdmi device:
  */
 
-#define HDMI_CFG(item, entry) \
-	.item ## _names = item ##_names_ ## entry, \
-	.item ## _cnt   = ARRAY_SIZE(item ## _names_ ## entry)
-
 static const char *pwr_reg_names_8960[] = {"core-vdda"};
 static const char *pwr_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8960_config = {
-		HDMI_CFG(pwr_reg, 8960),
-		HDMI_CFG(pwr_clk, 8960),
+	.pwr_reg_names = pwr_reg_names_8960,
+	.pwr_reg_cnt = ARRAY_SIZE(pwr_reg_names_8960),
+	.pwr_clk_names = pwr_clk_names_8960,
+	.pwr_clk_cnt = ARRAY_SIZE(pwr_clk_names_8960),
 };
 
 static const char *pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
 static const char *pwr_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
-		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(pwr_clk, 8x74),
+	.pwr_reg_names = pwr_reg_names_8x74,
+	.pwr_reg_cnt = ARRAY_SIZE(pwr_reg_names_8x74),
+	.pwr_clk_names = pwr_clk_names_8x74,
+	.pwr_clk_cnt = ARRAY_SIZE(pwr_clk_names_8x74),
 };
 
 /*
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 1e346e697f8e..2a98efa8b6bd 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -89,7 +89,7 @@ struct hdmi_platform_config {
 	const char **pwr_reg_names;
 	int pwr_reg_cnt;
 
-	/* clks that need to be on for hpd: */
+	/* clks that need to be on: */
 	const char **pwr_clk_names;
 	int pwr_clk_cnt;
 };

-- 
2.39.2


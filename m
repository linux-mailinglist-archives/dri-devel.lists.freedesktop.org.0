Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58341A2DAFE
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 06:07:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 914FF10E486;
	Sun,  9 Feb 2025 05:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SjbneAWt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123E710E486
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 05:07:16 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-544ff74be6eso1342331e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 21:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739077634; x=1739682434; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hlPHSmm8yEMkPCpLMXSlS5GXe/d+EX9J4C1uXL4gVw4=;
 b=SjbneAWt/NfraKxIfkSnnYduOtHRMdnfWgbvBBNfidU10BeJzPxrcwkK8Ai7ovhExA
 bUboT722jpIx513G4DM3wYqCXX9WurcwX8y6ZVfdtJQaevWqDBaMQDfeBU/nAhlCjQBd
 urxfZEKVb2N8YrEuYBmRfz9vITphvAggBOcNN8d7gE++6rC19ZMdwfonXPrVEybEwd4g
 eA3s7elbMGgRtd1DHzEepMmg3Se/VZPcS8WE475XJKYY3/emlYUlqvfrsVrhhA3bVysT
 Bb7/47PIbreGg0xCPGb7TE4bTbMImM76OwqBTtNZA8SeRjaGU//C8rj3wpKrgDjX+nhC
 v1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739077634; x=1739682434;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hlPHSmm8yEMkPCpLMXSlS5GXe/d+EX9J4C1uXL4gVw4=;
 b=UG7jTdVXOgnwcZwsTnswUmQve83XAlnOEUBpVh3u8nzwTnqhvggpIBhBayog0dockx
 u/BKUXp6pXjCQ5nD8f8DJW+ZkXsz8Sa24Q8uGlqBt829BILbeMnePi/5kr0A5Dz7h5ht
 TaiJDWzFAECv+Lp6iNbmPrEsN5ezUT8sZx+jG1NDFIzON5HW4YmZVvQt1FmVJok0wJ3N
 OBuI5Alspd/FnT4BJxFsAfm7p4CKGaB6bvqw+cgOm8QtWtQM6XgpO+ib0fcBlDlWeFuy
 vJpTlsqP18sNwWjMN3Mm7R8EWsn3nnF6jNVsDe4x3aZQgRuBPTdtjrbj8cUblxIk/NCr
 LSCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9h1xDZElcGkgWBl5kei32fUhdCClwSzAFF0RGKpOG1Djiu161kV3diR6xAbyJJ9GvoPiwKBhcJvE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1SoMx1Aj7dbclHW7fupgvY+LVoENyMeO7vwghDIlrN8aTh9ed
 DAc+XCXEXFe5q4wsDRFBe2BCpWRVsdV66wuBNVprY6Qrnw09ovnyEYwlpEKWlu8=
X-Gm-Gg: ASbGncuBoFn38ofTP0sBmnlFnru2c3qUDX7EHmQs3IZGngvRr+eKB/CMCeW7jE8nhSN
 4v1fe2repHT3tu2QeWd5uKo/lcSMotQG7ccFffX86wNKQlnFh54AkgbgcFr3zh3gpa96BUy/Mbe
 v/eRFaJKzFFdOES7S9r75AX4niRFjzzn3xblKNf6f4hmzW4vr/m4Vi/vieRE7/LtQnoWL5Ac1VR
 K4oFWmbOQjrbK6X53DWauWpTi1m1JVvxBiH8SEfOyUnRvzfLV4eTxk0gKbcHA0bEGxhFBztarH4
 crqa18kzYhasBIihAVHA6ow=
X-Google-Smtp-Source: AGHT+IEd6dicvlKdQV2rRsUxtxE28CChSKCpQgVen389uSlji8/jD6oj/iczUy7fpLXBwrzv/IwjKQ==
X-Received: by 2002:a05:6512:2399:b0:544:ee5:87b0 with SMTP id
 2adb3069b0e04-54414a96604mr3354167e87.3.1739077634302; 
 Sat, 08 Feb 2025 21:07:14 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54506ef1733sm245576e87.1.2025.02.08.21.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 21:07:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 07:04:56 +0200
Subject: [PATCH v4 12/16] drm/msm/hdmi: expand the HDMI_CFG macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-fd-hdmi-hpd-v4-12-6224568ed87f@linaro.org>
References: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
In-Reply-To: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2467;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7KB7IcHxi0VqX9I5ufq901Xoeq2I7R2imjBgnmx5DoY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqDfjFlNku8IROPqumZ4E4rIS6xVD6X6WWajZV
 tgiLp+pqdCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6g34wAKCRCLPIo+Aiko
 1XtACACmQHPvaloVCRw6WqW1+yRfCCOJWikCAcXTkM4JJ5bJUFfsy1jAtNccjkUo3nJxp/p+GNL
 Y9hsOLA5Pc2IUQ7X+8EaioPypvW6QelbfocUaIB7nlut86mqKsx7Bk8mB+xRWBgCyUTiUH+i9Gs
 QzYz9wWCSdM+ZyY6WFc+RD6QNPD+NHQ+eYtbfWr7BLYyH4yZfnYGi6tpnj76ocxpFo1AVHEYPhd
 B416qy+4Kmw0nFo4RtXec2GOy8UlCuL3msGn0w4yUxM4cVWTN1G+WIbBlql5toxz5913vWTjOMM
 2EEO4x9dTVVWOZShs1WwynUZ5ECsFQruxJivyWRpz/iJo2dn
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

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 16 ++++++++--------
 drivers/gpu/drm/msm/hdmi/hdmi.h |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 8e6e3e6a04bd2d86bcbd23c110f3533f56c17887..3d10fe6f8545198365a047b2f5652081703101aa 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -221,24 +221,24 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
  * The hdmi device:
  */
 
-#define HDMI_CFG(item, entry) \
-	.item ## _names = item ##_names_ ## entry, \
-	.item ## _cnt   = ARRAY_SIZE(item ## _names_ ## entry)
-
 static const char * const pwr_reg_names_8960[] = {"core-vdda"};
 static const char * const pwr_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8960_config = {
-		HDMI_CFG(pwr_reg, 8960),
-		HDMI_CFG(pwr_clk, 8960),
+	.pwr_reg_names = pwr_reg_names_8960,
+	.pwr_reg_cnt = ARRAY_SIZE(pwr_reg_names_8960),
+	.pwr_clk_names = pwr_clk_names_8960,
+	.pwr_clk_cnt = ARRAY_SIZE(pwr_clk_names_8960),
 };
 
 static const char * const pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
 static const char * const pwr_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
-		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(pwr_clk, 8x74),
+	.pwr_reg_names = pwr_reg_names_8x74,
+	.pwr_reg_cnt = ARRAY_SIZE(pwr_reg_names_8x74),
+	.pwr_clk_names = pwr_clk_names_8x74,
+	.pwr_clk_cnt = ARRAY_SIZE(pwr_clk_names_8x74),
 };
 
 static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index a28437beb1574553c1dc00a0c693b390389353e0..fb64652162b6c5e6e2fe3357b89c40e2a28aa47e 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -86,7 +86,7 @@ struct hdmi_platform_config {
 	const char * const *pwr_reg_names;
 	int pwr_reg_cnt;
 
-	/* clks that need to be on for hpd: */
+	/* clks that need to be on: */
 	const char * const *pwr_clk_names;
 	int pwr_clk_cnt;
 };

-- 
2.39.5


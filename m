Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22103A5E84E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 00:23:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290BE10E07E;
	Wed, 12 Mar 2025 23:23:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JnDXHuMI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA9F10E07E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 23:23:22 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5e6c18e2c7dso560204a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 16:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741821801; x=1742426601; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lLItQqCf1upGBSXyTCmQWhPc9KffbuhOFWAykScbb6c=;
 b=JnDXHuMINEo1NW3OYuTKJypXqEdLZ5Dt6coSgOg6dQGOzKNbTTI7UrN6fdE2lZATnT
 /+Cjw1bmj58n3GLxHxxIQP9O5Hnj06isRMqzLOgDKYLkYSFKRtWwTzY4XM2p4Rifab5H
 XCkdVfHRPf+nRD74/s9SgZ6HoIYBN+qegkNYIblXU9+IUNNG4nD5lhQckqC5kBVUWdG/
 nD2+fFTrl4pYhFlelojImNnk9o5dUbNYHwfiRdt/uoOCilGkWQDzU9MY3hEPm+8NLImX
 bAOHipohujXCZAJpVEo1NY/deoqg/DceFpEGo58nEd0H+5S2wgmtgytfNXEWUFTBwK5H
 HDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741821801; x=1742426601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lLItQqCf1upGBSXyTCmQWhPc9KffbuhOFWAykScbb6c=;
 b=oMS2ZD6KAT/sADfNwA2RCeJGA9EOw5yhu9OlcilQ+vMFnCOgHRZPKN6yBitNd4ro6Z
 SZ4G7+klFAmEsaMHpTrHsP49tmjj6VbI1OdfkeE6kHZ84QecVMYGU4f7kOd3/KTeTefL
 yJnG+tCcB1WPk2y4PIBre319w+n/TxceaART2lK6VcuWJ1MiL/IU6t3xv5w8i5h+LhTO
 Nao1StQl40GJEnU3h7TqW4NnonPdPR+o1oSlidBcR6rQhZ31C2dsS2QFMQkikpdqz5Ph
 G4+5ymQObpngjwGVGs+l0aSvoO/dV46gKRbdFACqTfwFnZKTLhm3tkbrE5/wQhFuMALE
 jlOA==
X-Gm-Message-State: AOJu0YzezeIdPND6E2FKXsk/oSFs3jMHwsmTXB+/TsXkFZdFpPTleKxH
 C31F9tt4VxuOe4EA+/6O79rRxzsx8ixJ+8II0XXr6XdmJTN10CkF
X-Gm-Gg: ASbGncuF53fHpJvcmMPt0buQ2COQE0I5ygjgc3h9g/luTuM4abjTm16QX2j2UMO5GRe
 thtmmRpHFINGAN2YnviiDDwB9x0mMFwvcQ+u5yeY9IwMJMrSAWeGu4rj5MyCj2LMLbJaQ8kfcpn
 b0SZScGFY6Sk+IyrrwCBewMCCbzjwr6cJFHJV7FDeW85dPfn7RDd0LwOk+HeGsCgyyMGmIkImAN
 LYCaccw/vnv4DONMkHDyH9+vCM77zHEpv3TN5uuUIQUmW9s6jTHvhoLAujlpHs6b6EwOH7hMk1Y
 Qk/Ta63lk1h5GHYl+lDDb346f9m97NNSbj3dtNJVbatrSIcVo2XDyXeoJJVUlT+Ra3jtNOZiFRy
 WV/JpSkajpymx9IWNdBWFx+5Hlf3i4Es=
X-Google-Smtp-Source: AGHT+IGTT9lbHnlAuZxDgl2ruuPaXaEWe6rhYtxsk5VuLikqAKEjXsCw9yzdc7f50PpSyBlv1A41Nw==
X-Received: by 2002:a05:6402:5109:b0:5e0:58ca:6706 with SMTP id
 4fb4d7f45d1cf-5e5e24db96amr31469423a12.30.1741821800942; 
 Wed, 12 Mar 2025 16:23:20 -0700 (PDT)
Received: from localhost.localdomain (146.10-240-81.adsl-dyn.isp.belgacom.be.
 [81.240.10.146]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e816afe223sm26732a12.70.2025.03.12.16.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 16:23:20 -0700 (PDT)
From: Philippe Simons <simons.philippe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>,
 =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: [PATCH 1/2] drm/panfrost: Add PM runtime flags
Date: Thu, 13 Mar 2025 00:23:18 +0100
Message-ID: <20250312232319.25712-2-simons.philippe@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250312232319.25712-1-simons.philippe@gmail.com>
References: <20250312232319.25712-1-simons.philippe@gmail.com>
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

When the GPU is the only device attached to a single power domain,
core genpd disable and enable it when gpu enter and leave runtime suspend.

Some power-domain requires a sequence before disabled,
and the reverse when enabled.

Add PM flags for CLK and RST, and implement in
panfrost_device_runtime_suspend/resume.

Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 37 ++++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_device.h |  4 +++
 2 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index a45e4addcc19..189ad2ad2b32 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -406,11 +406,38 @@ void panfrost_device_reset(struct panfrost_device *pfdev)
 static int panfrost_device_runtime_resume(struct device *dev)
 {
 	struct panfrost_device *pfdev = dev_get_drvdata(dev);
+	int ret;
+
+	if (pfdev->comp->pm_features & BIT(GPU_PM_RT_RST_ASRT)) {
+		ret = reset_control_deassert(pfdev->rstc);
+		if (ret)
+			return ret;
+	}
+
+	if (pfdev->comp->pm_features & BIT(GPU_PM_RT_CLK_DIS)) {
+		ret = clk_enable(pfdev->clock);
+		if (ret)
+			goto err_clk;
+
+		if (pfdev->bus_clock) {
+			ret = clk_enable(pfdev->bus_clock);
+			if (ret)
+				goto err_bus_clk;
+		}
+	}
 
 	panfrost_device_reset(pfdev);
 	panfrost_devfreq_resume(pfdev);
 
 	return 0;
+
+err_bus_clk:
+	if (pfdev->comp->pm_features & BIT(GPU_PM_RT_CLK_DIS))
+		clk_disable(pfdev->clock);
+err_clk:
+	if (pfdev->comp->pm_features & BIT(GPU_PM_RT_RST_ASRT))
+		reset_control_assert(pfdev->rstc);
+	return ret;
 }
 
 static int panfrost_device_runtime_suspend(struct device *dev)
@@ -426,6 +453,16 @@ static int panfrost_device_runtime_suspend(struct device *dev)
 	panfrost_gpu_suspend_irq(pfdev);
 	panfrost_gpu_power_off(pfdev);
 
+	if (pfdev->comp->pm_features & BIT(GPU_PM_RT_CLK_DIS)) {
+		if (pfdev->bus_clock)
+			clk_disable(pfdev->bus_clock);
+
+		clk_disable(pfdev->clock);
+	}
+
+	if (pfdev->comp->pm_features & BIT(GPU_PM_RT_RST_ASRT))
+		reset_control_assert(pfdev->rstc);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index cffcb0ac7c11..f372d4819262 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -36,10 +36,14 @@ enum panfrost_drv_comp_bits {
  * enum panfrost_gpu_pm - Supported kernel power management features
  * @GPU_PM_CLK_DIS:  Allow disabling clocks during system suspend
  * @GPU_PM_VREG_OFF: Allow turning off regulators during system suspend
+ * @GPU_PM_RT_CLK_DIS: Allow disabling clocks during system runtime suspend
+ * @GPU_PM_RST_ASRT: Allow asserting the reset control during runtime suspend
  */
 enum panfrost_gpu_pm {
 	GPU_PM_CLK_DIS,
 	GPU_PM_VREG_OFF,
+	GPU_PM_RT_CLK_DIS,
+	GPU_PM_RT_RST_ASRT
 };
 
 struct panfrost_features {
-- 
2.48.1


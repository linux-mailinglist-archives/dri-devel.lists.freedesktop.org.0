Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCADA79B90
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 07:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB9310E903;
	Thu,  3 Apr 2025 05:52:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DcqBxx/A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF4B10E0E9
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 05:52:15 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5e5b6f3025dso805452a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 22:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743659534; x=1744264334; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=41S4es1vorl5OsNJysl7iKCyKcDv122Tfjuk/+jgW1g=;
 b=DcqBxx/AXdcX4bWRsgS7Bz9UVWb84bqxFSMMu/wEfQ0OsrDeilmG82n0UqmSctQxe0
 It3ZMmn+sH3r6fAaoXZ1tYBJVRqF3+KHjBr+mQ0EluGIRLclZ1q/q9/JFZ/XVjRTMijF
 A1pDchuopLVeB5AGWosV1+/4GGH/jk2B3JZ+2eysL+ou/xPSVextCDBMPrr2+1MLafTl
 ZlwIuQuP5SJ+oTrRdyQumKcYPLvSWGI8SmhOJm9jk76olheBQcV/TYmG0+f0RbY3CHCF
 NTmCZ3qXzBcsPHm6/JVFyWyzRHoRGFYce6A+P3rfQrVDcZSS4TNOJxofzNLxs0t4cC9q
 GW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743659534; x=1744264334;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=41S4es1vorl5OsNJysl7iKCyKcDv122Tfjuk/+jgW1g=;
 b=sqgsN+hU+RHI3jE/Zu2/cmdYOGXZZXaLxmatp/U2cU/D8lf3uvZl9A6mOcVGFhYBxk
 BYd7CrPpXUDesnVNmQzbLIOfyCAILYN3QmzfGoDUygTHat3iqb1TuBZ9Cirl+X/xqp6P
 g3aMBxKBMB3/CQNoyWrXlK2h3ljmMVYSopjK+7lRMW9TrbUxlO+eHNGV/b0z0lE+OMxW
 bYRVi1GeSOViB4Bkz/oPT7KzVpPP/cymVCQZEzwQofVX56s1iFlb1Ow3cKy0xNnTYyDT
 0s3fEN/3wpBPcg/BTzeNVvz0z//zZlaVOB8KPxmyYaJvstr1rCFch0E4iiqTkAol9oid
 rpVQ==
X-Gm-Message-State: AOJu0YyH+K6kl2KAabEo1cKcT6J3Za8+Ha/Mvh4g/GQdcoOdO/IeHbvl
 kLFEDjyXpsGYFDnJYfymD9YNPFezMVZOu4XtJZmH6rnfmyJsCxMT
X-Gm-Gg: ASbGncsUOTPdNJeo4S+MzKclhB7sK+hCy9CLQTjnr1mYzCH8DXwgh5pLcu8ISjvnrYH
 ZVNSc0Qj8ByhAEZYm0Xkdr1QAWsKcq7cbS9JeyMXS04siVGmnyYUX6jMHnN+ESv4Iy/B7JosXG7
 DHGq6ueHaBRn0Q0ahJTM1vxH/m51gdEHNMu9R3Xsl0g/7BHPo5QTteemACCz4Uz6zIn7hpWehvL
 RxbGxLmRWXT2LWfgk6fvqhN5bntqcqwgIpmhCZnYz818jHaCIPdgsxfWii53xPKCY92SbmUNrQI
 YKh0O1RV9rQpw43Yj/oF1TA6qq8ZjS55isQ5qpCC9AKJI/4VJQx9bMGChnkS5mx67Lu175jwhad
 YYNwxaykLiSmZOiIGwuiIA6KQ7BBXQ7ep96Mh1/Z4kA==
X-Google-Smtp-Source: AGHT+IGvOCvIqvOLzLo5rKC+/GzFkobXsM4xMWpa8Y6+du0CrzHRHpNOACAws2OZUfVAnczPiZyASw==
X-Received: by 2002:a05:6402:42c5:b0:5ed:6192:3759 with SMTP id
 4fb4d7f45d1cf-5f04e6df712mr3822253a12.0.1743659533634; 
 Wed, 02 Apr 2025 22:52:13 -0700 (PDT)
Received: from localhost.localdomain (146.10-240-81.adsl-dyn.isp.belgacom.be.
 [81.240.10.146]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f087714e11sm417236a12.6.2025.04.02.22.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 22:52:12 -0700 (PDT)
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
Subject: [PATCH v2 1/3] drm/panfrost: Add PM runtime flag
Date: Thu,  3 Apr 2025 07:52:08 +0200
Message-ID: <20250403055210.54486-2-simons.philippe@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250403055210.54486-1-simons.philippe@gmail.com>
References: <20250403055210.54486-1-simons.philippe@gmail.com>
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

Add GPU_PM_RT flag, and implement in
panfrost_device_runtime_suspend/resume.

Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 33 ++++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_device.h |  3 ++
 2 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index a45e4addcc19..93d48e97ce10 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -406,11 +406,36 @@ void panfrost_device_reset(struct panfrost_device *pfdev)
 static int panfrost_device_runtime_resume(struct device *dev)
 {
 	struct panfrost_device *pfdev = dev_get_drvdata(dev);
+	int ret;
+
+	if (pfdev->comp->pm_features & BIT(GPU_PM_RT)) {
+		ret = reset_control_deassert(pfdev->rstc);
+		if (ret)
+			return ret;
+
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
+	if (pfdev->comp->pm_features & BIT(GPU_PM_RT))
+		clk_disable(pfdev->clock);
+err_clk:
+	if (pfdev->comp->pm_features & BIT(GPU_PM_RT))
+		reset_control_assert(pfdev->rstc);
+	return ret;
 }
 
 static int panfrost_device_runtime_suspend(struct device *dev)
@@ -426,6 +451,14 @@ static int panfrost_device_runtime_suspend(struct device *dev)
 	panfrost_gpu_suspend_irq(pfdev);
 	panfrost_gpu_power_off(pfdev);
 
+	if (pfdev->comp->pm_features & BIT(GPU_PM_RT)) {
+		if (pfdev->bus_clock)
+			clk_disable(pfdev->bus_clock);
+
+		clk_disable(pfdev->clock);
+		reset_control_assert(pfdev->rstc);
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index cffcb0ac7c11..861555ceea65 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -36,10 +36,13 @@ enum panfrost_drv_comp_bits {
  * enum panfrost_gpu_pm - Supported kernel power management features
  * @GPU_PM_CLK_DIS:  Allow disabling clocks during system suspend
  * @GPU_PM_VREG_OFF: Allow turning off regulators during system suspend
+ * @GPU_PM_RT: Allow disabling clocks and asserting the reset control during
+ *  system runtime suspend
  */
 enum panfrost_gpu_pm {
 	GPU_PM_CLK_DIS,
 	GPU_PM_VREG_OFF,
+	GPU_PM_RT
 };
 
 struct panfrost_features {
-- 
2.49.0


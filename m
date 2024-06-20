Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3571E910A6E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 17:47:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3AED10EAAC;
	Thu, 20 Jun 2024 15:47:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Wc0fNXS9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f100.google.com (mail-wr1-f100.google.com
 [209.85.221.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06EA910EAA1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 15:46:53 +0000 (UTC)
Received: by mail-wr1-f100.google.com with SMTP id
 ffacd0b85a97d-35f090093d8so772533f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718898411; x=1719503211;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=troBauGruOiqXAMgk/gylKtSi6BtH+WWrxM6H29u8b0=;
 b=Wc0fNXS9DHFUNt+mkbnMe2yEBedV603hyTKcv44A4VHNeupbCdEy7H0ElD/LazHx27
 h5lhkSsssML4JZv8GuOELY6B7m50tK7wHBwsmCWPpLYCkYRrhzZKLI3ESR7qBlQpJOfP
 KD3kts0F+iC+qXDjYdW90O10WpdQ2/Qu9gMnpyPpNcUrrjhdnHMrShAw0lbQJnvn+CXn
 u/LgI2FW0Y7wyE8GvQlTidhQYSCtlGg0JC8wXO2Rx5wa5LjIa9kkGjBF+qq087OAbQfE
 uldKxEn9Ym5E95xy5mwtjpEAqMZQeovc/UqXjoULAFKVbOW8xbTvY/42LjzKWh0Ui704
 tpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718898411; x=1719503211;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=troBauGruOiqXAMgk/gylKtSi6BtH+WWrxM6H29u8b0=;
 b=g8btc76szsOI5sQniKKIiptIHaOlp5mz7ZXLbevVkY1DDBtjRy5b3l5kUBfROVpzE/
 p0LaaD+osAWWZQ5Ig2RLUp1SvCjAveWiCSD/DplAXyTZCa8rerK8Xxq119oxKJjQAo+L
 L1l6r65K6iks0sLKShQXt0gON/CDRiF2noTuori+yISRBaq34scFbtd6z2drEpyg1jh2
 1rny7HoSkMQvwlLbBchNx2AEMLmQJEn8Xdmcwmv+928RbiWpMK1GGwaHuN4a9IpWLDEm
 Zxm/uHIDO2KVAeF7YEYsEZtG9p0z5HkgrHX1Au6NliUtbmopEx5waG8s7C2kwXxmPXON
 c7Fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUbe10sDzQcEJMAtEW9znvaAHGSof4OSjhwC+7kbWgf9igyFaP37YGtV5bh/OIG+sBBi2PcChrzTCvkmX01SG3FScXfkLEyRVTWKsw/gHJ
X-Gm-Message-State: AOJu0YwZ1lhvbuu+nBwE0pBu1DxH2s5f4TcKZVkceRWGyW5MqnwuGYVw
 JceaEpmYqBtj+e2hlyU5RWFsc7oR1GDktBmHu8IgGiPbtlv1TMtnBoVhSAsWHLXVmyPvGMerMNo
 K3DYZ5AHn+512Uhegf6piC8oSL0XNtvrA
X-Google-Smtp-Source: AGHT+IFdXboUyzvcjBfEU/duQGFhGUNUjFqTJN9PpIKRfrFwbkfOY9T4de8QxCXX5UCW4mA5gEOVKibACGiP
X-Received: by 2002:adf:fd0e:0:b0:362:8201:fa3 with SMTP id
 ffacd0b85a97d-36317b79325mr4586536f8f.34.1718898411556; 
 Thu, 20 Jun 2024 08:46:51 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 ffacd0b85a97d-360750b75d0sm821550f8f.5.2024.06.20.08.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 08:46:51 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 17/31] drm/vc4: hdmi: Avoid hang with debug registers when
 suspended
Date: Thu, 20 Jun 2024 16:46:18 +0100
Message-Id: <20240620154632.4125308-18-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
References: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
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

From: Dom Cobley <popcornmix@gmail.com>

Trying to read /sys/kernel/debug/dri/1/hdmi1_regs
when the hdmi is disconnected results in a fatal system hang.

This is due to the pm suspend code disabling the dvp clock.
That is just a gate of the 108MHz clock in DVP_HT_RPI_MISC_CONFIG,
which results in accesses hanging AXI bus.

Protect against this.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 21046056f63d..372ac2140001 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -147,6 +147,8 @@ static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
 	if (!drm_dev_enter(drm, &idx))
 		return -ENODEV;
 
+	WARN_ON(pm_runtime_resume_and_get(&vc4_hdmi->pdev->dev));
+
 	drm_print_regset32(&p, &vc4_hdmi->hdmi_regset);
 	drm_print_regset32(&p, &vc4_hdmi->hd_regset);
 	drm_print_regset32(&p, &vc4_hdmi->cec_regset);
@@ -156,6 +158,8 @@ static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
 	drm_print_regset32(&p, &vc4_hdmi->ram_regset);
 	drm_print_regset32(&p, &vc4_hdmi->rm_regset);
 
+	pm_runtime_put(&vc4_hdmi->pdev->dev);
+
 	drm_dev_exit(idx);
 
 	return 0;
-- 
2.34.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9369B912980
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 17:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0555910F1FF;
	Fri, 21 Jun 2024 15:23:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="AkFAvUWu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f100.google.com (mail-wr1-f100.google.com
 [209.85.221.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B15A710F1F1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:21:41 +0000 (UTC)
Received: by mail-wr1-f100.google.com with SMTP id
 ffacd0b85a97d-35f06861ae6so1736027f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 08:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718983300; x=1719588100;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SYsNA09OgUgJP8Gb5DBwWnD5eMEpynl1F0OUZdasweo=;
 b=AkFAvUWuvLqcpfx7TYaNPluLuDZxKY7lpj7qvMYcOExNRjH0yi7MbjkD2b+ge38vG0
 QxQzY7lmHAQFFTebbVbnjKCow6nbG2KVk42hLIQ6GMAci6iVaXqoPZqr+Icdh60We+dh
 1tmbP+nHPBERMfsF8E0Zp+rBBc24NfEGYvLzrEawBSgvT5foJ1u46C4SL7bT5Ir2+Kn7
 0ptKCyyIfWfw5mLYow1lwVCRN/Fm5IIs0SX/bTmR5TI7zF+ke6qGdblHnjVmijQODFZP
 LXZ/d/n43oKGvfKUdl3jkNSyjrYAsxUjz9S9hnurrtLCy7RWtVbz44eweDEVtasrjoU7
 KdjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718983300; x=1719588100;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SYsNA09OgUgJP8Gb5DBwWnD5eMEpynl1F0OUZdasweo=;
 b=UDYYCUiojLoO+wOOBH0tWypJ6BWgNGXSnmH3xCBpTQ3nDefzJDNtuEtT+Bs4RdvMjB
 4o2APxm4Cd9TFAWHcDy774DQ9vI/KjSrUsbH/q++N20rhSuc+4asecfLTBM8O8WL+yEE
 xWEgkJA0UGJjU4o8UVKEjnMOtb1VsnAk1tfwwFoSkbOGqDUzPJCjeKWuxLG/eLydHTjY
 uQqPVx3pzlhYxuWdfesG56U6gpPq0rGrZ/b8pHat40tg31VeJsVM5RDkx1pRmG6/9rz/
 EepiNTE5881+YwADxjpwwynjiSliMnVaTy1twyPggNr2c8uoEvcKvOfbRfWgHhRM52s0
 INEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFmIkahjHZ8IeNaPesWCzOnhFBayAQNpYhLq8rNyJcb2EhwqkMdG2xeNIoFts90S9LMfmVFjXHLGLNN0Pwui8QF2447cBewGQzyKkRtLJm
X-Gm-Message-State: AOJu0YwmrO5ErZw7ClNOIr6Zzhur2NuZCAUEHjCVn4xwhoHbJLQYUw2V
 Vxeq3/N8x+0kJGTK3OFpg3uBHVjr1jUAomS00Rx4aWwrrAxl6kN2qfNIGcm3bI4MKANLT4aNeuI
 HgulEJ3p++qum2hn2MGndcKI60ldtvNH1
X-Google-Smtp-Source: AGHT+IESqapLamsbxM9jXkZrHwRIEHVFWuMJ5P89bY01HRkyNWmzlmTEGlU6Hkez481Q2/EzQC/DUb06Cj07
X-Received: by 2002:a05:6000:12c1:b0:362:bbd8:229d with SMTP id
 ffacd0b85a97d-363176ad606mr6406080f8f.27.1718983299829; 
 Fri, 21 Jun 2024 08:21:39 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 ffacd0b85a97d-3663937cddcsm68967f8f.66.2024.06.21.08.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 08:21:39 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 16/31] drm/vc4: hdmi: Avoid hang with debug registers when
 suspended
Date: Fri, 21 Jun 2024 16:20:40 +0100
Message-Id: <20240621152055.4180873-17-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621152055.4180873-1-dave.stevenson@raspberrypi.com>
References: <20240621152055.4180873-1-dave.stevenson@raspberrypi.com>
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

Fixes: 25eb441d55d4 ("drm/vc4: hdmi: Add all the vc5 HDMI registers into the debugfs dumps")
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index ad88915306f1..680e40a688a5 100644
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


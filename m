Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F6BA01335
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2025 09:07:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4030610E44B;
	Sat,  4 Jan 2025 08:07:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gd3c4s7c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A6D10E44B
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jan 2025 08:07:15 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-385ddcfc97bso10949732f8f.1
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Jan 2025 00:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735977974; x=1736582774; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZS/ZX1fBG7dygLqRqu5QjZtObOqd9hwN0cdzZmyrYT8=;
 b=gd3c4s7c1Ii5RmIXoLf27vRDZHzDm7f8+PBU04W4TbRb8vSL3fdWRc3Pwi/+Y8W50l
 e3JX+A1DmRSRMRZzDnNwRGEj7qVt+nM9SGe8/6HLCsQ5/q+wEWzL2RaIIcRjzF14SVFH
 fYf/KUalMiS7BS5RdgHUOOq9wlLQ22c/okLZX/vtS0JpY5JBJpM53LlbZ49MeUMPr7iw
 djrF5i1l2I0TTm0Fw82kKJgHCBVfqoFARY+ybqVFv11sr+fxxyBb+FmZ/kd0xjLzBgle
 DzyKeVeMkBEDHqt08Ssg6QDaqKqirqTTyJRb4VW+AkVzubkeswPcvx3e/qVzsCvXGNgu
 WNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735977974; x=1736582774;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZS/ZX1fBG7dygLqRqu5QjZtObOqd9hwN0cdzZmyrYT8=;
 b=C+eubdSEZCpc7EI9qTJ+3DzPBCHKbDKUygxHXkzEYZO2/U6Kqy2Ua0wy2m523v4irs
 i6yINDEduZr1+jj87jVPiScUmUBsXxLClRE7ubbgBKeI+jO0Qk90Prji0feuWf1L5oT4
 WpzZO0WWrycFBOc00bCdTKZXMWdqCqr7/TmfYU/PJ9r9bH+cRg8g2zEGJor+oBDYVpzk
 muwhNBD1QazXKmMaOoJUpugSeTnxkv5YZgKkyC8CvEZfvqvhoA/slXY/vR1dRveRlm/u
 B2ap7jLiOXBvwwMOgDkkzXG9U56QfVJDGUc/snM9nmiLIwgOGRXSGeyT02shPXEUDlVy
 D6ug==
X-Gm-Message-State: AOJu0Yx6J2e3pXYD2vXiM/equlNTOSfnhTSo/QQW0W1PZgp1w+O2mx6O
 ekBn0FeW1HnSN7ysWcJj+741iwy74oaPDXO5qewoKpez/LXBfUfzT23tVAWPj5x+v59f9w2ub9F
 qUhQ=
X-Gm-Gg: ASbGncvt4XQt7ubdYohrgRM+MBIQkxVpSt97Wrjj4bx84Epof232nEcC8hucpvnZ/Og
 g+JGFl7x2VB6PTSCzjBVMfGDb9Nd2GykeoVWSeH63/Nm9lWtUBkk6yiMCvAhtBsq4Onqc0nXkLo
 IDRAkhf0zValkxUdBolNg292lgZsBnHNYDydVhA9kH3841oRP7v3CkbdZ3szt5JTjqv1lQo2HzN
 3CHY2OgEnwS7OOdOXHxEzRjq1lzACNj9Ox81w7i4abWSLv69GiGhHM4PPSvEA64
X-Google-Smtp-Source: AGHT+IGdGZoimx/FBpoR+R4h4CLbxbIbSu8JVgBo02g6BMRff5vmL0HSSBCzW7cQMQfvOmwIO9mNWQ==
X-Received: by 2002:a05:6512:1241:b0:540:2ff1:309d with SMTP id
 2adb3069b0e04-5422953c3famr16805045e87.34.1735977517090; 
 Fri, 03 Jan 2025 23:58:37 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f618asm4288029e87.20.2025.01.03.23.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2025 23:58:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 04 Jan 2025 09:58:28 +0200
Subject: [PATCH] drm/display: hdmi-state-helper: add drm_display_mode
 declaration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250104-hdmi-state-display-mode-v1-1-3c06d36e726f@linaro.org>
X-B4-Tracking: v=1; b=H4sIACPqeGcC/x3MSQqAMAxA0atI1gZaBxSvIi5qm2rAiaaIIt7d4
 vIt/n9AKDAJdNkDgU4W3rcEnWdgZ7NNhOySoVBFrbSqcHYro0QTCR3LsZgb190RNo1VeizbUXu
 CVB+BPF//uR/e9wOHN/k1aQAAAA==
X-Change-ID: 20250104-hdmi-state-display-mode-77c01b38b1fe
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=984;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=p6v6QKu6/ixYaBBHXq2HgSkB2G//DdL2lYNdEvwQoP0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBneOoq32dcjrNSdKh/qZSvTz9tRVfPOiOKFO/1X
 YnnKIWGvlGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ3jqKgAKCRCLPIo+Aiko
 1U5NCACn94KybsAESQW+B2e9vs08/zXHSM5WDvGeIIN5HeWIsvFsovvmQrESfkMPbDNiYj6+zp6
 s327S8IZChPOgsItVGQAf8bJiysySh5LoKskZna035wbSvX6EypojgnClXEonPS3tlJvfsTE+xG
 7YqYXwFksP3W2ErrRprp57QpeBSWGabBi4SA+fj6AdHBwydPWBlpXqdLEqxHR1Z5izpzDAjNLVH
 Yr5Sj3IuhFtQMl+nvLBx8yQcfyxSZ19rdeNj+kTQWyyKMNrkPLlRrR2gc8U/V9OPc+j61gV43aM
 2ajPakp365meRX2VjfKpx1JVJVrSHNrbsBvR7Q6IJg8/gvWB
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

Add forward-declaration for the struct drm_display_mode, missed in the
commit 47368ab437fd ("drm/display: hdmi: add generic mode_valid helper")

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/drm/display/drm_hdmi_state_helper.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/display/drm_hdmi_state_helper.h b/include/drm/display/drm_hdmi_state_helper.h
index 9ae19f3caf727f9a0fe06e6afe5fc46db924444f..44ec5c4a7503c8fb522454dc032a7e0ec31cabd5 100644
--- a/include/drm/display/drm_hdmi_state_helper.h
+++ b/include/drm/display/drm_hdmi_state_helper.h
@@ -6,6 +6,7 @@
 struct drm_atomic_state;
 struct drm_connector;
 struct drm_connector_state;
+struct drm_display_mode;
 struct hdmi_audio_infoframe;
 
 enum drm_connector_status;

---
base-commit: 2ea9ec5d2c207a41d523f8804053cee00fe50763
change-id: 20250104-hdmi-state-display-mode-77c01b38b1fe

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


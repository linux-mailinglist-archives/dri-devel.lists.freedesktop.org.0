Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E52C9AAE658
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 18:18:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A8588BE3;
	Wed,  7 May 2025 16:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hoEIdNOQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B1A810E85D
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 16:18:09 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43cf257158fso362195e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 09:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746634688; x=1747239488; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QLwXANYlBMuT5zBgPtCmkgb03VQz6RsgVfqDgCYAJRc=;
 b=hoEIdNOQEB5Xp7o3YpnvMUsVlI7AfeGdg+BpzZK0rvheEVC7KuJXIRRpL8W1o3bcJ0
 8U4GOfCoSVB3OBQKEU+Djmayc9yY+h/wqi5an2/U1PSHLSvIqx1eieuRZU7E8Us47EAH
 0j9oMY/68FZ8qNrexshuvygkHj3sSfhIB0swIzdJ+BPzqsFRaiz/ST3ths81d+BGyCv3
 aBDA3SNdpEgT2sPGw+8j9uFmvAzLSSwJH8cw3S0tsNHTn2Bkn/oOZGe2osrvqt5Nl2r3
 MXzfgHLhUkD/zcHp1JdCIwmPtt5sLMO9u9Ll7CDJ9HUsr6kgY4rqJHBm+J/fE7ckdglz
 aEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746634688; x=1747239488;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QLwXANYlBMuT5zBgPtCmkgb03VQz6RsgVfqDgCYAJRc=;
 b=ift99SLFMdWOoSi2DfTujDo+9dfxwKh5/lhXu1Rciqsk3JBKeQdqmYpC8JFiOoBHQ/
 zv1zS5fXZh8jDpDNbuoY9XBvSDrktBsDE+TDfuMOxXKbb54l3bZSoTvG+sEm+WJie4RP
 pNPQdylK8TObHCFtq5nW+CDQgIhLYlPhTiGqyHW56h0R7UvHbyEM9eSpb6c8rA/IjjLH
 9eSwwr/MXSbmJX1VB+2hlrzQxjZZ0ks4+DUjKF67czaktILMypw67XOJmUdBenImoCAW
 FrcX2dZ5sVBE8L2Qyf6th2K2RYaiov1nFxtIX6vZJbFkPKRPNK8XlbcF3/FHFcBbujsZ
 w6Uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpV8N5K1L2dKNABtlGt3VIgt++1mzCtwBNi2A4/o1Murl+p+84xtjHkwCW1E5/geAIDCIfz3/cV2Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyxi3Aj71EKW1MuLFDjUyWT0Kp+87fR7rQAR0A+BKDZVfZoMVKj
 Gwa9M4f/OLvGPv5mT1jz6uOClYEaK3Wxgi04UbQ8cDOqBtlZwWs8
X-Gm-Gg: ASbGncvCkPnp3KqdHuIAeOgRQMYCEvVr+awyBT9Wn5Ob1321sV1xF8Dno29wbhFWLTl
 6WdaoCycayiY8fp08tZ26sHb4YsVreChLXuxS3oj6xSDPGqTBMsHxM3Gmz/uFajYuvnA3tNlztI
 16w7eqmmAc7VT8iQqSzGUsnOBfuzjX6/OnVKD/CeJkNLqwcKtqRBV4xIsXgbcKnfElBbqLouxVf
 0N3ClkKRmx4+uKRNs9nTPpByzApSrq//LZqaBpu3a5UWLKkmV1NKnO3v8nf3Ni4dapxXX0kMb3R
 vf4mMTV9NK7iuXclYtN+rIzVTHIPHZ6whqqDrA==
X-Google-Smtp-Source: AGHT+IGO760xUJ8iPqAn0f79DygSqXBUJ/ZZmnoLl1Z2maNtSt1vZwHF9eAu1qOC7q4f+S+J1wt9XA==
X-Received: by 2002:a05:600c:3b9d:b0:43d:b3:f95 with SMTP id
 5b1f17b1804b1-441d44e03b7mr26435415e9.28.1746634687421; 
 Wed, 07 May 2025 09:18:07 -0700 (PDT)
Received: from vitor-nb.. ([2001:8a0:e602:d900:beb4:8333:a918:524e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd3af2c8sm5801425e9.31.2025.05.07.09.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 09:18:06 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Vitor Soares <vitor.soares@toradex.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>,
 Jayesh Choudhary <j-choudhary@ti.com>, ivitro@gmail.com,
 stable@vger.kernel.org
Subject: [PATCH v2] drm/bridge: cdns-dsi: Replace deprecated
 UNIVERSAL_DEV_PM_OPS()
Date: Wed,  7 May 2025 17:17:59 +0100
Message-Id: <20250507161800.527464-1-ivitro@gmail.com>
X-Mailer: git-send-email 2.34.1
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

From: Vitor Soares <vitor.soares@toradex.com>

The deprecated UNIVERSAL_DEV_PM_OPS() macro uses the provided callbacks
for both runtime PM and system sleep. This causes the DSI clocks to be
disabled twice: once during runtime suspend and again during system
suspend, resulting in a WARN message from the clock framework when
attempting to disable already-disabled clocks.

[   84.384540] clk:231:5 already disabled
[   84.388314] WARNING: CPU: 2 PID: 531 at /drivers/clk/clk.c:1181 clk_core_disable+0xa4/0xac
...
[   84.579183] Call trace:
[   84.581624]  clk_core_disable+0xa4/0xac
[   84.585457]  clk_disable+0x30/0x4c
[   84.588857]  cdns_dsi_suspend+0x20/0x58 [cdns_dsi]
[   84.593651]  pm_generic_suspend+0x2c/0x44
[   84.597661]  ti_sci_pd_suspend+0xbc/0x15c
[   84.601670]  dpm_run_callback+0x8c/0x14c
[   84.605588]  __device_suspend+0x1a0/0x56c
[   84.609594]  dpm_suspend+0x17c/0x21c
[   84.613165]  dpm_suspend_start+0xa0/0xa8
[   84.617083]  suspend_devices_and_enter+0x12c/0x634
[   84.621872]  pm_suspend+0x1fc/0x368

To address this issue, replace UNIVERSAL_DEV_PM_OPS() with
SET_RUNTIME_PM_OPS(), enabling suspend/resume handling through the
_enable()/_disable() hooks managed by the DRM framework for both
runtime and system-wide PM.

Cc: <stable@vger.kernel.org> # 6.1.x
Fixes: e19233955d9e ("drm/bridge: Add Cadence DSI driver")
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
v1 -> v2
 - Rely only on SET_RUNTIME_PM_OPS() for the PM.

 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index b022dd6e6b6e..5a31783fe856 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -1258,7 +1258,7 @@ static const struct mipi_dsi_host_ops cdns_dsi_ops = {
 	.transfer = cdns_dsi_transfer,
 };
 
-static int __maybe_unused cdns_dsi_resume(struct device *dev)
+static int cdns_dsi_resume(struct device *dev)
 {
 	struct cdns_dsi *dsi = dev_get_drvdata(dev);
 
@@ -1269,7 +1269,7 @@ static int __maybe_unused cdns_dsi_resume(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused cdns_dsi_suspend(struct device *dev)
+static int cdns_dsi_suspend(struct device *dev)
 {
 	struct cdns_dsi *dsi = dev_get_drvdata(dev);
 
@@ -1279,8 +1279,9 @@ static int __maybe_unused cdns_dsi_suspend(struct device *dev)
 	return 0;
 }
 
-static UNIVERSAL_DEV_PM_OPS(cdns_dsi_pm_ops, cdns_dsi_suspend, cdns_dsi_resume,
-			    NULL);
+static const struct dev_pm_ops cdns_dsi_pm_ops = {
+	SET_RUNTIME_PM_OPS(cdns_dsi_suspend, cdns_dsi_resume, NULL)
+};
 
 static int cdns_dsi_drm_probe(struct platform_device *pdev)
 {
-- 
2.34.1


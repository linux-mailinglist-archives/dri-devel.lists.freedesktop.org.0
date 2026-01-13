Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F49D1BC25
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 00:56:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 614EC10E197;
	Tue, 13 Jan 2026 23:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RUdyrFge";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0210410E197
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 23:56:21 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-bcfd82f55ebso129835a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 15:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768348581; x=1768953381; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lTJ4ynp0616z3o5YCO8drlc0gRhwdrvhHZGbi702ovM=;
 b=RUdyrFge0LwQIC/k4hUzLWcvWGXiJfD07/54WcMMgc3jOup70gI4OWXxw6PSRXKaQm
 g4LHFvQGkqtkgvmV5QBIDodV9unS2QKtm5xqe0DyVyR0dmnHXSnQufigmQ5TdUbVg9OG
 tugJ/Pr3/EYAKlBr0M7QNum7MZb/JOtp06/2wh3bCMRv8rW1uUwvLzfpUfPPtgdQ5ZFI
 PQsgHQOSIZvm1DvPmkcgBw6+HStTSTwrqASfQCfTJaoMGRW3g/NLIggSEZ8KNZU7dVLu
 TiBbPdtfStL5/lqaXzVMCBzpyBatiftEeFV/f2uIkZeL11QsdT8AP7L/SL/9AL9jaKM+
 6DIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768348581; x=1768953381;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lTJ4ynp0616z3o5YCO8drlc0gRhwdrvhHZGbi702ovM=;
 b=qKlvcn8kO6uO2J4gAKuEWLftTw4/MYjKmnxkd+mOafRjuqIgPljg8bJwPWFLnFiC/T
 uVwf/NRGX7a/9QTRCPrimj18YhQ/sQ6tMTAn1ADP9WjuxDC5D1Jqzo2TEcqN8izU0F6f
 ceX/S4StoaFkRzqaOD0yBso2uIPzzZw2637BmnRITt0zeojLKtfBI6ABsFwihOiDHDUd
 Ch42YSiel/clMGahxh1ezOAGbGPQvZuOKGGRN27aOW+i6l9JdKBArV059VqAwFK5Hb5V
 zX87kk84xqB3OuXGVF6OwM1S6AHcUUgP9mc6GsvWU0T2houNUlZrGglQqBOtcg+FLD2n
 0FwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzL5woP78hqcaeTlzak1ty/GIR3Znj0GKySEds0gYkcD3N07Lqris5l+Y85s81DXuJ+rYd4kcOxLc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1aENwIfUGdafx/rBNV6eqdWJfGvoa1Fkk1Freb+JhMuilZ7wx
 A/0DYDsj2Aw06E27kRqLwGFvMwuXKMKhCVIo13bSBa5i2bYCU/FMLV7q
X-Gm-Gg: AY/fxX5x7g5L/m2RXRsATqxg6qmMBbkoL+7LHueZk36Khe6uLr23ZP8ycShMSzItWkC
 wEkp3iKaRoT9fFQGN9m1RNSThyhHgmoXNtppAC+z30etZ4e7rKFGzmBzvrF9dmiMJKXFmhiqXvs
 CzLaN5vW7LXXFVq7la37Zt5u9LiJzFF/mpyOLBaQ8hQvM10zzTiItg9A/WAPiQX3HhMzA1feEFz
 2gqCe9oMCGMoz0finkSKw02Pz3fAhui9dtQEEBX7O+Xv+vSFJSAVdDgyXPFskBpqr7CohFBFYn0
 cCfwSZiUtlDPjEvk6j5Uaw7yEZRAx3/7fGoW3iwwEgbCh3aa4xaUvThn4mlqZq+rM9JXQvdfFo8
 fC5bbXGDbalmP1uBudJ91Ro1AQ8G4i28m/Or1WDlXkLFiFbtszWf0YHIerEVHq8PxxYWPJm8Sxe
 lE9hOkKBE=
X-Received: by 2002:a17:903:1246:b0:295:4d97:84f9 with SMTP id
 d9443c01a7336-2a599e24201mr6546515ad.26.1768348581296; 
 Tue, 13 Jan 2026 15:56:21 -0800 (PST)
Received: from archie.me ([210.87.74.117]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3cd4be5sm213300025ad.99.2026.01.13.15.56.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 15:56:20 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id D0A1042BEE9B; Wed, 14 Jan 2026 06:56:17 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] drm/bridge: Separate of_drm_find_bridge() preconditions list
Date: Wed, 14 Jan 2026 06:56:15 +0700
Message-ID: <20260113235615.11124-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1531; i=bagasdotme@gmail.com;
 s=Zp7juWIhw0R1; h=from:subject;
 bh=CsKxxMggD5gAIH4iN5w7k0YXhOegkNTLZgVCXdo1cIY=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDJlptw0PLyy8EmhwcM7b0Ivhqe3FMgvO6Mk/WT5Dqecca
 +rbdSyKHaUsDGJcDLJiiiyTEvmaTu8yErnQvtYRZg4rE8gQBi5OAZhIjRLDX2HVhiW1XvmNO77f
 D7WYwyPkMOuny7pdd0+q5218eCzypTYjw6yukFmXZe66/5oQVZB/UWvKjmVXbFaWlEbOjJoezyb
 jygMA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
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

Sphinx reports htmldocs warnings:

Documentation/gpu/drm-kms-helpers:197: drivers/gpu/drm/drm_bridge.c:1521: ERROR: Unexpected indentation. [docutils]
Documentation/gpu/drm-kms-helpers:197: drivers/gpu/drm/drm_bridge.c:1523: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]

Fix them by separating preconditions list in of_drm_find_bridge()
kernel-doc comment from previous paragraph.

Fixes: 9da0e06abda87b ("drm/bridge: deprecate of_drm_find_bridge()")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20260105155735.3b4012b6@canb.auug.org.au/
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 drivers/gpu/drm/drm_bridge.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 6dcf8f6d3ecfa6..b788c4279add5b 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1518,6 +1518,7 @@ EXPORT_SYMBOL(of_drm_find_and_get_bridge);
  * The bridge returned by this function is not refcounted. This is
  * dangerous because the bridge might be deallocated even before the caller
  * has a chance to use it. To use this function you have to do one of:
+ *
  * - get a reference with drm_bridge_get() as soon as possible to
  *   minimize the race window, and then drm_bridge_put() when no longer
  *   using the pointer

base-commit: c40b50c3cfbe274f054c6a2d2fa62cd7c4650460
-- 
An old man doll... just what I always wanted! - Clara


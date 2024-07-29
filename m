Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BAD93F605
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 15:00:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9583610E3C3;
	Mon, 29 Jul 2024 13:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="UJNn9+wZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 401 seconds by postgrey-1.36 at gabe;
 Mon, 29 Jul 2024 13:00:03 UTC
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3344D10E3C2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 13:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding; s=k1; bh=AEUxIToG3v1K/Z
 GsboZgQx+hSbOpaKrPzxDlIPxesk4=; b=UJNn9+wZ76LIwTZehNfiDorYI/HOCT
 v+5gM9rlP/GCEXI4mBhf2W37OK2i09eS9L79TcaXWP8ZPtDx+cW5q7f7U2potQyO
 hmDt8UB/x/iTWBmfQrcznTUUhcduuWszYvRKdamWi3HL0q9hec+mXqvy7ixRbftj
 ftiurjA3LCmkJqDCco4ZDXAcNOGRM67jjPTkQIXFxt4HxYkh2bgaL+mwIjzLp4LW
 GYSCKhrk0IWIg56BA06fnlsUfRxaq0uunNXYuGCnQMcvTAJPozScAL09E7C9279C
 +FMtytxeByNoJDpuL4bDcMn4Az8ysexwBo245llI17lhRL4beAxsQKmw==
Received: (qmail 4107496 invoked from network); 29 Jul 2024 14:53:19 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 29 Jul 2024 14:53:19 +0200
X-UD-Smtp-Session: l3s3148p1@G/hkWGIeh3VtKPFk
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Subject: [PATCH] MAINTAINERS: update email for Konrad Dybcio
Date: Mon, 29 Jul 2024 14:51:17 +0200
Message-ID: <20240729125225.2090-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
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

The old email address bounced. I found the newer one in MAINTAINERS,
so update entries accordingly.

Cc: Konrad Dybcio <konradybcio@kernel.org>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Against v6.11-rc1. Still needs ack from Konrad Dybcio

 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 42decde38320..7b599269a821 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2745,7 +2745,7 @@ F:	include/linux/soc/qcom/
 
 ARM/QUALCOMM SUPPORT
 M:	Bjorn Andersson <andersson@kernel.org>
-M:	Konrad Dybcio <konrad.dybcio@linaro.org>
+M:	Konrad Dybcio <konradybcio@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git
@@ -7106,7 +7106,7 @@ F:	drivers/gpu/drm/tiny/panel-mipi-dbi.c
 DRM DRIVER for Qualcomm Adreno GPUs
 M:	Rob Clark <robdclark@gmail.com>
 R:	Sean Paul <sean@poorly.run>
-R:	Konrad Dybcio <konrad.dybcio@linaro.org>
+R:	Konrad Dybcio <konradybcio@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
 L:	freedreno@lists.freedesktop.org
@@ -18771,7 +18771,7 @@ F:	include/uapi/drm/qaic_accel.h
 
 QUALCOMM CORE POWER REDUCTION (CPR) AVS DRIVER
 M:	Bjorn Andersson <andersson@kernel.org>
-M:	Konrad Dybcio <konrad.dybcio@linaro.org>
+M:	Konrad Dybcio <konradybcio@kernel.org>
 L:	linux-pm@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
-- 
2.43.0


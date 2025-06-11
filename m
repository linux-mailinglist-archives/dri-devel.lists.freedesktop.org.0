Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8026AAD6313
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 00:52:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C9D10E73D;
	Wed, 11 Jun 2025 22:52:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="WNpGN0k6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CE410E740
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 22:52:10 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-7485bcb8b7cso382938b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 15:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1749682330; x=1750287130;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=84Hgd2RGx/mxW+pZm1vBUVDnwbeeMzQmnUi3fAiJya8=;
 b=WNpGN0k6itp7E8qVe7P/B1a8VCQnw6y9i7CZhg8sHLPrs3lpb/r4MD2aXlNpEVIyii
 sCVwHN6ZmHvcrhk1l1R5eQbbUvPGmC3+MUBFwVswdLfiSh/B9CZORxp5sVshSLdpZ7qN
 YlL8Xd21OBFCF06eLcLgpGe3dZbDJtzdm9Uo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749682330; x=1750287130;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=84Hgd2RGx/mxW+pZm1vBUVDnwbeeMzQmnUi3fAiJya8=;
 b=X/3OxR7DlHzz1sHi/91mRYsb2d6LLkOgGq56neY87wyKiaxuAlbr7ngQokRwxoUheP
 YGgj0DyEInX63NgONmVCVXeWq8fjCK2L8oVI76BITGOdEp99VCZ/XtKR1NRwnQHLy8xo
 XqLsR2ZCgnMro13vFC67rrn4DkCZuvSBMX1vLm9ATFsXyoob63niDlyp/Q/vMaQET3f1
 d+R9VpePfW2tmmsWtl4KNQP0VTGoCu+mztugl90FwHvIDUprQ1e+hjz5KLXhbyzQhWIx
 HqqG5ZgWrJPcviZ9mMxc1pizahqKU5tcFXD/xjuOLi16/fxLs7YKkJuhI/ekMIbgdW8T
 UeQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7o+ODOWDFfIPDmkxK8mrf/QcpPTPtVel38XNt8YAeOuPPSMImgjcZlgLk6a7qo1RUmwljEI3yDAs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqUlmSpzx+P7fAodroN0sJt5MsvHBbNH5ADSzVG/9kRC/qeGJP
 GmGubN67pSh0FTIbJzLWkRtXYeyYkbX0pHXhPpKDnWwEeC+yS7sw32je4RE5/QaLHw==
X-Gm-Gg: ASbGnculQ93Do6Y1fGoXnxN54MdmFN+ndkOwhXipcs1Mxo6/xE19tISaqd+KYs1nURN
 0V+RVlyAuv+P4qV2qG9Hs2Uvv4FZPOS7bKtUuv8L9/d6M0q+PsFe5XvRFJPXT17gazcGHPepqmQ
 PobEtdUf8KqYTFwLToGn0WeH+uVgDQjkMU+0vzE4F9PsDGxRLOa1zlceTaZHs08v3WW9FVNPy2y
 UyY7bggln3N52Es+uYGFujZoaL82e2BXKe+UnYB/XUxf2EgIIFPj4TEuJwQ/u/RLgQLObj4471r
 wjgyjDxJ61AGlw060EmZag5+/+iFpOJSsUo5u5T99KYlSNB55Td9jumf1PCe8uCX56S1yHjKXG1
 Co0QnsxNssjN6uEO9iJydPpwZMhSYlezj2TXSF5GLjxE8STKix6o=
X-Google-Smtp-Source: AGHT+IHokrxQ7fax+fHfTiQw8NQRpdyltqL4MaEQkpkazv6Uh48EJr62tYuvVX4wB/mn2W3oIn91NA==
X-Received: by 2002:a05:6a00:1787:b0:746:25d1:b711 with SMTP id
 d2e1a72fcca58-7486ce17a7cmr5771270b3a.17.1749682329697; 
 Wed, 11 Jun 2025 15:52:09 -0700 (PDT)
Received: from justonli3.c.googlers.com.com
 (11.103.168.34.bc.googleusercontent.com. [34.168.103.11])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74880a0bf68sm90555b3a.163.2025.06.11.15.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 15:52:08 -0700 (PDT)
From: Juston Li <justonli@chromium.org>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Yiwei Zhang <zzyiwei@google.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Juston Li <justonli@chromium.org>
Subject: [PATCH v4 1/2] gpu/trace: make TRACE_GPU_MEM configurable
Date: Wed, 11 Jun 2025 15:51:23 -0700
Message-ID: <20250611225145.1739201-1-justonli@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
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

Move the source to a better place in Device Drivers -> Graphics support
now that its configurable.

v4:
 - Move source location (Tvrtko)

v3:
 - Patch introduced to replace per-driver config (Lucas)

Signed-off-by: Juston Li <justonli@chromium.org>
---
 drivers/Kconfig           |  2 --
 drivers/gpu/trace/Kconfig | 11 ++++++++++-
 drivers/video/Kconfig     |  1 +
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/Kconfig b/drivers/Kconfig
index 7c556c5ac4fdd..c5edbd2288a19 100644
--- a/drivers/Kconfig
+++ b/drivers/Kconfig
@@ -209,8 +209,6 @@ source "drivers/thunderbolt/Kconfig"
 
 source "drivers/android/Kconfig"
 
-source "drivers/gpu/trace/Kconfig"
-
 source "drivers/nvdimm/Kconfig"
 
 source "drivers/dax/Kconfig"
diff --git a/drivers/gpu/trace/Kconfig b/drivers/gpu/trace/Kconfig
index c24e9edd022e6..cd3d19c4a201c 100644
--- a/drivers/gpu/trace/Kconfig
+++ b/drivers/gpu/trace/Kconfig
@@ -1,4 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 config TRACE_GPU_MEM
-	bool
+	bool "Enable GPU memory usage tracepoints"
+	default n
+	help
+	  Choose this option to enable tracepoints for tracking
+	  global and per-process GPU memory usage. Intended for
+	  performance profiling and required for Android.
+
+	  Tracepoint availability varies by GPU driver.
+
+	  If in doubt, say "N".
diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index 5df981920a945..96adceab2df00 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -70,5 +70,6 @@ if FB_CORE || SGI_NEWPORT_CONSOLE
 
 endif
 
+source "drivers/gpu/trace/Kconfig"
 
 endmenu
-- 
2.50.0.rc1.591.g9c95f17f64-goog


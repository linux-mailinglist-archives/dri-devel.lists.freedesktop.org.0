Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DF2572970
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 00:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3455A10E93D;
	Tue, 12 Jul 2022 22:42:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BFDE12A3C1;
 Tue, 12 Jul 2022 22:42:51 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id 70so8697167pfx.1;
 Tue, 12 Jul 2022 15:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EOQK1yQsd3sxXf3ifqolSQDmS565G3PBpmyW4cpx2HA=;
 b=MSBeQK///1NrBGbw7DV7tnTXdkZYNFjowCKH7HWWo6GHJtRs2JBzAZOUS8wJPeS3uB
 FdmbaYtn+hTpf1LGNZgEyeUWRG1cVzTz/1oEyLDknyKU4hUPvpIGJ+X4vRY3nURrKaay
 11uzpc4OgaK1zQf7vNDHPl0glTe00vOyLDwPjtJLPoJSgRslvY7XqKtECfR51PBum7Vz
 +hrGteaVNQuO34sksAm9/YBxtGc0pA3exzkgYaL3hFnNKNEJn3y4DsWBEdU8q+fmIgR9
 0JZlBNgeX/nc44836d3Gy6EyMmJKZyLrer3qSJ861OHV3LL6WQVB1FeqbxasQjhsatFy
 ILTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=EOQK1yQsd3sxXf3ifqolSQDmS565G3PBpmyW4cpx2HA=;
 b=4DYuYs3SvRVdGCWIQ7mGNT04+78coAzd+UnS1Ig+Q3gXdZxjYRCWU0XZV+1xHGr58n
 jv6L6c51lmXQI0d24UhiveC/K+yKLWS3TUFEbzNqpkvEQ+BdaboZdCFXclZUQjxwXrfa
 y6PDLkwFo69qGnvdMz+3QGesL01SW4AKDwdQFbsI2MRKLD2WBhOkC5QPXV5NFsAYvTtB
 uM7IUSq18RSthpo/60o23ARbuwDvfg3B3BxC9dFHBc79MvkF5xr0YTZHJzS4/2T+nmT3
 i6Toso3SYhq5Vpi63YDFceqeAsDUrptZc2YohZE0B1ODgloNgt3PXxQs7wrUoXqbgTv+
 HBMA==
X-Gm-Message-State: AJIora9RDhX48sPZ5vreYf+1KciMrCUYewrjR4CO+EYsdWaBn6628p4A
 gP6KUlX0lgynI6x219p/4i1R9yfVfFsXDg==
X-Google-Smtp-Source: AGRyM1tLJIcznWizk9iJQMKwRvzQyZlrxC0AQCyjI0CRaOuIOSRtFl2r3Pu3cEB73Omx8SddXOOy/g==
X-Received: by 2002:a63:6c42:0:b0:3fe:465:7a71 with SMTP id
 h63-20020a636c42000000b003fe04657a71mr398029pgc.101.1657665770859; 
 Tue, 12 Jul 2022 15:42:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 6-20020a631446000000b00415fcde23a4sm4552956pgu.27.2022.07.12.15.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 15:42:49 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH] drm/amd/display: Enable building new display engine with KCOV
 enabled
Date: Tue, 12 Jul 2022 15:42:47 -0700
Message-Id: <20220712224247.1950273-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.35.1
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
Cc: Arnd Bergmann <arnd@arndb.de>, Leo Li <sunpeng.li@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The new display engine uses floating point math, which is not supported
by KCOV. Commit 9d1d02ff3678 ("drm/amd/display: Don't build DCN1 when kcov
is enabled") tried to work around the problem by disabling
CONFIG_DRM_AMD_DC_DCN if KCOV_INSTRUMENT_ALL and KCOV_ENABLE_COMPARISONS
are enabled. The result is that KCOV can not be enabled on systems which
require this display engine. A much simpler and less invasive solution is
to disable KCOV selectively when compiling the display enagine while
keeping it enabled for the rest of the kernel.

Fixes: 9d1d02ff3678 ("drm/amd/display: Don't build DCN1 when kcov is enabled")
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Leo Li <sunpeng.li@amd.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/gpu/drm/amd/display/Kconfig     | 2 +-
 drivers/gpu/drm/amd/display/dc/Makefile | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
index b4029c0d5d8c..96cbc87f7b6b 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -6,7 +6,7 @@ config DRM_AMD_DC
 	bool "AMD DC - Enable new display engine"
 	default y
 	select SND_HDA_COMPONENT if SND_HDA_CORE
-	select DRM_AMD_DC_DCN if (X86 || PPC64) && !(KCOV_INSTRUMENT_ALL && KCOV_ENABLE_COMPARISONS)
+	select DRM_AMD_DC_DCN if (X86 || PPC64)
 	help
 	  Choose this option if you want to use the new display engine
 	  support for AMDGPU. This adds required support for Vega and
diff --git a/drivers/gpu/drm/amd/display/dc/Makefile b/drivers/gpu/drm/amd/display/dc/Makefile
index b4eca0236435..b801973749d2 100644
--- a/drivers/gpu/drm/amd/display/dc/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/Makefile
@@ -26,6 +26,9 @@
 DC_LIBS = basics bios dml clk_mgr dce gpio irq link virtual
 
 ifdef CONFIG_DRM_AMD_DC_DCN
+
+KCOV_INSTRUMENT := n
+
 DC_LIBS += dcn20
 DC_LIBS += dsc
 DC_LIBS += dcn10
-- 
2.35.1


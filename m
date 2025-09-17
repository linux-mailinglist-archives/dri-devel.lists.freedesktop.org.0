Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9D6B7FAF7
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 16:03:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4C910E83D;
	Wed, 17 Sep 2025 14:03:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="PEB67Qwu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id AA50910E83D
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 14:03:32 +0000 (UTC)
Received: from
 linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
 (linux.microsoft.com [13.77.154.182])
 by linux.microsoft.com (Postfix) with ESMTPSA id 5C86B2018E7D;
 Wed, 17 Sep 2025 07:03:28 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5C86B2018E7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1758117808;
 bh=+S/7jRUtEY2oOKEMYyruSC0TCMCRVkdm3aSdtS0WsSs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=PEB67Qwuwpz0mYUXQ58kC1t65Lb10hInkPI2Q4FQplvf/KGN6Uafghd+vLV8gonCY
 gbekvyiCdKwfA9EDO4b0dTssrf4iIG5zjsobXdf9fxappCTJjld0gKlTbnz3nK6PdJ
 W+VzhmmAdfB+Lqv917oNQnr0pst2I2jjhHy1Bdjo=
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
To: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 ssengar@linux.microsoft.com, mhklinux@outlook.com,
 ptsm@linux.microsoft.com, rdunlap@infradead.org,
 bartosz.golaszewski@linaro.org, gonzalo.silvalde@gmail.com, arnd@arndb.de,
 tzimmermann@suse.de, decui@microsoft.com, wei.liu@kernel.org,
 deller@gmx.de, kys@microsoft.com, haiyangz@microsoft.com
Subject: [PATCH 2/2] MAINTAINERS: Mark hyperv_fb driver Obsolete
Date: Wed, 17 Sep 2025 07:03:24 -0700
Message-Id: <1758117804-20798-1-git-send-email-ptsm@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <E5C2A201B1BD>
References: <E5C2A201B1BD>
X-Spam-Status: No, score=-2.0 required=1.7 tests=BAYES_00,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,UNPARSEABLE_RELAY,URIBL_DBL_BLOCKED_OPENDNS,
 URIBL_ZEN_BLOCKED_OPENDNS autolearn=ham autolearn_force=no version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
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

The hyperv_fb driver is deprecated in favor of Hyper-V DRM driver. Split
the hyperv_fb entry from the hyperv drivers list, mark it obsolete.

Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
---
 MAINTAINERS | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f6206963efbf..aa9d0fa6020b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11424,7 +11424,6 @@ F:	drivers/pci/controller/pci-hyperv-intf.c
 F:	drivers/pci/controller/pci-hyperv.c
 F:	drivers/scsi/storvsc_drv.c
 F:	drivers/uio/uio_hv_generic.c
-F:	drivers/video/fbdev/hyperv_fb.c
 F:	include/asm-generic/mshyperv.h
 F:	include/clocksource/hyperv_timer.h
 F:	include/hyperv/hvgdk.h
@@ -11438,6 +11437,16 @@ F:	include/uapi/linux/hyperv.h
 F:	net/vmw_vsock/hyperv_transport.c
 F:	tools/hv/
 
+HYPER-V FRAMEBUFFER DRIVER
+M:	"K. Y. Srinivasan" <kys@microsoft.com>
+M:	Haiyang Zhang <haiyangz@microsoft.com>
+M:	Wei Liu <wei.liu@kernel.org>
+M:	Dexuan Cui <decui@microsoft.com>
+L:	linux-hyperv@vger.kernel.org
+S:	Obsolete
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git
+F:	drivers/video/fbdev/hyperv_fb.c
+
 HYPERBUS SUPPORT
 M:	Vignesh Raghavendra <vigneshr@ti.com>
 R:	Tudor Ambarus <tudor.ambarus@linaro.org>
-- 
2.49.0


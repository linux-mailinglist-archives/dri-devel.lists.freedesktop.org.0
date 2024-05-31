Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9611B8D6413
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 16:11:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61A2F10E2B0;
	Fri, 31 May 2024 14:11:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QVd9zaMo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A7B10E1E9;
 Fri, 31 May 2024 14:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717164665; x=1748700665;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Jr9+4d626a6bVHXAZebNVIeaEt+0aIeZfHVPmB0HWTU=;
 b=QVd9zaMoR7xCIEOMHvzG1m3s+IrH+58MHiLV+3IXhVkqniszyfbPyDoP
 cBf+8rdcznVKGXDhJKVOvKTYE2+9NGkRrjvqHaUkWU9Ds0dDPgQQPRCT0
 n76gfm5PIqYG1ZqB/U9YwpTOgygxPBntDP/ycKODj/m9RmPxf9UJqVloE
 8R4sRaIo3oo9QUB6JKhbVljbGsbX5b4eZJZzB0C1v0TOXW/47qSyoW4wR
 aOsw7f0NCvHBCL561JDcnwiSaceo8DWl8h29GrVqgn2hih3pF/qpvIDfa
 +qk93kIqxY20Fs0bOKWyKiGoHvYmSeYzmr6Vzb/9pWMhlmOh7pilpJvhT w==;
X-CSE-ConnectionGUID: kkcietbSSUi4/CI/yePF/A==
X-CSE-MsgGUID: MOGQT7HhQPKzJvuHfUQL6A==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24370439"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="24370439"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 07:11:04 -0700
X-CSE-ConnectionGUID: RQ0/L3NvR1S6TrsgYIma9Q==
X-CSE-MsgGUID: ARK77DD+QoKLLid+umIJOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="67369288"
Received: from unknown (HELO fedora..) ([10.245.245.125])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 07:11:02 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Update Xe driver maintainers
Date: Fri, 31 May 2024 16:10:51 +0200
Message-ID: <20240531141051.504610-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add Rodrigo Vivi as an Xe driver maintainer.

Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 572be0546e21..8f9982c99257 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11037,6 +11037,7 @@ F:	include/uapi/drm/i915_drm.h
 INTEL DRM XE DRIVER (Lunar Lake and newer)
 M:	Lucas De Marchi <lucas.demarchi@intel.com>
 M:	Thomas Hellström <thomas.hellstrom@linux.intel.com>
+M:	Rodrigo Vivi <rodrigo.vivi@intel.com>
 L:	intel-xe@lists.freedesktop.org
 S:	Supported
 W:	https://drm.pages.freedesktop.org/intel-docs/
-- 
2.44.0


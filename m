Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7288D778A
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2024 21:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD4D10E051;
	Sun,  2 Jun 2024 19:13:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aLwXXh48";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F6DC10E012;
 Sun,  2 Jun 2024 19:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717355590; x=1748891590;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rKvVyYSCxCQMA8ehm3RHTVkgQ/7MJe3SBF+8guMhULA=;
 b=aLwXXh489f8xbk2AENswTm19pIeNXaDgFzdgOtjLM2coxA9HZQ6/bF0Z
 DEW61gxcUjL3IgD07AKrSWVPXUqyutr//O7CoTEgPyz2RxakZfVpcFqlb
 iT5TprFHzr79M978HTFAJUEpV/1PXnFy3TaYz5QnZ0y59FBEjXp/LbhIA
 FmqjFPSc6sDK9KNJKUdUYEXr3VbvrByxGfGWNo4GPbNUqw7kqFUSR7ZfF
 fLnRezhcwROVG/YIglpuQiuvHiwLVPGZp2nMxG90oqtcy+6nPM4bK1fDF
 h1jVs2OgH1FRxNYdjb/nSPcYK5PrzoIn8iV1QKN6KR0w/IUnUb1qqmQ/9 A==;
X-CSE-ConnectionGUID: PcjD3rSQRUKvTUQKRiw5Vg==
X-CSE-MsgGUID: VuaQo9hXRi6BkqVzhp/c9g==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="17672840"
X-IronPort-AV: E=Sophos;i="6.08,209,1712646000"; d="scan'208";a="17672840"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2024 12:10:36 -0700
X-CSE-ConnectionGUID: JwjuhTSGR0CR2oAZY/9pjg==
X-CSE-MsgGUID: blwVm64rRbCUlj2XhiZNTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,209,1712646000"; d="scan'208";a="67520106"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.245.150])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2024 12:10:34 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] MAINTAINERS: Update Xe driver maintainers
Date: Sun,  2 Jun 2024 21:09:59 +0200
Message-ID: <20240602190959.2981-1-thomas.hellstrom@linux.intel.com>
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

v2:
- Cc also Lucas De Marchi (Rodrigo vivi)
- Remove a blank line in commit the commit message (Lucas De Marchi)

Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
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


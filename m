Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3F88FCD30
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 14:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A81D510E5CE;
	Wed,  5 Jun 2024 12:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G0K1dXLD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1EE10E5CE;
 Wed,  5 Jun 2024 12:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717591104; x=1749127104;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3zw5PLJyPNd20RgR0QSeLxMW0Fp6v4dvSRy4Tva/Mwk=;
 b=G0K1dXLD+jPlpWLFNVhbfuZ3xpFFdzaoy9A2NDqFbalW9G8aGdrOF1ur
 46PA3mKaZBbMT45gyUhtxbwbOCvOC0MgpIRO1icHJH5N5mjtLhND/8hUv
 EbBK09x92LyydU8W8M3MNCqkGcG6WvPDeTPVLl/wXmvcYu+IQMpe+6TD4
 tQDgI+l3VvF6ezzW729/0G0bZ5/NAqLaDcnkmXrmhSW0L8eZyXbTw71PQ
 FqdeGMGqPyNoJAY6GAJron6jM2ddClIdTegOcz8dWRDCR5OQMTYdX/qWo
 /k96EG6LH6P7Kfj03cf8OXCFUgzx9LZ0gbY2uBUDRP+c6qTMeVcA+ue9P g==;
X-CSE-ConnectionGUID: wKuLWn80QdKHFLlpIi8Q3Q==
X-CSE-MsgGUID: mwIcIoxUSXKUqSshBh+MqA==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="36728151"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="36728151"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 05:38:24 -0700
X-CSE-ConnectionGUID: 4KINw7sbS5q7bMjWZhEWiQ==
X-CSE-MsgGUID: Hgq1FBNHQJiEG0fBjyuN8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="38216580"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa007.jf.intel.com with ESMTP; 05 Jun 2024 05:38:22 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 jani.nikula@intel.com
Subject: [PATCH v12 2/9] drm-tip: 2024y-06m-05d-09h-52m-50s UTC integration
 manifest
Date: Wed,  5 Jun 2024 17:57:55 +0530
Message-Id: <20240605122802.488124-3-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240605122802.488124-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20240605122802.488124-1-mitulkumar.ajitkumar.golani@intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

---
 integration-manifest | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 integration-manifest

diff --git a/integration-manifest b/integration-manifest
new file mode 100644
index 000000000000..d840964a2208
--- /dev/null
+++ b/integration-manifest
@@ -0,0 +1,28 @@
+drm drm-fixes c3f38fa61af77b49866b006939479069cd451173
+	Linux 6.10-rc2
+drm-misc drm-misc-fixes 629f2b4e05225e53125aaf7ff0b87d5d53897128
+	drm/panel: sitronix-st7789v: Add check for of_drm_get_panel_orientation
+drm-intel drm-intel-fixes c3f38fa61af77b49866b006939479069cd451173
+	Linux 6.10-rc2
+drm-xe drm-xe-fixes 0698ff57bf327d9a5735a898f78161b8dada160b
+	drm/xe/pf: Update the LMTT when freeing VF GT config
+drm drm-next c3f38fa61af77b49866b006939479069cd451173
+	Linux 6.10-rc2
+drm-misc drm-misc-next-fixes 539d33b5783804f22a62bd62ff463dfd1cef4265
+	drm/komeda: remove unused struct 'gamma_curve_segment'
+drm-intel drm-intel-next-fixes 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
+	Linux 6.10-rc1
+drm-xe drm-xe-next-fixes d69c3d4b53829097b8948d6791ea32c07de3faab
+	drm/xe/ads: Use flexible-array
+drm-misc drm-misc-next 310ec03841a36e3f45fb528f0dfdfe5b9e84b037
+	dma-buf: align fd_flags and heap_flags with dma_heap_allocation_data
+drm-intel drm-intel-next 17419f5c6d409bcce5d094279a6fed5d5dbdba12
+	drm/i915: Protect CRC reg macro arguments for consistency
+drm-intel drm-intel-gt-next a09d2327a9ba8e3f5be238bc1b7ca2809255b464
+	drm/i915/gt: Fix CCS id's calculation for CCS mode setting
+drm-xe drm-xe-next 8b01f970ee890574b3607c85781354a765c849bd
+	drm/xe: Use missing lock in relay_needs_worker
+drm-intel topic/core-for-CI a51e92845f99879e971677482b0f5fd96ef10d3c
+	thunderbolt: Add Kconfig option to disable PCIe tunneling
+drm-xe topic/xe-for-CI 428c3ef38ef5565140b2104f0d3dafdae9056ca9
+	Revert "drm/xe/gsc: define GSC FW for LNL"
-- 
2.25.1


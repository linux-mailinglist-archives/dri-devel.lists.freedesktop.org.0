Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B65682C659D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:15:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B956EDA9;
	Fri, 27 Nov 2020 12:12:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E0726ED99;
 Fri, 27 Nov 2020 12:12:49 +0000 (UTC)
IronPort-SDR: C0YMZUmPHDoldqDT735DnsWBQ7ANqqLrbSwp64jp+NVA3+ahypYpd7OdQR/tw3jZZwQyOBZOa+
 UfTdb5EXbnzg==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="168883897"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="168883897"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:12:36 -0800
IronPort-SDR: 4V6rosJSJouPjnIA8yUUWZ6ne6l+ETLqYYnW3i7QKva+l/CwJEPyqTVjq0r/UKPmkHU8qXAkuV
 ysKq0QXH0ATw==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548030085"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:12:35 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 161/162] drm/i915/dg1: allow pci to auto probe
Date: Fri, 27 Nov 2020 12:07:17 +0000
Message-Id: <20201127120718.454037-162-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
MIME-Version: 1.0
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lucas De Marchi <lucas.demarchi@intel.com>

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/i915_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index c3d9b36ef651..603976b9a973 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1001,6 +1001,7 @@ static const struct pci_device_id pciidlist[] = {
 	INTEL_JSL_IDS(&jsl_info),
 	INTEL_TGL_12_IDS(&tgl_info),
 	INTEL_RKL_IDS(&rkl_info),
+	INTEL_DG1_IDS(&dg1_info),
 	{0, 0, 0}
 };
 MODULE_DEVICE_TABLE(pci, pciidlist);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

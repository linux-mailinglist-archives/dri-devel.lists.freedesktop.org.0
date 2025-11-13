Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28888C5952D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 19:02:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B9C810E92E;
	Thu, 13 Nov 2025 18:02:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c/Iv46p7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B8A10E920;
 Thu, 13 Nov 2025 18:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763056923; x=1794592923;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/KmtHteVBach0SNg6WkFUl1qwsEvVTIUJJw0hcwVH50=;
 b=c/Iv46p7Ss4moy8gzFZ2hyhdzmcrptfA/TZGKg1ZG0gdMrBRAIP8AvhE
 ETJTmmS0A/uF1u2SuElNhEaUyzHvXrV294tArD+XR1hQHp1txTHESWYs/
 unGnyQQ+p/1BgvUQc1F4hoBc3xmpV32KsZ4MAZl8Nt9H1Vky1gPD8Aear
 2xWoqXxWwAO/aSaoOZdFlenRWu2onon9uOG43ua42QtonfWmCxFJzlzE0
 KaKH/sZRj6vo/ExVqc9r8GszbRJ9B9KzI3qe9GW3teM7ohSujiDC50jzk
 WBEKWjTFybEgiWmSQ2jeqx7MXo0llfbku9bIYmcrEKR1J2hwG8qns6wG0 g==;
X-CSE-ConnectionGUID: LyiKMMxiRBOQFZl4Aug3Lw==
X-CSE-MsgGUID: iiAK/UENSfW14Ec8sSnCfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="52711086"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="52711086"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 10:02:03 -0800
X-CSE-ConnectionGUID: brgJPEi+RZ2fZ9Q30qgudw==
X-CSE-MsgGUID: KdwCgf3ETrCQzL3C4QS/VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="189574156"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.164])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 10:01:55 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 "Michael J . Ruhl" <mjruhl@habana.ai>,
 Andi Shyti <andi.shyti@linux.intel.com>, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v4 04/11] PCI: Improve Resizable BAR functions kernel doc
Date: Thu, 13 Nov 2025 20:00:46 +0200
Message-Id: <20251113180053.27944-5-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251113180053.27944-1-ilpo.jarvinen@linux.intel.com>
References: <20251113180053.27944-1-ilpo.jarvinen@linux.intel.com>
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

Fix the copy-pasted errors in the Resizable BAR handling functions kernel
doc and generally improve wording choices.

Fix the formatting errors of the Return: line.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/pci/rebar.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/pci/rebar.c b/drivers/pci/rebar.c
index 8b291d3e0ad4..e5c0ea6d6063 100644
--- a/drivers/pci/rebar.c
+++ b/drivers/pci/rebar.c
@@ -53,13 +53,15 @@ void pci_rebar_init(struct pci_dev *pdev)
 }
 
 /**
- * pci_rebar_find_pos - find position of resize ctrl reg for BAR
+ * pci_rebar_find_pos - find position of resize control reg for BAR
  * @pdev: PCI device
  * @bar: BAR to find
  *
- * Helper to find the position of the ctrl register for a BAR.
- * Returns -ENOTSUPP if resizable BARs are not supported at all.
- * Returns -ENOENT if no ctrl register for the BAR could be found.
+ * Helper to find the position of the control register for a BAR.
+ *
+ * Return:
+ * * %-ENOTSUPP if resizable BARs are not supported at all,
+ * * %-ENOENT if no control register for the BAR could be found.
  */
 static int pci_rebar_find_pos(struct pci_dev *pdev, int bar)
 {
@@ -92,12 +94,14 @@ static int pci_rebar_find_pos(struct pci_dev *pdev, int bar)
 }
 
 /**
- * pci_rebar_get_possible_sizes - get possible sizes for BAR
+ * pci_rebar_get_possible_sizes - get possible sizes for Resizable BAR
  * @pdev: PCI device
  * @bar: BAR to query
  *
- * Get the possible sizes of a resizable BAR as bitmask defined in the spec
- * (bit 0=1MB, bit 31=128TB). Returns 0 if BAR isn't resizable.
+ * Get the possible sizes of a resizable BAR as bitmask.
+ *
+ * Return: A bitmask of possible sizes (bit 0=1MB, bit 31=128TB), or %0 if
+ *	   BAR isn't resizable.
  */
 u32 pci_rebar_get_possible_sizes(struct pci_dev *pdev, int bar)
 {
@@ -121,12 +125,14 @@ u32 pci_rebar_get_possible_sizes(struct pci_dev *pdev, int bar)
 EXPORT_SYMBOL(pci_rebar_get_possible_sizes);
 
 /**
- * pci_rebar_get_current_size - get the current size of a BAR
+ * pci_rebar_get_current_size - get the current size of a Resizable BAR
  * @pdev: PCI device
- * @bar: BAR to set size to
+ * @bar: BAR to get the size from
  *
- * Read the size of a BAR from the resizable BAR config.
- * Returns size if found or negative error code.
+ * Reads the current size of a BAR from the Resizable BAR config.
+ *
+ * Return: BAR Size if @bar is resizable (0=1MB, 31=128TB), or negative on
+ *         error.
  */
 int pci_rebar_get_current_size(struct pci_dev *pdev, int bar)
 {
@@ -142,13 +148,14 @@ int pci_rebar_get_current_size(struct pci_dev *pdev, int bar)
 }
 
 /**
- * pci_rebar_set_size - set a new size for a BAR
+ * pci_rebar_set_size - set a new size for a Resizable BAR
  * @pdev: PCI device
  * @bar: BAR to set size to
- * @size: new size as defined in the spec (0=1MB, 31=128TB)
+ * @size: new size as defined in the PCIe spec (0=1MB, 31=128TB)
  *
  * Set the new size of a BAR as defined in the spec.
- * Returns zero if resizing was successful, error code otherwise.
+ *
+ * Return: %0 if resizing was successful, or negative on error.
  */
 int pci_rebar_set_size(struct pci_dev *pdev, int bar, int size)
 {
-- 
2.39.5


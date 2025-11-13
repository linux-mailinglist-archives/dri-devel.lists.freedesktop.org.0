Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE40DC58B69
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 17:28:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E63210E8BE;
	Thu, 13 Nov 2025 16:28:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VB/CmBlI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DDAE10E8BC;
 Thu, 13 Nov 2025 16:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763051278; x=1794587278;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MVDaAvkelaEcHOmBsAKoL7x0hnHzvyKwT0qtGb/G8DA=;
 b=VB/CmBlICm1zZREeaAtvmuDKnMGy9LT9LLPEFpJCnutLp12L6kcoGb9C
 el7Eu1l2PW8NnCXY2tn/mcRnDeTmQkP/TrqYnMPI2zWzIExrQvIkts9dg
 RQVPG9a1Yp6xm9KhrKc7BfGk8Vtbplk4Y6N85Yidxm0MomU3ksLpG0xvJ
 nVj5/A/8XlFy5O7H/v2hEIQMBxqBICXJC6zk6h5/LcwfaqCUO70rsp6Uo
 EEMQQG76Lz8fus9bSgpCf/M+d80zfJ9qwvnc3O2BXOfoTHwm7K+9yyo+C
 D3YjrXb8i3cNzDW3QqaIRkFkP2HdkXBlEHOKkJGv6EJIQ5bPHrr5yChOF w==;
X-CSE-ConnectionGUID: wkAXIgimSMqQcRt03tkDmQ==
X-CSE-MsgGUID: W5vuPpcOSH2DyZLZRalnRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65176227"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="65176227"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 08:27:57 -0800
X-CSE-ConnectionGUID: AslXPsLmQdiqPBGhi2cnOQ==
X-CSE-MsgGUID: oo/KyPEhQ+K9TOFXLFU/KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="189971963"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.164])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 08:27:53 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Simon Richter <Simon.Richter@hogyros.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linux-pci@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v2 07/11] PCI: Add kerneldoc for pci_resize_resource()
Date: Thu, 13 Nov 2025 18:26:24 +0200
Message-Id: <20251113162628.5946-8-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251113162628.5946-1-ilpo.jarvinen@linux.intel.com>
References: <20251113162628.5946-1-ilpo.jarvinen@linux.intel.com>
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

As pci_resize_resource() is meant to be used also outside of PCI core,
document the interface with kerneldoc.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/setup-res.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
index e4486d7030c0..558e452fc799 100644
--- a/drivers/pci/setup-res.c
+++ b/drivers/pci/setup-res.c
@@ -455,6 +455,25 @@ void pci_resize_resource_set_size(struct pci_dev *dev, int resno, int size)
 	resource_set_size(res, res_size);
 }
 
+/**
+ * pci_resize_resource - reconfigure a Resizable BAR and resources
+ * @dev: the PCI device
+ * @resno: index of the BAR to be resized
+ * @size: new size as defined in the spec (0=1MB, 31=128TB)
+ * @exclude_bars: a mask of BARs that should not be released
+ *
+ * Reconfigures @resno to @size and re-runs resource assignment algorithm
+ * with the new size.
+ *
+ * Prior to resize, @dev resources that share the bridge window with @resno
+ * are released (unpins the bridge window resource to allow changing it).
+ * The caller may prevent releasing a particular BAR by providing
+ * @exclude_bars mask but it may result in the resize operation failing due
+ * to insufficient space.
+ *
+ * Return: 0 on success, or negative on error. In case of an error, the
+ *         resources are restored to their original places.
+ */
 int pci_resize_resource(struct pci_dev *dev, int resno, int size,
 			int exclude_bars)
 {
-- 
2.39.5


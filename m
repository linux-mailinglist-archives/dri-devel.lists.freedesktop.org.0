Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F58981FC0F
	for <lists+dri-devel@lfdr.de>; Fri, 29 Dec 2023 00:49:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1942D10E27F;
	Thu, 28 Dec 2023 23:49:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76CC10E27B;
 Thu, 28 Dec 2023 23:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=CaD1scPgCP6kIN7T4P7A8QdN++h5vz9R+z+vQqZZTd0=; b=mL+chwnB2GJ3qbZ7OdM6WUpPrV
 DTqoHYfpYMzxVURin3bv6MOz25/JeQ42ZqL1wSPCiXYhOhok0QEg6g2At+21woAJpweR+v8lX4OhA
 VPUgFlmUjNo5zcTGBpRen2yDwN8m3FnRgzMkyOu4J8FqtQeZWFKL1bHE9eqoI6u2HA/u9TDCsHty8
 JpbCVq9dna+XLrgqoIE34+wLTfPKpqLAcQBFCUPJe8skllX7vbmKveoPyA321KrybVCuppaSBcle5
 CT/8TSJ3hHiSw5S140I1p1D4Jf07JqaZP8cLVgoJ7RpjGajXwpQIRCj1QAqyRaxPPqz8EZK7d8G0s
 +GPFBS8g==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rJ08I-00HYK1-30; Thu, 28 Dec 2023 23:49:46 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2.1 2/4] drm/i915/gt: reconcile Excess struct member
 kernel-doc warnings
Date: Thu, 28 Dec 2023 15:49:46 -0800
Message-ID: <20231228234946.12405-1-rdunlap@infradead.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document nested struct members with full names as described in
Documentation/doc-guide/kernel-doc.rst.

intel_gsc.h:34: warning: Excess struct member 'gem_obj' description in 'intel_gsc'

Also add missing field member descriptions.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
---
v2: add Reviewed-by: Rodrigo
    rebase and resend due to (i915) patchwork being down
v2.1: reformat to be consistent with kernel-doc in other files (Andi)

Please let me know if I should resend all 4 patches as v3.

 drivers/gpu/drm/i915/gt/intel_gsc.h |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff -- a/drivers/gpu/drm/i915/gt/intel_gsc.h b/drivers/gpu/drm/i915/gt/intel_gsc.h
--- a/drivers/gpu/drm/i915/gt/intel_gsc.h
+++ b/drivers/gpu/drm/i915/gt/intel_gsc.h
@@ -21,8 +21,11 @@ struct mei_aux_device;
 /**
  * struct intel_gsc - graphics security controller
  *
- * @gem_obj: scratch memory GSC operations
- * @intf : gsc interface
+ * @intf: gsc interface
+ * @intf.adev: MEI aux. device for this @intf
+ * @intf.gem_obj: scratch memory GSC operations
+ * @intf.irq: IRQ for this device (%-1 for no IRQ)
+ * @intf.id: this interface's id number/index
  */
 struct intel_gsc {
 	struct intel_gsc_intf {

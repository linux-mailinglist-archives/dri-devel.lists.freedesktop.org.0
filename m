Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FC181AD38
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 04:20:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5309510E64D;
	Thu, 21 Dec 2023 03:20:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07AD10E643;
 Thu, 21 Dec 2023 03:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=uNEK+CxMh6qX0p3sx3zeo+Q9G/JTi2IoSv3JGx0Jd68=; b=cxGL4qZqLeAlP/OS3/K0PMWu8U
 ihlfoW83p4bpMZXxN9rTJNV6u9n/gqDJJIqYwZ0xhE57Ie5LoIeWIaOG34Fj+j6cuUSFpe9TWPhRP
 RCZAWKt4YI4okiwzLMAN5JNQb6e8vPtipWUnHALzp0xovTPQECwfp2nONK/nluzCb5p61RMCJyO/E
 cT3f4v9wgUVswQYksIdB+nfyTOrx8jWzoA6b5ji52Yq73+ViKIGbAhgVAIarA/vRj0z3B1aj0vT7E
 3FIkVqJYx7C9lRL5FrtFrrqtLN1shofpe0mZRv3DDsECYvO/vQ0dtaWHRPcvVdma+YWG7rn2H6v/7
 OQ8whw0A==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rG9bq-001aN9-1s; Thu, 21 Dec 2023 03:20:30 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] drm/i915/gt: reconcile Excess struct member kernel-doc
 warnings
Date: Wed, 20 Dec 2023 19:20:27 -0800
Message-ID: <20231221032029.30942-2-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231221032029.30942-1-rdunlap@infradead.org>
References: <20231221032029.30942-1-rdunlap@infradead.org>
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>
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
---
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
+ * @intf :	gsc interface
+ * @intf.adev :	MEI aux. device for this @intf
+ * @intf.gem_obj : scratch memory GSC operations
+ * @intf.irq :	IRQ for this device (%-1 for no IRQ)
+ * @intf.id :	this interface's id number/index
  */
 struct intel_gsc {
 	struct intel_gsc_intf {

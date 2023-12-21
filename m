Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EC481AD3C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 04:20:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E174B10E650;
	Thu, 21 Dec 2023 03:20:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1097E10E64D;
 Thu, 21 Dec 2023 03:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=LiVIYSg1d+XSLTzB95bVtSsjQGpYCfcFa5dzKpB5Uj4=; b=I1yRndFgN+zphoGvwhDB3IzZdG
 sembhqwncaGz6jTurdlnfvi9oMSUqRQ/0zY9uoQkzolU2ayQehNbqUf4tfwe85RTzI4tF+YhzNa3s
 QQSfCTGmTMMXyq++4G8pKEqbbBI0uI2MmDyIvvddCri2l9W99TnDUlchOB5bK02GgPZ5P0AGl8DrF
 2mf3rZJHisB/ZvV6yo5w4K+e4QtQoaD3rIa+D2AZJq3HS3dtNCs00Nmckkdf7qO0bvEzeB4Lxmmsx
 COkFYe10Un078vXDxMhzZ2eNrG8ZH4ZoxlvS3imTNTtOzCv2G6vJrpcl3ffoK2ZLJxC9e2Bp9CY5Q
 yVoBIE/w==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rG9bq-001aN9-0v; Thu, 21 Dec 2023 03:20:30 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] drm/i915/gem: reconcile Excess struct member kernel-doc
 warnings
Date: Wed, 20 Dec 2023 19:20:26 -0800
Message-ID: <20231221032029.30942-1-rdunlap@infradead.org>
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document nested struct members with full names as described in
Documentation/doc-guide/kernel-doc.rst.

i915_gem_context_types.h:420: warning: Excess struct member 'lock' description in 'i915_gem_context'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/i915/gem/i915_gem_context_types.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
--- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
@@ -412,9 +412,9 @@ struct i915_gem_context {
 
 	/** @stale: tracks stale engines to be destroyed */
 	struct {
-		/** @lock: guards engines */
+		/** @stale.lock: guards engines */
 		spinlock_t lock;
-		/** @engines: list of stale engines */
+		/** @stale.engines: list of stale engines */
 		struct list_head engines;
 	} stale;
 };

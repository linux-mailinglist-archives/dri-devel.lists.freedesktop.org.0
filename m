Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA08570B98
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 22:26:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD55190FAF;
	Mon, 11 Jul 2022 20:26:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B873D11BFD1;
 Mon, 11 Jul 2022 20:25:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 84F5B61616;
 Mon, 11 Jul 2022 20:25:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20786C385A5;
 Mon, 11 Jul 2022 20:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657571123;
 bh=JmPMr0UNPPF1GlXrFpz+iVGZIKjSFpWV9k4IbirRPBA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WlYMrICxqmmhFoXpZTNbJxuVcUnpORO3ZJXRfTMdKGS5N7Vtxd0zjqeW1iyjbOyCO
 gaeY/FyMy0Un+ad/GacAO6aUXMxgm8JM1u9QAjDOrhG+cKomDFJvSPmbDvZffnNBgZ
 sN8SWlq9BLBkuydTLryYhJAKe5xF85nmM4Ab3Xw8exklCFi75QEgl/dF2ao45BIqiW
 LsdyL8juHvH54PJjUCU802oMwvXD9O9oWGXqX6knGW9IviEK6HdghPePMd45u9MswX
 fuaTeTOd//+FBpGHPEemTVp+TR4k9QzODTJuKXKMSNTzyx29ECnDmLVLOkkhpXTDSk
 n0PWg2S2Oi8Bg==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oAzy3-004e7j-Di;
 Mon, 11 Jul 2022 21:25:19 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH 06/32] drm/i915: intel_wakeref.h: fix some kernel-doc markups
Date: Mon, 11 Jul 2022 21:24:51 +0100
Message-Id: <d06a1fd8f9361edda39d1b15b6c7b2645c6a3fca.1657565224.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657565224.git.mchehab@kernel.org>
References: <cover.1657565224.git.mchehab@kernel.org>
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
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Two documented functions don't match the kernel-doc comments,
as reported by kernel-doc:

	drivers/gpu/drm/i915/intel_wakeref.h:117: warning: expecting prototype for intel_wakeref_get_if_in_use(). Prototype was for intel_wakeref_get_if_active() instead
	drivers/gpu/drm/i915/intel_wakeref.h:149: warning: expecting prototype for intel_wakeref_put_flags(). Prototype was for __intel_wakeref_put() instead

Fix them.

Additionally, improve title for intel_wakeref_get_if_active().

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/32] at: https://lore.kernel.org/all/cover.1657565224.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/intel_wakeref.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_wakeref.h b/drivers/gpu/drm/i915/intel_wakeref.h
index 4f4c2e15e736..63e539c9b1f3 100644
--- a/drivers/gpu/drm/i915/intel_wakeref.h
+++ b/drivers/gpu/drm/i915/intel_wakeref.h
@@ -104,7 +104,7 @@ __intel_wakeref_get(struct intel_wakeref *wf)
 }
 
 /**
- * intel_wakeref_get_if_in_use: Acquire the wakeref
+ * intel_wakeref_get_if_active: Acquire the wakeref if active
  * @wf: the wakeref
  *
  * Acquire a hold on the wakeref, but only if the wakeref is already
@@ -130,7 +130,7 @@ intel_wakeref_might_get(struct intel_wakeref *wf)
 }
 
 /**
- * intel_wakeref_put_flags: Release the wakeref
+ * __intel_wakeref_put: Release the wakeref
  * @wf: the wakeref
  * @flags: control flags
  *
-- 
2.36.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 527363B806E
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 11:52:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C556E0D2;
	Wed, 30 Jun 2021 09:52:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2EBF6E0D2;
 Wed, 30 Jun 2021 09:52:31 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5446C1FE5B;
 Wed, 30 Jun 2021 09:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625046750; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XryW5TyiYOiMhgG6bkD4TqFvFAkDxtnTdRbLYAIedhI=;
 b=KTs2NYRKMQ9cXU1GPFj7UoaWvptEgy6uzDOkryhnCFeGB0FIgpzRO+YolSHAh88el6a+xG
 CbbEE9dGlFxnIIOAX4mD6lLmU+Dn3sjKv6ZTlXUTc4sfnjQ1b2eitkwx29Ee50G+74FDHK
 3OFclqyBtLOWOW9CNmUJQdPJ0bstTME=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625046750;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XryW5TyiYOiMhgG6bkD4TqFvFAkDxtnTdRbLYAIedhI=;
 b=WFOuLtHon6vNSG3hUiUqtOyP0DwfOfh6kFZWVF3OnGQuyuoyZNEfsjOrJy8N0TMwP6Iben
 4No78Ybm0zlkuOAg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 0000C11CC0;
 Wed, 30 Jun 2021 09:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625046750; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XryW5TyiYOiMhgG6bkD4TqFvFAkDxtnTdRbLYAIedhI=;
 b=KTs2NYRKMQ9cXU1GPFj7UoaWvptEgy6uzDOkryhnCFeGB0FIgpzRO+YolSHAh88el6a+xG
 CbbEE9dGlFxnIIOAX4mD6lLmU+Dn3sjKv6ZTlXUTc4sfnjQ1b2eitkwx29Ee50G+74FDHK
 3OFclqyBtLOWOW9CNmUJQdPJ0bstTME=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625046750;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XryW5TyiYOiMhgG6bkD4TqFvFAkDxtnTdRbLYAIedhI=;
 b=WFOuLtHon6vNSG3hUiUqtOyP0DwfOfh6kFZWVF3OnGQuyuoyZNEfsjOrJy8N0TMwP6Iben
 4No78Ybm0zlkuOAg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id EIrGOt0+3GBKcwAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Wed, 30 Jun 2021 09:52:29 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 chris@chris-wilson.co.uk, mika.kuoppala@linux.intel.com,
 matthew.brost@intel.com, maarten.lankhorst@linux.intel.com,
 lucas.demarchi@intel.com, ville.syrjala@linux.intel.com
Subject: [PATCH v3 1/2] drm/i915: Use the correct IRQ during resume
Date: Wed, 30 Jun 2021 11:52:27 +0200
Message-Id: <20210630095228.6665-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210630095228.6665-1-tzimmermann@suse.de>
References: <20210630095228.6665-1-tzimmermann@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The code in xcs_resume() probably didn't work as intended. It uses
struct drm_device.irq, which is allocated to 0, but never initialized
by i915 to the device's interrupt number.

v3:
	* also use intel_synchronize_hardirq() at another callsite
v2:
	* wrap irq code in intel_synchronize_hardirq() (Ville)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 536f77b1caa0 ("drm/i915/gt: Call stop_ring() from ring resume, again")
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c       | 2 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c | 2 +-
 drivers/gpu/drm/i915/i915_irq.c                 | 5 +++++
 drivers/gpu/drm/i915/i915_irq.h                 | 1 +
 4 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 88694822716a..5ca3d1664335 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -1229,7 +1229,7 @@ bool intel_engine_is_idle(struct intel_engine_cs *engine)
 		return true;
 
 	/* Waiting to drain ELSP? */
-	synchronize_hardirq(to_pci_dev(engine->i915->drm.dev)->irq);
+	intel_synchronize_hardirq(engine->i915);
 	intel_engine_flush_submission(engine);
 
 	/* ELSP is empty, but there are ready requests? E.g. after reset */
diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
index 5d42a12ef3d6..1b5a22a83db6 100644
--- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
@@ -185,7 +185,7 @@ static int xcs_resume(struct intel_engine_cs *engine)
 		     ring->head, ring->tail);
 
 	/* Double check the ring is empty & disabled before we resume */
-	synchronize_hardirq(engine->i915->drm.irq);
+	intel_synchronize_hardirq(engine->i915);
 	if (!stop_ring(engine))
 		goto err;
 
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index 7d0ce8b9f8ed..2203dca19895 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -4575,3 +4575,8 @@ void intel_synchronize_irq(struct drm_i915_private *i915)
 {
 	synchronize_irq(to_pci_dev(i915->drm.dev)->irq);
 }
+
+void intel_synchronize_hardirq(struct drm_i915_private *i915)
+{
+	synchronize_hardirq(to_pci_dev(i915->drm.dev)->irq);
+}
diff --git a/drivers/gpu/drm/i915/i915_irq.h b/drivers/gpu/drm/i915/i915_irq.h
index db34d5dbe402..e43b6734f21b 100644
--- a/drivers/gpu/drm/i915/i915_irq.h
+++ b/drivers/gpu/drm/i915/i915_irq.h
@@ -94,6 +94,7 @@ void intel_runtime_pm_disable_interrupts(struct drm_i915_private *dev_priv);
 void intel_runtime_pm_enable_interrupts(struct drm_i915_private *dev_priv);
 bool intel_irqs_enabled(struct drm_i915_private *dev_priv);
 void intel_synchronize_irq(struct drm_i915_private *i915);
+void intel_synchronize_hardirq(struct drm_i915_private *i915);
 
 int intel_get_crtc_scanline(struct intel_crtc *crtc);
 void gen8_irq_power_well_post_enable(struct drm_i915_private *dev_priv,
-- 
2.32.0


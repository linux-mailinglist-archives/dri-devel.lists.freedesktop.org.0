Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 340D245860A
	for <lists+dri-devel@lfdr.de>; Sun, 21 Nov 2021 20:10:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E326E055;
	Sun, 21 Nov 2021 19:10:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C17F16E02C
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Nov 2021 19:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637521808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tWKxNnKq5Cl+8G6TC+C7DoUdwMvw6k9y9IaRO0aQlv0=;
 b=bVikegqrPjnZ83g11tJdwQt/i4L1qK+wSP+uBh/QxYP0L2kzeepdN6WtS1p84hjABU/3NL
 xUOop3Uj9WXHBkvH+1NOwLGop3S89KUogfyTz5VSmW5/YB0tFpY8F6KjEV+xZwv5CfeBD7
 9FLK4a4Aoy/su+J8q16OqHG2rynOA+I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-b4uCXgg8NjOgrG0-1OW46w-1; Sun, 21 Nov 2021 14:10:05 -0500
X-MC-Unique: b4uCXgg8NjOgrG0-1OW46w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BC691006AA2;
 Sun, 21 Nov 2021 19:10:04 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8E611980E;
 Sun, 21 Nov 2021 19:10:02 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/i915: Remove unused intel_gmbus_set_speed() function
Date: Sun, 21 Nov 2021 20:10:01 +0100
Message-Id: <20211121191001.252076-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The intel_gmbus_set_speed() function is not used anywhere, remove it.

Note drivers/gpu/drm/gma500 has its own copy called
gma_intel_gmbus_set_speed() which is used, the intel_gmbus_set_speed()
version in the i915 code is not used at all

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_gmbus.c | 7 -------
 drivers/gpu/drm/i915/display/intel_gmbus.h | 1 -
 2 files changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index ceb1bf8a8c3c..343f85543446 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
@@ -922,13 +922,6 @@ struct i2c_adapter *intel_gmbus_get_adapter(struct drm_i915_private *dev_priv,
 	return &dev_priv->gmbus[pin].adapter;
 }
 
-void intel_gmbus_set_speed(struct i2c_adapter *adapter, int speed)
-{
-	struct intel_gmbus *bus = to_intel_gmbus(adapter);
-
-	bus->reg0 = (bus->reg0 & ~(0x3 << 8)) | speed;
-}
-
 void intel_gmbus_force_bit(struct i2c_adapter *adapter, bool force_bit)
 {
 	struct intel_gmbus *bus = to_intel_gmbus(adapter);
diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.h b/drivers/gpu/drm/i915/display/intel_gmbus.h
index b96212b85425..8edc2e99cf53 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.h
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.h
@@ -41,7 +41,6 @@ int intel_gmbus_output_aksv(struct i2c_adapter *adapter);
 
 struct i2c_adapter *
 intel_gmbus_get_adapter(struct drm_i915_private *dev_priv, unsigned int pin);
-void intel_gmbus_set_speed(struct i2c_adapter *adapter, int speed);
 void intel_gmbus_force_bit(struct i2c_adapter *adapter, bool force_bit);
 bool intel_gmbus_is_forced_bit(struct i2c_adapter *adapter);
 void intel_gmbus_reset(struct drm_i915_private *dev_priv);
-- 
2.31.1


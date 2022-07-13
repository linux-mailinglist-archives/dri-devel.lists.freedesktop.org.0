Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C287573041
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 10:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F9B95196;
	Wed, 13 Jul 2022 08:12:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B2C951AC;
 Wed, 13 Jul 2022 08:12:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9878A61A0C;
 Wed, 13 Jul 2022 08:12:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2860BC341D5;
 Wed, 13 Jul 2022 08:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657699952;
 bh=dqEgYcPkp6CoT1+pkogxK7Zv+2U/IkJfflbdiVF7QUw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=twY5Ac3JMaUHbaMmwE3PjdU5dKLPD/CLckhOTJaIxfv+d8n/PT54BgAGL00bTWCk/
 zaJV0pp3+pYaMBoO2RjZb4GI8xA/2lBpjTCmT5y9gEh/oXpyGRgcl3ulep+eTyD/A5
 jgn66y1/WYXVs8deqG/FNdovunko316SlAuVH4IFrEt5W4q9IhPY+RbshfPNfbt/Aw
 qwrWtG8iv++IMU66Z2isl8HbgWawR9T2oHqEXPht4cJBLkwGaSTGwYmurpEAfGAhfv
 QrVShACgLEkUWb9fUbTYBMqr2zl+v6n/A/TdRy/BGLOFcC7QhHRQ9S7mC3WloW22vT
 3ylsSb18TfPSQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oBXTx-004zsk-D3;
 Wed, 13 Jul 2022 09:12:29 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v2 05/39] drm/i915: display: fix kernel-doc markup warnings
Date: Wed, 13 Jul 2022 09:11:53 +0100
Message-Id: <e860a7d8e5f9c41c462ef354b9ca6f36ae142e1b.1657699522.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657699522.git.mchehab@kernel.org>
References: <cover.1657699522.git.mchehab@kernel.org>
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
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Patnana Venkata Sai <venkata.sai.patnana@intel.com>,
 Sean Paul <seanpaul@chromium.org>, Fernando Ramos <greenfoo@u92.eu>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are a couple of issues at i915 display kernel-doc markups:

	drivers/gpu/drm/i915/display/intel_display_debugfs.c:2238: warning: Function parameter or member 'intel_connector' not described in 'intel_connector_debugfs_add'
	drivers/gpu/drm/i915/display/intel_display_debugfs.c:2238: warning: Excess function parameter 'connector' description in 'intel_connector_debugfs_add'
	drivers/gpu/drm/i915/display/intel_display_power.c:700: warning: expecting prototype for intel_display_power_put_async(). Prototype was for __intel_display_power_put_async() instead
	drivers/gpu/drm/i915/display/intel_tc.c:807: warning: Function parameter or member 'work' not described in 'intel_tc_port_disconnect_phy_work'
	drivers/gpu/drm/i915/display/intel_tc.c:807: warning: Excess function parameter 'dig_port' description in 'intel_tc_port_disconnect_phy_work'

Those are due to wrong parameter of function name. Address them.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/display/intel_display_debugfs.c | 2 +-
 drivers/gpu/drm/i915/display/intel_display_power.c   | 2 +-
 drivers/gpu/drm/i915/display/intel_tc.c              | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 6c3954479047..1e35eb01742b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -2229,7 +2229,7 @@ DEFINE_SHOW_ATTRIBUTE(i915_current_bpc);
 
 /**
  * intel_connector_debugfs_add - add i915 specific connector debugfs files
- * @connector: pointer to a registered drm_connector
+ * @intel_connector: pointer to a registered drm_connector
  *
  * Cleanup will be done by drm_connector_unregister() through a call to
  * drm_debugfs_connector_remove().
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 589af257edeb..fd6b71160a06 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -685,7 +685,7 @@ intel_display_power_put_async_work(struct work_struct *work)
 }
 
 /**
- * intel_display_power_put_async - release a power domain reference asynchronously
+ * __intel_display_power_put_async - release a power domain reference asynchronously
  * @i915: i915 device instance
  * @domain: power domain to reference
  * @wakeref: wakeref acquired for the reference that is being released
diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i915/display/intel_tc.c
index 6773840f6cc7..7ce0cbe0de05 100644
--- a/drivers/gpu/drm/i915/display/intel_tc.c
+++ b/drivers/gpu/drm/i915/display/intel_tc.c
@@ -797,7 +797,7 @@ void intel_tc_port_lock(struct intel_digital_port *dig_port)
 
 /**
  * intel_tc_port_disconnect_phy_work: disconnect TypeC PHY from display port
- * @dig_port: digital port
+ * @work: workqueue struct
  *
  * Disconnect the given digital port from its TypeC PHY (handing back the
  * control of the PHY to the TypeC subsystem). This will happen in a delayed
-- 
2.36.1


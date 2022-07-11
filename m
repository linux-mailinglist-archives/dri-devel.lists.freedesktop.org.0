Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1C3570B7D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 22:26:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E4F8EF53;
	Mon, 11 Jul 2022 20:26:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09DC14B9AC;
 Mon, 11 Jul 2022 20:25:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1DC0061631;
 Mon, 11 Jul 2022 20:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2894FC341D2;
 Mon, 11 Jul 2022 20:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657571123;
 bh=Ftp7lyR/xctlUKTKexMaEpblz+zHMJN2h1fCC828awA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cHboK/qq3Zbah34KTnXsP4mFCBxUJIqBnt8GOWo4kiBBJBbNzeMeU5Lq6bgtPoSqD
 kC33Nm512lO7AsGMbT0H+mK1bsQfiudf+xgeKuHC3FMFlODIpRw6P1L9ESJNOq4Go0
 LoDxcWe7QkxmgYXat6GQoGKPGhfZC168Vh5UfyXN/5/d5S/MGF6sNmDBK9Mzpdgs/J
 YMNA9rMdElGuOsOM04QZ2NhTMgtZ3G0dVyq2888kFuETxXvlNLW0J9M0Te8JVK51x2
 0nm8FJvdrNT+AhmJ+pwT7YOkp7dASgmqQ7CJIdmvuB697F/r4jYXtTC77zrZHrSN4S
 u6Detn8y4HJwQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oAzy3-004e7X-AU;
 Mon, 11 Jul 2022 21:25:19 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH 02/32] drm/i915: display: fix kernel-doc markup warnings
Date: Mon, 11 Jul 2022 21:24:47 +0100
Message-Id: <2f9a9a9b0e1eced6e628b92add45fb4fae43ff78.1657565224.git.mchehab@kernel.org>
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
Cc: Patnana Venkata Sai <venkata.sai.patnana@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Anshuman Gupta <anshuman.gupta@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>, Sean Paul <seanpaul@chromium.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Fernando Ramos <greenfoo@u92.eu>
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
See [PATCH 00/32] at: https://lore.kernel.org/all/cover.1657565224.git.mchehab@kernel.org/

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


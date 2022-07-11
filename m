Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A025570B5F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 22:25:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C3014AB79;
	Mon, 11 Jul 2022 20:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF88814A531;
 Mon, 11 Jul 2022 20:25:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7DBF4B81219;
 Mon, 11 Jul 2022 20:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D765C341E8;
 Mon, 11 Jul 2022 20:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657571123;
 bh=Rnb3XsY7y8hfUZ7l/im7d9PJX0mQos0rnISe9eN8yZE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WRvsc5Nhss+tKjP2ySpmWTjHUU+dZWTOzVTeWLZtlPaxMHY7GQKEe9AZufYAu/el6
 AoygpXqYq3sfn1kF4PkHKGqxFH2ukwETIMAnjByLX+KzFfOEsrbMqCFC/fJ5U2/exL
 VV1r0WeeGy9+ii02JoED3bwM6Hjy2xtRnKKyD9KC14bp58D1KWUWx6RE2LUt7ns1nP
 CHfTG9i1cKOuYc2UTfhjQVY2J7PAFCv/wjJzwOAdMCbg5e9gCYOxQATucpvgIEMAHP
 tqO07gHzXMPI+7JicCMfSFBQi+E3ohR6MusX6gIoXZjKg+IVtDvdFghhouOW8sG/S+
 ENUyjYV5R5qmw==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oAzy3-004e8z-Rf;
 Mon, 11 Jul 2022 21:25:19 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH 26/32] docs: gpu: i915.rst: display: add kernel-doc markups
Date: Mon, 11 Jul 2022 21:25:11 +0100
Message-Id: <1289783c1e0d6e652205e0ecd3e05172bac7cb1e.1657565224.git.mchehab@kernel.org>
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
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are several documented kAPI at the display side that
aren't currently part of the docs. Add them, as this allows
identifying issues with badly-formatted tags.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/32] at: https://lore.kernel.org/all/cover.1657565224.git.mchehab@kernel.org/

 Documentation/gpu/i915.rst | 50 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
index 4e59db1cfb00..2ad7941a79f2 100644
--- a/Documentation/gpu/i915.rst
+++ b/Documentation/gpu/i915.rst
@@ -100,6 +100,56 @@ Display FIFO Underrun Reporting
 .. kernel-doc:: drivers/gpu/drm/i915/display/intel_fifo_underrun.c
    :internal:
 
+Atomic Modeset Support
+----------------------
+
+.. kernel-doc:: drivers/gpu/drm/i915/display/intel_atomic.c
+
+Display Power Domain
+--------------------
+
+.. kernel-doc:: drivers/gpu/drm/i915/display/intel_display_power.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/display/intel_display_power_map.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/display/intel_display_power_well.c
+
+Misc display functions
+----------------------
+
+.. kernel-doc:: drivers/gpu/drm/i915/display/intel_backlight.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/display/intel_crtc.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/display/intel_connector.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/display/intel_display_debugfs.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/display/intel_dp.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/display/intel_dp_link_training.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/display/intel_dpll.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/display/intel_dpt.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/display/intel_fb.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/display/intel_fb_pin.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/display/intel_gmbus.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/display/intel_lvds.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/display/intel_opregion.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/display/intel_snps_phy.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/display/intel_tc.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/display/skl_scaler.c
+
+
 Plane Configuration
 -------------------
 
-- 
2.36.1


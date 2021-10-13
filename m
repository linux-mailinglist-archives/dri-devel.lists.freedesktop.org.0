Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 920BB42CBD3
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 22:50:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE10F6EB46;
	Wed, 13 Oct 2021 20:49:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E086EB53;
 Wed, 13 Oct 2021 20:49:31 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 29EDD581179;
 Wed, 13 Oct 2021 16:49:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 13 Oct 2021 16:49:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=TsnieD8JNOkvc
 CeHrO6O329V8uto/kVQnYqCrL+jTDk=; b=TxzuU9TkZPUZjMI3OAr5W++HTHKFc
 Ubi6IO9nGEDBKdEcfesFlJ7OnWrtgf1A2GvtTBEtEvHqSxF7Z241/ziElJkFtHSi
 We+8eQXZRHw/Iht46UWPt8lQJxcOyfU4ETa/9ztLpU9M8rAhQpWhKl68NaJq+GdM
 ACZAX0PVQiBzPvT1ZudTchK9haGS9v9Uf4TpZQyVrgpatXIWkkmDLea1ddZkc6Km
 2tOsg3GOByBxWOwnR9WEx7AVyIXCjHk2ZRlL5r3u3F72LfU44pLZa6xMCpY3o19L
 /P0Rxs13wfShGvE8kIdN9fa6GwwWeo6RP8Ftfmkg9oKrq8IBQxzpilPzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=TsnieD8JNOkvcCeHrO6O329V8uto/kVQnYqCrL+jTDk=; b=HIUjLJB3
 Lasiw3KMpps+DtwtLNp5sEQ9xPSyknXCT51Fueb4jVFakJ8soAY0LrF8xU9/UDnp
 HK1OvfuOSLAR/nUAKmm6FEUV1MVwBifjTMe2G6kPenN75wfocDNrdwMTHcVfsDmf
 x7kNObgDeW4EprO6cGEedPsfjtClyxlZR5cN2HNOoUv6Mrycci3kmqbrMzLPGfKk
 9A8hvkt+AIqaV5eNpqjOLuMK/WEH/iHqaBwUnO+CqbxNX76GKptFVSZGFcGrNrjH
 0zE8Ayna67X+l/kW8tOD2BeUo+Pd8ENhczJPgqD1Lht/6bH4U9z5rbTpJwkqv2mA
 UcxzAUA03XYdtw==
X-ME-Sender: <xms:W0ZnYXvu-NcWBnrH0uTBhDI5CeLJq1-6nCDc4_ATbbwdgaS-Be80Rw>
 <xme:W0ZnYYcommaD8OOnlrlqgO1WhyBHj6nHbzUK5GzC4QFLNBAAMA69MsHm7Y1GTh_td
 DRDSd6cBfNrO-75tA>
X-ME-Received: <xmr:W0ZnYazj4JVXZIfO8Qp0Y5JxdPLqyc-JyVPucoJ7e0ZC-9_bBCt45GevTbf0NIYZhG6N>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddutddgudehudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:W0ZnYWPkwCzipoGXPRhFwotBAh58wt4G6ZDY-SGMw85rjG873s9fmA>
 <xmx:W0ZnYX_02fyNHIStvLn_Zl8MliwaoJmkItJV7TWWpNbrosMaWW9uPw>
 <xmx:W0ZnYWXQcYLU6oWDBpodiOmkQJTaxyItYSraacWrylr2OqnmOj5-_g>
 <xmx:W0ZnYebjs5g78AlWpqJ1CksbDpWTAvzk9v60MG4zFNpE7AQPschmoA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Oct 2021 16:49:28 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v4 13/20] drm/i915: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN() [part 2]
Date: Wed, 13 Oct 2021 22:48:39 +0200
Message-Id: <20211013204846.90026-14-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013204846.90026-1-greenfoo@u92.eu>
References: <20211013204846.90026-1-greenfoo@u92.eu>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As requested in Documentation/gpu/todo.rst, replace driver calls to
drm_modeset_lock_all() with DRM_MODESET_LOCK_ALL_BEGIN() and
DRM_MODESET_LOCK_ALL_END()

NOTE:

I separated this change from the rest of modifications to the i915
driver to point out something special explained next.

The only difference between the old drm_modeset_{lock,unlock}_all()
functions and the new DRM_MODESET_LOCK_ALL_{BEGIN,END}() macros is that
the former use a global context stored in dev->mode_config.acquire_ctx
while the latter depend on a user provided one (typically in the stack).

This means that as long as no one accesses the global
dev->mode_config.acquire_ctx context in the block that runs between
lock/BEGIN and unlock/END, the code should be equivalent before and
after my changes.

The only place where I had to take special action to preserve this
condition was here, where I need to modify the old call to
intel_modeset_setup_hw_state() to use the new stack allocated context
structure instead of the global one.

Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
---
 drivers/gpu/drm/i915/display/intel_display.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index c7d9a58f9f98..75b45c01c573 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -10992,6 +10992,7 @@ int intel_modeset_init_noirq(struct drm_i915_private *i915)
 int intel_modeset_init_nogem(struct drm_i915_private *i915)
 {
 	struct drm_device *dev = &i915->drm;
+	struct drm_modeset_acquire_ctx ctx;
 	enum pipe pipe;
 	struct intel_crtc *crtc;
 	int ret;
@@ -11043,10 +11044,10 @@ int intel_modeset_init_nogem(struct drm_i915_private *i915)
 	intel_vga_disable(i915);
 	intel_setup_outputs(i915);
 
-	drm_modeset_lock_all(dev);
-	intel_modeset_setup_hw_state(dev, dev->mode_config.acquire_ctx);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
+	intel_modeset_setup_hw_state(dev, &ctx);
 	intel_acpi_assign_connector_fwnodes(i915);
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 
 	for_each_intel_crtc(dev, crtc) {
 		if (!to_intel_crtc_state(crtc->base.state)->uapi.active)
-- 
2.33.0


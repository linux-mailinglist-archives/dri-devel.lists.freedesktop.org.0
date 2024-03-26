Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6AB88C006
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 11:57:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA41C10EE6C;
	Tue, 26 Mar 2024 10:57:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VUOJtVuX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A32510EE6C
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 10:57:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 21203CE203C;
 Tue, 26 Mar 2024 10:57:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0967DC433F1;
 Tue, 26 Mar 2024 10:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711450650;
 bh=C4YtCTVCsU9txDUfamcihT62gS2Br/RMet6p7Czen/A=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=VUOJtVuXjf01VgeNeRI2kNPpbqxpBFz0eeEGyNWmMpquO6mJ3oiOHPcKGDCuOk8Rz
 CpEnfcyCNhfyBAK9ofpj+Vuaui6F7388A5/eHjoUy6rcPcaKp4Nl9CAx0clQNyU8b1
 KBWfO1Z/WKpPmUzD4zi0Yszq6UJ9qIeiMUIcBa+xS3tVHIRHwufreoEPln20UeOkf4
 8/Pz6I2P9eHNolkgiHPe5NMzvHrcczUUTi3D87iEDfSe/yXPOs06GvxQ0RF3WCZGfK
 KS1/YkDE3eEHCoAaiRmbgVOzf+V9rSEs2Lfdr/NOAk0TsUwS6OcYJOFQTRrNFYaofw
 Twp83UEjDB9Sw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 26 Mar 2024 11:56:25 +0100
Subject: [PATCH v2 12/12] drm/bridge: it6505: Remove useless select
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240326-kms-kconfig-helpers-v2-12-3b0aeee32217@kernel.org>
References: <20240326-kms-kconfig-helpers-v2-0-3b0aeee32217@kernel.org>
In-Reply-To: <20240326-kms-kconfig-helpers-v2-0-3b0aeee32217@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=810; i=mripard@kernel.org;
 h=from:subject:message-id; bh=C4YtCTVCsU9txDUfamcihT62gS2Br/RMet6p7Czen/A=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGlMK2/dObYoIUW35srNiWu2ZTwXVznSs/WXvtineO836
 y0nKW580DGVhUGYk0FWTJHliUzY6eXti6sc7Ff+gJnDygQyhIGLUwAmIt/HWKe79+HB6m/R++9v
 De8WqX5WEi3MfnnV6aq19h3PFUq3b+tvDPwgG6HkYHO07dvLBA8WScb6sEy3WfOfTXkRrf9wyrd
 9UutePlmyZMvtr7119usX//fQkrrDvj57RznbZIa173bXlay5BQA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The IT6505 bridge Kconfig symbol selects a Kconfig symbol that doesn't
exist. Remove it.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/bridge/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 6e6ec300ab16..d1fbf8796fea 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -96,11 +96,10 @@ config DRM_ITE_IT6505
 	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HDCP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on OF
 	select DRM_KMS_HELPER
-	select DRM_DP_HELPER
 	select EXTCON
 	select CRYPTO
 	select CRYPTO_HASH
 	help
 	  ITE IT6505 DisplayPort bridge chip driver.

-- 
2.44.0


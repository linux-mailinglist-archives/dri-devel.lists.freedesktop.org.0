Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8988988DBAE
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 11:58:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF59110E54C;
	Wed, 27 Mar 2024 10:58:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="E3u6Xp1o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E044610F55E
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 10:57:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 29078CE2387;
 Wed, 27 Mar 2024 10:57:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11E6DC433C7;
 Wed, 27 Mar 2024 10:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711537070;
 bh=C4YtCTVCsU9txDUfamcihT62gS2Br/RMet6p7Czen/A=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=E3u6Xp1omW+Jm87RPX7SM7kzaMOe/6kydKXb8/t02OQU6+KfXhnMVKypdAMZXNocN
 KUCh16UzPSpzwu6Pm1/uBlJqJ9dHGacl9tySUAu8BPP4fCBo/w1LHtaZyY80MRS4lV
 PtCxEwrflOCw3dcCxrBKOye+gIUUY698ME7bIzkDXWstkDpZNDa0M7UUnszws/+QEC
 LZkX580Oh4fSW94e6TE87gJLm9wQe1lZvIGa6zYNdsfKv5EOtUKZXg7RE0FGgIwrFI
 UGTfp7JNog6AE7pWUAIgY0gKxSLaZdLhMXh05gXZXb14lwctTqd5YeNO7VgfFoMl9P
 u8vZI8r1C4iNg==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 27 Mar 2024 11:57:08 +0100
Subject: [PATCH v3 13/13] drm/bridge: it6505: Remove useless select
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-kms-kconfig-helpers-v3-13-eafee11b84b3@kernel.org>
References: <20240327-kms-kconfig-helpers-v3-0-eafee11b84b3@kernel.org>
In-Reply-To: <20240327-kms-kconfig-helpers-v3-0-eafee11b84b3@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=810; i=mripard@kernel.org;
 h=from:subject:message-id; bh=C4YtCTVCsU9txDUfamcihT62gS2Br/RMet6p7Czen/A=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGnMv1tv8W5bprWWc0btz666dY1c4QlH573t0FK6qs7M/
 Ed0Re/DjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjARZnfGGn6XD1PlHszt5Zm7
 U/PW9EOcqV6ML5Ob8mwSj+/mNawSW6fFuuPUbV1DgceMnt8P2vBnMDZcYYu9pmvFGFRxb6rbswa
 fW0obi7//v3MpIXJ2cWaipq/kT8VWDrZYOy9BBYlY9WlhJgA=
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


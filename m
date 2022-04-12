Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4934FCA3F
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 02:50:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97BD610FB10;
	Tue, 12 Apr 2022 00:50:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44DC110FB0F;
 Tue, 12 Apr 2022 00:50:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C68326066C;
 Tue, 12 Apr 2022 00:50:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39CE2C385A4;
 Tue, 12 Apr 2022 00:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649724650;
 bh=tGzXzQhqgL+alx1Q6zWeqj7q4zL1AuwH2it+jAec/5w=;
 h=From:To:Cc:Subject:Date:From;
 b=u/pDjD0cGhirQNp4mXs+mE1nmO2YZ6ED2UXXBxoRy+R2vif61h6ZWFE/nZibJEjK8
 4XCwtLdofLejw7MYCIhR1Cz0fSk1XOReXiu4HImxA4SohIcklxlPvFAM3mwLPuiVdU
 dgdGoew2Gc2mXQW1uIVkXdnPfdFFrM9txj+MnuDnLXxLgLPasCF9SscLcIpkZaRBQB
 FeePfOS5A/68IrObqdMHPwf0I3lJkKdA+kPNV9S8cNAAt8USBaYhMoo+dPDVWQLD43
 oDIYEilE8gWWA/GOsXu3eXw7xYG6CZbTZF2NNoCCPuRZJKUWi7YUwX7TUWkjd1+ro3
 wFphKHpdauI2Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 01/21] drm/amd: Add USBC connector ID
Date: Mon, 11 Apr 2022 20:50:20 -0400
Message-Id: <20220412005042.351105-1-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, airlied@linux.ie, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Aurabindo Pillai <aurabindo.pillai@amd.com>

[ Upstream commit c5c948aa894a831f96fccd025e47186b1ee41615 ]

[Why&How] Add a dedicated AMDGPU specific ID for use with
newer ASICs that support USB-C output

Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/ObjectID.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/ObjectID.h b/drivers/gpu/drm/amd/amdgpu/ObjectID.h
index 5b393622f592..a0f0a17e224f 100644
--- a/drivers/gpu/drm/amd/amdgpu/ObjectID.h
+++ b/drivers/gpu/drm/amd/amdgpu/ObjectID.h
@@ -119,6 +119,7 @@
 #define CONNECTOR_OBJECT_ID_eDP                   0x14
 #define CONNECTOR_OBJECT_ID_MXM                   0x15
 #define CONNECTOR_OBJECT_ID_LVDS_eDP              0x16
+#define CONNECTOR_OBJECT_ID_USBC                  0x17
 
 /* deleted */
 
-- 
2.35.1


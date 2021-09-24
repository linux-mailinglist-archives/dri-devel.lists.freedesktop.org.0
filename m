Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D435417DF7
	for <lists+dri-devel@lfdr.de>; Sat, 25 Sep 2021 00:56:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39EAB6EE93;
	Fri, 24 Sep 2021 22:56:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 891D16EE93;
 Fri, 24 Sep 2021 22:56:25 +0000 (UTC)
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id C75A53F357; 
 Fri, 24 Sep 2021 22:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632524183;
 bh=OarWx6xOy/KHU1UmciEyVQmDM6Ujt+aKXAOoZfMNx6Y=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=ScxhRnmwaIAiTeeaPGZK5QhVHpE6R2iy9iSxeNlafTd80IpC9RIZbxxaHtyb9WXgL
 cM0Xl/9G/SSZuTJfc6+dlujXZXGd5wK28uqbwOYvACd/JfpbWig0sjZNJr7D6ltQgn
 4rSqU71ZlgAO4Np8RQd5/uj4wa0BciaPgZB9OQfpEpPJ45jRjS6UbqmEIKQTde4291
 7ipnMlIiGSo6qDJxzhdSRwnyLcTC8NcXo+vI01LqzazJZC1E4F77BEzJjq258wz2tE
 j1QVi7t/gVtQHM0W28nMNkNdg+lzcPQ0hzGYZItHszdhzbrBkr6AIe3qnLknbfVtXU
 0VYor9CeXJ1YQ==
From: Colin King <colin.king@canonical.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/gvt: Fix spelling mistake "Unsupport" ->
 "Unsupported"
Date: Fri, 24 Sep 2021 23:56:23 +0100
Message-Id: <20210924225623.143409-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a gvt_vgpu_err error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index cde0a477fb49..7ed7dba42c83 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -909,7 +909,7 @@ static int update_fdi_rx_iir_status(struct intel_vgpu *vgpu,
 	else if (FDI_RX_IMR_TO_PIPE(offset) != INVALID_INDEX)
 		index = FDI_RX_IMR_TO_PIPE(offset);
 	else {
-		gvt_vgpu_err("Unsupport registers %x\n", offset);
+		gvt_vgpu_err("Unsupported registers %x\n", offset);
 		return -EINVAL;
 	}
 
-- 
2.32.0


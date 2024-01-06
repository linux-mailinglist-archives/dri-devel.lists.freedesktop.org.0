Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8860D825E0C
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jan 2024 04:23:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BFBF10E6CC;
	Sat,  6 Jan 2024 03:23:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0733410E6B1
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jan 2024 03:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=bgG0Wa9hAl+aGvy6zpeK/dJ5La0sq7ZbVHPbQUtvoaA=; b=GIb+F8lU4GA+6/SY3vIZ3kyXok
 qjVoqZg77d/qxf3+vkTzBfbG4I7vAg5VyVcBoQO6MBTyzFdmagDELBiLEqLw9ZwslUVm4L8TZDPCW
 7k30MWtDXHqRNYXkvNlwy1ONhI0blPukIZiHQggs4uEi+CKcYF9qGA4NXPeWwyWQnLCWY+5cynJc2
 VcgS1p6WGn8Nok0t0DC1E+GT2Xi+IKPa9qwBQ/MoZOGdd5IZeAArPkESV5PySywbh4N2iK5I2GbPo
 ygn3ngeL2+uf7jBufT/D1xh2PDxUbtS7xM3SOqb7USNCRZig7SUxt0dhchWmZInJrlEkjiR2VYjxe
 fUR7t3fw==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rLxHO-000fGm-1A; Sat, 06 Jan 2024 03:23:22 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/display/dp_mst: remove Excess struct member kernel-doc
Date: Fri,  5 Jan 2024 19:23:21 -0800
Message-ID: <20240106032321.28596-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Randy Dunlap <rdunlap@infradead.org>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quieten an "Excess struct member" kernel-doc warning by removing
the extraneous line.

drm_dp_mst_helper.h:156: warning: Excess struct member 'vcpi' description in 'drm_dp_mst_port'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
base-commit: 610a9b8f49fbcf1100716370d3b5f6f884a2835a

 include/drm/display/drm_dp_mst_helper.h |    1 -
 1 file changed, 1 deletion(-)

diff -- a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -83,7 +83,6 @@ struct drm_dp_mst_branch;
  * @passthrough_aux: parent aux to which DSC pass-through requests should be
  * sent, only set if DSC pass-through is possible.
  * @parent: branch device parent of this port
- * @vcpi: Virtual Channel Payload info for this port.
  * @connector: DRM connector this port is connected to. Protected by
  * &drm_dp_mst_topology_mgr.base.lock.
  * @mgr: topology manager this port lives under.

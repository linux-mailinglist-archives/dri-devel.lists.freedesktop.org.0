Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD1D573096
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 10:14:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01BFD96107;
	Wed, 13 Jul 2022 08:13:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD8195467;
 Wed, 13 Jul 2022 08:12:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 916A7B81D62;
 Wed, 13 Jul 2022 08:12:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15FF4C341CD;
 Wed, 13 Jul 2022 08:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657699952;
 bh=yAgmeyAxqS0EcUuu/GWUo/Bto3NomZ1v5WXFoUCWkH4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J+tywVVfa0yg+WLWvTYYnUDVAjQOJNqjcLsVUISTqT04FIbr/7jXzt9hDgw3eb9gi
 Bi4Cw8eK+82mElILruz9ow38++ESt73z+M229eKhcLjxUJrYe7OHS50rpkJgwpjySa
 2b88NcaOagz8GZiTcxT1mMZhc4tsURSNdcvUQgeD6UjhD6mMvkm70NAi1TqSGBEkJr
 bqPsyBWNK3lCmE/UVf5mId4Xn2Lt1YGTSZ0eBmUwnmozi89jwJstOvAFfh4Xz9n7Jw
 mTelJB7hfgWBhnB51v4rz5E5wzb45B7bvpD7IE6itP19NbRZeJjLt0vxOaEzcaWDmc
 VN10U+O6SXQsg==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oBXTx-004zse-Bc;
 Wed, 13 Jul 2022 09:12:29 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v2 03/39] drm/i915/gvt: Fix kernel-doc for
 intel_vgpu_*_resource()
Date: Wed, 13 Jul 2022 09:11:51 +0100
Message-Id: <4801d75e6c43c83fd5bba13bea3885da7b66fa9c.1657699522.git.mchehab@kernel.org>
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Fix the following W=1 kernel warnings:

drivers/gpu/drm/i915/gvt/aperture_gm.c:308: warning: expecting prototype
for inte_gvt_free_vgpu_resource(). Prototype was for
intel_vgpu_free_resource() instead.

drivers/gpu/drm/i915/gvt/aperture_gm.c:344: warning: expecting prototype
for intel_alloc_vgpu_resource(). Prototype was for
intel_vgpu_alloc_resource() instead.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/gvt/aperture_gm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/aperture_gm.c b/drivers/gpu/drm/i915/gvt/aperture_gm.c
index 557f3314291a..3b81a6d35a7b 100644
--- a/drivers/gpu/drm/i915/gvt/aperture_gm.c
+++ b/drivers/gpu/drm/i915/gvt/aperture_gm.c
@@ -298,7 +298,7 @@ static int alloc_resource(struct intel_vgpu *vgpu,
 }
 
 /**
- * inte_gvt_free_vgpu_resource - free HW resource owned by a vGPU
+ * intel_vgpu_free_resource() - free HW resource owned by a vGPU
  * @vgpu: a vGPU
  *
  * This function is used to free the HW resource owned by a vGPU.
@@ -328,7 +328,7 @@ void intel_vgpu_reset_resource(struct intel_vgpu *vgpu)
 }
 
 /**
- * intel_alloc_vgpu_resource - allocate HW resource for a vGPU
+ * intel_vgpu_alloc_resource() - allocate HW resource for a vGPU
  * @vgpu: vGPU
  * @param: vGPU creation params
  *
-- 
2.36.1


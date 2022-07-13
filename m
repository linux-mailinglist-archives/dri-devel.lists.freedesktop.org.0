Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D22C57304F
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 10:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B175195135;
	Wed, 13 Jul 2022 08:12:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB78195177;
 Wed, 13 Jul 2022 08:12:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6A776619F6;
 Wed, 13 Jul 2022 08:12:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C063C341D0;
 Wed, 13 Jul 2022 08:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657699952;
 bh=Zk31CqpmVIn7N/6Nky4ybxnpIzhnNLoZYEdUmnMx2Bk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rgWIr8h3syhppSGbpTaPyZeOh2+/FRGdgJ5D2hew/LljELkZdXwG+wOGbtNbP9LWb
 EKItn8/SptNcOLtV5b37VJTiJXp7SBvDhjHmLJPeTBIxKhhhxt1PocfkVzz4Pxac55
 KJgg8CmBsY0tbDkonXpW0I4MigOQoOlhPXs+1KRsWzhgeDVO/ILsIU+byIoCHpWlPD
 X8rrmBr4XMW9p6cwTa0BhHsdI49zsGd4URiYVZmdkeu2XKTugEGnYFmpz/lgqL/2lr
 mZfKvBpkALM/76LDVHL30xmCfzhlMooJDMIreM9C9zbMot+dW+AgVJ38lfue7ui4b0
 17gWJrB1rGuew==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oBXTx-004ztH-K5;
 Wed, 13 Jul 2022 09:12:29 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v2 15/39] drm/i915: intel_dp_link_training.c: fix kernel-doc
 markup
Date: Wed, 13 Jul 2022 09:12:03 +0100
Message-Id: <0fac471eb7f6d365e9a7544071114292e08aa5ad.1657699522.git.mchehab@kernel.org>
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Manasi Navare <manasi.d.navare@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lee Shawn C <shawn.c.lee@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The return code table is not properly marked, causing warnings
and being badly parsed by Sphinx:

    Documentation/gpu/i915:130: ./drivers/gpu/drm/i915/display/intel_dp_link_training.c:183: WARNING: Block quote ends without a blank line; unexpected unindent.
    Documentation/gpu/i915:130: ./drivers/gpu/drm/i915/display/intel_dp_link_training.c:186: WARNING: Definition list ends without a blank line; unexpected unindent.

Use table markups to fix it.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/display/intel_dp_link_training.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 9feaf1a589f3..23a269fcf6ca 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -177,12 +177,14 @@ static int intel_dp_init_lttpr(struct intel_dp *intel_dp, const u8 dpcd[DP_RECEI
  * transparent mode link training mode.
  *
  * Returns:
+ * ====  =====================================================================
  *   >0  if LTTPRs were detected and the non-transparent LT mode was set. The
  *       DPRX capabilities are read out.
  *    0  if no LTTPRs or more than 8 LTTPRs were detected or in case of a
  *       detection failure and the transparent LT mode was set. The DPRX
  *       capabilities are read out.
  *   <0  Reading out the DPRX capabilities failed.
+ * ====  =====================================================================
  */
 int intel_dp_init_lttpr_and_dprx_caps(struct intel_dp *intel_dp)
 {
-- 
2.36.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E50E28CCD1
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 13:54:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54A86E3B2;
	Tue, 13 Oct 2020 11:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D8A6E3C4
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 11:54:44 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de
 [95.90.213.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 37AA121D40;
 Tue, 13 Oct 2020 11:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602590081;
 bh=w7RTmAibzlnP4qxmJCS1CnZ5TrmTyrtcBUUPhI7/qQ0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hH4Sv1hv1I/FDXlg1fxZ971j4iMkKh7xG/pbeLiIVfVrYehOtv0gfb8NoIu7zAjYQ
 wxmE/47iy/guJEaB98q5/i+Ib3y7dJRcm1p+juPJb+isCoC1tR8YoCG3GtU1PIsptm
 Tw59H+B6zPn49tRAvzRpbKmhtAG0YrxRltvwHxEM=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1kSIt5-006CWd-RY; Tue, 13 Oct 2020 13:54:39 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH v6 73/80] drm: kernel-doc: drm_dp_helper.h: fix a typo
Date: Tue, 13 Oct 2020 13:54:28 +0200
Message-Id: <2075532606081f22ed00cf5fedc0754db80a6471.1602589096.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602589096.git.mchehab+huawei@kernel.org>
References: <cover.1602589096.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Right now, kernel-doc generates a warning:
	./include/drm/drm_dp_helper.h:1786: warning: Function parameter or member 'hbr2_reset' not described in 'drm_dp_phy_test_params'

This is due to a typo:

	@hb2_reset -> @hbr2_reset

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 include/drm/drm_dp_helper.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index e47dc22ebf50..69f7863ee99a 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1760,7 +1760,7 @@ static inline void drm_dp_cec_unset_edid(struct drm_dp_aux *aux)
  * @link_rate: Requested Link rate from DPCD 0x219
  * @num_lanes: Number of lanes requested by sing through DPCD 0x220
  * @phy_pattern: DP Phy test pattern from DPCD 0x248
- * @hb2_reset: DP HBR2_COMPLIANCE_SCRAMBLER_RESET from DCPD 0x24A and 0x24B
+ * @hbr2_reset: DP HBR2_COMPLIANCE_SCRAMBLER_RESET from DCPD 0x24A and 0x24B
  * @custom80: DP Test_80BIT_CUSTOM_PATTERN from DPCDs 0x250 through 0x259
  * @enhanced_frame_cap: flag for enhanced frame capability.
  */
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

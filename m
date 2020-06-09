Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3D01F34F0
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 09:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E120E6E270;
	Tue,  9 Jun 2020 07:35:14 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
X-Greylist: delayed 362 seconds by postgrey-1.36 at gabe;
 Tue, 09 Jun 2020 00:44:55 UTC
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD456E9D3
 for <dri-devel@freedesktop.org>; Tue,  9 Jun 2020 00:44:55 +0000 (UTC)
Date: Tue, 09 Jun 2020 00:39:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1591663176;
 bh=/n4fYuEdj9NKK4hJumZK4korfqefNY3uSnzrKjH79jg=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=E6dBasJ1iJd4akjgzMPaOY+vDb6tlmN9i4rZP8A3STky3F9mxHP+TyW7R7TED1yEA
 SjomhJNaiYhoWMboJBW9TEcD2TCI+NHlsA1ZWyhr+IKwa2eoENxxW10am6aKiBd62v
 e7+PzaYixiVJyXHdiKJeNvcdZtSgFdu7oXMCxmo8=
To: dri-devel@freedesktop.org
From: Colton Lewis <colton.w.lewis@protonmail.com>
Subject: [PATCH 2/2] drm: correct trivial kernel-doc inconsistencies
Message-ID: <20200609003810.1656842-3-colton.w.lewis@protonmail.com>
In-Reply-To: <20200609003810.1656842-1-colton.w.lewis@protonmail.com>
References: <20200609003810.1656842-1-colton.w.lewis@protonmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
X-Mailman-Approved-At: Tue, 09 Jun 2020 07:35:06 +0000
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
Reply-To: Colton Lewis <colton.w.lewis@protonmail.com>
Cc: alexander.deucher@amd.com, Colton Lewis <colton.w.lewis@protonmail.com>,
 trivial@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Silence documentation warnings by correcting kernel-doc comments.

./include/drm/drm_dp_helper.h:1767: warning: Function parameter or member 'hbr2_reset' not described in 'drm_dp_phy_test_params'
./drivers/gpu/drm/drm_dp_helper.c:1600: warning: Function parameter or member 'dp_rev' not described in 'drm_dp_set_phy_test_pattern'

Signed-off-by: Colton Lewis <colton.w.lewis@protonmail.com>
---
 drivers/gpu/drm/drm_dp_helper.c | 1 +
 include/drm/drm_dp_helper.h     | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 19c99dddcb99..0bdf3c0f3c2a 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -1591,6 +1591,7 @@ EXPORT_SYMBOL(drm_dp_get_phy_test_pattern);
  * drm_dp_set_phy_test_pattern() - set the pattern to the sink.
  * @aux: DisplayPort AUX channel
  * @data: DP phy compliance test parameters.
+ * @dp_rev: DisplayPort revision
  *
  * Returns 0 on success or a negative error code on failure.
  */
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 2035ac44afde..863bd4341344 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1752,7 +1752,7 @@ static inline void drm_dp_cec_unset_edid(struct drm_dp_aux *aux)
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

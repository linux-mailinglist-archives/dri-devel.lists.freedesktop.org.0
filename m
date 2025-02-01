Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 302B7A24616
	for <lists+dri-devel@lfdr.de>; Sat,  1 Feb 2025 02:14:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F41E10E1B8;
	Sat,  1 Feb 2025 01:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="pJ55Wa0j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3DC610E1B8
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Feb 2025 01:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=/mmRK1wWK7L03xNe4fJ1XjLrqgzcw5ABx6HbTehR5DQ=; b=pJ55Wa0j46g7Oqgd
 tKP2GOwnDHsiz7g9erbA8Cp2drdgby3TX40bXr8jKX0ana3odkQadzuGRpwTmkCpgutTU2cnoRKUN
 mQLPT86kIZeoUub7Fc3wdZGQCtC17Zs1kmEEuhmTKg+3OdpzxoXlwH2E94yWHGE5L+ZxOXRsFV108
 YJAbxURiQ5RE/yyn6UkHfHEddN4DJvTTUguexSxBuKtNLo6WK5L1Iu5n5ePf4JRCg8JA2KUukXUfN
 YMo0ng/9F7zo9hnWISLrfPlzpahtveFX8/018dCA7m/9CcH/cE8JmufP2Rm77L20KOTmEN8qRDlkF
 TuJ7imQLkE4Vzg7chw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1te25j-00D1NI-2F;
 Sat, 01 Feb 2025 01:14:35 +0000
From: linux@treblig.org
To: patrik.r.jakobsson@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] drm/gma500: Remove unused mrst_helper_funcs
Date: Sat,  1 Feb 2025 01:14:34 +0000
Message-ID: <20250201011434.453879-1-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

The mrst_helper_funcs const was added in 2013 by
commit ac6113ebb70d ("drm/gma500/mrst: Add SDVO clock calculation")
and commented as 'Not used yet'.

It's not been used since, so remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/gma500/oaktrail_crtc.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/gma500/oaktrail_crtc.c b/drivers/gpu/drm/gma500/oaktrail_crtc.c
index de8ccfe9890f..ea9b41af0867 100644
--- a/drivers/gpu/drm/gma500/oaktrail_crtc.c
+++ b/drivers/gpu/drm/gma500/oaktrail_crtc.c
@@ -658,10 +658,3 @@ const struct drm_crtc_helper_funcs oaktrail_helper_funcs = {
 	.prepare = gma_crtc_prepare,
 	.commit = gma_crtc_commit,
 };
-
-/* Not used yet */
-const struct gma_clock_funcs mrst_clock_funcs = {
-	.clock = mrst_lvds_clock,
-	.limit = mrst_limit,
-	.pll_is_valid = gma_pll_is_valid,
-};
-- 
2.48.1


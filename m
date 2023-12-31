Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E286821161
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jan 2024 00:45:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95DF710E0A5;
	Sun, 31 Dec 2023 23:45:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2FA910E0A5;
 Sun, 31 Dec 2023 23:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=4UQSHGziniGnMB7NB3w+rLgmWm7wn1IcPSwtTyIDPQc=; b=fsZruzZq3/gC4YuPz0Si6jeGQW
 SubXgCd9D3v4qBY/LDs6G7GWJ48aO1uRapfRSCeIs64Ggf7MhXpBWXk88WY0OuZk2OuK6vFcg/dNG
 0xKJI5Rbip387B0tBhppYCHWUek8FwNn1nlRkT75GW+yIb7WgITLp/OD2XBfZRGf0Hm5uO9MpYt5x
 mXdED7IzOLv+sj2EKB+Lcc367euS2GfoeKLejdX9B0KUqNnmrA0FBm+54zZNjOs4tmGmAqIpM+KSl
 pvG4X8jWTfYFpdmcDXFixOKopTRlS0rXvleLY86H3q5wCf96SGK53+oG4c2a4/0zHO6iTM6J5SYhi
 pHTrbkzQ==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rK5US-005NBV-13; Sun, 31 Dec 2023 23:45:08 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amd/display: dcn35_hwseq: use common comment to prevent
 kernel-doc warnings
Date: Sun, 31 Dec 2023 15:45:06 -0800
Message-ID: <20231231234507.7685-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change non-kernel-doc comments to use "/*" to prevent warnings from
scripts/kernel-doc.

dcn35_hwseq.c:1124: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
         * power down sequence
dcn35_hwseq.c:1124: warning: missing initial short description on line:
         * power down sequence
dcn35_hwseq.c:1176: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
         * power up sequence
dcn35_hwseq.c:1176: warning: missing initial short description on line:
         * power up sequence

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
I thought that I sent this patch but it's not in the lore archive
so I'm sending it again. Apologies if you get it twice.

 drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -- a/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
@@ -1120,7 +1120,7 @@ void dcn35_calc_blocks_to_ungate(struct
 		update_state->pg_res_update[PG_HPO] = true;
 
 }
-/**
+/*
 	 * power down sequence
 	 * ONO Region 3, DCPG 25: hpo - SKIPPED
 	 * ONO Region 4, DCPG 0: dchubp0, dpp0
@@ -1172,7 +1172,7 @@ void dcn35_hw_block_power_down(struct dc
 	//domain22, 23, 25 currently always on.
 
 }
-/**
+/*
 	 * power up sequence
 	 * ONO Region 0, DCPG 22: dccg dio dcio - SKIPPED
 	 * ONO Region 2, DCPG 24: mpc opp optc dwb

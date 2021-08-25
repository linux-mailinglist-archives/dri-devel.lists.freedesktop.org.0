Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B673F7470
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 13:36:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151D68997C;
	Wed, 25 Aug 2021 11:36:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF7E8997C;
 Wed, 25 Aug 2021 11:36:16 +0000 (UTC)
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 47F213F072; 
 Wed, 25 Aug 2021 11:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629891375;
 bh=zo+G5iadB49U+2sdl2YTpWA23bkDMXVrOHPwSen0oq8=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=FnQLClw4ahcH9/00HhmoJhcdDd+0cBFgoPxvqa70H6459yZvUVYYLECLM2dvY+5+L
 UAlZicYe/dYaE5jK7OsWTZh7z2AgWFGi4Y8F4jQXhdZRZXetwYaX1KXlQEcNJepDF4
 HHn6GoTh6IJ10cLIgmTZubqCwD0ILAziOet+6eFS9mon/cmtHRFyElpjt4nBonQRVc
 0S4/Mykc3sj76Rm4Yg5ATdxVAQj6JJkWy7I7+3ffXUZtvQ4fqRCiIvNoDqbkMTmFYd
 2G/Qw7/Qxa1XtBomhZ5BQCbSS4LJv31PTpPhhcDN10C0a5gmlqi8IEp793lfn72Q+X
 sBVJ8nnbbWztw==
From: Colin King <colin.king@canonical.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/amd/display: fix spelling mistake "alidation" ->
 "validation"
Date: Wed, 25 Aug 2021 12:36:15 +0100
Message-Id: <20210825113615.14555-1-colin.king@canonical.com>
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

There is a spelling mistake in a DC_LOG_WARNING message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
index 3223a1ff2292..91cbc0922ad4 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
@@ -1999,7 +1999,7 @@ bool dcn31_validate_bandwidth(struct dc *dc,
 	goto validate_out;
 
 validate_fail:
-	DC_LOG_WARNING("Mode Validation Warning: %s failed alidation.\n",
+	DC_LOG_WARNING("Mode Validation Warning: %s failed validation.\n",
 		dml_get_status_message(context->bw_ctx.dml.vba.ValidationStatus[context->bw_ctx.dml.vba.soc.num_states]));
 
 	BW_VAL_TRACE_SKIP(fail);
-- 
2.32.0


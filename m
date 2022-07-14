Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E7C574AB0
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 12:34:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C509760C;
	Thu, 14 Jul 2022 10:34:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19FBE9760C;
 Thu, 14 Jul 2022 10:34:30 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id o8so763275wms.2;
 Thu, 14 Jul 2022 03:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pC66SMISxswpCgrA0kH+9OIYYeRJxezyms4h+DmQEVU=;
 b=WYO169N6L97QHmWqgss2/YWVR6YdUUzTbwOhAJSVFU1PEQ8kMqZBDicC68o07P9q28
 EEmuC/mKE53/poe+vlYtxqMaZ+PGZyrZbq2eRvdu5aRT6bArMjBK06GnSwCI1PkYV8x7
 UVCaVzMlf3W+ycBWFVoF9L83DY5tT97R24OrEMBDW5VZsJeqwuye8oTIOqHSGq714blI
 Wk/JILDt14y+ugO98wHXHVOtXlAw+wfAhbECEKwfxHSbKek2VkQuyXmSWmHG/m0aETRg
 pYgtSHJavQ5/qFeqk+bzDe5Q5xU4RXUi4MDpWF2WSdlG1KEgTcQheOshDYdeDck/jLyt
 lK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pC66SMISxswpCgrA0kH+9OIYYeRJxezyms4h+DmQEVU=;
 b=532QQLnLgY3DF4ltcaaaQq5CguIvp1QBkyjb/UvT5gfKCRjMMGT9UTLONf1nhooso+
 wWO0ytpTSEM+j38RM16mjqdpn9if8Pb6sSycMiR7xFT8D0EV0rPB9SAnh2N4Opgk8rAY
 p8eeYQ45g7OqByq5DfEef7PkQyROiAclRF1cV32W+17EVDfCoDy4VX5pxywyy3FdXkWS
 RSVMQDgyBwfYWEebJTxOE+wa7aMIn0VV5oRcBKv/Pt/8bss28ieXqr45d1wA4Nyobo84
 a5myt104JAgfir12kRCbGFDDiXl2ZxjlzXkXexYAxVHXfNKPpovsoWsGi7OnaAidKDL8
 QleQ==
X-Gm-Message-State: AJIora/lE4GtWiDPdseisfcaAgvqq4QlYnHwFUYdLj0ECQicYGfhCQfK
 ZrnkQzfekLO4N+nxB9blpDk=
X-Google-Smtp-Source: AGRyM1tzgGbSFb97riqzZ4HULy1PRelNWUuo0QfgWlU5yTDw80hM5eCb4WBNauTxsQxuKHokkxRFQA==
X-Received: by 2002:a05:600c:3506:b0:3a2:feb0:9f8e with SMTP id
 h6-20020a05600c350600b003a2feb09f8emr5482096wmq.42.1657794868604; 
 Thu, 14 Jul 2022 03:34:28 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 d16-20020a05600c049000b0039c96b97359sm1386358wme.37.2022.07.14.03.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 03:34:28 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/amd/display: Fix spelling mistake "supporing" ->
 "supporting"
Date: Thu, 14 Jul 2022 11:34:27 +0100
Message-Id: <20220714103427.23255-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.3
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a spelling mistake in a dml_print message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 .../gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
index 6101c962ab0a..fc4d7474c111 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
@@ -2994,7 +2994,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 			for (k = 0; k < v->NumberOfActivePlanes; ++k) {
 				if (v->ImmediateFlipSupportedForPipe[k] == false) {
 #ifdef __DML_VBA_DEBUG__
-					dml_print("DML::%s: Pipe %0d not supporing iflip\n", __func__, k);
+					dml_print("DML::%s: Pipe %0d not supporting iflip\n", __func__, k);
 #endif
 					v->ImmediateFlipSupported = false;
 				}
-- 
2.35.3


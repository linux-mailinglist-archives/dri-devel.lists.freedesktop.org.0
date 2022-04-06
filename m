Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6704F56D3
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 09:29:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA0A10F319;
	Wed,  6 Apr 2022 07:29:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A65310F311;
 Wed,  6 Apr 2022 07:29:12 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id s11so3035047qtc.3;
 Wed, 06 Apr 2022 00:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VE08dsgukeGG5IChIzOIKz1Sx9tWGQgZeReJDKhgy2Y=;
 b=FUuVzC2mh2PVAGCMRzU0asrMqYuRHc8mtDR5m5TiIlCPxpg/IWOWW0Zdfm3/eLqi2R
 2p7j5BO1/HkIb7o4D2nSTOo/Pr9CaSHq4DN7QdoDCAb02JfVSPV1dPTdYrwSHgoSW659
 KKSXTOllrtnDh55cJMQot97phLbbifmvR1+xfuSGrduOtaBhdWJm1wO4jaUSrTSwq90S
 8KyvuqNUQUwpfhQY7SouUIWg2PIQIKrGfRBUeX16AGAPJBgExu4TQlsIaqia1hf60TkR
 5MKJZGi9MfiM6PwShYFhEnUYjvPvRGZ5KQ8lpxtXCUGjfEXvLyF/VGfKo2tz0n/DVCKL
 uBUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VE08dsgukeGG5IChIzOIKz1Sx9tWGQgZeReJDKhgy2Y=;
 b=E8xY/XjYOithYs5l6n+0CuVuOApQ6Sp1vOemG+ooO+BWsiKPy04bUsYomG5j0ZnuzC
 gnIFujAsbYaQMLmRH4PhXZtJSc2dLKTFMoWjaPg6Y5mXMdWH5qyxanaIlnYb7iIxmFPt
 Kvor0M2ECN5xDeO6Y1t0tsODM3vQKgbNPlMw1XbgiqGlSltac2ueJkKV6ne20U1JOu2d
 2iL3rRxW3Ye+BhMzl5GFYl/H8gtDpxD8S4m9mS+wp9bpbNoVXX4kPmoE63HA4Sjx1ulE
 aV08wf34OUJOY2RN5ZI52bXOPRPwkf3Vd5wmwmVPzEqIaWBQEnmyqt6pBpgxo3nswPRh
 kWgQ==
X-Gm-Message-State: AOAM530Yf/3KF9ekUtyUvyqRPyQRhYP721iO2Ngm6J2P9mzaj/ecFZZE
 rm/Nhwpequ2uth76jSUuPGY=
X-Google-Smtp-Source: ABdhPJwigMtxTwtlbYYuXX75zJfRY1b7cxmWJvS5iiYcfK8nJ29v69OEJU8x+gG+EYqd39myJHe+pg==
X-Received: by 2002:ac8:5f07:0:b0:2e1:d695:d857 with SMTP id
 x7-20020ac85f07000000b002e1d695d857mr6317759qta.40.1649230151230; 
 Wed, 06 Apr 2022 00:29:11 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 d124-20020ae9ef82000000b00699a8b42aa8sm7949525qkg.16.2022.04.06.00.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 00:29:10 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: lv.ruyi@zte.com.cn
To: harry.wentland@amd.com,
	sunpeng.li@amd.com
Subject: [PATCH] drm/amd/dc:: remove duplicate include
Date: Wed,  6 Apr 2022 07:28:40 +0000
Message-Id: <20220406072840.2488056-1-lv.ruyi@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: dri-devel@lists.freedesktop.org, Angus.Wang@amd.com, hvanzyll@amd.com,
 airlied@linux.ie, qingqing.zhuo@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Zeal Robot <zealci@zte.com.cn>,
 Bing.Guo@amd.com, lv.ruyi@zte.com.cn, alvin.lee2@amd.com,
 alexander.deucher@amd.com, Jun.Lei@amd.com, Anthony.Koo@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lv Ruyi <lv.ruyi@zte.com.cn>

'dm_services.h' included in 'freesync,c' is duplicated, so remove one.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
---
 drivers/gpu/drm/amd/display/modules/freesync/freesync.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
index d72566c6928a..0130f1879116 100644
--- a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
+++ b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
@@ -29,7 +29,6 @@
 #include "dc.h"
 #include "mod_freesync.h"
 #include "core_types.h"
-#include "dm_services.h"
 
 #define MOD_FREESYNC_MAX_CONCURRENT_STREAMS  32
 
-- 
2.25.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE815B52D4
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 05:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4D310E061;
	Mon, 12 Sep 2022 03:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2388C10E061;
 Mon, 12 Sep 2022 03:23:02 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id b75so2089164pfb.7;
 Sun, 11 Sep 2022 20:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=01auDevlyZEsy9VNCmbrrsxvCF/1+AqShCC158mTMG4=;
 b=EQS6g+jqMTBKxQNNXTAg0/Jv5BUDoOzo/sjlXjUjvOykigv57iMUKGPzB+BW7aRK75
 eJq2ew80JptMG8itesP/xpHAq7cdw5moWnqHq44GjTscK2EaGstllG2V4U7c4dzYWiTP
 vMAgoC+RgWtORXboDw/ZXJZF3dpwjW0a6SJ3x9xVg7IQJaRGfbOhE2Pg11M71F+Jve1t
 X5NOQmTe2YyJjjhVxftW6XG8twaS7SE0+PoswBEPSoU2fu0O5RaisG3S60lbFb0jRBCh
 MgS0clo3Bj/5mJcp1AVKE7J7AZbOwELc1fEH9NkciPeZshTRiQAZRg5NxGO/NhgUJSyN
 u8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=01auDevlyZEsy9VNCmbrrsxvCF/1+AqShCC158mTMG4=;
 b=bLYa97vRwhCyEChBInDywgahD+SrQaAaLRwO6erytA9I2qs7BZR2CS6P1EVxTEhKu6
 sxcde6DkV6bfKT9Z9TXcSCse4UBxFhz8Q/DCEiFh5XnHH0nc534eJSwQtFzIfhyYmJGy
 iP+37x5hgP1Yym5aPHAGlafCcWgFY2HA04q0blCnBhp6hixKWBKgNmIDyUhliKfX2AZr
 d3sr04R1lxGLC7Z/Yh8S5kYrcrCa7VA+ex4O6Cockr2U2h1Fvk+cc+wU1RRT+jVcRdhI
 lyVy3szC470ZDpcn1STtQWojRYnmiwnzjLz0jul5HdEgNcZ9EGq8ilbpf1enpnZoeT27
 ws4w==
X-Gm-Message-State: ACgBeo2+wsL3llx01QK2UJx0eneiArIZQbatLKeBYd84TDqAlCA1Xkof
 wUiAe5lvCrPfY40S2RgCi/9hSDsB1B4=
X-Google-Smtp-Source: AA6agR42AMxdHeUm/hcZICJ4/B6hDejHuEWpIM4gBttsevn8sQyeXqBFzVnr4TVL7Bqrxu5DLJuwig==
X-Received: by 2002:a05:6a00:1910:b0:52f:13d7:44c4 with SMTP id
 y16-20020a056a00191000b0052f13d744c4mr24769860pfi.32.1662952981579; 
 Sun, 11 Sep 2022 20:23:01 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 gc10-20020a17090b310a00b001fd6066284dsm4107754pjb.6.2022.09.11.20.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 20:23:00 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: xu.panda@zte.com.cn
To: sunpeng.li@amd.com
Subject: [PATCH linux-next] drm/amd/display/amdgpu_dm: remove duplicate
 included header files
Date: Mon, 12 Sep 2022 03:22:42 +0000
Message-Id: <20220912032241.16259-1-xu.panda@zte.com.cn>
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
Cc: Xu Panda <xu.panda@zte.com.cn>, airlied@linux.ie,
 linux-kernel@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, roman.li@amd.com,
 amd-gfx@lists.freedesktop.org, nicholas.kazlauskas@amd.com,
 aurabindo.pillai@amd.com, dri-devel@lists.freedesktop.org, Wayne.Lin@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xu Panda <xu.panda@zte.com.cn>

soc15_common.h is included more than once.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Xu Panda <xu.panda@zte.com.cn>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 7a93162633ae..0e42bf496a73 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -98,8 +98,6 @@
 #include "soc15_common.h"
 #include "vega10_ip_offset.h"

-#include "soc15_common.h"
-
 #include "gc/gc_11_0_0_offset.h"
 #include "gc/gc_11_0_0_sh_mask.h"

-- 
2.15.2


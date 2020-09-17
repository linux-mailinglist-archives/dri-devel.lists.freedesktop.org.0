Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CA726D5C0
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 10:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6C306EB84;
	Thu, 17 Sep 2020 08:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9EC6E03A;
 Thu, 17 Sep 2020 03:46:29 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id u3so518350pjr.3;
 Wed, 16 Sep 2020 20:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=cgDpaFzCGSid4Alu9HrD69vjL13qDjm+CokA2ioLn6s=;
 b=b1/U1KkeTQqJdg8I7jPhzGyMKLlH7kg7OxLTWMlfV6Yxo2+tDHN5Ns4sv/vliYl47A
 A5fvLdH8ihswHFeu317/DGw21E5OGxmEzNLdjh4IbyFu+0AyCOAzHhBUHj13jie8RvBB
 JLMANZJzBup1kINjerd2pLxgsijMjMqFY6PVcdv6vXRkOruqG1QLoUFMLilb5W39ZqmO
 k0ETLvo11KtOd600Y59J1wGH/ISM6pfL4l6MxjdXM2DgYRlAnuRh3HuWNcmpBsJsve9/
 XUGShIhlxzBNuXowc2I7XuKB5DbO6+HhpyXZPV1nrKBgZB9Es9ZwvyudPbm9OiW1Mie7
 JuhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=cgDpaFzCGSid4Alu9HrD69vjL13qDjm+CokA2ioLn6s=;
 b=cPe/+5dYF4gb+44sTSaGbIUftgU0KfYhM5LO0YiRA9KgWtcE2GypNPxCGwUaLZejAZ
 Za2v49kKm9/hR82pu/66PofuQXFRuz5GqSOwpfh9kEiQjeuhp71HdM6/4zKfYBInGyr5
 kvwwgkJy2caVNBzNp0+Sh5Foa05w04ket/oTJZRhATcWYJnZv/RtzSwz8tJfvRA3BGhN
 kv0WaylmB+MUFtxO3OTr8ZI6icQnQswzaju4trovSdhi0eH/oKO8zPGSX08cZsRyWz9T
 Z/u9DSgq0LorXs4WBRrdfJQ7DIXaOhXa30Z1p0y2sE1sapW4/+Ov4W31C5mZT6Qao7bW
 Rc3A==
X-Gm-Message-State: AOAM5301mw7AFhNmXSd2zVfBIQWzbSjZNc2OmedhfUUq5XBCkEpFVD37
 Nb3rC+TeJjkh3cwchmD9t5k=
X-Google-Smtp-Source: ABdhPJz9oepAeRBrxyHiQuBs0Jq+AhrcVd8RmyTw68dx4tLZpFwlR/8bpoU3OeUyX6zD8jKXhoCDaA==
X-Received: by 2002:a17:90a:eb06:: with SMTP id
 j6mr6662854pjz.46.1600314389278; 
 Wed, 16 Sep 2020 20:46:29 -0700 (PDT)
Received: from localhost.localdomain
 (ec2-13-52-163-24.us-west-1.compute.amazonaws.com. [13.52.163.24])
 by smtp.gmail.com with ESMTPSA id a5sm504042pgk.13.2020.09.16.20.46.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 20:46:28 -0700 (PDT)
From: Xiaoliang Pang <dawning.pang@gmail.com>
To: evan.quan@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, kenneth.feng@amd.com,
 zhengbin13@huawei.com, pelle@vangils.xyz, yttao@amd.com
Subject: [PATCH v1] powerplay:hwmgr - modify the return value
Date: Thu, 17 Sep 2020 11:46:10 +0800
Message-Id: <20200917034610.21703-1-dawning.pang@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 17 Sep 2020 08:08:02 +0000
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
Cc: tianjia.zhang@linux.alibaba.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dawning.pang@gmail.com, nirmoy.das@amd.com,
 amd-gfx@lists.freedesktop.org, JinHuiEric.Huang@amd.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

modify the return value is -EINVAL

Fixes: f83a9991648bb("drm/amd/powerplay: add Vega10 powerplay support (v5)")
Fixes: 2cac05dee6e30("drm/amd/powerplay: add the hw manager for vega12 (v4)")
Cc: Eric Huang <JinHuiEric.Huang@amd.com>
Cc: Evan Quan <evan.quan@amd.com>
Signed-off-by: Xiaoliang Pang <dawning.pang@gmail.com>
---
 drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c | 2 +-
 drivers/gpu/drm/amd/powerplay/hwmgr/vega12_hwmgr.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
index c378a000c934..7eada3098ffc 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
@@ -4659,7 +4659,7 @@ static int vega10_display_configuration_changed_task(struct pp_hwmgr *hwmgr)
 	if ((data->water_marks_bitmap & WaterMarksExist) &&
 			!(data->water_marks_bitmap & WaterMarksLoaded)) {
 		result = smum_smc_table_manager(hwmgr, (uint8_t *)wm_table, WMTABLE, false);
-		PP_ASSERT_WITH_CODE(result, "Failed to update WMTABLE!", return EINVAL);
+		PP_ASSERT_WITH_CODE(result, "Failed to update WMTABLE!", return -EINVAL);
 		data->water_marks_bitmap |= WaterMarksLoaded;
 	}
 
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega12_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/vega12_hwmgr.c
index a678a67f1c0d..04da52cea824 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega12_hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega12_hwmgr.c
@@ -2390,7 +2390,7 @@ static int vega12_display_configuration_changed_task(struct pp_hwmgr *hwmgr)
 			!(data->water_marks_bitmap & WaterMarksLoaded)) {
 		result = smum_smc_table_manager(hwmgr,
 						(uint8_t *)wm_table, TABLE_WATERMARKS, false);
-		PP_ASSERT_WITH_CODE(result, "Failed to update WMTABLE!", return EINVAL);
+		PP_ASSERT_WITH_CODE(result, "Failed to update WMTABLE!", return -EINVAL);
 		data->water_marks_bitmap |= WaterMarksLoaded;
 	}
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C32B426614
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 10:40:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD946E864;
	Fri,  8 Oct 2021 08:40:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91FEA6E862;
 Fri,  8 Oct 2021 08:40:29 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id t11so5678199plq.11;
 Fri, 08 Oct 2021 01:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jRvRbT4tItXhsQ6uXiyzLkt0Tljb54gMkNLUaVrvoJY=;
 b=M0BdNLwube5rdmMw1NB+QQh07VnGczGl7xIfx6UBT3Pqv9ndlEODlRtFCgcriyPBfE
 q43R2OC7/N17BUe8skG0387B/xPw10ZgLNdHpwF/vI+IZzIEU6cjR8hBo+uLxTzM0/DY
 f7UubkOaXVPiXdHk9IbEiZAV+wQiSSku8d7WqAudhTGsKwbnlRrxv7+UsboDJz7mB0UZ
 BAaz+AivALfjEfVAyQPh9uIYCXmcGIXYr47+EIG38cuhgExm/oa2PbojOVisWPeUF2FO
 K0VZGtQl/d3aOOk5O5Z+swLDihNmOmDJmN0EHMdWiFG2SId+d5psnP8MaEL5bxVDkD1u
 pvSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jRvRbT4tItXhsQ6uXiyzLkt0Tljb54gMkNLUaVrvoJY=;
 b=vKowsPpfsRBJLqz5nQnuJVcWhIzge0aESuq8dcN4kBQZSnnQpGHip1xMyju/BLCNfa
 CCCfwErpZ33dzbmAHk+XchxsCsI547f+Gy8o7msCIG26vQcKkKMrdREYGHBfHh2tF6KW
 I8WaLvzBbJ6MVA6jdzObnI/jDSJIGUGixoINsYo9jvqGCyVP2UqA4lnq0VBIEbv4omM9
 RCsRsBbgnJBjexFHsyMen11K/0Ze7vKD4bYdeI78yoakzjnIg7TwIwKbWAjte2JSunUh
 klEdN/mVGUFL3m5QXIJtJXcc+dvhkdkqtLcPjx4RvsufKRpob0jEW2Gt+8v+X0NwEFmn
 6sXg==
X-Gm-Message-State: AOAM531+uDZ6IRMiDiSzGqViGMxs/zwnuZ70/IFzUXV3xDWgTM3Z6LUw
 bcplBGR9v7F9LxUf4wc9sKA=
X-Google-Smtp-Source: ABdhPJxxZa8baE+0IBL/I9V5VIuwnDlwG1TW3zGECZ3knLPDIZ63IUI8jwjbtrw9VZz+hESDsUUdTw==
X-Received: by 2002:a17:903:248f:b029:128:d5ea:18a7 with SMTP id
 p15-20020a170903248fb0290128d5ea18a7mr8303766plw.83.1633682429162; 
 Fri, 08 Oct 2021 01:40:29 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id v26sm1880847pfm.175.2021.10.08.01.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 01:40:28 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: lv.ruyi@zte.com.cn
To: harry.wentland@amd.com
Cc: sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 charlene.liu@amd.com, zhan.liu@amd.com, lv.ruyi@zte.com.cn,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] drm/amd/display: remove duplicate include in dcn201_clk_mgr.c
Date: Fri,  8 Oct 2021 08:40:19 +0000
Message-Id: <20211008084019.502758-1-lv.ruyi@zte.com.cn>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lv Ruyi <lv.ruyi@zte.com.cn>

Remove all but the first include of reg_helper.h and core_types.h
from dcn201_clk_mgr.c.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
---
 .../gpu/drm/amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c    | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c
index 46e7efe9a78a..db9950244c7b 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c
@@ -26,8 +26,6 @@
 #include "reg_helper.h"
 #include "core_types.h"
 #include "dccg.h"
 #include "clk_mgr_internal.h"
 #include "dcn201_clk_mgr.h"
 #include "dcn20/dcn20_clk_mgr.h"
 #include "dce100/dce_clk_mgr.h"
-#include "reg_helper.h"
-#include "core_types.h"
 #include "dm_helpers.h"
 #include "dm_services.h"
 
-- 
2.25.1


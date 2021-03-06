Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B09832F994
	for <lists+dri-devel@lfdr.de>; Sat,  6 Mar 2021 12:05:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8ED76E4FE;
	Sat,  6 Mar 2021 11:05:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D5B6E4FE;
 Sat,  6 Mar 2021 11:05:33 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so560753pjv.1; 
 Sat, 06 Mar 2021 03:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9AfHAOMbxC7MTHsWF8p12oIJD2meb9c1IkmlruG2cLk=;
 b=oQa2f93ojNFEENAzbWjskJgLPWUPepttHtbGGmAwtO+Mmd9qiVp29+g71zchN3IzoT
 JgFje6XxxcNzBJsGddkMpFcn5qrF3b2z2pbWQtdWHkvPxVvOlclTniWBtp2qbnB+caSD
 u22+jTSAjVpBEVSF6Pot9qtJ+TUhFXsrY7cfQ16d/DoH8Bk1t+qfd6KvH8NmLUJD02lm
 du6tldtT/NLHyDuYYwItnYjY9XSX2ob/DXvb4ZsaRdFmD3kuWqv5jDQpk0bRmJUFsIDi
 StN3Ms570K/eyPgfxJTsZ2qacM4bzt6bNv3IP9sQhRcg+xl7InD2U8ubYPGf4F1i4dMz
 X/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9AfHAOMbxC7MTHsWF8p12oIJD2meb9c1IkmlruG2cLk=;
 b=AhuxikgiJR8xHwIFq3BYtxr+m07enNzqEFPEJ64P13xySOKLYICY9NuFSNaPOsgl0n
 x1kf6itQvBu5c2OTG+V55ByoZsk7gxIF1jtPhKkyw3I+7uc4tGW0WmZZJHp30Hx+jp2d
 kSwtouJYcfyXXt+32UxmwEXW2Qohq6tz1wjDYYPrbQtD2No6c1MXEVVweJW2nQu+l+3m
 b9VaOynsaPqje9aS6eBtTqf1FUQ1wwWunQXIj+ZbscYLCw6OLvxViQINWydQWOsJT7iC
 nJ5MXJu1Fpq52+FlPzmsqN5mCcj5fagbOJy0MXA7xDtyjWjHoNdEjlUV76hGvdhDYgIc
 Zd5A==
X-Gm-Message-State: AOAM532hT8mCd8zzpPiFK8YRllEHZKM6wwv2NbYe8WqlzmEmeT97T/aZ
 8+BqNxjahn+ZQcMz03wAlEs=
X-Google-Smtp-Source: ABdhPJzlIglq+eDAuFl63+agzj8j0YbnG/skFpE8O2PcgFt5z7j4HeTRpvNWTvfpl+R7RJoBUKc8yA==
X-Received: by 2002:a17:90a:400f:: with SMTP id
 u15mr14728424pjc.80.1615028733480; 
 Sat, 06 Mar 2021 03:05:33 -0800 (PST)
Received: from localhost.localdomain ([178.236.46.205])
 by smtp.gmail.com with ESMTPSA id d16sm4903743pjd.25.2021.03.06.03.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 03:05:33 -0800 (PST)
From: menglong8.dong@gmail.com
X-Google-Original-From: zhang.yunkai@zte.com.cn
To: sunpeng.li@amd.com
Subject: [PATCH] drm/amd/display: remove duplicate include in dcn21 and gpio
Date: Sat,  6 Mar 2021 03:05:25 -0800
Message-Id: <20210306110525.216316-1-zhang.yunkai@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: isabel.zhang@amd.com, sung.lee@amd.com, Dmytro.Laktyushkin@amd.com,
 airlied@linux.ie, Tony.Cheng@amd.com, Rodrigo.Siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 zhang.yunkai@zte.com.cn, aurabindo.pillai@amd.com,
 dri-devel@lists.freedesktop.org, wyatt.wood@amd.com, alexander.deucher@amd.com,
 Krunoslav.Kovac@amd.com, christian.koenig@amd.com, Anthony.Koo@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zhang Yunkai <zhang.yunkai@zte.com.cn>

'dce110_resource.h' included in 'dcn21_resource.c' is duplicated.
'hw_gpio.h' included in 'hw_factory_dce110.c' is duplicated.

Signed-off-by: Zhang Yunkai <zhang.yunkai@zte.com.cn>
---
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c         | 1 -
 .../gpu/drm/amd/display/dc/gpio/dce110/hw_factory_dce110.c    | 4 ----
 2 files changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
index 072f8c880924..8a6a965751e8 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
@@ -61,7 +61,6 @@
 #include "dcn21/dcn21_dccg.h"
 #include "dcn21_hubbub.h"
 #include "dcn10/dcn10_resource.h"
-#include "dce110/dce110_resource.h"
 #include "dce/dce_panel_cntl.h"
 
 #include "dcn20/dcn20_dwb.h"
diff --git a/drivers/gpu/drm/amd/display/dc/gpio/dce110/hw_factory_dce110.c b/drivers/gpu/drm/amd/display/dc/gpio/dce110/hw_factory_dce110.c
index 66e4841f41e4..ca335ea60412 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/dce110/hw_factory_dce110.c
+++ b/drivers/gpu/drm/amd/display/dc/gpio/dce110/hw_factory_dce110.c
@@ -48,10 +48,6 @@
 #define REGI(reg_name, block, id)\
 	mm ## block ## id ## _ ## reg_name
 
-#include "../hw_gpio.h"
-#include "../hw_ddc.h"
-#include "../hw_hpd.h"
-
 #include "reg_helper.h"
 #include "../hpd_regs.h"
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

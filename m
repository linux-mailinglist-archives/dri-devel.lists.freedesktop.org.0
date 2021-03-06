Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9822732F973
	for <lists+dri-devel@lfdr.de>; Sat,  6 Mar 2021 11:48:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B39BA6E4F9;
	Sat,  6 Mar 2021 10:48:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 632BC6E4F9;
 Sat,  6 Mar 2021 10:47:29 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id 16so2445941pfn.5;
 Sat, 06 Mar 2021 02:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+OVArO45cIFAZDllkGVnvJRDcrMzTd8kZJ6zshsC9EY=;
 b=cS+ut13MTQYqZC81q17e6WqC26TgE19vcCvDknXlTxQN/o/aOdlCMKbh1WS7MF7LrO
 MGpVAK9HQhFi+tImfmnY69TGVP3cjERsOmtegbYTchJy3SQyrk7FO3CmQDEO0idwbAen
 r+zfjxTdYYI0qxny+Wkr0B41QRWHAYywnT6DXK/kgqFswlcD9z81EgyG0Bc2NDr6/gg6
 JCV7ttYE0yEPud/xNvmx1iG6aG+e5c43xw7432AfpOtR0fbuO9Ag91sxptBdWhetCc3W
 dntq/r93iMWPmTNvVLUedJRUxO0fZI3L3zQD640Xh7TBlwYJs9Zm8xFaWSF8K97kDY+z
 bXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+OVArO45cIFAZDllkGVnvJRDcrMzTd8kZJ6zshsC9EY=;
 b=CWoQJz13d8iDk3CDZam+6uEPq5tafVUp5zQLe7XyaGx0k3rCGZRr+O5cXyWt6/5PlT
 kgAgfCMF6R9PHaNrlg1SE0Seak6vKbaOBgvQJcvlgrMQOQXv0xd3Woro/u/7sObe9IBi
 hBRGs4iTsyWa0qY4+8/UYSMmkreyNxVQyQXB8MD8UcZo1QKciVy2DBPl59/5yDX4hA6h
 e6CH5eoL2Z4LsprJsZHGWIyXK+vqeudIW6uzhXT4XAUKXsBrIH6X25j5e5gh2ZPL0S5B
 07gM6ptwK8oHfoQDmexypJTAZTNjVkFYuQpRQYl6ykhjqSAE0rD2KOJFxAuv8j+GTbnb
 HLyg==
X-Gm-Message-State: AOAM533fgR3QY8gEERYSa7hhOY1Ed38cP6ffWKoeM6tUo9yyKrop+2OL
 UnFi5OChzTniTfyUaNaUIK0=
X-Google-Smtp-Source: ABdhPJyjym9wsWQn1eiIbQ3l+me663Tkn6GiPbKErmB1Gshj4oPC5Bw8MUW2B9eaGSZMPxxLNd8Ycw==
X-Received: by 2002:a65:40c4:: with SMTP id u4mr12188962pgp.139.1615027648964; 
 Sat, 06 Mar 2021 02:47:28 -0800 (PST)
Received: from localhost.localdomain ([178.236.46.205])
 by smtp.gmail.com with ESMTPSA id o62sm4677955pga.43.2021.03.06.02.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 02:47:28 -0800 (PST)
From: menglong8.dong@gmail.com
X-Google-Original-From: zhang.yunkai@zte.com.cn
To: sunpeng.li@amd.com
Subject: [PATCH] drm/amd/display: remove duplicate include in amdgpu_dm.c
Date: Sat,  6 Mar 2021 02:47:20 -0800
Message-Id: <20210306104720.215738-1-zhang.yunkai@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 06 Mar 2021 10:48:34 +0000
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
Cc: stylon.wang@amd.com, Zhang Yunkai <zhang.yunkai@zte.com.cn>,
 airlied@linux.ie, Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, nicholas.kazlauskas@amd.com,
 Bhawanpreet.Lakha@amd.com, aurabindo.pillai@amd.com,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zhang Yunkai <zhang.yunkai@zte.com.cn>

'drm/drm_hdcp.h' included in 'amdgpu_dm.c' is duplicated.
It is also included in the 79th line.

Signed-off-by: Zhang Yunkai <zhang.yunkai@zte.com.cn>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 3e1fd1e7d09f..fee46fbcb0b7 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -44,7 +44,6 @@
 #include "amdgpu_dm.h"
 #ifdef CONFIG_DRM_AMD_DC_HDCP
 #include "amdgpu_dm_hdcp.h"
-#include <drm/drm_hdcp.h>
 #endif
 #include "amdgpu_pm.h"
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

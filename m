Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C38647C1B9
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 15:42:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846FC113962;
	Tue, 21 Dec 2021 14:42:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F14A6113962;
 Tue, 21 Dec 2021 14:42:41 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id v22so12979105qtx.8;
 Tue, 21 Dec 2021 06:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D31zelEVktxk1zVBP/e569ZOieN3IU0DvIddUF6p1ZM=;
 b=eiwe50TFlZDlaDlCkbz6L0i7iHgSm249T64gND2w03zqTyS2mJCA70hsfEf/pH+W0u
 OD9kBLd1flhOakQJrfkZHHhVur8gnqkAPZGL/CKfLQFi6proAqbGYcaRp37eb4s0K+Qg
 qW8ALuwdGcJ5fdocA9zAJG65LBi5mlEYo9AFgwyDxsciX78ksoV0C2dg1gdjJ7uEUpoY
 fBGew3DkTgoaMcBQzfKFKlSZ9uLESHVKbmR2rsQ1PgYu/GGuKCUutYo3/f3PUPYLh1ud
 plaOJ4TuyEOx3FvxzD96C3388WT+yT3EW2fh+O4eqmCmlIwqGXvGCnShOSmWHPY7AdZS
 TS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D31zelEVktxk1zVBP/e569ZOieN3IU0DvIddUF6p1ZM=;
 b=fut0Vc1pXzAI5n+N7thiNBGp4aMEEcQ2ipp+jBIU49ly4v46UO7UGLSI+vFzzsMgFn
 eHNg8BkhTOumg/A6DPmY9mH25Y8I2PFJC9Suoj6QDJkMuZJ6Fh7WNoY/NcUoPmk6k0Qm
 yQPnMFVE6feX8RFUOhAhtjDTKARuCHYmVJr8XIvEVBtODquINdcZcGewGmsUtgcEPLNw
 vaWu8MTP0zSM2hwd73wBN0G0ryY3MGiRG7c+mFlyCdFcieGCLKhj5fS8eOOJKe84GVdG
 Q0N+NUhe0/cHbP5yCOT7YIAB+hDxC2oIyntmKwVkSnPPI35W5TvEBqxiYTWXMebTpief
 R4kw==
X-Gm-Message-State: AOAM531JTSKReWqxJ/jzZC6FH30D8DmuJ5M58UGhwDClRwi7+IR0A7XM
 i/uwBkFcyaWQV71PNZV2b4w=
X-Google-Smtp-Source: ABdhPJyAwIC+hNgSxPfn11Ky2iXQXAmqJxFVzzNjAb5C2gvg6ijvzxuCuNZ8rvQFcyt6gcSDkXyfSA==
X-Received: by 2002:a05:622a:28b:: with SMTP id
 z11mr2443070qtw.242.1640097761140; 
 Tue, 21 Dec 2021 06:42:41 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id v4sm14130108qkp.118.2021.12.21.06.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 06:42:40 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: deng.changcheng@zte.com.cn
To: robdclark@gmail.com
Subject: [PATCH] drm/msm: replace DEFINE_SIMPLE_ATTRIBUTE with
 DEFINE_DEBUGFS_ATTRIBUTE
Date: Tue, 21 Dec 2021 14:42:34 +0000
Message-Id: <20211221144234.480618-1-deng.changcheng@zte.com.cn>
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Changcheng Deng <deng.changcheng@zte.com.cn>,
 sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Changcheng Deng <deng.changcheng@zte.com.cn>

Fix the following coccicheck warning:
./drivers/gpu/drm/msm/msm_debugfs.c: 132: 0-23: WARNING: shrink_fops
should be defined with DEFINE_DEBUGFS_ATTRIBUTE

Use DEFINE_DEBUGFS_ATTRIBUTE rather than DEFINE_SIMPLE_ATTRIBUTE for
debugfs files.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 956b1efc3721..91fb0c83b600 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -129,9 +129,9 @@ shrink_set(void *data, u64 val)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(shrink_fops,
-			shrink_get, shrink_set,
-			"0x%08llx\n");
+DEFINE_DEBUGFS_ATTRIBUTE(shrink_fops,
+			 shrink_get, shrink_set,
+			 "0x%08llx\n");
 
 
 static int msm_gem_show(struct seq_file *m, void *arg)
-- 
2.25.1


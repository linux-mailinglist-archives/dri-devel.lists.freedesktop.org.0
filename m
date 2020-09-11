Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC0D26855C
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 09:03:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5D06E1D2;
	Mon, 14 Sep 2020 07:03:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21F56EA8C
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 15:11:27 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id w16so10175952qkj.7
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 08:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y1Mrrdltf8JkUiXBwhP12Bt7vHszc4a/D3llhrE39Xw=;
 b=MoQFwC4EpyX85Anny9UHuFER6SjCt3UBEclhiTbYlK6pZQX0savVZRI5+O66AjEdYB
 GkvL07kCmxDgGV50HIKI5UDum12f+xl3CM6YBNP2omwKP5H4AY8SMHm4GLP8osdK3sqz
 QnZTnE7CXyDfZurizKL/RI+DnHe5ClsIxPEzhi1xJrtZIeC89rUdjsVAbVJnmv2k+zhL
 mJkff3t7cJG0sU9LtjYI8YKbwHAurifS/1kxoV2H3BwoGRKOFn8kXHzT9jJocmzNqHvD
 DfcxQG14xV61pCVzEmhvBlve9OA4r8so+RG9W7qQtjjwHiU/TBntygFFvpROlUoP1WFF
 MgjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y1Mrrdltf8JkUiXBwhP12Bt7vHszc4a/D3llhrE39Xw=;
 b=JmyfHlUYlOkFSV5liIOsvvXRgfGWmNmFpVj+NsfJ+H1NABJRgejBm6iCoCsd0vNrnj
 OjPOmfsVUFrk/Z6QuYeoSqDD1wmFedEuuIJDO1cY2nN//aPY7bhr1sf7nFehdWXDt8Cd
 R5VaRkPVIs+zFnpY+yi2AnCF79E78iAKG1izIq1GNfVPEZNMYEx3p7qBvfHzqLkdBLt7
 OCgsJnPeF3eY/k4WSv4OwThx8E5mTkuBHGqXn31Digufw5wgfuUrTs7He4ZRWUwS6gSe
 xxwvsCpJLGpXQ3xucibu+A/NxtME7rmEzr8YxymcKX+YLFGfeoGj/44LCqR5FCxMMwNd
 qiaA==
X-Gm-Message-State: AOAM531CQijGZvM8vOgODgBkT7YDM5elukKfEpdaXdFo8s9vOYuV65/6
 SMKnqMa142rdKJs1gW/sxXIPrg==
X-Google-Smtp-Source: ABdhPJx+zbL1tNt55Zil0iW3l1E7IHbR8fyL540rrDdm9l9Q2+9LzVozM7YcYAXK/ido+diJeIQm1g==
X-Received: by 2002:a37:aac5:: with SMTP id t188mr1746167qke.427.1599837086849; 
 Fri, 11 Sep 2020 08:11:26 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id 201sm3216429qkf.103.2020.09.11.08.11.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 08:11:26 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 2/3] drm/msm/dsi: add DSI config for sm8150 and sm8250
Date: Fri, 11 Sep 2020 11:09:38 -0400
Message-Id: <20200911151001.13156-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200911151001.13156-1-jonathan@marek.ca>
References: <20200911151001.13156-1-jonathan@marek.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 14 Sep 2020 07:03:05 +0000
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
Cc: Krzysztof Wilczynski <kw@linux.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Harigovindan P <harigovi@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Konrad Dybcio <konradybcio@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This allows DSI driver to work with sm8150 and sm8250. The sdm845 config
is re-used as the config is the same.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> (SM8250)
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 5 ++++-
 drivers/gpu/drm/msm/dsi/dsi_cfg.h | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index f892f2cbe8bb..b2ff68a15791 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -265,9 +265,12 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 		&msm8998_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_2_1,
 		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
+	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_3_0,
+		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
+	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_0,
+		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_1,
 		&sc7180_dsi_cfg, &msm_dsi_6g_v2_host_ops},
-
 };
 
 const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index efd469d1db45..ade9b609c7d9 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -21,6 +21,8 @@
 #define MSM_DSI_6G_VER_MINOR_V2_1_0	0x20010000
 #define MSM_DSI_6G_VER_MINOR_V2_2_0	0x20000000
 #define MSM_DSI_6G_VER_MINOR_V2_2_1	0x20020001
+#define MSM_DSI_6G_VER_MINOR_V2_3_0	0x20030000
+#define MSM_DSI_6G_VER_MINOR_V2_4_0	0x20040000
 #define MSM_DSI_6G_VER_MINOR_V2_4_1	0x20040001
 
 #define MSM_DSI_V2_VER_MINOR_8064	0x0
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

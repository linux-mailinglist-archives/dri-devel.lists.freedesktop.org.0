Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE3225E4B4
	for <lists+dri-devel@lfdr.de>; Sat,  5 Sep 2020 02:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 660B86ED09;
	Sat,  5 Sep 2020 00:35:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 563FF6ECA0
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 17:30:10 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id d20so7048288qka.5
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 10:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+/ZP5kS5Rqe9m8HHOrySpxvpwfZsdKiW4+S2+xiaFZ4=;
 b=bzIEIgVCyUxB7ogqA2p4KhVMr9nk3rC+fPN6Hwvq0fBPGWQt5Mt4Z0cSFjryKkIzZj
 EsTgy7TNbDNNmA0+AahwO2952KkXEr/rn3BfHxyKf4S6sJEgWWkcIm7tO5qb5dy8GKDS
 aapkBfizEHQa2F4zPqs58/spHZoNA5JsRkDJSvhY/h1KQs32JU1W7OpJLLlM9Mq1wXuD
 /fA4dOoo/9xeE8tVZoZJRwKQaIt7xzusIqpXp+qzjR1z7rxpxD/VNiNlrEa47TGOfDFw
 Bhik7MJsMwS4Pz4lGMcbrgnm++nSQNY/PsJ7HQrEfHlZAiYp4Con5PdddQN58Zk16cy+
 CECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+/ZP5kS5Rqe9m8HHOrySpxvpwfZsdKiW4+S2+xiaFZ4=;
 b=UZ69XLc4QXv0Ds7dj5KhhDqsWZMV6vgA54q6gHMCmETDZtPLsoJogTqTj5RsNRNzzj
 nAmKVkP02Rkb0hZDf/9R3Xf54m7QjqGOk+8mTV8HRmt4AcKD6DyUY9rK+JRZ2sJAsT/w
 QzSRgpw4ri00+Rc8aEAM+0NDgQvO752rXCnJSleg2ogO1lfCGlch/0HSx2eGj+Dor1PT
 0kb3bRZXk45kMcq9VVvcs4DWhn887/kuNKJQaEq+/5/lE0c4u4+HNzUoxG4jgJIlATBn
 3HdrtiVU7hS6ptZv7C63SBNhoRBRLz9+C2soZELRg8QimnMybwdZCZ1jXoHBBFTCBc8o
 nI8g==
X-Gm-Message-State: AOAM531ErjXxCE3ezHeq3W6mqAp3D7CrNcLKTmgBLRG/X8sELEmlHkvG
 YBYSxW66rBKDCA+N4EgGB850Jg==
X-Google-Smtp-Source: ABdhPJxx6sG7dra6NCCtL26WdGX0WCmMtUJHQnCyrMj/OFxjA/iW+opYNKti5P1y9A5inKrckUcvvA==
X-Received: by 2002:a05:620a:545:: with SMTP id
 o5mr9093806qko.172.1599240609392; 
 Fri, 04 Sep 2020 10:30:09 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id i66sm5103330qkc.63.2020.09.04.10.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 10:30:08 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 2/3] drm/msm/dsi: add DSI config for sm8150 and sm8250
Date: Fri,  4 Sep 2020 13:28:37 -0400
Message-Id: <20200904172859.25633-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200904172859.25633-1-jonathan@marek.ca>
References: <20200904172859.25633-1-jonathan@marek.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 05 Sep 2020 00:35:27 +0000
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
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Konrad Dybcio <konradybcio@gmail.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Harigovindan P <harigovi@codeaurora.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This allows DSI driver to work with sm8150 and sm8250. The sdm845 config
is re-used as the config is the same.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
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

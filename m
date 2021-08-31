Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3630A3FC6A3
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 13:51:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA9D896E7;
	Tue, 31 Aug 2021 11:51:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042EC8977A;
 Tue, 31 Aug 2021 11:51:38 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 j4-20020a17090a734400b0018f6dd1ec97so2191247pjs.3; 
 Tue, 31 Aug 2021 04:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RX2rigJ/4yVGAmIjeTnRBQKJ9haoWNb/JQuSYn5hcTw=;
 b=oK5tdGSOQTMsLfb4/ETbVqXw4L2ZZPy7lgqdzuKE5vGRQ9NRXt3hyP4pkf+9CWn1I9
 JuuRZsjmLhas77RfTcWUeWg0TZBjR6pcEs0Jvu2IHxVmD3ZW/7TNY4HTfnSLoHC0WyfU
 Io6jF6RjVQ2U77QU7U000QluIYRTee+UuOWvI2Tfod4dkOU3vHk+4tXpGX/4TmlmX420
 2t3vi+xtP94r268cWL1AzAwpIz4xv5FNijaoCHf9CrRI63svgHwH3gVKAeBJ7QFq4kRb
 wEzPfOrSoCD6LRpPK5QZpiMWCEzYg27he/KSY2SJs4+Gs+TRPCR9ExT/pBpYsFjfeOq6
 SsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RX2rigJ/4yVGAmIjeTnRBQKJ9haoWNb/JQuSYn5hcTw=;
 b=ZSurMLhj64nkBt1WXaPf3RvYYGQ/y3gsFj9a9LIUBt1k7NOKhqra6Y/kyiZTRiZ9ya
 Eok6X14AGXED1/yndcSSMMRL4d2EE3f+SWH0DmL25koIqdjc/cgswThTmKema7ava539
 HxH1XUpRXg1PeOfFsLyEDr1/5WRDU4G+mCWb5CgNrEjGLAPEI32Tcm3j6IB8TcdI3o9b
 GMv46XBpACaTrDisCGWdz8jV6A+TfW30uZ54sVVij90Z0nI8itdvwyYBrCboYoZRU1+s
 Y3/aaWaDNTLWzGVZcz4lBw31fVvXgDj9K4yiqQJVIz2Z7DQSGJu+PrmaMAifZ+n92mAi
 46mg==
X-Gm-Message-State: AOAM531zVBzNdqUmzMjh20sp0LKV9erPXondDZz0oLR5hC11llfDACK0
 amIoG632WoxdNbImM8J0nc0=
X-Google-Smtp-Source: ABdhPJzXWq2tYhWG1U3hwSgB2KoPkJW4AwHFV1/8WNeGxVPjtCWZWir2TS/a1El7ezWCydmwoCMq9w==
X-Received: by 2002:a17:902:a70e:b0:12d:9eff:23be with SMTP id
 w14-20020a170902a70e00b0012d9eff23bemr4351271plq.34.1630410697578; 
 Tue, 31 Aug 2021 04:51:37 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id r8sm20399460pgp.30.2021.08.31.04.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 04:51:37 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: robdclark@gmail.com
Cc: sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch, lyude@redhat.com,
 airlied@redhat.com, laurent.pinchart@ideasonboard.com,
 chi.minghao@zte.com.cn, treding@nvidia.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] drm/msm: remove unneeded variable
Date: Tue, 31 Aug 2021 04:51:27 -0700
Message-Id: <20210831115127.18236-1-chi.minghao@zte.com.cn>
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

From: Chi Minghao <chi.minghao@zte.com.cn>

Fix the following coccicheck REVIEW:
./drivers/gpu/drm/msm/edp/edp_ctrl.c:1245:5-8 Unneeded variable

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Chi Minghao <chi.minghao@zte.com.cn>
---
 drivers/gpu/drm/msm/edp/edp_ctrl.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/edp/edp_ctrl.c b/drivers/gpu/drm/msm/edp/edp_ctrl.c
index 4fb397ee7c84..3610e26e62fa 100644
--- a/drivers/gpu/drm/msm/edp/edp_ctrl.c
+++ b/drivers/gpu/drm/msm/edp/edp_ctrl.c
@@ -1242,8 +1242,6 @@ bool msm_edp_ctrl_panel_connected(struct edp_ctrl *ctrl)
 int msm_edp_ctrl_get_panel_info(struct edp_ctrl *ctrl,
 		struct drm_connector *connector, struct edid **edid)
 {
-	int ret = 0;
-
 	mutex_lock(&ctrl->dev_mutex);
 
 	if (ctrl->edid) {
@@ -1278,7 +1276,7 @@ int msm_edp_ctrl_get_panel_info(struct edp_ctrl *ctrl,
 	}
 unlock_ret:
 	mutex_unlock(&ctrl->dev_mutex);
-	return ret;
+	return 0;
 }
 
 int msm_edp_ctrl_timing_cfg(struct edp_ctrl *ctrl,
-- 
2.25.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3770A138806
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2020 20:54:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 316936E03F;
	Sun, 12 Jan 2020 19:54:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE85B89F07;
 Sun, 12 Jan 2020 19:54:19 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id 195so3806933pfw.11;
 Sun, 12 Jan 2020 11:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WSVqYNJUUS8Cz3ud3WlLWDQz1ieCxDDqWx8hZG4FPuM=;
 b=hlMWNnStz5gAnwaf/V6EMtEo7MjCQteKxKAJZfSQAPcf5p9JvFf3n1xjwJfXsd48yT
 pkLov7ZLYKS36FOc85Qrcls0iFvaiGGwbcHkf1grhXekPo+u/fECXDBKz0K+bp63Cped
 lAGjn6YJngWi9wcOptKyu9iVc/l2nT18dGrLeh7OzKeRBiu11mOUtift32WdzRKdeDlN
 kS5vbVPkCgUmkd94FqvSRayv2xMv8bB9V50hCgnaxOQn7M4BpIYmQxLe90YDGDhjD4IW
 xN/xOANiP9JFhsbin98ornwbxLDhljnfSQBORBYajis2LNUIXK1o2MyMQZ2Cu/MPV9GG
 DQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WSVqYNJUUS8Cz3ud3WlLWDQz1ieCxDDqWx8hZG4FPuM=;
 b=lIYqWco1++fbRVHAFTkYXThex9KrUK9RzBiO5KCw96TTVQ+0Nu9dXDzSJhtcqlRfsL
 NUy6jccPI+seZkkUB+8IBcBBe/bSQkH8Za2duqsi1qrcgKKEo9JjGBSFktuOZvqnz2/3
 64gxHOMKIPko061rbT4WubIfKEDyjQEikBl//bq/babPtZlSbF0n27UtE+mXFFW+Sqt4
 f7y1MN92iR0qeUA3k8gS5Nx9DLRJbigucr5ZgaB+Ymce8uCFzTroq+Lj3cwN2ibvPou6
 VhP8jFGFjOv1xEgOWD1tTsnbVND4Q9V3uqS26K94BgDMufZJLMCQy0cu+8PsUrRKf4St
 olBg==
X-Gm-Message-State: APjAAAU1VbkGjneQn7+mUhrQZ7hQo0UrlHAHfKK49kBYI1bixNNA2QHA
 PYkikFBG7lIzfC2lGM6Om0pBKcrBxyc=
X-Google-Smtp-Source: APXvYqxqydVI8GozbDEUMd8efHH3OugcN/BFlYVdHRgY1xAKs9qkPMBBK5A8WNsg2suQai/ZbDr/8Q==
X-Received: by 2002:a63:9d85:: with SMTP id
 i127mr16526507pgd.186.1578858858941; 
 Sun, 12 Jan 2020 11:54:18 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 o134sm11416105pfg.137.2020.01.12.11.54.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jan 2020 11:54:18 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/4] drm/msm: allow zapfw to not be specified in gpulist
Date: Sun, 12 Jan 2020 11:53:58 -0800
Message-Id: <20200112195405.1132288-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200112195405.1132288-1-robdclark@gmail.com>
References: <20200112195405.1132288-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

For newer devices we want to require the path to come from the
firmware-name property in the zap-shader dt node.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 456bb5af1717..c146c3b8f52b 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -79,9 +79,21 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 		ret = request_firmware_direct(&fw, fwname, gpu->dev->dev);
 		if (ret)
 			fw = ERR_PTR(ret);
-	} else {
+	} else if (fwname) {
 		/* Request the MDT file from the default location: */
 		fw = adreno_request_fw(to_adreno_gpu(gpu), fwname);
+	} else {
+		/*
+		 * For new targets, we require the firmware-name property,
+		 * if a zap-shader is required, rather than falling back
+		 * to a firmware name specified in gpulist.
+		 *
+		 * Because the firmware is signed with a (potentially)
+		 * device specific key, having the name come from gpulist
+		 * was a bad idea, and is only provided for backwards
+		 * compatibility for older targets.
+		 */
+		return -ENODEV;
 	}
 
 	if (IS_ERR(fw)) {
@@ -170,14 +182,6 @@ int adreno_zap_shader_load(struct msm_gpu *gpu, u32 pasid)
 		return -EPROBE_DEFER;
 	}
 
-	/* Each GPU has a target specific zap shader firmware name to use */
-	if (!adreno_gpu->info->zapfw) {
-		zap_available = false;
-		DRM_DEV_ERROR(&pdev->dev,
-			"Zap shader firmware file not specified for this target\n");
-		return -ENODEV;
-	}
-
 	return zap_shader_load_mdt(gpu, adreno_gpu->info->zapfw, pasid);
 }
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

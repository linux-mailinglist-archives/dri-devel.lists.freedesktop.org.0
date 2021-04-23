Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9776F369AA4
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 21:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F2A86EC31;
	Fri, 23 Apr 2021 19:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DEEA6EC30
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 19:07:33 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id s4so9364825qtw.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 12:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n0KplKB6ILQwW/bgPpQ2738PMI2LhpDDm2bWSz1MytY=;
 b=p9tM9Ml/bb+DAfrlK7YmRL+mRcxyVGxfnBT/LiM/+FT9VhfncEr5/a8mJcp/gHk1OH
 F30BpiXsNmC5qo8mwMC2DcRXKBVyYlxA3oareOGufhx3d4CMqIZ7r+yXVNxoKPoSfE0O
 njo4Pfmxc3f2tMuoLqOZEW7QkVaypawq3sg/9fmmszxzcMvAkmC9uwodEt5UFVQT4p4F
 srfzvkKs7vHWV+qxY6jZ9x1y/A+PwYWBif/Lsm29DevYfqVOd2yRrF0TNl65+VTIqYpX
 xgmN8gK4/vTR6fFoTAgzcOjmrdbtV1MAU+s1K8lCysNgGoe7opJtxE7sQM1Dx4VebYY1
 rUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n0KplKB6ILQwW/bgPpQ2738PMI2LhpDDm2bWSz1MytY=;
 b=NpeZbJOAxoQ8mHXO+O7HJPoECaYhlNRR1lwj/jW50VRG2GhOd5axI70psYoeaq3XaJ
 tycIkPEW3XiZNSfMY+8V7cwiVC5pZJbQyWa5bC7NYlmEcCM2KcbOhdvvW4SiAg7B/6ak
 qYz/WqWxAetkpB3DYzlS4z0YlWwyKMvxJZ88eu01IlGQQ8prhURtHy/Z2x8I83QIZK64
 bndqivmW59EhiAGkdYZEDPhK9hES7ybIhFQTn/pHUN3VwokJeM+LfZfClA3e4AeEJ/jL
 JI2/+JuLuCGmG3ffOlxxYF+oDAR0qBBaj3r5mZ11PMtFNoyOOG0ZEUYluN1YtE4KZaZb
 aVwA==
X-Gm-Message-State: AOAM531fAu0di4IzLVob/ZjXUjnCt30704w+SZP8J8pX+7dJZXUNQjsU
 UGfSbDkvFASQTksyDvRwgcNn7ylxkeb+VmXzVuk=
X-Google-Smtp-Source: ABdhPJy5sUSoIk7bk/07y8I+N/+VOsacXAk9XOEaeraz2zOzi+bCBuue96VHvdQn8xMwE7kLPrSNUQ==
X-Received: by 2002:ac8:6654:: with SMTP id j20mr5106910qtp.328.1619204852376; 
 Fri, 23 Apr 2021 12:07:32 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id t184sm4898250qkd.77.2021.04.23.12.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 12:07:31 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm: fix minor version to indicate MSM_PARAM_SUSPENDS
 support
Date: Fri, 23 Apr 2021 15:04:20 -0400
Message-Id: <20210423190420.25217-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Increase the minor version to indicate that MSM_PARAM_SUSPENDS is supported.

Fixes: 3ab1c5cc3939 ("drm/msm: Add param for userspace to query suspend count")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/msm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 7bb34ae95037..a63e969e5efb 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -42,7 +42,7 @@
  * - 1.7.0 - Add MSM_PARAM_SUSPENDS to access suspend count
  */
 #define MSM_VERSION_MAJOR	1
-#define MSM_VERSION_MINOR	6
+#define MSM_VERSION_MINOR	7
 #define MSM_VERSION_PATCHLEVEL	0
 
 static const struct drm_mode_config_funcs mode_config_funcs = {
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

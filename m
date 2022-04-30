Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA75E515FC7
	for <lists+dri-devel@lfdr.de>; Sat, 30 Apr 2022 20:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE0210EA00;
	Sat, 30 Apr 2022 18:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 896B310EA03
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Apr 2022 18:09:20 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id bu29so19181688lfb.0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Apr 2022 11:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wrK1K9n3ixaqlPIKj7chJw5kcok94xlounLLosoFz/U=;
 b=BvpO04TPgDmJx6pkxWI3UlhkhdLFsL9WBcBRyADD0GuV9sCDLEnTy0W/cFK2zC/nxe
 Y8jTWhZRXimMY+tgCHyRQ/p8goLwo1rnevJU0Ef40MSQl+Ohxg1uyE73ZmRJbB9shuWM
 GDqUEtzPhb5u6BM34uNQJOotHLNfH2Oo0k/7U+jHUarO7elXZcdv1VnRY7h6/dKB01e6
 4wC6vO5rw46TJPKnyBdRfzEOQSL5lH7mM9+4xVrB/96YMUZ735+jNHezMq5zUvcXtdXX
 lmpSXUQ+hRZNSx7y4CGDpeNKJRjlNe4kXYcZZTKjgoGiNxYo9dcbvTtcFBSmaM8xydLF
 L92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wrK1K9n3ixaqlPIKj7chJw5kcok94xlounLLosoFz/U=;
 b=2SjAyARe63WKo8kdsS4/5yaN+r5CsnniW6ACGBRP79MjPr5IzS8elNadLSSSqkiI+h
 qHBMo38ZnKA9D8yhyJKQsDI4ja9zsOk4L3RqXINnANu7nPJ81zOEAh8Trzyc3pTxWmiN
 NBooqHBo0A+sjRPJz6NiSekI7IDTSSgYA39g/TTcoAvEBqqRZBOSoxYIFjSRflSRUCXP
 aeeFBx/ZIAf/c5KUV/26uKwk3ZaoH3sZL9q7xl+Ctrwkjxga0DyRKTx9Zh3O6yTs5bwI
 Cw/lDZXVzCLPiEsRa2C4KA1oC3EbV1kLHZOQJ6k7O5Xawi2Fz6uGwmulztqMmWY4sqes
 XiRQ==
X-Gm-Message-State: AOAM532mJ6meVwMCkCjxSjFMyU618QlVlTUCWrDDROaOKzM3IT+V44E2
 1zUEletzE3HAzByQqmjdxQLc8A==
X-Google-Smtp-Source: ABdhPJw2eY91hUFi+7oNkK/2T2qyHWtGTfkq3iDxqQaCY9SfqxMm2XuvX/PN6px1rFay88oJuHUAZA==
X-Received: by 2002:ac2:424e:0:b0:46b:9249:8ce3 with SMTP id
 m14-20020ac2424e000000b0046b92498ce3mr3639302lfl.282.1651342158880; 
 Sat, 30 Apr 2022 11:09:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 k12-20020a2e888c000000b0024f3d1daed5sm598428lji.93.2022.04.30.11.09.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 11:09:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2] drm/msm: add missing include to msm_drv.c
Date: Sat, 30 Apr 2022 21:09:17 +0300
Message-Id: <20220430180917.3819294-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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
Cc: kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add explicit include of drm_bridge.h to the msm_drv.c to fix the
following warning:

drivers/gpu/drm/msm/msm_drv.c:236:17: error: implicit declaration of function 'drm_bridge_remove'; did you mean 'drm_bridge_detach'? [-Werror=implicit-function-declaration]

Fixes: d28ea556267c ("drm/msm: properly add and remove internal bridges")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes since v1:
- Fixed file name in the commit message.
---
 drivers/gpu/drm/msm/msm_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 4f3dce334553..4a3dda23e3e0 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -11,6 +11,7 @@
 #include <linux/uaccess.h>
 #include <uapi/linux/sched/types.h>
 
+#include <drm/drm_bridge.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
-- 
2.35.1


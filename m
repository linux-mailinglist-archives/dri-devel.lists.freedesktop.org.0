Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B87AD2422DA
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 01:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 529E26E85F;
	Tue, 11 Aug 2020 23:36:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D68FF6E85F;
 Tue, 11 Aug 2020 23:36:17 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id t6so215656pjr.0;
 Tue, 11 Aug 2020 16:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qJacNYTNjzvH1OwtDhhId+31gqWxjTcV/w1QSNegM+s=;
 b=CaYwq5LCxIlp+3gYSayjOxXtKRP6v2EROxO/iEm3y8UwMofSDO5cUtWm+cKJOVBFoM
 2rKFMuaC9rhvn/bSxR6nyOPkWatNI5cpAVIV+Oldh4XzmE0yQzHd1jtiaH9oRfLeOiUn
 GvUGjf+1xeTxs7BAU4shdSlz0LMPkQhtsptdYDhayUc+8qzs15B7BpjPnI2C3NHIEjPf
 67fHHiF5O0JD0tDCP04f7Fs987VRj2UjMrGhDMJEgj6pOmlHuTnh9MnAdLbuw4BLVDbH
 wXPbJ14LJwDPjhrGvLv3LlJNIMegdoDBw9fqvk4AORulucMVy56eDx9TQC0xaWInAUfa
 Y9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qJacNYTNjzvH1OwtDhhId+31gqWxjTcV/w1QSNegM+s=;
 b=F+zbicby4YXvdwRNPojFXxh9PnRg2Xy4g7ODD9zfT4ywjFCeZBEUhZjW3m21UkIpnc
 zeDpFCcRRUFBHAHi+5QBTj4OhBp/iL4clJ3sKn72tvPNO474FdbpzhF71yAbtrhdFcpv
 d8XE6811o2t59tdPVuOlkOtq72FTWbsMQhjqk5pA/JbRVT3sXp07H69rObQeBaan17B4
 MmbQIy4KbtcBRz1YHOZh00RVFbqLjdCVIWO26QrXqolg0SSGKAZMbGrCwwsTK2cU7L54
 97uT5dv1QCWdisrxj1W02S5nC6ekgMFmCB12hBEH+lwfJXQbMVURu3FaRYKUVP2Hqws/
 Tn2Q==
X-Gm-Message-State: AOAM532+cpU5rmqcPrMSXoJvh/gwAlEMTRfSOFrDJecUOA6kijRUuq3H
 r5yyEvoTmpxkaftqOqRxcI0P5Mpey4E=
X-Google-Smtp-Source: ABdhPJwxWi7J5+1MuA33io5kkO68CeF200KVuyXZNGvfWESG3ekCOHUR+qXq4mmgKbNk3jfCFaQofA==
X-Received: by 2002:a17:902:523:: with SMTP id
 32mr2948980plf.176.1597188976937; 
 Tue, 11 Aug 2020 16:36:16 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 j20sm90019pjy.51.2020.08.11.16.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2020 16:36:15 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/a6xx: add module param to enable debugbus snapshot
Date: Tue, 11 Aug 2020 16:36:57 -0700
Message-Id: <20200811233702.580744-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Sean Paul <sean@poorly.run>,
 Brian Masney <masneyb@onstation.org>, Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

For production devices, the debugbus sections will typically be fused
off and empty in the gpu device coredump.  But since this may contain
data like cache contents, don't capture it by default.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 3 ++-
 drivers/gpu/drm/msm/adreno/adreno_device.c  | 4 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h     | 2 ++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 959656ad6987..b12f5b4a1bea 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -938,7 +938,8 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
 		msm_gem_kernel_put(dumper.bo, gpu->aspace, true);
 	}
 
-	a6xx_get_debugbus(gpu, a6xx_state);
+	if (snapshot_debugbus)
+		a6xx_get_debugbus(gpu, a6xx_state);
 
 	return  &a6xx_state->base;
 }
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 4e84f3c76f4f..9eeb46bf2a5d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -14,6 +14,10 @@ bool hang_debug = false;
 MODULE_PARM_DESC(hang_debug, "Dump registers when hang is detected (can be slow!)");
 module_param_named(hang_debug, hang_debug, bool, 0600);
 
+bool snapshot_debugbus = false;
+MODULE_PARM_DESC(snapshot_debugbus, "Include debugbus sections in GPU devcoredump (if not fused off)");
+module_param_named(snapshot_debugbus, snapshot_debugbus, bool, 0600);
+
 static const struct adreno_info gpulist[] = {
 	{
 		.rev   = ADRENO_REV(2, 0, 0, 0),
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 99bb468f5f24..e55abae365b5 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -21,6 +21,8 @@
 #define REG_SKIP ~0
 #define REG_ADRENO_SKIP(_offset) [_offset] = REG_SKIP
 
+extern bool snapshot_debugbus;
+
 /**
  * adreno_regs: List of registers that are used in across all
  * 3D devices. Each device type has different offset value for the same
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

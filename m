Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9BB139C24
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 23:05:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E6E89BA9;
	Mon, 13 Jan 2020 22:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 327A589BA9
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 22:05:08 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id a6so4372922plm.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 14:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zd/53b/YzvxFSSJluHpg2s36yjG1ma0E/zaQrjFe9bI=;
 b=COPCLdzLquZ+pTd+qUGkNUztKc9ghw2B0XavyRbkLgcM3Elx5pxsZzkioDeo5ITOFL
 VGVFmmv/j0NnW8j/7RWd/2S05ILFq+ZdcFS5DzhnkEwCUtnEGMTWz6KQB0UkJDZB3DgO
 nUcESk3UDAcutgobfQAP0KuOYM3n+b0NpLSNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zd/53b/YzvxFSSJluHpg2s36yjG1ma0E/zaQrjFe9bI=;
 b=OyPgafWZJVd1myzeNpl6zhZemazO0xp9mJOcINvulgEEU9B/n7yoXs+CjgNMk5nFb2
 mniD4PG/VgSojbh2FQ3XwB11bb2nGTiv8o3BjlHIOe01wO18fwmtNOCg5uvQYWJ7l6z0
 2U5m7vWZTyymt8rn1ePJzutA5VR10uh7cFhkSLVnnrP94OBCJ61jUrOunNI++w7tiqgH
 7lFBZnyFRTW8re+YGR0pVDR3n3BrWiP9xkWx1oTvhQ/ccTF0dGgFla8rkW/G1FSctyiR
 lAVUWAUEcjewiE1n2Rd7coVw05ka5rUosMSb/THDImPTtlbjT7Ajq7oT3NGGU7EQMDtr
 c40A==
X-Gm-Message-State: APjAAAWm765CmXcOhgvvvV2CQjIq67W6Zz9ccHQim99nQ7AlvUMfna51
 Woxxf3rbqec9fdVEevwOk8wDcA==
X-Google-Smtp-Source: APXvYqwSgta6aJy/jOmbS+805x0Xsc71s56AGXM8UF7sEDgc66R/QG09EQD8z34BuJIgVvxxx8lXQw==
X-Received: by 2002:a17:90a:2351:: with SMTP id
 f75mr24735687pje.133.1578953107752; 
 Mon, 13 Jan 2020 14:05:07 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id v9sm14682621pja.26.2020.01.13.14.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2020 14:05:07 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@chromium.org>
Subject: [PATCH] drm/msm: Fix error about comments within a comment block
Date: Mon, 13 Jan 2020 14:04:46 -0800
Message-Id: <20200113140427.1.I5e35e29bebe575e091177c4f82606c15370b71d7@changeid>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

My compiler yells:
  .../drivers/gpu/drm/msm/adreno/adreno_gpu.c:69:27:
  error: '/*' within block comment [-Werror,-Wcomment]

Let's fix.

Fixes: 6a0dea02c2c4 ("drm/msm: support firmware-name for zap fw (v2)")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index c146c3b8f52b..7fd29829b2fa 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -67,7 +67,7 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 	 *
 	 * If the firmware-name property is found, we bypass the
 	 * adreno_request_fw() mechanism, because we don't need to handle
-	 * the /lib/firmware/qcom/* vs /lib/firmware/* case.
+	 * the /lib/firmware/qcom/... vs /lib/firmware/... case.
 	 *
 	 * If the firmware-name property is not found, for backwards
 	 * compatibility we fall back to the fwname from the gpulist
-- 
2.25.0.rc1.283.g88dfdc4193-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

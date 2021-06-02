Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33814398CE7
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 16:33:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11A9E6ECBC;
	Wed,  2 Jun 2021 14:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB158914A
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 14:33:20 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 3-20020a05600c0243b029019f2f9b2b8aso1820967wmj.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 07:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w5nWdjb90GI2+TAkol2s0H4fVYowwMJxaadOSn6QcUY=;
 b=Mvgy55stlZuNX/pokvA4s4eyoSRztkqXdXTq93eU6mE/xvlBmNc8uYDIiGRMyggvQJ
 WFdXndyYicCkt2+CVRKGFMv3tWSYrppRxEGKlJy2MV5Y0BiRj1STB3e0XzkDdtXq179W
 cyZ4rGihQFnmuKwfP3Owt6u6vT6bLHRizWuyCP87fA0RvwKHEXseeUXI3octRriaPato
 uV9sgPOs+T01YQtYa0u5ZQSjCTRgSgZZ0Gfcf9D68E9d0uYEclaTQFgituOGvBDGyBN+
 EHTlUC9jhGzAbnHuQlgLrzOVgyxJFK7vIy6/YzDPSxPBj41ZXvek9/DTXIqyh22B5NxP
 C7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w5nWdjb90GI2+TAkol2s0H4fVYowwMJxaadOSn6QcUY=;
 b=Sz7xz7Dl19l0WZxMoJhDVG2PA7gSvqN0axHvvB5UwyqsvKZnTqr7WgaX8prIVU5Rtv
 meeOgQB+6mHq9QoOUmX6K52lKZR20U1kskD/St1zSEn4cgsEmmPlHwwj1HI6vG3hFXKx
 +/CX+FOSn1VjIQgRDefWvpH01hOXW71kAXXPgdY9c/iORQ+kqFjO2JjzkGZYpGiWdlAu
 oSqJ4z6mjd7j7jZhzYfCvd6gZfY2otkx2m+n0DJzVcfFWlExJepW8Q/Fz8TZ4si9EuhT
 +da2GNOCAxTCFCbHdWcQTvdIaLkJCJjJxACbkvToB8/MnX11+W4WkWdF2xoB6J0mgL6o
 XdRA==
X-Gm-Message-State: AOAM531SeI6sPdsziMBlEwkvYazxyHM5EVdMDTdkcyv2cvf4adQWr2/x
 eo6XzB7Fx7zv/CIY/qvgDt2Z6g==
X-Google-Smtp-Source: ABdhPJwTGEyQyNzzbXkQyWal5cJWfFdoQqndQ5+cIRX0cKjf8RHVhiiu/dgMTmXmYfZgRMx5PjqE0A==
X-Received: by 2002:a1c:f705:: with SMTP id v5mr5533686wmh.69.1622644399228;
 Wed, 02 Jun 2021 07:33:19 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 07:33:18 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [RESEND 09/26] drm/msm/disp/dpu1/dpu_encoder_phys_cmd: Remove unused
 variable 'cmd_enc'
Date: Wed,  2 Jun 2021 15:32:43 +0100
Message-Id: <20210602143300.2330146-10-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602143300.2330146-1-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c: In function ‘dpu_encoder_phys_cmd_wait_for_commit_done’:
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c:688:31: warning: variable ‘cmd_enc’ set but not used [-Wunused-but-set-variable]

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index b2be39b9144e4..088900841bf8b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -685,10 +685,6 @@ static int dpu_encoder_phys_cmd_wait_for_tx_complete(
 static int dpu_encoder_phys_cmd_wait_for_commit_done(
 		struct dpu_encoder_phys *phys_enc)
 {
-	struct dpu_encoder_phys_cmd *cmd_enc;
-
-	cmd_enc = to_dpu_encoder_phys_cmd(phys_enc);
-
 	/* only required for master controller */
 	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
 		return 0;
-- 
2.31.1


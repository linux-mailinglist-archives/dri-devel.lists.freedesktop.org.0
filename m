Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4749B465935
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 23:27:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF1276E944;
	Wed,  1 Dec 2021 22:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 055FE6E5A1
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 22:26:41 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id m12so12933161ljj.6
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Dec 2021 14:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F6F3WPxfyMvxOGFVFzP69ATi4vGo49QVFI+qg3mn8Wg=;
 b=o7ErKwOInkuJ/TeFfq8CxMf8JeSlpaYibVC+EzB6kuYi1h5PjYv/+Yrrqmv/VC2Phz
 odHWNsKT6hMpfLMc+RUuoabaabA5QlUU/iOgucmBLoZ7KEAPz0TTkHtlFfhJN+dXZsG8
 YHKv4KeSD+tFlotOpoZhRwKoGiLoNPJ/TTekUHIyluUyyLXyXs5msB/Af0QFwp3dUh+g
 sJPKv0+uBpAhLzPUx960lGn3KJEzkjLzGt9UwxcSRyL2ET4gb4MYEiJIsYpGY+6PGI6z
 IAuPsfaIsHQruW0pjAH0x/bOr/TDE1llmDiVNrZRLTR8jfYNuq3GN6Lrt6oN+63jxLge
 plvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F6F3WPxfyMvxOGFVFzP69ATi4vGo49QVFI+qg3mn8Wg=;
 b=wmYK68quBGV3FtBIldSXmVG1+MMSe43wa6ec+7tFkD4Pt0yqBsfEi/TcRyleJfbSEW
 s0QCngcrBiFY0iSDiOg2sHH+1cHQOfSjE6vxzlMxcaepcLLKYU2Vb3FZMWXqWjCG5D05
 Bjis8X+YOGXHJrTnWzK1GP6EbxvfITcD2aXUjnktrtDUmTwunLVqp2T5tYl8FWh+vvYQ
 6ozUKs/N2FUrdzJHhHBO+ADKYOWNvKd5+KF6ZlaXFAznyKJmfK1pRpHkDt2aRyigIi15
 Tim9Qxd84ae1LJMaB6Wy1CI6qLhpGvhKl7VqMnIEqlxlE2shz9RgdzYh+SjU3aR0q5ec
 STVQ==
X-Gm-Message-State: AOAM531qkTCqMkE+Ckki3SizEg+lY/nJ2Jqkass2eTBakM2Zup/z0n5E
 5rhbGWkTvzaUICxpfaI9GlWa3Q==
X-Google-Smtp-Source: ABdhPJzaqWQVe9yEJqQno/GA6ULFW+0oG9KsRBzz6NDmEuN/UoAvkV7RdkxlLyqlf+MDd7EVPTyYKw==
X-Received: by 2002:a2e:b751:: with SMTP id k17mr7950866ljo.467.1638397599403; 
 Wed, 01 Dec 2021 14:26:39 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u7sm117004lfs.144.2021.12.01.14.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 14:26:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v1 4/8] drm/msm/dpu: drop plane's default_scaling debugfs file
Date: Thu,  2 Dec 2021 01:26:29 +0300
Message-Id: <20211201222633.2476780-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211201222633.2476780-1-dmitry.baryshkov@linaro.org>
References: <20211201222633.2476780-1-dmitry.baryshkov@linaro.org>
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Proper support for the 'default_scaling' debugfs file was removed during
DPU driver pre-merge cleanup. Remove leftover file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 6ea4db061c9f..f80ee3ba9a8a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -114,7 +114,6 @@ struct dpu_plane {
 	struct dpu_debugfs_regset32 debugfs_src;
 	struct dpu_debugfs_regset32 debugfs_scaler;
 	struct dpu_debugfs_regset32 debugfs_csc;
-	bool debugfs_default_scale;
 };
 
 static const uint64_t supported_format_modifiers[] = {
@@ -1398,10 +1397,6 @@ static int _dpu_plane_init_debugfs(struct drm_plane *plane)
 		dpu_debugfs_create_regset32("scaler_blk", 0400,
 				pdpu->debugfs_root,
 				&pdpu->debugfs_scaler);
-		debugfs_create_bool("default_scaling",
-				0600,
-				pdpu->debugfs_root,
-				&pdpu->debugfs_default_scale);
 	}
 
 	if (cfg->features & BIT(DPU_SSPP_CSC) ||
-- 
2.33.0


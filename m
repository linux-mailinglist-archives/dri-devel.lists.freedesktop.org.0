Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3ADA01E19
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 04:15:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 483BA10E06D;
	Mon,  6 Jan 2025 03:15:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xMuzq3p5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA2310E06D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 03:15:01 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5d88c355e0dso5887687a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Jan 2025 19:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736133240; x=1736738040; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DHORIO6iI0h0xBdzN/DxPXJ3YyQzxG7ieDWttD2a0a0=;
 b=xMuzq3p5+poFoxQVZhk2iOxHuXotKGfbeFr2jJpjEA2gHZQtddeB6YihPK3BldyiTw
 pV7o6txBb6J6dJv532/Y4wAnSKd+yniTVqy0+fUA81C/k+SbYkHqboPBODOpaYxU1u9q
 Ygyj3xJve0rMVLJnoUhyXtccyOO8Zm+FrUzb5r15uwr417ZVQsIvZUO0yQj7/x2REIV2
 0OtxGVMs4IDLnZTFlqOQ1CI93mjJobv4pBk6/XxcIuxhJ+fXGkE0rWKTbI0WCYrEXdkM
 MUNFkUbThMVqBR0Vzua5I0tEImOLzh1+L6uztmdVDuG5iLzycWkG8wvCuivPzosKoy83
 pgkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736133240; x=1736738040;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DHORIO6iI0h0xBdzN/DxPXJ3YyQzxG7ieDWttD2a0a0=;
 b=m3SGxucvCLZf1V1BhZt7+14saNQQpXu/9tKBJ6L6zuPRjLkvuiKTQtbKH2tilKUTXx
 +wf2gM+TvDy/EiUCO8CaIN0lxrhGiOrupxuQShdTbrsxDWyc39BSX+/pqo7O+lvdc8au
 NOLOXDQ91JDwl6ugzkOifPnqLUMJ+2iOYYeiq+0AEizLtxX2a2iOVJIGs9HMTYRIsB5y
 ev4qXK0F0WW+WFpk1oaDssNvwDAs/MdVWZUVj0ou0eifMi4FMbXDPhRgjG93A1DItOEY
 yXOpLeiIz0808iW2PnvYX/nL89ULSvSd5N3mE+0hwXHmFSebPkldKKKzq/0jDX8nBcq7
 qggA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNrLAZUmN0wsdmW5qfe4phVfuA5XENUtH3EJTNOc1IbynkQxsHnqAv+xN4+v/9Dgic12b7OssBCwU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJUXnwRoMRP6BCesLitzOSua3cNktPn05RjT8JGNBwOB1Ixwod
 zmmAJSLr0HIqQFzNI0IkLWce5UXfoi/VoxI+jo51TVESLl1QceLSTGEsEoZAQrBECx5VRc4pTFS
 NyYI=
X-Gm-Gg: ASbGncuRhmU8RA09M6H6CwgVd9yLsf0k9Vc6Z0iqnpUb2fmvIL83+qJam8Xkxy4iYWF
 yRMVb6ph4O8uf8uJECEAHfZIOkUebZoHLygEos0DguLQpuOmDROx9FsPEV8D46gahGlFVFcqEL9
 NTgGw8SZvD1YZ3o9DyxfLJn7TR50Z8GJBVOznD1PxoKZ44Pc0HhkDl08KhH9fkJvhuTy7x6Ffqh
 AdKgzSxNR9rfNqkyvv6lA92w8T0/7yv+RWylQukHPDUdfO53Zg55fnCv991v3VC
X-Google-Smtp-Source: AGHT+IFeKnvUXg4rQjtvUDrdsCyS0VoSHNamlaIcrDr+nFLxLcf5MDcnBUzENvp+YCaaH3LgEiIlEw==
X-Received: by 2002:a05:6512:628b:b0:542:6f59:f85f with SMTP id
 2adb3069b0e04-5426f59f97fmr1444030e87.2.1736132867639; 
 Sun, 05 Jan 2025 19:07:47 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238301efsm4869016e87.247.2025.01.05.19.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2025 19:07:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 06 Jan 2025 05:07:37 +0200
Subject: [PATCH v4 3/9] drm/msm/dpu: change ib values to u32
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-dpu-perf-rework-v4-3-00b248349476@linaro.org>
References: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
In-Reply-To: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Stephen Boyd <swboyd@chromium.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2991;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=TTyO9vUJiSzSKuNCLaOk8E6Md2+vo7CigvDNmDQ5dQs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBne0j5aWLiZNIYu1U6N2nvPJazCBEqQO/PYqrD8
 mJvRYv6UeCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ3tI+QAKCRCLPIo+Aiko
 1X2tB/wJxl1N7EusjgzyUZ5t1JmlEMWYpjphupru0vUy0hFSvAm8SwwDZLpZbuPhNYfNXntq7KB
 7b8ZQVe0fb7LyBe1UWe6Pe/cVo+DpO1KuH1nxoyLbqE7/Oqtl2WBbMWatJWqPrwBmSALQuQT83z
 PZW5EmZH+lsaoISEQAUshn4cpwXUnBQ7qgmi+P8uP4nf7Ou5NeQJ1idIhXP8xDv7vFPcEcZODST
 sCXZQQ/p0xBchFuH2gCIBFKvDO0ps3xuUpto+tcxDD9xQM0nLkxPVumf9shNCH27Bcw1wrxGZ5w
 P/hCtu0fw1jBVgEGEPF2qJSJTBbORgC+r9K56k/UIeVbTOX/
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The IB values in core_perf calculations (max_per_pipe_ib,
fix_core_ib_vote) are expressed in KBps and are passed to icc_set_bw
without additional division. Change type of those values to u32.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index f0d490afb53be2f4bc706af91da05bb893a5fe34..7263ab63a692554cd51a7fd91bd6250330179240 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -135,7 +135,7 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
 	}
 
 	DRM_DEBUG_ATOMIC(
-		"crtc=%d clk_rate=%llu core_ib=%llu core_ab=%llu\n",
+		"crtc=%d clk_rate=%llu core_ib=%u core_ab=%llu\n",
 			crtc->base.id, perf->core_clk_rate,
 			perf->max_per_pipe_ib, perf->bw_ctl);
 }
@@ -477,7 +477,7 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
 			(u32 *)perf, &dpu_core_perf_mode_fops);
 	debugfs_create_u64("fix_core_clk_rate", 0600, entry,
 			&perf->fix_core_clk_rate);
-	debugfs_create_u64("fix_core_ib_vote", 0600, entry,
+	debugfs_create_u32("fix_core_ib_vote", 0600, entry,
 			&perf->fix_core_ib_vote);
 	debugfs_create_u64("fix_core_ab_vote", 0600, entry,
 			&perf->fix_core_ab_vote);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index 451bf8021114d9d4a2dfdbb81ed4150fc559c681..ca4595b4ec217697849af02446b23ed0857a0295 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -19,7 +19,7 @@
  * @core_clk_rate: core clock rate request
  */
 struct dpu_core_perf_params {
-	u64 max_per_pipe_ib;
+	u32 max_per_pipe_ib;
 	u64 bw_ctl;
 	u64 core_clk_rate;
 };
@@ -50,7 +50,7 @@ struct dpu_core_perf {
 	struct dpu_core_perf_tune perf_tune;
 	u32 enable_bw_release;
 	u64 fix_core_clk_rate;
-	u64 fix_core_ib_vote;
+	u32 fix_core_ib_vote;
 	u64 fix_core_ab_vote;
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 7191b1a6d41b3a96f956d199398f12b2923e8c82..8a523eb308630943871c2e075d3d0d9094606d05 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1487,7 +1487,7 @@ static int dpu_crtc_debugfs_state_show(struct seq_file *s, void *v)
 	seq_printf(s, "core_clk_rate: %llu\n",
 			dpu_crtc->cur_perf.core_clk_rate);
 	seq_printf(s, "bw_ctl: %llu\n", dpu_crtc->cur_perf.bw_ctl);
-	seq_printf(s, "max_per_pipe_ib: %llu\n",
+	seq_printf(s, "max_per_pipe_ib: %u\n",
 				dpu_crtc->cur_perf.max_per_pipe_ib);
 
 	return 0;

-- 
2.39.5


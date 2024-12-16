Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4821D9F2BCE
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 09:27:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A891310E52F;
	Mon, 16 Dec 2024 08:27:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pX0BPpUt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D00510E52E
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 08:27:42 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-30229d5b229so37409681fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 00:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734337661; x=1734942461; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LNvaBXD6rf3EQuRmCg70rZ7MEJhSs632gKbKOrH7Zm8=;
 b=pX0BPpUtdiWzkTrB3SFT9WmELieSuWRDT0KILiKvmcd/ya1klK2XbdlSvZinyWORn7
 TVmBeK+1sGkg2Y9z0tfi2S0re099o9lEZDb5bkM+Wizzo0XFseG3XPQwupQ8H9BRnBPR
 S5rdGgP9Am7KlCRJMUkkDbQUonsPEGqRgTOmmUnSXfjuYLNirmF3aU5aCH2bGm6rGOx8
 pBJY2IZ+RXUN6/Id9F8tOIuJgOKRMDPtDDq96pvcRo5EYbTtleZQfT0fWlWaI7Tm7nC/
 5BzD8ebdZXCoNTWI0uEpNZ8+N6EJ+q/q1VfGLO/6lXxdSmIxdGhQL3bMybpOlAilmPHB
 gREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734337661; x=1734942461;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LNvaBXD6rf3EQuRmCg70rZ7MEJhSs632gKbKOrH7Zm8=;
 b=KtwjxF66Wj20rAkxVO5Mya+sg+sonsAMIiOC9UanJLQyNPlElDQC1OUMfPZAYXfIpo
 M/HAobxPxMi6LHv/vcZ79Y2mjvXWBrp7WgxEthsD25XDk1scHvgF6yo6mppX6sgHosAN
 Y4p1bYhTdK16U7NbApcZtCfrqlA7ij+kGDEVwZZ9n9eGHRAr7ffPHNAHjqVDfNE5qrKu
 ZKCzqu2PRXdsKczTr5coPlwy4enFZtkD/Q+QNH90eaE/U89DqVZj8VGIT38/N82IwGHg
 pYEayuABCZ+gIyNvZMG63JaIxuKd1/YZokg67fnbnv3CxUOoaNji1Xbve76AcM6yXcuA
 zDFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWBIj/xc+8k59+qjWOBKMTBu0cFFSilaLxH2zxMoeF+u46k6mb7LKdv/oi0J1DIXCI4JpAqyz/Rr8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjdDm6mlMZV+dIguV9W2kw2JFmc7MdDTgBfjU92G69wZgHwV8N
 pGcbpyL4E7Q580Pl42KbcC6OUfDYuw3RdNGCZTnQajzPLxCyES0TnmZLF8Gxkc8KB+BrUKXlb8B
 Q
X-Gm-Gg: ASbGncsJAC9PZJVH45uJH/LVvfZCo6r000/JduT101o2J6cu4fN0g0Iz4Ky7lCCxWLx
 dBzR5GVP4UQyVil74J8hcwPsnljTslwUcdAf4NPv4sQj7GdpgcvRqkTJ2G4yBmPNrGhfnQyGAO9
 SPgV/UwNF953TyPNivn5GdFEhrOQZsI9LlURqBiT58NRJxzv8JY/yt/c7lQDNHlhN0Nsy570zN+
 XGYgd8iUPhclWYiG6RtSRech8FSEitKI4ShH8BRYbJbJT0AO7EMkr4GmR+w5jb8
X-Google-Smtp-Source: AGHT+IFPKDhcXSU0UCTh/igp+MQWxIINBR6P0+8IXDlL++c5r9BUnSmEl0bO6pvB1WZJK4q3wU3VCQ==
X-Received: by 2002:a2e:9d8f:0:b0:302:264e:29dd with SMTP id
 38308e7fff4ca-302544d37bamr35796821fa.24.1734337660711; 
 Mon, 16 Dec 2024 00:27:40 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30344045342sm8543371fa.33.2024.12.16.00.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 00:27:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Dec 2024 10:27:27 +0200
Subject: [PATCH 6/8] drm/msm/dpu: link DSPP_2/_3 blocks on SM8650
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-dpu-fix-catalog-v1-6-15bf0807dba1@linaro.org>
References: <20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org>
In-Reply-To: <20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Robert Foss <rfoss@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Richard Acayan <mailingradian@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=3vj4siDBQO7f315YdNktE17SvgKgBr413yqy0N6ohvc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnX+RsvFTxBZ9VJCMmml3J0WOzPS0ojzqlE8FEK
 RhPWnm5aU2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1/kbAAKCRCLPIo+Aiko
 1QSpB/0RNWf+SOymu2pMymtdPsFsrkyWTVAOo8hqG3wKYgwYnA+cLkN1U3hjojOStIB0O5rx1Ub
 AA6ze5HSaUFrTXAqcbWPuo2MoyojkWNGiTi/E5RTl9aht/VafStHh3jWX2+FqW66sCl9cB6ZJy6
 XoroA0Iw6HouEimgf9nUHuN585Y9Yz4lfv/4ahiOdTXkIvhu2hQsFVu6D/HLu6h7X7RdbNro/wx
 g/sXvGBKaCoTITVZCQw/QPgldCKJbUKocpTNVwgHovUmo7e1vddHIGMqk8HPmvJ35cmEMs7gMA+
 fPoL5pkcF8tX1j+aT7DohRZCLMNyHKiJj0lbiQRxRH/B5pqB
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

Link DSPP_2 to the LM_2 and DSPP_3 to the LM_3 mixer blocks.

Fixes: b94747f7d8c7 ("drm/msm/dpu: add support for SM8650 DPU")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index eb5dfff2ec4f48d793f9d83aafed592d0947f04b..e187e7b1cef1677261a5de7b01ea3fa8136723ac 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -160,6 +160,7 @@ static const struct dpu_lm_cfg sm8650_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
+		.dspp = DSPP_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x400,
@@ -167,6 +168,7 @@ static const struct dpu_lm_cfg sm8650_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
+		.dspp = DSPP_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x400,

-- 
2.39.5


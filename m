Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8344B2C042D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 12:20:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CDE189FDD;
	Mon, 23 Nov 2020 11:20:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B5D89D77
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 11:19:49 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id p22so17511979wmg.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 03:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gKoITWdb0NAA2TK8pxTD/cxHUBVgW9vDIRLy1VQg+s8=;
 b=CCyxnCMqaD6iY/pHwlqr9sW8pQD8avE8KqZDp/baOaadch63BqfnmFUxC2u2xSnwXi
 JdKYp2wkcbJrzPIfpMoT6gtkHiai7DA2fnb3Ws2X24klPs4fyBX4jEyX8ZxxPfqHxDG+
 Vr1ZKgJ15buJstTI+jCKRRnmDMwLjmqcWMNXvRDm4BreDc2ty++tMdtvs82ZJINBUEyi
 /v+3eNY7PEWmWw5QzyOxBTpZ++zFTFv8a4GFEiy9xHCHE5PwKDw74pGHOziGcFNx47bV
 7AjL24ldFFtcp5lNCyqo/6Y0Rf44GruO/z3TIyADZ2Tn8lmp7g9LNdt96ZB5rZUly6Ld
 Im/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gKoITWdb0NAA2TK8pxTD/cxHUBVgW9vDIRLy1VQg+s8=;
 b=Gi7F4K61BpxB43FglnaI73eNydXaVzbF5UswR79oufMcxsZYRgRGOWHu3JOMoxYFn7
 F6Beh2SisoFPrcHsSpljNVT//3pmhVdTOTv3HN6DeQzhk0bSrt7EATegKFWO9FXtV14W
 PNfVi25rEi6pixppsbNhI+wLjS/QogzRYyVMP85thlAWyB23YPe7x2SDfnc+26xGmT28
 7r6ThTV91AaKmN9JePo9SOYtoM1JwFpzfTuRFbPPLqIq0xZiDuuwzvN2Q8mS9D36d+am
 v1gKowHTutMGZnoYh5AWYVb8G7Yft5zwfJhy28wKoDdYZ8SamTnMi4O6VdabRDQkJ8lC
 mkRQ==
X-Gm-Message-State: AOAM532asY6vJKAtMZdCEMFk2zD1hJN5KFRWrEU3+109JwzrDqG11hhZ
 t8qz2so0wdl9ndGUoQfcnb2RLFmc+22uHbdG
X-Google-Smtp-Source: ABdhPJwFR9JH8+waSGmVuFK54gn5FZd4IubjIUGmE3hzei8uwpKEfY8VjOTl1bSxhPdXOJ9MukO0MQ==
X-Received: by 2002:a1c:1bcb:: with SMTP id
 b194mr23539889wmb.139.1606130388099; 
 Mon, 23 Nov 2020 03:19:48 -0800 (PST)
Received: from dell.default ([91.110.221.218])
 by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:19:47 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 20/40] drm/msm/disp/dpu1/dpu_hw_sspp: Fix kernel-doc
 formatting abuse
Date: Mon, 23 Nov 2020 11:18:59 +0000
Message-Id: <20201123111919.233376-21-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123111919.233376-1-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:240: warning: Function parameter or member 'ctx' not described in 'dpu_hw_sspp_setup_format'
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:240: warning: Function parameter or member 'fmt' not described in 'dpu_hw_sspp_setup_format'
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:240: warning: Function parameter or member 'flags' not described in 'dpu_hw_sspp_setup_format'
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:240: warning: Function parameter or member 'rect_mode' not described in 'dpu_hw_sspp_setup_format'
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:446: warning: Function parameter or member 'ctx' not described in 'dpu_hw_sspp_setup_rects'
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:446: warning: Function parameter or member 'cfg' not described in 'dpu_hw_sspp_setup_rects'
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:446: warning: Function parameter or member 'rect_index' not described in 'dpu_hw_sspp_setup_rects'

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index c940b69435e16..2c2ca5335aa8c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -231,7 +231,7 @@ static void _sspp_setup_csc10_opmode(struct dpu_hw_pipe *ctx,
 	DPU_REG_WRITE(&ctx->hw, SSPP_VIG_CSC_10_OP_MODE + idx, opmode);
 }
 
-/**
+/*
  * Setup source pixel format, flip,
  */
 static void dpu_hw_sspp_setup_format(struct dpu_hw_pipe *ctx,
@@ -437,7 +437,7 @@ static u32 _dpu_hw_sspp_get_scaler3_ver(struct dpu_hw_pipe *ctx)
 	return dpu_hw_get_scaler3_ver(&ctx->hw, idx);
 }
 
-/**
+/*
  * dpu_hw_sspp_setup_rects()
  */
 static void dpu_hw_sspp_setup_rects(struct dpu_hw_pipe *ctx,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

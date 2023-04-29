Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F2B6F2693
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 23:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA15410E1D5;
	Sat, 29 Apr 2023 21:23:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7119610E1D4
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Apr 2023 21:23:42 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4efe8991bafso1581504e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Apr 2023 14:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682803420; x=1685395420;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tRKsVvk9tsJuHHhH22B0kCzbXLoRUllEwKzzJXuNCMI=;
 b=byt4wPpMEGAA8Dt7nVqRCKYJXdzYj1cwQtttNycFhFCDKplaRUKDT3rXLjV9tQYp0L
 X5nCzeHwuukjtvGOPZmpTuj4FIF/iUWQrsR1j7t+UfPpMYDU4yRjrmvlQsMvvQ5HEmch
 bf1hR9Dlrh6TAY9HV/oTmxqBbsbPbc7gATf5Gb78u0tqCz0uf5fBAZyjSkToPMQBI11C
 +DZOv9V74DPWgBH3fyhJksmKLiCKIhhZfTPF3bTQ3jF3ufAonf/Uv4iKm5jzS/ZQJhYk
 C4wSj5iPlKV9JXEX708ftTUFKVRO1P/L4Q/TZIocel2XQRvLQgLTZHqRUoQ1SuFDFhWn
 Cyxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682803420; x=1685395420;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tRKsVvk9tsJuHHhH22B0kCzbXLoRUllEwKzzJXuNCMI=;
 b=eRj87lEk9QieZB7gkDQ5dXbRs9oo0TF0hVEFin0i7STxExiOD0/Hmrudwl4cDHr13g
 tPVrmCCP6CQ5MGDc30azBwgjUp7CE6EySWqoRrPf2A16/vc6Ezql5DKGnu17G31Cfccn
 BloeDUc6DQWTsHqO8PZ9/3zvr0aVShwtLPOpdxODgLN+aQfwlbEtkQrV7LpzNqVZJZ7y
 uYJ39LzI2cClmSDxgkYSkhJ6LnPvTnx6G2ApRNLj92FTS+/HGhYkbTut2INKqZ47DSrP
 KWeZJCBLSqRcqbW6SooLr/vAwgp/QJZgs8AvcYn/XFXEWd1u8UYCIIuxICGcoarFw3Mw
 lPiQ==
X-Gm-Message-State: AC+VfDwPFTJcH2vvsCoGvV1+dFoP1BobnZK22T6/I/4zlK8xdwPvFmdo
 ocJp1KlO3C9C6IdDbMWAa9lm+w==
X-Google-Smtp-Source: ACHHUZ7Msh7f4Mgk5NvG0YHBHg+Q9Xxp5OtPnng03DDm4cpMYmguHpquR7dfwtxbixewGj1wG6cr7Q==
X-Received: by 2002:ac2:5982:0:b0:4ed:c6d5:bdc with SMTP id
 w2-20020ac25982000000b004edc6d50bdcmr2331712lfn.24.1682803420216; 
 Sat, 29 Apr 2023 14:23:40 -0700 (PDT)
Received: from eriador.lan (78-27-120-86.bb.dnainternet.fi. [78.27.120.86])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a19760b000000b004efb18c89a4sm3599663lff.21.2023.04.29.14.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Apr 2023 14:23:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2] drm/msm/dpu: drop unused SSPP sub-block information
Date: Sun, 30 Apr 2023 00:23:39 +0300
Message-Id: <20230429212339.2946832-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver  doesn't support hsic/memcolor, pcc and igc SSPP subblocks.
Drop corresponding definitions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
 - Rebased on top of https://patchwork.freedesktop.org/patch/534725/?series=117130&rev=1

---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 69d1f1e59db1..b2831b45ac64 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -380,9 +380,6 @@ struct dpu_caps {
  * @qseed_ver: qseed version
  * @scaler_blk:
  * @csc_blk:
- * @hsic:
- * @memcolor:
- * @pcc_blk:
  * @format_list: Pointer to list of supported formats
  * @num_formats: Number of supported formats
  * @virt_format_list: Pointer to list of supported formats for virtual planes
@@ -399,9 +396,6 @@ struct dpu_sspp_sub_blks {
 	u32 qseed_ver;
 	struct dpu_scaler_blk scaler_blk;
 	struct dpu_pp_blk csc_blk;
-	struct dpu_pp_blk hsic_blk;
-	struct dpu_pp_blk memcolor_blk;
-	struct dpu_pp_blk pcc_blk;
 
 	const u32 *format_list;
 	u32 num_formats;
-- 
2.39.2


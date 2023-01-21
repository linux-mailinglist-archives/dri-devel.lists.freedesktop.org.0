Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5E467669E
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 14:55:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABFAF10E091;
	Sat, 21 Jan 2023 13:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4865F10E091
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 13:55:01 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id t12so944336lji.13
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 05:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Wl7hg1pdo80Ygf+JBADZba88dXLFhEepBsuXC7v4hE0=;
 b=KBk+pIjry+zjgLszQt02PH4rTBD0eEOY0IbKiERpg3FjNuOpKRNn4pZddOPun9xfAi
 423OvgF8MNMK7bfhhfqkYL3n2XOJhRdwWWNtg8JTssWkspITIOuu1RzHE07cu5TVMblG
 f9OuI3RUV556wOQQk2ln+JnF/kMZQseq1V0jgVMLJmrvBPXFqfkwvF9eBge66JeZJnYz
 rmslM+i7Bb6YRHbtZLRXRbm8tX/m9XaaygtoJOGHM1MOUDH/cgENsT2dvKF0Vyet471V
 JAhvgAsi7nG9elnOPKr8Hl0KyZ1C7lnNIKn0/DG5Sqc32IGk01iBcYAtdgLB9bRm+1W4
 UECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wl7hg1pdo80Ygf+JBADZba88dXLFhEepBsuXC7v4hE0=;
 b=14C2iCIKaKd7w6d+6el+uRCiwQTSD8/qmvh+pJNS2xG1wa+fKCLylzD6vp3g9DO7iE
 6suz2llDuSUB+HW2s3u/TLlnacZ1qEuzW6wiLyMvZ2QBtGHgdq3p0dCQ4YxhNSjqdZm5
 icw1c5P0HHgumDVPeEcmk0nMBI+SxFw0tjyXb5/E7/5mZ+nBh8EzmMUIsE4ge1uIRUlX
 0rSCS6CBax6aFsfHBqlQ9GGcJeyBb/piAO6zityerGSJ8bRTg18+LloqY9YYnA6o9bdL
 OV6Up/9emc32da40aAaJqg0oAnHww7HkYRMa7VsqBw73u0kh3xjRBDKeNSRPlEX6RBb6
 +uSA==
X-Gm-Message-State: AFqh2kpxk5hpLK2QISdizZKaFwUyOCrjgIoAk/C/RY3VPlkFZZpX0b3f
 uhnQZ4Zw63FurhRSdM7Tiv4r2A==
X-Google-Smtp-Source: AMrXdXuLYCgRTVJmLXVQ+P1YP4SN1ZnWHdMxNLQzEJgrT9t+B+j6d/Lo4I0WDOTzTzxW6/RWOES0yg==
X-Received: by 2002:a2e:9b81:0:b0:28b:8d89:712d with SMTP id
 z1-20020a2e9b81000000b0028b8d89712dmr5023100lji.13.1674309299442; 
 Sat, 21 Jan 2023 05:54:59 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.65.44])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a2eb5d1000000b0027fd93e9043sm5027283ljn.113.2023.01.21.05.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Jan 2023 05:54:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH] drm/msm/dpu: drop stale comment from struct dpu_mdp_cfg doc
Date: Sat, 21 Jan 2023 15:54:57 +0200
Message-Id: <20230121135457.2788199-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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

The field ubwc_static was removed from struct dpu_mdp_cfg some time ago.
Drop the corresponding kerneldoc now.

Fixes: 544d8b96150d ("drm/msm/dpu: update UBWC config for sm8150 and sm8250")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index d152fef438f9..a56581b34ddf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -539,7 +539,6 @@ struct dpu_clk_ctrl_reg {
  * @base:              register base offset to mdss
  * @features           bit mask identifying sub-blocks/features
  * @highest_bank_bit:  UBWC parameter
- * @ubwc_static:       ubwc static configuration
  * @ubwc_swizzle:      ubwc default swizzle setting
  * @clk_ctrls          clock control register definition
  */
-- 
2.39.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E42106F2200
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 03:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C8B710EE31;
	Sat, 29 Apr 2023 01:23:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA65C10EE31
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Apr 2023 01:23:56 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-2f9b9aa9d75so223320f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 18:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682731434; x=1685323434;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=htj/8vCj4I57SLW2faNCG4a/nF8sQzzLcq7GSZbM288=;
 b=Pxo53+demnDQ6RpXQYMMyGE3bI1+MCzP2V7rPxsTzQkvqaz9HkTHQbMEVpQKViAc14
 PYR6R0U0RS5N6BDbAguA3o9MobR8p+IinCEpTegzS1CEXFPSDeR0ZyOWBp5cAvhgB+Et
 y+P5wRc7v1n0MlVaz5v7wzIHZrgTSQPW82UVkLEGVxs2J2kcsi4TnZY3BwahETsZqEDM
 TYT6tpeHELzW4Rh5lmzErkYT7JzA0TVWi9hpl8GkJb2rBxjVN8ctenJVEmBVtP1JlwA+
 U16xm6fuUOKtuHWR1k1oX+suDeMMx2rnOebfuGj7PVjWYD42b9Xwk2WL+4n/0/nrxHVy
 U5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682731434; x=1685323434;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=htj/8vCj4I57SLW2faNCG4a/nF8sQzzLcq7GSZbM288=;
 b=Rb3iAhvPXBIhjY81PZP2dhCsb9JSh+I0EyBFoeEDDZtyGMdSrecj+sx9buJBZUPRrN
 3q96xZxoIBi0v4WT46zjM1m/vwjfLjYK3WrC0Im3w3FWrdHlgufeaVPaiSN8EWgGzSAd
 Xr86HcFLlZvb8ibl8NcS/Bm7Wxl+KYKb6+znzrAIlL+6btlK/6sd1QGTkxa4rLjR+XWq
 YdODQDgrmTovphPm0CbenesT8V9/7LsI+R2r86Tyocmb/NQkx4NcbD5tk4L45ulaV29w
 7Ts1wpiu28S1NXtObBAMEi3pZkf6h8iblWrrxSuaHzfVliT9kDKdrseScn6hHtPjT4C8
 HFOg==
X-Gm-Message-State: AC+VfDwadupvSYPuYNM4nAbdCaIkR9arO8eh5GaCGrl0MhKD2UCLEXbm
 1Nu3hpYqAKohnQju6pOKsOnzEA==
X-Google-Smtp-Source: ACHHUZ4ZWWsBh7oQ8wmPJFzelGX0O+OdC3f2yjnNkKepKP7xmHU96NT194CO4Qr1Gw/oAiBMhgnYtw==
X-Received: by 2002:a05:6000:136f:b0:2f0:e287:1fbc with SMTP id
 q15-20020a056000136f00b002f0e2871fbcmr5647327wrz.11.1682731434688; 
 Fri, 28 Apr 2023 18:23:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([212.140.138.218])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a5d48ca000000b003047dc162f7sm12983554wrs.67.2023.04.28.18.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 18:23:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 0/3] drm/msm/dpu: drop _sspp_subblk_offset()
Date: Sat, 29 Apr 2023 04:23:50 +0300
Message-Id: <20230429012353.2569481-1-dmitry.baryshkov@linaro.org>
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

Rework dpu_hw_sspp.c to access sblk base address directly rather than
getting the sblk address through indirect function call.

Changes since v1:
 - Dropped DPU_SSPP_SRC feature, making SRC-related functions mandatory
   (suggested by Jeykumar)

Dmitry Baryshkov (3):
  drm/msm/dpu: drop SSPP's SRC subblock
  drm/msm/dpu: access QSEED registers directly
  drm/msm/dpu: access CSC/CSC10 registers directly

 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  14 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 198 +++++++-----------
 3 files changed, 76 insertions(+), 150 deletions(-)

-- 
2.39.2


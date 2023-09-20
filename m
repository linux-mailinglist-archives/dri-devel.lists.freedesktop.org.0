Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B77F7A8F91
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 00:46:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F3410E53B;
	Wed, 20 Sep 2023 22:46:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5AC110E545
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 22:46:09 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9ae2cc4d17eso31127766b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 15:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695249968; x=1695854768; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oYdcY0DcGe67NgqwyBu5FTTz8YAdNQwb3MR5ZbpO8t0=;
 b=d3rOOkGjmJYH6RU2ifJCQWpI9dUqT6LEpSerRW1Mm5CXzWAV8WciZsWIf0dJhGGQf0
 vj6d1eVTABd4qpJrEZ9BC0Rr0kpg4LB6dym/Zv6kLHU4e0YfS4ngWC6dDPUiDLMsHCiY
 22IF5mNLtoaUbsXrJNSkghAYv5IMYJlFGViP8thANKU050N5ZnSElfeNNHMb7osARnPl
 GQ8IwPJwJisMXbVn6SkEipNEug8bBSNZJfyenNgdvuQbzTIZSAa1jAngZT2uh4YwraDM
 7RqW7AY+MflXitEUV3J34/UhuzYBKuknZAXwVRTnueIYUgsB912oBA6xKLuyVOJTG3Jz
 uk/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695249968; x=1695854768;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oYdcY0DcGe67NgqwyBu5FTTz8YAdNQwb3MR5ZbpO8t0=;
 b=RTb57N8KHR0LKb1hyyDxdtFeMK5+Ez8itEGYCYyhuvvk2+2i2qVsJMFwreQTIQZFl4
 KG5DZjI7GgDK9YMMK2SvKM3LTvi1IHJuuXicf8zk4izl7JUL3X2XvrBxFiokEWN3y9f8
 2Zw/ncF8SwX9LwmHyBVbtkAOvfbYdGJiwrMYvcNy+fHpij62yIQZqg9YTgw8CodXDwWv
 sYQUOGdsude/g4/JkGnpx1DMnBLhxv8rz7iEpZKJLHy29yvzGkRPpbWKxOjqv2eG8J7K
 MY73rbeBy6bNRHMsu7VC2A1EyYCrsH6vOv7+aI5ue8kGNxWg+9JxYOOzouUpEEKfAi9p
 VHxg==
X-Gm-Message-State: AOJu0Yy9RONcQ70Zsdz2UBdbXGriMHXHGmA6EnQlkr0RQ1xA65AkhxnX
 2Zb4Nde7QRO1fk90qw1K/qBbYQ==
X-Google-Smtp-Source: AGHT+IFa3rKPBGbMiv5r+wZtefSamWAegDbMuYEFn/StayXODb0Qn9SHx1kh5ZK8H8oo42epAKi5/w==
X-Received: by 2002:a17:906:209a:b0:9a5:da6c:6539 with SMTP id
 26-20020a170906209a00b009a5da6c6539mr3585083ejq.75.1695249968267; 
 Wed, 20 Sep 2023 15:46:08 -0700 (PDT)
Received: from [127.0.1.1] ([217.67.225.27]) by smtp.gmail.com with ESMTPSA id
 z23-20020a170906435700b00992f309cfe8sm118285ejm.178.2023.09.20.15.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 15:46:07 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/3] SC7280 DPU fixups
Date: Thu, 21 Sep 2023 00:46:05 +0200
Message-Id: <20230921-topic-7280_dpu-v1-0-6912a97183d5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC12C2UC/x3MTQqAIBBA4avErBNsoh+7SkSITjUbE60IxLsnL
 b/FewkiBaYIU5Ug0MORT1fQ1BWYQ7udBNtiQImtVCjFdXo2YsBRrtbfolMalSFrdE9QIh9o4/c
 fzkvOH7K9vZJgAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>
X-Mailer: b4 0.13-dev-0438c
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Found a couple mistakes, this series attempts to fix it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (3):
      drm/msm/dpu: Fix SC7280 PP length
      drm/msm/dpu: Add missing DPU_DSC_OUTPUT_CTRL to SC7280
      drm/msm/dpu: Fix SC7280 DSC block length

 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
---
base-commit: 926f75c8a5ab70567eb4c2d82fbc96963313e564
change-id: 20230920-topic-7280_dpu-59a29cedca6e

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


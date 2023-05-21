Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 429DA70AFBE
	for <lists+dri-devel@lfdr.de>; Sun, 21 May 2023 21:04:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA12010E18C;
	Sun, 21 May 2023 19:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD1310E0AE
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 19:04:45 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f3bb61f860so1035178e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 12:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684695884; x=1687287884;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EjzD0RJieB3kY7LZTu5fQEwWkRRa+/As0v5gHQMzbZM=;
 b=fBqdo85gKd1m+mY0hhENEGL5F+mfe30Ib7at50gTSu9D1ytt9kh5iqN9qybuljeW3P
 SHYzCTAeWd+3JfIgN2zdzyIjShDzFRcE+qNp72ZEStDZiiZhxVIx8ejAIHb70ajM6Tdl
 Ae5rcOZAcaqmFNaRgXUNRAc8VxOcrUDN7Y0jDDH9MTczACbLTKW2cZ4/ywIN63SXeNOs
 uJ22WlmVrSGQ2VXCrBkmCSJBhevkHKXDc1/B22j6JDV86p1JlfAYMT3PkMV5Uh3uoILU
 eTBVQQp+SLIoQ5WslWX1cMADRygzMHX5AgYxHuGIhctrL3p9jquW0j4CybeDkn7fXvsV
 ic4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684695884; x=1687287884;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EjzD0RJieB3kY7LZTu5fQEwWkRRa+/As0v5gHQMzbZM=;
 b=UKa2+Nl04wb+TkhNSU91YDBePWRLGjyvObaUEE9Pv0OY6MGnT43hWKxwahcYpRbPXJ
 yx6BdfPmITzxDnAcBdy7sZW+jbZ4NFAuROOjBqIWDe6IAgqcqzvmI/e/y+XkbASYs3Ic
 c9GYoA6bLLIwkYBFF+T/TdPVopMteg3RVNgcp+92LaXiNmggN1v4ai8Tv5NkCi1lkdqn
 LqW9CT3DhJFOE8RTVVZV6Vm7K2DK7Gq01AIpI0Zh6/XkIcxHX05xPnL6CvrVl4St2QlE
 66ZZQ4NJFRt+QOM/ncThMojZrkIJi7LbtQ40nyELfmUzLJKxrnuWyNXdGG3b4EC3nlUn
 jc3w==
X-Gm-Message-State: AC+VfDxpwjh6Nl3Qw/1Su9ZIPhvYR9eYI/Ecg3KepHuHfydGgh+Op4qR
 RwcHsCR31Hh+6Ou43jN5k1c06A==
X-Google-Smtp-Source: ACHHUZ6MkqQYNTM5Kb99NAfhmkraCoTJLYQEE2zFx66bwqaRhqvqi1ows4vzJNfc9YwvcKYzxbB+yw==
X-Received: by 2002:ac2:4a7a:0:b0:4ed:b048:b98a with SMTP id
 q26-20020ac24a7a000000b004edb048b98amr2685363lfp.6.1684695883871; 
 Sun, 21 May 2023 12:04:43 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 r22-20020ac252b6000000b004f1d884a4efsm694495lfm.242.2023.05.21.12.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 May 2023 12:04:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 0/2] drm/msm/dpu: yet another attempt at cleaning up encoder's
 debugfs
Date: Sun, 21 May 2023 22:04:40 +0300
Message-Id: <20230521190442.8293-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simplify dpu_encoder slightly by using drm_debugfs_add_file().

Dmitry Baryshkov (2):
  drm/msm/dpu: drop (mostly) unused DPU_NAME_SIZE define
  drm/msm/dpu: switch dpu_encoder to use drm_debugfs_add_file()

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 40 ++++++---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  2 --
 3 files changed, 11 insertions(+), 33 deletions(-)

-- 
2.39.2


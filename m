Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B834348653
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 02:20:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD5896EADF;
	Thu, 25 Mar 2021 01:20:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD8F6EADE;
 Thu, 25 Mar 2021 01:20:41 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id v186so167819pgv.7;
 Wed, 24 Mar 2021 18:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qiLJdMhcciEZgBLfoz2ge4p0MXfhpuLjibL+Tk2uVwM=;
 b=OGjLQcKreAioM5wf1smvNoJ82BsvMpFZ+ORVLIPjAod0bP8FJpiA8pcj0RXaTxR6RN
 nXU6jwLTdn1PPpwsdytGy/7piy2pJ+xuCLDlblMyDwhqeRclMLRVoADBUSR+i65FxqpI
 7nvyG2IO3ErxEI9WYIhnEpTyIgU/Uq+SbkqU4Chn8dNeB94Q4yM4vnKT0E1DFFmglEpF
 cxAEYBqmA4La+JKLkG/D9O4s5H6Jj0ZhxgL2hQwA2x+yZTUWfBAJZrShwOmRhIVIdMOC
 ebuFLuC3Ldr2pLXkriYZx14UNAnwWvh+Cpil4nhEEkMJ8Izk0lXRh9Wu16oWlCr/mvwq
 E/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qiLJdMhcciEZgBLfoz2ge4p0MXfhpuLjibL+Tk2uVwM=;
 b=ZCA00DquZFYYs6haNiENwLRNkvG39WiwWwqlu4fXVfD1UtYMUtodO8DIb9+oCyMS50
 M8e5if765eni0XT0tiUWcXo4VSNDy4AHstvQSB57u8ZwEg30rDx3dRhaP6clTu0lmxkV
 GwhYEPmtfYa0EcvByM/pcrgwa1MpQP4ssSdD/WEXUYOmzAaJBRnfkdOpC/tCyxrA/8nA
 I8HcdtzpJ7Bs9/4dUxgWe6ooiAyILxHm1bJDVHccXiC2K5D8p47JSHRzvvUBVCEmjKM7
 kVLJGnqYQsBdmgXvEE2OM82EZyDNYeg/qnDq8jWCb/VllCrGNNKKoKr4DBIEYJAL0ktK
 rkrA==
X-Gm-Message-State: AOAM5321dxZtUJaW74S8En5gNj+kmCr2jOWZI1rYGegMqwTGP7ULRaN6
 1eyI6Qg9zyetEsYl5XZNzOyTmjPatXE=
X-Google-Smtp-Source: ABdhPJz13qOoTUuf5M3bIR5HvIbImmbvAh5xl7ISbW5k+N9dGYB8MAuXYM/ugR5dLmSdYMeM8Fye2Q==
X-Received: by 2002:aa7:9246:0:b029:1ed:cfa4:f1a8 with SMTP id
 6-20020aa792460000b02901edcfa4f1a8mr5643278pfp.73.1616635240134; 
 Wed, 24 Mar 2021 18:20:40 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id e7sm3606796pfc.88.2021.03.24.18.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 18:20:38 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/msm: Fixes/updates for perfetto profiling
Date: Wed, 24 Mar 2021 18:23:51 -0700
Message-Id: <20210325012358.1759770-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.29.2
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
Cc: Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jonathan Marek <jonathan@marek.ca>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dave Airlie <airlied@redhat.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

A couple kernel side things I realized I needed in the process of
implementing performance-counter and render-stage support for perfetto,
the first patch fixes the MSM_PARAM_TIMESTAMP query which was just
wrong on a5xx/a6xx (ALWAYS_COUNT vs ALWAYS_ON).  The second adds a
way for userspace to determine whether the device has suspended since
the last sampling period (which means counters have lost their state
and configuration).

I am a bit tempted to add a way that a CAP_SYS_ADMIN user could ask
the GPU to not suspend (until the drm_file is closed), but so far
I've managed to avoid needing this.

Rob Clark (2):
  drm/msm: Fix a5xx/a6xx timestamps
  drm/msm: Add param for userspace to query suspend count

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 4 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 4 ++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 +++
 drivers/gpu/drm/msm/msm_drv.c           | 1 +
 drivers/gpu/drm/msm/msm_gpu.c           | 2 ++
 drivers/gpu/drm/msm/msm_gpu.h           | 2 ++
 include/uapi/drm/msm_drm.h              | 1 +
 7 files changed, 13 insertions(+), 4 deletions(-)

-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

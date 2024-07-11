Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D158592E404
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 12:02:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E78810EA0C;
	Thu, 11 Jul 2024 10:02:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XatYjJJA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A6CE10E9F8;
 Thu, 11 Jul 2024 10:02:30 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-58ba3e37feeso761459a12.3; 
 Thu, 11 Jul 2024 03:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720692149; x=1721296949; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W7LlhYWp7nTMZ7K5CSP3BcZJAn5u5YMEvoL0KoMR+4c=;
 b=XatYjJJA7qecAvG33jGqEnXkV3yxbbb+WEOam7blehFtojGlWJC3TTsYEqF5aN29FZ
 y1UDXvxHt+aWqnh/Rx+PGibohKzK7RL23049VPnwBo3uOTKQGOEGbEihu98wl42eRocR
 Qx5j06QuYneqMbc8wQMM2RfLmp6GWZX8SI03FwmP3jm1OgBqo3KV6yI6KD7jLQsAq/g4
 l0eas8XI8hptRVEd4mJ6NZUjX0uPK5ZzeGZCRP+7x6RkrujTxJ+uEIBqABzWY57yPV8V
 dwA2jBHBBdeH8uKO/ggu1U0j91q0q6iMyqscpVApKY8I7i9RsrdhgVu6fyiyX90hIMoI
 +ing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720692149; x=1721296949;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W7LlhYWp7nTMZ7K5CSP3BcZJAn5u5YMEvoL0KoMR+4c=;
 b=WxnhrTgA5vrlMHK7B7j1rgHgkASgDaxyBKsCAko6JNideUS3pIy0+5ZLsRakDVjaWf
 2FEczbc/olW6bqgLtwHszpQoCC5jxfdw7P0QFoX9AN6fvDYlNEfcE2ODCVYFs7QKBdlU
 sbupDp51x2qaZUEsoQfVcb/vCkrLetU3PUrqKIGCeif5GQXOEpzbiRx4Gi6A0vVGzecj
 LQuKilO7R8orJIwufwRdWxtEkGdTdjD/2Gh0uVxnrq7Oy2ZruD66GVtU2C1ZO6RfyTfo
 6jx9/AO5vxXvykhC8LzpFBVEOQ84NhThd/S4U6FVzTOwE8tDMI6Ie9YPeGH7cKE2Eoc1
 hVPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgIISSTb3lQfoQ50uHfxEYelCvq1dufU3j1yQpX1OqCLBY9ouVoxsqhkuhnGtv5Zl7TmV5A6whvgjUe7QvI7lpIJ4EXZicevB4FjiF1X1tvUq0obqJjG1bGwa7YUh68S8Ug8nrd/9hTJ3ZedPtwHT/
X-Gm-Message-State: AOJu0YwbNkyFNWQjWglB2iN0qTAROdUas47j4rI/wREx6XBrL+vwR8W8
 AzB/i6Ibaso/GfhKN7lRZ37Zl/4pwAfsjhqHsTiQ7cq44qvWi7f3
X-Google-Smtp-Source: AGHT+IGYQg8AZUImmAxC1jDm80glcTQzVnRnDnAM3C088/0+jlZf/fyKMvJlBHWFkzqB9e2hoZAe8Q==
X-Received: by 2002:a17:906:378b:b0:a77:dd1c:6270 with SMTP id
 a640c23a62f3a-a780b688911mr513379166b.5.1720692148336; 
 Thu, 11 Jul 2024 03:02:28 -0700 (PDT)
Received: from localhost.localdomain (public-nat-01.vpngate.v4.open.ad.jp.
 [219.100.37.233]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a6bc876sm239207666b.5.2024.07.11.03.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 03:02:27 -0700 (PDT)
From: Vladimir Lypak <vladimir.lypak@gmail.com>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] fixes for Adreno A5Xx preemption
Date: Thu, 11 Jul 2024 10:00:17 +0000
Message-ID: <20240711100038.268803-1-vladimir.lypak@gmail.com>
X-Mailer: git-send-email 2.45.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are several issues with preemption on Adreno A5XX GPUs which
render system unusable if more than one priority level is used. Those
issues include persistent GPU faults and hangs, full UI lockups with
idling GPU.

---
Vladimir Lypak (4):
  drm/msm/a5xx: disable preemption in submits by default
  drm/msm/a5xx: properly clear preemption records on resume
  drm/msm/a5xx: fix races in preemption evaluation stage
  drm/msm/a5xx: workaround early ring-buffer emptiness check

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c     | 18 ++++++++++----
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h     | 12 ++++++---
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 30 ++++++++++++++++++++---
 3 files changed, 47 insertions(+), 13 deletions(-)
---
base-commit: 523b23f0bee3014a7a752c9bb9f5c54f0eddae88
-- 
2.45.2


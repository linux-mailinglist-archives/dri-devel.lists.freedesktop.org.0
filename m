Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B83E02B3026
	for <lists+dri-devel@lfdr.de>; Sat, 14 Nov 2020 20:28:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A756F6E950;
	Sat, 14 Nov 2020 19:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 643DA6E94F;
 Sat, 14 Nov 2020 19:28:31 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id y22so6124574plr.6;
 Sat, 14 Nov 2020 11:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AFQ+O37FNhcW/Av1cdzRedXy1kVAe5xo2SMJ3+HW4OM=;
 b=tudOwl5k0DEf1JMf54FAh1NRxuvSxaazL8VdkjdApqPV45SwUXJhYIyJsPdsxtVBpf
 hgDV43HjAAGCuB2G4meVH7M4PeXQmowKYNyOTMAFQM2BIAn3EYum5smmbnLL525Nnrm1
 mcf1+VRnINeySCvgR+63WsBnQK5zaPiQggNkMLP9WVwgnNnt7BC8iQ4zDjzgyP9TvOU+
 fzRW9/HCvwY/G8a561RSboBba48456HSDIjvejQVIWyW3eZyf3IW0OKAG34zfuQY+BAQ
 cuHlnTxbyXyCFaIKxkZlIYWVTb+pnrrkrO8bqHgz650rwMxn4Npdm+VvzxavjDpIWpzY
 6dQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AFQ+O37FNhcW/Av1cdzRedXy1kVAe5xo2SMJ3+HW4OM=;
 b=ZwyGAj+jHr2CIBEebxsE5b1z12wQ46cvP2DJM8k+5ERG0MBLX5IMUtet4yjf2HU644
 I3Noe0o0/mZ4HEmwi8IxybXSK8lU1e++kYjhiHpiNMj9Wp+2sD5oWLp1BuNsb1fqbqCp
 K4A2Qzj3kUGenIHEv8MJcoXTMlq2eqcrHot3gm5PTCsrWJMkpN0e5v2BI8l2wvcJqd+p
 MFHqYyanMSo2x7cFui6kMQwnoekltIbrtGSlyiG7s2gE1VitrzzkdXLj6VvUJ5eUZXIf
 bIvfwTBn3djoBPZ6GaaFq/Hs2+RCtutF3gW01Baq0pTdpm8J6MhUFxxpo/2SywOQZ5Tg
 /LMg==
X-Gm-Message-State: AOAM533Dht2oIr3EUHjXijiR6eCa6E7Qyh/blhqH88avUd7Lg9Pe7BsF
 rhEjkk7JO1nyfE+iYLN76Ax/G/53M3k=
X-Google-Smtp-Source: ABdhPJz97OgwKrxTObJzEQUlL24OvH7R1dO5YeQlR3R2sYUOneSNlt1UEShKzMlvCtFXdJejagJqtg==
X-Received: by 2002:a17:90a:d495:: with SMTP id
 s21mr8950511pju.30.1605382110209; 
 Sat, 14 Nov 2020 11:28:30 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 z7sm13794282pfq.214.2020.11.14.11.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Nov 2020 11:28:29 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm/msm: Shrinker fixes and opts
Date: Sat, 14 Nov 2020 11:30:07 -0800
Message-Id: <20201114193010.753355-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.28.0
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
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The last patch is the main thing, motivated by some cases where we would
spend a lot of time in msm_gem_shrinker_count().  First two are fixes I
noticed along the way.

Rob Clark (3):
  drm/msm: Protect obj->active_count under obj lock
  drm/msm/shrinker: We can vmap shrink active_list too
  drm/msm/shrinker: Only iterate dontneed objs

 drivers/gpu/drm/msm/msm_debugfs.c      |  3 +-
 drivers/gpu/drm/msm/msm_drv.c          |  3 +-
 drivers/gpu/drm/msm/msm_drv.h          |  8 ++--
 drivers/gpu/drm/msm/msm_gem.c          | 45 ++++++++++++++++------
 drivers/gpu/drm/msm/msm_gem.h          |  5 ++-
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 52 +++++++++++++++++++-------
 drivers/gpu/drm/msm/msm_gpu.c          | 10 +++--
 7 files changed, 89 insertions(+), 37 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

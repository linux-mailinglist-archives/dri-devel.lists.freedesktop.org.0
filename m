Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2DF6DA51B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 23:59:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F00E10ED31;
	Thu,  6 Apr 2023 21:59:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F62C10E26F;
 Thu,  6 Apr 2023 21:59:33 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 b5-20020a17090a6e0500b0023f32869993so49081pjk.1; 
 Thu, 06 Apr 2023 14:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680818372;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Sh/cSP01X7baGcBhRNO/UI6rxYCvlWhn8fT2Xxx8V1w=;
 b=azChA4iepORRwqBwYlga8jmqES47PmBJA5H4jRgGIU3000G70/o9VhARuDB1XtGsBc
 mH8UaxWpwVLdiaLlBaJaU55y4KuwD9IKO9Ua3KkuHO+LNup8POI2vC3l9CingB0a0eu9
 nWVoSeBc8hrKvw1nfAAPnDs20BeohnBGxnO7eFF6yGE8jfDH03BImspXFCQ/xyc+jP/U
 IPhGxj1EVBH2GxK69LIGwDmemiYftXGPY146TYIXu9BfECVe1ElHW7Oh03WIXB5iGqU/
 asZ41EYXFuQJDgQRDOZW07YbL24980B2UX2NHmrVRLIHlkFcf62y5ROmZkLW8H098J2Q
 sD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680818372;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sh/cSP01X7baGcBhRNO/UI6rxYCvlWhn8fT2Xxx8V1w=;
 b=E1316tkpEQ8tIl8ZxYZZSo+ybpF3wzkS1NNh8+NCguUJMno+w2mspIT34vp4FgWBnt
 WGWSjpUW7Lh95ZNPxYTTzetIPNPXfmz9S8xPvQIQK9/VGm75WQmCWuTlCwswG40HPwXh
 bGtclu59Krqpw80t4uC5NeSwW2Je7nH7gLmjpi2aOJaiWacdyl0qQm5ccjFKK0H2PNMn
 oaJ08q5VuWLwSawyLZoBCcXFg86r91oZqx59IRrEyN4gGWAijdjN3G2PZi8ugpGSR2l5
 +/0Br9HnmLBMzpxaz4bCf6brbfXhdRXMuRJ4HXFhvnyZlxFDqeFKLVbWABerIxN11FOb
 hQeg==
X-Gm-Message-State: AAQBX9eBT4uflB5xPGV1KwoS9NPcpqnH0lLnriUE+A+i0JFXGcrOO/m4
 d2Or3iZNaqev4qHFQFkx2UlhmJf7yUs=
X-Google-Smtp-Source: AKy350bo4KJeNsRKbrWCg7w+eKRCQynE4zWn4ZdEYUZrNEVMBtjR+F8D6ulk5dyu7iGJS3DU+v2I3A==
X-Received: by 2002:a05:6a20:8bb0:b0:d9:4c19:fe6a with SMTP id
 m48-20020a056a208bb000b000d94c19fe6amr746759pzh.9.1680818372270; 
 Thu, 06 Apr 2023 14:59:32 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 x53-20020a056a000bf500b005a87d636c70sm1790621pfu.130.2023.04.06.14.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 14:59:31 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 0/2] drm: fdinfo memory stats
Date: Thu,  6 Apr 2023 14:59:15 -0700
Message-Id: <20230406215917.1475704-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, Christopher Healy <healych@amazon.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Similar motivation to other similar recent attempt[1].  But with an
attempt to have some shared code for this.  As well as documentation.

It is probably a bit UMA-centric, I guess devices with VRAM might want
some placement stats as well.  But this seems like a reasonable start.

TODO gputop support?

[1] https://patchwork.freedesktop.org/series/112397/

Rob Clark (2):
  drm: Add fdinfo memory stats
  drm/msm: Add memory stats to fdinfo

 Documentation/gpu/drm-usage-stats.rst | 21 +++++++
 drivers/gpu/drm/drm_file.c            | 79 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.c         | 26 ++++++++-
 drivers/gpu/drm/msm/msm_gpu.c         |  2 -
 include/drm/drm_file.h                | 10 ++++
 5 files changed, 135 insertions(+), 3 deletions(-)

-- 
2.39.2


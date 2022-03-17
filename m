Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D28E4DBBBB
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 01:29:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABCB810EAC2;
	Thu, 17 Mar 2022 00:29:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A17CF10EAC2;
 Thu, 17 Mar 2022 00:29:05 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id v4so3553617pjh.2;
 Wed, 16 Mar 2022 17:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xY4eVwxpzHGCfj7b88lwUJ2AvwKczsPBBzYysmGRLe4=;
 b=Vxg9k7ppY8aEm3bUKevEnXzPV2EAe+vCVpwTYJAGDuHoNeaIFmhjFnFY0g8tUIUP2w
 RR9hlL2z8EaXmlfpubXj+D7rC4Xx0RT9rBQQ3D8dcZ/DcKcFteupGzF6+/npdnChH59t
 d9Y0FqdpJVQ+e9MlGtYC2Omy4/kf/Uaml3BHl/66+98A39xtfDHgijvf6R56NFbJ93H+
 YVUx5Sd/6x3uiX9EcxZu75AFwboVJlK3bAMH6tQj6cQdYtTeMRf5BzDVV5WazBAIoRhQ
 DMlJ6Ck0JA1S9tMkf7MxnqB9neJAHB7Z2dnRLheTCDjoayM/Ti7o9tIf8GTdg3UPMiZb
 xtFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xY4eVwxpzHGCfj7b88lwUJ2AvwKczsPBBzYysmGRLe4=;
 b=3FNomBCGIju/54gVLhhzAD5qgfSwBVJMCjN02JstTXgokXzkFMHeDqIgrhibUoIucS
 MgDAtBwEWK36V/47E+/DuNRcHln4vHp35wk+1RAOHJg/RdM1Fr7fI71F0gXDt+voJBSf
 GAYp6yXSiV1XDn2tbLr8qzfIWy9ANGL3wZroZTBdTcOSNKYseR68pE+42YJjuzKf4rHD
 jW0Yy8Ar81EMNUusIzHhlPS6iE/bk+0KUEZXcSYL8RS5fEpuT6goDZDcCtHtIQe0QRD4
 8epxutgzndDVCZNc+ICG6a44OSNXO57L0efGFxPLknbJwFWiVdvCsoqmnhEV3qqGv/fW
 WILQ==
X-Gm-Message-State: AOAM530QSCZp9fh2xUw0qcJoQu7UsNka98k6e5zFYUfjZSyWi2O4GO1Z
 3Lgqt9pTUIVKnD+/BQCsOYgQSkOoL50=
X-Google-Smtp-Source: ABdhPJwXzQw7lHULSNga6Fsbn7ySFowlWuVSdMyItvEwBCJ0Dl/fPQjn/OualJKEREoTViv0bz/HWg==
X-Received: by 2002:a17:90b:3147:b0:1c5:d647:f76b with SMTP id
 ip7-20020a17090b314700b001c5d647f76bmr13011678pjb.161.1647476944517; 
 Wed, 16 Mar 2022 17:29:04 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 o12-20020a056a001bcc00b004fa2830a03esm832272pfw.200.2022.03.16.17.29.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 17:29:03 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm/msm: Add comm/cmdline override
Date: Wed, 16 Mar 2022 17:29:42 -0700
Message-Id: <20220317002950.193449-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
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
 open list <linux-kernel@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 Emma Anholt <emma@anholt.net>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Add a way to override comm/cmdline per-drm_file.  This is useful for
VM scenarios where the host process is just a proxy for the actual
guest process.

Rob Clark (3):
  drm/msm: Add support for pointer params
  drm/msm: Split out helper to get comm/cmdline
  drm/msm: Add a way to override processes comm/cmdline

 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 46 +++++++++++++++++++++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  4 +--
 drivers/gpu/drm/msm/msm_drv.c           |  8 ++---
 drivers/gpu/drm/msm/msm_gpu.c           | 39 ++++++++++++---------
 drivers/gpu/drm/msm/msm_gpu.h           | 10 ++++--
 drivers/gpu/drm/msm/msm_rd.c            |  5 +--
 drivers/gpu/drm/msm/msm_submitqueue.c   |  2 ++
 include/uapi/drm/msm_drm.h              |  4 +++
 8 files changed, 90 insertions(+), 28 deletions(-)

-- 
2.35.1


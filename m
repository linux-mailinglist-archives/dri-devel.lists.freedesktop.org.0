Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F7E790D73
	for <lists+dri-devel@lfdr.de>; Sun,  3 Sep 2023 20:46:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69ED710E008;
	Sun,  3 Sep 2023 18:46:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45FD10E008;
 Sun,  3 Sep 2023 18:46:12 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-79277cfc73bso35341839f.1; 
 Sun, 03 Sep 2023 11:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693766772; x=1694371572; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pEXJ5N1twmgreqGXVpqoU0bzKcH7UckG6V7g/a9C+IE=;
 b=UbCUg/UKrx/zZoN1HVuVz0h5ab40dBXHiFdnFvKO5LXKQyY0Vfn+RpYfYa9jxrIew2
 dKSvegOzeHmYGQePaQxAWhQ0omH22a9+gjRxu2HKHrBbAkeJa4UnByRmkdSIjEw0QTpb
 8JQgc/s7ssm+xBODRV3j5EEgHbnpq6/279tSIPkCK8A/QlXqiX35lozPAOscTsKsQlj6
 0CsxrExN+09JyrlP6+IwEfPAlGZD+pJtkyG4cPb+s6qCrLTuGskmb5FU/t+mQS8lPI9C
 DOpRviB2PQxOWMxx28YiNg8E5ovHlG4l4MPYYyFwcuQdVxtX4vZYMOfBxBIFTtjGg1v4
 tpYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693766772; x=1694371572;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pEXJ5N1twmgreqGXVpqoU0bzKcH7UckG6V7g/a9C+IE=;
 b=fpqtDIbVhzf4GqhuF7UfumJi9OuZycIXWu6MerD6prmZdhzAPX5XI0leGDCVOQg+RV
 agYr1Fzaj5TAqSXZ6BQkIrQouIn35Od+aAnGJAhB3tGpVY2IknEtE1zlCWcUKjttBDS2
 aSnEsP+WqeBrnm1fOs/Nvjg9nf7WzgNucUyYYXxaUqRPHiPn/But7WrNUk61+Ttjy02h
 qonwsDOgaiqWHpk8BNjfv2KnJC34fd8uDRqsUOB7WB5oJUB24zIDutf5cYeMe7+txJBm
 d3elNfG03wk1cEvIcgpbQ5vmZsaKnYP4ShzQm6QWttdT6xj2tKT1AtPOi/l6G8w2KF3A
 K2Mw==
X-Gm-Message-State: AOJu0YzxVkrKl4V21xSlE7iX/8T05qyX4sDEvMWTbijbcxpIaBQWkf9+
 d5EWtrB3cjCk2ejT11+p4Zg=
X-Google-Smtp-Source: AGHT+IFiChi/4PzbAqpMAN3czSGm3lxzSyeCkbTKkttXeYEpPz3KZqOEBt/2qm3z8FebuiPCmvuINg==
X-Received: by 2002:a05:6602:2252:b0:791:1e87:b47e with SMTP id
 o18-20020a056602225200b007911e87b47emr8505184ioo.15.1693766771898; 
 Sun, 03 Sep 2023 11:46:11 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 u9-20020a02cb89000000b0042b37dda71asm2519968jap.136.2023.09.03.11.46.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 11:46:11 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/6] drm_dbg: add trailing newlines where missing
Date: Sun,  3 Sep 2023 12:45:57 -0600
Message-ID: <20230903184607.272198-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
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
Cc: jani.nikula@intel.com, daniel.vetter@ffwll.ch, seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

By at least strong convention, a print-buffer's trailing newline says
"message complete, send it".  The exception (no TNL, followed by a call
to pr_cont) proves the general rule.

Most DRM.debug calls already comport with this rule/convention:
207 DRM_DEV_DEBUG, 1288 drm_dbg.  Clean up the remainders, in
maintainer sized chunks.

V1 got Fi.CI.IGT failure, on 2 Possible regressions:

 igt@api_intel_bb@render@render-y-1024:
  shard-snb: NOTRUN -> ABORT +1 similar issue

 igt@sysfs_timeslice_duration@timeout@ccs0:
  shard-dg2: PASS -> TIMEOUT

Neither have any logs bearing anything connected with drm.debug output.

V2 tries again.

  and fixes checkpatch warnings, by reusing 1st commit-msg.

  also fix a ccflags-y spelling error in drm Makefile.

  commits upon
  e2884fe84a83 (drm-misc/for-linux-next-fixes, drm-misc/drm-misc-fixes) drm/amd: \
  	       Make fence wait in suballocator uninterruptible

Jim Cromie (6):
  drm_dbg: add trailing newlines to msgs
  drm_dbg: add trailing newlines to msgs
  drm_dbg: add trailing newlines to msgs
  drm_dbg: add trailing newlines to msgs
  drm_dbg: add trailing newlines to msgs
  drm: use correct ccflags-y syntax

 drivers/gpu/drm/Makefile                       |  3 ++-
 drivers/gpu/drm/drm_connector.c                |  4 +++-
 drivers/gpu/drm/i915/display/intel_ddi.c       |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c |  4 ++--
 drivers/gpu/drm/kmb/kmb_crtc.c                 | 10 +++++-----
 drivers/gpu/drm/kmb/kmb_plane.c                |  6 +++---
 drivers/gpu/drm/msm/msm_fb.c                   |  6 +++---
 drivers/gpu/drm/vc4/vc4_crtc.c                 |  4 ++--
 8 files changed, 21 insertions(+), 18 deletions(-)

-- 
2.41.0


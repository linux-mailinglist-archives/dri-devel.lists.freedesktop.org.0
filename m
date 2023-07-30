Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24068768899
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 23:58:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E1610E137;
	Sun, 30 Jul 2023 21:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A41F10E137;
 Sun, 30 Jul 2023 21:58:08 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-78374596182so194101039f.0; 
 Sun, 30 Jul 2023 14:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690754288; x=1691359088;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sbjSrC6Xf1t1eELbOkTAbrw9X9H2Qkj1asQL3Gv+d0E=;
 b=e78us4E31/EL62UZ/d9+AODTGy4BAUAFfV/mOVAI1f7OuzhGI7L9s9Cffk6GEAGUzj
 flQmFys6JKiOTGkIbq4G2tiE7U2AFeDQHqkKr8m1Vvsde4OFKFam4d0VqxMmMVVmVj9i
 ldXocJQ5x5L+N9Xbdrh620sFNpoZhT3sv8uEvZv726Q7w5zbio6nNdBVufDhiRKPoLEp
 C+lwP2uLHzLPz2itzwwW8nrLbFA52rmYM5HpUGVIgLS/KvK4oJigCTyCv3Qsa5zPJwHN
 RwtmKzqOy9wAxsw/yD4F/AGTF2IPnVvXyOQfnUZXoCdyoFrsreXjLCeTIv3SiP+14HEO
 T0pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690754288; x=1691359088;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sbjSrC6Xf1t1eELbOkTAbrw9X9H2Qkj1asQL3Gv+d0E=;
 b=W3pdx+9Z43sALT6cHMigwQLgp7kZ7W1RI+LGwSk4wF685NGPAzOM3Q2Cl6X/XPivhQ
 sb1+d8C7Jm21FhDrfI6Zt6C1W10LJa6O45r9HqnzIRmNawftMgvsmPHAuTPoBG2TU4SJ
 nWYH6pexP1gg5sU615q9GJ/M2UIpXuIkSI2hn2yWCJHNbNzLeTTMkMUkG3i0Xr/WTOf8
 EId1fafksVXPrjEKQHFA36ptNwWTVMzM/pD//kDqhMMlxj4clR2VjPv4I01fKHrSpqGS
 tV38S3KiMCpqivD8UZn3t2GXGx62Vgkij+AnsBNabHoRYX1nZvzIUvJQUM0Z5pfYi4AO
 EQyg==
X-Gm-Message-State: ABy/qLYwm3oeKi5/wZm6b3g/U+In760Sco0WN2bEefYEXUuLp4Hv1wDZ
 /A/p7xGvWiGtDzPFmiUNzLY=
X-Google-Smtp-Source: APBJJlFchddN9xbU7X/x2AFLj9rBNk/j1Rd+vYRHyhhp+pMib63heddhIZTf6UnPFwMoD8dQfYHUPA==
X-Received: by 2002:a92:cd86:0:b0:348:8da1:891c with SMTP id
 r6-20020a92cd86000000b003488da1891cmr7544893ilb.24.1690754288186; 
 Sun, 30 Jul 2023 14:58:08 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e18-20020a92de52000000b003424b3d6d37sm2747520ilr.24.2023.07.30.14.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jul 2023 14:58:07 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/5] drm_dbg: add trailing newlines where missing
Date: Sun, 30 Jul 2023 15:57:49 -0600
Message-ID: <20230730215758.54010-1-jim.cromie@gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Most of the (~1500) DRM.debug callsites provide a trailing newline in
their format-strings.  Fix the remainder to do the same.

no functional changes

Jim Cromie (5):
  drm_dbg: add trailing newlines to remaining callsites
  drm_dbg: add trailing newlines
  drm_dbg: add trailing newlines
  drm_dbg: add trailing newlines
  drm_dbg: add trailing newlines

 drivers/gpu/drm/drm_connector.c                |  4 +++-
 drivers/gpu/drm/i915/display/intel_ddi.c       |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c |  4 ++--
 drivers/gpu/drm/kmb/kmb_crtc.c                 | 10 +++++-----
 drivers/gpu/drm/kmb/kmb_plane.c                |  6 +++---
 drivers/gpu/drm/msm/msm_fb.c                   |  6 +++---
 drivers/gpu/drm/vc4/vc4_crtc.c                 |  4 ++--
 7 files changed, 19 insertions(+), 17 deletions(-)

-- 
2.41.0


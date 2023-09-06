Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91287794366
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 21:02:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B533710E1C0;
	Wed,  6 Sep 2023 19:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A743810E064;
 Wed,  6 Sep 2023 19:02:30 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-79564282cb1so4667139f.2; 
 Wed, 06 Sep 2023 12:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694026950; x=1694631750; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oaQGDXjeyl1wK3pu1t3QMemL2yV1V0c+fGGW9EXmwB8=;
 b=EhR0C68eqOdR/dgwvk1LL+WHZo9eSj/TVShhalpbXtkOU2OsXYSERTOcexHn50qJnt
 9PwBzJ1qqn4r+b3sBdWiwpyxS3JG4zNc3LL4to3Dod/m6oKOXtgCKaqU1qa0ZZ5KbIRo
 KwE3vagTolvCzy4OEBc8tuDnlGN5AIYl+j6IdFTNj7yxoUdemT1uzzZ0H8MQuAFi8+Vm
 mYg6ZdMtfpmVu0xNWg8LTrlMc0BbJxEffqA8Y+pUU2TwksXKuVTcDBixm2tVpCBJnSmi
 zwT14+g1rVW7k3EYl6lV+xjiGT0tusL+2SFUF1FAd/q9VC7XPDBMLacuIQCU7dBVRDr2
 UQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694026950; x=1694631750;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oaQGDXjeyl1wK3pu1t3QMemL2yV1V0c+fGGW9EXmwB8=;
 b=epkuBjkZFqE/fxcQBMuynG0qJhU11W5GpWwg1ACoZD0U3Htp+6OMizntrOgGt+eLxS
 O+0lzodhCz0pzTTNnxwQ3TCr/2jbAOG7GQtRbx7WiCK0UeANFkdhQZsVPSw+HNiaLiCf
 TUGaiXNaBKcqyVlwlgcIlqFe9cBNFxVTYdXbVdq/8RRE4vElzolDhyNnxeFDfclNCGgF
 x8p6rzp73HeBUVMd03yCvhbFOvUver+Y3bASxpMXVPnCez6mg/DHa9rh2RomesCT1UyE
 YH2f0ksFCa0hm3psyA0VIeOZ63ypSu6KE3EG+d8fOwuCB2KB5yQVuy1FRIa5ZOiIk+Tr
 OXEA==
X-Gm-Message-State: AOJu0Yy7ewLZ8gRnMEsuA8f9wtntufZIODnP8rw8KlF1rzM7SewsS/RB
 NX6YQ9f4Ruc+wrJbIBnNU84=
X-Google-Smtp-Source: AGHT+IGWUYcmi6S5h+fh/k9YyYz3mKPy+hp3qyzTn50rIoOvT2ULFXG+3gdAvN5pM0oGcV6yYoVbXQ==
X-Received: by 2002:a5d:9952:0:b0:792:4994:d1bf with SMTP id
 v18-20020a5d9952000000b007924994d1bfmr18995189ios.9.1694026949849; 
 Wed, 06 Sep 2023 12:02:29 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 w11-20020a5d844b000000b0076ffebfc9fasm5152306ior.47.2023.09.06.12.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 12:02:29 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 0/5] drm/drm_dbg: add trailing newlines where missing
Date: Wed,  6 Sep 2023 13:02:18 -0600
Message-ID: <20230906190224.583577-1-jim.cromie@gmail.com>
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

V3: adds proper "drm/<component>:" to subject, as suggested by Rodrigo.
    drops drm/i915: already applied by Rodrigo.

Jim Cromie (5):
  drm/connector: add trailing newlines to drm_dbg msgs
  drm/kmb: add trailing newlines to drm_dbg msgs
  drm/msm: add trailing newlines to drm_dbg msgs
  drm/vc4: add trailing newlines to drm_dbg msgs
  drm/Makefile: use correct ccflags-y syntax

 drivers/gpu/drm/Makefile        |  3 ++-
 drivers/gpu/drm/drm_connector.c |  4 +++-
 drivers/gpu/drm/kmb/kmb_crtc.c  | 10 +++++-----
 drivers/gpu/drm/kmb/kmb_plane.c |  6 +++---
 drivers/gpu/drm/msm/msm_fb.c    | 10 +++++-----
 drivers/gpu/drm/vc4/vc4_crtc.c  |  4 ++--
 6 files changed, 20 insertions(+), 17 deletions(-)

-- 
2.41.0


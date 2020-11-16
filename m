Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B082B4DCF
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:42:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ACE06E9F3;
	Mon, 16 Nov 2020 17:42:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC5C26EA16
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:42:16 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id p8so19676258wrx.5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3dpuU5BsT173A/3X/IKJ/RVPURrpJEnyWKPfCisq40U=;
 b=R0c1VYZ4uhe952lSIq65QcDIkw0VaRxMNF3r12FkqKkCKP3mYeJAIhiOq132YdsaZ8
 ZH1GB3ItUBwsx/qcAf9v2JrJgYX2Gx3ammOyg9wlPC9zFR8X6irCtvs/vZl47wPv0AyT
 YRC9sdRNT3EwxeYAFc0qhB+Ef5RwwBinY99ti9yIsaYI822N9aAqQooU3JHaEL+9n+HP
 Q6+FwmvbhSlkAM41JSELFusyxho3UvHUPX33fxH9hTxkXEMo04wDtOYDTQNWDl0I4ZK0
 i0rj0ygI3EsYcYDEq+VF1Jy8Zd5CUxH6BCXECjSvOmwafl3PI6R0BTpY9mocgCRHPt49
 49mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3dpuU5BsT173A/3X/IKJ/RVPURrpJEnyWKPfCisq40U=;
 b=pU2R7YgYhIBB/ONFCksPrG57Cv7j4aAhD073iuLvitjB2VRUNfJZdmtRn/5WU1uGal
 CSPAGtRBg9z1q/k5pKkPGqWu/ScXD7J1T9gw/YBQNMHQ3Iup9eXt60Bp/wdOSctciwMD
 kBQhlpdG5rqQjIHRmjlgMGt5I1LaTUZAGPk3VNJCDYtC8rLZyx/ZJlxohO7O5Oop1ISB
 DiX2BH/iTyVm4SbrVpITlAFkjSVM4JW84EoGhpuJiXNLf22dniIrbb7Wyt6SZuesatxI
 XYzbIlnX2iaFzXPN2drtZsW1YUuMTfvjaXn3Q35PtCCDxgRdtCpMiMrb/z7sLhcoe3Pk
 Vg5Q==
X-Gm-Message-State: AOAM531I4/9tQukaZ3ZNldoefTTxPQrCvZjJ1jb75GHUIhO6xG413ei3
 PlU8MNjoR+FJJn4TVkgmhweY2g==
X-Google-Smtp-Source: ABdhPJxtmaWM3VKZa7T15xSrO7rUuQXUBkW8QqK89gWx3Yq36M767nEaAOZciDjUhOSQTWtTeD/Fcw==
X-Received: by 2002:adf:c847:: with SMTP id e7mr20667633wrh.346.1605548535413; 
 Mon, 16 Nov 2020 09:42:15 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:42:14 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 39/42] drm/vc4/vc4_v3d: Demote non-conformant kernel-doc
 headers
Date: Mon, 16 Nov 2020 17:41:09 +0000
Message-Id: <20201116174112.1833368-40-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/vc4/vc4_v3d.c:131: warning: Function parameter or member 'vc4' not described in 'vc4_v3d_pm_get'
 drivers/gpu/drm/vc4/vc4_v3d.c:231: warning: Function parameter or member 'vc4' not described in 'bin_bo_alloc'

Cc: Eric Anholt <eric@anholt.net>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_v3d.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index 65d0dac69b0bc..73d63d72575b0 100644
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -122,7 +122,7 @@ static int vc4_v3d_debugfs_ident(struct seq_file *m, void *unused)
 	return 0;
 }
 
-/**
+/*
  * Wraps pm_runtime_get_sync() in a refcount, so that we can reliably
  * get the pm_runtime refcount to 0 in vc4_reset().
  */
@@ -205,7 +205,7 @@ int vc4_v3d_get_bin_slot(struct vc4_dev *vc4)
 	return -ENOMEM;
 }
 
-/**
+/*
  * bin_bo_alloc() - allocates the memory that will be used for
  * tile binning.
  *
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

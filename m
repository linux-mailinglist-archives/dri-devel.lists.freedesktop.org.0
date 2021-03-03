Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F00532B827
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 14:44:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD6C36E8E9;
	Wed,  3 Mar 2021 13:43:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C5006E8F9
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 13:43:47 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id b18so17252361wrn.6
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 05:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l3BFodeOPTMMoMJFhYQYaXV3COFge4hJ56ydgoQMcn0=;
 b=NJfqDB9NHKQ/wGFMa43GPx+ixK4Rx/iRwTH9xXN65p2FK/n8vZ3ebEhihmL73C5coI
 DguDr3o/fpfTpc2qnQydLiHkjZ4bxu4aWvn3pP1QXvssbFa5mh5/bCtluGHYYaEXnsrj
 ao7HNvCYertCxSwgtEEfj3yBD9hLNIReP6NupahkoGPbgNJmX+ZF3+ZvWQCwXs79H8y8
 yYs+F2bbN16FlLS9tu585Ll/UW2o+l4lQ9Bf04G3MHgnC4aF3ccqBI3fY3jejXQORchb
 Y0UfUNF+Eys+Rvl8q/L8zHzCYI7N8r0yk+FqbwNRd4XUHrLtP2m6uihF8mfgfWK71x20
 ++Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l3BFodeOPTMMoMJFhYQYaXV3COFge4hJ56ydgoQMcn0=;
 b=oPAhKuFhH2rvEcgcPSZ30Ws7pjIGc8085xGYuIwQ5gMvj0u//kujem7BWxNSUfh6wN
 F77Z98IX27r1UlkLi2GqTRIh+b6C0uBQEIbQaX5px1pkeFQBnwg2mRfkWfrGWfTFHWMx
 l6M4K412caiRse1+Ki9s0CaDWFTDIgrLRlIIxVups/MhWsxlJkTR4s1mRTa4W9mS1VkZ
 rnHjXwLPWsjvCQ1Q992Dvnqt7J+QFhkpTGexLa5QPplYsZXrNXKBTdQDljBEvhdPMr+W
 0LL9x/AhLtJGTd6V1ozoo2I7fbjvWWQzfyeHtZnmXRwbdU7d23o5idBFZ25V7yS80zsV
 IqKQ==
X-Gm-Message-State: AOAM530GcGk+chIYGnZpVpVYAYEogQdr/hAe/om9vm9H6PpSVDooPjzI
 1ePiNeZfdHx9buzQoUVmRV3bOQ==
X-Google-Smtp-Source: ABdhPJwg0qVs5es0CXhmCcvkodgXHaVs99pEF1zW+Kj/W6VZdZEtiqPdehQYYsFnLOx42FLMZcCbKw==
X-Received: by 2002:adf:f2c3:: with SMTP id d3mr27870193wrp.380.1614779026168; 
 Wed, 03 Mar 2021 05:43:46 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:43:45 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 15/53] drm/nouveau/dispnv04/crtc: Demote non-conforming
 kernel-doc headers
Date: Wed,  3 Mar 2021 13:42:41 +0000
Message-Id: <20210303134319.3160762-16-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/nouveau/dispnv04/crtc.c:462: warning: Function parameter or member 'crtc' not described in 'nv_crtc_mode_set_regs'
 drivers/gpu/drm/nouveau/dispnv04/crtc.c:462: warning: Function parameter or member 'mode' not described in 'nv_crtc_mode_set_regs'
 drivers/gpu/drm/nouveau/dispnv04/crtc.c:640: warning: Function parameter or member 'crtc' not described in 'nv_crtc_mode_set'
 drivers/gpu/drm/nouveau/dispnv04/crtc.c:640: warning: Function parameter or member 'mode' not described in 'nv_crtc_mode_set'
 drivers/gpu/drm/nouveau/dispnv04/crtc.c:640: warning: Function parameter or member 'adjusted_mode' not described in 'nv_crtc_mode_set'
 drivers/gpu/drm/nouveau/dispnv04/crtc.c:640: warning: Function parameter or member 'x' not described in 'nv_crtc_mode_set'
 drivers/gpu/drm/nouveau/dispnv04/crtc.c:640: warning: Function parameter or member 'y' not described in 'nv_crtc_mode_set'
 drivers/gpu/drm/nouveau/dispnv04/crtc.c:640: warning: Function parameter or member 'old_fb' not described in 'nv_crtc_mode_set'

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/nouveau/dispnv04/crtc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index f9e962fd94d0d..f9a276ea5a9e0 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -449,7 +449,7 @@ nv_crtc_mode_set_vga(struct drm_crtc *crtc, struct drm_display_mode *mode)
 	regp->Attribute[NV_CIO_AR_CSEL_INDEX] = 0x00;
 }
 
-/**
+/*
  * Sets up registers for the given mode/adjusted_mode pair.
  *
  * The clocks, CRTCs and outputs attached to this CRTC must be off.
@@ -625,7 +625,7 @@ nv_crtc_swap_fbs(struct drm_crtc *crtc, struct drm_framebuffer *old_fb)
 	return ret;
 }
 
-/**
+/*
  * Sets up registers for the given mode/adjusted_mode pair.
  *
  * The clocks, CRTCs and outputs attached to this CRTC must be off.
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

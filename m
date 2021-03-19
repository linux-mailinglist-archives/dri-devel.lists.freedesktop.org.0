Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A656341760
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 09:25:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE2D56E9B2;
	Fri, 19 Mar 2021 08:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B6F56E9A8
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 08:24:45 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id u9so8276642ejj.7
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 01:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l3BFodeOPTMMoMJFhYQYaXV3COFge4hJ56ydgoQMcn0=;
 b=yDpwOUtr8Y8qaTzYWOy1tt72khTzKSstlpxPsggpndpTO0YpW29THZpXQ9yaQtYC79
 68SiANuDXV2bSx2a9n5Y3wAC/eP0plAl1TGb6e+VnH1n4+0m5M9iXQI0YAoCJfyjI92r
 bJO4s7N++8FfpUyaw9clV/1j0pVHhkhv+aBOSJlq/c34rzYh33L12XhsLGnY+GSnpOSP
 clPV01gl/MoIDV/HszIHC/Uqp5oKYVVQgSfQ1CUHacjvw22R5vfaWmvOYp9Jg7ANcaMD
 SkYlMwCKcvaSKswcxaHWWBfBb47Q4a3HBm2iAsPljuDZ33X3VcDmgTCdML23L3pKNPM2
 Ed7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l3BFodeOPTMMoMJFhYQYaXV3COFge4hJ56ydgoQMcn0=;
 b=jtUY0sj8gTDcRYT5M/Jtcm2pBxSsQAZgTgyZ8/3toXwFSSH4iQHM7Dbvw5yaotWOd1
 D5rw42gQovlitfEKEiqbssaqUCKlfEyE4d0mlDXuibhJsJ1NgAfXmvVfBVh8amVDo5dl
 4DWKcAxzfExPRWfEUnjbsT2pCDpYM9+JNeZn8nW9eKatl9W64q9cOLIPt04SX8pS2kVj
 wvOh623aFf9xXT9T8qLcRyqEiR2dZDouDORPXBJLVRZgUSg74OJiVk2JqGdEZMIOOhVg
 wjJK0djRtxAKSSiVPNH+FqI/QrK1nlIIwRtVAtmJakzPsohOrjFdHD/52o9wOu4fANBo
 lMrA==
X-Gm-Message-State: AOAM532JTKKn58i4xmGAL3b1yk6UCfFk5DoJ4q+0Baf73VcXhoYXK8Jb
 INAwx7/2wuo3m4fgERBKsXPSrA==
X-Google-Smtp-Source: ABdhPJxoo5i8vW6NNowcMoz9sB++W3ReJn5ajzefnBphKE7+Df6szDDubQQH7q/pELeFudxCf4ap9g==
X-Received: by 2002:a17:906:b4c:: with SMTP id
 v12mr3007707ejg.330.1616142284127; 
 Fri, 19 Mar 2021 01:24:44 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
 by smtp.gmail.com with ESMTPSA id b18sm3273727ejb.77.2021.03.19.01.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 01:24:43 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 12/19] drm/nouveau/dispnv04/crtc: Demote non-conforming
 kernel-doc headers
Date: Fri, 19 Mar 2021 08:24:21 +0000
Message-Id: <20210319082428.3294591-13-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210319082428.3294591-1-lee.jones@linaro.org>
References: <20210319082428.3294591-1-lee.jones@linaro.org>
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

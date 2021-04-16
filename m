Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 477F836227F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 16:38:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6006F6EC06;
	Fri, 16 Apr 2021 14:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C806EBFE
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 14:37:41 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id w18so32625022edc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 07:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l3BFodeOPTMMoMJFhYQYaXV3COFge4hJ56ydgoQMcn0=;
 b=u2Cuu4Jc4BAtOcP2wM3yaX4ApJCJGReeFsvfaoDTG3jKvKE3+Iu75Kt7ZdJ2zK9z7l
 fbTQxy6O245G8O9EHIoBFyChD/v/K62OwzhOwL68dACvrQyMliAqxL4InjNRq5jAis2c
 exA8ZmQsMUtVPgvKzkfSMyaKhwr8GL2Abqnqk4UAOiA6O3bDneKMvcbyZM9YuX5zkzc8
 tZhzJUOzm+R5/ZHP5qJn7pVAdvyDNLGeQ764UfKpbHf/lkkxgeN8MjUnkJKZGo4tstbo
 35E4GaxucIbTZrvooB4yyntd03WQe+Phz4IXTPvTnxrsURAvnAbinRVGuE9dR+su51Kk
 B4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l3BFodeOPTMMoMJFhYQYaXV3COFge4hJ56ydgoQMcn0=;
 b=jU5T6RzeNdkVYExvYtzPv0aVA7A2nTUYvVgPZO0W4rU8QIE9VNQ9kNNGBb+y14kTPO
 rBw9Ph4A0MNXwwmARQvzbwhDcYbxjgWkf3vMUgl4ESL/ye14oIHTTRrSWzhzQiLamSkF
 X1NqYDTbdAVBOSRaAuEZkWn1iAiucEkIIFJSeluKS5rLx1pUo1wlo1RVhcK/MWNUMxwd
 IW/0LPHG5FH8Ep0XfGrBhYERmuzYEi/k5usMEFhUefSET5OpTtTpf7Z7kglnc6kmnr8A
 gL43eRwNoiI4wVABU8OdlGugNHfWlb7u2TZzhaYm+4QcEwHsYRaiFFWTkQuTfvmseEld
 LAQg==
X-Gm-Message-State: AOAM530oMLG1mUsUqFUzMWJgitHPYQ4qVRPgx9kandWUovCtBxUOVkPP
 tVE6iTBhm1HMH8qSAtg99tMCcA==
X-Google-Smtp-Source: ABdhPJwm/qXC9CmXFKpJRRi0FkxYSeD2m3JvMfrF6aIw+Mh8m2TcrBzkpSLtohDDKKDObBVHHaPD7A==
X-Received: by 2002:a05:6402:1287:: with SMTP id
 w7mr4512924edv.208.1618583860376; 
 Fri, 16 Apr 2021 07:37:40 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:37:40 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 09/40] drm/nouveau/dispnv04/crtc: Demote non-conforming
 kernel-doc headers
Date: Fri, 16 Apr 2021 15:36:54 +0100
Message-Id: <20210416143725.2769053-10-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
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

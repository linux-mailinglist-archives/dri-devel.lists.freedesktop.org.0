Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1881A2F45CF
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:08:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84AD86E09C;
	Wed, 13 Jan 2021 08:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1306E072
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 08:08:29 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id r4so708815wmh.5
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 00:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JKXxaEbbFVJtyOGef7aTveS2Qs30U+5wi8mm0q9i1ys=;
 b=fJmqSS0s+ZCugqp77ZDbXeNmyUS4QE3cEElAx+aIv/Cd/Nr6WJYGC7miWkQh+j40FF
 VXsLUJnSZyP5anEZOJCrNI2IiNpoEQBlQQL73PfE86lwfsWpL6967bOlcsi5gShkskAX
 Ol+YdxVaRV+2wR/7kxHONQGmXUfLDIHx+qXsHVn+PZ+JKvvEOYMEhrcJ3nlmx+uPZ93k
 kL7FH18RKGzeI499n5RBDYrhbNxk6yvXSGFn+UWOu7PvBUogw3e2c3AN4PLy4Di6q8oT
 WMnsmGX/2N7ruDDReZJ5S/Oe6cPlLrMBE0WvNuAN0aK2SlVnHayrpCCrFlQSEhKwx/J3
 PcnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JKXxaEbbFVJtyOGef7aTveS2Qs30U+5wi8mm0q9i1ys=;
 b=W7ykJjBU/Ydej0aWsYLa0KOoHC2fNy/zvqdiJ/nzJFi/hiSD/OMddIA6YhIG/6FMf9
 MSq29qq6iReL4MfPSM+J7aIyt1toVcdpjOS6Czd8t49pkqltRUz2kphRaX+55LZEhF+F
 +Rw2aOZ0eLxYl6s0dTV6EU9KB/47dXtYP48CNJe/ezB1uDRM2WjutCU5QummNJ3/Vnrz
 HDwu5ueIt4fZ+jwig0mgHhGPBW8054zMW+9O6cucYabtz8xPt6dQMF4+Iuhw7t5zVc1E
 0I37SyE/49nv0p5198Fq2mZEvjL5vEm04nRcZO+OkJrasdwDAVW/OHSeqTjTH4j83oSG
 GJtA==
X-Gm-Message-State: AOAM533lOLIZZaITeLJG3ZA+bbfeqer6s67fROQ8Wafc32Nne+UHR+mO
 bELFpQtULtSPsB7ej2ljIk0mkQ==
X-Google-Smtp-Source: ABdhPJxrRCDR3uTrCjqrsFhzJ7gLc7caS9t8BTeezg1WGdGoice/2AUCNFahT3jIo+v0hjWgN59P5w==
X-Received: by 2002:a1c:a707:: with SMTP id q7mr695188wme.15.1610525308042;
 Wed, 13 Jan 2021 00:08:28 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id r20sm1642486wmh.15.2021.01.13.00.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 00:08:27 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 26/30] drm/nouveau/dispnv04/crtc: Demote non-conforming
 kernel-doc headers
Date: Wed, 13 Jan 2021 08:07:48 +0000
Message-Id: <20210113080752.1003793-27-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113080752.1003793-1-lee.jones@linaro.org>
References: <20210113080752.1003793-1-lee.jones@linaro.org>
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
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

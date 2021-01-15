Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA47B2F83B3
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:16:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E1B56E4F1;
	Fri, 15 Jan 2021 18:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B446E4D2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:16:28 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id k10so8220133wmi.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ist2qaMcFyPJ0b0T5b259LCtzdvkGcAXrLj6GtIUIKA=;
 b=VQCHrIKm7/CTiVE6GNmynsfACZnXKCYS24SYjRRSWQ+0E7tkdGKZR2D8B5JfDmP19u
 Sp7x6uR0JcsH+gX+hBMcorqNaWjt5kkEZWiq1KQ9sX80mKilNN2fcQdYDB0sj0gQdIDM
 xOTymz8SN/aWa8nc0cbTl1fEvoUQazZGZwRF+pIykVYFRwLr4ceFAj0jc00u2CNhRSCa
 nMpG+Pbs+uD4PaxoIBC+uFiuituSY2qRQkU6wEblTpNd45QpRZS5M75KS2r/21r8df35
 p/BYCeY15O9TymDlEFBXeFShpazqpjehgB+1SSBuFRFbRNffl/gyA/2QXw3pZchw9M0n
 Tl3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ist2qaMcFyPJ0b0T5b259LCtzdvkGcAXrLj6GtIUIKA=;
 b=d4F4PnxgG1Wjn/L5bdyApYuJ2S1NPyPSbQ9bgwOE928zVxWPIJWohA85VGVu6Mtj87
 Ok11Ykw9BZQVP0IZ7yfd10WZFoQ9JLaBPT1Vh6MxYznZdI7KAz7SkoH/3OSG6ttXSUTg
 lhuyH+1I1el0YOgu/I28i4E21/uIb+xT5SK8GLG6thz096WEglLbmhN2uGhSBMomzzsK
 ZuN5MtkDaqxxz/R8cP1W/3y05LwxsbgAw0bk+BTGmQI/HK4FYwFSY19ZkEe0E7CWjOwi
 5xiIYX85pfDvpSZST2zG39rfxaWs31rAhJU+jRKmAGNAYe5y/XA67C5VFiZlQ2a3bWIf
 hJAA==
X-Gm-Message-State: AOAM533t2xua5HhH2VwV+D8FKcKg0z1diY03vyWlSN0g9r64no29z4aa
 lLFpfsVh1lPQB6abJwHPeC7plw==
X-Google-Smtp-Source: ABdhPJwsR4sddknZLa7jcLTBaIuE7RjisKawBK3M+o+x1MC/HL2jnakWZ3qsJqRtEF6Kzb7QNJ2M+Q==
X-Received: by 2002:a1c:3206:: with SMTP id y6mr9699299wmy.127.1610734587226; 
 Fri, 15 Jan 2021 10:16:27 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id b133sm14405979wme.33.2021.01.15.10.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:16:26 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 15/29] drm/gma500/cdv_intel_display: Demote kernel-doc abuse
 in 'cdv_intel_panel_fitter_pipe()'s header
Date: Fri, 15 Jan 2021 18:15:47 +0000
Message-Id: <20210115181601.3432599-16-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181601.3432599-1-lee.jones@linaro.org>
References: <20210115181601.3432599-1-lee.jones@linaro.org>
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

 drivers/gpu/drm/gma500/cdv_intel_display.c:559: warning: Function parameter or member 'dev' not described in 'cdv_intel_panel_fitter_pipe'

Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Eric Anholt <eric@anholt.net>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/gma500/cdv_intel_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_display.c b/drivers/gpu/drm/gma500/cdv_intel_display.c
index 686385a66167b..5d33022497793 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_display.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_display.c
@@ -551,7 +551,7 @@ void cdv_update_wm(struct drm_device *dev, struct drm_crtc *crtc)
 	}
 }
 
-/**
+/*
  * Return the pipe currently connected to the panel fitter,
  * or -1 if the panel fitter is not present or not in use
  */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

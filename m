Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB392F83B6
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:16:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E94B6E4FF;
	Fri, 15 Jan 2021 18:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66256E4D4
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:16:37 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id l12so4984704wry.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9TV73dkbBvGhpYcqV/fsQZ4aFFzm9GQ9Ij+MCJ8e6uM=;
 b=i/zt/gQYv4HPTEgigDPbzK2Sb8SUJRL7IwqdD7hFPeO2qkLDu/24pIG70vd9ZuU+W0
 Lrt1mvkOYDRxnyF/lyOXZQb0rzpNTrg6ZveP1TgBgt9kmvke+hgoBO32HxZxumR4YCZa
 zUZGTIO9HG1xj882ENS2TIHmY9+A2zxLK8Ye1lrhQmT883lWNnk0R1tNA017KP0nJYMP
 j+8q3slLwIBZGqMuVQ9zi3yXZpQY2ku7RCQbe0r7xY0TpuA4JzdpR/34xFJ2uYQ3fFmY
 jjnb9vOYAlekN9XmQOLpqaJXHBX+y5de9746UbCjrPQOVtvNU/D+bACTMJ6JcRGL6Mwj
 0P2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9TV73dkbBvGhpYcqV/fsQZ4aFFzm9GQ9Ij+MCJ8e6uM=;
 b=LJ0ywDYEA7ghBbFxA76Bie/5AhMPnRGO/GmNdra+LOaMJKJuIQwnPbZKT7ftJuQaF3
 is+tzyQY1uisffwMmPIJ0yZ1ZVvYKbcFY+eIpgWaYu66w2u0WsKMar5V6hG1lCWrCbAF
 DzI75KCJrtWZa9GcPl7aOJJPYIbx0hcn8hAy9MjC5BTEON0FiU6zLKXzNBdor6jZjEf/
 QekJ+cnicHFs4tywoJU9g8bnodBEqLqzjTduOftbMVPyhIxhPRDoZQZvgS3Ffs4tjWj2
 6RGEiL0rLkvqUZ7SrfPHqOrzuv7+uyUEs+/8GVsPwwiujPJgfWA7CRrRQeF5c2x9A4Rl
 8qPg==
X-Gm-Message-State: AOAM532x9qxY6UOdi5DikDnNxxhl8G4zkq3ygEhuOBEa4l40eljUKw9Q
 woHtJqmozAtkZwHhtdlBm94/yA==
X-Google-Smtp-Source: ABdhPJwK2z9xj2/F+s3rA1SnN2if5sf5QYP+Lg9GwrBJGP1CMAO9YHgp3NNc8Tx34w+6hNana7B4QA==
X-Received: by 2002:adf:e512:: with SMTP id j18mr14339992wrm.52.1610734596426; 
 Fri, 15 Jan 2021 10:16:36 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id b133sm14405979wme.33.2021.01.15.10.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:16:35 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 22/29] drm/gma500/mdfld_intel_display: Demote three kernel-doc
 formatting abuses
Date: Fri, 15 Jan 2021 18:15:54 +0000
Message-Id: <20210115181601.3432599-23-lee.jones@linaro.org>
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

 drivers/gpu/drm/gma500/mdfld_intel_display.c:103: warning: Function parameter or member 'dev' not described in 'psb_intel_panel_fitter_pipe'
 drivers/gpu/drm/gma500/mdfld_intel_display.c:273: warning: Function parameter or member 'crtc' not described in 'mdfld_crtc_dpms'
 drivers/gpu/drm/gma500/mdfld_intel_display.c:273: warning: Function parameter or member 'mode' not described in 'mdfld_crtc_dpms'
 drivers/gpu/drm/gma500/mdfld_intel_display.c:609: warning: Function parameter or member 'crtc' not described in 'mdfldFindBestPLL'
 drivers/gpu/drm/gma500/mdfld_intel_display.c:609: warning: Function parameter or member 'target' not described in 'mdfldFindBestPLL'
 drivers/gpu/drm/gma500/mdfld_intel_display.c:609: warning: Function parameter or member 'refclk' not described in 'mdfldFindBestPLL'
 drivers/gpu/drm/gma500/mdfld_intel_display.c:609: warning: Function parameter or member 'best_clock' not described in 'mdfldFindBestPLL'

Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Eric Anholt <eric@anholt.net>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/gma500/mdfld_intel_display.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/gma500/mdfld_intel_display.c b/drivers/gpu/drm/gma500/mdfld_intel_display.c
index aae2d358364cc..462aba8f75288 100644
--- a/drivers/gpu/drm/gma500/mdfld_intel_display.c
+++ b/drivers/gpu/drm/gma500/mdfld_intel_display.c
@@ -95,7 +95,7 @@ void mdfldWaitForPipeEnable(struct drm_device *dev, int pipe)
 	}
 }
 
-/**
+/*
  * Return the pipe currently connected to the panel fitter,
  * or -1 if the panel fitter is not present or not in use
  */
@@ -263,7 +263,7 @@ void mdfld_disable_crtc(struct drm_device *dev, int pipe)
 
 }
 
-/**
+/*
  * Sets the power management mode of the pipe and plane.
  *
  * This code should probably grow support for turning the cursor off and back
@@ -599,7 +599,7 @@ static void mdfld_clock(int refclk, struct mrst_clock_t *clock)
 	clock->dot = (refclk * clock->m) / clock->p1;
 }
 
-/**
+/*
  * Returns a set of divisors for the desired target clock with the given refclk,
  * or FALSE.  Divisor values are the actual divisors for
  */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

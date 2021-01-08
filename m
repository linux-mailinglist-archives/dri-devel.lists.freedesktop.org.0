Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB9E2EF8B9
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 21:16:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AAE76E8EE;
	Fri,  8 Jan 2021 20:15:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E9106E8E3
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 20:15:53 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id g185so9442330wmf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 12:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0meb7DEluI5lCKKHhFh+KkZgGQmTED8UYQgsHtPH9AI=;
 b=b+8BELUy6TYHrFE+ojlTD5o+vZ/tEQjDu8czZAvyrxub0pcI6chJUoZ2lCPjCPjABv
 9+quXXFHdgT6Fpuo23j3qGFJi++XkryIYAjEaiCDSGXtAvRT9g1+Br7tew2FKxP4QU07
 gLqxjq5/JKGeu+mhZHe5oN34VfOToSNyGQZvfc3QyL3AhJpOP2PyMwkzdeDcf3JXETdM
 +H/AiCaoEElkLOGti7xyPj7B/4lLWROEMkhiKh6Nzrryo1rOp18oWdsPR1pU6AukN/Qa
 Xukv2856sxNpzczu/PirBr3Ic93WgRUohpIWkUXjlu+/FzLwF2/0auSZoWOC7qcY0LVT
 IPhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0meb7DEluI5lCKKHhFh+KkZgGQmTED8UYQgsHtPH9AI=;
 b=o1MekUoVCZmzJaDM2c8sJ6OzXFKk7vFLDm/iCdEajeKnt0J1d7lsfMTuo72X6AOAQM
 phKGNSDhJ14ItYdDRucfYEmpGb7yOsNvgpFtWz1Ydk889rmGoiGgTBQvCwlX6LW68p9e
 ZePN5WOhSkSwT0m6NKPgd6HhnTu6fghJedEP/FEJhaJYR6qUjRDy+qXTrEctvWhzUoc0
 LSz4Xj5pHfea7rmUeiR2AHlRRqZNttVoSXR5nIgpP7qOtqqQ+tRRkOC47ZL7+A3QrOgD
 P8dSML5/wtPKMofkGBTNpljt73BgkAwXPk1QEy0Y5/sCiudVFR8EoENT1ge+OK2+lyfZ
 4zCQ==
X-Gm-Message-State: AOAM533JQxg8Ey9ZvDC8j0rfGP5m2vlejThODGUPOgZODdWVm6RlLU5k
 hJumSGNX5S1b9YuM/e5b6F2ARw==
X-Google-Smtp-Source: ABdhPJypNc1DfLCl8VxEr0OvMckgJB9nFs1wGhAwDJWr8F5fydgjX/rVMxJA/ROmsyBPaHHuB4ie4w==
X-Received: by 2002:a1c:1fc2:: with SMTP id f185mr4612278wmf.134.1610136952039; 
 Fri, 08 Jan 2021 12:15:52 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id l8sm15598671wrb.73.2021.01.08.12.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 12:15:51 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 33/40] drm/nouveau/nvkm/subdev/volt/gk20a: Demote
 non-conformant kernel-doc headers
Date: Fri,  8 Jan 2021 20:14:50 +0000
Message-Id: <20210108201457.3078600-34-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210108201457.3078600-1-lee.jones@linaro.org>
References: <20210108201457.3078600-1-lee.jones@linaro.org>
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

 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:53: warning: Function parameter or member 'speedo' not described in 'gk20a_volt_get_cvb_voltage'
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:53: warning: Function parameter or member 's_scale' not described in 'gk20a_volt_get_cvb_voltage'
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:53: warning: Function parameter or member 'coef' not described in 'gk20a_volt_get_cvb_voltage'
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:69: warning: Function parameter or member 'speedo' not described in 'gk20a_volt_get_cvb_t_voltage'
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:69: warning: Function parameter or member 'temp' not described in 'gk20a_volt_get_cvb_t_voltage'
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:69: warning: Function parameter or member 's_scale' not described in 'gk20a_volt_get_cvb_t_voltage'
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:69: warning: Function parameter or member 't_scale' not described in 'gk20a_volt_get_cvb_t_voltage'
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:69: warning: Function parameter or member 'coef' not described in 'gk20a_volt_get_cvb_t_voltage'

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c b/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c
index ce5d83cdc7cf7..207e5278b37ed 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c
@@ -45,7 +45,7 @@ static const struct cvb_coef gk20a_cvb_coef[] = {
 	/* 852 */ { 1608418, -21643, -269,     0,    763,  -48},
 };
 
-/**
+/*
  * cvb_mv = ((c2 * speedo / s_scale + c1) * speedo / s_scale + c0)
  */
 static inline int
@@ -58,7 +58,7 @@ gk20a_volt_get_cvb_voltage(int speedo, int s_scale, const struct cvb_coef *coef)
 	return mv;
 }
 
-/**
+/*
  * cvb_t_mv =
  * ((c2 * speedo / s_scale + c1) * speedo / s_scale + c0) +
  * ((c3 * speedo / s_scale + c4 + c5 * T / t_scale) * T / t_scale)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

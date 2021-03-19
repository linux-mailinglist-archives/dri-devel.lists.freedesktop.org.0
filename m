Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5301034175C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 09:25:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53BCA6E9A8;
	Fri, 19 Mar 2021 08:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FCE46E9A7
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 08:24:50 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id l18so1538639edc.9
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 01:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QN4aBNwxKOCABxwfpyuG0Xk/7oUm3WT2PgkGnXFzadY=;
 b=xWnz3znjFX0tNlW97leA+LZR30kAS4pJ8PYHiwxM/+iY/SDaIbTj6tWToOXKAZNWUw
 3Fc8+e74T6Vu46ecZ3bBMYpLvi60D6XBeSEfImpnAHgWEoyGx2x7vu9tVcgEsKTnkJB3
 Z0uLIUTCwAaSFxopOOrNDj4nSHqdQ/XfofC89C+sKyV97q9eUBvjxq5/89nvlo2QB9rq
 9aNacsmrTFvmNCUC456ULATHyldGtn4gY9hqJeg2Rb9UUy2m6ovSXOV9dOycIsIfINVD
 Ka6tGO2ZRhIOVH1CpnUY+l/ra1+5xL3x4JO8o0swlS0Jn9HnkFWNtCQxWTBAWVH5rlbE
 +UMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QN4aBNwxKOCABxwfpyuG0Xk/7oUm3WT2PgkGnXFzadY=;
 b=AvWzpNoAIP4Or7NZj/MX6qSTnj/OY7CJ85zHvq8xXANYV/KqMdFiwxQdQ9Wj3LGqGr
 nsX2NZvioWOLb9sLzrhJKTY1+cgbi+hwbXIB8gX0b+SblBWvE/0W0gzSjM7J0MX2JQ4y
 tnLuaskAOf4vOVNzsPo0g4H6E+So/H42bbAtbeJ67l8jGUea7+fmNGEHLYgen3G7VsHK
 I/7jy5rpdIFNflu0v5s+EHUAGfvFcJge2CJKFtJ0xmlt3T4jmBM6Sw9lcB3k7zXfpTt5
 CX7GrERDz/ms5u2u91Y9iVGo1jZkkn8RoxgrIRE0Nub3zg+ZxkIAQtPB3guIvWj+7jEW
 yRiw==
X-Gm-Message-State: AOAM530A+c/zAwKFhkuNc7wFNiQM2CGTHLwxiwUcR3GRz0xPnNY0yswx
 1xopIelDKqCBBvezhEErqVfIuA==
X-Google-Smtp-Source: ABdhPJwscQWu+LWU/WdUY0149XPKN1oU1qX01NKk8VcKSVszs01UoBJnFfmsmVlA0SKHNDd4ocW6yQ==
X-Received: by 2002:a05:6402:3486:: with SMTP id
 v6mr8079033edc.109.1616142288680; 
 Fri, 19 Mar 2021 01:24:48 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
 by smtp.gmail.com with ESMTPSA id b18sm3273727ejb.77.2021.03.19.01.24.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 01:24:48 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 17/19] drm/nouveau/nouveau_ioc32: File headers are not good
 candidates for kernel-doc
Date: Fri, 19 Mar 2021 08:24:26 +0000
Message-Id: <20210319082428.3294591-18-lee.jones@linaro.org>
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

 drivers/gpu/drm/nouveau/nouveau_ioc32.c:2: warning: Cannot understand  * file mga_ioc32.c

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/nouveau/nouveau_ioc32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_ioc32.c b/drivers/gpu/drm/nouveau/nouveau_ioc32.c
index adf01ca9e035d..8ddf9b2325a42 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ioc32.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ioc32.c
@@ -1,4 +1,4 @@
-/**
+/*
  * \file mga_ioc32.c
  *
  * 32-bit ioctl compatibility routines for the MGA DRM.
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

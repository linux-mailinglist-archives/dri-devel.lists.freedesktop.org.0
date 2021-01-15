Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2747B2F83B4
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:16:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B84126E4EA;
	Fri, 15 Jan 2021 18:16:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8276E4F1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:16:42 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id h17so8036847wmq.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o2fukyLsotnyIO21hCJ1A0IUQV1SfrYh5wzz8JhsiiM=;
 b=gkPe4zQRnTIJ91SOxape8cRj/kO69GrgNLCMZTar3f1vt1Iv3INiFfoVT/oT69muaj
 rHbC4MoocQB7oWOMyPqd0PhTRoQrUybhIJLleeThAjJh18c5LtKtkskEoMwL6Wuee68F
 689gPeMLG2RIQCe4fo9R31pkp70ba6oPxfJqOwx6qAR47rC48hB4caKDT8H94DTWCTFM
 uxAQaIEviR4XWvzlJzuwiKcqwWIPfU3snEV7oGmY4Rjl/jAiKFLgX3o1KUw1MBF8HqeI
 HhcEfG6nCehTgn+SEwB9xYOy+m3bHhHzLpxfoK07S+mnsD04ZA9qMElbH3zWxlJrVoLZ
 eLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o2fukyLsotnyIO21hCJ1A0IUQV1SfrYh5wzz8JhsiiM=;
 b=OomOGozfslNfnOFQrc+Dt/DYkNC+VW3H/FRN/4660wDWsiK7dtZMvkbGsuB5PS6oEi
 y0RPhEKUvvu6g6GWSbFayQvcaa5OyOp9437cN5eUlw1rbhR+BvFtgI3pU4GzKYbzjSNe
 4KraLOA68x+whfaBXzd7FkMktf8AqCYeo7lHIfC5CTOTHbwXNH0neoT3OXbJiukqJw1N
 CuJbE52uHThPXNxyLjzPU5nUM8BH5gAA/dgkfmEDQHNGlEZ0VrU22DXLHW183A7Ae40B
 OlacvQgSIpQHu/sC56oZbK8d8URyWCZcn6m0I5xfDlWyTpeSsHP5AsLubDrSKRvlFPNN
 0ezQ==
X-Gm-Message-State: AOAM5317feeBTIBpPKxhN71WD1EEV0uf9ORvupg6uE7FSDomMj0Jjibp
 XNTijxbLz9L+6vAH70Tm9lfHIQ==
X-Google-Smtp-Source: ABdhPJwzAFS7Be8VkrVoNQgvyVh8GdN8DIxgBCBCbQEv+K0i2fq9aZe2mXAbWJUOB6yMre/SnSy8Gg==
X-Received: by 2002:a05:600c:2742:: with SMTP id
 2mr9826336wmw.94.1610734600647; 
 Fri, 15 Jan 2021 10:16:40 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id b133sm14405979wme.33.2021.01.15.10.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:16:40 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 25/29] drm/nouveau/nouveau_ioc32: File headers are not good
 candidates for kernel-doc
Date: Fri, 15 Jan 2021 18:15:57 +0000
Message-Id: <20210115181601.3432599-26-lee.jones@linaro.org>
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
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

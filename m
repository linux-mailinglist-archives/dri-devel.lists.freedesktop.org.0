Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F00CC296ED3
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 14:23:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1274F6E5A9;
	Fri, 23 Oct 2020 12:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E31C6E578
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 12:22:51 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id t9so1555126wrq.11
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 05:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zNLsePzx9q992VMUFr7jP13mOUJ18X4OgZGDXlRd89Q=;
 b=c4+Wt0jZWdUsbBCRJW2m5SqYXFEjUMqnB7DwJiDwC4SE8llY5gbhPUKL4RpvHt7iak
 tT9ENSQcUCu68HFHANbDr5UvPr/h5eJkIG0N3B733nAaDlc8iO1BwfbBOlcH6kKylnwk
 Ryr0bpXTAaQTpKMVJe3DJrLiewdSxeQG/cFwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zNLsePzx9q992VMUFr7jP13mOUJ18X4OgZGDXlRd89Q=;
 b=og+gOPDytkxUUk+ikiC5KKw6foy1ol/a7zfbMLM/l3oWk6slHLjSxXl2mn3M3WVoLL
 UsVXhHdSeB8N9wDNuthtKjnE80s3w1D8Q7V6F3ikC3j9YtvARoW1zVwBZpYWLiLL+HkW
 rUTlhb9L1zL7AywrIQeI+Ej1+pbwBuCM/FnRIlqxG9BvEJ5/28dpPDxPxLjchNI2XiyK
 +qtS8jkWTfWz8PDyMmP/LrCCD5IV9R/imwFxALqAAClu/PCxZ0at1v3udtIL0Zs2Fi94
 zID/xUHOivkMkItxf9TZjKfUoYPhBtWrz3wgj9skvqBsf85tefNzw7GL4Sh/YPgx635X
 UNZg==
X-Gm-Message-State: AOAM530QC6kivVO5Vy0dUNv1ze1b32NoydYUj8jFTD1GB9twmrpOS4s6
 S+LGY7YqxKIKAWhW8UKgaVPyFkQ4jMY1X++I
X-Google-Smtp-Source: ABdhPJzoiQot47ZpCJS2Cvb9SYJIeWWev2nIpe012aky1wGXlk6HifOuXL9F7qCAFLgVwFQZd9UZPQ==
X-Received: by 2002:adf:fd8a:: with SMTP id d10mr2235560wrr.85.1603455769576; 
 Fri, 23 Oct 2020 05:22:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y4sm3056484wrp.74.2020.10.23.05.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 05:22:49 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 24/65] Revert "drm/i915: Annotate dma_fence_work"
Date: Fri, 23 Oct 2020 14:21:35 +0200
Message-Id: <20201023122216.2373294-24-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 7fbc6eca6f0db8244cddc39471d71471a2f30254.

I need working lockdep back
---
 drivers/gpu/drm/i915/i915_sw_fence_work.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_sw_fence_work.c b/drivers/gpu/drm/i915/i915_sw_fence_work.c
index 5b74acadaef5..a3a81bb8f2c3 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence_work.c
+++ b/drivers/gpu/drm/i915/i915_sw_fence_work.c
@@ -17,15 +17,12 @@ static void fence_work(struct work_struct *work)
 {
 	struct dma_fence_work *f = container_of(work, typeof(*f), work);
 	int err;
-	bool fence_cookie;
 
-	fence_cookie = dma_fence_begin_signalling();
 	err = f->ops->work(f);
 	if (err)
 		dma_fence_set_error(&f->dma, err);
 
 	fence_complete(f);
-	dma_fence_end_signalling(fence_cookie);
 	dma_fence_put(&f->dma);
 }
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

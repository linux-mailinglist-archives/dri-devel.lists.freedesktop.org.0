Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F865379344
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 18:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3216A6E503;
	Mon, 10 May 2021 16:00:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B13E89F77
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 13:16:55 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 cl24-20020a17090af698b0290157efd14899so10303333pjb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 06:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+ua8K1EdEgu+P2D3MHGhK9KL8rinnu1K5br5+Hr9m6Y=;
 b=RDUoseO/yhqyEsZbGXXurk2NNaM/ZRrpkxCM8aTex4vRWf70nD8z4zCqKTqj9BdJ3J
 TpogAD8aGRQgyXqm9oZwLxX/GTPoWvcy2iHT5JGjsAr8MwAHnjeEG8/8lzKQCGrJQ2q+
 vJSKUcWLCw3XcfELal3+gMlrMYx2MAKyiJRuarV1076vTQ4zy9oiW6paNVc5vz+PiK+a
 1kpGJiWyb1NaBlpDi0oZ5QBKzPsq0D0q8UsMaduK9798eOQcKKFAZPu9nBU7Yw9BamTi
 Bg+okM9q3yJwpxrOJP0GCKwMfOAWlZtFZ3TRcAgRGDhlc523Ca99+2CCq8NeXyHiX1j/
 mFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+ua8K1EdEgu+P2D3MHGhK9KL8rinnu1K5br5+Hr9m6Y=;
 b=KGArBoLiLVozNFS7eXDg9WPfmOZFB2nUMDidGwFivatR8ynrh/RpFRnAssKRJHuP+m
 tmceh4SBQIJic0qywO0eROLeAuDVmVL58Iyx30YWuKMNZcKoyKN1P5XSqr+1MR645XmI
 5nD/PVY23+xM+rv/3rjBvDTjIjehTf5UZBqrOBoBYogfu7Mk3PGMOOk/mMJpm6rl0x6j
 ieCBWwe7XgruM587SEuKmnkVr3v8HwQvBm8NCW1NFG2BzZptQ86FURrfUp+6xJu+LQ7v
 4O2do63uuMZcEFaiGrt1V0c6wSInURDCLqttOGKzsB8OtoXEa5UfKTvyv2N6tNfAu6gR
 /QEg==
X-Gm-Message-State: AOAM532908zhUNuYFhC27mSZrsjrQ1ekjGB+yaZ3EDGKKfcjSLUzCO3H
 TWymNYzZ9mDoyyU8tKZ90LlIHxBXG4ursvRWYD4=
X-Google-Smtp-Source: ABdhPJzsBsSQPk9E2Ceyd+G4hkbvWXHGgfT2Vt+wSorlF942NRObmE0ekpytDqr8raVf/gs3421t/g==
X-Received: by 2002:a17:90b:3686:: with SMTP id
 mj6mr41167040pjb.116.1620652614991; 
 Mon, 10 May 2021 06:16:54 -0700 (PDT)
Received: from novachrono.domain.name ([223.235.208.114])
 by smtp.gmail.com with ESMTPSA id u1sm11320991pgh.80.2021.05.10.06.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 06:16:54 -0700 (PDT)
From: Rajat Asthana <thisisrast7@gmail.com>
To: mripard@kernel.org
Subject: [PATCH v2] drm: Declare drm_send_event_helper static.
Date: Mon, 10 May 2021 18:46:16 +0530
Message-Id: <20210510131616.544547-1-thisisrast7@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210510123243.hmwar3swmrewskjs@gilmour>
References: <20210510123243.hmwar3swmrewskjs@gilmour>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 10 May 2021 16:00:22 +0000
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
Cc: tzimmermann@suse.de, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rajat Asthana <thisisrast7@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Declare drm_send_event_helper as static to fix sparse warning:

> warning: symbol 'drm_send_event_helper' was not declared.
> Should it be static?

Signed-off-by: Rajat Asthana <thisisrast7@gmail.com>
---
Changes in v2:
    Provide full name in Author and Signed-off.

 drivers/gpu/drm/drm_file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 7efbccffc2ea..17f38d873972 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -786,7 +786,7 @@ EXPORT_SYMBOL(drm_event_cancel_free);
  * The timestamp variant of dma_fence_signal is used when the caller
  * sends a valid timestamp.
  */
-void drm_send_event_helper(struct drm_device *dev,
+static void drm_send_event_helper(struct drm_device *dev,
 			   struct drm_pending_event *e, ktime_t timestamp)
 {
 	assert_spin_locked(&dev->event_lock);
-- 
2.31.1


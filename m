Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 001E8BEE670
	for <lists+dri-devel@lfdr.de>; Sun, 19 Oct 2025 16:13:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F0510E10B;
	Sun, 19 Oct 2025 14:13:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a37/LYU4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF77110E10B
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 14:13:00 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-63c76bc4b83so9033a12.2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 07:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760883179; x=1761487979; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OLOKqWlJM+Qls3gDoxvAM4+OyQdsVVtIrTMnLe6+7Bg=;
 b=a37/LYU4ym8efD08ZB9ZSbJKJpVOoaBCiIFWnCDo64zT3bbJ3i7uS/vNFdswAUyGNk
 mXYzrqhlHRsDHNVxv565BMiZlJCZjQt2ZURh5M2BDWOXqaG7qKAtOQU2por69Z6xsBuY
 oLg2uLgJ8RDXdcwJqVZqNmBEBTLoH78i7WGFXn3S/ufIIrJIi6OkFfm42xZrhNSFjXkI
 o7I/3/N1zILFT02t+4pnbmfiEUY81O9oOHKy3Q7wYJ2QKv6viwOEctYAzUQ5baW5GmhO
 zXn/9PwOQTHvC5ZDTQyCj1v+hGcK4JUqjKdd+PcHIEvBEyJG3tVB6mo9RsHiUK0L1H4N
 L4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760883179; x=1761487979;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OLOKqWlJM+Qls3gDoxvAM4+OyQdsVVtIrTMnLe6+7Bg=;
 b=iiifN/Aw09B5Dd188W115IfheUCm5lkKIO9oay5lHHs9ugS2IJ3axJq5W+c6SMt7yd
 fqAyuyj0lTmDfhgHuPFbTdIF1X7Aly3HJj+kBVDGcmqWvAjupjCtMRlaV7tHamOukwIr
 rcaE/YgkPwRPlIzcC/A0S6T2g36L9nAdGYH7nTnwZDZNcS16yCY3w7qzXtf0SnK48Zhr
 rBtNIQ25zMYNClPR1GO2++oBCO6MhcN4gjKMtxGw2dmWz7VMswU2X/NM7CRov36vcqA6
 8lCSX/i9sgViJ2Ay9w41W8V0BUIRMcN4C1hZxH0cMmNlxCdr8UsV9wrMCUc8C3ZhTmNr
 2hbQ==
X-Gm-Message-State: AOJu0YysLGWOfY8BcquQJZqNJVZ3H24WXL8xUIc2GCUFwI96VdPhupvT
 9uLcXUbaK9rfrb3AkJHgn9Jf+D13kQ3Cq6gspiASthsgfLMFDS6QDLk1
X-Gm-Gg: ASbGnctmdu6HZzH9Vgw5Dojo4G2lS81hYPE9S0acr6lR+5T5L8dUrPGFPTWyBbt88cQ
 60Xyz9W66g+WSHVokhPayR6U2xU+cOdPaKfvodNNmtSZ318y4g6L4GaSrxnekq0G8eoZfW0SFX1
 Lpx4ggyBBrbmy7Zgn7LWWoDtJkM1/s42uSTpNef/uc9Cvd6fTj+DyltIChi6vkclgsbXGDN9/gt
 paw67DuG4qyThtQbos6M3Qa+3WrWpjK0+rymSkZhfoY4sDD1UKsPWcMdh/AxDXn0z+NwaqYszRY
 P65gevnKII1Uo7Dj7LXNau7YqwrQJD69B3jNDqonuYpMxb0IPdecx8MUPutYVbga1UOYI8XPAoB
 bHl2/R9AUjhhKbRtAZjsf7QIUK8Q8owOBqt1NMu84G/YmWg3fh94KbVNC5PZFVrr0LzjoZC3Z12
 RBZAI1
X-Google-Smtp-Source: AGHT+IF6kFqxZjmdvkiQmumLp5yXtfBfsGWcBoAvxoX6/vIZKFSk3vlT0KQXPw3Y30vQ7ooRKt1BnA==
X-Received: by 2002:a05:6402:2681:b0:634:52c3:20f5 with SMTP id
 4fb4d7f45d1cf-63c1f5738aamr5377085a12.0.1760883178967; 
 Sun, 19 Oct 2025 07:12:58 -0700 (PDT)
Received: from bhk ([165.50.121.102]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c4949bfd3sm4212111a12.41.2025.10.19.07.12.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Oct 2025 07:12:58 -0700 (PDT)
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
To: lanzano.alex@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Subject: [PATCH] drm/tiny: Use kmalloc_array() instead of kmalloc()
Date: Sun, 19 Oct 2025 16:12:28 +0100
Message-ID: <20251019151247.171558-1-mehdi.benhadjkhelifa@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace kmalloc() with kmalloc_array() to correctly
handle array allocations and benefit from built-in overflow checking[1].

[1]:https://docs.kernel.org/process/deprecated.html

Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
---
 drivers/gpu/drm/tiny/repaper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index 4824f863fdba..290132c24ff9 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -534,7 +534,7 @@ static int repaper_fb_dirty(struct drm_framebuffer *fb, const struct iosys_map *
 	DRM_DEBUG("Flushing [FB:%d] st=%ums\n", fb->base.id,
 		  epd->factored_stage_time);
 
-	buf = kmalloc(fb->width * fb->height / 8, GFP_KERNEL);
+	buf = kmalloc_array(fb->height / 8, fb->width, GFP_KERNEL);
 	if (!buf) {
 		ret = -ENOMEM;
 		goto out_exit;
-- 
2.51.1.dirty


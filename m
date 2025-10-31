Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BB3C254DE
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 14:44:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE0DF10EB56;
	Fri, 31 Oct 2025 13:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JrsDq6gL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D5A10EB55
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 13:44:51 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-475e01db75aso15117365e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 06:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761918290; x=1762523090; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ag5FkbZtay2eYReP7iBnTnWXSWPnI35nFvt7qbQnJDY=;
 b=JrsDq6gLIcRFGga6IZ9fqnorsjia/0PAlhUONyardc2sVwoZyads3zIpOmdu2ViJMb
 OnsAZc/qMWgvrDBgWMgnro5sGtOxVhfJtwc4jbekHZV2tvU3/Yi8mVLruIfawSEMc5ZA
 aV9wfy2BA1GzEbLuxjomipmWCCZUGu7wyDdmHUOsgmowO0TLc6CO32nxiIBdUjGkEIyn
 pxsyrK5Xh/wPiUmUgk4ePfRjHO5oDidvlV0AhTCwPhWWpipLNYyLpS94w5f5pny/uWS9
 ZCAT1mlK+IhkBX6joYvV1Kp0VbuT9kO+LbNgZImSoO9sB4GMq7u/DajQd9OU9pHacr+9
 5Eqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761918290; x=1762523090;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ag5FkbZtay2eYReP7iBnTnWXSWPnI35nFvt7qbQnJDY=;
 b=bxjV46QwlaQR5lsT1FajkUnDkjYsK0W7766/Cfh/EOibkmxyP5XIIV4pGgwTjHz4Wh
 j3MDCh6qfQr8eSFuNxUXS4QnhDqI6Ceg7fjahvqTv8gDLvls6546hsCid2RFCV1EaJPX
 HCzWjeNlc0ZRfb+e4oaxR65Z00HJvB66DuDj2mYfyBguC4Y+OO6x5G4UnU2fqKjjXpCK
 zEDIZuFwLBU5pw3UVSX81ouky+ZF+I/7c2duOIoaFc9kqOCoW14ljw+wXlbxuWlVECrg
 q7BZMSUhB0l5x2f07eKHuezu4TRGDaPnFYXSO+7UgToDvLOuv7Qouvf/FwAYSSDhY84u
 zHCA==
X-Gm-Message-State: AOJu0YxrRJwnHByOytxncBAj4N447pxAHKhQlrQebwRHLsfi+ItJHRtI
 FgwHnSpS0nyjHFDXacuJXwWnfauqP0TpowADxZSytgpPyg4bKfBE58ki4fHuE8Dr6Zk=
X-Gm-Gg: ASbGncvdyX4hN68sOpAPnGXwQJYb+pjWkl1sYFbWzhkPR0ZBC21UHFHhm7uxot59ln8
 nXJoIJE2/QxPS9TfOcyiq4KVNQEll+vGSX5zFQclvZEtNsgR4S4zpu6dDjRY5K2WWC5nsjh3GAy
 +l6ikjfH6XVfeDenVbUr+k+weAYiLFQCwQwBaTzTWBDmEXKngPCJWmQ8xxML/kjDQaNiQgYO2P0
 E7ojUOQF3bFZrCc933OrcynOE6DM/kVSI/0sK51WYjW+A9CAZ/OnG2mXOr3Vr1BuwBU7AOhhO/+
 SDB8ZfCK6mxcY/1/pwC37s/GNXoY4PLtYI9ffHqmWjWVps5PQ7n2RZxyAAsRmCkAgadwARUK6/t
 F26kx2fpY3EZghdkQDX/rm3oz41ZajQBvioQReUelxhBosi/SIP36XELlkfEj0s5RbtymXFT/7g
 l2frVyan3ri/xzK1h9EK3H25Zu
X-Google-Smtp-Source: AGHT+IFkbldy8xg68PffupyHqmyaNVMQ3g8iX3n65HmihoTKQ5OEIUFxTJf4S7hJ5dPJRm+hfyZiCg==
X-Received: by 2002:a05:600c:1d9e:b0:46e:37fe:f0e6 with SMTP id
 5b1f17b1804b1-477308b0b93mr34279835e9.30.1761918289395; 
 Fri, 31 Oct 2025 06:44:49 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1599:7d00:73cb:d446:bf90:f1c0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47732fe119bsm34502635e9.10.2025.10.31.06.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 06:44:47 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, airlied@gmail.com, felix.kuehling@amd.com,
 matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 01/20] dma-buf: cleanup dma_fence_describe v2
Date: Fri, 31 Oct 2025 14:16:35 +0100
Message-ID: <20251031134442.113648-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031134442.113648-1-christian.koenig@amd.com>
References: <20251031134442.113648-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The driver and timeline name are meaningless for signaled fences.

Drop them and also print the context number.

v2: avoid the calls when the BO is already signaled.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 39e6f93dc310..cfa6ddcc1278 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -999,19 +999,20 @@ EXPORT_SYMBOL(dma_fence_set_deadline);
  */
 void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
 {
-	const char __rcu *timeline;
-	const char __rcu *driver;
+	const char __rcu *timeline = "";
+	const char __rcu *driver = "";
+	const char *signaled = "";
 
 	rcu_read_lock();
 
-	timeline = dma_fence_timeline_name(fence);
-	driver = dma_fence_driver_name(fence);
+	if (!dma_fence_is_signaled(fence)) {
+		timeline = dma_fence_timeline_name(fence);
+		driver = dma_fence_driver_name(fence);
+		signaled = "un";
+	}
 
-	seq_printf(seq, "%s %s seq %llu %ssignalled\n",
-		   rcu_dereference(driver),
-		   rcu_dereference(timeline),
-		   fence->seqno,
-		   dma_fence_is_signaled(fence) ? "" : "un");
+	seq_printf(seq, "%llu %s %s seq %llu %ssignalled\n", fence->context,
+		   timeline, driver, fence->seqno, signaled);
 
 	rcu_read_unlock();
 }
-- 
2.43.0


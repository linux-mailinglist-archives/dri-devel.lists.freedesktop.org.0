Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B99BD38EE
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 16:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEFE510E46F;
	Mon, 13 Oct 2025 14:35:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UCJJA4fh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 627BE10E0D7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 14:35:07 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-639e1e8c8c8so8180700a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 07:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760366106; x=1760970906; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XQtHjJp1O7GpUAzN2iykGYE0b3+FU8GN7LOq9lJ7IHw=;
 b=UCJJA4fhybiTQH+ckuDJKATmhg4kTPpXQUS36OvHCjyC+hm2lSXulyhtygcf5MRiNl
 Ki+TR7911YDFbqj2ZwFscMmP0LCxo4KbRYdhs59EeTRx9QY3zWUj7vyyyh4ow00kGqyi
 VnTfVBokW2cSBxaDy6xe48IpzvCRskC5VwmSNlxBKF/4zjBuR2+u7BeoPJq1oE+WQvoc
 5rmlYjLzKhmYn7wdYMeZB6Z+izauy0b/sf7FcsW8HVULrU6o0FCMQ4qNRlyAmSuqAt/E
 XKcVJl9CMH6Zpv5Dx3HooAQbqhbZMrgIeofFIGDV2iV5Qts7B6yjA9kYiE/gJedoAI42
 7TFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760366106; x=1760970906;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XQtHjJp1O7GpUAzN2iykGYE0b3+FU8GN7LOq9lJ7IHw=;
 b=bjAyqRd2iIqJCMo8zUQnDtAj4XyfGuOw4eTdIcpgd99H1ehY6U7Kg7ivSLZyNWKvDV
 2l3CjdyFa3Y/3hBsBu8VGj+WIBU9WjmCO4jwQ+m8EnBPQKQwPvYAvSJq1KKwv3r+dvhB
 xrFFk7bco/tTWcwci0cpwdY6eFSZByzaDqiKm/a2b5C46wLxfw3WogTEaQmEctIgvqmk
 WSiWHnwSJAL+QikPaDYRERce37XFFztXkQn+u9c3v6piyJFTIrJaNXGU+BlFTTWN67+m
 glxDb5e/EuEGcOQgydcaIphc8AjF/ir1TBE4+bQXzRzSH+kBc3Anms7OYhcWZbj6XRmM
 tJFg==
X-Gm-Message-State: AOJu0YzLe32jT2/SNQbYlM16RYsU3TVq0zDy+kXLg/VqoS9lx6aELz5i
 1wYt5HQCcBzxkKGTi1i0exqehMcxkdz7Wk6AT44y/gHEThDpoEA8xUI5
X-Gm-Gg: ASbGncseJhzJ2eqE/7erma5LWEA/odQ619gjTY74eGXbl4WFlHNI35N4Mo0aZRRAr2z
 /ehbzT0nm0bizVJnSrzr0q8nP2Q9kW35Qx81BAc86Qgkg3tHA9YvhnT69utHf+MtI4qEOwQ8YKD
 hytpHZW1YHxcH8m9h+pIyZfFaeoQmvmt79P5OsmfFqrvjhhe3v53oeUhfBsLARz1WzbZ36E79Kb
 TR+WaLjghT11CGEQgxpuJCE6Tw+Dwf24RRJuyJLZMO/jCdoftgADR7C5RNdYyUoEVO/ulND5gxM
 FMM+k4WvY3YaqUcgYf7nAJXEN/ISYc90YouoCr5Akpm2h+2FsK8CmKYrqazPM9XPwDruloXKN0c
 18Bv8O+h9Bd09yTw80NquvHu2uBK3okBWgVCYWLpwo5rzL0tS8knLI5Q=
X-Google-Smtp-Source: AGHT+IGIi7Zl6P+yRsWAAfp4mosqDDBFQEEBdgfFdC6fr3sC/6OUGUGBlLtDGHhY6yklOfAgGtpqKg==
X-Received: by 2002:a05:6402:5645:b0:637:ef70:a111 with SMTP id
 4fb4d7f45d1cf-639d5c5af44mr13661304a12.30.1760366105827; 
 Mon, 13 Oct 2025 07:35:05 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:151b:dc00:15d1:ebc5:76e6:730f])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63a5c321453sm8942037a12.39.2025.10.13.07.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 07:35:05 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 01/15] dma-buf: cleanup dma_fence_describe
Date: Mon, 13 Oct 2025 15:48:28 +0200
Message-ID: <20251013143502.1655-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251013143502.1655-1-christian.koenig@amd.com>
References: <20251013143502.1655-1-christian.koenig@amd.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 3f78c56b58dc..f0539c73ed57 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -1001,17 +1001,18 @@ void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
 {
 	const char __rcu *timeline;
 	const char __rcu *driver;
+	const char *signaled = "un";
 
 	rcu_read_lock();
 
 	timeline = dma_fence_timeline_name(fence);
 	driver = dma_fence_driver_name(fence);
 
-	seq_printf(seq, "%s %s seq %llu %ssignalled\n",
-		   rcu_dereference(driver),
-		   rcu_dereference(timeline),
-		   fence->seqno,
-		   dma_fence_is_signaled(fence) ? "" : "un");
+	if (dma_fence_is_signaled(fence))
+		timeline = driver = signaled = "";
+
+	seq_printf(seq, "%llu %s %s seq %llu %ssignalled\n", fence->context,
+		   timeline, driver, fence->seqno, signaled);
 
 	rcu_read_unlock();
 }
-- 
2.43.0


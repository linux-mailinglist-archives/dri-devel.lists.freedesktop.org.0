Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FE0A3116A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 17:31:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C6210E70F;
	Tue, 11 Feb 2025 16:31:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WHW1SrOU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E78DE10E285
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 16:31:14 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5de5a853090so7394789a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 08:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739291473; x=1739896273; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cB9GGK9j287qQwW682FU+FnOXGITaIfNkLXZoLCeIRg=;
 b=WHW1SrOUf9ApKWejso/qaBezeUMeXynTMfHyLQ3e84nRnQo67TlnTT9459+GGsa/JK
 YZOswQanZ7Yn6MSIRhUK3eESB6kZ+gTw4IeAZnZhWlhxkHY7gxn27g9YYMpxUHMt0Pqy
 zYsIQnU9whU1/6Ip3E5Xf4nr/D9nHqUrvD2JJWSuT+cKV+PcbTvAtEzfwC3rfCPnoWh2
 351qPSwycNkkq4L6BK5HEAkGax5OYhkTbZqVXXnWc/D8hSqByBDxktLPSYmObnLp5HkD
 MLMFrbiNW6c1W1sRsNLwNd+9ikx7eokPy4GXSS1t+/du4Dl4rZte2txpSHq4lUdGs/fW
 YSjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739291473; x=1739896273;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cB9GGK9j287qQwW682FU+FnOXGITaIfNkLXZoLCeIRg=;
 b=WOzZrY/8rXJ2bJjsS3K6J22WR7YrWptNTJzFYMwmGbd5q4KEV1X1LO0yXvnn882MgD
 bp900Yuz/ivvRyd/3CAcft/Y3/3jupaNinJKc79PNCyhCnGVdlzRP61vbUIgUyjqpJoP
 WRtGk33gROpqVFk9D1Ry/GCsInWKXwrGKEL9xIjEtbdUHuBe1XGRowz1qS6rfrUTL/2f
 dWpnfTxciXdpsZDE/dmC5FsACN0UdAer4ZuTQ71v/7lbIphmSlywqhu8DTNbJPSjnTOL
 BDDcRsbSJyRYS2xWSXJIv+8ypwhvdUv/1dsAKYEJaz5xT35INnctEYnk+aS84ZLIgPvO
 JBJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2n6i6hYbKqEcBXWNdGNe6b8OJ+2D//+aZRcG+6KmSWYCe9liuB/ot9t/79+b5rw283GCrkEOKw2c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQE+uZAuJ+EkDK+bnXDfNAqDBU6Y8ahSrYyAI7z5X+mdOnLUwa
 VuMl3A1b4nNPhcZyQ2xDDQQcYGBuQ76WvqFmZHJOmVWhf8PK2KOK
X-Gm-Gg: ASbGnctW4a6MtU50l1WgTkvxYzJXUTcvEOF3jRUMn8WpMbBBwgaQvd6Ys2PIt3qj720
 bP3PLHcJFK8FFuq0EZEnB1oM1sF1/Ub3PgjwU1g68Ls1QcDQL+j+ZN9IpN2t667ITxjnEv81ov0
 jFH2af7BmBlQg5woSSRareDZOzZivC2Ik5RBHnr46LVSuv1tmswjIisPfLGkB6E5gUIu3PjXKB7
 mGjlLhf2FG4HgPY25tW5XD/ffwJhJILh0jjPTFBO1yv7tgNi+ASYX47piT5gnw/J/aELKOLGTvG
 X9megkMVLdXRufWreE3VVt2YYvUB
X-Google-Smtp-Source: AGHT+IEe/kXp42nTvgE04i7M8NJuzTiQ6kmVxfRkZm7tSxkcMoG7qhTNznS24oTUjaEHCExq/khNgg==
X-Received: by 2002:a05:6402:1ed6:b0:5de:525c:53cb with SMTP id
 4fb4d7f45d1cf-5de525c544amr17964157a12.6.1739291473181; 
 Tue, 11 Feb 2025 08:31:13 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:154a:1300:5b91:7670:e404:c65a])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dcf1b7ade9sm9838748a12.25.2025.02.11.08.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 08:31:12 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org, tzimmermann@suse.de, simona@ffwll.ch,
 dmitry.osipenko@collabora.com, tvrtko.ursulin@igalia.com,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 1/4] dma-buf: fix incorrect dma-fence documentation
Date: Tue, 11 Feb 2025 17:31:06 +0100
Message-Id: <20250211163109.12200-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250211163109.12200-1-christian.koenig@amd.com>
References: <20250211163109.12200-1-christian.koenig@amd.com>
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

There isn't much worse than documentation giving an incorrect advise.
Grabbing a spinlock while interrupts are disabled usually means that you
must also disable interrupts for all other uses of this spinlock.

Otherwise really hard to debug issues can occur. So fix that invalid
documentation.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 include/linux/dma-fence.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index e7ad819962e3..e230af0d123f 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -169,8 +169,8 @@ struct dma_fence_ops {
 	 * implementation know that there is another driver waiting on the
 	 * signal (ie. hw->sw case).
 	 *
-	 * This function can be called from atomic context, but not
-	 * from irq context, so normal spinlocks can be used.
+	 * This is called with irq's disabled, so only spinlocks which also
+	 * disable irq's can be used.
 	 *
 	 * A return value of false indicates the fence already passed,
 	 * or some failure occurred that made it impossible to enable
-- 
2.34.1


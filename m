Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4EAAAFDE6
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 16:56:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C794A10E92D;
	Thu,  8 May 2025 14:56:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A4B10E92D;
 Thu,  8 May 2025 14:56:32 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3a064a3e143so606401f8f.3; 
 Thu, 08 May 2025 07:56:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746716191; x=1747320991;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PAXhugNVBzhAs5NSGlFV7iMObTrBcT1YtpJjyksIfZQ=;
 b=qH6xCJA7hJ3xvkaH2xvplpc9GWb7tdFCBNyA7/+i46ygaExnGsZDE4IBhPp8pLCxad
 bhwKgSbM3+rGa0HoH1VfoyxGVaZaXMivh+BirY3JcUIlx+k2SBP+DJJBwmrfoUDvfXbI
 8K5ySCqFEAUPhJXyytTO7AhLJLhy3Sd+zp0JhjHcCy85b3z/3QQQqYkXBSyw6sG/yv4Y
 ExcBYpFIsBv6A8H54HxVYmsrTO1EKB3UnTBQz9QxBOnivJkJTXNZydLXFRocpHkAHmZN
 ak6cSHXEAm8zbJhG82fByQeYXhyCJu83Pa1AjG68VODzb70JfssYQ9j75WHeJbMEUpKE
 OqFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXyyxtJrqL+6zamxs+Rc9MjLcAnMnOavqr+8ZLDvJ6yRbh3QzJzzoNLKHNmmvmKzQIg1uUD3tWYac=@lists.freedesktop.org,
 AJvYcCX/FOg0+qZITo2it1qrFny+gXrQsi7MA5/Ds1o+MMn5auaoDIO19yitUvoF70O/5J6IpJE1TfIk1w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHtiUR4NIXBwtgjjz0mhdbP+f9E5bz9tzjtk6MSS21Uv1Z0WJM
 L1QE76r29f73x7F7yp5YaFZcsekrHNbUkkob9COcFAuI+gHPlA2Y
X-Gm-Gg: ASbGncvE3P4yqO5XeSQFn39L/a+dK6PFn0/+ZNEeDaeDzcyYYaoRKNuQVUFwSDYvdcH
 kquobdQM+umXNdZBZZ5q2lRQZJuxrcpLE8FXoJ0WCBXeV/0+njBtkBjX4rjZDed/A76Wxx8dswQ
 2z+GDOJusv52AIr8Av2vwH+HgJfnkxhSDU8KOlpJY8mFZGnwGyqpfTuFCyUJNU2fiDAixpXYDmg
 9SBxzEVtK+uuZOtWkeDb7acOLc1CdAxgBs9R0rbOxWHqTH7PUnN8GUAA9KYHvdwI0grBgB//lrJ
 vAkMP4ZzamEKAE//r85dNNAivvZswv2oMiJLzYA4ZZyGM2ra17cCMyyjC7nUoK29rwU3Xe+gStF
 8MRcfIiSrh41g
X-Google-Smtp-Source: AGHT+IF269wFqFSm/Gi0kxASaxcdFYL/XYvfXmeP4TxCmAIkirqSrOd0grvMy+PpSaQMMRGOulPk+g==
X-Received: by 2002:a05:6000:40e1:b0:38f:2678:d790 with SMTP id
 ffacd0b85a97d-3a0ba0b9c09mr3141852f8f.33.1746716191050; 
 Thu, 08 May 2025 07:56:31 -0700 (PDT)
Received: from ramallet.home (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f58f2fc4sm205018f8f.56.2025.05.08.07.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 07:56:30 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
To: linux-kernel@vger.kernel.org
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/etnaviv: Fix flush sequence logic
Date: Thu,  8 May 2025 16:56:24 +0200
Message-ID: <20250508145624.4154317-1-tomeu@tomeuvizoso.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507112131.3686966-1-tomeu@tomeuvizoso.net>
References: <20250507112131.3686966-1-tomeu@tomeuvizoso.net>
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

We should be comparing the last submitted sequence number with that of
the address space we may be switching to.

Fixes: 27b67278e007 ("drm/etnaviv: rework MMU handling")
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 drivers/gpu/drm/etnaviv/etnaviv_buffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
index b13a17276d07..88385dc3b30d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
@@ -347,7 +347,7 @@ void etnaviv_buffer_queue(struct etnaviv_gpu *gpu, u32 exec_state,
 	u32 link_target, link_dwords;
 	bool switch_context = gpu->exec_state != exec_state;
 	bool switch_mmu_context = gpu->mmu_context != mmu_context;
-	unsigned int new_flush_seq = READ_ONCE(gpu->mmu_context->flush_seq);
+	unsigned int new_flush_seq = READ_ONCE(mmu_context->flush_seq);
 	bool need_flush = switch_mmu_context || gpu->flush_seq != new_flush_seq;
 	bool has_blt = !!(gpu->identity.minor_features5 &
 			  chipMinorFeatures5_BLT_ENGINE);
-- 
2.49.0


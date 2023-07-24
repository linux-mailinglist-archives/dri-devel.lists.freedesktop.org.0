Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9223175EF98
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 11:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3025B10E2A1;
	Mon, 24 Jul 2023 09:46:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E137E10E2A1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 09:46:30 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1b867f9198dso8894605ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 02:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690191990; x=1690796790;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TtWMuwNQICElQwN/uI+F3WL3CTikAs+Dtp5goHq/uX4=;
 b=I+UdRoo7PtFa/HFb9ptM84BLJk51Oz8G0P2vA9d94Wc/XjfftjzLyxRBwA01anb/sX
 9mresCrzzrrBEvcw02T2JRUzwmE2N5g0vsbRd5C+EoXN25pNGYeZ6g16/FMxa3H5VNDH
 6ji0rzPXwUbXzJbwXvPiq1FHNNE8ocU8HPGADHiXDhNHZabYES9ASLXofIUnLzuIXCW+
 kwLOx4qHBhz6RtbAZxDD88fTSzK7LENJJOn1r+bRhOQmNpcKYfm1Yk1Egb7OAZu9liNf
 8Q2C/an05GdrxKmh9WrMTyMLOPzFeZw3WZtFR0oz9alHcEF4Djwn7mAV20C2gc5TCLWm
 V2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690191990; x=1690796790;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TtWMuwNQICElQwN/uI+F3WL3CTikAs+Dtp5goHq/uX4=;
 b=mBVRzN+KydxaTESfBMoi1zWElBMS2i9jLjafO85FP1TwD0X9R6OVo8wnZDrxpcKQBg
 Cq0gIrZE8FGKzE2arHd3FlqzUyZi56SZAcgu94+e1FUerelBUW/pR54v97yQhQT8oABy
 ZpfrTVQ3f+YJO3Z+IdGj2DTH1l8rFeXQERMXLqZp0bsN8WRKAVsgBd+H6HXPIlvwZN4I
 cAddBzLK+EM84dd0lLvBkV+FCYZhTDw/DZ+Teia9rd/8IQ7ERKUydL5RBlzgg/u4ijW5
 7uw+gd8vy1TbRY8I8Ku8lapht4drwdukNdakTpcig9FPbLVofVx70GSd+q7DNBxSfnEm
 eZiw==
X-Gm-Message-State: ABy/qLZs2WsTrSkns+06QVh4Kld8WFPoF715HeiudpnfIqgeeMAiLsu/
 HYU9NLdXoRb7TxNZeCxLYTsVIQ==
X-Google-Smtp-Source: APBJJlE4z/oQr/nYJvsLLx4ZH1UH5CYL5idBHg9QqjGajgFE/t5dphI4tPFsRKn6N/RjSu5tdTiopA==
X-Received: by 2002:a17:902:ecd2:b0:1b8:b4f6:1327 with SMTP id
 a18-20020a170902ecd200b001b8b4f61327mr12289687plh.6.1690191990533; 
 Mon, 24 Jul 2023 02:46:30 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:46:30 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Subject: [PATCH v2 07/47] xenbus/backend: dynamically allocate the xen-backend
 shrinker
Date: Mon, 24 Jul 2023 17:43:14 +0800
Message-Id: <20230724094354.90817-8-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
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
Cc: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, x86@kernel.org,
 cluster-devel@redhat.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, linux-arm-msm@vger.kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, Qi Zheng <zhengqi.arch@bytedance.com>,
 linux-raid@vger.kernel.org, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use new APIs to dynamically allocate the xen-backend shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 drivers/xen/xenbus/xenbus_probe_backend.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_probe_backend.c b/drivers/xen/xenbus/xenbus_probe_backend.c
index da96c260e26b..b4c3cf27af30 100644
--- a/drivers/xen/xenbus/xenbus_probe_backend.c
+++ b/drivers/xen/xenbus/xenbus_probe_backend.c
@@ -284,10 +284,7 @@ static unsigned long backend_shrink_memory_count(struct shrinker *shrinker,
 	return 0;
 }
 
-static struct shrinker backend_memory_shrinker = {
-	.count_objects = backend_shrink_memory_count,
-	.seeks = DEFAULT_SEEKS,
-};
+static struct shrinker *backend_memory_shrinker;
 
 static int __init xenbus_probe_backend_init(void)
 {
@@ -305,8 +302,16 @@ static int __init xenbus_probe_backend_init(void)
 
 	register_xenstore_notifier(&xenstore_notifier);
 
-	if (register_shrinker(&backend_memory_shrinker, "xen-backend"))
-		pr_warn("shrinker registration failed\n");
+	backend_memory_shrinker = shrinker_alloc(0, "xen-backend");
+	if (!backend_memory_shrinker) {
+		pr_warn("shrinker allocation failed\n");
+		return 0;
+	}
+
+	backend_memory_shrinker->count_objects = backend_shrink_memory_count;
+	backend_memory_shrinker->seeks = DEFAULT_SEEKS;
+
+	shrinker_register(backend_memory_shrinker);
 
 	return 0;
 }
-- 
2.30.2


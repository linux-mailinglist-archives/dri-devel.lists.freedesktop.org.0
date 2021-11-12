Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3E144E062
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 03:39:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA6B6E3F7;
	Fri, 12 Nov 2021 02:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F4D26E3F7
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 02:39:52 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id o14so7292798plg.5
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 18:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IBQs7fu+H8AhiV4259K+BvetOv7yqdM5oNTRoi6ACrs=;
 b=Ww7izhamLDzitGvxzmrbd8T9UJu0DrgvgwVdVPnzlFy1KwkvBANXJyNdPxT1iS0ATZ
 oqREhDd8QuyjT2sTMwAsPzsZXYVpezaBa+jxl9MtM9ermq7Wv021wHk3ROso60QJT7Na
 ZuzwI18yC78qYW034X7l4DOgj9rCVfE07bitdST6r4FaBQMJKl6Uc/XrHLNK2TbgLOQH
 2gWjh2o4h2weHoYj60+o6hCnSIeGCu/z0G9AaYggLfTYDK+9WlW6YDh3HoGXxT+e9KjV
 sRtlTm+ajfgDvScafHZJV1I/i6OTpStCNatEZPavuDNNZsK4UZc9sac7TCRCS5LMbRIS
 G7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IBQs7fu+H8AhiV4259K+BvetOv7yqdM5oNTRoi6ACrs=;
 b=nGinc2SZFm7izWAm2lI8FHp3y8cLPg7VGTxHWfDqCCJ+VF0amEWrN+XPDlZFxU6H+a
 6lyuf3uwSlj6HaNCedmrPB58h5NPDESt0g1EO7yPY8YPKibne2DzwNyyWuMn1KzrI7jp
 xWOPEO6nuXzIcEb37d7VbQZPaXTn4GS2auHbRVFbrCi0xJUsuFnSmhwCEecnMP6Zt/uX
 meQfaIINjASwgGG6xse20DJTmJzrMLZG0UntCb/q2/APOhZrQEvwGgz6jaIL8RK3zBBh
 BbQNsfqCf2iwVAW0506tFOF+crz2lXTn9YPqOi9pAeHR5uiGi9f36x4tauFJVbnNyq0l
 NEPQ==
X-Gm-Message-State: AOAM530Mee02GmWvKQcTOMhtfTpYx7A2maXV63M17STT9GMxZK0lFJE5
 eNaTOE1rgtJYgNb9PggA/J0=
X-Google-Smtp-Source: ABdhPJxOgVjtPLmL63yp3nVk7hGgiVBT66VPfdt2aXgEFQ7/vsDQrDhZnNdkEggqxLpxr6b9zO7edQ==
X-Received: by 2002:a17:902:9897:b0:143:84c3:4341 with SMTP id
 s23-20020a170902989700b0014384c34341mr4293767plp.64.1636684792166; 
 Thu, 11 Nov 2021 18:39:52 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id 32sm3353102pgn.31.2021.11.11.18.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 18:39:51 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: thierry.reding@gmail.com
Subject: [PATCH] fs:btrfs: remove unneeded variable
Date: Fri, 12 Nov 2021 02:39:47 +0000
Message-Id: <20211112023947.4999-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: airlied@linux.ie, Zeal Robot <zealci@zte.com.cm>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jonathanh@nvidia.com, chiminghao <chi.minghao@zte.com.cn>,
 linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: chiminghao <chi.minghao@zte.com.cn>

Fix the following coccicheck REVIEW:
./fs/btrfs/extent_map.c:299:5-8 REVIEW Unneeded variable

Reported-by: Zeal Robot <zealci@zte.com.cm>
Signed-off-by: chiminghao <chi.minghao@zte.com.cn>
---
 fs/btrfs/extent_map.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/btrfs/extent_map.c b/fs/btrfs/extent_map.c
index 5a36add21305..1dcb5486ccb6 100644
--- a/fs/btrfs/extent_map.c
+++ b/fs/btrfs/extent_map.c
@@ -296,7 +296,6 @@ static void try_merge_map(struct extent_map_tree *tree, struct extent_map *em)
 int unpin_extent_cache(struct extent_map_tree *tree, u64 start, u64 len,
 		       u64 gen)
 {
-	int ret = 0;
 	struct extent_map *em;
 	bool prealloc = false;
 
@@ -328,7 +327,7 @@ int unpin_extent_cache(struct extent_map_tree *tree, u64 start, u64 len,
 	free_extent_map(em);
 out:
 	write_unlock(&tree->lock);
-	return ret;
+	return 0;
 
 }
 
-- 
2.25.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 731FA764B8A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 10:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ABCF10E54F;
	Thu, 27 Jul 2023 08:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC1110E542
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 08:15:34 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-66d6a9851f3so168970b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 01:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690445734; x=1691050534;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X5ij/O+E/bk/tTzX9mgxwiCynzBHcXx4EKtI9EsHayo=;
 b=j4pDVeMcXcw7i7IAx1DNlz6iKEYUEIabVz59nN5q7bAhCS1y2gOKuzdzTgG4j/dBwO
 H4HIbZq+pOLjZVM5UGP2bbBpIOa2ebzQlUp84F0j/JFisMPJqEmZ2hJuFivDCiuZb9qk
 P5NgTQLX0gtg3X+vGmP6/3oCCgeQ9FljDUkAtb6pQhQ/VT+3lIzONbNoOLFITLjS+g+5
 Vjj6M2H3z3FRG2iT9u3T7VH/LPW2zOuTNtSoF+jLae0SEMd2/P/I3VxNY7Hl9q3RH2MH
 NSqRY7EFleJMoWuU3X7ly6d0/rJ15DhvMCCJQ4sCCtoszhR0yDF7rbG/n/mEuDtWN3AJ
 wtVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690445734; x=1691050534;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X5ij/O+E/bk/tTzX9mgxwiCynzBHcXx4EKtI9EsHayo=;
 b=fTkcwteJypHTALDhZN3jixaTUlL/5Ep81zYp6clPfSj8zNgD/yMJv9+z+dmy69I3H8
 vTuq3zJ3DK7SEz8AexTwnVHBOWuA3ujoHxVoNMCZYDmxV31Po9JXD1qqAoEj1dLgMDLO
 82t36AjMU/lt9xE2ubsCRliDXPFA2b+d2b8oCHIZw3LmLdN6FQY8PlJCMFENhBO42kGL
 /cbgoetwRemcvb6HgPAWYm9grYNy51T1a2auLKhaOECpPyNjt7J3+nk98sh62oyVKVeE
 r+VioFdMx5Vi/VtaOxfkYMTgTfOE9ell1eoRk0smoedOoZ7YItxaekGGL3n8HUrtH72f
 i8Bg==
X-Gm-Message-State: ABy/qLarhBmM7y4/KG6qWGD63w/aTtx+w2qLPKx8D5GoPExJgMmwym+K
 Lbv5wnf9t0Jn3J29UhqykpL/xA==
X-Google-Smtp-Source: APBJJlGCk2Vrs4jG84R1mGLjwsvlQmrr2Zz0KCmUr/tZ9etimLEYhkynVpF/d5AFiEeYea7/v2C0Wg==
X-Received: by 2002:a05:6a20:7d87:b0:12e:f6e6:882b with SMTP id
 v7-20020a056a207d8700b0012ef6e6882bmr6451328pzj.1.1690445734330; 
 Thu, 27 Jul 2023 01:15:34 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 01:15:33 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Subject: [PATCH v3 48/49] mm: shrinker: hold write lock to reparent shrinker
 nr_deferred
Date: Thu, 27 Jul 2023 16:05:01 +0800
Message-Id: <20230727080502.77895-49-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
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

For now, reparent_shrinker_deferred() is the only holder of read lock of
shrinker_rwsem. And it already holds the global cgroup_mutex, so it will
not be called in parallel.

Therefore, in order to convert shrinker_rwsem to shrinker_mutex later,
here we change to hold the write lock of shrinker_rwsem to reparent.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/shrinker.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/shrinker.c b/mm/shrinker.c
index fee6f62904fb..a12dede5d21f 100644
--- a/mm/shrinker.c
+++ b/mm/shrinker.c
@@ -299,7 +299,7 @@ void reparent_shrinker_deferred(struct mem_cgroup *memcg)
 		parent = root_mem_cgroup;
 
 	/* Prevent from concurrent shrinker_info expand */
-	down_read(&shrinker_rwsem);
+	down_write(&shrinker_rwsem);
 	for_each_node(nid) {
 		child_info = shrinker_info_protected(memcg, nid);
 		parent_info = shrinker_info_protected(parent, nid);
@@ -312,7 +312,7 @@ void reparent_shrinker_deferred(struct mem_cgroup *memcg)
 			}
 		}
 	}
-	up_read(&shrinker_rwsem);
+	up_write(&shrinker_rwsem);
 }
 #else
 static int shrinker_memcg_alloc(struct shrinker *shrinker)
-- 
2.30.2


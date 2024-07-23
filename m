Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3478793A06F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 14:18:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A823110E598;
	Tue, 23 Jul 2024 12:18:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wkuwb9Ap";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9034D10E5A1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 12:17:56 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4266eda81c5so47332735e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 05:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721737075; x=1722341875; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DvnOT6MbetEmIuE7eul7M9rz9EK9IOEZ+M4VxPTsMBw=;
 b=Wkuwb9ApIdqGcxlOibug58MSEAoT/S3Jioe2txjfg2rKvWP84TH/IZwIXZE2TPOoZA
 qdhoo/H2NvWrrVd5x18mEhwN+4yVpEBQ4rb1IPnzzhQ7lZDAjwGw/KMNV09fD0n/sFgv
 hCQ7aeMMk3NMB4iEspGHLFFVJ+kqV2mnRK1tfZExAPSrDG+/AOf5C+Psl4G+ufjVErxn
 2WqBwWRvmmi9yGCQ/qljTIZFgoBJVv1nZCXNETPN2xcESOyndnXvKo044DdhDykX0dK1
 DpWfcK9OlThqmwyTmFuCY1r1Ose/4v/7mhkWOBMkIX9sNZoxHvf7SYoear1G8m0et4Cq
 f+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721737075; x=1722341875;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DvnOT6MbetEmIuE7eul7M9rz9EK9IOEZ+M4VxPTsMBw=;
 b=dfCfdILJNGRVbJo4JQL/j91BYNA4KXHwL8X3/SQ6ShSqaYLTSDynXayxpw/v3cvHUR
 01KJtGZup066JA/l+uZr8gMguQ4fwEFVCwMIhNr6vZ3z6chaTzm3wWQHsDwvLB80FQud
 bwheB3wplU2r7jakZo2yTsGuBlrKWJMsv6ScQkTpwZYtMVLCGJiNryb3q+wUtiNl+MNw
 Qa0hiMxhvkAILfChC7G/aFfj9nTcjmq/pdt+rYinsnJd4hoVn1F3r3oXNjPBiAJ+m3gu
 M1G3ETWQiqWHNiaibngZI2keY54OdxEhPqEUBQB6OSSI34KhAcIEOQbe1kB02fJNUo1u
 WmxQ==
X-Gm-Message-State: AOJu0Yz8xvdeKMVk9NrnQO5X+LlINOA+RhYmw0ha1RifK1n1MkzBTDLT
 pjuAW0dm3yBkhN/J7vOAXZjldDQ8u9qfsCawgoUWHL14rOMXqZZu5TC86uTD
X-Google-Smtp-Source: AGHT+IHI7S1j4Ce47JE0E/i6QUIeofgi6XWMO4y5wKE/g7oI/kBT0GFD/ET6uFO0+Xs7YffbWpq9Cg==
X-Received: by 2002:a05:600c:1d92:b0:426:5e1c:1ac2 with SMTP id
 5b1f17b1804b1-427dcf67fe1mr89031155e9.8.1721737073503; 
 Tue, 23 Jul 2024 05:17:53 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1540:9700:699c:86ac:5633:2a7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427db2a4e3bsm138119595e9.44.2024.07.23.05.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 05:17:53 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/8] drm/loongson: use GEM references instead of TTMs
Date: Tue, 23 Jul 2024 14:17:45 +0200
Message-Id: <20240723121750.2086-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723121750.2086-1-christian.koenig@amd.com>
References: <20240723121750.2086-1-christian.koenig@amd.com>
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

Instead of a TTM reference grab a GEM reference whenever necessary.

Signed-off-by: Christian König <christian.koenig@amd.com>
Cc: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/loongson/lsdc_ttm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/loongson/lsdc_ttm.c b/drivers/gpu/drm/loongson/lsdc_ttm.c
index 465f622ac05d..2e42c6970c9f 100644
--- a/drivers/gpu/drm/loongson/lsdc_ttm.c
+++ b/drivers/gpu/drm/loongson/lsdc_ttm.c
@@ -341,16 +341,12 @@ void lsdc_bo_unpin(struct lsdc_bo *lbo)
 
 void lsdc_bo_ref(struct lsdc_bo *lbo)
 {
-	struct ttm_buffer_object *tbo = &lbo->tbo;
-
-	ttm_bo_get(tbo);
+	drm_gem_object_get(&lbo->tbo.base);
 }
 
 void lsdc_bo_unref(struct lsdc_bo *lbo)
 {
-	struct ttm_buffer_object *tbo = &lbo->tbo;
-
-	ttm_bo_put(tbo);
+	drm_gem_object_put(&lbo->tbo.base);
 }
 
 int lsdc_bo_kmap(struct lsdc_bo *lbo)
-- 
2.34.1


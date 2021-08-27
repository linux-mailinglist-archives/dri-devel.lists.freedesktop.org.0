Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DC13F99AA
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 15:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE926E949;
	Fri, 27 Aug 2021 13:23:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 685BC6E941
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 13:23:32 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so4363547wml.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 06:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o8mdIOwahhFdiNA5X6/gDD8mBdCYOOyNMhKUr7Zcw/4=;
 b=SKWYo4ZfKSasEa8hZF1E/hHTPpmHWlbuZQLZJ+iT79SiL6ITKyee8N4uBHwXtDqkCE
 pDBXhUmA1lUI+E2aBTPi+GupTO8c73tJ3NoByHgWNoncALNRqbaCgmdGqw++2tFZPVtT
 +EGY6gmlSK1AM8dIm6JR2LLH7ZNxt8r72QDWPgit+1iRsgG9ca+T1xW5yriXbB8l3uVT
 rLmxWukxSnCl1RDCNzpPJf9g3j7ZVN1Ns/PuV7m/0omhcQtyBt9xAG1NCyKyN6RKs2OE
 AvKiWFqSHEmP1yZwNamRet343P95pQfwZ3sHC2GwqCQnRCl4S8WDg6CJQZC1ioDxrHeJ
 +clw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o8mdIOwahhFdiNA5X6/gDD8mBdCYOOyNMhKUr7Zcw/4=;
 b=VMopOb+EoRJRm529l5qRJzicgh6yFOz4N1z79P+3ZcLqD0w4UXQBnv8T5KGk6wALh3
 Fay+wD+cfwTOrVaa9qWfltIIKSJ6OUWLHMREEIZ2qMOJtx4V2F2l4VReFIYd7OUMo05n
 0qwtsaXq2QIJA3sw3CZHWEG3p+4wUVoCb1eBYxDLxEd4atRSc8nq3+2Id0FZnQ1EPmhX
 aLTIll5XUmX1ZRN6cKdQdGTN/3Pd3niXSYJk5l1eumgG8RbdWKrpfff73i2O8AIC5QAj
 Ch/K91Xt7WoCbvG5ZjkAWFTikA7v+L1nmzQWIDr1a+hxk3qikFfpw3WJ/Xpd+sRBkjOk
 wX3A==
X-Gm-Message-State: AOAM531PgH07KdH/8PFcJrw7s3I5A597gEd3F5Scl141QYjMv7ERwmno
 CRDMN6NqhYt3ihe+ouKxBI4=
X-Google-Smtp-Source: ABdhPJxOEDZH38jbtvMLfMGw/+4SOUCK0iBXgQLvCJ8UJZqeLaAnIerE/iHeGiu0d/HGDD8ZmS99mg==
X-Received: by 2002:a05:600c:414f:: with SMTP id
 h15mr19650303wmm.66.1630070610950; 
 Fri, 27 Aug 2021 06:23:30 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id n10sm6292895wrw.76.2021.08.27.06.23.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 06:23:29 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH libdrm 10/25] tegra: Include private.h in list of source files
Date: Fri, 27 Aug 2021 15:22:50 +0200
Message-Id: <20210827132305.3572077-11-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210827132305.3572077-1-thierry.reding@gmail.com>
References: <20210827132305.3572077-1-thierry.reding@gmail.com>
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

From: Thierry Reding <treding@nvidia.com>

This makes sure that the proper dependencies are created and that the
file is distributed.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tegra/meson.build | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tegra/meson.build b/tegra/meson.build
index edddf72bc0e7..9813d9baddac 100644
--- a/tegra/meson.build
+++ b/tegra/meson.build
@@ -20,7 +20,12 @@
 
 libdrm_tegra = library(
   'drm_tegra',
-  [files('tegra.c'), config_file],
+  [
+    files(
+      'private.h', 'tegra.c'
+    ),
+    config_file
+  ],
   include_directories : [inc_root, inc_drm],
   link_with : libdrm,
   dependencies : [dep_pthread_stubs, dep_atomic_ops],
-- 
2.32.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7EB971067
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:56:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C6210E305;
	Mon,  9 Sep 2024 07:56:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N66vnjPp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C67D10E305;
 Mon,  9 Sep 2024 07:56:52 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-428e0d18666so35769205e9.3; 
 Mon, 09 Sep 2024 00:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725868610; x=1726473410; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NRfmK9XiELkgvke2KZ1pLgHNaRcKS5bA/Qy7jNwAfDM=;
 b=N66vnjPp963sLE95cjg7nz697Aoe6ZXfo/tBQQq1QJHCkGbJmKqB/4W+1C37hgExYZ
 MUhhC+6FYfyji+dtu/WzvTU+0hdssremWnXIJ0QOvMi/g+PxMLkL+o5v3Tcvx4ULnVap
 iF0Ru/GBgIhD6qdghD2JI7R2aUfmrwlpoki3KQxr3cjWNM1/bCiiL0IKv4RKzWIr8Fof
 OJQYKs0LnxQ1tFO9TAj0Lw9lh19EpGWiolxNK2x/MPIrbOYwA7NQ3uv2/c//13scZUnP
 Zp31ikkVPaaoi4XJCqvSA2xsUMqnxUrCQ4s1cG/18lYa5p2+Za8i1NgJsaQtOv3xEM5V
 VCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725868610; x=1726473410;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NRfmK9XiELkgvke2KZ1pLgHNaRcKS5bA/Qy7jNwAfDM=;
 b=ATDaS6tjZjYiJE4Dc2imPXGNWM5RT1tnHqSU3uENLQApTKvqTVU18LSRuqZfzCgU4r
 6x8SLzdGn5APVVKe5xK7zi6QoLBBDUYTNVVdGH9wKLwh5OEZ8o2Mq3RBobjPMvK0mmBP
 F1AKLSrBijWjNg/ehC4QQtx2mX4xQn8uu4l/RUNlUR+izarr722EA2NWhlb1i7/fRnvV
 PUh7S3T9NIlz8mmQ2+FO5DExPAiLPMZHz5kV3ME+wL2ZLKzQJJSj1I/8Sy9F+siNo6hH
 5VdJNQhM/n1TePlOfr8OCdDTlzkZ/1NobCVwG7FYLkcRYLoIASQbyWJVGS8x+ZA/2bu5
 tUIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhKRKXLi/4mz204pmmm+61mftKUEWMWxiURt1SYI91cyzBwIVtqv+kt/aj20xawi8RFn7ZGFyB8l0=@lists.freedesktop.org,
 AJvYcCV2C2VvIV6LDVdr3381Vk5l5W5oMTTl+rzKSnsH9DmHXAge3s1+YEMn1rDyQluwCeAX5dnWYzjE3hXS@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZZ1qTdTc+82sTxjhilSffxMI7nj1arEIFRNfxMOjlUFdpclYo
 Hv3bsT6AoYeG0y69DiQyGMNbH1RJOMBNZ3o/UM62vp6sloCtAEaT
X-Google-Smtp-Source: AGHT+IGXcCDv4DFDPdFSIqVFPwRvA3mDfJWQsySfBoGz736imUoLNDjdjo5DUMJkSdrlazNFf7whxA==
X-Received: by 2002:a05:600c:4e8d:b0:429:d43e:dbb9 with SMTP id
 5b1f17b1804b1-42c9f9caa4emr65165305e9.23.1725868610286; 
 Mon, 09 Sep 2024 00:56:50 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37895675b7esm5303001f8f.50.2024.09.09.00.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 00:56:49 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>
Subject: [PATCH RESEND v2 02/19] crypto: testmgr: Include <linux/prandom.h>
 instead of <linux/random.h>
Date: Mon,  9 Sep 2024 09:53:45 +0200
Message-ID: <20240909075641.258968-3-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909075641.258968-1-ubizjak@gmail.com>
References: <20240909075641.258968-1-ubizjak@gmail.com>
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

Substitute the inclusion of <linux/random.h> header with
<linux/prandom.h> to allow the removal of legacy inclusion
of <linux/prandom.h> from <linux/random.h>.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
---
 crypto/testmgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index f02cb075bd68..eeb7edd99a93 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -23,7 +23,7 @@
 #include <linux/fips.h>
 #include <linux/module.h>
 #include <linux/once.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/string.h>
-- 
2.46.0


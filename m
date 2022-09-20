Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C91E75BF79E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 09:25:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8548D10E8B2;
	Wed, 21 Sep 2022 07:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 214C210E55C
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 12:22:23 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 az24-20020a05600c601800b003a842e4983cso1566023wmb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 05:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=4SwIaD3vwte9/wOVUhii8jjHUDs7etXJMigmdSdQFz4=;
 b=SLFoLkpR340kKkW0YrWlEfAhG5dD3fKjX3yfiQcJ1RBvRf3qDsOJQmWuFi8It2zGOO
 4xWD+xaLSG2zcyyiiRX1wHCG/QPvLR6pyaxkUQuhrKBIwqqWleODmA3zmBCy2s7jSOpd
 vvFkpw0tqn83ArzebL3ogqtG6JaH24hPhvgb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=4SwIaD3vwte9/wOVUhii8jjHUDs7etXJMigmdSdQFz4=;
 b=kw/vANi61EtaWtJ9Kr+mbns8GqO5HARwl/qK8wEe7OZIdeN+QiyTy3IFdoRF/RXKoy
 ZK+/gr3lAKlmDAykLQx+u/TzCRwuO2EnZQDjpbT9QbT3MprDhlzZ3aKRlQcK5UM2ne7x
 cY3DmuWrzxM64pZ0Bs1lnNJZMdu/WBUUyduc/H2lraLkuzGwftq8Z10eg5kXBpEoWot4
 zJTBTysrt9HPoltEsKo5KesrPcHxgk1VCL726RJkiQC5Nro+e1xsv6dddVv+LU/2QqN+
 RcQtkWzksDadzIzRrJ7psCR0skwYktWpUARjn/NMSwNnn8fMo9NWYzhS4gFlhrZz1vo2
 /LLQ==
X-Gm-Message-State: ACrzQf37arzvA4Zntsho+53L+Xntej8RwElZTjYzsq9OYHtjuUsTq4r4
 L7s/OcDWe3SE/t3xgYIbuWsw9Q==
X-Google-Smtp-Source: AMsMyM7KTVO8qT5Kn3gc4wVc7Gf+axGxMqi1Oeo15wjCpSJNRvW5WWXc7u2JmKl2DoEucPmryDsVKg==
X-Received: by 2002:a05:600c:1c19:b0:3b4:c1cb:d46d with SMTP id
 j25-20020a05600c1c1900b003b4c1cbd46dmr2203248wms.172.1663676541365; 
 Tue, 20 Sep 2022 05:22:21 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i.station
 (net-188-217-56-12.cust.vodafonedsl.it. [188.217.56.12])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a05600c354700b003b4cba4ef71sm13124268wmq.41.2022.09.20.05.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 05:22:20 -0700 (PDT)
From: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To: tommaso.merciai@amarulasolutions.com
Subject: [PATCH] drm/amdgpu: initialize r variable into amdgpu_cs_submit
 function
Date: Tue, 20 Sep 2022 14:22:14 +0200
Message-Id: <20220920122216.346321-1-tommaso.merciai@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 21 Sep 2022 07:25:20 +0000
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
Cc: llvm@lists.linux.dev, Philip Yang <Philip.Yang@amd.com>,
 David Airlie <airlied@linux.ie>, linuxfancy@googlegroups.com, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Nathan Chancellor <nathan@kernel.org>, Luben Tuikov <luben.tuikov@amd.com>,
 dri-devel@lists.freedesktop.org, Tom Rix <trix@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>, linux-amarula@amarulasolutions.com,
 sudipm.mukherjee@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The builds of arm64 allmodconfig with clang failed to build
next-20220920 with the following result:

1190:3: error: variable 'r' is uninitialized when used here [-Werror,-Wuninitialized]
note: initialize the variable 'r' to silence this warning

This fix compilation error

Signed-off-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 58088c663125..efa3dc9b69fd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1168,7 +1168,7 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	struct amdgpu_bo_list_entry *e;
 	struct amdgpu_job *job;
 	uint64_t seq;
-	int r;
+	int r = 0;
 
 	job = p->job;
 	p->job = NULL;
-- 
2.25.1


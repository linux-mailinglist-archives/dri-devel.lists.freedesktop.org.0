Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC317783D1C
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 11:41:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2648810E1C8;
	Tue, 22 Aug 2023 09:41:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC09C10E283;
 Mon, 21 Aug 2023 15:04:18 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-3a7d4030621so2045941b6e.3; 
 Mon, 21 Aug 2023 08:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692630258; x=1693235058;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4nsDNl9d4lshcExFhxOmfvT78+yT9J12bXqiEl8z3Wk=;
 b=Nsqjc+xPmg9p6wrzEXmKeYc+RXEIVfrxs6JTs/wnImB8BHukr5xyEHkwYJFuXv7hFW
 XzRcJumjO7r3YPqNwzsVd9JeY63M2FZixYGmD04Dzz/WvUSF8bQI23Ob9tsS+cEH/Kyb
 5zXlnkTKokCbvjME5SwTPRdZCiCYXKoEojY56VfZncFa4MOqkcqnFUbSWAZW29XddIy/
 KMJjSIC698zTe8H8TqeFsyvM1Ou9Wg76bq/twCq/6k7uAFxO+lLizVj+p9nPO6K2JOHQ
 J0xaH+sqNFv2s2FTCgdYL7QroY1qGz8gzakmhotueEOQdsqrEzBhHfIu3ph74Y9Seipp
 RT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692630258; x=1693235058;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4nsDNl9d4lshcExFhxOmfvT78+yT9J12bXqiEl8z3Wk=;
 b=Ci5/8gF+dDNF1FPP7s18Wwbc2OGlP+245nfUVtKh5IxlH2zFqqmMeXgaUIjAmcsryt
 QzuXRtVWSF4vNxahitG4dMjxgDr0Wc/BUA+qNobkZa4EUCWO0B7Bk+kCj3vSp0rpQry3
 yRdL5gKAuzvMpAdG791gGWOgmWjL4rg48qO/Q68u8jz0QKguhJClDsBDvt3jk2DbHEhj
 AqvmxlWStvCFkNxpGO9j3s6+bkusHschYU8t+mg3S4tWALB8BU14JTkfUNjbLy8aUT2T
 ikq8Lhmz4qLnUxEHnCGN6alyfzcqP4AF8Ypg+TjQhFymx4Fkz3R5yG9tL6WQ7yVYFhqn
 xquw==
X-Gm-Message-State: AOJu0YwShsWHFKA29x5CncmlxhTc0vj7g+Un/AcdZ6CMLBEPjufXJbIQ
 ptFYDoHfbeVmh+Jdd4jrJAI=
X-Google-Smtp-Source: AGHT+IEAyShw7iDgkxpkmRqpOp+aVd74/ixWDlZbrKwshzv0+M8osDNdld8yOX26K6C1jLh/G0bLNw==
X-Received: by 2002:a05:6808:219d:b0:3a7:543d:9102 with SMTP id
 be29-20020a056808219d00b003a7543d9102mr8171406oib.39.1692630257879; 
 Mon, 21 Aug 2023 08:04:17 -0700 (PDT)
Received: from debian.lan ([168.227.196.240]) by smtp.gmail.com with ESMTPSA id
 bg12-20020a056808178c00b003a7a34a4ed8sm3650000oib.33.2023.08.21.08.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Aug 2023 08:04:17 -0700 (PDT)
From: "Ricardo B. Marliere" <rbmarliere@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, airlied@gmail.com,
 daniel@ffwll.ch, daniele.ceraolospurio@intel.com,
 John.C.Harrison@Intel.com, alan.previn.teres.alexis@intel.com,
 harshit.m.mogalapalli@oracle.com, michal.wajdeczko@intel.com,
 gregkh@linuxfoundation.org
Subject: [PATCH] gpu: drm: i915: fix documentation style
Date: Mon, 21 Aug 2023 15:02:42 +0000
Message-Id: <20230821150241.40047-1-rbmarliere@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 22 Aug 2023 09:41:06 +0000
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
Cc: "Ricardo B. Marliere" <rbmarliere@gmail.com>, skhan@linuxfoundation.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch fixes the following sphinx warnings in the htmldocs make target:

Documentation/gpu/i915:546: ./drivers/gpu/drm/i915/gt/uc/intel_huc.c:29: ERROR: Unexpected indentation.
Documentation/gpu/i915:546: ./drivers/gpu/drm/i915/gt/uc/intel_huc.c:30: WARNING: Block quote ends without a blank line; unexpected unindent.
Documentation/gpu/i915:546: ./drivers/gpu/drm/i915/gt/uc/intel_huc.c:35: WARNING: Bullet list ends without a blank line; unexpected unindent.

Signed-off-by: Ricardo B. Marliere <rbmarliere@gmail.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_huc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index ddd146265beb..fa70defcb5b2 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -26,6 +26,7 @@
  * The kernel driver is only responsible for loading the HuC firmware and
  * triggering its security authentication. This is done differently depending
  * on the platform:
+ *
  * - older platforms (from Gen9 to most Gen12s): the load is performed via DMA
  *   and the authentication via GuC
  * - DG2: load and authentication are both performed via GSC.
@@ -33,6 +34,7 @@
  *   not-DG2 older platforms), while the authentication is done in 2-steps,
  *   a first auth for clear-media workloads via GuC and a second one for all
  *   workloads via GSC.
+ *
  * On platforms where the GuC does the authentication, to correctly do so the
  * HuC binary must be loaded before the GuC one.
  * Loading the HuC is optional; however, not using the HuC might negatively
-- 
2.40.1


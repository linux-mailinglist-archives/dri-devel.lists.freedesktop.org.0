Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDFC8B98E8
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 12:36:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A2010E395;
	Thu,  2 May 2024 10:36:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZZj44Cwl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC6A10E395;
 Thu,  2 May 2024 10:36:36 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2e0b7136f2bso4293121fa.0; 
 Thu, 02 May 2024 03:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714646195; x=1715250995; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FT2Vebyh1FWwMJQubPeWb4xwvsvNpVAsZHgyxB9GdA0=;
 b=ZZj44CwlYX01l7h7GylobKDCQEX5wKQMCbdxYoVzeG0iICWUwEUMW6JUj7oD0kD2Ef
 E63480w92o78NQdWvlrMEuYUEi9Uzinau8dWCkC72mPpsHf+c4FHwmBpcE/OIyOXmJmf
 YSJjTWq3YXz6hR1apKgePAP87OZUqc9a3epOXszzspy1MTuWdefU0J0PUPqkfIl5vg4p
 X87u4ZNPnCchi2ERVmRTEcYDBsEn0cfGLRb56Qi50knAeraog1EQ8U4JWfzBtHEnCeN6
 jb5ZkDZnDOv+77D32jNoR6UC39Y0GKbTgw0u0gJIOQBmlXZ8HSTQveks2kvJuH77vZt/
 81Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714646195; x=1715250995;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FT2Vebyh1FWwMJQubPeWb4xwvsvNpVAsZHgyxB9GdA0=;
 b=W2GIH/uvAIWjl1z2OOTgH/Ujig6l7IpDD/6F4dn0M+caU95Dl0/IRLhs3VE77w7eJh
 Sj+ETAS1/oaskuM3+wlGjCcGjaUZMEs7vuD8I/bMLcCPRP5urUA2Vhda3JC/K3IR8Hvb
 cZptbtapi+wnZYLKPlHzVJhd5gTNH/iXYNIgVEMv5b2K0FSzMHLmr1e8pnBEeHD8At2M
 Ukdtp5KEwzkxX2YpTiBUyFK2f3h/hfF9YXEcvMsuCUuZjVvW88CemDxEo1hPKhG+JQfl
 zJnLv0Pq8zkND3xRbb7f1G6twWAuZrZbR4zWB5+GWnDcmhYVQqX9N60Hw8c1w7nAe+gz
 Zu7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0wWJUznqw64xiHNyTm7UAdehHsHDhmxprQqlN7yFGJRZscu1RSerJNMFI+/ZTOFledHoOgFruMfynJZ7y8VEmL8d8MK3SGFYYanO0PqySjxWoqeydRsLtzI+VuQcPLijHK9Ued0Qpwf65mTRSZ/WN
X-Gm-Message-State: AOJu0Yzha/RuLmDhzRLW/ziCuD9XgYcTQr/vYWHPAJ3Gp7gKARhuQVpF
 P3xLj916LubLFY1XWKyc0CC+E6PDTeX1Rod99KZh53deLVJ7ZoW+
X-Google-Smtp-Source: AGHT+IF6z5Prb/zz+BTozZr6JQYkXzLArcZTkDyBdDQRPe4LSx9aMuoUBBv13IOxRD7Z4PR0uozM+g==
X-Received: by 2002:a19:ca44:0:b0:513:ec32:aa89 with SMTP id
 h4-20020a19ca44000000b00513ec32aa89mr2847492lfj.2.1714646194515; 
 Thu, 02 May 2024 03:36:34 -0700 (PDT)
Received: from dmitrii-TM1701.. ([2001:8f8:1d3a:4eb3:9dcd:1735:fcaa:e2])
 by smtp.gmail.com with ESMTPSA id
 rn24-20020a170906d93800b00a52433f0907sm402630ejb.37.2024.05.02.03.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 03:36:34 -0700 (PDT)
From: Dmitrii Bundin <dmitrii.bundin.a@gmail.com>
To: dmitrii.bundin.a@gmail.com
Cc: airlied@gmail.com, bp@suse.de, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, gongruiqi1@huawei.com,
 intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, linux-kernel@vger.kernel.org,
 michal.wajdeczko@intel.com, rdunlap@infradead.org, rodrigo.vivi@intel.com,
 tursulin@ursulin.net
Subject: [PATCH RESEND] drm/i915/guc: Fix UB due to signed int overflow
Date: Thu,  2 May 2024 13:36:18 +0300
Message-Id: <20240502103618.129017-1-dmitrii.bundin.a@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240413031747.2416581-1-dmitrii.bundin.a@gmail.com>
References: <20240413031747.2416581-1-dmitrii.bundin.a@gmail.com>
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

Fix compile errors of the form "FIELD_PREP: mask is not constant" caused
by signed integer constant overflow. Files affected:

drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c

Reproducible with gcc 7.5

See https://lore.kernel.org/r/YkwQ6%2BtIH8GQpuct@zn.tnic for the gory
details as to why it triggers with older gccs only.

Signed-off-by: Dmitrii Bundin <dmitrii.bundin.a@gmail.com>
---
 drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
index 58012edd4eb0..8814d4cd371c 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
@@ -29,7 +29,7 @@
  */
 
 #define GUC_KLV_LEN_MIN				1u
-#define GUC_KLV_0_KEY				(0xffff << 16)
+#define GUC_KLV_0_KEY				(0xffffU << 16)
 #define GUC_KLV_0_LEN				(0xffff << 0)
 #define GUC_KLV_n_VALUE				(0xffffffff << 0)
 
-- 
2.34.1


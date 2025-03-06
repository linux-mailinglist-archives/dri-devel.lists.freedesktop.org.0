Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C45A54190
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 05:12:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F62C10E8BF;
	Thu,  6 Mar 2025 04:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="H3HTQlN3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C5410E8BE
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 04:12:37 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id
 5614622812f47-3f67b111bf2so189439b6e.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Mar 2025 20:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1741234357; x=1741839157;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CGKIeIMo/mb16DwbIyTEfNpdnV9LZFNH1oPNrDltyUE=;
 b=H3HTQlN3uyNkSe7d586rbIyMWIokfYDi/9D3uzlf1DgFwBeTpZ+pitlNsuM09yhniX
 lWaSTq4qWuKt6saGr4P66qeZ9x8EfvSuAnjMjZbz4A/o2iKAouSbvUhilUjDAGt0deSC
 6UVaOD72rEtIG+5eq/aCUvq6F4rFU82a6aeWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741234357; x=1741839157;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CGKIeIMo/mb16DwbIyTEfNpdnV9LZFNH1oPNrDltyUE=;
 b=sVh7ikJqFr1wVK4QSi6M0cb8kSpvOz2ZDwvLQwilgHR7V+kWlqxNJb/3pnPiGzifFO
 5QeJclL/Lv0vDF4Qm9uN9ca/0X19KJIgL1hDM0uVPp5wikqCflSKC+ukLDjcwGNkPNYQ
 fGUq7M90iSUViIHRKh4JUZxUrkBLlS4wGDnyUweidYOMptGnRVA/+tp5auiyKjo6G8dD
 OUfVW7eAl4zihlkySMIC8kxQv/ysD8AxDmxrvv8xc2YaSZaiMasJza/0BA4tMyjJOdBw
 7/GXbF8n2XM7oIu5vTQkCJgkzKxbC00sZzcQVIHMinjyeeT/borjdTxU6QsEPVXQSRnA
 4JDQ==
X-Gm-Message-State: AOJu0YyHnhOKjfCz8hTzur3NWo+FwwWWszWWA9XQXyVFPUtgwG6WxSUR
 vRCzAEhFCcpFvVcPc/c6CNpemk3b17BLjUxPzKP6GccnjS3ePFemJgWaXEqBWw8zdPulD7kP6dB
 WkZjr1p5iB+mzD5NX4wieMk/iG5Ok7sXwkZV0wsvitSuH+MrPCvooin1gMepEwPer71yG73auT6
 Ls/72omD/T2cvqYJBrIw5ABoyYnE+KEMR5RJwtM9MRGJm9ZiY5VA==
X-Gm-Gg: ASbGncv0h9O3zWcvMzihC67Q0eTw1g63DoB7yOVtpjaQkJNXTDdhLbxPTLlEL80Blon
 BxYCPjRAJy2EVaSdkla4ViHUzEj1ZMKEOjhoAVn9LovcWGHL+Lms/4K0Zqjzj6X6N2TC29BicLR
 JuRQrhBoY0w1BCZ6SvuYvEnB7kbEh3czZ8Rpa6M0hQ7V0axxN8uD73rkVLy23wC0MeViix/2/Bw
 YRUTHsNfn5+AlXwp3heFU3ly13oAXHyyN6xmuuXtWF0nDW/hjcOgbQ73IJgmUZuKqzY/XGhYI9M
 uGtUY+jFJVJGCyCxB80OCY2HcZEgTTO2rzaR9BxCNV2F2vs1HQ/ugTc4GQcVI3hevP7ACk5EcMk
 KUIUVqwjImNs6I5PLUGLotCLJps6hV644U51a
X-Google-Smtp-Source: AGHT+IFl/IED5+p1ouOmH2HXudpI0k7CSpfYtMLvJUoBBKoMb59o4ieZxGyGtzLJIj1HBqL2dtPz7A==
X-Received: by 2002:a05:6808:3989:b0:3f3:f6e6:adc6 with SMTP id
 5614622812f47-3f6831f61e1mr3556455b6e.38.1741234356473; 
 Wed, 05 Mar 2025 20:12:36 -0800 (PST)
Received: from localhost.localdomain
 (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-3f68efc5811sm74428b6e.30.2025.03.05.20.12.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 20:12:35 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v2 2/2] drm/vmwgfx: Bump the minor version
Date: Wed,  5 Mar 2025 23:11:10 -0500
Message-ID: <20250306041222.2776379-3-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250306041222.2776379-1-zack.rusin@broadcom.com>
References: <20250306041222.2776379-1-zack.rusin@broadcom.com>
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

Bump the minor version of vmwgfx in order to detect releases where the
cursor issues have been fixed.

Cursors created with dumb buffer were broken on vmwgfx. Userspace (e.g.
kwin) has workarounds for those issues and often disables hardware
cursors on vmwgfx. This allows enabling hardware cursors on vmwgfx
again.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 09ffb49970c9..a171379abf94 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -58,7 +58,7 @@
 
 #define VMWGFX_DRIVER_NAME "vmwgfx"
 #define VMWGFX_DRIVER_MAJOR 2
-#define VMWGFX_DRIVER_MINOR 20
+#define VMWGFX_DRIVER_MINOR 21
 #define VMWGFX_DRIVER_PATCHLEVEL 0
 #define VMWGFX_FIFO_STATIC_SIZE (1024*1024)
 #define VMWGFX_NUM_DISPLAY_UNITS 8
-- 
2.45.2


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73352A5685D
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 13:58:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306D910E2BC;
	Fri,  7 Mar 2025 12:58:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="euHtwCFW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com
 [209.85.160.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA8C10E2FF
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 12:58:47 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-2c239771aeaso962033fac.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 04:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1741352327; x=1741957127;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/wJuUDv4KYILHMFtuwpOTjQuibIfTVSIfsa4pASsFaQ=;
 b=euHtwCFWp2RGL9mcegUmGUTxMX6BdCw4uwPPHLCcL24EjpjZDDxDrQcLustOEkYA5y
 fibxAtd2TH6C6zycpFEqIyS6XRCiyD/3hjFgNTJRyU7NnuHlj3lWa7D4t04RDeZ11rLh
 bxK1kHkyq702uKyjEOboX2yHWasW8icWb9oOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741352327; x=1741957127;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/wJuUDv4KYILHMFtuwpOTjQuibIfTVSIfsa4pASsFaQ=;
 b=ouEjerlk39iruTyyvrAfqTF2RZua1Ojz6IK6k1efLdrNor5TQnXBTCu69rS6djQAkT
 Px91yymN+6f1dUFSGQ0Uqg2DnRsqiC0TrIfKKtfW5GHVikV2gzarotX2dxXxGpx6Smia
 wTcvjmOfMaFktxgnkuQEiBOMx22nWy6hhEO9vINeqo0p3lC4wPIE5+SZZg6n+nLYqi2p
 TCn6Sa25Z/c6+zKU/yvvYEZDziOp+6LQi6tNnJtAIJkm+i3M5JRAAXSS9SlG6vYk2a98
 M/dpkKpiZouizM+SnS6OunaxnGFehDeanhebXoN06Zpw0FnMXjpB8I6sJR/rxpu0tRCm
 qjkw==
X-Gm-Message-State: AOJu0Yw9J0Vp95F0DUM+oUZppoaRwLFLRP9VPls+znguHiggpIAnciC8
 piIhqU0fgG6X629ys3A8vT5TdIL+eRi9Be9XlFl260zGrtBfJJCxEKrBZqnV6kDOrCnJbAWr3aF
 BDrc0BP0iOW96Tn6eIEvoWG2XsvQlUux+uQMrDSCk0NeE1bTzxr6gM5WX3I+MlNrw9ZBnMqPbdr
 kToi5L46eurYjCgXFnh87fxi+nxBCAsPAnx4tdaUQc3MwZ/0RLvg==
X-Gm-Gg: ASbGncszJm8fGxpwj7LBXuBezXJK6+i5nNqBM9ru6HVv0i9pAgj3KdynCekgtAdKbjF
 NVC55QhXiIw3Qy9NmkJ2ixpK7JtV4qveMPFmvfuiH95P8easDxFrYQX9BtlNcagytEctRjtC70S
 hmFU/V3+ODhkCkkcLcxR1us1v2JCMTgOhZFOcFFFlnHaIZ17T7wIG49D/eEzD1572awTGwzZicb
 38aFCmBdWCgg1T95XILze0gvIq0OOTYsYcDEf+yo5GY9/mW7n7+iN0UoQ8mjlYWSBRBNneUkGDV
 bXeOLimgIf017d9iXRdlu1ZSLIQqGnCEOXbw5H5eVBpoM4mFKt71GNURBX5XG7dq5KCcAgN80qT
 L2n9shlRNnNZZiIUhpqz33ar3VUkjV2mO53BL
X-Google-Smtp-Source: AGHT+IEe2+JNgxQK3k5Eu6y6TSoBk0E4/R1wYFCH1eNiKPkiX8w4QXIq26sahYWJ60CH7+XpBZkbig==
X-Received: by 2002:a05:6870:3288:b0:2b7:f2dc:a4bf with SMTP id
 586e51a60fabf-2c26111fdd0mr1691817fac.18.1741352327092; 
 Fri, 07 Mar 2025 04:58:47 -0800 (PST)
Received: from localhost.localdomain
 (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2c2488b1882sm664860fac.13.2025.03.07.04.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 04:58:46 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v3 2/2] drm/vmwgfx: Bump the minor version
Date: Fri,  7 Mar 2025 07:57:39 -0500
Message-ID: <20250307125836.3877138-3-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250307125836.3877138-1-zack.rusin@broadcom.com>
References: <20250307125836.3877138-1-zack.rusin@broadcom.com>
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
index 6fc810632c98..0dfb88fb19e2 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -38,7 +38,7 @@
 
 #define VMWGFX_DRIVER_NAME "vmwgfx"
 #define VMWGFX_DRIVER_MAJOR 2
-#define VMWGFX_DRIVER_MINOR 20
+#define VMWGFX_DRIVER_MINOR 21
 #define VMWGFX_DRIVER_PATCHLEVEL 0
 #define VMWGFX_FIFO_STATIC_SIZE (1024*1024)
 #define VMWGFX_NUM_DISPLAY_UNITS 8
-- 
2.45.2


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E23A11894
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 05:50:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F8EC10E4BE;
	Wed, 15 Jan 2025 04:50:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="HgNCnyOP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540D410E4BE
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 04:50:02 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2163dc5155fso114974745ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 20:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1736916602; x=1737521402;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WBWxpmsiuDFKmDYCqLWBWjLNmtgsA/Fb/hDnXXOrJZo=;
 b=HgNCnyOP4TjmMkroP2FVgx1GNse+9exlm/3IbLlGyTxxUgmm2U3Moi1AVI6zYltp5A
 pFQsP2XMnLb3GmyWKWCi0RfkUcW/2co9SCFfluCQ3HieweB6OWccRxDBnx+eiPdRMkM7
 gcd68XlFYeI6BcoOb8Ds00Jjop1w7ow8ixb2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736916602; x=1737521402;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WBWxpmsiuDFKmDYCqLWBWjLNmtgsA/Fb/hDnXXOrJZo=;
 b=j8Y5RfurGenUIhPmTKbRAJqdezQC5Hd/mYh39F9Z4aMBMGpcIh5Pn8ADwtdnB8Wmp3
 b2+9wrk3RQozs8BBT+9HAp2SRS7PuE8GJRs0dF8k2F25Qzd45GrfTClQ68RIvFL4/4bX
 LKWw+fhIIE/fhEzaSeoZJ0kOic9ySm33TLtWRDoDVH6liadMo1ex8ddegV5CdzEfWerA
 WSd9XU4+Esr13mX+UxfYSt9o91yOPpzGrCb/5vIVBW3nLH0nJyE1Nq5TSCJtue6oig8S
 p3FncEq44YGblukZdVW1goY+pMHmx/66MiyXoZ18mENS5G0UXuLq6kiDxTtzfhmaB4gD
 p4Rg==
X-Gm-Message-State: AOJu0Yx2pkx6oevpRWGJAsLhj8D6VmbxsjIn851RoZgNokuvl7MPAYRi
 EglrOrRH4gL8onon31tqSk/hmmzBv9KVmMz5ysvKgWaohoSzRc8LJ8xfuFAE6LeBnhSmufFwD0d
 s7FK6fuVVGAjQHYgGBACl52UTg4oT6/ACa9joSW9Kya5jgMs0iagO8SkTC/m0wyssUkwAEnHi2m
 Ou6JFJ3bhy6RQ8IJtd2oxDD3dhyRAgR8apkdUNwYblStKVXXkJZw==
X-Gm-Gg: ASbGncvxn3Y6BVFxLxn3rMrmm3wRKk9OIwNR5kBZqYHaZyvTKVXXVFCjCxyeniQBh/6
 AR2ORY0cQ7tbr5ZaJy4vnQwJwvNkS7Tl/C8Oj6icUqcXlI2pj/EHRvPIAQGTylyOGx7ab3uI4i8
 IlmYpdiyVgP+Ml0BnbK//ntocY8pPC/gFHFJ9Bu68JRKIHtfzWs2pVzc5jDynASjQEcbdXV76Z0
 N7eQKLU0Cu0wSqdiegzIHmvjyWJ5zwBLsPQM8uOkRy/g9g/f1ZXSHakZ4OuF5AqeGSBOY4QkHKi
 m8FgsqmuPhKRHVQnHzPF68ubZIQARdRm8Inu3VJbwXH5NxCi
X-Google-Smtp-Source: AGHT+IGiGRD6m6xspVR07NpxxXGLv95ekx25ERx56qT6BasDNUPPB/M9SabKeAYdsD5M/EgfQels0w==
X-Received: by 2002:a17:902:dac2:b0:215:4d90:4caf with SMTP id
 d9443c01a7336-21a83f59455mr459099505ad.14.1736916601962; 
 Tue, 14 Jan 2025 20:50:01 -0800 (PST)
Received: from localhost.localdomain
 (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21a9f13c92dsm73905325ad.97.2025.01.14.20.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 20:50:01 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH 2/2] drm/vmwgfx: Bump the minor version
Date: Tue, 14 Jan 2025 23:49:35 -0500
Message-ID: <20250115044954.2496547-3-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250115044954.2496547-1-zack.rusin@broadcom.com>
References: <20250115044954.2496547-1-zack.rusin@broadcom.com>
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
2.43.0


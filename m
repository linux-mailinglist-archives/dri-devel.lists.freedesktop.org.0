Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E99DA354CCF
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 08:25:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F22646E5C8;
	Tue,  6 Apr 2021 06:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB12689D44
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Apr 2021 18:15:28 +0000 (UTC)
Received: from mail-wr1-f71.google.com ([209.85.221.71])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lTTl1-0004pY-9y
 for dri-devel@lists.freedesktop.org; Mon, 05 Apr 2021 18:15:27 +0000
Received: by mail-wr1-f71.google.com with SMTP id f3so8647282wrt.14
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Apr 2021 11:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MLkw/W1VWG6EFfaPc0X5WGBh7Sa2+Rr55CF9ZvrmlGo=;
 b=tsHpX0EXTM/1G4Xq7gi6l9dYC9koDGKvKXo0lxLdDhPjkozMnhtsTRLMvWmYphNLGi
 tZiTUnPd0DCum3N0iLBmBW8lbFlcBApKHhlZBiI6Nvx7iopR2qGPhqQhjS7weIAI8xvY
 VXAn7L7I+ohTog3l46eSwpsvmQTG91wVgoR0wjTBwjcBRdQrLk651wfo4KE0KJiXAqRj
 d991ofDbnEQO06BLntgTafScuryuvGlRJBC9NY+xYL2EAqni4LF2kZjB1zIg5GDx7GYe
 IoTmSxKqC6pRlhYWCDGX1p7LWLbpxsFTTz2kKaWvXE1zk99ob3UOT6gNGybc0LOXEDbC
 uDZQ==
X-Gm-Message-State: AOAM532CDty/wBI3K1cKmfH/7dCPS+9Bq0pOPO/zyNcfnM0CEPGxYNnm
 WAbrz0C00eP7MtuNWlzxMVpWzIIIACdTJwzShUWszatvJiu2Q0HMTRTdzXru030ZrXBpia9L5Fj
 NwRHWHwdJi61CPHdWBct2aufgUK6PWc4DoP6FEQ2FExmvIA==
X-Received: by 2002:a05:600c:3594:: with SMTP id
 p20mr301452wmq.173.1617646526996; 
 Mon, 05 Apr 2021 11:15:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7mZ+bLz94q3v3cBPpPKjuOK3slg8uVtnf/BhAOY8wOnY5kSV0Phjy7PdABD6JqdP+P4BFGQ==
X-Received: by 2002:a05:600c:3594:: with SMTP id
 p20mr301443wmq.173.1617646526872; 
 Mon, 05 Apr 2021 11:15:26 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch.
 [188.155.192.147])
 by smtp.gmail.com with ESMTPSA id 61sm18298925wrn.25.2021.04.05.11.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 11:15:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/exynos: correct exynos_drm_fimd kerneldoc
Date: Mon,  5 Apr 2021 20:15:24 +0200
Message-Id: <20210405181524.52426-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 06 Apr 2021 06:25:33 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Correct the kerneldoc of fimd_shadow_protect_win() to fix W=1 warnings:

  drivers/gpu/drm/exynos/exynos_drm_fimd.c:734: warning:
    expecting prototype for shadow_protect_win(). Prototype was for fimd_shadow_protect_win() instead

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 49a2e0c53918..ae576122873e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -723,7 +723,7 @@ static void fimd_win_set_colkey(struct fimd_context *ctx, unsigned int win)
 }
 
 /**
- * shadow_protect_win() - disable updating values from shadow registers at vsync
+ * fimd_shadow_protect_win() - disable updating values from shadow registers at vsync
  *
  * @ctx: local driver data
  * @win: window to protect registers for
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

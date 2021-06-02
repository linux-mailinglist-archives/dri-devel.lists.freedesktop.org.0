Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E86B8398CF7
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 16:33:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 445FA6ECCE;
	Wed,  2 Jun 2021 14:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 729CB6ECCA
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 14:33:30 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id v23so2533325wrd.10
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 07:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sC3mIdqFUsQKIxXxCz1K8xBUphxh36SrzQvqXPDvpPY=;
 b=jrbVJhYVYFz1DCW2XlJXpv3k/4WWNcvdGqZRYYFPH8qvS78HM8G9k2aQzSr4U3akX0
 YKyFceq6z5Ptsb2YuQX7WYiVou3D0h2isYv+YlOcLuufNenAZGPrZp6xzmCwsn71ek9T
 hXdLk2/CMraGy2NztZEaR2hdpEhz6wssrqUumMULcgOV3NoUu7+8gwAh1eBz5HhqlYgZ
 Nxh4iR62vidxORe+4FUaFg8jD4sy6xnyfAmuWCifGmnkI/8JWZ+pp9PkvJN2RpS7RXH4
 zjkbR15023ZffndELLectbZrdzFVsqgH3U7wVJuWreMHaW9t/E1sN3QBJat4JNi+IoGH
 QiZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sC3mIdqFUsQKIxXxCz1K8xBUphxh36SrzQvqXPDvpPY=;
 b=O+3D0AFG5yYieAaJT70ZraLpfZ7THaPN50FX0dUOXnLOpGYIDekHAL+yB3QgYrIP4A
 FZVrRWFY934j5EJ5KOZISqmZhaQFQ3OTjh6FYyqlIB3sbN7VYDiXpdIa9Aguu2v3ZzIr
 h7gxemL1Qq3X5ydOT6gj8us/eKWEkD95VPM+1k4VtfRMrn4o15cxZL/TDqxNf7jiOQ0O
 a9cjtXhTfkn1GdLIISP3OJyBkHsjRA8wmyDekDcyQgKSV2QTURXE6d23UlQoZjd6VDyF
 mEYWmQXB5ZOosOTO66mGSS3uoGzCq1pGmLAqZ8p/7FGVVOWhFLuWV36lDOvPOkAmqwE6
 8Vbw==
X-Gm-Message-State: AOAM533+BtGJS86pkZY2nVKeIM92G4RAPozmuav/8tMUOH4TpwlZeaPo
 E+JjkUygjpLTh2wa/ua/43U8jg==
X-Google-Smtp-Source: ABdhPJyA7xNVEDWi/jmGkoj0XwIoqBHyFxl9g2ybWBu7eKtoD97SDgOK5KMD0tDyh0Ttzqxnl1OM6g==
X-Received: by 2002:a5d:6546:: with SMTP id z6mr26587520wrv.100.1622644409184; 
 Wed, 02 Jun 2021 07:33:29 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 07:33:28 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [RESEND 18/26] drm/xlnx/zynqmp_dp: Fix incorrectly name function
 'zynqmp_dp_train()'
Date: Wed,  2 Jun 2021 15:32:52 +0100
Message-Id: <20210602143300.2330146-19-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602143300.2330146-1-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
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
Cc: Hyun Kwon <hyun.kwon@xilinx.com>, David Airlie <airlied@linux.ie>,
 Michal Simek <michal.simek@xilinx.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/xlnx/zynqmp_dp.c:806: warning: expecting prototype for zynqmp_dp_link_train(). Prototype was for zynqmp_dp_train() instead

Cc: Hyun Kwon <hyun.kwon@xilinx.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 82430ca9b9133..a1055d5055eab 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -797,7 +797,7 @@ static int zynqmp_dp_link_train_ce(struct zynqmp_dp *dp)
 }
 
 /**
- * zynqmp_dp_link_train - Train the link
+ * zynqmp_dp_train - Train the link
  * @dp: DisplayPort IP core structure
  *
  * Return: 0 if all trains are done successfully, or corresponding error code.
-- 
2.31.1


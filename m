Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 449D85521D6
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 18:07:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D897010E03F;
	Mon, 20 Jun 2022 16:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F99310E0D3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 16:06:50 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id w17so15310981wrg.7
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 09:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1hWIp6gyzPawjh1VYTnBY7bZuvMtRrsBKXWqmX440Jo=;
 b=ImEBBc8Mfaf3egC0vLFYHtdUnz5XmDGiODkNpny5L5NPHSAFnXLokHTZEmjWbnT3WC
 gKlKSq67gALLdEBqLgVdXM2EvbJUo00ndmOR842m86KRxt5VX6WrM2ri21wVe6d1j7aL
 2DWC1bN/+70XXpa175XD+jNo2Nn+8IjjsbjnSvPQoe2SzNGGEekAiR77TERTEKSH176b
 76cmdO2wc36wuiKAp7akZkAhM7tikVlSgafLp+f9VtDUdvd9St/saVksJfNvu6bY78Iz
 FsckfGv9MJiGxHIyijZejdm61HMTuqSlGGr5T+nSRVBqmkWj+ClP4Tfkkk0K/gA3a63j
 w2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1hWIp6gyzPawjh1VYTnBY7bZuvMtRrsBKXWqmX440Jo=;
 b=a3LCYkuIdOPvXRVpWnSRZRuEMjUPWny9/xnZASXT3nZJZISZbwTMlFGy2CJLNb8Xb4
 jDAt7wfuq1yxaDolgR7gp5CXL2h/mRDZU+RAyDaNlqqsRdLajZRxS9pPz8exOCjwpuBi
 unNuBxvtUVv12zwtkoolWhEosuIHIVs5m/hM50UKCEtexQQKrk0A/kscyUGPMwxQX+wb
 ekeVVuSBTGW9C5AUCqpE9l/LKPol2ABpN4dkU2lA90bcDGQAkLZBjZT8JGpO24rq8X68
 xC/lFMb5XATPKmHM+UdFgLDNJgW3uONodpzRwEmRM+utayIxnAkpncJaJXQ8ORvQoPYx
 FuGw==
X-Gm-Message-State: AJIora+sY1Vwraqx/XXsUcRx0VCZlcwYbzJOgM1wxVatNCfd1WzGhAms
 72DSPLMUAWw7IDWG7X2303skZHjvzcuZIQ==
X-Google-Smtp-Source: AGRyM1tS84pAl4gPEG6VUAiyQ3CNBgM/Fof7DG4xoDCk5JDIMJryIQAgfInVIRMaMIhvmvCck0bUzQ==
X-Received: by 2002:a05:6000:2a4:b0:218:77ba:988e with SMTP id
 l4-20020a05600002a400b0021877ba988emr23689984wry.459.1655741208896; 
 Mon, 20 Jun 2022 09:06:48 -0700 (PDT)
Received: from localhost.localdomain ([94.73.36.128])
 by smtp.gmail.com with ESMTPSA id
 h14-20020a5d430e000000b0021b90cc66a1sm2986096wrq.2.2022.06.20.09.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 09:06:48 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: [PATCH v4 1/3] drm/rect: Add DRM_RECT_INIT() macro
Date: Mon, 20 Jun 2022 18:06:38 +0200
Message-Id: <20220620160640.3790-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620160640.3790-1-jose.exposito89@gmail.com>
References: <20220620160640.3790-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org, davidgow@google.com,
 magalilemes00@gmail.com, airlied@linux.ie, maira.canal@usp.br,
 dlatypov@google.com, linux-kernel@vger.kernel.org,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 tzimmermann@suse.de, tales.aparecida@gmail.com, isabbasso@riseup.net,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a helper macro to initialize a rectangle from x, y, width and
height information.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 include/drm/drm_rect.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/drm/drm_rect.h b/include/drm/drm_rect.h
index 6f6e19bd4dac..e8d94fca2703 100644
--- a/include/drm/drm_rect.h
+++ b/include/drm/drm_rect.h
@@ -47,6 +47,22 @@ struct drm_rect {
 	int x1, y1, x2, y2;
 };
 
+/**
+ * DRM_RECT_INIT - initialize a rectangle from x/y/w/h
+ * @x: x coordinate
+ * @y: y coordinate
+ * @w: width
+ * @h: height
+ *
+ * RETURNS:
+ * A new rectangle of the specified size.
+ */
+#define DRM_RECT_INIT(x, y, w, h) ((struct drm_rect){ \
+		.x1 = (x), \
+		.y1 = (y), \
+		.x2 = (x) + (w), \
+		.y2 = (y) + (h) })
+
 /**
  * DRM_RECT_FMT - printf string for &struct drm_rect
  */
-- 
2.25.1


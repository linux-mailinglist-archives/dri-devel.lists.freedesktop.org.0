Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4314112BB
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 12:13:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB156E471;
	Mon, 20 Sep 2021 10:13:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0136E471
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 10:13:43 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id w17so19850821wrv.10
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 03:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9IID+4ZYdzA+GPVBMk9JaAemfSAyR0y4mgBJx0dcvPc=;
 b=c8v5DvE0T/wU5KZj2Q8+H+Plb8oX3Re3WnHDJHJEb0X4YKb+kAhKMsEdpXZyPNOyuL
 MockirkGIfbYgmz6icgYaYc2KwGTGGUNVkxLi69o0fcTxs1f1ZLPsoIdlAvZRM2gBHTR
 GQ7O/DYbyR3ZTWah7w62NL4Lyc3F8SIcf0SdC/qiJFCjkRPPnBu9Tr4iEzeA9Sch4xRa
 CehJg+MpjczpK42Yy0EBaBl9RTJggLed0ILf/GIPV8Bzgjj8IGf6Crl01fbQeY8bvxLj
 O23Jk334eg43u4QqWfWFW4pZQWtzFPVvpekjqu9AtpR4thk5T0RHl9MfTaIxrqu+6/zn
 02kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9IID+4ZYdzA+GPVBMk9JaAemfSAyR0y4mgBJx0dcvPc=;
 b=mKp7dCwqKmf4yLZwCr84y3a6huA28CM4BxRM6Tw7NatDhjuXMA+uR3YYOhyv3ymMZy
 +ckAM+wHlJpEz8jQ98FehgV+W444WFUw1HZcmyjTXSkWK7g8zT0RLNT8I0lyDrwlQrpl
 Kg78k2eIoq4GJrJBFttAaazvxW+TXy19bQhMwlsCEf1vablvJDZE/qDB5fVN8qZnrAI8
 tQrlfkf48bD7dptINWB5RhadPpoLWxMbhxr75AUemCyNzdPHeEh4C0aCKKAuaqlLtDeI
 3B8GaTw8wGPx5erMgrqW450YiaY80DhjhnHTiKrARHNcO7VS0Bq3UWvz28uZTMk1cSXH
 zcGg==
X-Gm-Message-State: AOAM530DS69iVb/i8Zcs3HOnIDy21QcpOdZtVRIAwkSJwrzE4Jq4Up0X
 QLiL7SyEXJa4LXMDbxp1CijAIw==
X-Google-Smtp-Source: ABdhPJx52c1b/hmainXqgHq8wgwAhy7PHzhwn0hCaVaoGZfL4zn2dyqZf998lB22yZPnhryglgUL5Q==
X-Received: by 2002:a05:600c:2057:: with SMTP id
 p23mr28666589wmg.25.1632132822489; 
 Mon, 20 Sep 2021 03:13:42 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id 20sm20225528wme.46.2021.09.20.03.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 03:13:42 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH] doc: gpu: drm-internals: Create reference to DRM mm
Date: Mon, 20 Sep 2021 12:13:34 +0200
Message-Id: <20210920101334.249832-1-msp@baylibre.com>
X-Mailer: git-send-email 2.33.0
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

This short sentence references nothing for details about memory manager.
Replace it with the documentation file for DRM memory management.

Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 Documentation/gpu/drm-internals.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
index 06af044c882f..bdcdfc4ede04 100644
--- a/Documentation/gpu/drm-internals.rst
+++ b/Documentation/gpu/drm-internals.rst
@@ -126,8 +126,8 @@ Memory Manager Initialization
 Every DRM driver requires a memory manager which must be initialized at
 load time. DRM currently contains two memory managers, the Translation
 Table Manager (TTM) and the Graphics Execution Manager (GEM). This
-document describes the use of the GEM memory manager only. See ? for
-details.
+document describes the use of the GEM memory manager only. See
+Documentation/gpu/drm-mm.rst for details.
 
 Miscellaneous Device Configuration
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 
2.33.0


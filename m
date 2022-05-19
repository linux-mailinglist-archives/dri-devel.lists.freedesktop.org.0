Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB34252DA3A
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 18:29:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B37B10EB5A;
	Thu, 19 May 2022 16:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 878B910EB5A
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 16:29:54 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id e189so7075245oia.8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 09:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nWielQwKUjaGCDPYpC0qlz0e3JwhdCLUGqShkGf0aHY=;
 b=fKpqUT7H7BdkIbUfBb4GLkjD1bN9SIqIy7m9m5WOhDZHoiHnMmWZsaSheN572PWzqF
 kp8DP8En68d5EPuf0GiF6YBioPYQ2aNoqcNsx5x7QhpIwtmqIf2i0ygaU79bBCNX1awA
 /WYZTg7jisNrmr8Mr33FBWjoXTJZuzwbvPEmYGbPUQuCneGLqDdDR7DnjjL14yOvS4+F
 kalzy1U002ceRd6QSBU/2FcW7eVnl/BZkktShPBGxJEy0EUhVzVY7SzveusSAkNgXwUy
 vd4GDZx3qR2yb47RBDNbiqAqI2m/Ik9WL5oc4KiGasqoKjzMmGl0QwUrRVZ/hh+QDouS
 55IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nWielQwKUjaGCDPYpC0qlz0e3JwhdCLUGqShkGf0aHY=;
 b=iiJ4O2RyYLmALEMVRO3xoPPjHN3If9H6h6pujcnL7SDePKUhKzmCSdKRJuP4zXIYdq
 76FjxkwLrD2bXcljCBHFzjx99dmQ6hIPePRH9xSipGzDjApYUPfXkZ+saQCA5zfJbcRh
 ZIWzvoVeQwvshCnZY3F8Hkp5pf+QW1IQQzQO/QZB8FUrxZoLFFjp+78OP9FxT7wOS0x6
 nApcXO/FTY4kpu07mmx1MXqRJWpaVjPNa0SSqEKbheMAeOcZzrbM9wJOmQXPFwj+Jint
 j3MPXtiYcUF0/FTCEHda3qPdm5rVUfil5CXCqQY2lst6xMhXveS8fhLdiSqR6+DliVZt
 0lXg==
X-Gm-Message-State: AOAM531RQaKoJ/PCQFC2AHzrk508w9il/l8qwVnffQTrmb41oAaOZ5Nx
 uLyxM9Nd1PiK9zknT9opLxOqOavOqoZ8oQ==
X-Google-Smtp-Source: ABdhPJwyUBkfMLQeVNxghJT+ulgz5YHDxLS03g5x9fK3VD+DVNDzCSSRXmI3ieSkGIl1/RUzeFwJbg==
X-Received: by 2002:aca:c1c2:0:b0:328:e69b:d725 with SMTP id
 r185-20020acac1c2000000b00328e69bd725mr2990064oif.266.1652977792109; 
 Thu, 19 May 2022 09:29:52 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35]) by smtp.gmail.com with ESMTPSA id
 n4-20020a056870844400b000e92295f8acsm36562oak.2.2022.05.19.09.29.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 09:29:51 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [RESEND 2/6 v2] media: uapi: Document format
 MEDIA_BUS_FMT_RGB565_1X24_CPADHI
Date: Thu, 19 May 2022 11:29:31 -0500
Message-Id: <20220519162935.1585-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519162935.1585-1-macroalpha82@gmail.com>
References: <20220519162935.1585-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 emma@anholt.net, airlied@linux.ie, Chris Morgan <macromorgan@hotmail.com>,
 robh+dt@kernel.org, thierry.reding@gmail.com, mchehab@kernel.org,
 sam@ravnborg.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add support for MEDIA_BUS_FMT_RGB565_1X24_CPADHI. This format is used
by the Geekworm MZP280 panel which interfaces with the Raspberry Pi.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../media/v4l/subdev-formats.rst              | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index 0cbc045d5..e43e07634 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -624,6 +624,43 @@ The following tables list existing packed RGB formats.
       - b\ :sub:`2`
       - b\ :sub:`1`
       - b\ :sub:`0`
+    * .. _MEDIA_BUS_FMT_RGB565_1X24_CPADHI:
+
+      - MEDIA_BUS_FMT_RGB565_1X24_CPADHI
+      - 0x101e
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      - 0
+      - 0
+      - 0
+      - r\ :sub:`4`
+      - r\ :sub:`3`
+      - r\ :sub:`2`
+      - r\ :sub:`1`
+      - r\ :sub:`0`
+      - 0
+      - 0
+      - g\ :sub:`5`
+      - g\ :sub:`4`
+      - g\ :sub:`3`
+      - g\ :sub:`2`
+      - g\ :sub:`1`
+      - g\ :sub:`0`
+      - 0
+      - 0
+      - 0
+      - b\ :sub:`4`
+      - b\ :sub:`3`
+      - b\ :sub:`2`
+      - b\ :sub:`1`
+      - b\ :sub:`0`
     * .. _MEDIA-BUS-FMT-BGR565-2X8-BE:
 
       - MEDIA_BUS_FMT_BGR565_2X8_BE
-- 
2.25.1


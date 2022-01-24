Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE65049855F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 17:55:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6501C10E273;
	Mon, 24 Jan 2022 16:55:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E2610E273
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 16:55:35 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id g205so26395303oif.5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 08:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nWielQwKUjaGCDPYpC0qlz0e3JwhdCLUGqShkGf0aHY=;
 b=h+hswY34tTiBQRdRfR4z/MnDvgEdaNnaMK4+vS0/lTHghIOINgj6mwrPYUtBp0cOI+
 0ho/H+IesDBp9kv+M26m0nCRdKEPaoKURBadjIKegIKIK2R/yzZzpWS2WUVs4AM6QW3j
 hHvBzA8qke8fqodEShvMa5G8yv0IUNCeMrC3Wf2QFJ5qQPfwmGbeM5lKfddAyHttU2nm
 X5OoQ2ry826EZNCMPH103uZ0vJ3K2T3JM+d/e/DQw2heKA1IbbEygmtyIGtvbJKgZx57
 OcMHm7q1wmn3516nKDRoWUDiKUbJrVT3CGakvbcBt1ng2UvXdH4ZOmOEif9qzfaBC4nR
 O1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nWielQwKUjaGCDPYpC0qlz0e3JwhdCLUGqShkGf0aHY=;
 b=ppIAH+tEnPxQwMExStv6PfJihfdqaeEERiJx08t+q4xInere8xNDbMnIiwr+ID1/d/
 dA1Scz6EfQHIjGSb8WJPtdq74wmDHgTrf2gDK93yPN8w7DR9kEq4SOulUmjXbDN8tcak
 YuQ4ZUsWwmeVpyBoJ34PoXcpajfl6CELjijtgm4zy0Ga2i1sb2NzjLkJ0UYmjDoyzM3y
 5CFDlSx6FmueGp09FO0M3JNDHV+yRs+YrNDi+dWCHAoDXbAkqBkVuSwwJ0Em4LkjqeF7
 HAv4XqzWmpzhKwA1baIvTVNoh6UxxlDTp8mqfHHQ5QhIZbtVM42UPQscyvzmER24jNFB
 9HcQ==
X-Gm-Message-State: AOAM533GVNWzCeKH3dPhB7s4C+puyBTo50rTFlkPx1w/3rzNNXonYOgc
 yrWf8dC5CGUjGoGPzT6RKBqVWCVv5Q8=
X-Google-Smtp-Source: ABdhPJy/1yAGdMKJKSdjdUxUW9xJlLSFlDoY1QhGMleFmeJlbWzWMbDHIQsTsKlDKhJGW/gI2WqcvA==
X-Received: by 2002:a05:6808:1a19:: with SMTP id
 bk25mr2154728oib.26.1643043334776; 
 Mon, 24 Jan 2022 08:55:34 -0800 (PST)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id v22sm4418370oot.10.2022.01.24.08.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 08:55:34 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/6 v2] media: uapi: Document format
 MEDIA_BUS_FMT_RGB565_1X24_CPADHI
Date: Mon, 24 Jan 2022 10:55:22 -0600
Message-Id: <20220124165526.1104-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124165526.1104-1-macroalpha82@gmail.com>
References: <20220124165526.1104-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 emma@anholt.net, airlied@linux.ie, robh+dt@kernel.org,
 thierry.reding@gmail.com, mchehab@kernel.org, sam@ravnborg.org,
 linux-media@vger.kernel.org
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


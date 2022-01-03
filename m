Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E52483659
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 18:41:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD75089ECD;
	Mon,  3 Jan 2022 17:41:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE4389EB8
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 17:41:13 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 n17-20020a9d64d1000000b00579cf677301so3572196otl.8
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jan 2022 09:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Pzkzaoed+K47iHzaJqEhqLiGfQj1VjXXbz9ZoyhQM0=;
 b=N6L2Ul7QUEenkPjRRgv/l6IEDTgLVat5tiL3JhKcO8EN6eyPC7yPPDb7ClKjbX8fL1
 TlGaFOd4Rb2+njXayCuojgatKJz1pwthpsDRtO/keYimWZUqLGmeRgC3v3IxurUrRnDY
 PUQ2VKcvLz35Kq/8CRoBJidQHfPE8xHLXMD/uJ5b30RaOSwPSWwDqG6uACd7rgcJQTHI
 NrE/Gg2Lz89JIkWScXtLslDMrKKyoiwDIeHhzO2lIFsv068fMowOl6yx6zvnTH52ES4e
 SlqOUlPRZQEoqGptgSUcrE75VwooWfQ1I6T9RMgFEC9FQfLOZJvutqj2m4n3gMx3drTY
 lULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Pzkzaoed+K47iHzaJqEhqLiGfQj1VjXXbz9ZoyhQM0=;
 b=xvPNviOyMxtuyGTx6xOiTBtYVPSZJjNtO4ji1rPxJpTeoJHv8JwR/8LT4lkDKHinVC
 ndtyDhYkyd6wVfgtSvnVpPTE4f4iGeFx/a5wmlFvTAyKj0PAyKzbzx+qu1KD/A5ykS29
 850/28l++3V6fy7ZEba9Ro4d20UILGv7L9Qdxcfo2tUCy+ouJd03JSKqEAIOAmUxzzw+
 hIVX90cmHMUDi2dn9TroInySIgm6SWThU8Jvw9oVKKINEGOXPMnECMZk0xZaI7T1cuyl
 Fi51jsmtyLM2RKX1YQ8YSUKEuUaNYk9Yf21E5td5OKixSEUF+Pj/nzUsXMCd6fPVbRH3
 A1XA==
X-Gm-Message-State: AOAM531AkBlN9xOTdghnfdUvJTLsbj7hJRQgExLS1NpVPJ4RLskdpyFc
 /YdqsBs50gvYdC8JqLAJxKJ/irysHp0=
X-Google-Smtp-Source: ABdhPJzzHFYQdiomeKRM6SW3QFSrviE/xKfuh0Ybmx4FgCL4JPezJHvj5LjmALlzjT8DjqAchO4GMg==
X-Received: by 2002:a05:6830:1d45:: with SMTP id
 p5mr33263761oth.350.1641231672859; 
 Mon, 03 Jan 2022 09:41:12 -0800 (PST)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id s6sm9368864ois.3.2022.01.03.09.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 09:41:12 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] media: uapi: Document format
 MEDIA_BUS_FMT_RGB565_1X24_CPADHI
Date: Mon,  3 Jan 2022 11:41:02 -0600
Message-Id: <20220103174106.907-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220103174106.907-1-macroalpha82@gmail.com>
References: <20220103174106.907-1-macroalpha82@gmail.com>
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
index bd68588b2683..f3dcfa763ebc 100644
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


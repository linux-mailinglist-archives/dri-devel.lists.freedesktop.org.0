Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA61498565
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 17:55:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDFFA10E247;
	Mon, 24 Jan 2022 16:55:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00BDB10E247
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 16:55:36 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id q186so26410349oih.8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 08:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BWDg9SYEC+Mkg9KQnlntZ124XiWBKPicMuFquWJ2wyc=;
 b=caRC2UDdoOX/PO5xoOgAt7dFqw/SBlhl733M+H3ft96s9z7jgEal2uadKNMQ5R84ju
 3DHEbsqII6apj9DO97YdnR62hOwMnuK8Rg0nMIGEn7m0Mj+XAnjdV1pFga4pPS4PkEb6
 pjeS/LTGxAldX7j5sJUjJ4ZZsgLIM5FY73YD9I6Bhy9DsJjgwTTtztK6mar4e4nNlUCh
 vvZM79Janqog4XGDvnACAn8bHhwX3uRnM+xUmXeqSGksAhTTEUO2NTWbC4fK5BKfqtks
 39T0kv2eEpO/NFQ7KqHk3S9BWLC1OldBnCVinMWY10W6PSaAD8gymsDogs+RkAvJ1v9V
 eegw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BWDg9SYEC+Mkg9KQnlntZ124XiWBKPicMuFquWJ2wyc=;
 b=skyRqM0Dohlg+y4KPQmXgMDavTK8yxWf9mHZuypFEIGEjCkCcZF4+gi9w2OtJRQRj2
 yRlC4VBmlrRI3uJ+PTD+FvJe8bAjfMU7MUgnNSevG0IshyYke7ja7oEVgW9XJaxORjXA
 y6Fo0umEfFw32hbdbG9vm0+UZ+TWU8P2PR91LjlbeWJpe+UuJL1T7gTGdPJ3SCrpPptu
 zV+oVrjxQMclJMwp8E+SsL+vDvVolEEPJmarZcvt8LXrmogpJZuHnD3mqmu1kg0Yn7+7
 nXmcscnxBd8RhNdkoansxosuoOB7//xLdIgdpld0dNKdozLHVZ8fQVO4GbydJ5UxkLaT
 dCTw==
X-Gm-Message-State: AOAM531ORxjrWN4EivpOO4WG2yjv1GVkhzDYsuNDjETt49ClnVwR0vun
 x9YQ6a/OY3usYo+jwQjGZ6kjXWb4+Rs=
X-Google-Smtp-Source: ABdhPJy2LVww5kIU+iO1Lc2CCWrOmfY8GKtA0JuU4h+LfajnpafkIsNrfraVDYoIYERBP1nkqqks3A==
X-Received: by 2002:aca:bc0a:: with SMTP id m10mr2277346oif.6.1643043335952;
 Mon, 24 Jan 2022 08:55:35 -0800 (PST)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id v22sm4418370oot.10.2022.01.24.08.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 08:55:35 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/6 v2] media: uapi: add MEDIA_BUS_FMT_RGB565_1X24_CPADHI
Date: Mon, 24 Jan 2022 10:55:23 -0600
Message-Id: <20220124165526.1104-4-macroalpha82@gmail.com>
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

Add the MEDIA_BUS_FMT_RGB565_1X24_CPADHI format used by the Geekworm
MZP280 panel for the Raspberry Pi.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 include/uapi/linux/media-bus-format.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index 0dfc11ee2..a7b765498 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -34,13 +34,14 @@
 
 #define MEDIA_BUS_FMT_FIXED			0x0001
 
-/* RGB - next is	0x101e */
+/* RGB - next is	0x101f */
 #define MEDIA_BUS_FMT_RGB444_1X12		0x1016
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE	0x1001
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE	0x1002
 #define MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE	0x1003
 #define MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE	0x1004
 #define MEDIA_BUS_FMT_RGB565_1X16		0x1017
+#define MEDIA_BUS_FMT_RGB565_1X24_CPADHI	0x101e
 #define MEDIA_BUS_FMT_BGR565_2X8_BE		0x1005
 #define MEDIA_BUS_FMT_BGR565_2X8_LE		0x1006
 #define MEDIA_BUS_FMT_RGB565_2X8_BE		0x1007
-- 
2.25.1


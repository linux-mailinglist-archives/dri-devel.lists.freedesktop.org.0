Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A804F24ECCB
	for <lists+dri-devel@lfdr.de>; Sun, 23 Aug 2020 12:46:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D07956E4A1;
	Sun, 23 Aug 2020 10:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD8306E497
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 10:45:56 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id v12so6429388ljc.10
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 03:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LDHEVusiKE3LU/z0ed6r9ko5jSq5It7ZMD8x3KyGe2E=;
 b=h5PJ/JQa8Goc7N2lsEmKt6Ah9v147nTIC1LE8RMV9jv3MvaZxTuKv4BdspXAzdCJV1
 sWPVSpn2J66DFalxL9f2d3fPOoHA6WuawRK3GeGHfawswO6w0YkX6/PiEdTadjwuiGFs
 7/Mk61z2D7j7EjKURYsq1lIyQdLtZK4BYI9YntNYEO/UUDnJNlKeRjyotzpwMdrLCVq7
 a9QL/DvR1GdiKe+DjypJmFmNYRjH5SfeAlZbmbY55ODJw5EbUnKKG+7J9f/SlvunWZdk
 BE0xVYcHJqYf1LGnm7R5ggeUIQ+QjTG8COyWybMOFAVEqYqF3FMCzxl4R1b5v4s908/q
 h5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LDHEVusiKE3LU/z0ed6r9ko5jSq5It7ZMD8x3KyGe2E=;
 b=ChVGhnVufxhu2Kb+4RXTTOaEEhWsODzKJKY18J5FbAWedheDo4lK0E3oGjtrJxqeQq
 u0ohELB3gfcVr3dtZKd8LkHq9vcLEy2U7jSfk0uXHcSlPH8UxEhTdBSWIzhbxmtVemvP
 AK8IGFmbAUc46Q2Kg7FFFU/GsR95W7l6ZWHZDPP3jaCUyyep9PEqtoKRk/nEwzf5djc6
 uYYDIHYwIbtTtM4s1oANWsBK3pzLqcti9WOePqHcjKTVsdc1cJYYiPFDKSbVchhNpYNV
 o7Le2Z+3w3qOjLODrCfkiGR1sayrbK4JNmFPDqICVPCRsgRjenZwJjcpr7IrOByyshHo
 Z2PQ==
X-Gm-Message-State: AOAM5307qsuh7Aet9StrLfXGyV11Zy1floJCreMVyFEd3UdZYcf1RLHd
 yaon1GqbRGAGX3Mj6r5KvDWxHKB4BWOVCg==
X-Google-Smtp-Source: ABdhPJyf7D5jX+BVx+9pKg7gx6FCs7Yx5jmaZdvg7uD2jysTEpQVwfVGKekhpT29LekqY5cio6BUZg==
X-Received: by 2002:a2e:7009:: with SMTP id l9mr427528ljc.274.1598179555064;
 Sun, 23 Aug 2020 03:45:55 -0700 (PDT)
Received: from saturn.localdomain ([2a00:fd00:805f:db00:2509:20d7:e461:9c16])
 by smtp.gmail.com with ESMTPSA id
 h13sm1516301lji.134.2020.08.23.03.45.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2020 03:45:54 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v2 02/24] backlight: Add DECLARE_* macro for device
 registration
Date: Sun, 23 Aug 2020 12:45:10 +0200
Message-Id: <20200823104532.1024798-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200823104532.1024798-1-sam@ravnborg.org>
References: <20200823104532.1024798-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Device registration almost always uses a struct backlight_properties
variable to pass config info. Make it simpler and less error prone
by the introduction of a number of macros.

There is one macro for each type of backlight {firmware, platform, raw}.
All members in struct backlight_properties are initialized.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 include/linux/backlight.h | 63 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index 190963ffb7fc..93a47a6cf681 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -272,6 +272,69 @@ struct backlight_properties {
 	enum backlight_scale scale;
 };
 
+/**
+ * BACKLIGHT_PROPS - init backlight_properties with default values
+ *
+ * This macro is used to initialize backlight_properties with default
+ * values. It is intended to be used when registering a backlight device
+ * and the properties needs to be adjusted at run-time, for example
+ * when the max_brightness is configurable.
+ *
+ * .. code-block:: c
+ *
+ *	struct backlight_properties props = {
+ *		BACKLIGHT_PROPS(0, 255, BACKLIGHT_RAW)
+ *	};
+ *	...
+ *	props.max_brightness = new_max;
+ *	err = devm_backlight_device_register(,,,, props);
+ *
+ */
+#define BACKLIGHT_PROPS(_brightness, _max_brightness, _type)	\
+	.brightness = _brightness,				\
+	.max_brightness = _max_brightness,			\
+	.power = FB_BLANK_POWERDOWN,				\
+	.type = _type,						\
+	.fb_blank = 0,						\
+	.state = 0,						\
+	.scale = BACKLIGHT_SCALE_UNKNOWN,
+
+/**
+ * DECLARE_BACKLIGHT_INIT_RAW - backlight_properties to init a raw
+ *                              backlight device
+ *
+ * This macro is used to initialize backlight_properties that is used when
+ * registering a raw backlight device.
+ */
+#define DECLARE_BACKLIGHT_INIT_RAW(name, _brightness, _max_brightness)		\
+	const struct backlight_properties name = {				\
+		BACKLIGHT_PROPS(_brightness, _max_brightness, BACKLIGHT_RAW)	\
+	}
+
+/**
+ * DECLARE_BACKLIGHT_INIT_PLATFORM - backlight_properties to init a platform
+ *                                   backlight device
+ *
+ * This macro is used to initialize backlight_properties that is used when
+ * registering a platform backlight device.
+ */
+#define DECLARE_BACKLIGHT_INIT_PLATFORM(name, _brightness, _max_brightness)		\
+	const struct backlight_properties name = {					\
+		BACKLIGHT_PROPS(_brightness, _max_brightness, BACKLIGHT_PLATFORM)	\
+	}
+
+/**
+ * DECLARE_BACKLIGHT_INIT_FIRMWARE - backlight_properties to init a firmware
+ *                                   backlight device
+ *
+ * This macro is used to initialize backlight_properties that is used when
+ * registering a firmware backlight device.
+ */
+#define DECLARE_BACKLIGHT_INIT_FIRMWARE(name, _brightness, _max_brightness)		\
+	const struct backlight_properties name = {					\
+		BACKLIGHT_PROPS(_brightness, _max_brightness, BACKLIGHT_FIRMWARE)	\
+	}
+
 /**
  * struct backlight_device - backlight device data
  *
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

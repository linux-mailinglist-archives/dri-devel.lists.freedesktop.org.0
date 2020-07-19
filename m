Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D6F2250A0
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jul 2020 10:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD946E4D4;
	Sun, 19 Jul 2020 08:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D51E989FA6
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 08:08:11 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id q4so17105795lji.2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 01:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3RUcaJY6Imga7z9yjmxNnpcAkotzVScUomdFLYOnGvQ=;
 b=ORygfOwPHmGDiAfidvtA6gezYW5vN+4TFXkhd7ENSWtDtuX32rd3n0xclJyZIlbRTS
 +wULYZiS5p0NFmiGibWftuzufX9MjwgsctIHUR5z3tT58wkoWlyJ/nF56YsdG1SrFwO+
 VSjDelJugBlHMTCIXV51Zuij6OCPS7Jg7Z8Uvl7RvwhVGUwrg8/DNMZSLEcCUTj2dz4d
 YdIUXrVzei9PVbBd2KeloJPXM/zA7vSPNRAsbBim8BX/BP+nIw4C2DGNC+OJ7zpzfhiX
 sMYMBXAHrWzIFi18epUdKMy2TYq2oJgp5SZlo6lJlJ1Qp85g4cz7i9OuKxF9vcHzrPI1
 rOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3RUcaJY6Imga7z9yjmxNnpcAkotzVScUomdFLYOnGvQ=;
 b=UovLgvwlaq2sgNVf88YNzVxaFIwiOVyIBmZY0aTQfIXuyiBpvAWzwZ4gSrnhYaw4aq
 M2jf5kHSaxDOt2Orl8GVfwiUpUJE5lTtnEVhRjhyy6hN4GFdfQNYRG2MksRbyLBv8w1h
 WbQ4LiMWiJvc5Kdc0vT5QVflrkf4rgdXe1J/V+Gu0rFxxo+LzOGL4dOaMfX5E2jEQItb
 XGAL+/JAF1+OnZkSgW/3h9EAQi3t0sOBp4i6o3ma3wNsEBzHvpWQWRuHgkjt3mbW76QN
 lBbp2ofKykZvE5q4y8bQOs2f3roc21pWFNS4OrkueLtM5eBBS+gfeZqnxOqoKn4lzk8W
 bKGw==
X-Gm-Message-State: AOAM532tpzrq+YajVPD0JrZ4hJRCAd6K0Q16hj8KYHex/e5ydXYWhTTk
 CnifWEUl2Iurp+ls3uLTbSsig+XdVNY=
X-Google-Smtp-Source: ABdhPJyyI/K6d3HgjhDDL7/rXHjc87MBW3+ZW7H3JRwctBUSNP94o7t67Tm6hLZJj1AfCgMxVfSpnQ==
X-Received: by 2002:a2e:91c4:: with SMTP id u4mr8257366ljg.20.1595146090059;
 Sun, 19 Jul 2020 01:08:10 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:d5fe:fe9c:fc06:b74c])
 by smtp.gmail.com with ESMTPSA id 72sm732407lfh.97.2020.07.19.01.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jul 2020 01:08:09 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v5 05/19] backlight: improve backlight_device documentation
Date: Sun, 19 Jul 2020 10:07:29 +0200
Message-Id: <20200719080743.8560-6-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200719080743.8560-1-sam@ravnborg.org>
References: <20200719080743.8560-1-sam@ravnborg.org>
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
Cc: linux-pwm@vger.kernel.org,
 Support Opensource <support.opensource@diasemi.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jonathan Corbet <corbet@lwn.net>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Andy Gross <agross@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, patches@opensource.cirrus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Improve the documentation for backlight_device and
adapt it to kernel-doc style.

The updated documentation is more strict on how locking is used.
With the update neither update_lock nor ops_lock may be used
outside the backlight core.
This restriction was introduced to keep the locking simple
by keeping it in the core.
It was verified that this documents the current state by renaming
update_lock => bl_update_lock and ops_lock => bl_ops_lock.
The rename did not reveal any uses outside the backlight core.
The rename is NOT part of this patch.

v3:
  - Update changelog to explain locking details (Daniel)

v2:
  - Add short intro to all fields (Daniel)
  - Updated description of update_lock (Daniel)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Jingoo Han <jingoohan1@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 include/linux/backlight.h | 72 ++++++++++++++++++++++++++-------------
 1 file changed, 49 insertions(+), 23 deletions(-)

diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index 10518b00b059..7654fe5f1589 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -14,21 +14,6 @@
 #include <linux/mutex.h>
 #include <linux/notifier.h>
 
-/* Notes on locking:
- *
- * backlight_device->ops_lock is an internal backlight lock protecting the
- * ops pointer and no code outside the core should need to touch it.
- *
- * Access to update_status() is serialised by the update_lock mutex since
- * most drivers seem to need this and historically get it wrong.
- *
- * Most drivers don't need locking on their get_brightness() method.
- * If yours does, you need to implement it in the driver. You can use the
- * update_lock mutex if appropriate.
- *
- * Any other use of the locks below is probably wrong.
- */
-
 enum backlight_update_reason {
 	BACKLIGHT_UPDATE_HOTKEY,
 	BACKLIGHT_UPDATE_SYSFS,
@@ -215,30 +200,71 @@ struct backlight_properties {
 	enum backlight_scale scale;
 };
 
+/**
+ * struct backlight_device - backlight device data
+ *
+ * This structure holds all data required by a backlight device.
+ */
 struct backlight_device {
-	/* Backlight properties */
+	/**
+	 * @props: Backlight properties
+	 */
 	struct backlight_properties props;
 
-	/* Serialise access to update_status method */
+	/**
+	 * @update_lock: The lock used when calling the update_status() operation.
+	 *
+	 * update_lock is an internal backlight lock that serialise access
+	 * to the update_status() operation. The backlight core holds the update_lock
+	 * when calling the update_status() operation. The update_lock shall not
+	 * be used by backlight drivers.
+	 */
 	struct mutex update_lock;
 
-	/* This protects the 'ops' field. If 'ops' is NULL, the driver that
-	   registered this device has been unloaded, and if class_get_devdata()
-	   points to something in the body of that driver, it is also invalid. */
+	/**
+	 * @ops_lock: The lock used around everything related to backlight_ops.
+	 *
+	 * ops_lock is an internal backlight lock that protects the ops pointer
+	 * and is used around all accesses to ops and when the operations are
+	 * invoked. The ops_lock shall not be used by backlight drivers.
+	 */
 	struct mutex ops_lock;
+
+	/**
+	 * @ops: Pointer to the backlight operations.
+	 *
+	 * If ops is NULL, the driver that registered this device has been unloaded,
+	 * and if class_get_devdata() points to something in the body of that driver,
+	 * it is also invalid.
+	 */
 	const struct backlight_ops *ops;
 
-	/* The framebuffer notifier block */
+	/**
+	 * @fb_notif: The framebuffer notifier block
+	 */
 	struct notifier_block fb_notif;
 
-	/* list entry of all registered backlight devices */
+	/**
+	 * @entry: List entry of all registered backlight devices
+	 */
 	struct list_head entry;
 
+	/**
+	 * @dev: Parent device.
+	 */
 	struct device dev;
 
-	/* Multiple framebuffers may share one backlight device */
+	/**
+	 * @fb_bl_on: The state of individual fbdev's.
+	 *
+	 * Multiple fbdev's may share one backlight device. The fb_bl_on
+	 * records the state of the individual fbdev.
+	 */
 	bool fb_bl_on[FB_MAX];
 
+	/**
+	 * @use_count: The number of uses of fb_bl_on.
+	 */
 	int use_count;
 };
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

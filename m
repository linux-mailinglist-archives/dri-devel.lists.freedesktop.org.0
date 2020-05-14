Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 635751D3C1C
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 21:10:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 208A26EBB5;
	Thu, 14 May 2020 19:10:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B19516EBB5
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 19:10:40 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id 82so2080564lfh.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 12:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w93KHIix1KwNNTaPJvVdVMvh/rS96v+7uJyDQPCp+jo=;
 b=eGDXq2gkkYR9ddSm7q5nNuNKvYqB6zVrH2D2RQC9Xt+MBfpZUUQ7kXef5J1CxCmeNC
 4t4nlDUVE7vNuetbObaCXcZ0N4C4NDzaGgMCdPTYgn1kqv694TEhGr9xtD0qbFNDO7fr
 zloc2SqbsohpuzLpixER84WBHIJCpAa515vPWwaq2CrhO5LFUMSuxfZO+BIX1EdBWMob
 4BhW9wqqDcHJMFd4eA1JkCCyKp5RbdbKU5vH3eYqz/PIZcPEGvwJsfetEAVLvrKeh55X
 X4FKRQDwx+e2gKr6srXsumCcrw7Aa9hQ2qVP8qAfWP2qSaLIRoORwrU6ZZdSVbHtiBCU
 6fgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=w93KHIix1KwNNTaPJvVdVMvh/rS96v+7uJyDQPCp+jo=;
 b=KUrVekx3PZ04KJaqUv5O7t9ZotjTx0dI+PNSPvZhFwdg+m1hF2KJLoFcQ91ljnDpNL
 /Bv4Slz+KtUfDF7NPEI3aHmmolqE3wfPFVC77O0shgbWLm2h3SQ4mNS0Gj6IXYYIW2PC
 VnRS4ULAJRV2GLc06RFK4vd0i031cXBaCxIlYJhzzPXq1smuwvTz8YakX7JMg4wr0GYg
 8KyfcRg95mpxGhlFG4rAYRngpO7avqtWrNoVUBYXgEvKvIvlvxi8Zl1m1toZIhn/zrpO
 CtTXmN8vUj2PSjvbxOQ5epbLGuMJ/+s8X2PqxJY10F0tiy8QjF95WU/rm/G+luzmq8FE
 7oCg==
X-Gm-Message-State: AOAM531a+J2qDbtbYWgXcxXrZofDF+vt1h9XTjtKkIm50fVD01ruoVt5
 PDG5j0UZX+Nn19LFCLLy63Z5IjvSsD0cdw==
X-Google-Smtp-Source: ABdhPJxnjy1VIP5/HwcaRpS7WhqMTnte+MydT1bqKgrCc6fGers5oSxc2xs7YND2DJSTZnsR18PdZg==
X-Received: by 2002:ac2:5f73:: with SMTP id c19mr4211562lfc.135.1589483438819; 
 Thu, 14 May 2020 12:10:38 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:8d23:71d:e677:1c7c])
 by smtp.gmail.com with ESMTPSA id q30sm2362958lfd.32.2020.05.14.12.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 12:10:38 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v1 11/18] backlight: improve backlight_device documentation
Date: Thu, 14 May 2020 21:09:54 +0200
Message-Id: <20200514191001.457441-12-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200514191001.457441-1-sam@ravnborg.org>
References: <20200514191001.457441-1-sam@ravnborg.org>
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jonathan Corbet <corbet@lwn.net>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Russell King <linux@armlinux.org.uk>,
 Andy Gross <agross@kernel.org>,
 Uwe Kleine Konig <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, linux-arm-msm@vger.kernel.org,
 Jyri Sarha <jsarha@ti.com>, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>,
 Support Opensource <support.opensource@diasemi.com>,
 patches@opensource.cirrus.com, Douglas Anderson <dianders@chromium.org>,
 Zheng Bin <zhengbin13@huawei.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Enrico Weigelt <info@metux.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Improve the documentation for backlight_device and
adapt it to kernel-doc style.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 include/linux/backlight.h | 81 ++++++++++++++++++++++++++++-----------
 1 file changed, 58 insertions(+), 23 deletions(-)

diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index c81b77af44d4..34ba1e444334 100644
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
@@ -221,30 +206,80 @@ struct backlight_properties {
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
+	 * @props:
+	 *
+	 * Backlight properties
+	 */
 	struct backlight_properties props;
 
-	/* Serialise access to update_status method */
+	/**
+	 * @update_lock:
+	 *
+	 * update_lock is an internal backlight lock that serialise access
+	 * to the update_status() method. The iupdate_lock mutex shall not be used
+	 * by backlight drivers.
+	 */
 	struct mutex update_lock;
 
-	/* This protects the 'ops' field. If 'ops' is NULL, the driver that
-	   registered this device has been unloaded, and if class_get_devdata()
-	   points to something in the body of that driver, it is also invalid. */
+	/**
+	 * @ops_lock:
+	 *
+	 * ops_lock is an internal backlight lock that protects the ops pointer
+	 * and is used around all accesses to ops and when the operations are
+	 * invoked. The mutex shall not be used by backlight drivers.
+	 */
 	struct mutex ops_lock;
+
+	/**
+	 * @ops:
+	 *
+	 * Pointer to the backlight operations. If ops is NULL, the driver that
+	 * registered this device has been unloaded, and if class_get_devdata()
+	 * points to something in the body of that driver, it is also invalid.
+	 */
 	const struct backlight_ops *ops;
 
-	/* The framebuffer notifier block */
+	/**
+	 * @fb_notif:
+	 *
+	 * The framebuffer notifier block
+	 */
 	struct notifier_block fb_notif;
 
-	/* list entry of all registered backlight devices */
+	/**
+	 * @entry:
+	 *
+	 * List entry of all registered backlight devices
+	 */
 	struct list_head entry;
 
+	/**
+	 * @dev:
+	 *
+	 * Parent device.
+	 */
 	struct device dev;
 
-	/* Multiple framebuffers may share one backlight device */
+	/**
+	 * @fb_bl_on:
+	 *
+	 * Multiple fbdev's may share one backlight device. The fb_bl_on
+	 * records the state of the individual fbdev.
+	 */
 	bool fb_bl_on[FB_MAX];
 
+	/**
+	 * @use_count:
+	 *
+	 * The number of uses of fb_bl_on.
+	 */
 	int use_count;
 };
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

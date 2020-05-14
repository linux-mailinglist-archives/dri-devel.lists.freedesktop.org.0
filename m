Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEAC1D3C15
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 21:10:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC91E6EBAC;
	Thu, 14 May 2020 19:10:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4865C6EBAC
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 19:10:25 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id f18so4723758lja.13
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 12:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5PQMEcv1NfMXN6wgUUifwpupdvWgrHF4WujE2wy4cnE=;
 b=oj0oQMsctNEpY1Wsm80tWYK/q7dzRkAqb6HlnzXJUL19Cgmz4XskAKYFsBqvAuDqmR
 Tb6ANd9TbmRjHWu2Fi4ZgPck973cCMYCiI2gGKP2evVR8HKW0Uec8a1bSvCX4jMsBtp7
 v+PgVhXgn1CHe9CRVJDwFex4n1MFv0Fq9MPCLFjQ1soe26jMwinI6RRNQVOrtUJjKFQD
 zk95KlNJOtSxy/L3D0nlWAmJuotrWdD9Rl/dQMGD7QjXrO1VMCxoZCdCWKu+n0OHOQsC
 OLAwaYaIaM9+L8bl5EYgYapIbN4gS07Zp9eAIW7DiVadx9TmJKp0aam96POD0/0IpIcO
 10fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5PQMEcv1NfMXN6wgUUifwpupdvWgrHF4WujE2wy4cnE=;
 b=iuYgrvI5uW1g5J3d3mdhGrQgs52CMvSVhc/dctt4eaEDU1Px4kxE6wS94EnKN4ptOy
 rwmE0AjJN8zKV/JLDmbSNJNnlAMtn3dvzNk1+2/QSXA4zIlbqTBAe+tiGc7rI0QXWxCL
 F28iaRwfmqSYwybVRY4af4CpsuJgOS4BjwmJi4BRMgPPz1J9V6qNUS23Yo3Vq9YEHdSo
 QGyXbiSPnxzdUoErlrt824iGXAHNtdUV4acQi8ykEhyOVD2cZvuH0CunL/ZgZ/69lBXD
 hsI5Xe/NR9Zk6yezhFq2rw5opgJRFoxj4ihegmtwbjCVBcKUUKb1bJD3t0I1rM+qD87T
 70pg==
X-Gm-Message-State: AOAM531aGQjWyQNGwP2epKHwOqquUiJk4NaF8PLZ9ksmEKeqT7h7b7g1
 9cvmCu7gnCEEia4AxxVWdgGq6TktseWglg==
X-Google-Smtp-Source: ABdhPJzQGH3odWJt1CgHuRerG8SSDuaUrK5vOO5PmO0Wr7eBmwauHxTg8DZWDE/ijgcS4S+dMFzoxg==
X-Received: by 2002:a2e:9843:: with SMTP id e3mr3717492ljj.249.1589483422387; 
 Thu, 14 May 2020 12:10:22 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:8d23:71d:e677:1c7c])
 by smtp.gmail.com with ESMTPSA id q30sm2362958lfd.32.2020.05.14.12.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 12:10:21 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v1 04/18] backlight: make of_find_backlight static
Date: Thu, 14 May 2020 21:09:47 +0200
Message-Id: <20200514191001.457441-5-sam@ravnborg.org>
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

There are no external users of of_find_backlight,
as they have all changed to use the managed version.
Make of_find_backlight static to prevent new external users.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 drivers/video/backlight/backlight.c | 31 ++++++++++-------------------
 include/linux/backlight.h           |  6 ------
 2 files changed, 11 insertions(+), 26 deletions(-)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index cac3e35d7630..511bb382c584 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -600,22 +600,7 @@ struct backlight_device *of_find_backlight_by_node(struct device_node *node)
 EXPORT_SYMBOL(of_find_backlight_by_node);
 #endif
 
-/**
- * of_find_backlight - Get backlight device
- * @dev: Device
- *
- * This function looks for a property named 'backlight' on the DT node
- * connected to @dev and looks up the backlight device.
- *
- * Call backlight_put() to drop the reference on the backlight device.
- *
- * Returns:
- * A pointer to the backlight device if found.
- * Error pointer -EPROBE_DEFER if the DT property is set, but no backlight
- * device is found.
- * NULL if there's no backlight property.
- */
-struct backlight_device *of_find_backlight(struct device *dev)
+static struct backlight_device *of_find_backlight(struct device *dev)
 {
 	struct backlight_device *bd = NULL;
 	struct device_node *np;
@@ -641,7 +626,6 @@ struct backlight_device *of_find_backlight(struct device *dev)
 
 	return bd;
 }
-EXPORT_SYMBOL(of_find_backlight);
 
 static void devm_backlight_release(void *data)
 {
@@ -652,9 +636,16 @@ static void devm_backlight_release(void *data)
  * devm_of_find_backlight - Resource-managed of_find_backlight()
  * @dev: Device
  *
- * Device managed version of of_find_backlight().
- * The reference on the backlight device is automatically
- * dropped on driver detach.
+ * This function looks for a property named 'backlight' on the DT node
+ * connected to @dev and looks up the backlight device.
+ * The lookup is device managed so the reference to the backlight device
+ * is automatically dropped on driver detach.
+ *
+ * Returns:
+ * A pointer to the backlight device if found.
+ * Error pointer -EPROBE_DEFER if the DT property is set, but no backlight
+ * device is found.
+ * NULL if there's no backlight property.
  */
 struct backlight_device *devm_of_find_backlight(struct device *dev)
 {
diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index c7d6b2e8c3b5..a0f03bb322d7 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -219,14 +219,8 @@ of_find_backlight_by_node(struct device_node *node)
 #endif
 
 #if IS_ENABLED(CONFIG_BACKLIGHT_CLASS_DEVICE)
-struct backlight_device *of_find_backlight(struct device *dev);
 struct backlight_device *devm_of_find_backlight(struct device *dev);
 #else
-static inline struct backlight_device *of_find_backlight(struct device *dev)
-{
-	return NULL;
-}
-
 static inline struct backlight_device *
 devm_of_find_backlight(struct device *dev)
 {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

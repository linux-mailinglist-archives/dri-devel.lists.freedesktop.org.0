Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 860202250B5
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jul 2020 10:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 533B86E4E8;
	Sun, 19 Jul 2020 08:08:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B0D26E4E6
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 08:08:19 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id q4so17105942lji.2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 01:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O4c9ly/L0FfgYEmNUVRjqrtL59zDVgm0wx/HOjFcQ3I=;
 b=FtF2pRbS5DQLXCD2a1YTmqhhahX6eGlpeO6iEjEHi22mGxNzv0K2je1AEjF28GvsBJ
 j2AXGJx3nvqDZsOgaBF39c8XucfX58qVEXwkyluUgJrpgaMK3mczQ0LNbNa7xZOZKC71
 oH4pr15thIrbA+cmy76KaX+QamzLIhP2ymktDPUIsZ6Q/nZcRlKFtgjmm/3Sl5gnD83C
 I1ooVip9cKYmUSVWH8vyVt2RgfXTbVoAjrnjrZm6tfkTbTprpVpw4YqfsA95Tmp68HK6
 D90XSlm2RdZQURxYim19ty8aLRjrCBA3nm+CbswQ9eG00C13xZ1NfKQInV2M3uf8vdN3
 5zkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=O4c9ly/L0FfgYEmNUVRjqrtL59zDVgm0wx/HOjFcQ3I=;
 b=MMkuUp8956SZW+gWgGsWngfZH3aBmoeBqKOpu1F397l2uo/IL6/05ou73JseUL3QJg
 bOfbSJc1HkFUHOYW7vFF9hvuOm3tYKtEaYiwW0OcRcjFot5HtSqhuxl4RT15wuAZhTVi
 CH9xJ7QRWbs1xMfMoBJjRdZPcjD5uvARpveeOSSybukIpUO2hjdDly7PoBt8QuNJtwhl
 lhobeq3mIi9oXFLwiH1X2xXEwplsuMvfUxVjCIFwfPr2vsXtePjK79r8sSA6h/BxZ1eb
 fOEYgLioxow8xwMcN6Uy5ciEF0AqbB7B0JjMTcsS6AOKNIvptzTXa5MgR83kGMSa0zSs
 EGPg==
X-Gm-Message-State: AOAM530Qm0ZlzMy3HPYhqqKOEwrLLYq45Hkk53lHthmQK4nryt+gmtH3
 URsF8i8He3Du/XSeEQFohhLSHG6XTPc=
X-Google-Smtp-Source: ABdhPJxQOn3En4bRkcA0sF5fcqezKrehiuhV6m4ZdNBfT6KXer5eDsKaYwKP9d7EBx8S9hJGZ++u+A==
X-Received: by 2002:a05:651c:550:: with SMTP id
 q16mr7594805ljp.188.1595146097319; 
 Sun, 19 Jul 2020 01:08:17 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:d5fe:fe9c:fc06:b74c])
 by smtp.gmail.com with ESMTPSA id 72sm732407lfh.97.2020.07.19.01.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jul 2020 01:08:16 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v5 10/19] backlight: add overview and update existing doc
Date: Sun, 19 Jul 2020 10:07:34 +0200
Message-Id: <20200719080743.8560-11-sam@ravnborg.org>
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

Add overview chapter to backlight.c.
Update existing kernel-doc to follow a more consistent
style and drop kernel-doc for deprecated functions.

v4:
  - Include updated devm_of_find_backlight doc
    (was accidently included in a later patch)

v3:
  - Updated a few editorial details (Daniel)

v2:
  - Sevaral editorial corrections that makes reading
    much easier (Daniel)
  - Spelling fixes (Daniel)
  - updated intro chapter with a little more info

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 drivers/video/backlight/backlight.c | 140 +++++++++++++++++++---------
 1 file changed, 98 insertions(+), 42 deletions(-)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index 18501956dd87..93ae8c63fe4c 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -22,6 +22,47 @@
 #include <asm/backlight.h>
 #endif
 
+/**
+ * DOC: overview
+ *
+ * The backlight core supports implementing backlight drivers.
+ *
+ * A backlight driver registers a driver using
+ * devm_backlight_device_register(). The properties of the backlight
+ * driver such as type and max_brightness must be specified.
+ * When the core detect changes in for example brightness or power state
+ * the update_status() operation is called. The backlight driver shall
+ * implement this operation and use it to adjust backlight.
+ *
+ * Several sysfs attributes are provided by the backlight core::
+ *
+ * - brightness         R/W, set the requested brightness level
+ * - actual_brighness   RO, the brightness level used by the HW
+ * - max_brightness     RO, the maximum  brightness level supported
+ *
+ * See Documentation/ABI/stable/sysfs-class-backlight for the full list.
+ *
+ * The backlight can be adjusted using the sysfs interface, and
+ * the backlight driver may also support adjusting backlight using
+ * a hot-key or some other platfrom or firmware specific way.
+ *
+ * The driver must implement the get_brightness() operation if
+ * the HW do not support all the levels that can be specified in
+ * brightness, thus providing user-space access to the actual level
+ * via the actual_brightness attribute.
+ *
+ * When the backlight changes this is reported to user-space using
+ * an uevent connected to the actual_brightness attribute.
+ * When brightness is set by platform specific means, for example
+ * a hot-key to adjust backlight, the driver must notify the backlight
+ * core that brightness has changed using backlight_force_update().
+ *
+ * The backlight driver core receives notifications from fbdev and
+ * if the event is FB_EVENT_BLANK and if the value of blank, from the
+ * FBIOBLANK ioclt, results in a change in the backlight state the
+ * update_status() operation is called.
+ */
+
 static struct list_head backlight_dev_list;
 static struct mutex backlight_dev_list_mutex;
 static struct blocking_notifier_head backlight_notifier;
@@ -40,9 +81,17 @@ static const char *const backlight_scale_types[] = {
 
 #if defined(CONFIG_FB) || (defined(CONFIG_FB_MODULE) && \
 			   defined(CONFIG_BACKLIGHT_CLASS_DEVICE_MODULE))
-/* This callback gets called when something important happens inside a
- * framebuffer driver. We're looking if that important event is blanking,
- * and if it is and necessary, we're switching backlight power as well ...
+/*
+ * fb_notifier_callback
+ *
+ * This callback gets called when something important happens inside a
+ * framebuffer driver. The backlight core only cares about FB_BLANK_UNBLANK
+ * which is reported to the driver using backlight_update_status()
+ * as a state change.
+ *
+ * There may be several fbdev's connected to the backlight device,
+ * in which case they are kept track of. A state change is only reported
+ * if there is a change in backlight for the specified fbdev.
  */
 static int fb_notifier_callback(struct notifier_block *self,
 				unsigned long event, void *data)
@@ -324,7 +373,10 @@ ATTRIBUTE_GROUPS(bl_device);
  * @reason: reason for update
  *
  * Updates the internal state of the backlight in response to a hardware event,
- * and generate a uevent to notify userspace
+ * and generates an uevent to notify userspace. A backlight driver shall call
+ * backlight_force_update() when the backlight is changed using, for example,
+ * a hot-key. The updated brightness is read using get_brightness() and the
+ * brightness value is reported using an uevent.
  */
 void backlight_force_update(struct backlight_device *bd,
 			    enum backlight_update_reason reason)
@@ -337,20 +389,7 @@ void backlight_force_update(struct backlight_device *bd,
 }
 EXPORT_SYMBOL(backlight_force_update);
 
-/**
- * backlight_device_register - create and register a new object of
- *   backlight_device class.
- * @name: the name of the new object(must be the same as the name of the
- *   respective framebuffer device).
- * @parent: a pointer to the parent device
- * @devdata: an optional pointer to be stored for private driver use. The
- *   methods may retrieve it by using bl_get_data(bd).
- * @ops: the backlight operations structure.
- * @props: pointer to backlight's properties structure.
- *
- * Creates and registers new backlight device. Returns either an
- * ERR_PTR() or a pointer to the newly allocated device.
- */
+/* deprecated - use devm_backlight_device_register() */
 struct backlight_device *backlight_device_register(const char *name,
 	struct device *parent, void *devdata, const struct backlight_ops *ops,
 	const struct backlight_properties *props)
@@ -417,6 +456,15 @@ struct backlight_device *backlight_device_register(const char *name,
 }
 EXPORT_SYMBOL(backlight_device_register);
 
+/** backlight_device_get_by_type - find first backlight device of a type
+ * @type: the type of backlight device
+ *
+ * Look up the first backlight device of the specified type
+ *
+ * RETURNS:
+ *
+ * Pointer to backlight device if any was found. Otherwise NULL.
+ */
 struct backlight_device *backlight_device_get_by_type(enum backlight_type type)
 {
 	bool found = false;
@@ -456,12 +504,7 @@ struct backlight_device *backlight_device_get_by_name(const char *name)
 }
 EXPORT_SYMBOL(backlight_device_get_by_name);
 
-/**
- * backlight_device_unregister - unregisters a backlight device object.
- * @bd: the backlight device object to be unregistered and freed.
- *
- * Unregisters a previously registered via backlight_device_register object.
- */
+/* deprecated - use devm_backlight_device_unregister() */
 void backlight_device_unregister(struct backlight_device *bd)
 {
 	if (!bd)
@@ -509,10 +552,12 @@ static int devm_backlight_device_match(struct device *dev, void *res,
  * backlight_register_notifier - get notified of backlight (un)registration
  * @nb: notifier block with the notifier to call on backlight (un)registration
  *
- * @return 0 on success, otherwise a negative error code
- *
  * Register a notifier to get notified when backlight devices get registered
  * or unregistered.
+ *
+ * RETURNS:
+ *
+ * 0 on success, otherwise a negative error code
  */
 int backlight_register_notifier(struct notifier_block *nb)
 {
@@ -524,10 +569,12 @@ EXPORT_SYMBOL(backlight_register_notifier);
  * backlight_unregister_notifier - unregister a backlight notifier
  * @nb: notifier block to unregister
  *
- * @return 0 on success, otherwise a negative error code
- *
  * Register a notifier to get notified when backlight devices get registered
  * or unregistered.
+ *
+ * RETURNS:
+ *
+ * 0 on success, otherwise a negative error code
  */
 int backlight_unregister_notifier(struct notifier_block *nb)
 {
@@ -536,20 +583,22 @@ int backlight_unregister_notifier(struct notifier_block *nb)
 EXPORT_SYMBOL(backlight_unregister_notifier);
 
 /**
- * devm_backlight_device_register - resource managed backlight_device_register()
+ * devm_backlight_device_register - register a new backlight device
  * @dev: the device to register
  * @name: the name of the device
- * @parent: a pointer to the parent device
+ * @parent: a pointer to the parent device (often the same as @dev)
  * @devdata: an optional pointer to be stored for private driver use
  * @ops: the backlight operations structure
  * @props: the backlight properties
  *
- * @return a struct backlight on success, or an ERR_PTR on error
+ * Creates and registers new backlight device. When a backlight device
+ * is registered the configuration must be specified in the @props
+ * parameter. See description of &backlight_properties.
  *
- * Managed backlight_device_register(). The backlight_device returned
- * from this function are automatically freed on driver detach.
- * See backlight_device_register() for more information.
- */
+ * RETURNS:
+ *
+ * struct backlight on success, or an ERR_PTR on error
+*/
 struct backlight_device *devm_backlight_device_register(struct device *dev,
 	const char *name, struct device *parent, void *devdata,
 	const struct backlight_ops *ops,
@@ -576,13 +625,13 @@ struct backlight_device *devm_backlight_device_register(struct device *dev,
 EXPORT_SYMBOL(devm_backlight_device_register);
 
 /**
- * devm_backlight_device_unregister - resource managed backlight_device_unregister()
+ * devm_backlight_device_unregister - unregister backlight device
  * @dev: the device to unregister
  * @bd: the backlight device to unregister
  *
- * Deallocated a backlight allocated with devm_backlight_device_register().
+ * Deallocates a backlight allocated with devm_backlight_device_register().
  * Normally this function will not need to be called and the resource management
- * code will ensure that the resource is freed.
+ * code will ensure that the resources are freed.
  */
 void devm_backlight_device_unregister(struct device *dev,
 				struct backlight_device *bd)
@@ -673,12 +722,19 @@ static void devm_backlight_release(void *data)
 }
 
 /**
- * devm_of_find_backlight - Resource-managed of_find_backlight()
- * @dev: Device
+ * devm_of_find_backlight - find backlight for a device
+ * @dev: the device
  *
- * Device managed version of of_find_backlight().
- * The reference on the backlight device is automatically
+ * This function looks for a property named 'backlight' on the DT node
+ * connected to @dev and looks up the backlight device. The lookup is
+ * device managed so the reference to the backlight device is automatically
  * dropped on driver detach.
+ *
+ * RETURNS:
+ *
+ * A pointer to the backlight device if found.
+ * Error pointer -EPROBE_DEFER if the DT property is set, but no backlight
+ * device is found. NULL if there's no backlight property.
  */
 struct backlight_device *devm_of_find_backlight(struct device *dev)
 {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

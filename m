Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96628618BEB
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 23:48:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D73710E697;
	Thu,  3 Nov 2022 22:47:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC3310E683
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 22:47:39 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id 130so2960694pfu.8
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 15:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OpJqV269dmxPiy2x5jEutyBsbCSaPK9GSjGKfIXbXdk=;
 b=dlZ/fdF2gWei4tdt6X230opQrrul11vKHrCLup5DzYbbg5GcNw3/lPEjHjhOchKC/0
 bHwxsx8O6qfED5aPAFKzdFj8ovPJEnVwWdj9zZgqgPZKas8sTqKHWAz8Pr+bajJ4jnej
 SctQAQ0C+hSDvrpkk97zUMEiu8tg7UagMtA+bTi+VU8dBH3X4M5ogWReLmOTbd052Bu/
 vvmR8bHfjVNMIcJ0wHiBMsK6y7/cObovwhtcHIFsc71WpV2a6fm0VBloFXrM+rklTtuW
 qPZeifL5e6FtggVnYQXL6ySO0ciWLGhNTimCHL2lOQLfuaXjxVlk8QX0Oxa7QUf6Xb59
 2JCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OpJqV269dmxPiy2x5jEutyBsbCSaPK9GSjGKfIXbXdk=;
 b=myxD+X94i4jAtVssDDRN/s9VxUkZSfBNzvo22BsFiobK0RCQxxvs3AzI14mjvhEFA/
 ah4dU9htpEwTAS8UukaFPnSdaw/SahnRP+HuW5joSPOroMsubM/3Xqlk7MOOB19Jnvte
 V3dwJ6nMqOyO+zGkpU16ggshBon5LvDbw4GZym75OJBmvlDTsN+/a4IMDu4GrcQmilaS
 NLSd7jDx96nFjg4pQwsVSy2JlmR6tiyf2HjE5qLAlP+wlwXFU0XePr5pZk7MY7lSgLAV
 OS9cTr3ShKEN6+9FRIq3I20ewwhvAgTcdPj6lKPj1MEDD3+mr+rXYFm2MN6ZRxqBVnic
 OdaQ==
X-Gm-Message-State: ACrzQf0W/FV7H/MmiAFVf2zelIYV9A0b2TjA51y0AOpPI3OzvpXly1ze
 vTWSHgr9TJRD0SUaVPz6+17THqFyoH0=
X-Google-Smtp-Source: AMsMyM6fTrhxDrKHSq7wbNn6fd7B+7MO6dL15NJwk5BhAWfrbdpJVAwdXTG0v2iOTXgRO9RbqaKVAQ==
X-Received: by 2002:a62:1544:0:b0:56d:6af0:c131 with SMTP id
 65-20020a621544000000b0056d6af0c131mr23948193pfv.51.1667515658645; 
 Thu, 03 Nov 2022 15:47:38 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:9d:2:a6ae:11ff:fe11:fcc3])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa796ad000000b0056be1d7d4a3sm1280421pfk.73.2022.11.03.15.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 15:47:37 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Helge Deller <deller@gmx.de>, Tony Lindgren <tony@atomide.com>,
 Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 10/13] omapfb: encoder-opa362: fix included headers
Date: Thu,  3 Nov 2022 15:46:53 -0700
Message-Id: <20221103-omapfb-gpiod-v1-10-c3d53ca7988f@gmail.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
In-Reply-To: <20221103-omapfb-gpiod-v1-0-c3d53ca7988f@gmail.com>
References: <20221103-omapfb-gpiod-v1-0-c3d53ca7988f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-5166b
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
Cc: linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver has been switched to gpiod API, so it should include
gpio/consumer.h instead of gpio.h and of_gpio.h.

With of_gpio.h no longer included we need mod_devicetable.h for
of_device_id definition.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/video/fbdev/omap2/omapfb/displays/encoder-opa362.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/encoder-opa362.c b/drivers/video/fbdev/omap2/omapfb/displays/encoder-opa362.c
index ba7ed4039f8a..dd29dc5c77ec 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/encoder-opa362.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/encoder-opa362.c
@@ -11,11 +11,11 @@
  * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
  */
 
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
+#include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <linux/of_gpio.h>
 
 #include <video/omapfb_dss.h>
 

-- 
b4 0.11.0-dev-5166b

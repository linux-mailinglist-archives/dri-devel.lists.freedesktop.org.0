Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A01EB1D3C20
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 21:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7622C6EBB9;
	Thu, 14 May 2020 19:10:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A2A6EBB6
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 19:10:48 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id r17so3584463lff.9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 12:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k+fYBnpUxdD0+lpDaEI6w4m+CbJ5UGddgxFwRuGeORE=;
 b=R7NzrctqgtXQJS3grrlCPGzWGsCfe4ksm+P7pT2D3yz0IXyglmxFJjfYfjTpkVhphC
 yp0XR+p/ME4HsJIM7OK34eEY/Ry/Ig/Yij4eN5Y/keWxcEyfoJt3j54KL7BUUJc3Hjwi
 KxdjGN4yZFeuBwMNS0LV+9ZYsTt5Gie6RegfdgoZDk+tKGNyl0KMqmxM3G9/WfFCvzUQ
 HRxXA/UZHyoIMafTAlpilKiSSCJNIwGUrR53dItkAGwTHNNx3ujbIGicy/0Orppqz/sE
 ZkPDj9Cs5JE6aDPh/el55OykGqpwNCHjZDjTMX3Ga7/U+SV4I88WDDT66wY77pjFFlBy
 4x2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=k+fYBnpUxdD0+lpDaEI6w4m+CbJ5UGddgxFwRuGeORE=;
 b=Ms6QvJrvI1TStQtSHgSNLjbkLZNV1uaOA3XYLCQMZO9/KhW3JjvAUdXmOyBSepzb9d
 mex/L33LUxv3muTv8noqaUlHf7pQKfgXl8xWQ5nCdnethpOyLGUDk7o3DD0liMzvKbPL
 72KJgoJNhmiXa/s9kJHg/72hC9INd4D7J43D8qci9oVgGmHo3ug5Y+hIvi1R/RwZvsUp
 i/Il39u41hG0VN1/ea5vNHIKzBzzHGb5CspLv1ZtO12TSFSWAjCANcUkHIFI0iTdM/Dz
 s9oKBVz3TEwlBP8vv5WXEDyYpEdvt3I50HSyi9yL2VkbYlvB8XGCAFh5bV5DLJHeZr7w
 ml9A==
X-Gm-Message-State: AOAM5317Huhbt65+FaKE8NLiGYSQgvDmtoD0cDJ29K4IOxywyTFGQMhp
 g3Xf4bp2l2d0EaIBn2of/OC2wS0SpX2iHQ==
X-Google-Smtp-Source: ABdhPJwH8dTDYPDQIUpGDGvj6FZ3qIeYzBsHCr3lDzcRaF/M7CXtfPsF3/BedGYjm3vTx1CBz7gtLw==
X-Received: by 2002:ac2:596e:: with SMTP id h14mr4244342lfp.215.1589483446686; 
 Thu, 14 May 2020 12:10:46 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:8d23:71d:e677:1c7c])
 by smtp.gmail.com with ESMTPSA id q30sm2362958lfd.32.2020.05.14.12.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 12:10:45 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v1 15/18] backlight: drop extern from prototypes
Date: Thu, 14 May 2020 21:09:58 +0200
Message-Id: <20200514191001.457441-16-sam@ravnborg.org>
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

No need to put "extern" in front of prototypes.
While touching the prototypes adjust indent to follow
the kernel style.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 include/linux/backlight.h | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index 35fdc277bdc5..99fc1c950578 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -432,22 +432,25 @@ static inline bool backlight_is_blank(struct backlight_device *bd)
 	       bd->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK);
 }
 
-extern struct backlight_device *backlight_device_register(const char *name,
-	struct device *dev, void *devdata, const struct backlight_ops *ops,
-	const struct backlight_properties *props);
-extern struct backlight_device *devm_backlight_device_register(
-	struct device *dev, const char *name, struct device *parent,
-	void *devdata, const struct backlight_ops *ops,
-	const struct backlight_properties *props);
-extern void backlight_device_unregister(struct backlight_device *bd);
-extern void devm_backlight_device_unregister(struct device *dev,
-					struct backlight_device *bd);
-extern void backlight_force_update(struct backlight_device *bd,
-				   enum backlight_update_reason reason);
-extern int backlight_register_notifier(struct notifier_block *nb);
-extern int backlight_unregister_notifier(struct notifier_block *nb);
-extern struct backlight_device *backlight_device_get_by_type(enum backlight_type type);
-extern int backlight_device_set_brightness(struct backlight_device *bd, unsigned long brightness);
+struct backlight_device *
+backlight_device_register(const char *name, struct device *dev, void *devdata,
+			  const struct backlight_ops *ops,
+			  const struct backlight_properties *props);
+struct backlight_device *
+devm_backlight_device_register(struct device *dev, const char *name,
+			       struct device *parent, void *devdata,
+			       const struct backlight_ops *ops,
+			       const struct backlight_properties *props);
+void backlight_device_unregister(struct backlight_device *bd);
+void devm_backlight_device_unregister(struct device *dev,
+				      struct backlight_device *bd);
+void backlight_force_update(struct backlight_device *bd,
+			    enum backlight_update_reason reason);
+int backlight_register_notifier(struct notifier_block *nb);
+int backlight_unregister_notifier(struct notifier_block *nb);
+struct backlight_device *backlight_device_get_by_type(enum backlight_type type);
+int backlight_device_set_brightness(struct backlight_device *bd,
+				    unsigned long brightness);
 
 #define to_backlight_device(obj) container_of(obj, struct backlight_device, dev)
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

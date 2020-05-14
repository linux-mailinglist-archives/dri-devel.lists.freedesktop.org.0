Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BBC1D3C1E
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 21:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2284C6EBB8;
	Thu, 14 May 2020 19:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A88726EBB5
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 19:10:42 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id g4so4778753ljl.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 12:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2As4iiMj0BTo7C+dTbzUgkC9XsiqqnfWF8EBRNpLd7g=;
 b=a5Ap00Ov2KLpVSkuuJkC3wj3lAszNGu+09WiQxhFyIG16BxWDWEP0CTK+Ir8wQolJB
 fmNSaQvE3d6FYDQmT7XN4eiJDVmy+OGsc1Okns994TIBQ7jN5UHgrXc+D8kh9+oJowHX
 Pxt2zCCeofI4AYNqqmGoXvtPUnynTsVjRBJHYpFnDfjQUimKmm1XLYJMKzk/UZ4XZXbm
 RX8arI7PerFkdsLcQLBm1T6wGmwNKohqY0EdsQZsY+/p0+cqai/NHfN4Z6TuSL5V0nzR
 bShpRseQyR+pEIzfHxb0wdhbehBq41T2pFW0nCxYBcnIaZqVd0CtqvThiz1aBQ8je36I
 JOlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2As4iiMj0BTo7C+dTbzUgkC9XsiqqnfWF8EBRNpLd7g=;
 b=uZDlqC3pfjAwo56C4UEdU/SjXL7GPo5VkCFouF/kH+Q3Ne2qVjAuKh+KdRAe0fYLGU
 OW7QCQX29412L7C1nZtQBIvpT74fWJPN+/v7eSgA4DAM0Zesg9pWHx7E/aSdPLPlyQTy
 wfIacE032rRhLIv7S774jbARMKBSx+v02Pv+S8LGtaZEGn8SCn0NQXdIk+rF6DeotjSE
 ZN7ipYeap2+xTs3gPLs0auVhspH6/jeqiew1R6tH347THOiiKdKYGYLjepDCsm7+qYeH
 2nG4uGq0Q17qqqQsjTPYGgl0T14Ai2ikhIFxOOhwWESU1zSAmC0SkQn6FV0LLNGWGJ8V
 KmtQ==
X-Gm-Message-State: AOAM532ZK3Iy24IWdMG/1WWCLVEaTCVLKnOUYtDZ0WTl2p150QxWyG7z
 yak1DA87j7SpmZVQnsfYLN8+W7op3jkQ0A==
X-Google-Smtp-Source: ABdhPJxOE9RU/MsJ6k8PfrsSEIcqB8AFxJK7Zaq6b7zomy4TpPcp6vACPeUyOYCZdkuXTyvn1J9mHg==
X-Received: by 2002:a2e:9456:: with SMTP id o22mr3716363ljh.94.1589483440767; 
 Thu, 14 May 2020 12:10:40 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:8d23:71d:e677:1c7c])
 by smtp.gmail.com with ESMTPSA id q30sm2362958lfd.32.2020.05.14.12.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 12:10:40 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v1 12/18] backlight: document inline functions in backlight.h
Date: Thu, 14 May 2020 21:09:55 +0200
Message-Id: <20200514191001.457441-13-sam@ravnborg.org>
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

Add documentation for the inline functions in backlight.h

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 include/linux/backlight.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index 34ba1e444334..b8e78549a48c 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -283,6 +283,10 @@ struct backlight_device {
 	int use_count;
 };
 
+/**
+ * backlight_update_status - force an update of the backligt device status
+ * @bd: the backlight device
+ */
 static inline int backlight_update_status(struct backlight_device *bd)
 {
 	int ret = -ENOENT;
@@ -363,6 +367,18 @@ extern int backlight_device_set_brightness(struct backlight_device *bd, unsigned
 
 #define to_backlight_device(obj) container_of(obj, struct backlight_device, dev)
 
+/**
+ * bl_get_data - access devdata
+ * @bl_dev: pointer to backlight device
+ *
+ * When a backlight device is registered the driver has the possibility
+ * to supply a void * devdata. bl_get_data() return a pointer to the
+ * devdata.
+ *
+ * RETURNS:
+ *
+ * pointer to devdata stored while registering the backlight device.
+ */
 static inline void * bl_get_data(struct backlight_device *bl_dev)
 {
 	return dev_get_drvdata(&bl_dev->dev);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

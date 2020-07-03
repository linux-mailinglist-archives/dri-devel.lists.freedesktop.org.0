Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5036213F79
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 20:46:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA826EB9B;
	Fri,  3 Jul 2020 18:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D24A56EB9C
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 18:46:16 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id k17so6251535lfg.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 11:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=76GYwHJgmpg1D+ufO0JSzMv0fcAJAUH2Ai/nlDiORJQ=;
 b=XCwWqqKaoJ9GY8XfUndqUq6Vjy5mVIvp/JQIsd3c2s3e/DFaT4x1RYdECZ7hADeg7A
 XD8laph6i7Omw2sMJacDaEjBVaFGHcr/slybT0ZO0RnOSo9URXZvOUVPaV1taIp3wbZK
 5wZX2gjTq2EzzilQDlzx4HPYwgU9eeuXla+wjfnbjR2+O6ftUdKY8FLGMAy5xcMJfdZH
 K/jqmptdwiGN8U5ZCBkrBiu/38Wu0RD5rAaO385T2OezFvo0ZPFMk6lnVSgeabIKkxqG
 BKEPdzsLnJTfZ5h8shP7CucATIIXQOm3BLcJFMYZIYK8EUn1jPHlJBnegoWDh/3Hzr3p
 vtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=76GYwHJgmpg1D+ufO0JSzMv0fcAJAUH2Ai/nlDiORJQ=;
 b=OzTmOrJu8rMfpbLYTKyg6q87BPlWDVTeG2SI9+WbJx0Q3n6GpdakjTQ8/npN/I+6D9
 lyn85daH/k0yz7+UY/e0WYYjSosfzsx57HftZcu4Y0IBUN28hS+sJd7M1j2ZQehf03k5
 nMzcDdFRCfm19znnHUjvJpWCO7T084lleS8xJi1cGB3Uu83QXenWMJT0DMtQfSSP2SdN
 aoU0iKa+zfjA4UDiH+3XM/iyHHMrbL01LCZo9yIpmndz8fkL2vm+JzgUPbQowjOos0n1
 Ds/rjdpG6xtyYdnA7ZuVCQS06aHeinbawkMyC28maoP8BpzpqAcwelT+sWLIlFJMZzbb
 ccfg==
X-Gm-Message-State: AOAM53192ex1d2OOY98iT+7M13R7MNnlVXn8UxvTQt9dFu9NGu+7B3MZ
 Q2xjqOwgLRAjQx/lyGVp9o/uz3jhceo=
X-Google-Smtp-Source: ABdhPJz8bmVRIrBKTzOJ3rIl6mEq0ud3DW6wn671IW0G6f34jg/y3QlzvCxFFE92mpTId7a05bIO+Q==
X-Received: by 2002:a19:ad41:: with SMTP id s1mr6607452lfd.191.1593801975119; 
 Fri, 03 Jul 2020 11:46:15 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id h22sm4404224ljg.1.2020.07.03.11.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 11:46:14 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v4 06/20] backlight: document inline functions in backlight.h
Date: Fri,  3 Jul 2020 20:45:32 +0200
Message-Id: <20200703184546.144664-7-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200703184546.144664-1-sam@ravnborg.org>
References: <20200703184546.144664-1-sam@ravnborg.org>
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

Add documentation for the inline functions in backlight.h

v2:
 - Fix spelling (Daniel)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 include/linux/backlight.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index 7654fe5f1589..7d6cb61e10f5 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -268,6 +268,10 @@ struct backlight_device {
 	int use_count;
 };
 
+/**
+ * backlight_update_status - force an update of the backlight device status
+ * @bd: the backlight device
+ */
 static inline int backlight_update_status(struct backlight_device *bd)
 {
 	int ret = -ENOENT;
@@ -361,6 +365,18 @@ extern int backlight_device_set_brightness(struct backlight_device *bd, unsigned
 
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

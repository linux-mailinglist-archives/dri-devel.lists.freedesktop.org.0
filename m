Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7C41D6BF8
	for <lists+dri-devel@lfdr.de>; Sun, 17 May 2020 21:02:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411BA6E0FB;
	Sun, 17 May 2020 19:02:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60F76E0FB
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 19:02:07 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id v16so3467307ljc.8
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 12:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+TTbU+Xfbr8sJK5FSRi+ZS9sNODpYRd7hPkrg71kTQk=;
 b=mem+bAKqNu0CayFuu/pOujHPTFzqrTSq19SXLt7V8VOxzrSSnmGVnzvwm33jjb29NN
 rCRvWoTNDt6Mc4ExvCRFs8YBnKDxtPmo21dTWmhXBOrmB5KZcC3AN434I/zf1Jj4FQc8
 s2w/M+NIfHqyRC21Mk/hMm1o2S6YKgsMLbdfy+vAGyoh05xFzWs1EShSQ4Xnk3GrIFgw
 3Jo8THhs/QNFkRKOCncxUFQEc/fKNyrJ9qfXqecoBheQ/d6D5HIhyqyjGXASreCrfZJV
 U9n62m+XxgGor13L0+fJ0zwqQRRMW5z4CexR81BO399CBpoXEdnjMrLSUQ/oKHJy1Csv
 KXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+TTbU+Xfbr8sJK5FSRi+ZS9sNODpYRd7hPkrg71kTQk=;
 b=S/XQm5bra0g7Ozx0CV8hb/tDXMIa5Hy+zWTKARCKqf1FM6cr1SANYAzZgQfFtHXFky
 LZwsqYfngrhVO7qgP/tMVJ12h12Snb0Op6bu56KQxdQxObrBA8gG4i8TmIm7XMmYFM6j
 J++JJm5798c5PuQ78QdLoqY9SI2y+mMIpMnaqEq4VbN7aZW8teifem7vdreE6x4R8IB7
 1sFzngAxbgqXD+881g4oX3H6mrPMPd1DOYCIy+/Gj78zJzEJ5dyzTvRkosBLoYIZC3cP
 fWiCV4rqXzkSgX+n2si8Fr6ocdkVqdmvV0Qoq7KmyEdGjUAa5g/DgNpWZaiVSwlbsCxw
 KemA==
X-Gm-Message-State: AOAM533Rkp0sdjeh2WffbROkVJCJGNVTZsNXLijVBKlSvv6Vt0kZY07W
 mVTuO+R3Se5IFmKN19qMHX2ppJzD1mI=
X-Google-Smtp-Source: ABdhPJw3X5XXPLmjACBeaAtO1reBVwPhG7KACDi04P8E5dwChHnTLGrWmlkDy8d6D3PZEDu1vHiLCA==
X-Received: by 2002:a2e:9843:: with SMTP id e3mr8260961ljj.249.1589742125781; 
 Sun, 17 May 2020 12:02:05 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:5d55:b3eb:397b:9086])
 by smtp.gmail.com with ESMTPSA id t20sm3282535lfl.17.2020.05.17.12.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 12:02:05 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 07/16] backlight: document inline functions in backlight.h
Date: Sun, 17 May 2020 21:01:30 +0200
Message-Id: <20200517190139.740249-8-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200517190139.740249-1-sam@ravnborg.org>
References: <20200517190139.740249-1-sam@ravnborg.org>
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
 Jonathan Corbet <corbet@lwn.net>, Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Jani Nikula <jani.nikula@intel.com>, Andy Gross <agross@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Sam Ravnborg <sam@ravnborg.org>,
 patches@opensource.cirrus.com,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>
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
index e2d72936bf05..98349a2984dc 100644
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
@@ -375,6 +379,18 @@ extern int backlight_device_set_brightness(struct backlight_device *bd, unsigned
 
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

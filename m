Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 900741E9E94
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 08:52:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C413E6E13C;
	Mon,  1 Jun 2020 06:52:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05EF76E13C
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 06:52:38 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id m18so6758082ljo.5
 for <dri-devel@lists.freedesktop.org>; Sun, 31 May 2020 23:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VTAgQ0/+by/AFCHtw1iOg7GKteKKQa3tJwaqwJToo1s=;
 b=pT3RA9tpY/ttV+F7JpvmxfJbJnSZSfBhqafI59EsUccx1b1tYuvoUDNRs5Vo7tnxOe
 qecKoCV9H6Ri3NKNFmtFYyTq+R3V3gQZ+xGnTTEVta3UIgi1JOmB/x+dtLjEoAt8C6q4
 t7Y4yqcG+h0R8J5KTxPRwM+mTP9KjnEdCLyy24UqY+7se1bDYK6a+y2d3FEXNexGIs9j
 pJqB7Vo8V2tmyJGgF3Wx/4zdbcr92ufm130gqJ0AGirICGeAj6m8Y7uXD2V+DCWSS+uj
 pwYAQQQBc5UL5/iV9dXIB+bBipimkJGzCLLPNGfjs9DBPf9LMF+w9eH/AokUH2QHxFuh
 zETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VTAgQ0/+by/AFCHtw1iOg7GKteKKQa3tJwaqwJToo1s=;
 b=nev8XGealOPS6ifIXvqDBSNvj7mPQ/ZMZ1z7Dh1gBwyZ9uWpJ0EmB9jtI3jblatdJZ
 o/BaEGJdIBAXbsz2h0FKWUZYzSASdfwz2DhTpoE93X9YIRl8BDsx+xrthYz/2BBLl1SZ
 BmefG7GEozpRCR/IedRM88KvbCpAiQlYqzM3tRnr04Vx9FRnm+x1ss9Fxiqzqex5grXw
 g30+U6aJzu6eFEbhS3uLIJXhOhtBmpX5vsW69KRXohPsm1QiQTddYposCVwdYaX0/t+c
 ExH069QInyl8moer4IHf3hK2YmSsbUPBdKesCpAryzQzzKWuG78aJnU7uEBuDZM+pRcN
 cG5w==
X-Gm-Message-State: AOAM533VLVJnbYrnAI+mvq6jg7n3xxF5Md3+7ftUR6nIzvb13UOUQEyj
 /u9x+qr5hUb8TV3ZxRWMFO72GPFR3Ig=
X-Google-Smtp-Source: ABdhPJzl8Fs749+ZgMHWRo08UWn6h05dlQMe31AthZ5mkRyww2y2SCrZPCwPjKghl3VnvYogfvbsAA==
X-Received: by 2002:a2e:868d:: with SMTP id l13mr2107229lji.306.1590994356092; 
 Sun, 31 May 2020 23:52:36 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:281d:a604:434c:a58d])
 by smtp.gmail.com with ESMTPSA id e13sm2540462ljl.117.2020.05.31.23.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 23:52:35 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v3 09/13] backlight: drop extern from prototypes
Date: Mon,  1 Jun 2020 08:52:03 +0200
Message-Id: <20200601065207.492614-10-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200601065207.492614-1-sam@ravnborg.org>
References: <20200601065207.492614-1-sam@ravnborg.org>
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

No need to put "extern" in front of prototypes.
While touching the prototypes adjust indent to follow
the kernel style.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 include/linux/backlight.h | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index 6bd981a600ef..25a3aac89618 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -417,22 +417,25 @@ static inline bool backlight_is_blank(struct backlight_device *bd)
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

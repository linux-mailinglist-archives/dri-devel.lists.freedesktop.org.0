Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBBC1E9E8C
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 08:52:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF5D6E12B;
	Mon,  1 Jun 2020 06:52:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C25A6E12B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 06:52:31 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id d7so3263787lfi.12
 for <dri-devel@lists.freedesktop.org>; Sun, 31 May 2020 23:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=69nTzFI2GNQU9AQvcUBs3yFCmAT6Gg/K7NgbR/V9P7s=;
 b=VktVUoO8qiYt72hT3cUOFa7m832AcmJVn4azwkTffzj718DYgrsAiAe+pQylySaE3z
 2qbA2Od2sVWrnx5VhmKMbAgZnVQObrPPJD7QdpmPLrXvbIrxHgh4JF0tWmP9BOW9GdI4
 4FOD3VbPc1vWAHZOsqSteyU42LfkvkFjhQ+KUO5scm2F0yWif8WccThGeEMsWOH1q3B7
 QsNZ5o2j3A/TzyQf+lqCJnrsRgFIN4LyspE+lmjqg8RZcpVXkCTWIyOnabnhzJOfCDD1
 sTmWUghnYSC7+m/7V6iz00DT1PVLQumitScjqWtQ54p6OWW+WTlydQSIVpyo1W6ZwiMX
 1vbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=69nTzFI2GNQU9AQvcUBs3yFCmAT6Gg/K7NgbR/V9P7s=;
 b=Ut0GP/bwYeNabEOU3hc7m/H6erYjbeHZiTOGD6Ju0pI5+JPMCMWKh71bqFD0GWFYC4
 UpeCmwpW09Uv62x789c8GZswaIUAscJbQOrwVABahgd5pTrG38PvorQAN2Z2RWb3PeoW
 6m7UB/8ML68rbVXsoxBf3e0B6cVQsESg5C2xK6pnMIsxQzUKoiATXTzwAP20f42tp7iW
 cJJx96mxbq0Yf1sDvKzNMzn6KaXpxm3BIdQwZtQHOwHFAtAV9K5kNKMrjiPeKNnPHUXK
 wpCUlLhpeXZKignYmywgKA3/6OrHBUfAkn/1OrQ72Dw1TdOoSktLi5lOJ4y6S/n5LrGK
 Ajnw==
X-Gm-Message-State: AOAM5324T8Xtg1LGIpd8bnkBXWp0c6OCCoYC6VAzXRx0udgetYY2Jq1l
 1CkZ8LQN1QyuTNTFNmpHf51xcSmG7PQ=
X-Google-Smtp-Source: ABdhPJxsAjomR+EHBTZIUY3oWKM0UlreSmcXcRGSGObIKKhLr85RwEES5aA9AnNo+TFzZ8DUbJib0Q==
X-Received: by 2002:ac2:41d4:: with SMTP id d20mr8177683lfi.204.1590994349317; 
 Sun, 31 May 2020 23:52:29 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:281d:a604:434c:a58d])
 by smtp.gmail.com with ESMTPSA id e13sm2540462ljl.117.2020.05.31.23.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 23:52:28 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v3 06/13] backlight: document inline functions in backlight.h
Date: Mon,  1 Jun 2020 08:52:00 +0200
Message-Id: <20200601065207.492614-7-sam@ravnborg.org>
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

Add documentation for the inline functions in backlight.h

v2:
 - Fix spelling (Daniel)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 include/linux/backlight.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index cae1af95dd9d..f99ca19cc3ec 100644
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
@@ -360,6 +364,18 @@ extern int backlight_device_set_brightness(struct backlight_device *bd, unsigned
 
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

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B6A2250B4
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jul 2020 10:08:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4F36E4EC;
	Sun, 19 Jul 2020 08:08:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D4E6E4D7
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 08:08:20 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id u12so8170018lff.2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 01:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wW63XUx9iwsgo3sF+eLJ1EmI31rAQ/9VoQVVmqYGrJA=;
 b=HuW3STOjnm+5nA7TKFdrHyzBWygB7TYqPWMehFXq2MvpLMqQEL0KGAe5sg2xHurSL7
 yTEvfW8rP3bsTWPpPulplN7Wb7PBEHud8WVBnoIB/GPMUQk23NvL3VU4zJ6moNHIDeFl
 VqJFEgbISll+a9tCrHRVmVtdv8v8aanuM9QJCi4qsjrHtdaWn/5M2/pa6BHxOfK4UZlV
 V2+3LWiCOLWdJhmAFNRu74uELktGOPi1wf6XpnzVHs1rnwEQ4fiFRa5tUk+9NzAuwFIM
 +sVPLJJYBc73HiorGIirrriC+eL9Cd7R9NPUpSANVeOFwLamC83wwOcm5BK+h4lHwra7
 GfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wW63XUx9iwsgo3sF+eLJ1EmI31rAQ/9VoQVVmqYGrJA=;
 b=ib9CExRXUNnW33MRUrf2BDUawrt8PY81rb8g1joypo+x1+h8/ata+viMyqegc7PU5H
 0kM8KxYI2X2tXcz48f46VPs7EpF61I5Iad+vnHdZw4q4Nil2JdF2/dfR4IC4eRvbhm+c
 S30hS5bYU/833ReGNAkAV4hpjXyrCaPF9mAfw8XIsKkk9CDXx9y+3B/Wmoi+QATBNSyK
 XF9A8BCEz9GCSIKNqRZDomIZsSwPXAKnUIx9Q3Tq71QHWJQd259DYE354u7A4P/tEDDC
 X+eIU4lNpzaKb9+FkDrf3AxZtsJRCYrLIXS81U3dKREsZVC2ep8+fVHl3fvbRY+S6N7x
 cFdg==
X-Gm-Message-State: AOAM532xCKO5/Y9E3VQTJDQILWHEFnEggYXdLijFd+Lzrf5t3OV6EFMU
 DzCih30NNX/I+UMA+Z4Fo2/WIhM1XY8=
X-Google-Smtp-Source: ABdhPJwLvz2z9lmHimCaJxwSbfMyBaB/B0JnKaQ3Wdhc/h602Hub6VMpVFeHlh9jZTqOOYVvZJdHpg==
X-Received: by 2002:a19:c1d6:: with SMTP id r205mr484342lff.141.1595146098916; 
 Sun, 19 Jul 2020 01:08:18 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:d5fe:fe9c:fc06:b74c])
 by smtp.gmail.com with ESMTPSA id 72sm732407lfh.97.2020.07.19.01.08.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jul 2020 01:08:18 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v5 11/19] backlight: wire up kernel-doc documentation
Date: Sun, 19 Jul 2020 10:07:35 +0200
Message-Id: <20200719080743.8560-12-sam@ravnborg.org>
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

Include backlight so the documentation is now generated
with make htmldocs and friends.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/gpu/backlight.rst | 12 ++++++++++++
 Documentation/gpu/index.rst     |  1 +
 2 files changed, 13 insertions(+)
 create mode 100644 Documentation/gpu/backlight.rst

diff --git a/Documentation/gpu/backlight.rst b/Documentation/gpu/backlight.rst
new file mode 100644
index 000000000000..9ebfc9d0aced
--- /dev/null
+++ b/Documentation/gpu/backlight.rst
@@ -0,0 +1,12 @@
+=================
+Backlight support
+=================
+
+.. kernel-doc:: drivers/video/backlight/backlight.c
+   :doc: overview
+
+.. kernel-doc:: include/linux/backlight.h
+   :internal:
+
+.. kernel-doc:: drivers/video/backlight/backlight.c
+   :export:
diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
index 1fcf8e851e15..c9a51e3bfb5a 100644
--- a/Documentation/gpu/index.rst
+++ b/Documentation/gpu/index.rst
@@ -12,6 +12,7 @@ Linux GPU Driver Developer's Guide
    drm-uapi
    drm-client
    drivers
+   backlight
    vga-switcheroo
    vgaarbiter
    todo
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

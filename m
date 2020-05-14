Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 633AF1D3C21
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 21:10:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B21A6EBBA;
	Thu, 14 May 2020 19:10:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA6E6EBBA
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 19:10:52 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id r17so3584630lff.9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 12:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5HPqfvqRtncVQoHgcS/XINMTd0DOJVWJH0ZC6vuce8s=;
 b=emUIe2CrPkK2Pwcu2rfzSfgyOhqN1IgF5D2tNyx65tJLOK+sdsxdQdABAi2myLyVNU
 FVe7XS7lP2xf1PtrUdBTd7VG0r7l/xopB+Shzu2H8leaiBz0cAJ5Lmz0UZ8UN0NaAZAG
 kdeSlnmPPmTnRmjTrDfK98KxZ2UqI+JIRnhty532B+bH9W4Z7O+VW6MZH/dsackpEzee
 u+Ojyu99hdyfHcq8qv5JDnjR6ToMFTjtwZmG/vb3dATHY2ijf6AksA557BDukLR/f4m4
 gfDXh+sgY9mp7Xj0jCssrrUPa+hpwpm86QE2h2YVFKxK6YXUdMoczCrymXX6e/yUncQT
 CLbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5HPqfvqRtncVQoHgcS/XINMTd0DOJVWJH0ZC6vuce8s=;
 b=kPSFRi/66ocvGnN5dXisCmctOzd5DqKXHzLC/oHU2vQqe5bbBCQbE/p96xF/6+n40M
 lmJ3oUF5pmNInbiGPIE4ca980aH64dDyGsCFD4B8py59UeKaFkiD/1kYeJa5AsShA5Rr
 npyfY8fJ9BtJGhoTECvWmIuDsovVirOSPc0qe0mAcH8HlVI86Pd9UBODUBO5kcOhWTSd
 n1At4dTlJJ4DA11VccQmddFG7IRbVUTmM+NevQe9Aubd0pB6weN6UAil90mfLzEhHePE
 F0H4pkobEV7vCw/cA000Hdz6b3jKpVtIuDmDAlNAPCgFOpirvwCJb0CteNqwv4GqbDXn
 o53Q==
X-Gm-Message-State: AOAM533YfDizBSQ+tJsV3vHehy0QWybM/hGTC1LKp4FL8SiaWFrDMqUg
 1jteh7GmbpeYr7cl1NhDUJKMZmyJO7az3Q==
X-Google-Smtp-Source: ABdhPJz4fQ85VUGDnvtJWFMEdr6v82wLiLbqW9nzb/RM5/7jT50m1uFyuDASQfywGtOcDsB8ZlPt5Q==
X-Received: by 2002:a05:6512:3384:: with SMTP id
 h4mr4329647lfg.150.1589483450598; 
 Thu, 14 May 2020 12:10:50 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:8d23:71d:e677:1c7c])
 by smtp.gmail.com with ESMTPSA id q30sm2362958lfd.32.2020.05.14.12.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 12:10:50 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v1 17/18] backlight: wire up kernel-doc documentation
Date: Thu, 14 May 2020 21:10:00 +0200
Message-Id: <20200514191001.457441-18-sam@ravnborg.org>
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

Include backlight so the documentation is now generated
with make htmldocs and friends.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
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

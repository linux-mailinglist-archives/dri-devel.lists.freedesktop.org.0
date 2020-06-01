Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 984481E9E98
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 08:52:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 374FF6E146;
	Mon,  1 Jun 2020 06:52:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ABC46E146
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 06:52:42 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id c17so994222lji.11
 for <dri-devel@lists.freedesktop.org>; Sun, 31 May 2020 23:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AnaHL8ZW2AHSXoDqHfMNaVU3hWEgwww58aZX9yKaEh8=;
 b=E7MeDZFYP1vjvb0jmnutl7Cd/7rXGGCPAXDxfA3kTRbZHzTQ2zKfSTZtmIrriXZLdY
 6WIWBnm/MFR3O9nIQxM3tR0Cl1HBuV3Emywhryw1zL4FZwh/66DsL5G6TKVeC4nzEPsv
 wVPKVD3gj04X9hB5d7ZN6lR7DCjJ0jGjtauxtNB2VIzQ4gQqv1L2W81H+owG6MuFS/N+
 IkjT1FrK5OJSb4Yss1QUwQKddggmHXmXPZkn7KryS48uwBNvh4uXmZxd0VI+rFeL9l88
 ddtpPee0eUztEq4yAVQy397i2KERofzwnmWngZ5ZLhIm0Ul/3hkeA4JNev+xJQusw3Rm
 vV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AnaHL8ZW2AHSXoDqHfMNaVU3hWEgwww58aZX9yKaEh8=;
 b=hjqQFj83la1+lzqbGlrFR323vI/fpC4JijnrIm+vMnV/aLXRS52Tlugj3TOkA50wt2
 uHcu8+oMRQFyt6QDERhvXnyYsKH6Oc6zXW1U3r+bE/nOvp++LprFagzR/w0VDKMPswVL
 cKjWVf16f2NZkI+e1P0rVatMmZodv3c/tjg9hXpElN4y51Si8+eT5X8WlGqhySAq58a8
 72IKLIn7I+oFPYQVM8VpxpAGI2HH2mPjnnUsZJYkIFr7RuEuXwj4QEtlqMjrU/ofxydb
 g+fIn9dx9EVbycLJbPzVHGkJ2rWEsGT0tQdw4FeV5sZhF4IOP++ESSQInki1qJpyvSK8
 gLfA==
X-Gm-Message-State: AOAM532MQ29uaf2h3SAWuh2D6JjzQ8UDslF/FhCAkFdIS4AxxzNpcJJO
 d3O28VQDB4Mk3upAxdERnl3b4M++/zo=
X-Google-Smtp-Source: ABdhPJy6NUne+NeaxEir/nZPRNno9Z/JzFLm/d5YWSPgm0nw28WxZgRoVCFDsShL4PLF+JqMBV3P3w==
X-Received: by 2002:a2e:960b:: with SMTP id v11mr2290702ljh.77.1590994360550; 
 Sun, 31 May 2020 23:52:40 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:281d:a604:434c:a58d])
 by smtp.gmail.com with ESMTPSA id e13sm2540462ljl.117.2020.05.31.23.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 23:52:40 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v3 11/13] backlight: wire up kernel-doc documentation
Date: Mon,  1 Jun 2020 08:52:05 +0200
Message-Id: <20200601065207.492614-12-sam@ravnborg.org>
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

Include backlight so the documentation is now generated
with make htmldocs and friends.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
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

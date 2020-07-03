Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FC5213F87
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 20:46:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C866EBA1;
	Fri,  3 Jul 2020 18:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5950A6EBA1
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 18:46:27 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id s16so13568283lfp.12
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 11:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wW63XUx9iwsgo3sF+eLJ1EmI31rAQ/9VoQVVmqYGrJA=;
 b=AEA3tNC3BMq9rPELr/rZiMYPpVOIgC5hETJd60ZbiaM2cESBA/+X6SIVasVZyvUEr6
 cHgqNIYhMv4o1ACU1pNaBLEdnNvfZsPpwvGNquYML5vL12I8TBAauNOURQt3Knjlgf04
 ZJG0pg+nwijDjTqOX8bJOzplLrBMVtQCgJ0BYfKgXdf54tmt7VQ+gUhdTTpGaDn8N5MX
 o65NysSypWG+FAdScjb1ygXPmFmHnyKSmuRYI+sP/q5QIMxFEHf2Iw1rtrxXNcRKPeda
 T7HQeUO1rf8M9+L/8GSNTG8DmqIIJsecGhQbruef2OdAIVBQfc+6ur/9b85tbX0ojth4
 AnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wW63XUx9iwsgo3sF+eLJ1EmI31rAQ/9VoQVVmqYGrJA=;
 b=HdzIIrNHphMf7dmSxqhQl2b1J2qnUchqrENnK5bWODy3/TPZcpW3HLCec9n4VLSGIa
 ndsKRuAAa32edUIzIRYtWWiKGtBpoMcWvu+soV4UeRceyTjGLdEXkhAT5yl0tOSSHFVK
 9r7ESkO4VcNSuoa7Prjc4liBq/C8JL6qP4Gm0kFvQ65KVUFgVJJc+vjyV958eQuoUqrc
 V0sbcsbiQnjuo324yArG5rXWItkV6wol6ljZ/okSi+3IAKnUqURsEvHcEekPw3S+Vook
 RL94CzoaM1/asy5Bo9S5C2GDdaENG7C/Ic5toAmRquHQLElBqYukWzj6y84P9FRiOgsd
 cbJA==
X-Gm-Message-State: AOAM532UdQRJvlgWn+CY/Qq5gqA+OVFq7r03P6Iw2Lpwmg0juBEOqooR
 WlSsvMDzJ+JAXqwliep90RrCJP0KTz4=
X-Google-Smtp-Source: ABdhPJxEUXz4bOYpqKTDSZSj17VqbWse7IL9pSVI2ig7Wc0HkhTmo1clZ+dbXQsbopGFStzEnYoN6Q==
X-Received: by 2002:a19:815:: with SMTP id 21mr22267814lfi.119.1593801985628; 
 Fri, 03 Jul 2020 11:46:25 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id h22sm4404224ljg.1.2020.07.03.11.46.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 11:46:25 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v4 11/20] backlight: wire up kernel-doc documentation
Date: Fri,  3 Jul 2020 20:45:37 +0200
Message-Id: <20200703184546.144664-12-sam@ravnborg.org>
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

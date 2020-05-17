Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D827E1D6C08
	for <lists+dri-devel@lfdr.de>; Sun, 17 May 2020 21:02:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED54E6E106;
	Sun, 17 May 2020 19:02:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692B76E106
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 19:02:21 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id u6so7522643ljl.6
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 12:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5HPqfvqRtncVQoHgcS/XINMTd0DOJVWJH0ZC6vuce8s=;
 b=ok8MopO9rneb9yJfTROGOYbIX9MXrlnlnkw3yNr3bMxjvniQAbQ0seWhsvYALaTF9E
 JwLA0Ls79pqiaHECZQCysVloRWrL0GA62wfWMLm05PrhHCVG3ufoFZZJoSPx1hy6N56/
 an9Wk1loxD4qVgcH3slk0rC+tHgfI0UAHVEh6XmTnetf0MePNJ9gBebdQX6qyDpGpibL
 QJBg46D6jYZ1sKyBRm5k+7a437LqTb14R5OIKSjZnvrtVvHCMPI1l5o1SLm/l+t99/ut
 99tI1XfoqK6P9iZJZtj1SwBmRAKEH1xq43VrfUnEs1wEFYGEJmk3koLIvQyRIYiDhckN
 OPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5HPqfvqRtncVQoHgcS/XINMTd0DOJVWJH0ZC6vuce8s=;
 b=E7oo2qPAxoNJEIGqXZvwXVgBATLGFP+fU168NUHaKDVsPmqvS9BmH4bjncBDL40xLo
 MELyafHGqNhpqztfwdLK85ahaFwvuyvzGaJMRj92RbnqMzs+Ui4lo1Ksnb1Hl2ewoNOA
 R3CboYpkZU4JdwKNBEyF/h5FyClhQJzDevcxWsyrVxuTcjTaM4xc+MB+T0f6wnsg+nv1
 M9AHhGpk1O6cE61c+md5zAbHtp5zrVD029Kl0+I934kBPp/g/p1uQ94h62q03cIg9oQx
 iLYzsO8RNB77kQaX7UeYKbu61/fE+3JnvAlnOAWCZkifSwHuE9ciMiV+LepKAFvJllXh
 uESQ==
X-Gm-Message-State: AOAM533CGkNCIZIFrrIaRXN4mVIM4/0DEesCjmSFbANUUFMNuCY1tVnh
 J80k0F1O5EGea2/dIbseyLGgrZR3q5w=
X-Google-Smtp-Source: ABdhPJzQHolQWwc6+x1Ugs5U3BPnVbfqs6FVluzObxl5aohq58l6EEY9wyV6a1r02QHSw8SzQtSo6w==
X-Received: by 2002:a2e:b177:: with SMTP id a23mr8196584ljm.140.1589742139509; 
 Sun, 17 May 2020 12:02:19 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:5d55:b3eb:397b:9086])
 by smtp.gmail.com with ESMTPSA id t20sm3282535lfl.17.2020.05.17.12.02.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 12:02:19 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 12/16] backlight: wire up kernel-doc documentation
Date: Sun, 17 May 2020 21:01:35 +0200
Message-Id: <20200517190139.740249-13-sam@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>,
 Andy Gross <agross@kernel.org>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, linux-arm-msm@vger.kernel.org,
 Support Opensource <support.opensource@diasemi.com>,
 patches@opensource.cirrus.com, Douglas Anderson <dianders@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
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

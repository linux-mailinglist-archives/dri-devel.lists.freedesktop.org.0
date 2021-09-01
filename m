Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 109873FE3B9
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 22:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE836E2D8;
	Wed,  1 Sep 2021 20:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 358696E2D5
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 20:20:43 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id n18so629604pgm.12
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Sep 2021 13:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WM1bi4Camo4x38t+lOpl/85fschHMfokf9rT4eUa3DY=;
 b=f+ybnhpuTQ57f3nJIk1Jq6u2MAVamT1UtJdAKIxnQ768VSVBgqG6Rgpu/cw1Utc6sS
 /bMn6sOsWMrckKWPdEB26mmvkyIodgTuwS/D48gj83/BMDRgnzcEwm2ggv/v4v6DHE2j
 0GxUuSg95a57DDbsxzg/NLj/O5zWdfa38OmFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WM1bi4Camo4x38t+lOpl/85fschHMfokf9rT4eUa3DY=;
 b=dE9tSRaHvdnice4/cW5VOeT6o3oZ7Xy7uzbFM4SijZUaPXksXM8nYe8moUpK/I8x5t
 NusBbEUk2UC+zQlaFsJLl2UcSk3qFiIz9IrkkmwoV5Cc+NAOm2COjJ51GsKOoU0hKLDk
 Vss5YUBm3JSk4d6Cbh1NWGAJp1ENRHpnyEWJIUtUnwLYrPnLjw2NtM7jKqXX2ikhz0xF
 HYHn+COaRcfjx1engkR5IZ/6L/2Fu+hbWe6x2yQG4WKO9wxDR3j6B1Ol7dKNG2u2EIVE
 yH8dPuaGoyUk5ankZ+452x/yt3VqsCtX7MODfWJ8MwzLzWETPGIfpnUJIs3DQP3ThSg1
 mYXw==
X-Gm-Message-State: AOAM533Hl/dQKHUpODlXKz82UnBMa9YZ+BXPxVeoWHkhBeEFvkF4rArb
 yB+wo34jZTfk9GsVHKkyRr9yGw==
X-Google-Smtp-Source: ABdhPJydT+Tqv+gWUMHLSx9OUkDrer4gbLtZdgIdTopu2ejfGNW+Ki6l+q5vwHDM20EqiwpPRfWvug==
X-Received: by 2002:a05:6a00:796:b0:3ed:989b:f0c3 with SMTP id
 g22-20020a056a00079600b003ed989bf0c3mr1117119pfu.9.1630527642834; 
 Wed, 01 Sep 2021 13:20:42 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:958b:b561:a735:e774])
 by smtp.gmail.com with ESMTPSA id x15sm321178pfq.31.2021.09.01.13.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 13:20:42 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linus W <linus.walleij@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 devicetree@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org
Subject: [PATCH v3 08/16] MIPS: configs: Everyone who had PANEL_SIMPLE now
 gets PANEL_SIMPLE_EDP
Date: Wed,  1 Sep 2021 13:19:26 -0700
Message-Id: <20210901131531.v3.8.Ic7a6e3f8dd4760a302c91320843be5a00206bd63@changeid>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
In-Reply-To: <20210901201934.1084250-1-dianders@chromium.org>
References: <20210901201934.1084250-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the patch ("drm/panel-simple-edp: Split eDP panels out of
panel-simple") we split the PANEL_SIMPLE driver in 2. By default let's
give everyone who had the old driver enabled the new driver too. If
folks want to opt-out of one or the other they always can later.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 arch/mips/configs/qi_lb60_defconfig | 1 +
 arch/mips/configs/rs90_defconfig    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/mips/configs/qi_lb60_defconfig b/arch/mips/configs/qi_lb60_defconfig
index b4448d0876d5..3e99e223ea02 100644
--- a/arch/mips/configs/qi_lb60_defconfig
+++ b/arch/mips/configs/qi_lb60_defconfig
@@ -72,6 +72,7 @@ CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_DRM=y
 CONFIG_DRM_FBDEV_OVERALLOC=200
 CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_PANEL_SIMPLE_EDP=y
 CONFIG_DRM_INGENIC=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 # CONFIG_VGA_CONSOLE is not set
diff --git a/arch/mips/configs/rs90_defconfig b/arch/mips/configs/rs90_defconfig
index 7ce3b814fdc8..42b4f621cbfa 100644
--- a/arch/mips/configs/rs90_defconfig
+++ b/arch/mips/configs/rs90_defconfig
@@ -94,6 +94,7 @@ CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_DRM=y
 CONFIG_DRM_FBDEV_OVERALLOC=300
 CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_PANEL_SIMPLE_EDP=y
 CONFIG_DRM_INGENIC=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_PWM=y
-- 
2.33.0.259.gc128427fd7-goog


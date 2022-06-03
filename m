Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF5153C78C
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 11:26:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C3311231B;
	Fri,  3 Jun 2022 09:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4173B11231E
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 09:26:22 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id v1so4097305ejg.13
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jun 2022 02:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ssOJLbGbegD1K46c6tLMgIHQD6IP233xl23vf6Dwrk8=;
 b=ORfIo6ijxncBWoW1zXqygp5d/hED615KbJsb0wAKIXFVm9YI7v2rGtaxqmLpUYFs5+
 0QwcxMDNKTQ0nynbMf1nZ0attlc+BIe6HuKb+nSviTbQDLX/kycf/lna6EhBH3C+IaWT
 fP4yQtrqjsB6H0KXcPMBeg7l8mN5oGq0NytiCc3pOv5PKUV5JOQKbtRABbm3kTLTkHJy
 K6krOmT26OsrDjQaQazX9rMWMgqYtWwQQLn4C7d85pH7GgwIBUASsXRRHKwvgb9sFdJl
 pDjJHA5QIJiR6xePJTgk57UE0sy46OHgIb3p2MD1WbeepIGW2ZezisrrXYSMS7l1KWP0
 CSBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ssOJLbGbegD1K46c6tLMgIHQD6IP233xl23vf6Dwrk8=;
 b=IiOQxIg5QLMfWPGtUqdkkbMHVtJGZiMwlWHHfw+sMVL4the6IEcoBFigH4nRZbe1lt
 +qHFpvlD8nMdTZB5YTVBeFdInhRD33A39c1tdLgFLhU4Dzn9MYgDEFrZSSr8D+SjEClP
 9JTkLM7HN/+Ict1KRQdM7AnfNlnwKIEmvIYzrEQzJzcgocM1UA8ytzq6TwI+7NpZHK0N
 ++h3D5kQ8A2MVnLpIfyB8QVV/vqT541j1ro7wjKFx3ynjHuHhKRZvpwvQCRk0o4AyKul
 TWAEjO28sOintIRKMCbk9mULHkS4zDzubQx4NvpRsrAr+tubOPDpe/JLaHwki5lG2JzI
 9OdA==
X-Gm-Message-State: AOAM531AZ64zqx4Lj3Moix4ahvvbwDTjfjsTmVN9ENsQ2zwHgN+7GOZP
 4hHlIPVhYHy95gElly3G6IU=
X-Google-Smtp-Source: ABdhPJxT3uTOHv8dOKf6vo3zopR23+u+e+tO/4ZN3QFTs3V+EAqg3wHOSloOBT6vRSAh79itOUzGew==
X-Received: by 2002:a17:906:4785:b0:6fe:f8ac:2494 with SMTP id
 cw5-20020a170906478500b006fef8ac2494mr7667931ejc.199.1654248380180; 
 Fri, 03 Jun 2022 02:26:20 -0700 (PDT)
Received: from morpheus.home.roving-it.com
 (3.e.2.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:fb11:2681::2e3]) by smtp.googlemail.com with ESMTPSA id
 b5-20020a17090691c500b006feaa22e367sm2617672ejx.165.2022.06.03.02.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 02:26:19 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, bcm-kernel-feedback-list@broadcom.com,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Emma Anholt <emma@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>,
 javierm@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, maxime@cerno.tech,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Subject: [PATCH v6 5/6] ARM: configs: Enable DRM_V3D
Date: Fri,  3 Jun 2022 10:26:09 +0100
Message-Id: <20220603092610.1909675-6-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603092610.1909675-1-pbrobinson@gmail.com>
References: <20220603092610.1909675-1-pbrobinson@gmail.com>
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
Cc: Peter Robinson <pbrobinson@gmail.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

BCM2711, the SoC used on the Raspberry Pi 4 has a different 3D
render GPU IP than its predecessors. Enable it it on multi v7
and bcm2835 configs.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
Reviewed-by: Stefan Wahren <stefan.wahren@i2se.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
Changes since v4:
- Added to bcm2835_defconfig

 arch/arm/configs/bcm2835_defconfig  | 1 +
 arch/arm/configs/multi_v7_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/configs/bcm2835_defconfig b/arch/arm/configs/bcm2835_defconfig
index a9ed79b7f871..9270512c14ea 100644
--- a/arch/arm/configs/bcm2835_defconfig
+++ b/arch/arm/configs/bcm2835_defconfig
@@ -106,6 +106,7 @@ CONFIG_REGULATOR_GPIO=y
 CONFIG_MEDIA_SUPPORT=y
 CONFIG_MEDIA_CAMERA_SUPPORT=y
 CONFIG_DRM=y
+CONFIG_DRM_V3D=y
 CONFIG_DRM_VC4=y
 CONFIG_FB_SIMPLE=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index d6a6811f0539..e2db5cdc66b7 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -731,6 +731,7 @@ CONFIG_DRM_IMX_PARALLEL_DISPLAY=m
 CONFIG_DRM_IMX_TVE=m
 CONFIG_DRM_IMX_LDB=m
 CONFIG_DRM_IMX_HDMI=m
+CONFIG_DRM_V3D=m
 CONFIG_DRM_VC4=m
 CONFIG_DRM_ETNAVIV=m
 CONFIG_DRM_MXSFB=m
-- 
2.36.1


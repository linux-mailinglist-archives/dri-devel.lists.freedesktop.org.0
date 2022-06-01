Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E19E53A372
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 13:03:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B46810E9C9;
	Wed,  1 Jun 2022 11:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84CB210E404
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 11:03:16 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id h5so1869093wrb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 04:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MY3KdiWHdb5CQcuaqFb688MwfgTh9jY8AmMC7tDgzHo=;
 b=B2HuTJfwnmOl4WdDoe7QPpkKb8j7BGWs2EhsQWktyoz2XAO0Neg5LZruqZ3XjcjThw
 Baq/ZVfjZ6dyh4cjdJDP7JrMr5FjF6gVNIbyzvz6GAXpr0Nx3xjUfIhWO2if1GMk2YlJ
 UadttVAbvqYnrSjhuiWUtB6useEV1VvdexIJe8OnoLamOjTuD1qn3zj7SxIUzF37ijee
 gz1z/lxM9RFCnPIcT3RdN0DmlsI+FkuFvDY7MfS4294hD8JtcoJjm8cFbrLUrS9rH6H5
 sirXjmM4sN2AJnlWIdYPoN+I84bMebZ8pHCErDg9l8gNcY0fjf6+4o/ljcgOjrJnnXsH
 zpBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MY3KdiWHdb5CQcuaqFb688MwfgTh9jY8AmMC7tDgzHo=;
 b=nmcVatMOA3EJ0I40sbuM+sYSd6CLxWQwBM32n117lWkmniXM+UIAE6Jycx3UYcoOS+
 BcT4SbNr2OrJJqLzieJobnGXd8imHEfIQsZU6feYE54KYGZCbHJrYma09/qZ7z8aQMeR
 MeLQPfCQyXx/UveGhsEF6806Krqc5tmB6rA/9xe2Amiaxt7ta+0S9g7m5eOXzn4r/BC6
 MdS2T0wy/IfqXU77QeMX/0IjlkllHWnydtYcSSavy2wH5upG+tn8LcrqxrRGAoVX0/IW
 MKTJrPqjYmbeVYkFH7CCWETlskCHV6Nnxjc68b7H3XjbORQs/kf4sDyaaWKYnHDV1lLE
 dajg==
X-Gm-Message-State: AOAM530WqxUEDLEjbVh23VOsSA+MEzCqNOzgm80yLHlRJ7HLMv7QniwP
 WtTDWT7+EqxFAfGdIZqCsMU=
X-Google-Smtp-Source: ABdhPJyl7yv52MHioSjrQGG4AmhNAc90V9U32+IUh88qp//uyW424QckWORdAFdD9y/kIMs8k5Icjg==
X-Received: by 2002:a05:6000:1d84:b0:20e:5fae:6e71 with SMTP id
 bk4-20020a0560001d8400b0020e5fae6e71mr54637691wrb.224.1654081395032; 
 Wed, 01 Jun 2022 04:03:15 -0700 (PDT)
Received: from morpheus.home.roving-it.com (82-132-215-116.dab.02.net.
 [82.132.215.116]) by smtp.googlemail.com with ESMTPSA id
 j14-20020a05600c190e00b00397381a7ae8sm6074559wmq.30.2022.06.01.04.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 04:03:14 -0700 (PDT)
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
Subject: [PATCH v5 5/6] ARM: configs: Enable DRM_V3D
Date: Wed,  1 Jun 2022 12:02:48 +0100
Message-Id: <20220601110249.569540-6-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220601110249.569540-1-pbrobinson@gmail.com>
References: <20220601110249.569540-1-pbrobinson@gmail.com>
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
---
Changes since v5:
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


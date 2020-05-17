Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 846F01D6DC4
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 00:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6318789DA9;
	Sun, 17 May 2020 22:08:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C55E089D67
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 22:08:15 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id l11so9678393wru.0
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 15:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vlQG2udc7GDr5JGXbF/q4vF+mhIn8QekfFy1X7bhtvY=;
 b=DHyJsjBBHryBZH7glNoiQGUO7uk4uXwkkHGzn8Cp6rxZHsbFV6vGvDfTQ53aaDGZ1K
 BkIGkLCUuk4pweI4DpTcgK2Nekp2Jq9HOswvUsft68N7L0r5jtEmBlOGMEj9eYFiXcwE
 XeFzHic8KOMsH+dxliASyngPvtqSJNN+JTNeqjBC+SYBVlZ+qNNuWtBCqyObScliTop8
 1UtCt2TsKtCsj/WFVaAGVhvIkuZw1UGmMl8FMm2n/niXQZG1nALiJacRLQ5caPoGIlrD
 lKA6LUxr9oHYV73oshAeez7/epvHrZ4pRTHY0mg0nkQvwAdo2IbzrHMGitB10DmOzbti
 mAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vlQG2udc7GDr5JGXbF/q4vF+mhIn8QekfFy1X7bhtvY=;
 b=QyYn4nAeBb2rXLlFGwo1Auku7gjBLT72GlFSZjUS4M4ZkUluEQ4wrMd6EobaxVJhL0
 zb2ovNalfkiPQ3Fo+fKNrz7GUFwRIH1KaU3IMhaL0Q8Uns5VMqYtOmQDYlBaYDxSgMLo
 sZoMfm1ud2djHbpJJ7E54CK6JX27MM9JWp6oNtZfZ1Ri/j0ULcn+SQIxRAfh9OMzVGiP
 BJtFgEnEWgVBfYlRlLQytq474+SI03w3Vj6BdgnieWSYKZMMqr7SFxGlVo8gEgE3GeXb
 NgZS1IOVPuIq5R+gnSj672eB0CEE5cilBKxbFSn3xmyJqldKc6nAAVp5MZT16znQakIG
 8DNg==
X-Gm-Message-State: AOAM532xgZirPsrtwu5N+KVfBmGxEyoEsskzyH8mgtJpz+ryk3NOzDm6
 xiNDsr48lsWriUf2rjem+P6GHW2+
X-Google-Smtp-Source: ABdhPJztZqF86REgFZUlLolQDOtb+TvD9sDFoqDx5vwO0wz5kqneUY3+1a0p10+sjgxN4zO6IVtQkg==
X-Received: by 2002:adf:e5c8:: with SMTP id a8mr15611191wrn.335.1589753294182; 
 Sun, 17 May 2020 15:08:14 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id d9sm13805482wmd.10.2020.05.17.15.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 15:08:13 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] powerpc/configs: replace deprecated riva/nvidia with
 nouveau
Date: Sun, 17 May 2020 23:05:24 +0100
Message-Id: <20200517220524.4036334-2-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200517220524.4036334-1-emil.l.velikov@gmail.com>
References: <20200517220524.4036334-1-emil.l.velikov@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Michael Ellerman <mpe@ellerman.id.au>, emil.l.velikov@gmail.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As mentioned in earlier commit, the riva and nvidia fbdev drivers have
seen no love over the years, are short on features and overall below par

Users are encouraged to switch to the nouveau drm driver instead.

v2: Split configs to separate patch, enable nouveau (Bartlomiej)

Cc: Antonino Daplas <adaplas@gmail.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch> (v1)
---
Hi all unless, there are objections I would prefer to merge this via
the drm tree.

Thanks
Emil
---
 arch/powerpc/configs/g5_defconfig     | 10 ++++++++--
 arch/powerpc/configs/pasemi_defconfig |  9 +++++++--
 arch/powerpc/configs/pmac32_defconfig |  9 +++++++--
 arch/powerpc/configs/ppc6xx_defconfig | 10 +++++++---
 4 files changed, 29 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/configs/g5_defconfig b/arch/powerpc/configs/g5_defconfig
index a68c7f3af10e..213472f373b3 100644
--- a/arch/powerpc/configs/g5_defconfig
+++ b/arch/powerpc/configs/g5_defconfig
@@ -124,12 +124,18 @@ CONFIG_RAW_DRIVER=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_AGP=m
 CONFIG_AGP_UNINORTH=m
+CONFIG_DRM=y
+CONFIG_DRM_NOUVEAU=m
+# CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT is not set
+CONFIG_NOUVEAU_DEBUG=5
+CONFIG_NOUVEAU_DEBUG_DEFAULT=3
+# CONFIG_NOUVEAU_DEBUG_MMU is not set
+CONFIG_DRM_NOUVEAU_BACKLIGHT=y
+# CONFIG_DRM_NOUVEAU_SVM is not set
 CONFIG_FB=y
 CONFIG_FIRMWARE_EDID=y
 CONFIG_FB_TILEBLITTING=y
 CONFIG_FB_OF=y
-CONFIG_FB_NVIDIA=y
-CONFIG_FB_NVIDIA_I2C=y
 CONFIG_FB_RADEON=y
 # CONFIG_VGA_CONSOLE is not set
 CONFIG_FRAMEBUFFER_CONSOLE=y
diff --git a/arch/powerpc/configs/pasemi_defconfig b/arch/powerpc/configs/pasemi_defconfig
index 08b7f4cef243..ccb3ab5e01da 100644
--- a/arch/powerpc/configs/pasemi_defconfig
+++ b/arch/powerpc/configs/pasemi_defconfig
@@ -102,11 +102,16 @@ CONFIG_SENSORS_LM85=y
 CONFIG_SENSORS_LM90=y
 CONFIG_DRM=y
 CONFIG_DRM_RADEON=y
+CONFIG_DRM_NOUVEAU=m
+# CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT is not set
+CONFIG_NOUVEAU_DEBUG=5
+CONFIG_NOUVEAU_DEBUG_DEFAULT=3
+# CONFIG_NOUVEAU_DEBUG_MMU is not set
+CONFIG_DRM_NOUVEAU_BACKLIGHT=y
+# CONFIG_DRM_NOUVEAU_SVM is not set
 CONFIG_FIRMWARE_EDID=y
 CONFIG_FB_TILEBLITTING=y
 CONFIG_FB_VGA16=y
-CONFIG_FB_NVIDIA=y
-CONFIG_FB_NVIDIA_I2C=y
 CONFIG_FB_RADEON=y
 # CONFIG_LCD_CLASS_DEVICE is not set
 CONFIG_VGACON_SOFT_SCROLLBACK=y
diff --git a/arch/powerpc/configs/pmac32_defconfig b/arch/powerpc/configs/pmac32_defconfig
index 05e325ca3fbd..f858627385c8 100644
--- a/arch/powerpc/configs/pmac32_defconfig
+++ b/arch/powerpc/configs/pmac32_defconfig
@@ -199,6 +199,13 @@ CONFIG_DRM=m
 CONFIG_DRM_RADEON=m
 CONFIG_DRM_LEGACY=y
 CONFIG_DRM_R128=m
+CONFIG_DRM_NOUVEAU=m
+# CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT is not set
+CONFIG_NOUVEAU_DEBUG=5
+CONFIG_NOUVEAU_DEBUG_DEFAULT=3
+# CONFIG_NOUVEAU_DEBUG_MMU is not set
+CONFIG_DRM_NOUVEAU_BACKLIGHT=y
+# CONFIG_DRM_NOUVEAU_SVM is not set
 CONFIG_FB=y
 CONFIG_FB_OF=y
 CONFIG_FB_CONTROL=y
@@ -206,8 +213,6 @@ CONFIG_FB_PLATINUM=y
 CONFIG_FB_VALKYRIE=y
 CONFIG_FB_CT65550=y
 CONFIG_FB_IMSTT=y
-CONFIG_FB_NVIDIA=y
-CONFIG_FB_NVIDIA_I2C=y
 CONFIG_FB_MATROX=y
 CONFIG_FB_MATROX_MILLENIUM=y
 CONFIG_FB_MATROX_MYSTIQUE=y
diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index feb5d47d8d1e..48421f5007ed 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -738,15 +738,19 @@ CONFIG_DRM_MGA=m
 CONFIG_DRM_SIS=m
 CONFIG_DRM_VIA=m
 CONFIG_DRM_SAVAGE=m
+CONFIG_DRM_NOUVEAU=m
+# CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT is not set
+CONFIG_NOUVEAU_DEBUG=5
+CONFIG_NOUVEAU_DEBUG_DEFAULT=3
+# CONFIG_NOUVEAU_DEBUG_MMU is not set
+CONFIG_DRM_NOUVEAU_BACKLIGHT=y
+# CONFIG_DRM_NOUVEAU_SVM is not set
 CONFIG_FB=y
 CONFIG_FB_CIRRUS=m
 CONFIG_FB_OF=y
 CONFIG_FB_PLATINUM=y
 CONFIG_FB_VALKYRIE=y
 CONFIG_FB_CT65550=y
-CONFIG_FB_NVIDIA=y
-CONFIG_FB_NVIDIA_I2C=y
-CONFIG_FB_RIVA=m
 CONFIG_FB_MATROX=y
 CONFIG_FB_MATROX_MILLENIUM=y
 CONFIG_FB_MATROX_MYSTIQUE=y
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

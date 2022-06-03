Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBEB53C78A
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 11:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B7411231F;
	Fri,  3 Jun 2022 09:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB92711231D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 09:26:22 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id gl15so913223ejb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jun 2022 02:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1zf2KrerTAi6PDusMTCodCD/1wt7NqOtkOzcZDBwMCw=;
 b=XE9UmS5uUXbk7dW1oDHNECJIhdydnEwr/sWPOzRw9ppFwzYiHS0APSXiubukvYTcYI
 b522fiw0Gw7g6CtcBw8RNd27HJ8E0hm99kzeHumJ/MqnpBZR0GNBXWywp4SXWyB4Gr2O
 qPe4LPG5u8V+1PFfVYcG9fiM5sLOgs9A5s9mqZwloKOue3TwMNBlYENIpiVCtmY/stRB
 gonkzG2vv6NQDP1zv2AA191Fz2UuWQ4RbSGq4pJuV19N42oW/m1/s+JazlgrQxIudnuA
 uyCiJ+88fvPAa4vW7s1t+RW/SfRTNH6xlFSjxtbeCFn+EeYMDEOSwYXwjb3L5wCs2kMm
 rmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1zf2KrerTAi6PDusMTCodCD/1wt7NqOtkOzcZDBwMCw=;
 b=y6oim7wI8SMnTDIMEhY3JxA/07OJNWRwpm/0haz9psfcrRhXTluzn7KDmiyGLeRpua
 oByL+oBjc6DqfgSMYRlvRde2PJZRRg/8U3j0MJ5q7WllrIHChhyR/latHtpI+PY1Xe8Y
 m2vXlTFhDvWg9nY1MaczOPqqiZhm8TjHZhXyOD3bPVKflw0ndHHmBGz1kD0kgpq+AcSW
 Sq8QcZWorFKrnAfHBAAN/2qmnuTDuV/4hu/VZi9+8R2Hne/uy/vdO5zsFwlwLRsqDfS3
 D+DAE9b3CTE6BWIJsl0ZAyTW8qxa2Y1CtvC+FVF/mLCgZ9LDsCILwf5rMJfP5qRX9y1x
 HXhw==
X-Gm-Message-State: AOAM532mxRq5djQvHV40lcagWVaOSOsDCCzMiLD17fIVxD2DZStWJ6Kr
 5WfmXnkYgzD1eIPfg3vnhhs=
X-Google-Smtp-Source: ABdhPJym7Lt4blXmNu6IRUD0ciqXO8Zaa052+4cPkXGXxp1oFtfUf2t6+BktugcotPe8SSwqsoKgOg==
X-Received: by 2002:a17:906:6a28:b0:6ff:d8b:955e with SMTP id
 qw40-20020a1709066a2800b006ff0d8b955emr7970055ejc.505.1654248381223; 
 Fri, 03 Jun 2022 02:26:21 -0700 (PDT)
Received: from morpheus.home.roving-it.com
 (3.e.2.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:fb11:2681::2e3]) by smtp.googlemail.com with ESMTPSA id
 b5-20020a17090691c500b006feaa22e367sm2617672ejx.165.2022.06.03.02.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 02:26:20 -0700 (PDT)
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
Subject: [PATCH v6 6/6] arm64: config: Enable DRM_V3D
Date: Fri,  3 Jun 2022 10:26:10 +0100
Message-Id: <20220603092610.1909675-7-pbrobinson@gmail.com>
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

From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

BCM2711, the SoC used on the Raspberry Pi 4 has a different GPU than its
predecessors. Enable it.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
Reviewed-by: Stefan Wahren <stefan.wahren@i2se.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 50aa3d75ab4f..446bac1ef774 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -738,6 +738,7 @@ CONFIG_DRM_I2C_ADV7511_AUDIO=y
 CONFIG_DRM_DW_HDMI_AHB_AUDIO=m
 CONFIG_DRM_DW_HDMI_CEC=m
 CONFIG_DRM_IMX_DCSS=m
+CONFIG_DRM_V3D=m
 CONFIG_DRM_VC4=m
 CONFIG_DRM_ETNAVIV=m
 CONFIG_DRM_HISI_HIBMC=m
-- 
2.36.1


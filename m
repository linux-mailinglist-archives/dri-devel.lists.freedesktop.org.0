Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCF753A373
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 13:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9993E10E9FA;
	Wed,  1 Jun 2022 11:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE4010E9F3
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 11:03:18 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 n124-20020a1c2782000000b003972dfca96cso855329wmn.4
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 04:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fjf9xNl/MqQB/RPimZ4g9EOKQN/z4oldIhLZb2IukiM=;
 b=GmRxTPwPYrNCwNSsPIu1VTrOgW9rsJIJqoYWE4IOkuZ4c1KU1fjaWO3S7JlcvALdT3
 PQ6v+2FD4F2rTJIRpXHez2tm6Ok/46+QfPEIbKpicsHk9ds9NpEtvsTA1IzIRInKxVu3
 3Puq9O3ByF7gOdBoQFayvf7L4zYBfYCnNIMZll7JQIyNtlaUDif8ncgulQNGN5ad6jak
 TB/7zdZODU5L4c+FnZ5bvMdsdKQg4vbEAdD7tbhufVZiU2EHLqvT5rsA2FQfPZYWmDe3
 KBycG0rnMSLAuP4HJe66kQBVfxZvY89v9R8qFdv9DqupseZIFKbvOvqp143sRxHI1ba1
 sgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fjf9xNl/MqQB/RPimZ4g9EOKQN/z4oldIhLZb2IukiM=;
 b=wn6LG7RM4z3BZM9MZZPqIYsd+3siEaQaR17MPTgMA1MmLIoQaS6Jq5L0/+X/YCT8nx
 ONF/Gu8QfGb+fzA3ieHMS3UkhIrSVZLfv4P5VKCegJMNM4eq12D+ckHB07Lnk/uQ8I7t
 nKGpadd10pjabHmLhrJS6Kz+G47F/awRKPAIxiVrfHxZKu25w2TOjI72LYvromd1ztHt
 +OACYzgw5fSZf96IJwmOXse28t9jTPAyHadtlICJCaKWXZcBXh9QXa5ZV4tqICo8Y24x
 JnFeJS4b47LeW9lQFep/81XjehvLupPDSPEsBSMhUpNOio8ckboEeZA3sOYIBb8jCCW9
 ipkg==
X-Gm-Message-State: AOAM532cQon5wzF91PQ41ZPek8k7GLyQath8hNLXkgLNGeGg4MrdW65n
 eqnFJ5QPzeZPd6G5r6IcfU8=
X-Google-Smtp-Source: ABdhPJx5kYUlDNbTHYglJRLhh4T2fvS8bPm1arsI4PnjL43uMY6XoeM9y5jmJxz/v4fy8dIbqmmqSg==
X-Received: by 2002:a7b:cc12:0:b0:37c:1ae:100a with SMTP id
 f18-20020a7bcc12000000b0037c01ae100amr27692085wmh.54.1654081396592; 
 Wed, 01 Jun 2022 04:03:16 -0700 (PDT)
Received: from morpheus.home.roving-it.com (82-132-215-116.dab.02.net.
 [82.132.215.116]) by smtp.googlemail.com with ESMTPSA id
 j14-20020a05600c190e00b00397381a7ae8sm6074559wmq.30.2022.06.01.04.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 04:03:16 -0700 (PDT)
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
Subject: [PATCH v5 6/6] arm64: config: Enable DRM_V3D
Date: Wed,  1 Jun 2022 12:02:49 +0100
Message-Id: <20220601110249.569540-7-pbrobinson@gmail.com>
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

From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

BCM2711, the SoC used on the Raspberry Pi 4 has a different GPU than its
predecessors. Enable it.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
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


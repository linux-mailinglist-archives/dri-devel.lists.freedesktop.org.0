Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C75A4F884F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 22:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E9BF10E042;
	Thu,  7 Apr 2022 20:24:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A9810E042
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 20:24:54 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id qh7so13136889ejb.11
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 13:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kl7+Z31b5z6e9h/LI2V0ilKJ0VcXvm6riW22IR6e9P4=;
 b=mB705bVuyZl3/NMxV7eUgN95OzuueFRixaknj9i2n3wKMl0BwbuCo8W1GLDn+zd83x
 HXsOEqoDXBmFuRhqFS3A8KWqgs2pnLxDh0abuhrYiMHKkNhjRLs1xtfBvjCa4WR5Artu
 VhSokuLh24e7T6GlOSuMKVnBLdFDU4G7DTzbVZpT1rS58B1+XPMPgoME+nGpci+dYWmQ
 iynijdlznbraMZGvc542+HBpAQ/8YWpYF/JLAYc9MwBfUAVe6RhQ8dKzsKFK6vo1Vts+
 PaYpWBp93SXsdmKMq1EbvrBEs/1ZtafqWPRSUcE95Vz9XEYKQYMNHEqw6IqixaMydQSE
 I+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kl7+Z31b5z6e9h/LI2V0ilKJ0VcXvm6riW22IR6e9P4=;
 b=CoeKALr7rVW8Hd2tLQQV8APGxqhozQijm0WxmDTqgJ4kwppLTJYiT2WiPa64X/nFF2
 Wj9Y2Qi1qG/7xIGORJVRIehx5uQY0AT9TIhDmT0zvOZLGRbzZwoSLeIFa2V6gBB3Lvsk
 LZ4NG0PBYiVWR/QImXlgjJEW9Du+EtDUnptn9oYVrHB3cqHamfROBLbLqj8k+ELP4w0x
 ew3dzB2sODnZx2+2Zz6o09u4I65kB7y56kwqn6k+6ZAU0xvG0guOZ9qwF+bTtuOqlLLW
 djO1v8225e8JWGZYPSZwAVG0Wq89ZOFdfb6/65Lv00zAdx9kdkzINubm7uJw2nSx1kLY
 hFTA==
X-Gm-Message-State: AOAM532H5G2O1PHtBjnkpOtIlDpSnaaHdpx3cvFZ40ohZuhWHM9olHLr
 i62Kr7WwFcHS9X4mXy+3LOeIdw==
X-Google-Smtp-Source: ABdhPJzLTFn1k0bcXsd3ZFpEaE41vvoUC2g+Pk7R+jCWVYVnRJZxC3JFtm2ZAcr4WsZw/KYi47Xp1A==
X-Received: by 2002:a17:906:dc8c:b0:6e0:6216:3698 with SMTP id
 cs12-20020a170906dc8c00b006e062163698mr14845834ejc.144.1649363093087; 
 Thu, 07 Apr 2022 13:24:53 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 y17-20020a056402359100b0041926ea1e12sm9938420edc.53.2022.04.07.13.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 13:24:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Russell King <linux@armlinux.org.uk>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] drm/armada: drop unneeded MODULE_ALIAS
Date: Thu,  7 Apr 2022 22:24:43 +0200
Message-Id: <20220407202443.23000-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The MODULE_DEVICE_TABLE already creates proper alias for platform
driver.  Having another MODULE_ALIAS causes the alias to be duplicated.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/armada/armada_drv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
index 0643887800b4..0a819a4908b5 100644
--- a/drivers/gpu/drm/armada/armada_drv.c
+++ b/drivers/gpu/drm/armada/armada_drv.c
@@ -285,4 +285,3 @@ module_exit(armada_drm_exit);
 MODULE_AUTHOR("Russell King <rmk+kernel@armlinux.org.uk>");
 MODULE_DESCRIPTION("Armada DRM Driver");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:armada-drm");
-- 
2.32.0


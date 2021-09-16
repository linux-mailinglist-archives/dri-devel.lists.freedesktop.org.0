Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B77640E1BE
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 19:05:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 584D26EBA8;
	Thu, 16 Sep 2021 17:05:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 325E36EBA8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 17:05:24 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 027E6402CE
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 17:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1631811923;
 bh=G5XLzRNzE6Anf6+jGBSbUrQ+OGTKc6EmRKiKobcBIgk=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=Df0He+fGAGSLWwbO0QbLp/nO9+qsKNxxaE/+g6SOUFOrq5Q6JoHfwgkTkj+Ww87pK
 SQ8ftNeBT/dTLcVUM10D22znGQiexDhhB7ZRNHIdlVwK/feIoV6lxux36pxtgrdRAW
 EAsF+goocpH+vOI4DDwaTimeS6Oa83E14k+DjGVjwoNbMjvr1GFJNIKospgMIMW/ZV
 FCZj4nWtIJ7n1iA5dnDUEG6lPdwmVhi41EzxyosPNWzAwQQiopNAGS2fiHZzGVSEFp
 GjL35EDGZcedEd07U5nkfR8BKTdfKuAU9UVS1lozX8k2Tx6hzGRmQZuVPYhsZmxj0H
 F91NYx+tY4m/A==
Received: by mail-wr1-f71.google.com with SMTP id
 r17-20020adfda510000b02901526f76d738so2713647wrl.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 10:05:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G5XLzRNzE6Anf6+jGBSbUrQ+OGTKc6EmRKiKobcBIgk=;
 b=w4fKZcI+S2pKlTnKb/8dUiRS6tOMu8YOYrKaukHcZzJj14S4YvLOczg777SV6TqNUK
 zZ3m/shnv2cv/cP2yXRpKTlBRcJAzxceCCchnHX4VPd5D8O5+LLxkarUzUp7e9shVYRD
 CkhG6IdtLHvFZbkcORH2S8y9i//0KTjUcVTUPbqo7dqm72IPTNsw5a8kPgVsz25TvNvp
 u2E7y5O9I4f/cgYvLHlz79k+YItdfdDC6a3a1HRyEqT6fWhbiYQexXoj55ZNk/yzunvN
 Cf+Dz7pWAzjCUtiUxM4qiOC3bzxDWChNsYNlEyDtBWzVhO/RLjlUXbY7QlQ4vogdVXBX
 F63w==
X-Gm-Message-State: AOAM531UTH80eX6nOPFDajlBktGkbVlsxKt1Py9RmYokC3D+wptP+bOb
 EXV9TLQPSq3fw1NS13cUG/i++1ZJeFk8R3Sh8a82scyiTyRhOy6CnPutiCTDhwPNALwyqCsB4Ys
 KxYgS6/E1JGYC5PhGEjEg+3KzMmWsiA0BvU63ffVgLD7BUA==
X-Received: by 2002:a05:600c:2281:: with SMTP id
 1mr6032274wmf.164.1631811922648; 
 Thu, 16 Sep 2021 10:05:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCja6HX8P4A49WxgOb6Z3yAX4QBJSx9DhE2B/5EXTQQQ9K2cb1KDQ849/FD0ejwCXzxV4ZWA==
X-Received: by 2002:a05:600c:2281:: with SMTP id
 1mr6032253wmf.164.1631811922471; 
 Thu, 16 Sep 2021 10:05:22 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net.
 [84.20.244.219])
 by smtp.gmail.com with ESMTPSA id d7sm4134544wrf.3.2021.09.16.10.05.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 10:05:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Russell King <linux@armlinux.org.uk>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/armada: drop unneeded MODULE_ALIAS
Date: Thu, 16 Sep 2021 19:05:20 +0200
Message-Id: <20210916170520.138093-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
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

The MODULE_DEVICE_TABLE already creates proper alias for platform
driver.  Having another MODULE_ALIAS causes the alias to be duplicated.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/gpu/drm/armada/armada_drv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
index 8e3e98f13db4..d45d49b290a8 100644
--- a/drivers/gpu/drm/armada/armada_drv.c
+++ b/drivers/gpu/drm/armada/armada_drv.c
@@ -293,4 +293,3 @@ module_exit(armada_drm_exit);
 MODULE_AUTHOR("Russell King <rmk+kernel@armlinux.org.uk>");
 MODULE_DESCRIPTION("Armada DRM Driver");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:armada-drm");
-- 
2.30.2


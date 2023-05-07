Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DCF6F9900
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 16:48:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC38A10E173;
	Sun,  7 May 2023 14:48:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF5010E173
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 14:47:58 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-50bc070c557so7068255a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 07 May 2023 07:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683470876; x=1686062876;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=PBw+x9bvNtvt7zmxEBMLA8rMP4RbJHux+PW551gPw/Y=;
 b=AwInZtYbyq8MwNv/nmioV0/vEWMEkbmPYAXUNEB0pSDGTtmJrkEJirty3CUOkW0L6Q
 i/LwNUWeJZ7LAq22+3vPajyEeXdRjOHUWMv7Gf0fFmkjM0ipTyK6NWG+ch9bAdoNLY0U
 IURXOWqoQkWthEWtaYaZatybZDSHLg+EsGTHPzgTSGMgNVgXhhxhMvCGUgXzKRRJZA1J
 jLteEs5cBokvh1Yxd5m1vcTKZlfksAArtrZGr4fUy+VsiqjB2wLVCpq1cugD4qiARq1f
 T9r/21qTg4pWhVPVF81JXGhU7ryq/IlGoL9N1DJ1dKv6O8cXNEfVKeC6f6vAmxB+NoDc
 FvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683470876; x=1686062876;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PBw+x9bvNtvt7zmxEBMLA8rMP4RbJHux+PW551gPw/Y=;
 b=ev29hU4SAz4rJdUQvizpQZE4u0bmyHakRpAlRNbw1R95x2qhjLDyNjb0FvURWRA4+S
 oyjcJcjjVNT6abUv8xLq5oLvQfdBygcLLa7M84F/r9wNF78hSWh7OxanjRzqzkl3yDi5
 G+aXXCXFJ1RSC0BDPH/zA7J2VV3p4tX1AZe3J+8wNzSiFChqlmVThei1yrsMSik92P0x
 S4FIsOdDxrQaSFSOOaju8Gn8MzYtPMZX0qcEB6dpxmM7iw2bq7wuoyoeEca25XfxqRQm
 pMUONoLQakS3H2MUVCc3dyANTXbPmVI9epP8ZggSDoWFTBKXIm5OXL+rhEvzfbnRuL9v
 /bFg==
X-Gm-Message-State: AC+VfDxNzh1A86bEEvN66AOtAC9f0bZDu+YppvjaHZ54chaMRkJiA9iw
 QroOGwqNMOWgcxa/Tvk7L192SQ==
X-Google-Smtp-Source: ACHHUZ6TCPbXEZFv7aTp7aqWDp1eF0qYHjb6r45RdoMNpf0N9RbftBDpLEB9W6gEbGIkLV9Aqg2awQ==
X-Received: by 2002:a17:907:3e8a:b0:94e:c142:df98 with SMTP id
 hs10-20020a1709073e8a00b0094ec142df98mr7721629ejc.60.1683470876419; 
 Sun, 07 May 2023 07:47:56 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:1757:b51a:9965:e81])
 by smtp.gmail.com with ESMTPSA id
 j23-20020a170906051700b00960005e09a3sm3752899eja.61.2023.05.07.07.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 May 2023 07:47:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/exynos: g2d: staticize stubs in header
Date: Sun,  7 May 2023 16:47:53 +0200
Message-Id: <20230507144753.192959-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Stubs for !CONFIG_DRM_EXYNOS_G2D case in the header should be static
inline:

  drivers/gpu/drm/exynos/exynos_drm_g2d.h:37:5: warning: no previous prototype for ‘g2d_open’ [-Wmissing-prototypes]
  drivers/gpu/drm/exynos/exynos_drm_g2d.h:42:6: warning: no previous prototype for ‘g2d_close’ [-Wmissing-prototypes]

Fixes: eb4d9796fa34 ("drm/exynos: g2d: Convert to driver component API")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/exynos/exynos_drm_g2d.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.h b/drivers/gpu/drm/exynos/exynos_drm_g2d.h
index 74ea3c26dead..1a5ae781b56c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.h
@@ -34,11 +34,11 @@ static inline int exynos_g2d_exec_ioctl(struct drm_device *dev, void *data,
 	return -ENODEV;
 }
 
-int g2d_open(struct drm_device *drm_dev, struct drm_file *file)
+static inline int g2d_open(struct drm_device *drm_dev, struct drm_file *file)
 {
 	return 0;
 }
 
-void g2d_close(struct drm_device *drm_dev, struct drm_file *file)
+static inline void g2d_close(struct drm_device *drm_dev, struct drm_file *file)
 { }
 #endif
-- 
2.34.1


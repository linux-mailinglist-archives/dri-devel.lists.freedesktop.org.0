Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF401537456
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 08:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79FB210EE56;
	Mon, 30 May 2022 06:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C632B10EAFD
 for <dri-devel@lists.freedesktop.org>; Sun, 29 May 2022 18:06:12 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 r9-20020a1c4409000000b00397345f2c6fso1681004wma.4
 for <dri-devel@lists.freedesktop.org>; Sun, 29 May 2022 11:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EO26AUWJ/HH6ekAIEmzU6J8VaDRoPc2hBu7v7f55oYw=;
 b=Ut/3o/vjop+XvvOsl44WCqPBHIteAXJjKksKyEGNHkRYViEh/0H+iWhEPDIvMjoBue
 ypKg/NsWPyKUstGLXb4S4J8oeVoFoPGH/LCi0jjXmEyVnTEwBQ+g/UnUDgS8/aRjSoNX
 8rq5KJVU4QFnAjdkf9l9xRFpXS1Uz2SWpwA1p4jW442nZT8dU2ZTfOBZL2L8Txp00BOl
 t8UxcfmEt+MgEWVTZfAOKamX7eABZ6ZqeWtytVrMfnKbd7EQsWTEbvkcoxInvYIPY00w
 eABRyy1twDuA+Eopf7svMdNh+zWooXxqjwd78M8L7/lA3ZIpTAL1RAihitqIqmsjQBiz
 71aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EO26AUWJ/HH6ekAIEmzU6J8VaDRoPc2hBu7v7f55oYw=;
 b=vS53IavI260/IgP2XkxzZgr2wS6e6VHft7D0uoW6KE/lUVjJHfQiJeJU4MXdrGwUDi
 kKl5fDkB8Z/7zpD/DZYES62MJnXOzFkj5HVJn7zjoExrd1ingqaSud/z7FyP61fhfp1Y
 uUVWktNKBSffwNdo/zrn216LVazgP/LZSGKlDjU0DkjuEoK/JOyambTuLBcOUioXOKde
 Sr9Oh25ZqXIhw3fAOW9XV6bliXgwR6WiJhMc7sn5WAYalfmvs1gbCmK9f8QAlrUgntta
 b9dQ5n2k1rD5KEW8a/2kLL58BIH62W7VmEpHo2T4TL+90xB/uE2YdcOUM0F+Zt5XDvnu
 Bn4w==
X-Gm-Message-State: AOAM53299ka8U0AwY4gAcJ7bs6SCQpoiH7NB/mqSAGTDD5MkCAHuLFFM
 QiWQHIFXsO88xgtpLTXpmGA=
X-Google-Smtp-Source: ABdhPJxlYG8SM67NDb5Fbhbvwq3vk+QYOPmUHuzle9cj8mRUUh4U2pI0i/8Bz6YPyXdLUwaVR2YQ3Q==
X-Received: by 2002:a7b:ce07:0:b0:394:890e:9193 with SMTP id
 m7-20020a7bce07000000b00394890e9193mr16240825wmc.117.1653847571313; 
 Sun, 29 May 2022 11:06:11 -0700 (PDT)
Received: from localhost.localdomain ([188.163.112.60])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a056000136700b002100f2e6a7dsm7008516wrz.93.2022.05.29.11.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 May 2022 11:06:11 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Svyatoslav Ruhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Anton Bambura <jenneron@protonmail.com>
Subject: [PATCH v5 2/3] dt-bindings: display: simple: Add HannStar HSD101PWW2
Date: Sun, 29 May 2022 21:05:47 +0300
Message-Id: <20220529180548.9942-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220529180548.9942-1-clamor95@gmail.com>
References: <20220529180548.9942-1-clamor95@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 30 May 2022 06:15:25 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add HannStar HSD101PWW2 10.1" WXGA (1280x800) TFT-LCD LVDS panel
to the list of compatibles.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 1eb9dd4f8f58..0d6f3973b12d 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -156,6 +156,8 @@ properties:
       - hannstar,hsd070pww1
         # HannStar Display Corp. HSD100PXN1 10.1" XGA LVDS panel
       - hannstar,hsd100pxn1
+        # HannStar Display Corp. HSD101PWW2 10.1" WXGA (1280x800) LVDS panel
+      - hannstar,hsd101pww2
         # Hitachi Ltd. Corporation 9" WVGA (800x480) TFT LCD panel
       - hit,tx23d38vm0caa
         # InfoVision Optoelectronics M133NWF4 R0 13.3" FHD (1920x1080) TFT LCD panel
-- 
2.25.1


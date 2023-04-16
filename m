Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1486E40A3
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 09:21:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 971FC10E368;
	Mon, 17 Apr 2023 07:21:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43AB010E0F3
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 13:08:10 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-94a342f7c4cso529654966b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 06:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681650488; x=1684242488;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6CtBhR8YOpDqMIofOmWwuAA+9qpS9Sa8zpuzMOiM4dE=;
 b=rCDxLuBs4qW14s7jBjqt1SI/X2rWlsRnsEziv+Ob2RmEBzazeM/AEmaupxLE13hHSh
 1YBkOx5JAjb58cpFCk5ynqK4rx+rEiqT/iITAA/zuCKie09kmRIpLHbU8AedFhFGlZ1y
 5hTpHMFqX73OzZq2XeFyUsfcuHo4kaGBB9W6s8PqFl255+mS20E7vx8rTdTyD6y9XnyY
 ZUaWHuBR4EwLHvxpDHOh8qlKyKTDq2P2d9B8yaw4d7EIJyw13qWOdek1L6eemcu/mLcE
 MMpHmH5ZHqQNg8UE8HJCMRoABBjSi17oe8P5wKRmo3uKmQ4NLQVkS7gGykGG+frApBrW
 QuQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681650488; x=1684242488;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6CtBhR8YOpDqMIofOmWwuAA+9qpS9Sa8zpuzMOiM4dE=;
 b=IgcJhqAkDebbX/ehyg4Skd9n8oBQ6kOWW1RzJxbtmAixWZ5Zm4BGkhLV3Oa7NgaHMW
 zGbZwM+yEvZDksSqqjTQ31X6ESXYcqJM7uy5fC3tyDyZfFTcLzXiTavQVrykwJNswPrX
 G+3WHTjE/Zozz+lajByTuWandvdVnLmKbTPv2sYCBQCfUgR3NNfLjVYjn+SdShM6a0zS
 35eMJfHFkRkOJrLXouDioRDcjmvIuVruzsnbAW4Mi3s84zP78x1iYoL0+CdWM5S16pHQ
 1bW+uSBlOg5llF+QcqgSYuu9mZG6GvLspHYyQ7Fgk811eYvg7wvpCR+Yuv4TivO3NkEt
 q6Pg==
X-Gm-Message-State: AAQBX9cLBJjKkaAJK2lvXIs0BE5M6F1W4ab2dl8NPkMJhZnsqgnv0KLm
 PHURmPhOlHv4rPTJ8xtY2vo=
X-Google-Smtp-Source: AKy350aJzZAl31uqCqNRi9GrSrLwH3pnFr31orBUjbJJrDt7xf24JXIQWWiuHvlBD8gAnHReDdf0Pw==
X-Received: by 2002:a05:6402:2d0:b0:502:7767:3c73 with SMTP id
 b16-20020a05640202d000b0050277673c73mr10268337edx.22.1681650488479; 
 Sun, 16 Apr 2023 06:08:08 -0700 (PDT)
Received: from localhost.my.domain (83.8.121.70.ipv4.supernova.orange.pl.
 [83.8.121.70]) by smtp.gmail.com with ESMTPSA id
 l12-20020a056402344c00b00504803f4071sm4511609edc.44.2023.04.16.06.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Apr 2023 06:08:08 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
To: thierry.reding@gmail.com
Subject: [PATCH v2 3/3] MAINTAINERS: Add entry for Samsung S6D7AA0 LCD panel
 controller driver
Date: Sun, 16 Apr 2023 15:07:35 +0200
Message-Id: <20230416130735.30965-4-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230416130735.30965-1-aweber.kernel@gmail.com>
References: <20230416130735.30965-1-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 17 Apr 2023 07:21:51 +0000
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
Cc: devicetree@vger.kernel.org, sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, krzysztof.kozlowski+dt@linaro.org,
 Artur Weber <aweber.kernel@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add myself as maintainer of the Samsung S6D7AA0 panel driver.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 90abe83c02f3..6a55e6e3ac59 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6623,6 +6623,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/samsung,s6d27a1.yaml
 F:	drivers/gpu/drm/panel/panel-samsung-s6d27a1.c
 
+DRM DRIVER FOR SAMSUNG S6D7AA0 PANELS
+M:	Artur Weber <aweber.kernel@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
+F:	drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
+
 DRM DRIVER FOR SITRONIX ST7703 PANELS
 M:	Guido Günther <agx@sigxcpu.org>
 R:	Purism Kernel Team <kernel@puri.sm>
-- 
2.40.0


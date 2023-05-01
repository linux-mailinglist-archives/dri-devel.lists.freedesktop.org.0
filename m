Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 527696F3648
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 20:51:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA4010E267;
	Mon,  1 May 2023 18:51:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9943610E267
 for <dri-devel@lists.freedesktop.org>; Mon,  1 May 2023 18:51:16 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-94f7a7a3351so569215566b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 May 2023 11:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682967075; x=1685559075;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ia4S9+YQp0hX054SmvRAd0/GGyvsyhJekQtGvFs9lZQ=;
 b=TSMtVM/KcrRmtF+UDxEuIC3kVv5dfOap7UT9r3zRPlFcA+h72j/j/Nc9iPmrFTgwC4
 a26u3Wi3qOxAPcAdj4/2G2PQ3mi2ww1HPFwAbKUYsevdjTjlgnOcPZQbnnnuoGtHyq3x
 k5eWdaF9hVazYrs3m/stejdLIdcwY0d+1JQhclT3Qc3vVKxTeyVf047r2r/ytwjkAwe9
 D3NStU3JSnMeOEPKrGmXWEJNnZX2acAw8IeEWYFnWbWUSodaSKAsm1poDdqiJG8ZGA73
 4tfbjqcKBNPypqKUi+4JIc+DWk1I1k3LwNfiTDGqEKhNFysG0UFBJcVlHajqH3Ga+uhl
 3fLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682967075; x=1685559075;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ia4S9+YQp0hX054SmvRAd0/GGyvsyhJekQtGvFs9lZQ=;
 b=fTAkGc8O3DoRIGlwS70TLNBLWiSQ13CzCOhKlqo2RPi+JJ5llfMJ4w6MBIVcPNPrB8
 jSKcOqKHLkT1BDf4ELCcLTT4XnA5HTsST4LpxUp3EJ4tyRUTF8gDWtYejQ5A+DYEFVGf
 DpFBtWLRJymE3kyCKO2Yeu6tMxHxUqlsXuVJ/Z2h+/JbKlmiusxHyhGqYX7aC/HywXID
 tsa1LogYDz2AwgdvT7IUWj+svYcerWAp2DwTcgV4hyvlwT2RD8XC8BwHuuEsGUwwvf0Z
 mtLep8L1hMHjlmiMs0eCnPqX1+LWLuBoacy/tG6hNBnVuL6Q556qqznI1ojIPKi2P9oM
 fGQw==
X-Gm-Message-State: AC+VfDyd1i3ScmdWWUZT5nMp93JM1elnvzmI9wv3RT0mUBmH5QiUV6Mr
 tKrdbRcZYCRk01iBgtl/VZM=
X-Google-Smtp-Source: ACHHUZ5KFqi8j+53PjOE4k7tKQLtJogIZF5Gqg6aaMT6dnsZEF7Xh6DD+ZHgPQq+bJFOLMCR32oL1Q==
X-Received: by 2002:a17:907:2681:b0:94a:682f:7744 with SMTP id
 bn1-20020a170907268100b0094a682f7744mr13675993ejc.16.1682967075013; 
 Mon, 01 May 2023 11:51:15 -0700 (PDT)
Received: from localhost.my.domain (83.8.115.30.ipv4.supernova.orange.pl.
 [83.8.115.30]) by smtp.gmail.com with ESMTPSA id
 g10-20020a170906594a00b008cecb8f374asm15028335ejr.0.2023.05.01.11.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 11:51:14 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v4 3/3] MAINTAINERS: Add entry for Samsung S6D7AA0 LCD panel
 controller driver
Date: Mon,  1 May 2023 20:51:03 +0200
Message-Id: <20230501185103.25939-4-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230501185103.25939-1-aweber.kernel@gmail.com>
References: <20230501185103.25939-1-aweber.kernel@gmail.com>
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
Cc: devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Artur Weber <aweber.kernel@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add myself as maintainer of the Samsung S6D7AA0 panel driver.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 59a9a22a69fc..d1bc2f8b6e34 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6641,6 +6641,12 @@ S:	Maintained
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
2.40.1


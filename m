Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C0773981B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 09:32:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 504E310E4DB;
	Thu, 22 Jun 2023 07:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86A910E431
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 10:02:50 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-54f75f85a17so3030695a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 03:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687341770; x=1689933770;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NbgYhzuy9T4qbd91L6MqO3N2cluCsCr/3CGw0bX5giM=;
 b=bM5JEEK4NPKMkM6W1IwcEojJlILIMMIDhB+SvMF6sZZAyXv4bBmqCd4fGSfoOaDxr2
 L8QBmZdyXpz5iue9RolaZGEJmyFsQrgZmoC2vNY9Z5ZWNV+ibzetkhmIr4n+zLza7j/J
 vUzIvFFpKMoqSL/WrD5Sw7h4KLTNyFsb79CPDee02Aa5wKcpaaXo0ao9m/87jnwtuFmR
 9IstcF8zKhoxZw7rYXhszdRGtRltN8vVNlamlQcgj9I2Z4Mb2QbRH7gGkyV73DoyJ95R
 gRUslLyMpx4u2Fm+wettrXmwlUPnsLSs8H5MzeElJ0yRari2Klk8nXmdwsW7VQSNsM35
 GHwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687341770; x=1689933770;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NbgYhzuy9T4qbd91L6MqO3N2cluCsCr/3CGw0bX5giM=;
 b=SM9QYLmAeHXBaQNuk46kAxtaycgvclqSJ49244cRq2DLTZZEa46UZAnhjf4taqGkar
 7TUzH8bCC0W64vVwYrolIKquHC0K1U6C4wncx45n+o7n/M1SgByTXYcHvfdBe19vgLzp
 PlDOmyn+B9QXAYkJnIMueRgb0WT/InC+HWuwJMUy/vOJ9RkC52vBMZ6BtDXcq9Xt9Cj0
 OczKEPXec7143mh93S7uxT7fICesj+UVlYfu2sTBKk0oPh5MBpTM2dnF+aUNhc7fVpaV
 cCgXr4bq8HLXn31QQtXcKl2TKuvPJyhREX2TBrL31oE2TuvYtbRuSB5Nd3MrXcKpDxsb
 G66g==
X-Gm-Message-State: AC+VfDyDm87n8KZ0szKa4oXaA8TS0IVrIOLg4S3f5+fVNNyY21l88Zfb
 /zBt3IZqnYwvs7QOU8zCXDI=
X-Google-Smtp-Source: ACHHUZ7Iv6KmOrh1v1bjsJiVlUBhn/NNiK8EONZ8ffxFbrchIc7x+gMjwFAPM8hxQx5BrKuFsou6CQ==
X-Received: by 2002:a17:90a:c905:b0:258:818a:fd65 with SMTP id
 v5-20020a17090ac90500b00258818afd65mr8490381pjt.30.1687341769913; 
 Wed, 21 Jun 2023 03:02:49 -0700 (PDT)
Received: from anyang.. ([106.250.177.234])
 by smtp.googlemail.com with ESMTPSA id
 e4-20020a17090a280400b0025c09577ce1sm9402937pjd.7.2023.06.21.03.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 03:02:49 -0700 (PDT)
From: Dongjin Kim <tobetter@gmail.com>
To: tobetter@gmail.com, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 1/2] dt-bindings: ili9881c: add compatible string for Elida
 hj080be31ia1
Date: Wed, 21 Jun 2023 19:02:43 +0900
Message-Id: <20230621100244.1325638-1-tobetter@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 22 Jun 2023 07:32:28 +0000
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

Elida hj080be31ia1 is a 8" MIPI display panel. It utilizes an ILI9881C
controller chip, so its compatible string should be added to
ilitek,ili9881c file.

Add the compatible string for it.

Signed-off-by: Dongjin Kim <tobetter@gmail.com>
---
 .../devicetree/bindings/display/panel/ilitek,ili9881c.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
index c5d1df680858..0f47414e3375 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
@@ -17,6 +17,7 @@ properties:
     items:
       - enum:
           - bananapi,lhr050h41
+          - elida,hj080be31ia1
           - feixin,k101-im2byl02
           - wanchanglong,w552946aba
       - const: ilitek,ili9881c
-- 
2.34.1


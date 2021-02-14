Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AF431AFA3
	for <lists+dri-devel@lfdr.de>; Sun, 14 Feb 2021 08:49:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEAD66E8A7;
	Sun, 14 Feb 2021 07:49:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3CC46E8A7
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 07:49:52 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id x136so2325997pfc.2
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Feb 2021 23:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=Wih16HSatVXdvXOx66yUm+mckH3unmlIZxuy5E5dQJE=;
 b=GJpdY0oawUtAK48cBfcYCDz1VyS53aaKxJ8gdW3ToveA9MHLzK47OJjUlLZ7scmw+8
 1/JoBnE53pIVzqXAQrqoemBhX+TQuJDqRQOfv8Rh0LnDel36a1LW1fxn4lScPGBQ0Kme
 8AdkaIgduPMEIQjRc56QZBzQiF+CCKrtKtP6QHoHWhJRDLTpXGNiEpSQOYzgs2Livz8O
 B1jF427GpY9ymBKkKZ+2op0tv5VqqsE4FC9BrlqPxIlUgqzQ5PCMHzUBC6vB1FPlmbJy
 /jiuqY2+1uWG7afxSIIzNLF5HujFpDbHqnlbdq/KxFqw53VX+XPcNoTxCPx6muAy8D8i
 T2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Wih16HSatVXdvXOx66yUm+mckH3unmlIZxuy5E5dQJE=;
 b=k3FVi35oKEh0sC9XYdhvgGHnYDNZyyDL5zpJWGJ3BPVAQF+64aorlLeHDS/nPXgIz6
 kT+wojQkG29ZbP3y9ZswqmT4CfDwTXuol4XNslIUOeJfj+1wmF9/0/RxfDJyNm+aRb8I
 537V+od4wbXGUw955uE/Uvc7V/NerbvigAO74APuTFocKBZ98Ch/JVgWMlMST2c+4rPX
 NaxTKPsmWbyoSg24PTdQCOA4FOi04yakKyDES2Wv2hTjg6kYC0nauQo3EPW8hk5kmrwU
 NhIRZ/vluZiPWtI/jWsC8TjSdVagCgbameSdAQNrOGvwEBJS9nmCg88QvuLE9IeWJqn1
 MQqQ==
X-Gm-Message-State: AOAM532ArksvdzXm9fOsCd5CXu8LZtUltAD972dxkH9BKBIov7tmLJFy
 3vh6U93+vyFDRH3nMPahcsGxJg==
X-Google-Smtp-Source: ABdhPJwcXFMdswJMBjyUAd89GLKRnCn9VYLP+vpN8AsbonURO1qrHZyTDs1mgS8gtQDL92mEwQbzdQ==
X-Received: by 2002:a65:4781:: with SMTP id e1mr10671155pgs.30.1613288992040; 
 Sat, 13 Feb 2021 23:49:52 -0800 (PST)
Received: from ubuntu.huaqin.com ([101.78.151.214])
 by smtp.gmail.com with ESMTPSA id h3sm13928394pgm.67.2021.02.13.23.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Feb 2021 23:49:51 -0800 (PST)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, drinkcat@chromium.org,
 jitao.shi@mediatek.corp-partner.google.com
Subject: [PATCH 1/2] dt-bindings: display: tv101wum: Add STARRY
 2081101QFH032011-53G
Date: Sun, 14 Feb 2021 15:49:27 +0800
Message-Id: <20210214074928.31901-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add dt-bindings for 10.1" TFT LCD module called STARRY 2081101
QFH032011-53G.

Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
---
 .../devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
index 38bc1d1b511e..01c2bf7321ae 100644
--- a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
+++ b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
@@ -26,6 +26,8 @@ properties:
       - auo,b101uan08.3
         # BOE TV105WUM-NW0 10.5" WUXGA TFT LCD panel
       - boe,tv105wum-nw0
+        # STARRY 2081101QFH032011-53G 10.1" WUXGA TFT LCD panel
+      - starry,qfh032011_53g
 
   reg:
     description: the virtual channel number of a DSI peripheral
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

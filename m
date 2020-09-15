Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CFC26A4EC
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 14:19:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE2586E266;
	Tue, 15 Sep 2020 12:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB356E266
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 12:19:20 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id k18so3209923wmj.5
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 05:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/f+R+j91elfFPYf4zfHO7Bzdv43BgZ5CODvbZ0Vzlb0=;
 b=ALUSvXEave0lkRZzUeEbGO8h2GDfO0EU1AiDTv2SiPlJ4oOGdkbhRYuv9hFUcMyGSO
 alirB7AKsTW6bTsLpcZ92Ic+b9IriMXONlINaxSKzFIhfodhg/IoZo/6QshxxDEFPQF9
 +z0PYAL6PDisRD661B16WsycbbcZ61BeLzcMHp1/DvhmU7DKPBTRMHjtHkMn5RmafR2Q
 s70bVvvdGwrgVsJxh0OiBJnXJwxMlOn6mg4OI+PW/l4Ap6wUcG33kZiGkZP+yBlpHoqh
 dmfDxhWB79y7cZntYKBsS+i/WkkYB0rizS9oBJEauiIWy4wyfvIo6eZjTzxlPGxabafg
 ikHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/f+R+j91elfFPYf4zfHO7Bzdv43BgZ5CODvbZ0Vzlb0=;
 b=FYjQUUlcZ1wepzptUBASXXTCoBDtNOsdBDxAaT/bDD5lOGs8L3NsaVJ8ToWMfmzJBW
 akLMnhCXkPgpG1EYIlzDDvT4O6Rg4mcjFxY6797tlOf9enZxJ2AkKO8R8vgRjld1fb9h
 Ctrhfukq5ePmhrrTsuiyTX0eopRif9doWBu4dOfhaEVhvjJx0w48c9Atb1LnZcDRufgV
 meJdJvcFrNDyTSj8ubWvcwfI2j7zosOpwcUqfSX9gJSHxcRI7q/a3DhmC1nNlXopsR9j
 GmASy6jBJttAaoSG+L3uawcPymys7fqrZb+CxhXbPCYGPj0EEwinbpc5Q6mKeuopAX1A
 7dEg==
X-Gm-Message-State: AOAM5334bJwhFCwmqR9rkhOje8nWpn3ZLAgVo86l8vVMYaQj3K5+fxtR
 2FMgCm8L1Vrj5/Fg3nJA75etgQ==
X-Google-Smtp-Source: ABdhPJyu3ypcdWMW/OyELVvdkIVANM6RtWY9v4+qY/DqA8slXt9wOmWk6s4o4g2lz7Q0ucEvuSK83Q==
X-Received: by 2002:a1c:f008:: with SMTP id a8mr4634653wmb.155.1600172359411; 
 Tue, 15 Sep 2020 05:19:19 -0700 (PDT)
Received: from bender.baylibre.local (home.beaume.starnux.net. [82.236.8.43])
 by smtp.gmail.com with ESMTPSA id
 2sm18271411wmf.25.2020.09.15.05.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 05:19:18 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: thierry.reding@gmail.com,
	sam@ravnborg.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 2/4] dt-bindings: display: panel-simple-dsi: add optional
 reset gpio
Date: Tue, 15 Sep 2020 14:19:10 +0200
Message-Id: <20200915121912.4347-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200915121912.4347-1-narmstrong@baylibre.com>
References: <20200915121912.4347-1-narmstrong@baylibre.com>
MIME-Version: 1.0
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simple DSI panels can also have a reset GPIO signal in addition/instead of an
enable GPIO signal.

This adds an optional reset-gpios property.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../devicetree/bindings/display/panel/panel-simple-dsi.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index c0dd9fa29f1d..4d08e746cb21 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -54,6 +54,7 @@ properties:
 
   backlight: true
   enable-gpios: true
+  reset-gpios: true
   port: true
   power-supply: true
 
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

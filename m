Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2908C48365B
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 18:41:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F80E89F6B;
	Mon,  3 Jan 2022 17:41:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCFD389ED6
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 17:41:15 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 v30-20020a4a315e000000b002c52d555875so10915473oog.12
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jan 2022 09:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F97Z9MZZpfYYxOf9tOkgxm3NqcNPkDJulog1JYW2wkA=;
 b=dOtxezKa29TR5UHXkO0ngMZqU94ibNi/K3SMr2BwvdmXMEcuDpozQZ0ff+rGyk8QHf
 c90HT7xjFDAzAh3bKvKZnZMZ8oN58RRqt5TOUdrsWPz1fIc5dgXRGw4OVCuBBABOIjtp
 qw6zn4WvaDh6Fd/pS8T9N1WA1IEv7QYVs954yLO7DNFPVClvx/aea97kafU9UpIHD4RA
 HpugxMhyOKayXf1vlEoHxeFzp8TFzmVKIiMJG0N2yVAfCtOjei+yTXgqksP4AbqDoM87
 j1WXrlzE4QbnH2IgdhwM8RRR9r/FeI9+PFTojQZ056Pxz8K0d6Nv/TgdJokiolKS+ZMz
 wh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F97Z9MZZpfYYxOf9tOkgxm3NqcNPkDJulog1JYW2wkA=;
 b=p/XUvO9n1recs3IWYpL/Eyygl1D/yg+UwknUW2hjK6zcimyrmgSrVrkaEsY/K5NrGq
 gzUBXcyjL7Vux2LciwRIE5cB14L9R2gbQv57r66fx/e7/8i8IUgt7i4Sj65s4d+lAry1
 Bt1xnYAaBb/cHBu1aOUfNqYHU/Jvu+wsA098Y/rZ84JN400nnwVjuNKlDtj45bYhKn26
 ZHCuMQnu/pmm5g4iurtvyb2ihf1kEF43nR8lk3Z3mp61W8LOIsONkdNbjigtAAnZgJyd
 XYHneSjkfyOHpnVTD+AT8NpkUhgpZmi13OniF3olt8azj6ZFD9mAuVQgLgBKzlvoadjt
 kAxA==
X-Gm-Message-State: AOAM532mgJJpTK6Igh+kMTlvyK0ZzwlvYL7ViCsU5rGF3Uo6G1JG3A8Q
 IZIFVIUd4XKI3rjbAiSlo7dwIsTfBBU=
X-Google-Smtp-Source: ABdhPJwhLZm58BF48DzWth3dk9AzV0nqspsGlOg2xF4GseTe775h725SnrX2OOATigfI2ja3r0QI6A==
X-Received: by 2002:a4a:ab05:: with SMTP id i5mr29072440oon.61.1641231674801; 
 Mon, 03 Jan 2022 09:41:14 -0800 (PST)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id s6sm9368864ois.3.2022.01.03.09.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 09:41:14 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] dt-bindings: display: simple: add Geekworm MZP280 Panel
Date: Mon,  3 Jan 2022 11:41:04 -0600
Message-Id: <20220103174106.907-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220103174106.907-1-macroalpha82@gmail.com>
References: <20220103174106.907-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 emma@anholt.net, airlied@linux.ie, robh+dt@kernel.org,
 thierry.reding@gmail.com, mchehab@kernel.org, sam@ravnborg.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

The Geekworm MZP280 panel is a 480x640 (portrait) panel with a
capacitive touch interface and a 40 pin header meant to interface
directly with the Raspberry Pi. The screen is 2.8 inches diagonally,
and there appear to be at least 4 distinct versions all with the same
panel timings.

Timings were derived from drivers posted on the github located here:
https://github.com/tianyoujian/MZDPI/tree/master/vga

Additional details about this panel family can be found here:
https://wiki.geekworm.com/2.8_inch_Touch_Screen_for_Pi_zero

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index f3c9395d23b6..659db7206c96 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -148,6 +148,8 @@ properties:
       - frida,frd350h54004
         # FriendlyELEC HD702E 800x1280 LCD panel
       - friendlyarm,hd702e
+        # Geekworm MZP280 2.8" 480x640 LCD panel with capacitive touch
+      - geekworm,mzp280
         # GiantPlus GPG48273QS5 4.3" (480x272) WQVGA TFT LCD panel
       - giantplus,gpg48273qs5
         # GiantPlus GPM940B0 3.0" QVGA TFT LCD panel
-- 
2.25.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C684A214677
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jul 2020 16:36:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7078A6E0C1;
	Sat,  4 Jul 2020 14:35:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123C16E0C1
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jul 2020 14:35:55 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id q7so26965870ljm.1
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Jul 2020 07:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RSyrJuSDknNeqRlmj8bIK5Vdtz9ftR4YhPWSIC5vrws=;
 b=RLpBGuINGz2ZbLXoy4Vf+xPYxukzPyyNkyZPUXphO/NcTiHZr6EZiIzVfUz0eJB9S2
 /EwTLsnPTdfEh9SrjKe8mufzhLkxu4gtDthSydKXdh84OV3U2P27lNzGuM+jpyboqZO5
 7zYQUYdzu4FPoiT2YxMWm+5i5YEaKIdGkqAANYE+1ft0joETvBwJsXZbqiKnpVAGJlna
 tNgakSH74CfB21LNALNjr2OIg8J+pUt2gBPAG3WGpRIRej0ylq/HRLwF0BkSF+IdG82B
 rITznNiV11h706fwv4GhllZfTeR5AqW5NRdZ6LobmE9B4csHObfYMf6EMjnnZRCo3ZiN
 Q/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RSyrJuSDknNeqRlmj8bIK5Vdtz9ftR4YhPWSIC5vrws=;
 b=PP5UHIwtm+gDqeXDMj7mwMyKrCnMfEVvolfvu4tVwNAKJ0Q7eKJOJ/hMnth9LnWqhp
 6UZArgqXjtQenbNP8MPLRtJjAX5R7UXz2FMoXuQrZB1So7mc5msTVACWsc33cmkdDjX/
 bycjCHeNC6dNkWGvdClxdK/kjRP9jSvMR5k7/THfsuwAIpAELHOAgrZlLAEoi1fiZddL
 db6igBz3RYLde/LfXCFHq73rUgXHUfbuTda/U20UVCciKh4IY5vDHuxo6RZdfhNNzzeM
 4ViIkIanD9Hj0RiDgoAOdGNDUmcwn+LqACwKN8hxNNNsyuEZqlXOrn9FF/UhXFk/DE7A
 RCVg==
X-Gm-Message-State: AOAM532Th09hf1lDvzC5vQ/OqB972p9FMcLCCIvJHzGIlAM0fMUaKJg6
 Akf5yf0O9nrh2EdSTFG4EoYbxoPslCs=
X-Google-Smtp-Source: ABdhPJzbguWBoqpi25Z8FzFDM9eW6IcGJ+/Tpa4yANpYepPYeCKwCoc+EFIJ4dSuk161JDTB5tcogw==
X-Received: by 2002:a2e:920e:: with SMTP id k14mr23393141ljg.430.1593873353261; 
 Sat, 04 Jul 2020 07:35:53 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id 144sm6407556lfm.87.2020.07.04.07.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 07:35:52 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v1 1/1] dt-bindings: fix simple-framebuffer example
Date: Sat,  4 Jul 2020 16:35:44 +0200
Message-Id: <20200704143544.789345-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200704143544.789345-1-sam@ravnborg.org>
References: <20200704143544.789345-1-sam@ravnborg.org>
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Hans de Goede <hdegoede@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that dt-extract-example gained support for using root nodes
in examples, update the example for the simple-frambuffer binding to use it.

This gives us a better example and kill a long standing warning:

simple-framebuffer.example.dts:23.16-39.11:
Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node

Note: To get the update dt-extract-example execute:
pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: linux-fbdev@vger.kernel.org
---
 .../bindings/display/simple-framebuffer.yaml  | 45 ++++++++++---------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
index 1db608c9eef5..6f23ea14132b 100644
--- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
+++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
@@ -152,28 +152,29 @@ additionalProperties: false
 
 examples:
   - |
-    aliases {
-      display0 = &lcdc0;
+    / {
+        compatible = "foo";
+        model = "foo";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        chosen {
+            #address-cells = <1>;
+            #size-cells = <1>;
+            stdout-path = "display0";
+            framebuffer0: framebuffer@1d385000 {
+                compatible = "allwinner,simple-framebuffer", "simple-framebuffer";
+                allwinner,pipeline = "de_be0-lcd0";
+                reg = <0x1d385000 3840000>;
+                width = <1600>;
+                height = <1200>;
+                stride = <3200>;
+                format = "r5g6b5";
+                clocks = <&ahb_gates 36>, <&ahb_gates 43>, <&ahb_gates 44>;
+                lcd-supply = <&reg_dc1sw>;
+                display = <&lcdc0>;
+            };
+        };
     };
 
-    chosen {
-      #address-cells = <1>;
-      #size-cells = <1>;
-      stdout-path = "display0";
-      framebuffer0: framebuffer@1d385000 {
-        compatible = "allwinner,simple-framebuffer", "simple-framebuffer";
-        allwinner,pipeline = "de_be0-lcd0";
-        reg = <0x1d385000 3840000>;
-        width = <1600>;
-        height = <1200>;
-        stride = <3200>;
-        format = "r5g6b5";
-        clocks = <&ahb_gates 36>, <&ahb_gates 43>, <&ahb_gates 44>;
-        lcd-supply = <&reg_dc1sw>;
-        display = <&lcdc0>;
-      };
-    };
-
-    lcdc0: lcdc { };
-
 ...
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

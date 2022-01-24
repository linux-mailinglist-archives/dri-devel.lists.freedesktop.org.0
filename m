Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9A249856B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 17:55:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027B910E355;
	Mon, 24 Jan 2022 16:55:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 457ED10E247
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 16:55:38 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 m8-20020a9d4c88000000b00592bae7944bso23097919otf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 08:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AX9/X1WhGwP2sW6zC/gqprghPkVPPG9iN/vljmKSmiY=;
 b=FgzaUXmypV3YeAIfgGVpijUhyc60TGq2ToNV/Neau6pnsdwqhRAz90rLlT6+4KHKhs
 +xK+TIrXHlVQZOF/MQ5p0d7T1fbPqw8woSNqTG/zbW6avLTkS/4fe0SM8ciQThSlFKoH
 wdU2F+KMcYHa1WRUpkeCVpAgyAyyVBO60vFL9V5ogbI02LAI5zVTsU/FNGCdHNMeW+mk
 kU+eRwL6afo5WPXTpmfy3RL5fE9VACLPVgJGCPi01bgDeQHyxghTCnP5v8+h2ec87HGF
 73dcVb0Uoaztz/g3K2q7Pq0LWEpjN3F8PHgeK7MD2UJnwq6MRTm5HvEfOSHCQntMJJ8I
 zSNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AX9/X1WhGwP2sW6zC/gqprghPkVPPG9iN/vljmKSmiY=;
 b=TtzBFpzcyCe809d+65xL7nsUSZK/qwNfD8dHS5dByglmdsUMSV96v1q61Cjvh4tKvh
 A+nXLCnit5ikmTxtcq2X11L83HYkIDjuM1lMPQPGEtfgdqjWYofJMc5OqJzIuvDoCvDN
 VmPdmZ7XVXG2dNkV8n0HIQA51tyab69rA3Hit6XjAC6vo+y+6wVh9OtcfmcZ6Uwj/YIz
 t+rvLbkmlKZOOsVTWutlr1h1MxYjiVnxgGYE1N3alql9kDkgqnuP9xbJJt8Alp6vBKdY
 iosWjGzfIUkA/c80n5HnBCqxBhcBvYVszS+pAodkwg/D+ENSb/fsfLIXECVXaGeJlXYE
 5/cg==
X-Gm-Message-State: AOAM530VH5nC0kdSi2lq9WIOTUPDyWOtctXasjotBfs1X8C4o/E48ML0
 gQev1My4Zy2UsIR1GjUn7imZnxYeFyk=
X-Google-Smtp-Source: ABdhPJzTycVD+fT17ONLf05HsIjgUbYM0QDZTOZuMTDXij/vPYP0gqVUGR0KxqWR9rpe33WLQmcR5w==
X-Received: by 2002:a9d:f24:: with SMTP id 33mr12204646ott.282.1643043337224; 
 Mon, 24 Jan 2022 08:55:37 -0800 (PST)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id v22sm4418370oot.10.2022.01.24.08.55.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 08:55:36 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/6 v2] dt-bindings: display: simple: add Geekworm MZP280 Panel
Date: Mon, 24 Jan 2022 10:55:24 -0600
Message-Id: <20220124165526.1104-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124165526.1104-1-macroalpha82@gmail.com>
References: <20220124165526.1104-1-macroalpha82@gmail.com>
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
index 62f5f050c..3d03d8276 100644
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


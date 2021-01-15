Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F18912F88A4
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 23:45:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8823B8935B;
	Fri, 15 Jan 2021 22:44:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC0876E4AD
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 22:44:52 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id n7so6954365pgg.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 14:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FEhRjbUNCR1Hk02j8Xf/vg8e/9gEkRjaydiv70kLOXo=;
 b=WtVSiq1xRJf/azOoRgkZu0P+6BgKHV3frEFxWd4je9YJyusVNv13pnUz3hhXDuRGJn
 /SRt98VRKQnSIBPJO4m7J26UDOsfyCfmsfaLC8NaC4j1M7BpDB3SnUdg8s2+Kz970sAn
 qSdjRtw4AvTloiTj1OmxODP7o3c3wmo9xiug8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FEhRjbUNCR1Hk02j8Xf/vg8e/9gEkRjaydiv70kLOXo=;
 b=mAqlrP3MLGgCD1+IEmA1ok5CIob6754NWdA7Z680PIeGqPnxoJZOMSbS+OdCZwuaQ0
 OT04wWfmlPCmkLSaonR9ZwoeDt94mEnETF49cSMINU1MYz6hd3x2kcCU2yLliBp/+Ey/
 UadQSLvXrIAWekRjmig8CNa67wT3T5pKTH4ffPhU6POTrXnrxBRb4ThlifqjldSsp88+
 eg7qOeiyBvQzP5JaKVMjDvNCnQoel1RyckMxL2XsZ4xb8cvaI13ybiQVGH7fPUFIX5FC
 6vcNTT6TOwnur3DHXUWasH5RqJ/oXqMxD+WmTVtS54U54Aa0dQ/AwXDayAkBouR4UWyM
 fu0A==
X-Gm-Message-State: AOAM530TzEX/hdD0NJ8OqdX3z7uDhlxrYANCGEGaOv718LPzDtDeRwdv
 YkCJMzDVyCLz2Ux0hsIRUINxvg==
X-Google-Smtp-Source: ABdhPJyKVdXbmgrldR0ZGLdeKMcYo4sYZP34Sje2L0pdmwZnmj3LCoFn7nX19ZSe2u2WkkD81f2X9A==
X-Received: by 2002:a63:9811:: with SMTP id q17mr15175105pgd.238.1610750692473; 
 Fri, 15 Jan 2021 14:44:52 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id q16sm9131100pfg.139.2021.01.15.14.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 14:44:52 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 4/5] dt-bindings: dt-bindings: display: simple: Add
 N116BCA-EA1
Date: Fri, 15 Jan 2021 14:44:19 -0800
Message-Id: <20210115144345.v2.4.I6889e21811df6adaff5c5b8a8c80fda0669ab3a5@changeid>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
In-Reply-To: <20210115224420.1635017-1-dianders@chromium.org>
References: <20210115224420.1635017-1-dianders@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Another simple eDP panel.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- ("dt-bindings: dt-bindings: display: simple: Add N116BCA-EA1") new for v2.

 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 35b42ee4ed1d..a2db2a8def15 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -160,6 +160,8 @@ properties:
         # Innolux Corporation 12.1" G121X1-L03 XGA (1024x768) TFT LCD panel
       - innolux,g121x1-l03
         # Innolux Corporation 11.6" WXGA (1366x768) TFT LCD panel
+      - innolux,n116bca-ea1
+        # Innolux Corporation 11.6" WXGA (1366x768) TFT LCD panel
       - innolux,n116bge
         # InnoLux 13.3" FHD (1920x1080) eDP TFT LCD panel
       - innolux,n125hce-gn1
-- 
2.30.0.284.gd98b1dd5eaa7-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

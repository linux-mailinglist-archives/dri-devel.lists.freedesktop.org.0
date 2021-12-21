Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD7B47C002
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 13:51:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C0410EAC9;
	Tue, 21 Dec 2021 12:51:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFF510E688
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 12:51:43 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id fq10so3777926qvb.10
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 04:51:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AHBncKJ/xlQQ+CHewf+fDIZyImR+1QUXOkH9dtjvEd4=;
 b=UWl5msuYKUXV3CC2ySxU6x3Tcq+jQF9Ph/GffoH1ILZiSoqiOlGzhXBQGW5bysA1Iy
 hpuq1tKEFsGQ4T0dOpIAW02KsdewMg7nuqeBOqHDDh5sy7ydSAzf2q5849jBEMtXTH2z
 mLLLR/APWDY4LhEsxH1WoOpHVnJ7SkZr1vqckbfmFMJT5zJOHUhlXE3qM14KsPXYb2Pq
 eoHm6goTDoN1/a4vw+ewu2Rp4evtph+fmd09nzipwqzRZ8iqtCOpxFovwqdyrNSK5b9T
 xUZaCfj4m7una3he94LNrYPiMWYAcD0R/Frf+qqiejWW9j2g1y/ShOPy6Pti4qyj+TYA
 bEhg==
X-Gm-Message-State: AOAM5336/0Tx4OLs5eVFTlysLUrbqH/c5UhxUxMiVUNZg6eAEN3rbtmv
 ykebt3/8BYYAUsPQPjKduA==
X-Google-Smtp-Source: ABdhPJxS30a8Jzj7aAxnhi6th+9ajF2x7f0OHNZp4PLzHPjnEWQ9toXqnmaAHPCuaWfaTp+Y576otg==
X-Received: by 2002:a05:6214:27ee:: with SMTP id
 jt14mr2328206qvb.2.1640091102922; 
 Tue, 21 Dec 2021 04:51:42 -0800 (PST)
Received: from xps15.. ([24.55.105.145]) by smtp.googlemail.com with ESMTPSA id
 x190sm13023530qkb.115.2021.12.21.04.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 04:51:42 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] dt-bindings: display: novatek,
 nt36672a: Fix unevaluated properties warning
Date: Tue, 21 Dec 2021 08:51:26 -0400
Message-Id: <20211221125125.1194554-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With 'unevaluatedProperties' support enabled, the novatek,nt36672a
binding has a new warning:

Documentation/devicetree/bindings/display/panel/novatek,nt36672a.example.dt.yaml: panel@0: Unevaluated properties are not allowed ('vddi0-supply', '#address-cells', '#size-cells' were unexpected)

Based on dts files, 'vddi0-supply' does appear to be the correct name.
Drop '#address-cells' and '#size-cells' which aren't needed.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/display/panel/novatek,nt36672a.yaml   | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
index ef4c0a24512d..563766d283f6 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
@@ -34,7 +34,7 @@ properties:
     description: phandle of gpio for reset line - This should be 8mA, gpio
       can be configured using mux, pinctrl, pinctrl-names (active high)
 
-  vddio-supply:
+  vddi0-supply:
     description: phandle of the regulator that provides the supply voltage
       Power IC supply
 
@@ -75,8 +75,6 @@ examples:
 
             reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
 
-            #address-cells = <1>;
-            #size-cells = <0>;
             port {
                 tianma_nt36672a_in_0: endpoint {
                     remote-endpoint = <&dsi0_out>;
-- 
2.32.0


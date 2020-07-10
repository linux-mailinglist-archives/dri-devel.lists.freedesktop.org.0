Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1E521BE76
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 22:31:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 377C36EBB2;
	Fri, 10 Jul 2020 20:31:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D1B6EBB2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 20:31:54 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id b185so6591217qkg.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 13:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Ws4QXKiJxpLBjxT3ZdUkj3gHF/c7NBJAkVNuujQ6ISM=;
 b=VpPsz/l3Q/jW9/X/+IEPE09NF2F44rLpqxyQfU8F23od0x+pfqeLavHtknXXvgHBpA
 FDTBj8NmfsGqgTJcRWBsQHWEaUjmj9WipTlTf0pqLc4T+YyPElW0U5nLHj+9gq0MKOV/
 Spi3JShNUvheuj5/8YeavmmgcObGG7DUQcJl8srkbho1paXaW2sZ5DPYXN5qLmgs0GGj
 4JQsnezJntwqzw46oP/tPIA2GChZvmDEAQVM/sOaqv/Hkvllz91ArmbTK8sOGj8IE6jo
 AawzcvPoiBVIEjsD3j1l8hvT4z6lt2+UXS9irNX2Ri3ZrIk7Lm6l1SdIjX8FtbhYFnE7
 2vDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Ws4QXKiJxpLBjxT3ZdUkj3gHF/c7NBJAkVNuujQ6ISM=;
 b=FTpx9h1OII7XBQdreN2GLIlKTFafs7Yr90XJMXPiKtAi190EKOjNPTRhLcZucMfLSs
 J6xwhOwYVoUtopfyPkrhvzv2JpUwagSdbwL6U3AIQDUElt8wWr56hOA1uZEK2icDUcq9
 81E6QZCmc1+HDiCXIRZ4tm0qlDWIHQmxaKGp25NiZaN0xF4uNplQWnyHbEA4vVuy3Doz
 VHQwEHVUF5ZuMCo58ubUdBcrWsrmVoQZUzBr95WYCIxPeqOYoBBbIhQlKrgPGrLE0khC
 dN5CllTuTO8nPIYMisG7KCx5QaXa/QKFKj1aPaSPnKz8XbNyGlFqD77g/PvXVlj7U1/P
 TTrw==
X-Gm-Message-State: AOAM532iRM+K/rGJIFGHv1oHkiiydApe6xkd3skOvCGrbyDQDZXHn/N/
 Lp96I2T/auH6Mf2mEVIr0ck=
X-Google-Smtp-Source: ABdhPJyJ/VnbG31NRS7njtdyv2IixhI4CSBxLqjrhQ/KwM3/XeZ+y3/QZpAIXPHoyXyTa4x2YTSUaw==
X-Received: by 2002:a37:a507:: with SMTP id o7mr66248445qke.406.1594413113405; 
 Fri, 10 Jul 2020 13:31:53 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:92b:9d6d:2996:7c26:fb1d])
 by smtp.gmail.com with ESMTPSA id
 130sm8651818qkn.82.2020.07.10.13.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 13:31:52 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: mripard@kernel.org
Subject: [PATCH] dt-bindings: display: sun8i-mixer: Remove duplicated 'iommus'
Date: Fri, 10 Jul 2020 17:31:24 -0300
Message-Id: <20200710203124.20044-1-festevam@gmail.com>
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
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 13871279ff5c ("arm64: dts: allwinner: h6: Fix Cedrus IOMMU usage")
introduced a double instance of 'iommus' causing the following build
error with 'make dt_binding_check':

found duplicate key "iommus" with value "{}" (original value: "{}")
  in "<unicode string>", line 45, column 3

Remove the double occurrence to fix this problem.

Fixes: 13871279ff5c ("arm64: dts: allwinner: h6: Fix Cedrus IOMMU usage")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml       | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
index c2fbf0b06d32..c040eef56518 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
@@ -42,9 +42,6 @@ properties:
   resets:
     maxItems: 1
 
-  iommus:
-    maxItems: 1
-
   ports:
     type: object
     description: |
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

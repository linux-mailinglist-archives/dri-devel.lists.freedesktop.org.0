Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BF73F172D
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 12:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B6D86E8A3;
	Thu, 19 Aug 2021 10:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 472 seconds by postgrey-1.36 at gabe;
 Thu, 19 Aug 2021 10:20:03 UTC
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD4C46E8A3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 10:20:03 +0000 (UTC)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 7AF9B40CCC
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 10:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629367926;
 bh=1q/zDNJ6stj36dAWcIJjYp9AynEo5sG0UMyf+ThhM+A=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=wVPEuqgFXcn4EDow6JF/qJHX4brvkeSCUtWVHJw+9W4oVlxVOfX3kgEMo/10WDiEe
 rhCM2ts0IrHo72VbXX5GyTVHlBv7BiCS4NRUT/RPdQ9juAbrx+vlnJ1X+QuFA8x9b2
 1lP6mbE34GsZajUe5hjVEGHU58o4/czkkkraCIxy3X0ZdsWOy5HaWZdsqxQhhtpH1Q
 CiqC617uWgTNVT2m/m6wlBDmbBRzZfakmeR/g9MbkDxpTwMHT7XSOmm2/noFnkHP1+
 91djeTdID9cx/9Pj4/E/gZ+iuH9ZmRgbwVGERJKrCyv8mR2QE2Xs3z11QgGfh2nuBj
 dQb+OZF39vsYA==
Received: by mail-ej1-f69.google.com with SMTP id
 lf30-20020a170907175e00b005bc47d01a39so2033543ejc.16
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 03:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1q/zDNJ6stj36dAWcIJjYp9AynEo5sG0UMyf+ThhM+A=;
 b=FaJ2rqL7zM8N6wgAo4kNkfWcaNZKUMVUoaF7weS06VPcEkl99kV4xX87EoJjoG5fT0
 cBLBaDvV/UBm7JoQOmZV8kBa8SeV08mDRjQxizGaNvabLF+E7CTFGS8YXxmSDtqkunWx
 UrvTotsrEStX4yvbzAcvdjhLrh90UQSSAOji3yHhnNdjG9gN9JVAgum5a6zM06IoLOAw
 0C2TUr5Wenb3UUrruoVxotHbaJIj9HwIQMVSewcJVD4IJsPAH73lv2YvhIt5aJAKHJZs
 zwPehYnKN2e/0sk8U7nvt+7JwyHdjk1ujbbOMT8nH+uFj7nqal152oBpwvaWol8/LdCh
 a8Zg==
X-Gm-Message-State: AOAM533wqJuKLVpUVJlRsDLjxn+bKOmOUKdzkQYMAAXyMOsgLHq1aHwH
 Nbrw2gUiU/mgRDumbXwK6VtXuYsAsS8kRkOWztPoNtdqKw2KNwH/0oGFEEW1iPH/CFHkkpzutFk
 MXQKf87Bbgsj3E8RpC3qMxN+eA8Tu4o0HwIV8tjFx8tA6Og==
X-Received: by 2002:aa7:d896:: with SMTP id u22mr15367861edq.290.1629367926294; 
 Thu, 19 Aug 2021 03:12:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxI9zNnopbbqxOQWW/ned2EnZ+8UkkZ3IeaEL4Nm49q++mydI6Q/iekQrW4vzQouXJ2dmMtNg==
X-Received: by 2002:aa7:d896:: with SMTP id u22mr15367839edq.290.1629367926151; 
 Thu, 19 Aug 2021 03:12:06 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id bs13sm1031774ejb.98.2021.08.19.03.12.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 03:12:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Dillon Min <dillon.minfei@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 2/2] dt-bindings: sound: rt1015p: correct indentation
Date: Thu, 19 Aug 2021 12:10:20 +0200
Message-Id: <20210819101020.26368-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210819101020.26368-1-krzysztof.kozlowski@canonical.com>
References: <20210819101020.26368-1-krzysztof.kozlowski@canonical.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use common enum instead of oneOf and correct indentation warning:
  realtek,rt1015p.yaml:18:7: [warning] wrong indentation: expected 4 but found 6 (indentation)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../devicetree/bindings/sound/realtek,rt1015p.yaml          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt1015p.yaml b/Documentation/devicetree/bindings/sound/realtek,rt1015p.yaml
index f31d3c4d0192..fdb7f295ef2d 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt1015p.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt1015p.yaml
@@ -15,9 +15,9 @@ description: |
 
 properties:
   compatible:
-      oneOf:
-        - const: realtek,rt1015p
-        - const: realtek,rt1019p
+    enum:
+      - realtek,rt1015p
+      - realtek,rt1019p
 
   sdb-gpios:
     description:
-- 
2.30.2


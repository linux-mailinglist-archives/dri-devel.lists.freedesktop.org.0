Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A272AC9F8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 02:01:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 232CB897BC;
	Tue, 10 Nov 2020 01:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC072897C8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 01:01:26 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id w11so5607764pll.8
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 17:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=14VTgiY3J1DkS809KMo7JX51yfO5bkg2PgfquBGtPA8=;
 b=krww8wV3YuApCkppnf2RTIzO1OYotX+3z+QRuDhGbfuwrWYJL02uHUrSj3P0eDYs/R
 OT1B7tJPbE2l30lZ7b3cBjy1ENUkeG6I4GO2OCobLSJjCfXJw3gdlL4RM9aKDG0jisLP
 b1Y5qdfVUEoMxFEiQ++LIHpPs+3CFehRHSGTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=14VTgiY3J1DkS809KMo7JX51yfO5bkg2PgfquBGtPA8=;
 b=P1u0NYlzKBespvPowPaefGNI9YeEZdjnkxmkVvjbAXOG/yLkOj1U51FVCEbN2zEA1B
 yYiYxTaNC2V295E6+ePc+7IQfmnHKL9a6faxuR8CQzJjkkhJX3drWetX8ImC0IhYMu5n
 r3jcwMyfksE39OF8GMsyxAxmGAwA1FIOo4pc1WMaDKcISowi9ilizmiiWOxTeCG+xeGi
 SNS9Xwnx0URK4YLN8dJ5xMCIWUjS2Ea6cqBCvFtxlWjxDxKSjKFaB2WJgwSb7XImYht2
 NL4GR7iXf0By//ayRKS0Y55Ef/gZ+VfSraPKpMkpBnZlijdU4Ivwt4v68hf720vptcYL
 cS8A==
X-Gm-Message-State: AOAM5308F0NyQhi998/HlvVwmNL2vmAfvQg/kJ0uSar6wzbazeV6l9lJ
 atTNKFJkJz6diSCz7gflwcv/Gg==
X-Google-Smtp-Source: ABdhPJzhSHxgjOLoORdgG+4r0b+0cOWu2vss87Kh/HovkatcLKmN39fxjXD9ovm7q74kcYZMbZt03g==
X-Received: by 2002:a17:902:c38b:b029:d7:cb4b:9555 with SMTP id
 g11-20020a170902c38bb02900d7cb4b9555mr11903488plg.66.1604970086470; 
 Mon, 09 Nov 2020 17:01:26 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id u197sm7283233pfc.127.2020.11.09.17.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 17:01:25 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v4 5/5] dt-bindings: dt-bindings: display: simple: Add BOE
 NV110WTM-N61
Date: Mon,  9 Nov 2020 17:00:59 -0800
Message-Id: <20201109170018.v4.5.I28d9e32b3cc0aae980ecc39d364263a3f9871298@changeid>
X-Mailer: git-send-email 2.29.2.222.g5d2a92d10f8-goog
In-Reply-To: <20201109170018.v4.1.Icaa86f0a4ca45a9a7184da4bc63386b29792d613@changeid>
References: <20201109170018.v4.1.Icaa86f0a4ca45a9a7184da4bc63386b29792d613@changeid>
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add yet another eDP panel.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Rob Herring <robh@kernel.org>
---

(no changes since v1)

 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index f9750b0b6708..994c19c357de 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -76,6 +76,8 @@ properties:
         # BOE OPTOELECTRONICS TECHNOLOGY 10.1" WXGA TFT LCD panel
       - boe,nv101wxmn51
         # BOE NV133FHM-N61 13.3" FHD (1920x1080) TFT LCD Panel
+      - boe,nv110wtm-n61
+        # BOE NV110WTM-N61 11.0" 2160x1440 TFT LCD Panel
       - boe,nv133fhm-n61
         # BOE NV133FHM-N62 13.3" FHD (1920x1080) TFT LCD Panel
       - boe,nv133fhm-n62
-- 
2.29.2.222.g5d2a92d10f8-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

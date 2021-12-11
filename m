Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E22F64716CA
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 22:38:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7209810E7ED;
	Sat, 11 Dec 2021 21:38:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FF910E7ED
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Dec 2021 21:38:07 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id m6so12369493lfu.1
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Dec 2021 13:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9cbSD0n7UkiGS9/Kt4+Mg/mlrW7rIQ8OPKpNN0HsBs0=;
 b=mUIzrz+TnolWe2p3gaMz28V5YhGUucp69yNWFSAVRz/SeSyGbV/EZRawLZTmoy/Lha
 5Mv0+nINyKcTogdjnEJZvO+8/nR5k4E3Fe5w5vXounCCgsYWZlH4LjLmHPQUmu/dNg59
 /zZFy6Pij/F8jEks7duf4VAim3VZ8zYg5+/lh9lLsTSqYK82YatFP0NcgLBtzBHKzxUd
 qvYciCyC8RESc92gNAO7XfGZnlS1QtyZISwSEW7slibt4qaZ7xG/Px3/rU+H38v9QCMF
 D4FygNxIsSRdLjKa6g4yIcZjVIvOCAmKFNkj88Ro35spUBBsy9vPSotTQpTzOKDd4Iqd
 2T4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9cbSD0n7UkiGS9/Kt4+Mg/mlrW7rIQ8OPKpNN0HsBs0=;
 b=mgLi0zayWx+LXRrC89AmT+ULcYY2nQiiaDLLehoeUDJF509qeWiipBy2rNi0P6QyJJ
 x8rKzja57yrhnokhlTE0v9TDtdRSroSerzj1PDUITVQM4QI3ZnMfz5LlPFXpKyLB8+ei
 sY82wbECqGbfFM8K4X5XRxEUJd6/YhMzEokoPMCwFIFqmvgFVC5YLSd+B2mjPFk4g9q8
 s+bEteDuZZNWCpLOJ7l5iMoWv95w09nRMcee6BDLGCxD+aDVIyiM+S0yMbhoEgJuoR38
 QQ6Yw/1GSVhRhe3Aubl84zAb7iLk65ULKPR1WnzGpu5yDZp22YXAPiiQMYJPJVc7xB7X
 QImA==
X-Gm-Message-State: AOAM530iXkB2wCxnPwRJQ/tvgA+p0kMjHw3/d/xhiPpfSytU4TbEcNxp
 hcUEFrp9Jl1USoG5Dg59dhI=
X-Google-Smtp-Source: ABdhPJykkoZWZcLnXR5dIqNSNBzj40yRLsyWVWz5Fj+XnDeWPuf7zB7DeJQXztOK9DtJIQ+NyJN5Lg==
X-Received: by 2002:a05:6512:3213:: with SMTP id
 d19mr20107074lfe.519.1639258686323; 
 Sat, 11 Dec 2021 13:38:06 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id w14sm786844ljj.7.2021.12.11.13.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 13:38:06 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Anton Bambura <jenneron@protonmail.com>
Subject: [PATCH v2 2/3] dt-bindings: display: simple: Add HannStar HSD101PWW2
Date: Sun, 12 Dec 2021 00:36:52 +0300
Message-Id: <20211211213653.17700-3-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211211213653.17700-1-digetx@gmail.com>
References: <20211211213653.17700-1-digetx@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Svyatoslav Ryhel <clamor95@gmail.com>

Add HannStar HSD101PWW2 10.1" WXGA (1280x800) TFT-LCD LVDS panel
to the list of compatibles.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index f3c9395d23b6..ecb9a79c2e78 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -156,6 +156,8 @@ properties:
       - hannstar,hsd070pww1
         # HannStar Display Corp. HSD100PXN1 10.1" XGA LVDS panel
       - hannstar,hsd100pxn1
+        # HannStar Display Corp. HSD101PWW2 10.1" WXGA (1280x800) LVDS panel
+      - hannstar,hsd101pww2
         # Hitachi Ltd. Corporation 9" WVGA (800x480) TFT LCD panel
       - hit,tx23d38vm0caa
         # InfoVision Optoelectronics M133NWF4 R0 13.3" FHD (1920x1080) TFT LCD panel
-- 
2.33.1


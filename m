Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DCE3D4722
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 12:34:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100E86E0C9;
	Sat, 24 Jul 2021 10:34:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F416E0C9
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jul 2021 10:34:45 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id x7so4773971ljn.10
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jul 2021 03:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SgL0jl+mGyF6SSLvs6k02lrCaESH25yjasdaW3GUG0o=;
 b=TPOxBFRhgJow6paU5WCNeHGFLVPM3llWW97Bd2nLomggWuu0guMT980zA53bQlY+a3
 wzW+c6VRvera866BvaF+jBJFuYO5XNfsMls7lYhlkC6OOl5HIBO5xYYDt6Vdm1qcaZLj
 6pfQXpHEXbtp9vBq2jd0C5RhwtYhMjb9DDUPAAKG3WvIw7+sO+gvMW2gqecxXhb2HaAd
 PDLHATtFasdl9uwlsxuW4IJjVCiH6NnXxKIp8QNEnznhtlETiq9lQDr272BAlqdk+qlv
 5bMYmuAaTTIkXm+apyd5PabRvI70kONRgHI+jjCoPQhxnsKCyGa0wBmdVA2KfBmXAOlN
 f2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SgL0jl+mGyF6SSLvs6k02lrCaESH25yjasdaW3GUG0o=;
 b=j5r0lH41XoGM5lLdhZkTouV+e4XLlbRBZ0bcl7WFtQELcfY09d35Gk4MRo17/3LSJU
 Ljg8fleRHrNBpeKmEn43u70SzJVmRbpTdAwQrXxpCzx3SlnQPPqSAEntauuctYuvH605
 YMEjv+kzUcvs6XRA2aYVJ3nnXtOxAAPqG6tBJ8cctPTa/3ReRQSCRyhF2lOFQmiC9g7C
 IQmg19SR/YS0ZTm0CQ0jZ49nHzNKgkBWeourlxPrBZqo6BaP3td1awlNd+j3gYKTJAzU
 frS9aKcLSIBrQlOS6XUg58BCKm2R5aLsmjmJ4RPzKfPeKcPUTXQbkR1CsN9yNalGi4Xt
 Y7OA==
X-Gm-Message-State: AOAM5301z4TbGITfHLdaAQo1oQUVZup8YWwOrTR313XTlVfy1owvBwb4
 uhAwaBw8I+L6PaF+LS8ahMQ=
X-Google-Smtp-Source: ABdhPJz7+0e5Kv9oCUA8rGIV9kfDSHbMAxwSQzE0wjXc7RG/0cmtCGDqQnH5vzEP4uulfIgWDXkPUA==
X-Received: by 2002:a2e:7817:: with SMTP id t23mr5921664ljc.486.1627122884360; 
 Sat, 24 Jul 2021 03:34:44 -0700 (PDT)
Received: from akaWolf-PC.. ([194.79.5.201])
 by smtp.gmail.com with ESMTPSA id v22sm2158938lfi.270.2021.07.24.03.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 03:34:44 -0700 (PDT)
From: Artjom Vejsel <akawolf0@gmail.com>
To: 
Subject: [PATCH v2 2/3] dt-bindings: Add DT bindings for QiShenglong Gopher 2b
 panel
Date: Sat, 24 Jul 2021 13:33:57 +0300
Message-Id: <20210724103358.1632020-3-akawolf0@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210724103358.1632020-1-akawolf0@gmail.com>
References: <20210724103358.1632020-1-akawolf0@gmail.com>
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
 dri-devel@lists.freedesktop.org, paul@crapouillou.net, robh+dt@kernel.org,
 thierry.reding@gmail.com, akawolf0@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DT bindings for QiShenglong Gopher 2b 4.3" 480(RGB)x272 TFT LCD panel.

Signed-off-by: Artjom Vejsel <akawolf0@gmail.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 3624363938dd..e7f3db118c5d 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -244,6 +244,8 @@ properties:
       - powertip,ph800480t013-idf02
         # QiaoDian XianShi Corporation 4"3 TFT LCD panel
       - qiaodian,qd43003c0-40
+        # Shenzhen QiShenglong Industrialist Co., Ltd. Gopher 2b 4.3" 480(RGB)x272 TFT LCD panel
+      - qishenglong,gopher2b-lcd-panel
         # Rocktech Displays Ltd. RK101II01D-CT 10.1" TFT 1280x800
       - rocktech,rk101ii01d-ct
         # Rocktech Display Ltd. RK070ER9427 800(RGB)x480 TFT LCD panel
-- 
2.32.0


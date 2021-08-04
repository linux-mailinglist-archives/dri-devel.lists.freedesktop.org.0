Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0A03DF8E7
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 02:24:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524E66E991;
	Wed,  4 Aug 2021 00:24:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC966E991
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 00:24:08 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id h9so591341ljq.8
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Aug 2021 17:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7jrawWkwTlvICE/UJLSV29yZ8/AAL2WUUO01O/vVAfI=;
 b=BYLalVv24KoBEHrVTTDNuXuQ7GVo/MG1qnmPDpIDQ2w6JcvtnmLzXMJuixQ8bKR6Cs
 hMWtGXun57N8xLnrUUJf7Vo5Mf4e5r1aHfj423qjFKyhLWRZbTuwU90x98Dvc42lMT/6
 5Jp8esejLjjArFMT2uhClsa0QK43eo0pmmG+6hfiUQw4RGoMmYgJP3qRz37BSRdD6m9J
 P9u6uGURkUqgcNEtI7BKUBlcYuHquiIL1oz9yN9cyeqpkrfMlCs3RDiRb8/jGPCkn5mH
 XA2Hv7uhvNzTTdkeoichP/X3shTQVtZLhvMfsJhjOvaxvDlb4Fh/V1hxHOez3GGw6qCL
 FYLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7jrawWkwTlvICE/UJLSV29yZ8/AAL2WUUO01O/vVAfI=;
 b=Mud6o+VgKYPwbcEmH7QFUbYTswPQznrQSKH/ZiLrkt+RX6I2QHSExcuRw8pTDOVq1o
 8U0nfGM3bUcLSB2eeXfQAjTgy3D6hhc15jJ2dw4ZJO3mdTifO+f3jpfbjYinpE5zdlHg
 gYAdOV4VFj0/Uvz12WYQQb9yCKHJ13kopUAec+MDaLUSAP4d5vzeTiGn/cljiq5NPlp2
 TmSvzDxX9WrgGMzI0CzeCL6wmKF9KYX9D/NsXoBjZlUNGk97xi2ZXk/Rphl3+a+cSUau
 jQw3DUwBayCmjuR+2xCz5KBFcyLSx2aeZLD//e4rso4Pb/cNww8YiWhGUK3paHn29iU4
 g1gA==
X-Gm-Message-State: AOAM533GdBRalwAxm7IWkQoz7sHnInusuZ/sILvieJesArBnvqdbAySb
 BXsLxsdL/0dbgivn0wfe+lM=
X-Google-Smtp-Source: ABdhPJyotbUOK2wp6dRGves0T/153s/WsreiKOScQsCgZOuKSDzsYsjGMaZlm7v1W9DegiBZkR08Qw==
X-Received: by 2002:a2e:a591:: with SMTP id m17mr16452226ljp.237.1628036646369; 
 Tue, 03 Aug 2021 17:24:06 -0700 (PDT)
Received: from akaWolf-PC.. (broadband-5-228-138-51.ip.moscow.rt.ru.
 [5.228.138.51])
 by smtp.gmail.com with ESMTPSA id t17sm40992ljk.102.2021.08.03.17.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 17:24:06 -0700 (PDT)
From: Artjom Vejsel <akawolf0@gmail.com>
To: 
Cc: thierry.reding@gmail.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 paul@crapouillou.net, akawolf0@gmail.com
Subject: [PATCH v4 2/3] dt-bindings: Add DT bindings for QiShenglong Gopher 2b
 panel
Date: Wed,  4 Aug 2021 03:23:52 +0300
Message-Id: <20210804002353.76385-3-akawolf0@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210804002353.76385-1-akawolf0@gmail.com>
References: <20210804002353.76385-1-akawolf0@gmail.com>
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

Add DT bindings for QiShenglong Gopher 2b 4.3" 480(RGB)x272 TFT LCD panel.

Signed-off-by: Artjom Vejsel <akawolf0@gmail.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 3624363938dd..d7e9e516751d 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -244,6 +244,8 @@ properties:
       - powertip,ph800480t013-idf02
         # QiaoDian XianShi Corporation 4"3 TFT LCD panel
       - qiaodian,qd43003c0-40
+        # Shenzhen QiShenglong Industrialist Co., Ltd. Gopher 2b 4.3" 480(RGB)x272 TFT LCD panel
+      - qishenglong,gopher2b-lcd
         # Rocktech Displays Ltd. RK101II01D-CT 10.1" TFT 1280x800
       - rocktech,rk101ii01d-ct
         # Rocktech Display Ltd. RK070ER9427 800(RGB)x480 TFT LCD panel
-- 
2.32.0


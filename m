Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 102E525F90C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 13:10:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A706E422;
	Mon,  7 Sep 2020 11:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339D86E422
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 11:10:33 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a65so13966707wme.5
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 04:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AaJv1mu5ukB/CIcMyJjiUkroua19/SVkAvuVAHfagew=;
 b=GxsVYEWAqcHsbTP7ldWw3XMCSUXXkLDNAViB7TZMo3ZdMOGcqOqxNnbyfEhbNIoRUM
 46jE43/CA1WYcTx4AqrwiYOz/01itWTgB+EffYBiHX4xig9Tao2uLgSoQlTWbshlEH2j
 0FPQtFZmsYMXrHjWZYDF7JSkI/IY3sQoSn06lAxsA6tikxN+NkDDlOpLMHVtlLgOYAYV
 xgbWw8OmqH0UulxQdF141iVs1KUGrOXXXpCC5sd7enVwNSdfwFHhGpWtBP9A9yn3fHsC
 BfpBBqMkntjTpjaS26AU1P7IzvA6Yq1idSLklbk8e6YWdhVWF0Gjyo9IT4YixZjMlBYI
 jWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AaJv1mu5ukB/CIcMyJjiUkroua19/SVkAvuVAHfagew=;
 b=fuQksW9zSuIUxhMVH1G2Uj8wlv+dQvfVBr9SplTbVfaItOEGA2OIfxdbzePgcc9MzV
 /cN3AJ1VPsuY2Wv0yF+WdYficp5ueq/Zm/vgkpsUtLytpLtRyNqYErUCOeYRDC2nkjrk
 qVShqP90wdDbiNoV2q8TvErwGgRAFb7xO+kqn9yhAdMCPiybZ3Yn9N+Kzn6XxL0LFJMq
 2WcyC5oO4HrU6+Q4lBYBl9v1md2kDlHTY+xC7+2Q5Tn2AoBUYqSq/RZAAGor62VUKod4
 T2ex2pUs4f+ZuIok+ousn1yRdx0+xK/np4BQL7Uo3gcz2vfy1/udGm2+qPwTR7QUy78W
 47ew==
X-Gm-Message-State: AOAM533hLLKAh2oH9lUOnXDqeKNlQ8hNFqh7F/jAsF+IJgyYBP0Gmtdw
 DOaUL+A3SGqMtooazl7PXSNiRw==
X-Google-Smtp-Source: ABdhPJxBVx0IfuJV1VVAaaxBYLauf53V/lzKaqIwtKzsD1pKBa6yHb2u7PSmJhqIF4DQRqGalb1VWA==
X-Received: by 2002:a7b:cb4e:: with SMTP id v14mr21097200wmj.140.1599477031712; 
 Mon, 07 Sep 2020 04:10:31 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id u13sm19922111wrm.77.2020.09.07.04.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 04:10:31 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: thierry.reding@gmail.com,
	sam@ravnborg.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add Shanghai Top Display
 Optolelectronics vendor prefix
Date: Mon,  7 Sep 2020 13:10:25 +0200
Message-Id: <20200907111027.21933-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200907111027.21933-1-narmstrong@baylibre.com>
References: <20200907111027.21933-1-narmstrong@baylibre.com>
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Shanghai Top Display Optolelectronics Co., Ltd  is a display manufacturer
from Shanghai.
Web site of the company: http://www.shtdo.com/

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index a1e4356cf522..4e9dfb352c68 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1078,6 +1078,8 @@ patternProperties:
     description: TPK U.S.A. LLC
   "^tplink,.*":
     description: TP-LINK Technologies Co., Ltd.
+  "^tdo,.*":
+    description: Shangai Top Display Optoelectronics Co., Ltd
   "^tpo,.*":
     description: TPO
   "^tq,.*":
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

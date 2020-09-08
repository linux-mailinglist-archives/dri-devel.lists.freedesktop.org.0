Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CFB260C8F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 09:54:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB4E6E192;
	Tue,  8 Sep 2020 07:54:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB0D36E17F
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 07:54:29 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id l9so16152336wme.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 00:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AaJv1mu5ukB/CIcMyJjiUkroua19/SVkAvuVAHfagew=;
 b=yj9Ik1ndq3jW04GwKrFOI8D/lPSZVkGcU3uzyMVspnynRbQKdFBJN4BFNiIapGRwnR
 vZYjfZ0jXsdmJWS2xNWLvFAWOvA/GkMFUOAaaTEjv4YuNA7igfTuaSL5w/Sx2MUcPs1w
 9pykHkjdFNrAQGds+Fr60lNduf7ESa5KsiloGG7zLHXEXWpDE2FP7wi44xCKbV+GuJhI
 Haax/tWmOAxnKiL294A24g/1CrLCj+/h9S9lPochIfNWS6onPfaA+hmH/Ua5nIQz7BG3
 mCQZSq/T9x96bj+Wrq7sDzE8UmwxlOhooZ9aKAii8BJ36d4YcmdyiDE/E869lL1S5Vt7
 txiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AaJv1mu5ukB/CIcMyJjiUkroua19/SVkAvuVAHfagew=;
 b=AKXwiTk6jAkihmAWFeg1OGM7BVkDAc0MfkrruM6hRNB0U20dh36ug+G8bcuyNEnVIM
 fCh4wrKq+I/HNl+eaPRLBZ3g4EBq/Vb02xAmBU6zkQzqFeoTVb2AraJmBYgwX1eEOG8n
 WZnArm+dYRtPw1WbXx6DGGzUz5QqmfYYlTelxf3kUpQM/HSwEoY/Gp7JEm+vV0WhyhOJ
 nd1g7pX3Jx7NCXx+azr0Qr9zcaRK5PfSE1cbOqr+LYx66s3VVdGMse6RBUWx76CHOjv5
 e+3vbag/eodN/TNTu4OMyQ0knC1zrL3r6EBXJsrOM1QJooW4uIAGAEQit8zTVNme1GC/
 /Q/A==
X-Gm-Message-State: AOAM532HlbSDfGhFXrdj8HdguXg+ftBCDJzWlDl2sS+Aq785BG6O8/BZ
 SJOR4dB2RoPrvaPrhuvGCYadqQ==
X-Google-Smtp-Source: ABdhPJzELndZXOBjcc+iB86Na+d7gpW0eUl7Xb0Mcmpwvh1mxirZqv7irrBgH24N13Nm09Gk9voTNQ==
X-Received: by 2002:a1c:7215:: with SMTP id n21mr3241141wmc.154.1599551668340; 
 Tue, 08 Sep 2020 00:54:28 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id f14sm33788291wrv.72.2020.09.08.00.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 00:54:27 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: thierry.reding@gmail.com,
	sam@ravnborg.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Add Shanghai Top Display
 Optolelectronics vendor prefix
Date: Tue,  8 Sep 2020 09:54:18 +0200
Message-Id: <20200908075421.17344-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200908075421.17344-1-narmstrong@baylibre.com>
References: <20200908075421.17344-1-narmstrong@baylibre.com>
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

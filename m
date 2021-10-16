Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE804301F7
	for <lists+dri-devel@lfdr.de>; Sat, 16 Oct 2021 12:22:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98BC86E42E;
	Sat, 16 Oct 2021 10:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 952C56E429
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 10:22:37 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id g10so48457569edj.1
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 03:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k6lg1YXQcsQSaHtESENC7NuGsQBvloHafjyXCeclFK4=;
 b=cZe7t7ecRSVFyGK6rU8otT3u8PVOITqJIX4Q8vpIBzXn17/WMj8MGdaNGNZcpAhqF/
 TmlJAXSSUSkfPl5wCZNYTcXQmfh0i1Y6YPJXdz5qScCmSi9oP/KDnKSnD8S479xJ6C2x
 LosDWN4CvbEUZaYo0kufzUiQxs3Blt8WQAqAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k6lg1YXQcsQSaHtESENC7NuGsQBvloHafjyXCeclFK4=;
 b=dgVsXqSOd+biPF27HDCZ4kawEeFga4c6VYO3dq0cKvUrXyPYz+JPsC5nve571vEwfa
 Sn0Lb+DShxtMZ88l1ieHYTVMQSN9W3y5AzmlQoMHeOsDOCTHE5qhXU6L+2pMXO9tLWL3
 z6gFyz/dXHHhLO2CJGZNO2m3KNyWVejcTpklxO6mKAK+Y9T3mpZ3kgYFeFM9WCy02H0v
 PI0fS1BMidM5UdRlrkumF/v+oG5TsYyErc1Q9JL6anE6RdpdGCh657lrio1+Lhvq8DKj
 RpzcmvzGNwj9NA5khz1F/8KJMJ+HDLw3igOTqOhyaULVzre5xx4qv69Cra1a53NgVwCa
 vCbQ==
X-Gm-Message-State: AOAM5305RDRtVGLNrjiyNpaflitIyTA0mvzRWc6ViaF83NaTsVTWA4Ak
 YvR5UXCP3YCsQx8T9HkxekExkA==
X-Google-Smtp-Source: ABdhPJwYr2Usdx2fRzfvE8x6T5AzkhCgdaiWSMcYlqVDwgsemSvZ7/5rzDYKZhxXYIbK96KEblxmUg==
X-Received: by 2002:a17:906:5212:: with SMTP id
 g18mr13775067ejm.564.1634379755998; 
 Sat, 16 Oct 2021 03:22:35 -0700 (PDT)
Received: from panicking.lan (93-46-124-24.ip107.fastwebnet.it. [93.46.124.24])
 by smtp.gmail.com with ESMTPSA id la1sm6117361ejc.48.2021.10.16.03.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 03:22:35 -0700 (PDT)
From: Michael Trimarchi <michael@amarulasolutions.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: vendor-prefix: add Wanchanglong Electronics
 Technology
Date: Sat, 16 Oct 2021 10:22:28 +0000
Message-Id: <20211016102232.202119-2-michael@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016102232.202119-1-michael@amarulasolutions.com>
References: <20211016102232.202119-1-michael@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Wanchanglong Electronics Technology is a company to provide LCD
modules.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index a867f7102c35..5c43391d8c3d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1304,6 +1304,8 @@ patternProperties:
     description: Wondermedia Technologies, Inc.
   "^wobo,.*":
     description: Wobo
+  "^wanchanglong,.*":
+    description: Wanchanglong Electronics Technology（SHENZHEN）Co.，Ltd.
   "^x-powers,.*":
     description: X-Powers
   "^xes,.*":
-- 
2.25.1


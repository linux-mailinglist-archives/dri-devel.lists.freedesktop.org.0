Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E813D4720
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 12:34:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 380896E05D;
	Sat, 24 Jul 2021 10:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 555DC6E05D
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jul 2021 10:34:43 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id m13so6257329lfg.13
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jul 2021 03:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SOSmzvWDnV1n+6dhGf47+1g6nbwp/1OAUc7BCbVeW+M=;
 b=f0fZ64mXzWaKU8WLVy2HL8QLKapOt8WTiMQmPAzqD0jZjYbGt3W7VTh5Fn/goLtdgc
 +rD+SOt9fRLPaWG9RDWE0BA5uSJF4x2kcarNSvIm0/uUwPO/bYnpH3KkEZS8iPGgX13R
 VuptsJmuOAtFzQ+A37QMKJ2fdA6L8ncPW5JdP2URCynZyucbYDMRCYI2SK2dSyUh3W7g
 eVcBQFOfXJQ6HrGlX+sylVo8Ee25Gg6/ij6xPoHb+IoHbZkWcJKREzjQSj9wVRKQbQ4a
 91GOElIfaTu1pe0GuGUmCZDrzeg/KfQsvLlJ5zECe0JB2xIq/yeLtsdxkoZPzZ+BYHTV
 7WZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SOSmzvWDnV1n+6dhGf47+1g6nbwp/1OAUc7BCbVeW+M=;
 b=J5ymUFUUb1i2ECL6lPE2NTteg3ONJXDtyvc5BEbkjxqhlJS/W9MbVy8Z/CEwHPxX4o
 5098nrZVfms+N/Xvq0cveZCc89MvqNRq7pmuoYtXFRMjNUk7reWzGsy8nXWrMfOl3VP6
 zk2eDW7V92ELZVMfAjA/lAi9o55QLy3m1/HRaxNBXNtMAaTj5aXgBN127bQjPf/ls+Hx
 DajQSQZVpU4lrAW0oTo/kk2s/t9wQ/pLjLcHct+LqvxxMhcCQLoAmGtAGsE4mSWvx++z
 /8lIK8nkCxyMXK0oJG/CDDpSRyNJXCVP1h0ksV8hsoiZ2Otr+BqY1r26qLCf2SglnSYU
 Rsaw==
X-Gm-Message-State: AOAM5315S0mIhGlxmAWsD/7UvqYY93aQvu/FjL5+NNcI2QkVVbyf1vlq
 ZgCII76FK7f+eB2RMcFmoD8=
X-Google-Smtp-Source: ABdhPJyOSNUue6kuYntJNTrZrm3PK3f0/nxLTEB1VQXAcRaseskQoNdMmWd1zqqnlnCx/nOprwcpew==
X-Received: by 2002:a19:ab1a:: with SMTP id u26mr5691027lfe.457.1627122881606; 
 Sat, 24 Jul 2021 03:34:41 -0700 (PDT)
Received: from akaWolf-PC.. ([194.79.5.201])
 by smtp.gmail.com with ESMTPSA id v22sm2158938lfi.270.2021.07.24.03.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 03:34:41 -0700 (PDT)
From: Artjom Vejsel <akawolf0@gmail.com>
To: 
Subject: [PATCH v2 1/3] dt-bindings: Add QiShenglong vendor prefix
Date: Sat, 24 Jul 2021 13:33:56 +0300
Message-Id: <20210724103358.1632020-2-akawolf0@gmail.com>
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

Add vendor prefix for Shenzhen QiShenglong Industrialist Co., Ltd.
QiShenglong is a Chinese manufacturer of handheld gaming consoles, most of
which run (very old) versions of Linux.
QiShenglong is known as Hamy.

Signed-off-by: Artjom Vejsel <akawolf0@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index b868cefc7c55..52996cbf2cc4 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -924,6 +924,8 @@ patternProperties:
     description: Qi Hardware
   "^qihua,.*":
     description: Chengdu Kaixuan Information Technology Co., Ltd.
+  "^qishenglong,.*":
+    description: Shenzhen QiShenglong Industrialist Co., Ltd.
   "^qiaodian,.*":
     description: QiaoDian XianShi Corporation
   "^qnap,.*":
-- 
2.32.0


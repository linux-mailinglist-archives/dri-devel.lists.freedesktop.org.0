Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D21D4A2A955
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 14:14:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4666210E827;
	Thu,  6 Feb 2025 13:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="3gBppO1F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE58610E826
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 13:13:13 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-21f3c119fe6so10469135ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 05:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1738847593; x=1739452393; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uRpcrg83W4YC9Q6eBSOmMfqvqVxhGz5np6EgD/qHnrY=;
 b=3gBppO1FZHZsXEZRXi6M1xWkLIzJy0Yg5Rg+DUMlEd1Q77GGAjgZ7rb0IGDZfDUMNu
 wsqM7MZ3tGiHh+85B0ZOIgohskMjmOAoz91+Ibn6l0ZFtKcC8XfJR+PeT9nHcSbaXNqN
 FsbCNMtas+Uq95/++xKCJWEFZKwID3+iP5obcujYIbPLRvW3gpqs0PYOtlruFpMCi7eT
 aX7n15qtfF3XSeyyHCJzBUUxyC9Lzs8iL5xrDHtdQ2rMPtuFy7QK0Ao2cH8dzaoVfqMD
 eoex6IaZdFwb4hXEQ+NQaEwDOSOqiNSKS3Aocrb9fFP/7GGD8v9eDbiDm26+Z6+wUJWJ
 qDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738847593; x=1739452393;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uRpcrg83W4YC9Q6eBSOmMfqvqVxhGz5np6EgD/qHnrY=;
 b=sN3ew1OYt7xoobhoQcH8XqoBIj+BlAbAnYtnVbzi2xu0dy+kHqVYd2ZR0oHQMYLnhb
 PPTT2fv0whpO79dM2X2jRB3WoRutsDJaVTxwGjQW/2AqnrgW2r9fJDPi0eqBd044qxcz
 ICkwbGLR1ATFNQTZORNAApa94i4fNJKMlsY0zjFRh4XLgMBQM+3eDvJpmNXV3fLmMfEE
 R9dBqlTdgy27kJ9tbKgE4668lKxc5m6S7p/2mO7rmXbQgr/CaVWzqle0tGaXsDG08CEm
 /OsN63qdtccnvVr7/IB6Oc522lKd0W+kSq77xKO1xPy7nezA4yDswQl+8M5qrLbgJqv/
 FhUg==
X-Gm-Message-State: AOJu0Yx4gDemAo3fZpMvZ90sAdIJlZ77A0d73wM+tVmA43oDe5aoP8NJ
 o8/VPa/1M2bpFKpAEpLnyI5c6I0qQx2TW/2k82CA8MvDxkcKl8bD9I7Bi6GK+i8=
X-Gm-Gg: ASbGnctsUqojJ/7De9QBd/4wWMduBDRMvvWfUhJW5LzD9ZMpOLdjH43g9vyH9agfvGk
 R+U33VT78EWKtX3bkhTDVeoW67tSAOHZ9h7AyMnGDMxoL/ozmrrci2/qYE1Ymw7uxydz9ZtNAH0
 YlJqqcAOn8JkgVdnL20lHCu3iP/y0So4hjm3AvmhL7TVysNtDfMXswHQ9CYpgrLVwWnrgiKnsBG
 TToN2JbJNLL2tu+DqW1EOJVVP/cqjbMa8zI2iQcXcOtGDZdkr30yFG279srT5wSeewvmBWYtxW1
 tIBDTKPc/cpGO7IaeMP99UUxbyYXFzYqBfdgEilBYbVs/yPQQaDZPOlG99J/BX8=
X-Google-Smtp-Source: AGHT+IHSlKv+WX3I/TgMDMO34ZgxTwNFmFgGoB+Q3vS2y02BNpmlvXFZebCnCofwbuz6K+dOMWGR0w==
X-Received: by 2002:a17:902:e5d1:b0:21f:3a7b:f4eb with SMTP id
 d9443c01a7336-21f3a7bf984mr34756045ad.22.1738847593324; 
 Thu, 06 Feb 2025 05:13:13 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f3653afc2sm12237925ad.62.2025.02.06.05.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 05:13:12 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v2 1/3] dt-bindings: vendor: add csot
Date: Thu,  6 Feb 2025 21:12:58 +0800
Message-Id: <20250206131300.1295111-2-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250206131300.1295111-1-yelangyan@huaqin.corp-partner.google.com>
References: <20250206131300.1295111-1-yelangyan@huaqin.corp-partner.google.com>
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

Add "csot" to the Devicetree Vendor Prefix Registry.

Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 42d14899d584..375f1f7c79ef 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -336,6 +336,8 @@ patternProperties:
     description: Crystalfontz America, Inc.
   "^csky,.*":
     description: Hangzhou C-SKY Microsystems Co., Ltd
+  "^csot,.*":
+    description: Guangzhou China Star Optoelectronics Technology Co., Ltd
   "^csq,.*":
     description: Shenzen Chuangsiqi Technology Co.,Ltd.
   "^ctera,.*":
-- 
2.34.1


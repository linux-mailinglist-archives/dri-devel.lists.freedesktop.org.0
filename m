Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8176ACCDBB
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 21:42:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E4E10E665;
	Tue,  3 Jun 2025 19:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="U5pptin/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com
 [209.85.161.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06C0C10E5B3
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 19:42:00 +0000 (UTC)
Received: by mail-oo1-f41.google.com with SMTP id
 006d021491bc7-60bd30dd387so3016908eaf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 12:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748979720; x=1749584520; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/L4zSsY66uDYamOrq9+Mw2rOYYJ499EOM1f+pBYr+Z8=;
 b=U5pptin/qAVWt+oQkW2xiCFThQBAWeX4K6L1YeRHx/B2J+8E1khqlqVHGwLc3faaLE
 D0Q1Ewl/bpgj/KFL9noa9kc3cdHBVtZBT1+9ii6nVSiPf50+RLeIgbNgijpGQ5Q4/2vy
 +K0oisUtAdB48u1/y6AaRut2zFBsO+7Rpj+Uk2rH2WX3mnVOrneN9M8yVQugkzCDLPlF
 Qa2sDkKYCseuFYTiSYKurdTtOrrweSpwe60Av0v7kJVb4NMzE+9b+siRGQiTkDYN61Tr
 CxHwCatS+qxO0sJElnv9nz9ZoIpsZqmNt8EfUOx6ns5YZV/xOhW1/iBl1uUJ4jef+jFs
 bKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748979720; x=1749584520;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/L4zSsY66uDYamOrq9+Mw2rOYYJ499EOM1f+pBYr+Z8=;
 b=RGwz4pBqxZFXdH+rrqa27t3g7486izb2DRc3Jf4+qFmhMrWpQk9xzRUPa1WWgryrN6
 nBztj4XgZYwUN4vD4/zykin+fO755/WRbcqlE+iWQZs4zzukFg83c+B9ZcChQ+KhIu6N
 BrmvGLbD0pwxot2Umjl4+eCVeu+Dtp6Q264iJnvEcheznCrEnjC2w3ejR1PMkY/yLPpu
 ThuCa7JpR5wJ0r9mGnm/1ZHEgEFSlSoAFhK96342JsuIkdLDb6iDsGzRrQGk+LzH/cWN
 f13V9O7viOFRNDJMKgDxJKmbBWAmxvEGTfY2trIgMRoYgoDEmXwZWCg6M4C0e8x5MaJO
 Yn8A==
X-Gm-Message-State: AOJu0YzDFuT2XkCStyouW2X5vkGp4IZXeG/7ECycyWk3HjpZegsV7urU
 gzwCL7fOjVbnpJRIaYsKpmRmLVrbNQyZTA6tmwQrfIox+GXnd5cgGiTwKe5syw==
X-Gm-Gg: ASbGncsR5ErZ0cTJJElz0fwFrb+b5sd2c9BkVVyk/9qyYPGe4L2YHcTKIZdrru2T4ys
 oC7vN/u9WXYujlYGCqhHMuOxQ0vgsnKOKEnB+6THnOsd45m0q4sXoU1j99jVaWqw46efjaXIOee
 Oz6802Q8OnEbJYC88750noVjqvt5vi5P9Ik7btiObr4A6dMGN8t9rYeLVqJD3qsNPx5NvbwyCgb
 jlO/V62XHHokx6t+VA6Vk3w9KE89tjXxbVKwDavprZ3adDJn2Wh+bfuSzDg/gcI/LZNLRgHbXU5
 Bdbq4pClYVzgg9bG3LcUA7s2u5jm3WHWoEAwd+lJgcXZF80XFkIhcxEjejZv+Ds4tK/AXUE=
X-Google-Smtp-Source: AGHT+IG3+8X4rYmlVGqs/t382PwbAWeG5RNhDIJA/498vjwFKFaLf3Z5w5vaFUsKAWkzdqYLMZa4cw==
X-Received: by 2002:a4a:ee83:0:b0:60b:b134:a1 with SMTP id
 006d021491bc7-60d53c761b8mr10625534eaf.6.1748979719622; 
 Tue, 03 Jun 2025 12:41:59 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:d19a:d10c:4358:1346])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-60c14c88f96sm1967615eaf.17.2025.06.03.12.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 12:41:59 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 sebastian.reichel@collabora.com, heiko@sntech.de, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, tzimmermann@suse.de,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com, quic_jesszhan@quicinc.com, neil.armstrong@linaro.org,
 javierm@redhat.com, megi@xff.cz, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 1/4] dt-bindings: vendor-prefixes: Add prefix for Huiling
Date: Tue,  3 Jun 2025 14:39:27 -0500
Message-ID: <20250603193930.323607-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250603193930.323607-1-macroalpha82@gmail.com>
References: <20250603193930.323607-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

Shenzhen Huiling Information Technology Co. Ltd. specializes in the
research and manufacturing of display and touch screens for industrial
usage. https://en.szhuiling.com/

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index c01adbaacbbb..d5fef99a3490 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -672,6 +672,8 @@ patternProperties:
     description: Huawei Technologies Co., Ltd.
   "^hugsun,.*":
     description: Shenzhen Hugsun Technology Co. Ltd.
+  "^huiling,.*":
+    description: Shenzhen Huiling Information Technology Co., Ltd.
   "^hwacom,.*":
     description: HwaCom Systems Inc.
   "^hxt,.*":
-- 
2.43.0


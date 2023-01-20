Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C381675B86
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 18:31:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7078410E384;
	Fri, 20 Jan 2023 17:31:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B7BC10E04E
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 17:31:10 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id q8so4628461wmo.5
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 09:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GBbS1vR/mSuCPWTVaI9sYUbEGcKE+xDxJZ9yOEMjCrg=;
 b=qjJVGDJH0jKQ0b4gzTbkmZrDvUkl0cBq7dqS3DzmJkGXk0cUiGw8MiLlBytpyxXpe5
 nPd0+VJ6zqdQsWok6dWwpaQBGSKGsvLc4gOrnwT1BVZvQK+0aLewi7lVVZHJUFxJPn06
 g41pppSD132BYkYxl21lBvFQjz6pO66N66lmvbCaP3vkyAEGnAD2nlCuZ1R5vEuUmPxZ
 2KTrzvHbb3+2zUKcoGlUfsJmTEiwjhSdt2OYDX1MXzRcV6vsbD50CYFwRnlVDpQNTUq2
 QwOeJ4cLfmobuPYC8LGX27KOOZ0rqd+21etuwUqfegxoR29BVSHH88bVUIv61f2xTjHx
 edOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GBbS1vR/mSuCPWTVaI9sYUbEGcKE+xDxJZ9yOEMjCrg=;
 b=HxM8HTjuA6EGaO80Nhyf23rMyNtJ3/L+FOUYFguaqV5XfTc3HMJtr2mrdfVGfkCaW6
 868PwUZ0kmpwrlKj03hiq1yzDZvy7ceSKDc2e3oks7GYwXCJzDzse12Habz/TaC6wDu2
 W+BkDwXgpI4/PuH6G2lO/EzIwbBPPJlM4wEF7rKiebhp3N0KzGgOp5SS0K5ylJ4Gsx0P
 AUwxCWW3BgE8toTuMfmWHweJCP3CrzEDGQFYdInJ36MTRy97AZRjO/j8LBR9iOOVi2sm
 vAulQ2TKaBJ7aG6ylBlcL6A/s1dcfntWmjmBlVsZ6tqXQOpstp/5r/qWBNUZNW40mVDS
 dmWQ==
X-Gm-Message-State: AFqh2koUjT9jHXVYDzS5sHKOv03YJDQVLPop2RHu7rCIAP32H0XrldsB
 l6rC/Om8aeaOncVInKG9684=
X-Google-Smtp-Source: AMrXdXsbFPG+yPqtgN9BXP7pJsSnwZmnCuFETW1Ckv3V7VUiLfVY2ra6BoEUOfuxX5YKtYvRx/HBcg==
X-Received: by 2002:a05:600c:6006:b0:3db:21b8:5f58 with SMTP id
 az6-20020a05600c600600b003db21b85f58mr7162938wmb.2.1674235868713; 
 Fri, 20 Jan 2023 09:31:08 -0800 (PST)
Received: from localhost
 (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 w4-20020adfee44000000b0029100e8dedasm36214943wro.28.2023.01.20.09.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 09:31:08 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 2/8] dt-bindings: display: simple-framebuffer: Document
 32-bit BGR format
Date: Fri, 20 Jan 2023 18:30:57 +0100
Message-Id: <20230120173103.4002342-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120173103.4002342-1-thierry.reding@gmail.com>
References: <20230120173103.4002342-1-thierry.reding@gmail.com>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

This is a variant of the 32-bit RGB format where the red and blue
components are swapped.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/display/simple-framebuffer.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
index 3e9857eb002e..3c9f29e428a4 100644
--- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
+++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
@@ -99,6 +99,7 @@ properties:
         * `x1r5g5b5` - 16-bit pixels, d[14:10]=r, d[9:5]=g, d[4:0]=b
         * `x2r10g10b10` - 32-bit pixels, d[29:20]=r, d[19:10]=g, d[9:0]=b
         * `x8r8g8b8` - 32-bit pixels, d[23:16]=r, d[15:8]=g, d[7:0]=b
+        * `x8b8g8r8` - 32-bit pixels, d[23:16]=b, d[15:8]=g, d[7:0]=r
     enum:
       - a1r5g5b5
       - a2r10g10b10
@@ -110,6 +111,7 @@ properties:
       - x1r5g5b5
       - x2r10g10b10
       - x8r8g8b8
+      - x8b8g8r8
 
   display:
     $ref: /schemas/types.yaml#/definitions/phandle
-- 
2.39.0


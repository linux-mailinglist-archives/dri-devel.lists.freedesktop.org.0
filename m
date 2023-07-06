Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4549274A5A7
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 23:11:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB44B10E4DF;
	Thu,  6 Jul 2023 21:11:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB6A10E4DC;
 Thu,  6 Jul 2023 21:11:19 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1b3c503af99so1152215fac.0; 
 Thu, 06 Jul 2023 14:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688677878; x=1691269878;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AQZMOPuU2NT251VkgOhkBFz/GJRkDGlyYehHpTo6xuo=;
 b=IPrF1n0sR36WYe5zNFlTJDASB+I8bjHE3t/RGZgzGTI46Pi1kD1tdXyTiAQQ5NaY2+
 9jehIcXPadJ8peSCl1S5EvghQQucTULwAiM+TuGUQtKQb+72zRdf5DPp5rDIgH0Z3r9b
 t8sTHTJEBmKfeUBV6+41lO7PMSo59loOJKLU4oDIacF1DuYWWpZpN/vzxoziKGGvls52
 lEKYb2g4CrndLCYKM2ptJCZcpN4TwlINPR2JZR2BCA+p6UPU2bg4hRi20DFX0ayWWHLk
 suarsp/CQG5nE4wyVjs+IusMWAcwBli5liBGgJ00+OCFd/NM3Cq8BSkKIjvlN0oKuTa7
 kgDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688677878; x=1691269878;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AQZMOPuU2NT251VkgOhkBFz/GJRkDGlyYehHpTo6xuo=;
 b=BjsCYeVsJKlVG2oLLH+a8upmOAb6aJyUr/uQ+VatIOcKdQxbktoOs8KVIip8+seR2Y
 jc0QdBrVGNN75we5/Svfc8PbU6xC8kbeLJwrkcpfdhekYNYuik31Reh0d+fndnByIwhO
 4Sdqwb3W495WuUDdx8YB0HY8mfuMZKJeD72C9lV55mXnIpN78SL/2BSroSMlmaYtXr7J
 ME9bEiRDQrPzhM7BGh6VSFTFiQieh3hvMWhmg8KU1GJ+hsvjftd6tWgm2d6kPPfTZgoP
 +g8iHnIWe4dWxdkjqDeDHG2m7LiqwzDyHpKOu+IQ8J3oezzrEGIUj7IdD8tUWUihi1SZ
 LocA==
X-Gm-Message-State: ABy/qLYhzVq8Kjr7rv7ujhzgtINCG5KWfWh/zM9gIdBfAXqxsrmw2w2V
 8gl6Ij2NXfvtSe9+DPzHnFVK/IkQYis=
X-Google-Smtp-Source: APBJJlEAMkpjVtA5YgRuxsX3a+0QdhTSNWRfvjDaeZNAGweIXh4YuU30w3UfBmFBzSh0FOkdHxL1hA==
X-Received: by 2002:a05:6870:438f:b0:1b0:25b4:4b77 with SMTP id
 r15-20020a056870438f00b001b025b44b77mr3528266oah.14.1688677877851; 
 Thu, 06 Jul 2023 14:11:17 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 d13-20020a17090a2a4d00b00262eccfa29fsm233856pjg.33.2023.07.06.14.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 14:11:17 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 11/12] dt-bindings: drm/msm/gpu: Extend bindings for chip-id
Date: Thu,  6 Jul 2023 14:10:44 -0700
Message-ID: <20230706211045.204925-12-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706211045.204925-1-robdclark@gmail.com>
References: <20230706211045.204925-1-robdclark@gmail.com>
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Upcoming GPUs use an opaque chip-id for identifying the GPU.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 58ca8912a8c3..56b9b247e8c2 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -13,6 +13,12 @@ maintainers:
 properties:
   compatible:
     oneOf:
+      - description: |
+          The driver is parsing the compat string for Adreno to
+          figure out the chip-id.
+        items:
+          - pattern: '^qcom,adreno-[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]$'
+          - const: qcom,adreno
       - description: |
           The driver is parsing the compat string for Adreno to
           figure out the gpu-id and patch level.
-- 
2.41.0


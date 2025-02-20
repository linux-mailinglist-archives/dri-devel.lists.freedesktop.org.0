Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A84C9A3D612
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 11:08:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A17310E914;
	Thu, 20 Feb 2025 10:08:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LaUh438E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A00810E919
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 10:08:47 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2fa8ac56891so1138960a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 02:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740046127; x=1740650927; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=meTtqveZhiyJw9ezonjEpVoABcseZWYpFPvHUuAWv9M=;
 b=LaUh438EfKUDMOJTu2j1P4cLtnL/8pbk8+AUqFGFTtfpwaWpivniTaN3rPoU4aCAuf
 ysqekkFMjVRdJijEfDDufnAAWjlEWmeD4F82GIRwZgyaWuZNO2wSwH3QVQ4u7xQ8Xy8S
 GrvN105lcCzl2rAlQI9Pjdjh8vUooUCOiY+v6ZM2/+/jkmjcyCVEcv8GID9RcBnXJhXm
 XNVgsZhhQ3CuF799r8vg25yxlTlfJk3YeLCZi7KGFO493lGpmjWv4oZo4Mmg0T2VLd30
 YHtXHEUjvhxEEfJT1844lfCyup4pvZB0b7xS4KytW0P9J6/jF458qyx+Ze/FlwMrNX6h
 HgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740046127; x=1740650927;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=meTtqveZhiyJw9ezonjEpVoABcseZWYpFPvHUuAWv9M=;
 b=a6TePUcStN13sPoZb6gP72lv70L0CQxjUwRvgUtO6IulhOXSeI+th7MRF6d/MUzbjq
 UaCnZj+V0ofhwAtCHx26Nq/z+on6eiAWtNeDjNqUIFrk55jnsB0K+vDqrIJ7WYbIDe2D
 C9Xx95yJ3cDGVNuuvGIsdCOIP2rq6UTz0NYkBW7UIa0bUEyNP3lU7ArFGWoQawWKeMYM
 nCraJbbFcMlM3yZHrSBZjW1yy3g2H+PS8//RO+ScIjpaPL0oyc7r0y/uI6JDXMYKbf+P
 rSBMK92R2SRzuWNz+JKnGNYTj3uD/pg62tUlcOT4L4gKgeYuewgcGUl7AmyaVUcYJeer
 LPyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5s2TsP4m7Tm0TXDLDyWxOQx78RhxuPyYrz4edv5bi722N99fmsdmS/PszEIIaoLpJ6ebJV21Rm4k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxI65HPskmgto5k3hqgeKV+ijs0QVNHSe59CnnEk6n8YU8jV3SO
 sUWKHByVc+NAZER54pBM/Oxx+3NrVDvWj13mha6tTxRkAEf/5WEmU2onkOgmvZ4=
X-Gm-Gg: ASbGnct5djGZYholGs8ydE1ZxE2nfkgEEW4fY2I5MEW5o4b8nCt08FI2JkRHoLlMyIp
 EN8Qdz08iSLGyiIb2jfihWD95Dfng8lDFH6tAvVzXnT7bq1LhvPA+8DiMvetq3z1SLmFzLZwibX
 9Llc8XO9HsAPyahJuyVSXiFP9juT6vwdzlNctKeNH0yk4rr3dBgWAZF66XE8h4TUZI2SEO6OJxx
 yHOmkhquCYLWMPLGPIKvF7JcmaZsH/XOL5pJeV6I9OKT8qgQjon7L37NaUGJq/qCWLFUZFOnzYm
 DzO1XXQ1BFyL
X-Google-Smtp-Source: AGHT+IGD8wqaCpXBwdzW85qDe+j1va1f9U+T7g4YEj1TqycqH9bnYqKAjfpfwmdIfdAez2gbLo1Zwg==
X-Received: by 2002:a17:90b:3b83:b0:2f9:9ddd:689b with SMTP id
 98e67ed59e1d1-2fc410493acmr28089738a91.22.1740046127187; 
 Thu, 20 Feb 2025 02:08:47 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fbf98b3305sm15304645a91.6.2025.02.20.02.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 02:08:46 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 20 Feb 2025 18:07:55 +0800
Subject: [PATCH v2 4/5] dt-bindings: display/msm: dsi-controller-main:
 Document dual panel property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-dual-dsi-v2-4-6c0038d5a2ef@linaro.org>
References: <20250220-dual-dsi-v2-0-6c0038d5a2ef@linaro.org>
In-Reply-To: <20250220-dual-dsi-v2-0-6c0038d5a2ef@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740046076; l=1495;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=FgJVBSjYusgZgNG2tQQqs/1on/o8VH1/MQqBVN+UdAQ=;
 b=oaEXnf20Cz3Ju+1zO2v+vtkcbrG+X7KDJR0PpZRcUkf0QC2Lo0cvU97aOJrdgq8tfBzlaNeD0
 vvilHqVr9BpDIW2cesJxDngRIMCexsZ2QgBOnuum6tB6wsLrIJuhgMm
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

The DSI interface can be connected to a panel that has a dual DSI channel,
or to two separate panels, each equipped with a single DSI channel. To
prevent the DSC configuration for the dual panel setup from disrupting the
current configuration of a single panel with a dual DSI channel, add a dual
panel property to support the use of two panels.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml      | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index ffbd1dc9470e2091b477b0c88392d81802119f48..e3f2eabde27609a66d6d81fafcb14e1bc014613c 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -88,9 +88,15 @@ properties:
   qcom,dual-dsi-mode:
     type: boolean
     description: |
-      Indicates if the DSI controller is driving a panel which needs
+      Indicates if the DSI controller is driving display device which needs
       2 DSI links.
 
+  qcom,dual-panel:
+    type: boolean
+    description: |
+      Indicates if the DSI controller is driving display device that composed
+      with 2 independent panels and needs 2 DSI links.
+
   qcom,master-dsi:
     type: boolean
     description: |

-- 
2.34.1


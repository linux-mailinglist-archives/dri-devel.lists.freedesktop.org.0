Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BE4AAEE40
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 23:59:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B6BA10E1C7;
	Wed,  7 May 2025 21:59:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="et2XrWBc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96EB910E1C4;
 Wed,  7 May 2025 21:59:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 18DA45C606E;
 Wed,  7 May 2025 21:57:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3041C4CEE2;
 Wed,  7 May 2025 21:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746655159;
 bh=Cni/pdWt9cIp+mXSH/rdXfKlwgkpc0+yATONdzAnZ/k=;
 h=From:To:Cc:Subject:Date:From;
 b=et2XrWBcXB0vQxxivC3De8795+Bcn71ukrJG8s/ytct8YVrQJtRd3h2BjreH2Nywv
 MWkJfnAxgfYHvL/1M+6epLXyjjqzg3qgbA429FyR9H646S/56Ax2WfcDxBVkdI7Imb
 0PFSxw7hfHM5B4an/L8UGw/bMVcBs2jqupntMaGMtNhlRtye8QW37guotxPHPYv6xy
 Agc1vIDuB2ROE3XZRUxie7rqSDYWkJUxhzxktqaVga4cBAspCj3B+602P3Ozi3C7LH
 YnkWMW/sl1FD5yYJ4cQmuXg2iyZILTamXmejfNHDJcD4v0EnqiE70uw02tXjAH5BHv
 figz6GvjKR8CA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: display/msm: hdmi: Fix constraints on additional
 'port' properties
Date: Wed,  7 May 2025 16:59:12 -0500
Message-ID: <20250507215912.2748964-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
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

The MSM HDMI port nodes are missing any restrictions on additional
properties. The $ref should be to "/properties/port" rather than
"/$defs/port-base" as there are not additional properties in the nodes
to define.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/display/msm/hdmi.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
index d4a2033afea8..099274d35680 100644
--- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
@@ -89,12 +89,12 @@ properties:
     $ref: /schemas/graph.yaml#/properties/ports
     properties:
       port@0:
-        $ref: /schemas/graph.yaml#/$defs/port-base
+        $ref: /schemas/graph.yaml#/properties/port
         description: |
           Input endpoints of the controller.
 
       port@1:
-        $ref: /schemas/graph.yaml#/$defs/port-base
+        $ref: /schemas/graph.yaml#/properties/port
         description: |
           Output endpoints of the controller.
 
-- 
2.47.2


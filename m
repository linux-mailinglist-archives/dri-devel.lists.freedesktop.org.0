Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E01DC7AE0AD
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 23:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E5510E1CE;
	Mon, 25 Sep 2023 21:25:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB99C10E1CE;
 Mon, 25 Sep 2023 21:25:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 66AA6B80C66;
 Mon, 25 Sep 2023 21:24:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EF48C433C8;
 Mon, 25 Sep 2023 21:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695677098;
 bh=lG0yL+eeYGuTlpkLttZs74ATqRMRX0Pu1q2jQdiN/BM=;
 h=From:To:Cc:Subject:Date:From;
 b=Tm61ldPqTCtxDXjiWNw+TTkbyOgJdeNdv0E/dtI4RAOOeskTn1xbn+aHJqLtBYelB
 VvV4eDnlAnedgpP6dl+EsQIeoyoUGx0e2fIXc7jUINHvwao24+B14CaMdOffTjcAmH
 cS0KnQhpKI7ljPBwjbLCZJGrO4C73bzAiEDYpDbfkjDbt4tAWSeXze3/8lzVNFwOvA
 6iYQkEQ3sYJeRm/T5m36AjbRcyD/JolsgUdmON0wE/ckV26gqcaznnIDtdV8jhmfql
 aVh6ffpaeRG1/DPOHE/L1Uy5svEKD6P4O0+yqxfFDFpH7ZG7Nv97dUWwiNCYzR90xx
 6NzwToDKkDk0Q==
Received: (nullmailer pid 1972777 invoked by uid 1000);
 Mon, 25 Sep 2023 21:24:46 -0000
From: Rob Herring <robh@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: [PATCH 1/2] dt-bindings: display: msm: Add missing
 unevaluatedProperties on child node schemas
Date: Mon, 25 Sep 2023 16:24:24 -0500
Message-Id: <20230925212434.1972368-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just as unevaluatedProperties or additionalProperties are required at
the top level of schemas, they should (and will) also be required for
child node schemas. That ensures only documented properties are
present for any node.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index f12558960cd8..dbe398f84ffb 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -114,6 +114,7 @@ properties:
 
       port@1:
         $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
         description: Output endpoint of the controller
         properties:
           endpoint:
-- 
2.40.1


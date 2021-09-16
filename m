Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E32440D6A6
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 11:55:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1411B6EB3F;
	Thu, 16 Sep 2021 09:55:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86666EB3E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 09:55:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2886261209;
 Thu, 16 Sep 2021 09:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631786126;
 bh=zDcDBX6eE0bO8UITevPPoTLTO8JLB4xPsBz8UuRXPe4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=feSKElMW4rq1yHiIKDtA7h/hVpjTffl1JyFKYr8M677T2LwZkphh8+2XQYBfWyRUk
 /Xx+OwBX7NvghS7UMziBtE89z6YJJWIOFrIu5eN9jcnoX82V/6DETnKT3//g1gfBah
 Z7bW2rkuNC9GSxyGgsoveSWI5P2Hnor6G9ggR7QJ2YrRBRK0dTkUpjyowh8TGxrdhj
 g6sGPRhWb7pHyMD5Ntytop1pHu+T/onq4TIhrQXwicW3iZknRN1KrxRvc+0o06Kcb8
 3WnXG3WA9McHjg69CLBCRRGhMkRWwsZOaUdFPpwNqTAt9jyC+UXbX+Yq1YLjrldZuz
 Q570TEWpcloFA==
Received: by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1mQo72-001vTT-7I; Thu, 16 Sep 2021 11:55:24 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Fabien Parent <fparent@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v2 03/23] dt-bindings: arm: mediatek: mmsys: update mediatek,
 mmsys.yaml reference
Date: Thu, 16 Sep 2021 11:55:02 +0200
Message-Id: <a87eb079a73e8ab41cdf6e40e80b1d1f868da6bd.1631785820.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631785820.git.mchehab+huawei@kernel.org>
References: <cover.1631785820.git.mchehab+huawei@kernel.org>
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

Changeset cba3c40d1f97 ("dt-bindings: arm: mediatek: mmsys: convert to YAML format")
renamed: Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
to: Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml.

Update its cross-reference accordingly.

Fixes: cba3c40d1f97 ("dt-bindings: arm: mediatek: mmsys: convert to YAML format")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../devicetree/bindings/display/mediatek/mediatek,disp.txt      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
index fbb59c9ddda6..78044c340e20 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
@@ -9,7 +9,7 @@ function block.
 
 All DISP device tree nodes must be siblings to the central MMSYS_CONFIG node.
 For a description of the MMSYS_CONFIG binding, see
-Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt.
+Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml.
 
 DISP function blocks
 ====================
-- 
2.31.1


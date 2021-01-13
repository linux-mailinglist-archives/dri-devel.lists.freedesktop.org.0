Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E4B2F4918
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 11:59:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0CAD6E49C;
	Wed, 13 Jan 2021 10:59:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEAA96E49D
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 10:59:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3914823443;
 Wed, 13 Jan 2021 10:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610535570;
 bh=02hqnGTUS5YhTP2z/VCY76S2cwZbqzkUNrtVW3wWscw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bp76ErEzNtCVNA+AIn8Z5iSWYV2oQEYfmmQxRzFhjkznZtI6dq9SDiA+kDekUSB1h
 V1yRM6pIcQu6161UiruJwjsd55ACNbY85D+lP2P3LLOnAprb9dPlIHoewlm7ZspwPd
 6pBJnfeMWAGMncgrEv9bMjcpawP07RsG6MEdiRUu/arWspnrrHunBE3z2ajn+34ePg
 oSwl0dYGuB2roaecBwIQeX4DSFtmFHdtjy7n2DaTYNpcEMTZGqdb3B0t7iOL14Cj8V
 yyDHv84cIxlY+Z5WhkbwR9CrjL+ZNDKbHKUOdMUkvrh0HEwmMClB/4dKq6zHfkr6UM
 /xVKFJu+YmU5A==
Received: by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1kzds7-00DpGn-RR; Wed, 13 Jan 2021 11:59:27 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 21/24] dt-bindings: display: mediatek: update mediatek,
 dpi.yaml reference
Date: Wed, 13 Jan 2021 11:59:22 +0100
Message-Id: <3bf906f39b797d18800abd387187cce71296e5eb.1610535350.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610535349.git.mchehab+huawei@kernel.org>
References: <cover.1610535349.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changeset 9273cf7d3942 ("dt-bindings: display: mediatek: convert the dpi bindings to yaml")
renamed: Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
to: Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml.

Update its cross-reference accordingly.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../devicetree/bindings/display/mediatek/mediatek,disp.txt      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
index 33977e15bebd..865e1e1b88ac 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
@@ -23,7 +23,7 @@ connected to.
 
 For a description of the display interface sink function blocks, see
 Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt and
-Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt.
+Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml.
 
 Required properties (all function blocks):
 - compatible: "mediatek,<chip>-disp-<function>", one of
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

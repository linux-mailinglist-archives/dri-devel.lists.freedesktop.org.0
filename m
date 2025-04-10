Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D329BA83AF0
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 09:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ECDB10E0DF;
	Thu, 10 Apr 2025 07:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="apBhGA7u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB1D10E796
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 07:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744269903;
 bh=vGkb5nO1PDToIeR+WLDN2aOQotJvSqzZArormdinE48=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=apBhGA7u5mdXAbP83BlNGgWbydwa+cah1rgN6KMy5EFS4vDPn24bejcE93/DCfwS2
 fYEksajf1W1/I+x2r440oBeiJjsNT7BfYyiRSDIYjTKXf5FLdjeh0RUWCq8iSsMVfU
 TV0w4YgxDM/lmEejEoYpE6w5SX9AlkfqnOCR6hFZVf/IMmVpV5bwH59uPnMVC0oZCb
 8ZkNi+KSr+kcD36BHGaL4Fg+5CtnVxmqwhwXnbUym/3irQ9h5BfIbysPDn7Z5KOj5A
 mFku50Ikm+w6GKhe4K93JosYfu9h+0tKA6PKzqNOTnDlg5yLqhnMz4QNBsoNzUKtUY
 FCl8jAj4UoKTg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5159C17E0EB8;
 Thu, 10 Apr 2025 09:25:02 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: neil.armstrong@linaro.org
Cc: quic_jesszhan@quicinc.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 angelogioacchino.delregno@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, pablo.sun@mediatek.com, christophe.jaillet@wanadoo.fr
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add Shenzhen Aoly
 Technology Co., Ltd.
Date: Thu, 10 Apr 2025 09:24:54 +0200
Message-ID: <20250410072456.387562-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410072456.387562-1-angelogioacchino.delregno@collabora.com>
References: <20250410072456.387562-1-angelogioacchino.delregno@collabora.com>
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

Aoly is a manufacturer of LCD/IPS displays based in Shenzhen,
Mainland China.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 86f6a19b28ae..6136c8832a66 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -129,6 +129,8 @@ patternProperties:
     description: Andes Technology Corporation
   "^anvo,.*":
     description: Anvo-Systems Dresden GmbH
+  "^aoly,.*":
+    description: Shenzhen Aoly Technology Co., Ltd.
   "^aosong,.*":
     description: Guangzhou Aosong Electronic Co., Ltd.
   "^apm,.*":
-- 
2.49.0


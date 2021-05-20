Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DED1138B279
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 17:04:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C065A6F46E;
	Thu, 20 May 2021 15:04:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA19B6F46E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 15:04:01 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 588D9166E;
 Thu, 20 May 2021 11:04:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 20 May 2021 11:04:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=c9IF6P5wnuFym
 bdczqDQeCFlSep2T99rt9vuVR0ESnk=; b=Lmqzn9Elo/uUedACjdQ22QFnQ9IQW
 Uz1NuHxWDXTQ4cd501lHJXWCFFcvGI9wzR6YtQ/2P08Vw7GF/kCoeOs1jH+tiarZ
 z0ffYxZzmX3vxMq0ypiREKm2RZdrN91wKngv6GZrA+m1ocI6Ja2p4kVksAWcwmSs
 yIeDQkJqKEsLX0jF4218YzAYdoWDbjRcLAPMaNe+ojgAV/FG+YYy910Sxy8HB5Pc
 zfpERBGyNnBl7dnAHwFFk77Couf9/Caayk4auYtMehmIZ8isjAyrrBaDXhC69qH7
 bt1E4+Q5YPR5tKbrrNd/Fz6dZEYoMEyGAZoA7p5VOb9aPx4mL/5ivje0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=c9IF6P5wnuFymbdczqDQeCFlSep2T99rt9vuVR0ESnk=; b=PgzrtvFR
 FWg7bGrxGXLE9zdN8guDLFPk7QWY89DJHtPnyHYYo1jbi1SGMkPd+0L+CGe+plXS
 jbmBIobm/YFxULbyIM6yjjBkh4imRcnhQFGJNiybXXRNewT2nDhg4W3DHUmqgQ9k
 4jU+HnnwajVnDmNAzE0hzOUxq7JdDb7ZWe5UlBnVb/5EAigflOK76JIyn3YbID1B
 oKsjcd35cNEMljtYZKXFSzokPj2hFuHx4cy+9TiuME7uJPG6CRIoCnzFmTTwJAua
 zIgOY+0SKQlXBzXWaVpzmnPmD64S1meknpsiGSAa320hXi910TfIz0kuSzlLU2Xn
 uLl1Emg7l5xDFQ==
X-ME-Sender: <xms:X3qmYL7VJlMfuO6wkhw_7kx9sFX5oVrfmyfIumMyeSDAeAFR7Ad3iQ>
 <xme:X3qmYA7Sr2JnPQPnujdi3finkmW1vSTwotpGZ1b3odX8yoENeiiSRU_xw5nKTyiXP
 vbTVszKJslBaN7xJyU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejuddgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:X3qmYCdc3buGiMk-pWidY4h6VSGjsaw7BIAgVqSL5JbFuXY7KZR86Q>
 <xmx:X3qmYMKy4uhd3ldybTTwYw8BlzAH8Nop_uROhfS9zAXAGALpy77bfA>
 <xmx:X3qmYPIsPBjJfUW2dZINuxt-o1Yw7Kq4RsL-PXlrMSGTVIpWGgEkhQ>
 <xmx:X3qmYEd_-fTZAfeb06JwdYytwo1hmXDUgYgYAcX5MlR9QXen-_WzQakjQfw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 20 May 2021 11:03:59 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 2/4] dt-bindings: display: bcm2835-vec: Add BCM2711 compatible
Date: Thu, 20 May 2021 17:03:42 +0200
Message-Id: <20210520150344.273900-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520150344.273900-1-maxime@cerno.tech>
References: <20210520150344.273900-1-maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>

The BCM2711 VEC uses a slightly different, incompatible, setup than the
one used for the earlier SoC. Add a new compatible for it.

Signed-off-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../devicetree/bindings/display/brcm,bcm2835-vec.yaml         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-vec.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-vec.yaml
index d900cc57b4ec..9b24081a0dbd 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-vec.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-vec.yaml
@@ -11,7 +11,9 @@ maintainers:
 
 properties:
   compatible:
-    const: brcm,bcm2835-vec
+    enum:
+      - brcm,bcm2711-vec
+      - brcm,bcm2835-vec
 
   reg:
     maxItems: 1
-- 
2.31.1


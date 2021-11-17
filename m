Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F88A45492F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 15:50:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA6406E0F5;
	Wed, 17 Nov 2021 14:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C91A6E0F5
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 14:50:45 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id B781958099B;
 Wed, 17 Nov 2021 09:50:44 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 17 Nov 2021 09:50:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=lY3hhXIn1pBnH
 z7C24moxAsZMuenwWY34CzsmISEKQQ=; b=ndc7nMoF/KYk3SOfVIJWKlPT6PHqh
 rOmXefBNR7XsU4uC5HoMU8lN/C0f/bDQnXmtL68MrcLRYQtOcbyykNwwuEqR86N9
 3F42ICS57jcyTD1mkgOEub12rbmOmGCDBRIZkfSJeeXuxye4UkSHuyb2Q3azkflv
 TbEYSOka2Ix/o0zZe2H7LJHjU17rztdAdefSuVM+VVQeqW7EVXIZsGhXeSOcx2A8
 KBQld/un8ws4XvbOc8K3EN2d+wZltu/f4srhSJ2bOL4gTgPwEKzvB54Vb3H2m867
 TMnIQsTRSleTmtnsA4RJ9c82K6zyR4RiaXwxxf3H79YwlXjkNVEi3Kwtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=lY3hhXIn1pBnHz7C24moxAsZMuenwWY34CzsmISEKQQ=; b=ZBdcIYBU
 3F9RdO+jdSDKfka5uKTfaYj6rJ+e0CHdcmdbqy29n7V70CY9l9sfQ17tNnSmmX02
 N/MvJ17X2E+lGw25c6O1GDq5/bFK4cWKuxN95By704SIS9aiGNgJ204LTkXJ4Fo/
 dAI440i7qcgExpE5gToLogBLJ3T/TV72+SCh3gNYhnGOf0xm2ZDuDCHFoCclCntH
 0VvDDB/V25JrUjZwrq+O5MIUNLdVTABtSbX8S6qM8CO0+bw3Fv197naQziivXpfB
 BuxfyhKMmyBCk0pS9I7wvT9R8czhP2B8TUHN4/mWTPNJwNw2RfEkTV3J39VVrSrF
 zuVSad6Vm0uWgg==
X-ME-Sender: <xms:xBaVYfLRNp0qPB1iqbFH6LMPAean7E97v3bolzUtsyxMEyQBwvYGeg>
 <xme:xBaVYTLsBOAa1mRgV6xM3Z0ZIdOkOUdmcLMOR5CKChKCUnKoMEnx8dLsZ3CAFMms-
 J4gLLLIyKiIlOg-obE>
X-ME-Received: <xmr:xBaVYXvVxd8RA3cUEa4KHnQMXMtMncudHd_WDfQ_St4SPFXo0L8iA5JGRGc2RQ_EWv3PhR5ZldTm8GFTMYONXvknXps7FeYV9Xtte5oN1Ks>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeggdeigecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:xBaVYYbTT8H6Y-0wBDI0ew10_uuclCcG6zuNFTlCFXCr9hO1phobwg>
 <xmx:xBaVYWY403ZokFk8WJihnkJ4U6PDu09nuJhECDArw_v8r4gB8zdwhQ>
 <xmx:xBaVYcBDiU8uNdP0XF91Ueu7jF7deD_BdpICYgSkhxc2Jx3k5l0Kuw>
 <xmx:xBaVYTT0fyifmPejoSMAg9SoPZfacbW5bRGqAsKkqA5x9nzH_394cA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Nov 2021 09:50:43 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Scott Branden <sbranden@broadcom.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Ray Jui <rjui@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 1/5] dt-bindings: display: vc4: Add optional phandle to
 firmware
Date: Wed, 17 Nov 2021 15:50:36 +0100
Message-Id: <20211117145040.334827-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211117145040.334827-1-maxime@cerno.tech>
References: <20211117145040.334827-1-maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The firmware can free all the resources it was using to run the display
engine that won't be needed once the kernel has taken over.

Thus, we need a phandle to the firmware DT node to be able to send that
message when relevant.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../devicetree/bindings/display/brcm,bcm2835-vc4.yaml        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml
index 49a5e041aa49..18de6912b833 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml
@@ -21,6 +21,11 @@ properties:
       - brcm,bcm2835-vc4
       - brcm,cygnus-vc4
 
+  raspberrypi,firmware:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+    description: >
+      Phandle to the firmware node
+
 required:
   - compatible
 
-- 
2.33.1


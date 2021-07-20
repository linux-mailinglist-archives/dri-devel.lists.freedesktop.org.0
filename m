Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 127AB3CFB00
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 15:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16AB36E1BA;
	Tue, 20 Jul 2021 13:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F226E314
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 13:45:45 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id EBCF22B01187;
 Tue, 20 Jul 2021 09:45:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 20 Jul 2021 09:45:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=BlLF334688PDi
 p4UlmyHDphu5KOpwIjt5VbcUSY2TZ0=; b=vOoefpxZalgZMMClcnkMFXTxr5EG7
 NCg8hC3Hkh8ArQ0hHT/6izNim6LRzxvZAdBMZSCyVeXD5hUOS7665e/UFL2aG+vJ
 Sd4RQdNqBOYLHiIGKIxu85d0CqEtAOcoecHUULTKYvkQSjWVbktquq9qeSQhEYrA
 uNgKjqUKet5grp7MMVV0pWMpXDy3y1mQ+54+l8BkXbPbgg2ZQjG06qao1ypDiyQ2
 trOrSaAUiz/GVcJLxTdQ5Lgo96YYKGmXcJltSY4dLVHBZqnVuYG5leiNVDXcr4p6
 LurkvQ5N8SLD//KmdQ2gZBuE0s6YCfTaDshaoqxFVqa7/8VDVFIXw++zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=BlLF334688PDip4UlmyHDphu5KOpwIjt5VbcUSY2TZ0=; b=EeTc99I5
 jACW/T7jxsf3/LxIBj9YK834D9MXiVLZwkBzT4vqyryQ/DbA7UPQd4HOFODxGROU
 nLqhR1Eu7C5gCBI6BLqRAghJ397HlV0xGLUq9rCCsqPy19+/s2c5TjVCpW0eCXBv
 fqgU5leV9X0NpVscTyjBDvbhuFis7IyUY4pRP8Obzl+gLKc1brq3kCj2FqpbTLg8
 J5gN4IP2Nw90i0Byl95fl9LoG9XCMlEU4Kcy2Xv/utfbo/IeLgRdiuhEbte+kjCy
 1KnVKvqEu9avx9wSSJKi8Lq9JtW9Efz+q2rN67gFAJ6Wm9rYlKIWN2HrH6XW7KH/
 9Ec1dgpVccRKGQ==
X-ME-Sender: <xms:h9P2YNY4PlePIIla-KAJjHDva8rJwH9-7bn95jsE1Hp1pKF6g1fUoQ>
 <xme:h9P2YEaTzE27dq2lW6NXEHcjNpAmNcCZXkv9S3IoNOku_7VJ2FK6XBJbzVbBq5QGS
 GS28JfjC447u1XWXQE>
X-ME-Received: <xmr:h9P2YP_wU1wVFb5bZRX5aN3yQVaKQQgokkitb6uNFALSo_tj3f6OFjnMK7Qjc0SC7cZy2K9HAfYUxafin_fnLbYchee_Jg-NhXHo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfedvgdeikecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:h9P2YLoiOkxWINWZGY-fndpdosRlKWt9HbJAb7IPwGKtgBXCrPGgBg>
 <xmx:h9P2YIqprzvNXjg5gPS3Pw_HM_uA_QbqJPXEeHUPAfJ71Q52YX7ZLQ>
 <xmx:h9P2YBTIO7TCZghZIUyLipQLCeDzCv9rJlw8CV9JdfGAXiUrlrj93Q>
 <xmx:h9P2YF5e5pDnNYJ3uEKDFOTCzbjh1p7hQ9YhukGJl4VUfzqAs3UGy6URuKc>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Jul 2021 09:45:43 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH 03/10] drm/bridge: Add documentation sections
Date: Tue, 20 Jul 2021 15:45:18 +0200
Message-Id: <20210720134525.563936-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210720134525.563936-1-maxime@cerno.tech>
References: <20210720134525.563936-1-maxime@cerno.tech>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The bridge documentation overview is quite packed already, and we'll add
some more documentation that isn't part of an overview at all.

Let's add some sections to the documentation to separare each bits.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 Documentation/gpu/drm-kms-helpers.rst |  6 ++++++
 drivers/gpu/drm/drm_bridge.c          | 14 +++++++++-----
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index 389892f36185..10f8df7aecc0 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -151,6 +151,12 @@ Overview
 .. kernel-doc:: drivers/gpu/drm/drm_bridge.c
    :doc: overview
 
+Display Driver Integration
+--------------------------
+
+.. kernel-doc:: drivers/gpu/drm/drm_bridge.c
+   :doc: display driver integration
+
 Bridge Operations
 -----------------
 
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index aef8c9f4fb9f..c9a950bfdfe5 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -50,6 +50,15 @@
  * Chaining multiple bridges to the output of a bridge, or the same bridge to
  * the output of different bridges, is not supported.
  *
+ * &drm_bridge, like &drm_panel, aren't &drm_mode_object entities like planes,
+ * CRTCs, encoders or connectors and hence are not visible to userspace. They
+ * just provide additional hooks to get the desired output at the end of the
+ * encoder chain.
+ */
+
+/**
+ * DOC:	display driver integration
+ *
  * Display drivers are responsible for linking encoders with the first bridge
  * in the chains. This is done by acquiring the appropriate bridge with
  * drm_of_get_next(). Once acquired, the bridge shall be attached to the
@@ -84,11 +93,6 @@
  * helper to create the &drm_connector, or implement it manually on top of the
  * connector-related operations exposed by the bridge (see the overview
  * documentation of bridge operations for more details).
- *
- * &drm_bridge, like &drm_panel, aren't &drm_mode_object entities like planes,
- * CRTCs, encoders or connectors and hence are not visible to userspace. They
- * just provide additional hooks to get the desired output at the end of the
- * encoder chain.
  */
 
 static DEFINE_MUTEX(bridge_lock);
-- 
2.31.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A79AF3D8F24
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 15:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64FD26EA1E;
	Wed, 28 Jul 2021 13:32:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B146EA1E
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 13:32:46 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8226E580B85;
 Wed, 28 Jul 2021 09:32:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 28 Jul 2021 09:32:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=gBLF9/web37jc
 0sR1lKbGPZeTeNlB6xH7qPvpoJe3vw=; b=kUGewio9Xge2fC03bR981X033hi7Z
 NFVBBt/xJs0v9UF6AOkFsMP0JYTVLgc+sPQay8aA+ky/kM/M7UcZ6YU72SjbNLy6
 a2TXdiQL0jPO2czdILAp2n1aUINGcNJuuPHF3oY71BmJ3J/VMxuHPKXhyC593Jaq
 DndhMiR229n02bYAF5ZrjnXpO9nVG2BOnTYd/fYz3JikSAFNyDn+RYDZGuQXhwY6
 /GOKRmkubFpJ4ope0EUbGhCeh5YFIvaW5HxcMictvQBhpCUzHAI7qZbttoYbSi4+
 R8N4bShGRc4TKL/MX0fTY56ZXb3OQ80EJgP99kK5GQcXdIpmaT+Tyutog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=gBLF9/web37jc0sR1lKbGPZeTeNlB6xH7qPvpoJe3vw=; b=ifZZvvfA
 2E9chGFwjMocx957UDXa56r7KMaC+VGbQBr58ZktI2zBlkfVuhCF0fBtzAR2bN3k
 6P9RuRKHBkhj/OXcQoI82Zn4K1eZYg0DLQHOFtm2aaNIcb5+6CMI33e7KAphN7Xq
 r3MObaueTOmzWeSMfXG++XQ38b/tXVOUYjLqTVPzUNKC35kEhklUnVfJeH+yEElp
 AqhXePrgvTSK1R9uavfTPoIBFyGBWdjbe5Vs6CAvvwf6vSL3JrUBhcxZ8sqFhQ+c
 LcbKGRUDGbgPHIcssMRXz62xL7lj2lBu2PhUC5nWDuQjaz9gcHcVoSAP26YCLtjX
 P19wLtqre6N2pA==
X-ME-Sender: <xms:fFwBYdF_zIqHV0L6qHClc1c65g63QJ22WxGdQIwsHARudLfSDWoUcA>
 <xme:fFwBYSVOii7E5-SKpj0_DIbAdZOUK31PGRb5GZdlXWXrXJy4MuYTziZPR9RtsxHRl
 PDH6TNPzzs8-CchUVw>
X-ME-Received: <xmr:fFwBYfLblCoDO-rTm-w6ReOZv07rwBMLUVa0_yokUcWW_AG8onr3MdlwaRxvdNASSwIVJjK4F5xxURH1_1cN9G7VxuweprKkaCSe>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgeelgdeivdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:fFwBYTF--MJfUAUzd0AK-SipwjVYxTxvRAcZ9VdyV-RNugBPPNlMkw>
 <xmx:fFwBYTWFnVRyhij8K6fIUruNZvddt4T24efebvLJSPDE-oKTTEdU5A>
 <xmx:fFwBYePxgdCghriwnIufWa-00RCC17_kJl4Omd1VzhMiKexuuXdlTA>
 <xmx:fVwBYQViYvpU4slBUwk6qpEMvVlS9qfP1Nj5aBQY2EhdnpSipvg89Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jul 2021 09:32:43 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v2 3/8] drm/bridge: Add documentation sections
Date: Wed, 28 Jul 2021 15:32:24 +0200
Message-Id: <20210728133229.2247965-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728133229.2247965-1-maxime@cerno.tech>
References: <20210728133229.2247965-1-maxime@cerno.tech>
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

Let's add some sections to the documentation to separate each bits.

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
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
index 426ce7442c86..71d3370ce209 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -49,6 +49,15 @@
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
  * devm_drm_of_get_bridge(). Once acquired, the bridge shall be attached to the
@@ -83,11 +92,6 @@
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


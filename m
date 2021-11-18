Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02189455930
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 11:38:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA4D6E9CE;
	Thu, 18 Nov 2021 10:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99886E9CE
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 10:38:27 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3778B580918;
 Thu, 18 Nov 2021 05:38:27 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 18 Nov 2021 05:38:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=J/WEN2hltvAlm
 wEPPuUAF7gGg9L/s81Z/tWpTdg8TSI=; b=MDF41qHr3HwSIMn/UHdgsIqBiwpxL
 yB2+eiso5t6ZK3v1iXYRoK1Deue/zY3orwjkzDlo8i0JGndrPFEcCnU7OyITwxRk
 xmPTOi/Kx3xEU3VjnACEaMt++6AGz9NdDnYXza6fpIGsF7bnaWbg+4/TrXQ7NhuW
 ypnU01ZUXLEKd3kmZtrG4UFXmNC6RXw8ZBMYEap/dQCw0fy86hB8DTwt7QU/UnPi
 vOE8pdt9HX+PeaweAVTEKhgixAeV1qF1gnBw3mznsd4Kvvz6Dfl8cy/pbxjWJ5K0
 Anh0CEYNfhwQlyOa27i971w5YpYZ3YiOraVV8Uk3tTP74cUiv5G10ISwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=J/WEN2hltvAlmwEPPuUAF7gGg9L/s81Z/tWpTdg8TSI=; b=Plvd+K0i
 QyEQHb/Zw0DxVbj3a5VoqrHGBB0Hnmjzr06WFZFUO5pKCDGRSrkF/oWre2LiRKZ1
 tYe8Wp/7LqE8y+UnEkVyq4SxxbLErePm7ww1bauPThS49WlzHhn5NH+20kC9lcV7
 DQVFNs5UWZU53mOM5ilHy6mp9zFdDkLydcCsv2Agc3CLFlMzBjmquejRl+g5PP8t
 pik02iET7yNhLh4nEv1up1MaGjznGBl0yYQ6NKKXhxMZVu+GbZxTXR5xXpTt/AZB
 plbYePoW+rlIgrSUf89Pe7XS3XHa3oGwcmNFoY4m0hbHn+e9A42sxjgx54kXK+nZ
 uyoLaq/CaiEHlQ==
X-ME-Sender: <xms:Iy2WYbO8aQ_TueDOddmDpcJ3-3FQyiTHQvwgHNVh23ti5kQQaNQ6lA>
 <xme:Iy2WYV9GiAZvUSsdExeIFi3JCtDd5uJ35cDesjsao3-dYud35kPfUCwy2eBGf5VXw
 KwV45AeQltVsZWoSUo>
X-ME-Received: <xmr:Iy2WYaSoM3DzFqIivySOQTRX9aJO8q-xMDSILEA3858FMPUA47jlKsjjGHyodjFSKFHPWWuE5EZK88v7tYvfX3BBeCqX6OM6npQW7qA4smY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeigdduiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Iy2WYfuRlSOkL4nS1MqipE8xEv39WLink47A5omaC0myx0sgahpgjA>
 <xmx:Iy2WYTdufgGnCALOf8XDOZNtRSZpD4PeMa1MsV-KkVIq1tWVzYPOIg>
 <xmx:Iy2WYb3zdAeVFaZDTjlMtcnfoSII1gGAK85do6Fw577bjHZs5oGhqA>
 <xmx:Iy2WYX4n75Y31w7W6BPCaUmsMLy8iOEzFX-5hqvlbGQyEjChgp1NPg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Nov 2021 05:38:26 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 04/13] drm/scdc: Document hotplug gotchas
Date: Thu, 18 Nov 2021 11:38:05 +0100
Message-Id: <20211118103814.524670-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211118103814.524670-1-maxime@cerno.tech>
References: <20211118103814.524670-1-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's some interactions between the SCDC setup and the disconnection /
reconnection of displays. Let's document it and a solution.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_scdc_helper.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/drm_scdc_helper.c b/drivers/gpu/drm/drm_scdc_helper.c
index 48a382464d54..033a9e407acb 100644
--- a/drivers/gpu/drm/drm_scdc_helper.c
+++ b/drivers/gpu/drm/drm_scdc_helper.c
@@ -34,6 +34,19 @@
  * HDMI 2.0 specification. It is a point-to-point protocol that allows the
  * HDMI source and HDMI sink to exchange data. The same I2C interface that
  * is used to access EDID serves as the transport mechanism for SCDC.
+ *
+ * Note: The SCDC status is going to be lost when the display is
+ * disconnected. This can happen physically when the user disconnects
+ * the cable, but also when a display is switched on (such as waking up
+ * a TV).
+ *
+ * This is further complicated by the fact that, upon a disconnection /
+ * reconnection, KMS won't change the mode on its own. This means that
+ * one can't just rely on setting the SCDC status on enable, but also
+ * has to track the connector status changes using interrupts and
+ * restore the SCDC status. The typical solution for this is to call
+ * drm_atomic_helper_connector_hdmi_reset_link() in
+ * drm_connector_helper_funcs.detect_ctx().
  */
 
 #define SCDC_I2C_SLAVE_ADDRESS 0x54
-- 
2.33.1


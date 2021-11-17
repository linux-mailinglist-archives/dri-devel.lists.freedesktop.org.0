Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16809454931
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 15:50:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 235F36E334;
	Wed, 17 Nov 2021 14:50:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E936E0F5
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 14:50:48 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8F93158099C;
 Wed, 17 Nov 2021 09:50:47 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 17 Nov 2021 09:50:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=0dVVB/OyUykQQ
 BayNdwbSTIU/wmtxvli48qZr0+pxgg=; b=EeGbwviuAy5jgHg8MBhlQFZoxgmpA
 JdN6yQ9RBOSE+1J8PvAx0lg5dqBlYr5euIyFeixFu5B8c85T1aMetvFqDaMwVqGk
 7XN+FslUjU+vTvP6jkuc6i669OjzjjtWNtUXF5/bd5fSIVjwbcL6Mf4/HNJiD7/M
 U461eqjz+2svtQlSwl5pV9FJZfjP7YbVrpmg0wOrvNHefhOy8meDFUO8NfCyaFLj
 +C0NoukZf/Jlc+JeOWvBc+zUIWj3QCXZrpXfOszz9OagS1mLanTl1+WcAnDU6yNL
 Jefe8A5/VI68ysDgpa8z3gEcNVvy9nMqg46ak5Ks8KDsNnn2YUG+/Fh6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=0dVVB/OyUykQQBayNdwbSTIU/wmtxvli48qZr0+pxgg=; b=b6peocAw
 DIfc7iCiklHWp4zY7aoqndHVXXBTIIb1XGNQ+eEYTnVOwhwO/nybckDK5P6IyAg8
 apJj3hNbo8eF1d7GaMy9G0/W+n6t0aTcILmykjkneRXFEAF758ubwTaPLjLx4U1p
 GhybbevyaQojWZ/Asom1OSzGLbiLVkLlA+Ot4je6v1JD4fxkwjL9HBm3znpMrWoQ
 3b0UCFNC3WQks70BIoNZz83iWMWJW4pVuKI7Q1+WSrR09vHVEQjN87JRjp9owE2b
 vVDBkpNy6J0h8wmvOmp90lXl/zYBy2oVSX5wOww4kDWlUosU9fw7u7YpTxskHyRX
 TTLL3Rysfn121A==
X-ME-Sender: <xms:xxaVYdfY5Op2u0A8gPMXsPtucEzwmm72KtYdIfpE9GfPIEjQkN66dw>
 <xme:xxaVYbOZaz4Rvi3ibk2FdECmVvl_pT8E8CnexQi8SZNeQjzsdKxVzAP4DeWEi2qIt
 6v5vU57PWW2oV4t4Z4>
X-ME-Received: <xmr:xxaVYWibSyJORSbUyzDD1QZTnqtPSh4R1SSDQM7rjcvE9CTLOODU2gNNQNkvlpNoFMtUMSqJjawgSWmV4-_0osOZ0I21sryG0S4A7wO0M5E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeggdeifecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:xxaVYW8HlEByxqNlzC_JrkHsxXLuTQo5Lp8tqoGrwy9TdXUWu-ojuA>
 <xmx:xxaVYZuoTNZkJ_5foe4i_1fhPAo6hPxzbnQereoshA5EiRhkcgJoIg>
 <xmx:xxaVYVGo6XcuWWRZJql0HdYUvkULR4z0MQ0XulbZXulEdCwZbuAd3g>
 <xmx:xxaVYUl1Ib5ICI3kdxSlkwHBnzl9DNBdRFAeMHe5pWu9MOdnSDmQBQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Nov 2021 09:50:46 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Scott Branden <sbranden@broadcom.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Ray Jui <rjui@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 2/5] firmware: raspberrypi: Add
 RPI_FIRMWARE_NOTIFY_DISPLAY_DONE
Date: Wed, 17 Nov 2021 15:50:37 +0100
Message-Id: <20211117145040.334827-3-maxime@cerno.tech>
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

The RPI_FIRMWARE_NOTIFY_DISPLAY_DONE firmware call allows to tell the
firmware the kernel is in charge of the display now and the firmware can
free whatever resources it was using.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 include/soc/bcm2835/raspberrypi-firmware.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index 73ad784fca96..811ea668c4a1 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -91,6 +91,7 @@ enum rpi_firmware_property_tag {
 	RPI_FIRMWARE_GET_POE_HAT_VAL =                        0x00030049,
 	RPI_FIRMWARE_SET_POE_HAT_VAL =                        0x00030050,
 	RPI_FIRMWARE_NOTIFY_XHCI_RESET =                      0x00030058,
+	RPI_FIRMWARE_NOTIFY_DISPLAY_DONE =                    0x00030066,
 
 	/* Dispmanx TAGS */
 	RPI_FIRMWARE_FRAMEBUFFER_ALLOCATE =                   0x00040001,
-- 
2.33.1


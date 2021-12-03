Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD404678D7
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 14:51:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FA4C7ADC9;
	Fri,  3 Dec 2021 13:51:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B9D7ADC6
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 13:51:32 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 42E075800E3;
 Fri,  3 Dec 2021 08:51:32 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 03 Dec 2021 08:51:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=0dVVB/OyUykQQ
 BayNdwbSTIU/wmtxvli48qZr0+pxgg=; b=LhsQ+GtDhypuNR/qxlWrY6eXxxPZ8
 N8WvBG0xFKKJz2zHMT2nbiJ8GtWemLa/DzgAlM8J2LbEyspL2MyUq8z7TqVSEjVU
 bJIL/hxP1qolX9+cmLOvNKds5LKObhzrnjB9dYLaNjZpkRQ465So9lmli76NVv7r
 VkP6utITkDQZe9zxfyHYp5PyD9OF7tZ9RNioKxJDGsX/GeTc/SOGGJksqd+3ZqYY
 4rAOKYuewQxlA74DUtRTvKHrXiVut4w38cVCUtOHG4mlDmRCiQSRVtV2ssVjDC/s
 g/L8dx36BHQXdA52iyKT3Uj1HAx3g6VgEKge4ZvDYSEZ61R8gAAuxhkuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=0dVVB/OyUykQQBayNdwbSTIU/wmtxvli48qZr0+pxgg=; b=mLkWuLdr
 N868uFApRKcUpl1Ogy0q8WEpd9KZozK7EYGrSV18QFUKrYvK3nW4RRF9o8EAYH8x
 ARoV0F0lEPl70rqDzgOUtr3acawUZrKnQtLMs9Ney/6Rw59PSftSxsXsl3vrySog
 JsWpBPElqoJUq2aQp8pget87RM+PKZCt6rZKbn+HeszRbWEO+GbDsknOwQz68v3t
 M3IsyjVV3TephyBml20JMB/p/fmfPTjSZulX8odye8iOXOwRDhKkrd9wdDJ6tM7G
 ouCFfUIYG4xju7OdbVUgPVP6qF55AeLoNns4eMxUMIVycM0Yq21Wm8s+fWhEZ/nC
 s2sQGUDPUXYANg==
X-ME-Sender: <xms:4yCqYf4uEferhIGrAQJ8eoNn5wT7gsWAS7RP-OET0w1Vz0Y9kHr8bg>
 <xme:4yCqYU5Sp4CTKl_1X-hvASKSDhq0nmEcLnFBaEM5wp7ixRSDaEVkNsBJHIIjVNVG7
 78c9wnzS9dlDfDAySI>
X-ME-Received: <xmr:4yCqYWd3eJaZwfkI8ETcP0x0qgONgH06NvELqUywf2FzS2nqyscxYP3ceOZqAtsIcMDSVl5F66QGVCnjet3iZzSeAAhth0PWsmMRzTanp8B4kw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrieejgdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:4yCqYQLNaPY5PLuooOuUKkUj10waA9xwN4FZVVDC2O9sOSav6ulhsw>
 <xmx:4yCqYTLa6gjxPTWHwQu3rBsiTvOhIrs8UACHfmE4JWKZm8CpD59BVg>
 <xmx:4yCqYZxvBs82725Z4qFrX6G0GJmrMu86sr51Bro3sS1tYcPOGDnEJw>
 <xmx:5CCqYYDud3w7zXfh7K_6nuOJbqZOvgUjGj8ZncR0kcSC712MM927sw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Dec 2021 08:51:31 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 1/3] firmware: raspberrypi: Add
 RPI_FIRMWARE_NOTIFY_DISPLAY_DONE
Date: Fri,  3 Dec 2021 14:51:24 +0100
Message-Id: <20211203135126.700165-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211203135126.700165-1-maxime@cerno.tech>
References: <20211203135126.700165-1-maxime@cerno.tech>
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


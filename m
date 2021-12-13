Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEE54723BF
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 10:25:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E3810E619;
	Mon, 13 Dec 2021 09:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B8D10E643
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 09:25:14 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id B22982B0014C;
 Mon, 13 Dec 2021 04:25:11 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 13 Dec 2021 04:25:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=ou27pVwzd7MS6
 Se+Px0HBJeVzAhbZZsK9+FkURLYL6U=; b=GT17Pp+h7LI2KePn1RiW05qnhxmnG
 pnjA6McVw+q/BT5+YcTRIbMde5jpYa4MqOijkixtSNsiecFi3UhuJno8+r/NtSyd
 ABeIar+El5QpIPeZVNn4dRgQ7Zn0gQq2kuhNNuRILxH16SNf6uTePYOKFxtlHSpz
 tmKPDVdqADeXY6uzJaCyJZhhqDyaCTumJtq0yhnEr0uNp/njIiHhNan4Q+ak8b/M
 DmM13s7abKfsxVHRVcY/CFMk9pXKu/znZ5wOToaLnfgIUdC6zncUu3JCU5OgAKwm
 HnI/zCwEtGZ9iMOQizO9rnHjm4SWutjEnawYK0RT3LiGf8AbwqnUX8kLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=ou27pVwzd7MS6Se+Px0HBJeVzAhbZZsK9+FkURLYL6U=; b=QV3+3fYT
 HEAaB0nAVwTELqx9rnVhp5JTZl83A1+eOeAyqggXNuk2JhNaxZ0iKgz33N2tpyNH
 1h4hUwG9UA4poZAKTG/AhNjL6+VMIGVOujT38zjHdl15sgwojhATgEtodLFmju9n
 d8tbAKWwwu2LH5LsesoOBmhdYw7bdAH16KKv6VRnpZayV9m3GvbwaOs6k95GVmx3
 i0ovAVCzjGiYwc+4SrRzjAFQmHSo5QCYN5OaHl7q2kzsQ2V5CTIv/FDuW2UPXHUr
 uBQoHNDrFNzTSTynzq7kQFifUmC8y3gqI2uGrxSECMbHnhT+nvkI4+VFH0OdIHY/
 tdVNViSNLzpDkA==
X-ME-Sender: <xms:dxG3YaHGyYsWhIKio1eGpss8ijf5KdZxJI8vNy4OvqO6vm9_wTo4yQ>
 <xme:dxG3YbVUwM9SF_JBq7rHVsL3aN1JwvRGj-4jPYY8Kifp85QREWZK1hrKUdK204PBN
 gsmGitE7sCf4VOjDR0>
X-ME-Received: <xmr:dxG3YUIHO0W517JmDl0vDJvM4YWxn3KzdxoVTTVzSWYfNnO0Xfgzk3TFBfblFJ-E8K_w8Xtj39s0iyPphIVmfX2w8EeWO4G5UAcjwZu3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkeekgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:dxG3YUHPYrRetTRRdLWkOT8aEdo65y8cGuak6zyoPqMjyltBC4P9MA>
 <xmx:dxG3YQVpdj4Q0avo6OleosFAv12-PFhHmVEK7nC4hJAhu0-B35Hygg>
 <xmx:dxG3YXPRR6KsneeQhiB2guDLtxZYc0SItlniKvmirpTYKYa0JGZayA>
 <xmx:dxG3YXNXD2Fpi4JeBSxVrH-Fk4HOkXG642cv8sjut0uAtxCfwEVcAAfEBCk>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Dec 2021 04:25:10 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Ray Jui <rjui@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Scott Branden <sbranden@broadcom.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>
Subject: [PATCH v3 1/3] firmware: raspberrypi: Add
 RPI_FIRMWARE_NOTIFY_DISPLAY_DONE
Date: Mon, 13 Dec 2021 10:25:01 +0100
Message-Id: <20211213092503.57379-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211213092503.57379-1-maxime@cerno.tech>
References: <20211213092503.57379-1-maxime@cerno.tech>
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

Acked-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
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


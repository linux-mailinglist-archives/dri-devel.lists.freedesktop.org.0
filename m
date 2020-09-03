Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E8025D20F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:13:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F156C6EAA0;
	Fri,  4 Sep 2020 07:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9471C6E199
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:03:17 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 66119C02;
 Thu,  3 Sep 2020 04:03:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:03:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=nDtwCT/GEboFZ
 6h2FalfKwFluMDJ6O4H2K3IGSnhOgU=; b=aSZDAT6IIt7QAKKa0fxFrWzYUyVxP
 RlF6FVPu7j7kuJVO0jYhI5UoqtUngHrP853CCqgjBvXTwMKnACN8qYUTcRefbiIB
 3seXWGvU7CAVyZaKBl2pK9HAW6YgMydhju8f7U0kU4jctfGHRWqdiMT/x3Xuntq4
 NEV6xmqX8cvG2424ECzzsP4ovIdZW5bhym5G78Sy4S23n+olAtrribyWr1oB7T6R
 xcfuDobP0OWk3R4Es50e3uMuPZoS2rwR79egm5PjOqNlX92iOCyYWwjx5Ep3md+G
 lC5fiFcJVK11kW4837wYSpzZwcPXinHwZRwRsPZsvgUixfmVgeUYcDPZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=nDtwCT/GEboFZ6h2FalfKwFluMDJ6O4H2K3IGSnhOgU=; b=Wg4thRAp
 wWoeQ0tYAbvzXY7j6OkSI6PrrkwcDBNFsZlcu6lg00soOM0vfX7zw27/FuHj/5z/
 e6wp1ctGGnkCA++f4r4Tj3mGmizlUbreWMrfSCkTdXXDYcQl7cSTk4vTM1H1zt6r
 nWWE0orYiaCAGKoxl9BwkQLRgIPlYYxSEQHtOciZh9VDrtf6L0caCPdFSrNYEaGS
 On8lJvyc37JvnpBhfYXr2imAnsYfpVUa115F8cDXBlrlfXFJAa3xn7hcsrKkmCU9
 IubY9QQ4OTRk6OVIMvhKTfPhv+UDgRL7eKEswsx54Lcr8+e9M2IQyzT68Qpt2vDP
 1Ng5Hw39TX5JIA==
X-ME-Sender: <xms:Q6NQXxXrObUoGXq7WF4R0TG5nWk81IbusJz4raYQcUzM8wA6F1Q5zA>
 <xme:Q6NQXxkSMGixEvqTiVIjoqploIs0M-_XJvHZ4nwlTvxhu1NhRf0eSgAOZfhSxf74l
 CPltfzFoD9vApW7Yiw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpeehge
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Q6NQX9aCJuHC8hn8qKQkwlZclnU0R5bZVUfj9J5hEnTnmdx6QkOpSA>
 <xmx:Q6NQX0VlHe0CGLTgCGI7jcIDyY7Yti9-XDnEHwDobvZrMFkulcBb5A>
 <xmx:Q6NQX7ngX8y9n0m4XSA8cW9F2HGX3jYd963WeW4J-5q4gOrw1uQ0Bw>
 <xmx:RKNQX5cHEIEUKuBC_HQxY01eKBz0zS2nXam6HFYJV460s5LENdhEZSrUDaY>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A6428328005A;
 Thu,  3 Sep 2020 04:03:15 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 58/80] drm/vc4: hdmi: Deal with multiple debugfs files
Date: Thu,  3 Sep 2020 10:01:30 +0200
Message-Id: <9505c1eb40b3ef3709277bf9e8af77917b249c32.1599120059.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Sep 2020 07:11:29 +0000
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HDMI driver was registering a single debugfs file so far with the name
hdmi_regs.

Obviously, this is not going to work anymore when will have multiple HDMI
controllers since we will end up trying to register two files with the same
name.

Let's use the variant to avoid that name conflict.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 5 ++++-
 drivers/gpu/drm/vc4/vc4_hdmi.h | 3 +++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index f6d18bdbd1bb..4d0b44a2ac61 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1369,7 +1369,9 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		goto err_destroy_encoder;
 
-	vc4_debugfs_add_file(drm, "hdmi_regs", vc4_hdmi_debugfs_regs, vc4_hdmi);
+	vc4_debugfs_add_file(drm, variant->debugfs_name,
+			     vc4_hdmi_debugfs_regs,
+			     vc4_hdmi);
 
 	return 0;
 
@@ -1447,6 +1449,7 @@ static int vc4_hdmi_dev_remove(struct platform_device *pdev)
 
 static const struct vc4_hdmi_variant bcm2835_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI0,
+	.debugfs_name		= "hdmi_regs",
 	.registers		= vc4_hdmi_fields,
 	.num_registers		= ARRAY_SIZE(vc4_hdmi_fields),
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 0d529db4b3ab..794216f3228d 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -30,6 +30,9 @@ struct vc4_hdmi_variant {
 	/* Encoder Type for that controller */
 	enum vc4_encoder_type encoder_type;
 
+	/* Filename to expose the registers in debugfs */
+	const char *debugfs_name;
+
 	/* List of the registers available on that variant */
 	const struct vc4_hdmi_register *registers;
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

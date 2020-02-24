Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 625DC16A2C1
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:41:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE94D6E366;
	Mon, 24 Feb 2020 09:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53FDA6E1D8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 09:10:30 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 59A93640;
 Mon, 24 Feb 2020 04:10:29 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 24 Feb 2020 04:10:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=8vnyvQchUM5GD
 hGpfg5Wl2vkK3QenNvOhFfrgj3MyFM=; b=cE2uRva7yTkvzp8Ykf+Ux+LDOmcl4
 n0l+mazPkzN6E4rC2LSteF4lrm0JIxZW6jdzR1yWXSy1kB5UdEI/S4lzz0r6WboY
 0OosIa1si5ZBDoNRRQUvzyY2nlZNs9HK9h3hRsGV5W26GlwlcMMb7CCoIE0kCmct
 C+mHglTl75qgTrGLWHBr7Ew/xDa1uLCX2JDbhkI/NzCz+WQhOiyPYlM0myfZWONR
 UPgYzYIet8E32cP+zXMORqbjZXzB8YaeswxWa49+peEqaZOW26dCwuyPIBZK7LNL
 Ges+mbDE7gHVMFD9u0++y9Aw6BtV/v+MbExPXjW/M9H0Qk7wT6IpoTvFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=8vnyvQchUM5GDhGpfg5Wl2vkK3QenNvOhFfrgj3MyFM=; b=t8vMOezo
 blP0DN8+yN8ocQmvMfGnh5/kaHowwsy1J5YuZrGk7wVoSqZQNz5atSH+3zsPFeck
 FdlqIim3+jKlGwRzERXBij4uFbRnncpurjfAx93fsYW1zbc2Nw+37emm3K7Dm8Lq
 aD1lRPG6MOCLZD9klqg7y9R05sWK9heWWv+zao8TXyi9tQezwT3jeHL+YBQ6vpT+
 4UpXB6CZ3QaRtE4FMbvoLOcRP3g5yHIk+afAxan54mASRcDiRkuggyfyNWwgebUz
 rn+0rRO/mquXnFbJ8EB9oJyt0KhWzZxCAtgxZTaSMyRh+yUesjVVaNzXUfzFSdb1
 3TR4/mQzlYNBOg==
X-ME-Sender: <xms:BJNTXjw6Qn978-Mpmv-cphP71dv_peXCoCRg5AkQ-whY6Rf5x8AUPA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhi
 phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgepjeenucfrrghrrghmpehmrghilhhfrhho
 mhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:BJNTXlUmL2bhe_SP3yGh4Kgzl7y7R692cfuvUU79zu8IJ_ukmhboRA>
 <xmx:BJNTXsbLG08h5eXEbotU-DB0lZ5yfmntJ0atNYdZ-44L5Vqdk6CJYw>
 <xmx:BJNTXloa3evRfJA67MAFRnhXL1sld5XCSCWx06jvr-JRZnhHph2MTA>
 <xmx:BZNTXnABFTDo5hCCvnhOaRI1HFnkwkZRIcNCUjpRLm2DvRjGEZ6-Cco8ZT4>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 966E23060D1A;
 Mon, 24 Feb 2020 04:10:28 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 69/89] drm/vc4: hdmi: Pass vc4_hdmi to CEC code
Date: Mon, 24 Feb 2020 10:07:11 +0100
Message-Id: <fbd516a0242c2607ee4c56a960e89e5da71a4e8c.1582533919.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:39:03 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Our CEC code also retrieves the associated vc4_hdmi by setting the
vc4_dev pointer as its private data, and then dereferences its vc4_hdmi
pointer.

In order to eventually get rid of that pointer, we can simply pass the
vc4_hdmi pointer directly.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index e3f81cbcbe6c..9fec97a328a7 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1028,8 +1028,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 #ifdef CONFIG_DRM_VC4_HDMI_CEC
 static irqreturn_t vc4_cec_irq_handler_thread(int irq, void *priv)
 {
-	struct vc4_dev *vc4 = priv;
-	struct vc4_hdmi *vc4_hdmi = vc4->hdmi;
+	struct vc4_hdmi *vc4_hdmi = priv;
 
 	if (vc4_hdmi->cec_irq_was_rx) {
 		if (vc4_hdmi->cec_rx_msg.len)
@@ -1068,8 +1067,7 @@ static void vc4_cec_read_msg(struct vc4_dev *vc4, u32 cntrl1)
 
 static irqreturn_t vc4_cec_irq_handler(int irq, void *priv)
 {
-	struct vc4_dev *vc4 = priv;
-	struct vc4_hdmi *vc4_hdmi = vc4->hdmi;
+	struct vc4_hdmi *vc4_hdmi = priv;
 	u32 stat = HDMI_READ(VC4_HDMI_CPU_STATUS);
 	u32 cntrl1, cntrl5;
 
@@ -1096,7 +1094,7 @@ static irqreturn_t vc4_cec_irq_handler(int irq, void *priv)
 
 static int vc4_hdmi_cec_adap_enable(struct cec_adapter *adap, bool enable)
 {
-	struct vc4_dev *vc4 = cec_get_drvdata(adap);
+	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
 	/* clock period in microseconds */
 	const u32 usecs = 1000000 / CEC_CLOCK_FREQ;
 	u32 val = HDMI_READ(VC4_HDMI_CEC_CNTRL_5);
@@ -1139,7 +1137,7 @@ static int vc4_hdmi_cec_adap_enable(struct cec_adapter *adap, bool enable)
 
 static int vc4_hdmi_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
 {
-	struct vc4_dev *vc4 = cec_get_drvdata(adap);
+	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
 
 	HDMI_WRITE(VC4_HDMI_CEC_CNTRL_1,
 		   (HDMI_READ(VC4_HDMI_CEC_CNTRL_1) & ~VC4_HDMI_CEC_ADDR_MASK) |
@@ -1150,7 +1148,7 @@ static int vc4_hdmi_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
 static int vc4_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 				      u32 signal_free_time, struct cec_msg *msg)
 {
-	struct vc4_dev *vc4 = cec_get_drvdata(adap);
+	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
 	u32 val;
 	unsigned int i;
 
@@ -1320,10 +1318,10 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	ret = devm_request_threaded_irq(dev, platform_get_irq(pdev, 0),
 					vc4_cec_irq_handler,
 					vc4_cec_irq_handler_thread, 0,
-					"vc4 hdmi cec", vc4);
+					"vc4 hdmi cec", vc4_hdmi);
 	if (ret)
 		goto err_delete_cec_adap;
-	ret = cec_register_adapter(vc4_hdmi->cec_adap, dev);
+	ret = cec_register_adapter(vc4_hdmi->cec_adap, vc4_hdmi);
 	if (ret < 0)
 		goto err_delete_cec_adap;
 #endif
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

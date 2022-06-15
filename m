Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8C454C0E7
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 06:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3404B10F7BA;
	Wed, 15 Jun 2022 04:55:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D2510F7BA
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 04:55:51 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id A298F320096D;
 Wed, 15 Jun 2022 00:55:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 15 Jun 2022 00:55:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1655268949; x=1655355349; bh=vx
 67vaRjPe5jJUHZJSR0JmsWvIkH3E5HlZjLsIE7qUI=; b=mBJUMoKhx3q8L9kmP1
 N+ixlvzimsWkMpYIr5Ah79Vky+oKr0bSv7gK6T5ZSf32bPUvLif7BLQAIrN4kpgr
 GKkfUN2fVoe3D/vW8WOO4PbuPA/SEOM09QJ3QE/405drHabFXl+qXHKYq3UOW4uf
 LQ9RwutZVVKjUIsdiFgd2Bm71iFQeTT4bPUiDLfRgH1NlskgqRRUdF9/2qplQq8p
 clI2AjMrD32MNmUaGW1M09lP8QeimQroy6umi1af+2Udm2n1JBcynlb090A19f8C
 s14P0lEc/hm5XMxjB4EjGMwHVMtxa46xmmxImfjWziGQv+iQCd7L7Y4BAAeckygo
 z1tA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655268949; x=1655355349; bh=vx67vaRjPe5jJ
 UHZJSR0JmsWvIkH3E5HlZjLsIE7qUI=; b=IVS/1kP7+yPMDeVPBETxpANATY/7a
 13Zby4MNbOmh8Wrmh2cB7fmUDnN2zI8seTYt/xECgOBll6rlMsZ1oZO9Lb0RsRB2
 C9rqV7xytf2iqKnkGTuGJ57+pO6nb86eUPFrBDZQTE//wbjVGOIY1lmnUqZshmkC
 zY+j/xFj1BDChk9fELch/Oictiu1h2eToib18SijOa9JCx8B3uRD4fc32p9vRPck
 e0knZOp0QTOuV3sxTjF2xsuWIMAkb799WmCCgZIuxFTbgBZYpQRD8zGL/QmNQJtH
 4wCsyeIaGbitrhfHwf/IOlISz1H5w1JIiTKuHNcQluo2QbFVvJWKDH1ww==
X-ME-Sender: <xms:VGapYpBUZWfBlR3q6OciMHsdLMg7DRN__x1tMWoMTZChHyFejzT-Hg>
 <xme:VGapYnh91Cw74IM3i7X_j4VNy6J4wyu1Hdr9T8_dG8I0s_UNnZMOFU8kmLhz-NIu9
 uPyAPwvxytr46P51w>
X-ME-Received: <xmr:VGapYkmUM7ESxuV_lXQcZRMe4q2YIKMpfPwOuIXFMA69XRMimQsmpGBpjme1eTbl3X7PVa30G3m6EnMZ0TvEf0B7vMaVjRUZhIuO6EM811_15ahSje5zWII2eulD8TuLfCeAMQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvtddgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
 vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
 ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
 udefiedtveetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:VGapYjwlXxCX1vO-1OQx12hnJg7XaFvm1oCBtnqa5QsogrhW9Vv6aw>
 <xmx:VGapYuSGigvm7f8tzV3_WfmRjVOLhTqn1yZc--dQ3zFcQlJdt7QNqQ>
 <xmx:VGapYmbjQvIFOWeRo4BqxcNFnP7bEUm-hZKUHCL9MzZfUhVImcjoyg>
 <xmx:VWapYv8MuGJ9URJECLZDCpHZs93hYl8QCf41_7g57Vs7yFf2ZNLt8Q>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jun 2022 00:55:48 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 1/6] drm/sun4i: sun8i-hdmi-phy: Use of_device_get_match_data
Date: Tue, 14 Jun 2022 23:55:38 -0500
Message-Id: <20220615045543.62813-2-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220615045543.62813-1-samuel@sholland.org>
References: <20220615045543.62813-1-samuel@sholland.org>
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
Cc: Samuel Holland <samuel@sholland.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that the HDMI PHY is using a platform driver, we can use the usual
helper function for getting the variant structure.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v1)

 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h  |  2 +-
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 11 ++---------
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
index bffe1b9cd3dc..0adbfac6eb31 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
@@ -173,7 +173,7 @@ struct sun8i_hdmi_phy {
 	unsigned int			rcal;
 	struct regmap			*regs;
 	struct reset_control		*rst_phy;
-	struct sun8i_hdmi_phy_variant	*variant;
+	const struct sun8i_hdmi_phy_variant *variant;
 };
 
 struct sun8i_dw_hdmi_quirks {
diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
index 2860e6bff8b7..4553e04144fe 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
@@ -565,7 +565,7 @@ void sun8i_hdmi_phy_deinit(struct sun8i_hdmi_phy *phy)
 void sun8i_hdmi_phy_set_ops(struct sun8i_hdmi_phy *phy,
 			    struct dw_hdmi_plat_data *plat_data)
 {
-	struct sun8i_hdmi_phy_variant *variant = phy->variant;
+	const struct sun8i_hdmi_phy_variant *variant = phy->variant;
 
 	if (variant->is_custom_phy) {
 		plat_data->phy_ops = &sun8i_hdmi_phy_ops;
@@ -672,7 +672,6 @@ int sun8i_hdmi_phy_get(struct sun8i_dw_hdmi *hdmi, struct device_node *node)
 
 static int sun8i_hdmi_phy_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *match;
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
 	struct sun8i_hdmi_phy *phy;
@@ -680,17 +679,11 @@ static int sun8i_hdmi_phy_probe(struct platform_device *pdev)
 	void __iomem *regs;
 	int ret;
 
-	match = of_match_node(sun8i_hdmi_phy_of_table, node);
-	if (!match) {
-		dev_err(dev, "Incompatible HDMI PHY\n");
-		return -EINVAL;
-	}
-
 	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
 	if (!phy)
 		return -ENOMEM;
 
-	phy->variant = (struct sun8i_hdmi_phy_variant *)match->data;
+	phy->variant = of_device_get_match_data(dev);
 	phy->dev = dev;
 
 	ret = of_address_to_resource(node, 0, &res);
-- 
2.35.1


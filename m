Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBC54FCDF1
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 06:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9543A10EDE9;
	Tue, 12 Apr 2022 04:28:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E8D10EDE9
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 04:28:54 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id F20353201C39;
 Tue, 12 Apr 2022 00:28:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 12 Apr 2022 00:28:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1649737732; x=1649824132; bh=uC
 Q2R2fyjy+uTBpLAiBmpciTr9WrThWXS0olngIbwR0=; b=PxbkG77kAiBB2SYrMy
 PXjtgJlgMEvRZ4GyUZF6C9X4NB7sXQF4idpm1tnMo3NZsabyagfqeKWF/almajMp
 AyWIzQYBkUFfsnR0dXozz8u13wT6UBY33mZIxMoitkZFq+7bh9npwGiE+nXit+En
 O40XRbXzDDI3QTYuMVpxedji6QYvdW40rqMmmIC83X7f6+YZXY540lNBtfHUEuX8
 fdUyRBzrt1DZhBhuIt3tdwLMDGYFKltX+XbLRfp4OIrteT5K2QRRxHoI+kFPErCi
 3uKR7BTIY0jHPeISDmRNe4vCPzC1WMH09R7+RKvDUyuzESSRe10vC07wJE1H+MEg
 Oeng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1649737732; x=1649824132; bh=uCQ2R2fyjy+uTBpLAiBmpciTr9WrThWXS0o
 lngIbwR0=; b=aWXKsr6fPJdHok2xnmJ3yIXOEn+2xz5/6v1BYiD19YQxkDdAxVP
 D9rN1t2qiTeZMhY8UaS8MwVbDyqODDX40qx2LaNOgLcx0g4SoesdWbODHp6Ox/XV
 9LeUo5zrsycZ57RnjSjs7rNyVdbAflh0hDeeDmApenJ6RxsGNKCKQUo11e0v3T7L
 W7eTjIx73eUU3qYpi1VQgHzsOlWmKDuVmu5wUhkJkw69R+QXLpQFDV/dEDTPQwbI
 WTIvhMmhzvXDJlnBRP8sTP+tOGva1m+t9IMxJy9yGUueNBS22okaAxgFx5w2xow+
 eQhT3SagEdS0VAzbu4nKW1ALHcXI8DmP/iQ==
X-ME-Sender: <xms:BABVYiiqMojB_pt-xD632XEtZa_h4G6YBE-OKeuRgGL70xFmym0toQ>
 <xme:BABVYjB_SFeT7fD-oeGByts1_MwcQ6CUwFcbS8pWH7B09ndBD_EIfhVU4tJ132mpO
 n9c3lIXLXyOEywbpw>
X-ME-Received: <xmr:BABVYqGfwyNn3DjY8VapfUXYYQW9QOGbLwEO0BmfsqAO2dL9zskQ6rIaGaO2H0qq93pbadRsstEHEV3MVH9ohbY1ufBn3hUpuYDjYBMxLUQMopsPouAjkLgRUU5sEgKpLY-VUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekjedgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:BABVYrQJBQez9vfExePX7Cqqr-IAyvVsiIuDDXgWQoDhBZCoY2quwg>
 <xmx:BABVYvydEMqrQFaYDoIwrtpBoQbB6m_6mg-Mp3LuMv2uK0RJ4H9kYw>
 <xmx:BABVYp5IOqSADyOlzWyPxpuD_u5OXTC6YeKYxQRYxEazyTDcv1UdFA>
 <xmx:BABVYt6-i43_hWXayWvEo5yi5Eak542nZMdUhOwydGdXq7S8hE32Vw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Apr 2022 00:28:51 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 14/14] drm/sun4i: Add compatible for D1 display engine
Date: Mon, 11 Apr 2022 23:28:06 -0500
Message-Id: <20220412042807.47519-15-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412042807.47519-1-samuel@sholland.org>
References: <20220412042807.47519-1-samuel@sholland.org>
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
Cc: devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that the various blocks in the D1 display engine pipeline are
supported, we can enable the overall engine.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v1)

 drivers/gpu/drm/sun4i/sun4i_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 6a9ba8a77c77..275f7e4a03ae 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -418,6 +418,7 @@ static const struct of_device_id sun4i_drv_of_table[] = {
 	{ .compatible = "allwinner,sun8i-r40-display-engine" },
 	{ .compatible = "allwinner,sun8i-v3s-display-engine" },
 	{ .compatible = "allwinner,sun9i-a80-display-engine" },
+	{ .compatible = "allwinner,sun20i-d1-display-engine" },
 	{ .compatible = "allwinner,sun50i-a64-display-engine" },
 	{ .compatible = "allwinner,sun50i-h6-display-engine" },
 	{ }
-- 
2.35.1


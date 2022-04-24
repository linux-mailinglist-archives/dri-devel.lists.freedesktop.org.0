Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C05A150D34D
	for <lists+dri-devel@lfdr.de>; Sun, 24 Apr 2022 18:26:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E983310FCBB;
	Sun, 24 Apr 2022 16:26:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0255810FC85
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 16:26:44 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 38A295C010D;
 Sun, 24 Apr 2022 12:26:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sun, 24 Apr 2022 12:26:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1650817603; x=1650904003; bh=IO
 2nJQg7ZpLgbDDCjHzDR4pLdHAIP+lsCx6T8EE6RlY=; b=ZM+7HkG33TFGd4SnTl
 pPu0uPke8mtVg/q7fHqDEd4Fuerod5HZNJJkvnTmHf+DYpdqtWwX2Su9M6LQBu54
 +3NFgTgVCDbmnofc9D7okjWLGEJnLwgHa/Ypj5XTQtVPOais5oZf89pxirbXaIQn
 cuFJDUXBw6x6q/I6iEcJLUGWXV6IPIqkLKy/4eNdIZ5vnq9n1iG6DfWCbtLfqRhp
 VAFCTTNlKmLxUxYnTka3Lzj/Qy6fQ8bBoDyEpASMYwZ6c/rhRLmQkf01Gz3b02Ry
 PpeHNxD5pS3SgjNyTIyzeDwOqwghaP3C18WXFTbNO20IFJs1HH3QBHW1atm5PwLo
 uMZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1650817603; x=1650904003; bh=IO2nJQg7ZpLgbDDCjHzDR4pLdHAIP+lsCx6
 T8EE6RlY=; b=L8MCGD/7ZVhcs26x/u62cYKUgqkuivZgDan7O/ye4vQcSXXZMRO
 ZrGYYFd+a/MA9piLbpJVpWoZuPLzB7AxwH1ql2V8qf1oV02XLom3kOMUTedkmD5U
 89blgeCjkG1bXKt43BmYJaulQdRXpQTw1bgKVfTbptkAGN0TQLf39uGRw6pspQh6
 MXIsHYBWlBz8Wz+feeC/x3MT4GCfnMqGFTniRsvlam48MVuCdqU0r0DJUgtGdckp
 GQ/clLFrNWC9obt9nQbhgpIeyXdqkxsrDbos7omOq/jVmUtNtRw9VBchXeB95s2x
 2m4YipgN2dBCI1rW9+qKGB74S5+GV3wbDjA==
X-ME-Sender: <xms:QnplYrTc9k-ZPLvvwXcRl49MCVebuWMLHB-18WxHKjrP9T9_2PdaFw>
 <xme:QnplYszMS6zmimrNapONfzh7Isxd_-pQpXIFfDafD4491brvehvfLsh4hbN7FhEXC
 zXyQJ75otrishtkIQ>
X-ME-Received: <xmr:QnplYg3TtSFxucDRsGsRJfMtbDB92AkXEcDpojxmO7vdxH0d5m0LFGnsLXMEoCQSV5ZgHu8KnlQoG_SyXe1SkyMyDOWux9rlaiPK4PAZkgyD3nh9Bukwvml0-d_YobD1Y5_bzA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtdelgddutddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
 vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
 ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
 udefiedtveetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:QnplYrD259CHuLpjZNTIEWIzWt7kvqXHceZjL9NErgFm4Ud4Xwiwug>
 <xmx:QnplYkjt6aDr6YZOKIU9-dq5WowyQ6HsWKhC4L-p6j8hM0xHCKv9TQ>
 <xmx:QnplYvpTD14rpKvHaTbTOg8f61BIreYhhskmZiDf47g7AaKQJdvzVA>
 <xmx:Q3plYladtEsIaI8A1_V6xhKEShefKJpHiZklHl2GQEVEYiYqMkBJCA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 24 Apr 2022 12:26:42 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v3 04/14] drm/sun4i: hdmi: Use more portable I/O helpers
Date: Sun, 24 Apr 2022 11:26:22 -0500
Message-Id: <20220424162633.12369-5-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220424162633.12369-1-samuel@sholland.org>
References: <20220424162633.12369-1-samuel@sholland.org>
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
Cc: devicetree@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Samuel Holland <samuel@sholland.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

readsb/writesb are unavailable on some architectures. In preparation for
removing the Kconfig architecture dependency, switch to the equivalent
but more portable ioread/write8_rep helpers.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v2)

Changes in v2:
 - New patch: I/O helper portability

 drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
index b66fa27fe6ea..c7d7e9fff91c 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
@@ -56,9 +56,9 @@ static int fifo_transfer(struct sun4i_hdmi *hdmi, u8 *buf, int len, bool read)
 		return -EIO;
 
 	if (read)
-		readsb(hdmi->base + hdmi->variant->ddc_fifo_reg, buf, len);
+		ioread8_rep(hdmi->base + hdmi->variant->ddc_fifo_reg, buf, len);
 	else
-		writesb(hdmi->base + hdmi->variant->ddc_fifo_reg, buf, len);
+		iowrite8_rep(hdmi->base + hdmi->variant->ddc_fifo_reg, buf, len);
 
 	/* Clear FIFO request bit by forcing a write to that bit */
 	regmap_field_force_write(hdmi->field_ddc_int_status,
-- 
2.35.1


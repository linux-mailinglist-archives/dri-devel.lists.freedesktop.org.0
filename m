Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 733FC160CE9
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 09:21:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C686E53C;
	Mon, 17 Feb 2020 08:20:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC716E5CE
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 12:09:39 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 1045D5D2;
 Fri, 14 Feb 2020 07:09:39 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 14 Feb 2020 07:09:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=2f3VFRjW3B+zONorxo3OTyEyy8
 z5poB18m7XL4T/tlo=; b=qBukKA+sxCmpiwup4xTPDCsXNr95YOzQdhyKS4YDYI
 OYuM4MEAbJ8UGQEikfoBqUJS8AweY/TAdPIDqmRRlS2njJBdNTSvcp7C5t45Hx6r
 Ml5cziFxxjoY4ueyKpok5eIlC2mWhjw1lM27hephl7nZLMECzHxE8rOfq+xCEVRy
 chaqEwj+x5UEkn6Qw0CwEaDytr5mtxIsJabXMLbg0ZlwCQ3GfkNSnwg+fBB+rera
 PPyi90sG3lRHlZ/aAmbgZx4b1ov64BugrWVdU76g+gLk4FnQmkZie58o+qZHAGr7
 V8pF3QfWhRuTQ7QEDbCiEKTclOC+3R1nv9GiJVb/NyYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=2f3VFRjW3B+zONorx
 o3OTyEyy8z5poB18m7XL4T/tlo=; b=14YBVnF7JMr1qIOUHNP6u9DxeGajjtExw
 CVwC8RAdx0tnaVfTveXtrrx0TfjYLKoO5hppd81QNlg9YLtZ4m3SnS9C7S7Ahtq5
 YGme/BrN41vTZV6STHt3JFgK2p9VVTSgs8f3771PDh6nrJq1Se0wscO5LX4xTK1r
 VmfpdnYzBPNFnu7w2cbdVTEPj0VTOYGzzGDesNb8+ai/8gonJ6L2e+nXMQQ9XtMl
 G22ZYYu7WMcbnnhuVYQcKOlaF2LG0VgZcRrCsfgLpPmQBOLAQe7VXPYSfFPkBXu5
 c3eI7J1sy7Fj+95gqpQbhJbdLx/DAs0ZlUaPkXSxHs9usLfWC07qA==
X-ME-Sender: <xms:Ao5GXjLEBf4LrkmbQmlkdG1Ie6pEcQvUfBPJhf9TY_nRNDn0b06J5w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjedtgdefjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhho
 rdhtvggthheqnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:Ao5GXpjhYJqoIwAnuPj6Ge-qEHj6TaJ2c0s-nr-gEaWIFPilhIj-iQ>
 <xmx:Ao5GXtLYmVa1m9aFdaWj6wuuted2irFxN42pXmRdPRPtwVEhsl-Kzg>
 <xmx:Ao5GXuEPZBDtbP8YJNmT8W2jOyeTdJz6XXEx99S1eKvmw-2fOIf41A>
 <xmx:Ao5GXhjc5NzqwfHvqXfYLZf4cd9PquV9Ync9F--3gyg6-iTBF0YJdg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id B97A0328006A;
 Fri, 14 Feb 2020 07:09:37 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/sun4i: tcon: Support LVDS on the A33
Date: Fri, 14 Feb 2020 13:09:34 +0100
Message-Id: <20200214120934.107924-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Feb 2020 08:20:47 +0000
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
Cc: Maxime Ripard <maxime@cerno.tech>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The A33 TCON supports LVDS, so we can toggle the support switch.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index fdf143042f83..14026b4fa7c7 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -1475,6 +1475,7 @@ static const struct sun4i_tcon_quirks sun8i_a33_quirks = {
 	.has_channel_0		= true,
 	.has_lvds_alt		= true,
 	.dclk_min_div		= 1,
+	.supports_lvds		= true,
 };
 
 static const struct sun4i_tcon_quirks sun8i_a83t_lcd_quirks = {
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

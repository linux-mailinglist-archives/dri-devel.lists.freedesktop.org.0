Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A45FD9258D6
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 12:37:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B5F010E167;
	Wed,  3 Jul 2024 10:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="hQm9DNPv";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="cMB5C7vN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh2-smtp.messagingengine.com
 (fhigh2-smtp.messagingengine.com [103.168.172.153])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C16E10E167
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 10:37:30 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id DA1CA1140299;
 Wed,  3 Jul 2024 06:37:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 03 Jul 2024 06:37:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1720003049; x=
 1720089449; bh=OgLrri9kd8QtW4gPLOxe2YyQSmJv4E1jU5C3+rByQXI=; b=h
 Qm9DNPv39eY8+Eu+uiUoMmTJPpim5TrP4dahVVjUNQFvmB6KLe8hNHCqLovDF9TZ
 LZYJNfSdiDftlKMUH5S7c1eUOcSITPr6hRtaqY4wkFEZ7isZtvdlz0u4/Qa07ku0
 kZLuDmhjTvrKuHUCAZBpgOGOzHrNBbTz47nsvQaZrVHsNZ3i1UGjFZvm4y7Bkxij
 YJeYO6XaZynBluwHp2+wPWe1nZ/iSlb2Z2tTSVliCklqr+E+KueXJwMsr+442Sna
 Yk7ncoy++7ix1xQbuWN8d45blZZv8t1OrDTb8hjzVIc2tutGmnW3zZ0e33MKA/Gp
 WBWpzSpI+S0oPa+X8npKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720003049; x=
 1720089449; bh=OgLrri9kd8QtW4gPLOxe2YyQSmJv4E1jU5C3+rByQXI=; b=c
 MB5C7vNFWD4OjXhFqhWg73mpqWLA/DC7iDMN2tj0ouFaTvj0awoDPdDyy8SXR2JO
 aM6rsgG52l6qCD4FCyd3eb8g2Tj0wY0VBbXHzAYxxwesGCt4xQS/dGCE7FXB/9kb
 OMHI9kFrQG8/fAsAmDHg41tvDgBSJA/ZjcfyCPfH3DXw3G2gA4mHV/ERJa4BJhnB
 AiFiFthZpV6oybHxTUSUIhMUY82ayxlpv4/IHuQJpevtdjI16be69PUMsgLISVVD
 0VIPopVlcnChZMevh9uPgDPMZJqo3XtBV18KFBP0d2UVozbVpGJeIaCw8EGTv7S3
 LmRTb795cPxSiOqumpdPg==
X-ME-Sender: <xms:6SmFZu4IjyLKFT9iEbRr77NSMrSwKS5TyRCm0FlmRQtDspCpT9NNRQ>
 <xme:6SmFZn69SiDz1jsKxYcfc5E2awUBMZOKkKD8fx84B_7IFYokEEOaTWybpwo4PSXqx
 BkaNYvm5iOs8A7PWw>
X-ME-Received: <xmr:6SmFZtc6mtGa7MaB8REKLSeIfyBuWpJwotfbMV1GDsHcG7ex_ghjAovohRapvOzGP61KjxhbBZzz-58zIHw4QybtvBku6IFdag6e7jNhzA3Tug7c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejgdeftdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcu
 hggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrth
 htvghrnhepffehieffgedtgfffjeetveegfeekleeileekveeuteffteetudffveegieei
 heetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprh
 ihrghnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:6SmFZrKjn8SASGd4pMlH8-P_e22AhIv1FzLq8cc1wGnisccFNQnVLg>
 <xmx:6SmFZiJjZqWwd0r22kN5ZDJDO07tsckf3iOg01ny-THwlIVx-zn2zQ>
 <xmx:6SmFZsxd58ncioPjKsS5rMd9rPiDCO-BeHjJ_sEKj8__YYlB9qCRdg>
 <xmx:6SmFZmLJdajLwPi4D3tupONmqVxJB13CW-s_tutk1KOVCXPfsS59zA>
 <xmx:6SmFZj4W-Al4YEvSwr2tlD6GtWWIr35_X6yCGn-4enPsnELRToT48xkM>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jul 2024 06:37:25 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>, Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 2/3] drm: panel: nv3052c: Correct WL-355608-A8 panel
 compatible
Date: Wed,  3 Jul 2024 22:31:45 +1200
Message-ID: <20240703103710.31169-3-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703103710.31169-1-ryan@testtoast.com>
References: <20240703103710.31169-1-ryan@testtoast.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As per the previous dt-binding commit, update the WL-355608-A8 panel
compatible to reflect the the integrating device vendor.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/panel/panel-newvision-nv3052c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
index ee0ce271205e3..6d119776f8bee 100644
--- a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
@@ -925,7 +925,7 @@ MODULE_DEVICE_TABLE(spi, nv3052c_ids);
 static const struct of_device_id nv3052c_of_match[] = {
 	{ .compatible = "leadtek,ltk035c5444t", .data = &ltk035c5444t_panel_info },
 	{ .compatible = "fascontek,fs035vg158", .data = &fs035vg158_panel_info },
-	{ .compatible = "wl-355608-a8", .data = &wl_355608_a8_panel_info },
+	{ .compatible = "anbernic,wl-355608-a8", .data = &wl_355608_a8_panel_info },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, nv3052c_of_match);
-- 
2.45.2


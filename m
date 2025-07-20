Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C69E9B0B470
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 11:01:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E062A10E35E;
	Sun, 20 Jul 2025 09:01:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="aC+IlIDj";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="N7iOZeN+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 599 seconds by postgrey-1.36 at gabe;
 Sun, 20 Jul 2025 09:01:09 UTC
Received: from fhigh-b8-smtp.messagingengine.com
 (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9EF010E164
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 09:01:09 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 075747A0186;
 Sun, 20 Jul 2025 04:51:53 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Sun, 20 Jul 2025 04:51:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1753001512; x=
 1753087912; bh=UNP7aLlH5boXxQzG+t+OENng1ZS04P2rudXCohGPD5s=; b=a
 C+IlIDjGS6uS/efVwEXWOliogCBtxwf9T34p+VQ7kS7P+ci3EySItpeQz8YqNCch
 Q7nZe4iR4nkDfUrcFY4mn26wJylULYLhkS03lqR1Tg0c1GtQE3wAPHlGvv79S+fu
 ORw5y2OfCi9Q1hEpJaLTxxDE1dFh7AKoHpjYx6xKLyN6eTij0qrDb+hSwzuuQGXd
 /kCD281Sekow71xwoRbFFOfE75D0BI1mUjO5VlrYS5/XAWjc4t/QrILVxhsxzVOI
 nYzjsEZqs+UY4kHQezoewGMeWcIyQCGONmExgA3frF+JTi0HDaw6xVlLwqTfzLn5
 VWR1gicziIy/c7//2wTxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; t=1753001512; x=1753087912; bh=U
 NP7aLlH5boXxQzG+t+OENng1ZS04P2rudXCohGPD5s=; b=N7iOZeN+lYhZZ1zHX
 +aazxinbHGhqBA6t6g6/4SXdqLlOXW1/mwSx0/LfdOwgn/sQlQII7ymuOkQNheI6
 Y9rc+0daHoyNlDe6BUfiB4QXDPEAUGSHlAd0tVP4r8bfsZBQ7ku258zfQyDX2Rp8
 G2muBssyQXhpPrbzA1G0pUC+37rJBgI/G8Szs0FtlAa11TY0trsTB5ToaDzrbUmW
 4OF4DYXxdrmnW6wCc4c5omrWS2cnFvE1loPJ+E0+J1nHQ3KDOf26CNlqtQDHrOmP
 o1g1/5hfGnlyDzI1kWtEGecPpVKnHd2OGt+MezEtGXfpxZMTiTWFfQZMCDD5SjoQ
 xKv5A==
X-ME-Sender: <xms:KK58aNcf52W5pAVgcUR6jqw5QQnB6VVHyNk_pfUxdMJPgvdVU9EVlQ>
 <xme:KK58aL0oGzcn7azYl9F76sIB_Zp2M_FUcWF8u03-QCIIwNt1oPxow0wqqOTmcKcfU
 h35SnGcAkw6aFdZow>
X-ME-Received: <xmr:KK58aBr296fq-revSCrof_18sdRzATyjBzLPrsbu47Z9kkwRuYCoSF6INVlZGN1pAlfTuqFNlS_JEhkVPEu8JU-y8vEm9Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeikeejjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcuhggr
 lhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrthhtvg
 hrnhepheegudffieevieduudefleffueetieeiudelhfetveeggfffheehueduffevjedv
 necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdp
 nhgspghrtghpthhtohepudehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehroh
 gshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghl
 rdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtph
 htthhopeifvghnshestghsihgvrdhorhhgpdhrtghpthhtohepjhgvrhhnvghjrdhskhhr
 rggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrg
 hnugdrohhrghdprhgtphhtthhopegrnhgurhgvrdhprhiihiifrghrrgesrghrmhdrtgho
 mhdprhgtphhtthhopehmrggtrhhorghlphhhrgekvdesghhmrghilhdrtghomhdprhgtph
 htthhopehkihhkuhgthhgrnhelkeesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:KK58aLgvUtKeBiuiqBms1R-4rW7JNs8DDhbjYXBy95BfFwfepEfqVw>
 <xmx:KK58aNkAMaUZhPeBeA6W3xFR8Sk4udvNumnvx75OAhUe9yeKAdVzLA>
 <xmx:KK58aEra_WYhc7bLYY73WUXZ6FnbrmDtDfl1kji6m2CXzAHh6KlXxg>
 <xmx:KK58aJKr8jPJRgHFsV-R3id0BqKzJiLsUJnK1ceCEHwdNJlz-cig_Q>
 <xmx:KK58aCWqXbWY4pv3vLygyEY1H6uFKlzJvoeTXBLlqjcUzJqoOmEnYYHH>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Jul 2025 04:51:48 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 08/12] drm: sun4i: add compatible for h616 display engine
Date: Sun, 20 Jul 2025 20:48:46 +1200
Message-ID: <20250720085047.5340-9-ryan@testtoast.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250720085047.5340-1-ryan@testtoast.com>
References: <20250720085047.5340-1-ryan@testtoast.com>
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

As discussed on list in the previous version of this patch [1], H616 DE
compatible could be added using the H6 as a fallback, however all other
SoCs have individual compatibles, so add the H616 here for consistency.

Add a compatible for the H616 display engine.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>

[1] https://lore.kernel.org/linux-sunxi/20250224180025.4eb33c3f@donnerap.manchester.arm.com
--
Changelog v1..v2:
- Add a compatible for the H616 display engine
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index c11dfb2739fa..6986b329236c 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -436,6 +436,7 @@ static const struct of_device_id sun4i_drv_of_table[] = {
 	{ .compatible = "allwinner,sun20i-d1-display-engine" },
 	{ .compatible = "allwinner,sun50i-a64-display-engine" },
 	{ .compatible = "allwinner,sun50i-h6-display-engine" },
+	{ .compatible = "allwinner,sun50i-h616-display-engine" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun4i_drv_of_table);
-- 
2.50.1


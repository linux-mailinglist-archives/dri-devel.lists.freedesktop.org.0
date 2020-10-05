Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4863284732
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 09:31:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA936E3F2;
	Tue,  6 Oct 2020 07:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA22D89D7B
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 15:15:54 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 209A7580174;
 Mon,  5 Oct 2020 11:15:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 05 Oct 2020 11:15:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=jhK5+2SOe5Kab
 dyat0E47F3XPAk4PAI4kYae73kK6VI=; b=boztlMkT/U5iO+iUdLwfh0AFsWdhM
 L8oLKhWlivYf9je8BDfSCd08ar1oIh5omQahpyCkowoOuf7d/Jb9293vOCs9nuV8
 OFYwsZouQxnoZYtE70WnfcnQEnANR8Ar6E5wZ3UlbaPGlxUGCVWAx3XGA+4Rzg/c
 ax7Md7i2EE54PNY9i+1XM+fimq6VmdSJO39plB0LwOkYpu//oNC9uH0zTOJsQVYh
 jwlw4kK8hDslKN7O4Joy77Za7dZYvvSX7WVKGHEnk2iCXNRNppXmMHTvL2Bb6ciW
 liZ39S0HP7VYHUDfXwinR3eYBta6cXU2ycLvOwXuC1JL9z7MS7S1AF7dQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=jhK5+2SOe5Kabdyat0E47F3XPAk4PAI4kYae73kK6VI=; b=EW4uf5O9
 j6WfAxcc4754CHCZCkfywCe+wCmALfyEKxp+Ja+mMjr/Vc7OmiWVkve6CwkKRjev
 hFbcG1D++YDLO48ytI3xmqa9J60LBPa/lqpdCQ6p4x+5llbFwfpU3RRXcgnPx2HO
 iL5X3vTSBzlDJ2+y6Eh8OI1AEcnTMGGdAdUXfpNcz0I64D7Bpso8lruucxLyhIv2
 hOj6aMcsBRn/hxhzsbsiLDP6AddMA4YUYT1Zl0/cqch9SLZn3T7fE416NKCThvtn
 6zXbpmA0AJdrzgNG1v/am8p1dE7x7OeT6qNLtydCslXSmhhj9vg2uUkRhEd/DDQy
 0gWjKZzCyVw83g==
X-ME-Sender: <xms:qTh7X4zlxyCd-_ewjF-oFag4YAnj0lMITvhzlT63vbxL2qbTnWYxww>
 <xme:qTh7X8SgXtotmpcEJLMuJFpHybzIAFcf8asqdsgSx9fdUWD96Vd7CFM3bNfNtRWcV
 q3V5uf9ptgOJ_b0cAM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgedvgdekjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedvnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:qTh7X6XjyiLzWMnFDYoWtdkBMLjQtDqXpf-MoWvTC1yMcgqWOHqM3g>
 <xmx:qTh7X2iX6E8_FwUO1lQh8xoufezwedDlLQEz7ZbRELlVxaq1mHu0pQ>
 <xmx:qTh7X6CrM_5IwnkheQ5Zj1Ir7fnuWtAbpKCiwD_3WAGf11WJ1Z-Gog>
 <xmx:qjh7X-5lXEdpg4WmEKilPUEWEfrHSQVRwBbJUSjvYxnxDGRVliKsHA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 892CA306467D;
 Mon,  5 Oct 2020 11:15:53 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND v3 5/6] drm/sun4i: tcon: Enable the A20 dual-link output
Date: Mon,  5 Oct 2020 17:15:43 +0200
Message-Id: <39d2bb3f089f39f57f306679e882816182300e03.1601910923.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.6cdb798a6b393c8faa9c1297bbdfb8db81238141.1601910923.git-series.maxime@cerno.tech>
References: <cover.6cdb798a6b393c8faa9c1297bbdfb8db81238141.1601910923.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 06 Oct 2020 07:31:05 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The A20 second TCON (TCON1) can be used as a secondary output to drive a
dual-link LVDS output. Let's add it to our capabilities.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index f497d866e835..de3d1b17a499 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -1523,6 +1523,7 @@ static const struct sun4i_tcon_quirks sun7i_a20_tcon0_quirks = {
 };
 
 static const struct sun4i_tcon_quirks sun7i_a20_quirks = {
+	.supports_lvds		= true,
 	.has_channel_0		= true,
 	.has_channel_1		= true,
 	.dclk_min_div		= 4,
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

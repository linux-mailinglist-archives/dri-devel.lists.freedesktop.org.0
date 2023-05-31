Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 138BF71820D
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 15:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17EA210E1D3;
	Wed, 31 May 2023 13:37:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D1410E1D3
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 13:37:33 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2549B3200917;
 Wed, 31 May 2023 09:37:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 31 May 2023 09:37:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1685540248; x=1685626648; bh=y9CQvJw7h0
 TIg8yD9ZggEz+f7OWuYF7hjxsbvspE8SY=; b=FmoxYmUT/kh9/D6myDKtbaGizn
 +T8d+NozuDpZlKQar5EANfwJj4hQhI55PVC42/mVcANzfo79CGvdAtplJdBKuOlm
 vs4Nc0bYdLoBWy0o6mE3XT2owv148qAzwag5/qT4ZfqaKB5nLmyLJua16x9wqEXm
 zzbK/yr5cRyA3vrQsAF7w34rE2JgXdjdrXOkYvIC8BQXdVUFewbOmc+8tLeMjzkG
 Uno/I8AewxPnB950/GnX6G+xCN30rkuyhn/Nji9jfqd/bO43nQ09okw0GAHsboxd
 frhfCnjxYRvxlwly8SGoW15mhtmOpFjRuVcu2cdKC3mEV9AGIHdkGiytLgGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1685540248; x=1685626648; bh=y9CQvJw7h0TIg
 8yD9ZggEz+f7OWuYF7hjxsbvspE8SY=; b=MLZLTeIBBznNliAVJn5Il0RhlHDQD
 c8J1o6ooA0EsN0WTc6ZolQNkcAM5FhhGO4fgWdT1TfM5b0cqPS7bFfzMGA7OWQ+K
 5aRqk1gonY9IvEGNmIruK9Z8KzyJodlhe4oyUdyNz1JwGNJ7uWukerPYJxUzdjNs
 T51vhdA6ZUVQg/AHf1k2JsC7rPU1xyEkyn1M8aClgH6NOQDTlCqcBmuYDJL+FDy0
 06VJ8vRdeC7roj5y3XdCcHEA4a/Q7G8981P+CSapRP9kUBGwIzNCY+OA0umXw2yN
 MBlBH6FeiL4PC05fgSvdKAilfh3dNRdymL9nbGpZSsoL174rBwxmhJ7fg==
X-ME-Sender: <xms:mE13ZHiBnyhOXdWGutioTSPhVXIYzXvikC1mP2DNr2R6bZheJd9Q5A>
 <xme:mE13ZEAM0kx4uALspvvqDMaQUx6jbVgXDeCJyj8Ytul4EL1o-jLbM-KLWencgh-tB
 iIvwC48QqaUDOFr2Sk>
X-ME-Received: <xmr:mE13ZHEP0S6Ifdn63u_1veeaw5PZ72oSuRONx1a6WRkIbZSuZBJakl1hMLveIKicesiDvUXewdktu0oXCu4lhw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeekledgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeektedujeeijeefhfejuedtudegtdejffffvdettdeigeekffeileelgeevgfdv
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:mE13ZESF8kHRbsr_0y_qs9V2afA5_vr3-t_Y8oSGD3v9uHsqfk8DHg>
 <xmx:mE13ZEya8QagEk6ftKAGT8SVGpYBJTnlY9y8NPWWZjplXEKipF0D4Q>
 <xmx:mE13ZK6WdawEFEOFE1qJZeNjlsRR-MU1pOREx1UCr6vcUgkcxwLfJw>
 <xmx:mE13ZDozKqx9321eb32zZsfq0wxlbF18c-qURJ3w0FpZSgul1qW_og>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 31 May 2023 09:37:27 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH] mailmap: Add missing email address
Date: Wed, 31 May 2023 15:37:24 +0200
Message-Id: <20230531133724.133872-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.40.1
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I've been using that email address for contributions for a while but it
seems I never added it to mailmap.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index a289b25ea2c7..c14eefed259c 100644
--- a/.mailmap
+++ b/.mailmap
@@ -331,6 +331,7 @@ Mauro Carvalho Chehab <mchehab@kernel.org> <m.chehab@samsung.com>
 Mauro Carvalho Chehab <mchehab@kernel.org> <mchehab@s-opensource.com>
 Maxim Mikityanskiy <maxtram95@gmail.com> <maximmi@mellanox.com>
 Maxim Mikityanskiy <maxtram95@gmail.com> <maximmi@nvidia.com>
+Maxime Ripard <mripard@kernel.org> <maxime@cerno.tech>
 Maxime Ripard <mripard@kernel.org> <maxime.ripard@bootlin.com>
 Maxime Ripard <mripard@kernel.org> <maxime.ripard@free-electrons.com>
 Mayuresh Janorkar <mayur@ti.com>
-- 
2.40.1


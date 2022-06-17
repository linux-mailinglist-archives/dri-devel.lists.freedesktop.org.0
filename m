Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 919CD54F1D7
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 09:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BAA911A61E;
	Fri, 17 Jun 2022 07:25:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 498AC11A61E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 07:25:42 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id D16F15C0151;
 Fri, 17 Jun 2022 03:25:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 17 Jun 2022 03:25:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1655450738; x=
 1655537138; bh=t6QXcNLzauxbqf0PNTG8MvaAdoQQFis6uQHBpNA5m+I=; b=n
 r/26OCnEDIr6jYGUp00hxr/NMoxkf6xXfRuhMockkxh6n/wloYbpla88d1SGLc3P
 BtUBgD8RZGZwQq1VPEdFsxTpp0vbEShL/ls6VxYlg3QMzR0vwLar8HSi00UlQ0gL
 CH0ldBnQE8fgusDetIp4GspeBfNwxFV/Kux0Hx5Gn4thT/XQgU8PMW4HgsFFcXRm
 Zivnb/+Onrj1LGZ5AHx2nvHV0C75KC/tYxnCCabt/MYKO/z8c0fQcLinaQbHGkZ/
 ReDK0Ixt6XyqgHi5Jl8vZzwm7V5ELSXQsKa2v6qLRWnUgG5G2P5dohWhsokjAjTc
 L+OzZ1aV3f76OQGSJyChg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1655450738; x=
 1655537138; bh=t6QXcNLzauxbqf0PNTG8MvaAdoQQFis6uQHBpNA5m+I=; b=C
 kYUa18GGhGd0oZQ43NnZDN3+5y/3awo+Sws0Pq3eb6UKVOekXJ4Y7ZEHvLp36JHj
 tycJVtu9HwZf6jSnqxW4zSYXVJbe86AaaXxlWH7q4QH3qe9lRa6jd+fNATp9LPAT
 uMB4hcgr49bGrbUHs5jLTWfsDcAY1XnxmodGaA/DgxKZG0akk8naBHEsjI+9wBbi
 bdBT2GvJE4pNDjc9Q1xJKM5StazQkLXgIHK2oujsy/VM2X0INDscm2W7ndAJ5rcf
 mBBIfmMwMR/jziK5WAQT6SO63sjbrOoLYrgXG/T1UfFrVqW/5w3OIEWPJWQoFPkh
 /k+4PB1FRuFRA5/pGTzAw==
X-ME-Sender: <xms:cCysYuGbj_tXIkPunEurAIwroXW5XpxjXpF4QSJbzxhbPXclwax6XA>
 <xme:cCysYvWgkzuxSA4c7vUx_UbBJT8gLLCv-uNPJbxN_6t01QjqR06uBZtc0l9wxHzhR
 zr0LWaTeAJNrwG7Sv4>
X-ME-Received: <xmr:cCysYoL-s8_MAzYdUOgHxl_upF4_8dJ4RyvHl_ZD6Qzg5t8bcXrIWoJ5sq56JxsiML5p_3EqajNOb9VnX0x1uY0f2nUbuWm7o5g4tUo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvgedguddujecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeetgfelgefggeekkefggfeludeiudffjeffgeevveekjedukedtudeu
 teefteefgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:cCysYoGVB8cZQ7yOz48SmLfp873hgDRpdEpPRutGsvxTCLizycl41w>
 <xmx:cCysYkVSvHtiRSBPNAhrPCzXsNP5d45QhqafU_iIo0w9pj_rG6ibZQ>
 <xmx:cCysYrOhmw8cG_xUkAWqqi3Xw5qv0x5wtJ9n4l4N9ZI1Bu5NZbr7WA>
 <xmx:ciysYvyJISiAd-XGF0UUbZ-Rv8dPZGqNpVjs7CZjxA6lvgGh5OS30A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Jun 2022 03:25:36 -0400 (EDT)
Date: Fri, 17 Jun 2022 09:25:33 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 03/96] drm/vc4: Migrate to new style legacy DAI naming flag
Message-ID: <20220617072533.foajsg6z3c2js3nb@houat>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
 <20220616143429.1324494-4-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220616143429.1324494-4-ckeepax@opensource.cirrus.com>
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
Cc: cezary.rojewski@intel.com, kuninori.morimoto.gx@renesas.com,
 airlied@linux.ie, alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 nicolas.ferre@microchip.com, srinivas.kandagatla@linaro.org,
 peter.ujfalusi@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jbrunet@baylibre.com, pierre-louis.bossart@linux.intel.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, linux-imx@nxp.com,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-xtensa@linux-xtensa.org, nsaenz@kernel.org, kernel@pengutronix.de,
 broonie@kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, patches@opensource.cirrus.com, lgirdwood@gmail.com,
 vkoul@kernel.org, jarkko.nikula@bitmer.com, shawnguo@kernel.org,
 daniel@zonque.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 16, 2022 at 03:32:56PM +0100, Charles Keepax wrote:
> Change the legacy DAI naming flag from opting in to the new scheme
> (non_legacy_dai_naming), to opting out of it (legacy_dai_naming).
> This driver appears to be on the CPU side of the DAI link and
> currently uses the legacy naming, so add the new flag.
>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Thanks!
Maxime

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A824B50FD58
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 14:42:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 857CC10E817;
	Tue, 26 Apr 2022 12:42:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88DAD10E70B
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 12:42:08 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DA5705C012A;
 Tue, 26 Apr 2022 08:42:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 26 Apr 2022 08:42:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1650976927; x=
 1651063327; bh=NpC1VvXCHyZRlGzww2ZlIP7VA+/ikbJaSv2AyIxJyHY=; b=s
 P58LHhj3+SKM9c0uKUqlZqIAH+xjMCWB8TTv0ABtfA3vGnav7tCbYXhaLhZvoLXL
 gze6zLueFXFjXSTHPFDGeARpKyvAPHr7VToXaok9jfd5mlYt+l0UK2Ye4nDRGusa
 OUSmw48hVOruV6+2e5mYeCg/tqTPGx+eF/hGJ9xvuNHPpoSOpkj/mkr67P+t5jMI
 nHb0y78WMFysHYkxO1zQn5LQkgdaPPM9D5Hcwkx4VibLEsIOras745KDDHlEog5Z
 /6qMCDpUJQgJmGk6PDXPNlNWNuaMggRNacxltaqYxsMtAy6opqTi8qyvwfY/apd/
 tRdqTtlC+zL+v6HsZ9AOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1650976927; x=1651063327; bh=NpC1VvXCHyZRl
 Gzww2ZlIP7VA+/ikbJaSv2AyIxJyHY=; b=tueP/4XrUBp7hzuoEIYAjO3apwKt5
 QC4vx8Hd6PI9znAKHu/iM/uf+oQNLaQS2PiTVrn3ZTDFawxkNPN/pmymEvEMIH64
 R9AVxOkTXyAwC4toVWUYA5spCnnFH2kmsoQnMo+0KW4GwFMfxezH35XwHQuq9Ars
 5nKV26Zjdi+vINvdqeIEjlISOufh6TkVGlc7hpVsNG+FriN4Qyer7IW6Q3dmokfo
 ltnzFJEEfI9y+5bgVy5wp8XvdNGATjLhc7QvO8W82LoFl2mtj3gEHmdUpOslRbUb
 0ABXWC/QYrnwwEWK7ViUMV9jc8cpxRkIHExbaEA4S0DKdEfYwPXpRQ+6Q==
X-ME-Sender: <xms:n-hnYvyTxk5KYoAM82Eo708a75WNZ2d-YaFrNBb_lQ9EvbnNqe37Pw>
 <xme:n-hnYnSGxy-pYu-gbULJp_wOX6GQYFIWOkzNenvkwLJvqlSw8rCZmKFmarORBHF6t
 hu8mMGLgn7RYAw5Tg0>
X-ME-Received: <xmr:n-hnYpXPEB0U9WIxblUqfFtUgNEeXYNb0DrOQrEhjlGYrrQy9X5vCFl60le-zd_lhem8oJVRkzmDyYMxK-EunsRs-qX1ICPbhJRDzyQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefgdehvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeuieeggffhffffieefheduieeuvdetgeeufeffvefgtedvffehheekffev
 udefieenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:n-hnYpis51Jmmy1sdd1YhY9jqBrVtJcOXGmfvJNn6m1oRrus5xV3MA>
 <xmx:n-hnYhDRGJrtSDkIF3fER-hrVY5HqtzbLak6S2onlIXVuHPgQ8NyNA>
 <xmx:n-hnYiIADATWk_6zxTvKPAKqVjVT52PDEtSZsyZSlmF1JnRJ3rlWpQ>
 <xmx:n-hnYl4sP1LF40M_zkDnavDHMyUtyII5r8MwOwm4YVbKG7yO6pPG9w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Apr 2022 08:42:07 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: (subset) [PATCH v3 13/14] drm/sun4i: Add support for D1 TCONs
Date: Tue, 26 Apr 2022 14:41:42 +0200
Message-Id: <165097689886.514433.6809775851918268081.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220424162633.12369-14-samuel@sholland.org>
References: <20220424162633.12369-1-samuel@sholland.org>
 <20220424162633.12369-14-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 24 Apr 2022 11:26:31 -0500, Samuel Holland wrote:
> D1 has a TCON TOP, so its quirks are similar to those for the R40 TCONs.
> While there are some register changes, the part of the TCON TV supported
> by the driver matches the R40 quirks, so that quirks structure can be
> reused. D1 has the first supported TCON LCD with a TCON TOP, so the TCON
> LCD needs a new quirks structure.
> 
> D1's TCON LCD hardware supports LVDS; in fact it provides dual-link LVDS
> from a single TCON. However, it comes with a brand new LVDS PHY. Since
> this PHY has not been tested, leave out LVDS driver support for now.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

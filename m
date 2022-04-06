Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 701024F5B6F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 12:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B9CA10E352;
	Wed,  6 Apr 2022 10:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B407210E23A
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 10:42:45 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 8D8023201EE4;
 Wed,  6 Apr 2022 06:42:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 06 Apr 2022 06:42:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; bh=kZNRQqKK2BvXoS
 PRfKsKA2AexgUV2eDr5nw1L9UyLvM=; b=KLNG7wD3ze/lbm9hv24JGxzlnEUWFu
 XAF9x+hj0VR/5jR8HTVUglnnkDCQNamI9FRSeVRp+qx2UIB5pF4bYRSQU+m1Qf1A
 vDkD8wJG2gvF2L8OCEenMO6gq//hBKA+ma/psdL/FG5S5CfF8S2UI64NInD/7t1L
 W1eeyTSxe893C9Y2EupIKu2vfX7LIPne+Xii9ztK3KndvD/uXjTMQl3v+G/adteJ
 85IavcX8jHcpK168QsuHAlFzOZRBiXJUA1o9s1I9K63lvZEyDDWuJu/vgZa35KxE
 fw7nWWqbD5lFhNXUQrChyQX0eLIpyNHy8f4txlOtBTu6SIxEgMsploCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=kZNRQqKK2BvXoSPRfKsKA2AexgUV2eDr5nw1L9UyL
 vM=; b=JcEyq8zXwbTTvh7mf+FeIhzR4ezjeWv1u1yU0cltE00WKa2MHq90Loacl
 9JkecuOdu6SLSfQwP0D7wDW1L1IMVWVeELbxQNf/G1FFSViOJL/60eE22b+nWvG+
 njsEKfvYFk+oe/+3Fx9rIadDezzhahn6uArOU4QJ4QKC2Q/oGxFDtKWGViAvA/ou
 LVz+ieM6P5MS7BgSKQ82l7M7HuF4Yb2iWx+lvAnKX/5Id0VLLAUolLXrcGxPdcc8
 zHUxJ9Tj16TVd/lIBGrFz1Fj8Cz8PoOnZVBWWHk+YAJsE7Us14r6XB25kAM1emLt
 XdGLvUw/Lwp3ijwhWC9fbHwqaZ4Sg==
X-ME-Sender: <xms:o25NYjDbrGIG23zwa-Qf24GUwEobNMQikU8uBW0VnyzRmNgmb2Lf1Q>
 <xme:o25NYpiPvEgKR3ypQ01Xgyi8vMlNx5E79EkMjmVeeAD54GQhGCiHkzJRQuF3rgiAQ
 NVXywd3fDg1gmJTIp4>
X-ME-Received: <xmr:o25NYukLzIhk1Xr0F_jOFzMDub06xyzlIa5bv5iv3p1K5pv7ERwMUNm-wfJ-KQ95Lo-ZJcbawInKQhsGTPIyJda-P6jHcExKIjMhYWU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejiedgfedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelteejleefvdejffetjeehfffhtdeugeffleejfeekffelteektefgveet
 vdekjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:o25NYlzUQ995z0PVLPNTYRi0psvdmnYFJTpUHNwswqPOmms0HO_FXA>
 <xmx:o25NYoTXv8lfoXCW-GdMTWI5sYpUj0aikAuXZWUxq9KrPCMB_rX_2w>
 <xmx:o25NYob35ehl0PFw0ePdASt8Dx2NRdTqSChQ2heJd-fWnP3rxHxd5A>
 <xmx:pG5NYtQvSfTf9F9VGEsErd_w02kCk6PXdPgJ3AZtJtdL_d36xWLkjA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Apr 2022 06:42:43 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Stephen Boyd <sboyd@kernel.org>, Mike Turquette <mturquette@baylibre.com>,
 Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v7 00/12] clk: Improve clock range handling
Date: Wed,  6 Apr 2022 12:42:41 +0200
Message-Id: <164924173265.903502.5970864689470802252.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220225143534.405820-1-maxime@cerno.tech>
References: <20220225143534.405820-1-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 25 Feb 2022 15:35:22 +0100, Maxime Ripard wrote:
> This is a follow-up of the discussion here:
> https://lore.kernel.org/linux-clk/20210319150355.xzw7ikwdaga2dwhv@gilmour/
> 
> and here:
> https://lore.kernel.org/all/20210914093515.260031-1-maxime@cerno.tech/
> 
> While the initial proposal implemented a new API to temporarily raise and lower
> clock rates based on consumer workloads, Stephen suggested an
> alternative approach implemented here.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

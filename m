Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 422F050FD62
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 14:42:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A891110EA75;
	Tue, 26 Apr 2022 12:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6114010E763
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 12:41:55 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id ABB085C0180;
 Tue, 26 Apr 2022 08:41:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 26 Apr 2022 08:41:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1650976914; x=
 1651063314; bh=EohkGW+s5DM+g0bYFYs5ug5rXQ/TPMVSBiu5Ouq782M=; b=t
 kYd44xkDQs/lqUO/VoOAYISLB5l95/OZVh0A4aNdmTd/Kl3clQhylCEf1UIE9qZm
 mk+NHx0Zrf/KE/ua4P3Eprc5db29oZPq/hapetiz/KzhiBE0udVPX+pRwbyn9Gmq
 if1b1ub5uxQIqdEQandgarfSyUgtkuMry2ElZWBQ4LWKOs8hyU19N+4Ken5HcYZe
 z9y1unsINI/kl/nwYrI4W2l8eyZ0BVANZD+W/v2Af062N2sH+/6YhH15Ecfp4SAX
 XdzsQit2ZZf3/liXJA8phAnSn+ZMhwqQkCD5qQ0wvnCNkYy0Q5x3EXRClZ4qRhYU
 fr6HrX+UzA74Gws9Ms87g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1650976914; x=1651063314; bh=EohkGW+s5DM+g
 0bYFYs5ug5rXQ/TPMVSBiu5Ouq782M=; b=Ght8b1ESZXb8CwjPP00VKMP47VpSm
 7NoEtkrwfbaOnlokx9p9KvstWDfJxZWrvs9ezpn7M8QP7rxdzDc6EqRVFpsWYa4p
 gyA5PfHMpuKNPTgqNwSnH/rQ5/j2/Q8Ve3ABfvFq+g9sgWYSOV7gil+E8bzifDbz
 kPygZ3qLMDpurbc4yeuLkGblvCEZEBZVT9k6LLf9iz3vrhuqZhaGg71fkLqjSczG
 CNbJw+rbmrsguZ1y4etXVOXgy2tnDNJEXCLPofokZ5GxZk39l0BNp4bRXbBnxtgJ
 tXOh05F18EV8ughn7wKEwQNfLbuLO+KBlXiwEXw0AvnQFHJCQR0RqFeYg==
X-ME-Sender: <xms:kuhnYqCMGK0dhcFDBgl2yLnZj4f0vuwqIQNofn64lltBZ8r4v6eygA>
 <xme:kuhnYki8QW0wrO5JZPa9_2PJwEFqi1djrDFRa7IrscOHD3xHskPKCvuWcebZS4bmq
 DZ6omXnWuF8XKLpsRg>
X-ME-Received: <xmr:kuhnYtky5o12unyhFk2w_oiUQqe_IG3AGn9qUt_lJOp-1B8kKebAq1frER5SZZMHDe5bQU7TZPPYGyJnlMWdY7PuP5t7MCZybRcF2Sk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefgdehvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeuieeggffhffffieefheduieeuvdetgeeufeffvefgtedvffehheekffev
 udefieenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:kuhnYowIoo_wOF3qa5bLxtQ9Fr6Vtsybil0ktVn-sYB4ynTF6DEypw>
 <xmx:kuhnYvQv_0BuAa7jeMub1HH98x9WNkJFTAlIQ5I-qEdZ-OCztISGJg>
 <xmx:kuhnYjY_kz8AvJlG-gQc3jhWo93ujbN1d4eLWiva-qe_J4bn2mg-ww>
 <xmx:kuhnYuLo3NOfuvrCDteCMubPEz1pwusGNgEfhJ_1oPyTdptw3ybOQQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Apr 2022 08:41:54 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: (subset) [PATCH v3 06/14] sun4i/drm: engine: Add mode_set callback
Date: Tue, 26 Apr 2022 14:41:35 +0200
Message-Id: <165097689885.514433.4928280366164245605.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220424162633.12369-7-samuel@sholland.org>
References: <20220424162633.12369-1-samuel@sholland.org>
 <20220424162633.12369-7-samuel@sholland.org>
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

On Sun, 24 Apr 2022 11:26:24 -0500, Samuel Holland wrote:
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> This optional callback is useful for setting properties which depends
> only on current mode. Such properties are width, height and interlaced
> output.
> 
> These properties are currently set in update layer callback for primary
> plane which is less than ideal. More about that in follow up patches,
> which will migrate that code to this newly defined callback.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 624515B343F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 11:43:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 452DA10EC50;
	Fri,  9 Sep 2022 09:43:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B288510EC4F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 09:43:36 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id A45623200910;
 Fri,  9 Sep 2022 05:43:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 09 Sep 2022 05:43:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1662716615; x=
 1662803015; bh=BPPtl/cMNHSdT0mec+pRQSkp69YrClZfTu4CSSKhUGg=; b=K
 ioNqt8AqgvTv658Xtc0T0m6gj19JPP4dH7jnGgtJcaQREalOR97fRW16xxPkqqH2
 umErcu0ASESme0UwxTCJWXOloUnAyZnWK10sX9PiJqzTkIxwiBbjH1Ag1k/IV/iV
 gKozV8vhnNPK2HcPj0nzFr2RmFEIvrtd4kQuag4owectMZw1PenbSCCckvrz86c0
 DU5SgG3Y1ZRCUpSoM+SdNdLgrkGFM6bmTrMfBxh3DEr/rgoVqu463xRkoITWAUWQ
 2ITp4a4MavZZOG7TRH4bxuNHxAuZUgb6Fd1uoBmQI0V1wuhX6kM19dujmZXYIv1N
 vBqBpboUNdm1e9YmoNBGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1662716615; x=
 1662803015; bh=BPPtl/cMNHSdT0mec+pRQSkp69YrClZfTu4CSSKhUGg=; b=Y
 Ri8fJ2CROyRkFgaG0cP3O6bj5GwllM+RPMsulihUYdyyEtuRaC1o9POafmAX/jOb
 MIqxNJ/iKY/z6Hy/1l62GLvoyAxyq8bXnLRfWEPh+CyVt44g6+lQqcjATO4Wucqk
 1JPWvQP8Pmb2d8HJS8Z6w/szOs26w2K+WnnMw+uEPaJedCl4/QakqMf/an4mLE10
 EDepd4T63QZDaKOytouHXiE8cqmQAAzNhX4CEDnQ7D0eJybm/+ZS9pu2ryxMpIbR
 Grq20qLJtK/Bt9+Rdoa0M6x02btE9B8fIdk+kvA4IYj6qWQaJ+vIuKel0WU6uKgD
 tM6sZqhciwre07VG6xdQA==
X-ME-Sender: <xms:xgobYyuEFycI62gx7fXWDJqfRaRRgtUYLOGDR4UoBDXvF1W-1TzTkA>
 <xme:xgobY3cEXC-IXhuz8zZ1XKTcmiayU0X-9-HuCgSavxExIJdfCfbcJAirP1u1CNbcR
 ecpqjLNvu6BST7pzK8>
X-ME-Received: <xmr:xgobY9woRR3XHcjwLIfeuZy99fAmCQcCswgyTPzqQqwpm0qlPK5OBQsoWisz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedthedgvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepueeigefghfffffeifeehudeiuedvteegueefffevgfetvdffheehkeff
 vedufeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:xwobY9N521DDAcTCXGTm5Ba3jilTie9MgVmmDRZq14uemfTLEwlBrg>
 <xmx:xwobYy81riG_4lfYTDvZtLriJnwtqrtZTcAE7PHNcN93tA0QN8GasQ>
 <xmx:xwobY1V7LyXajoNPNUDKtwZgDUq1D-QYVYpGrY-UKeJaO_wapaZ2cg>
 <xmx:xwobY5YWqsy2k4lgzH3aS4G5DCq88lezyQO01RcfR36za8FeoAJZ9g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Sep 2022 05:43:34 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <maxime@cerno.tech>
Subject: Re: (subset) [PATCH] drm/sun4i: tv: Include drm_atomic.h
Date: Fri,  9 Sep 2022 11:43:31 +0200
Message-Id: <166271660993.4146976.9920231843739049876.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220909093116.4141982-1-maxime@cerno.tech>
References: <20220909093116.4141982-1-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 9 Sep 2022 11:31:16 +0200, Maxime Ripard wrote:
> Commit ec491291dc94 ("drm/sun4i: tv: Merge mode_set into atomic_enable")
> has introduced a call to drm_atomic_get_new_crtc_state(), but didn't
> include drm_atomic.h.
> 
> On CONFIG_OF systems, this is fine because drm_atomic.h is included by
> drm_of.h through drm_bridge.h. However, whenever CONFIG_OF isn't set, we
> end up with a compilation error.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

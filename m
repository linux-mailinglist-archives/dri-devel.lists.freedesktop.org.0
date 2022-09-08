Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 888095B2005
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 16:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4AFE10E9DD;
	Thu,  8 Sep 2022 14:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A2D10E9DD;
 Thu,  8 Sep 2022 14:03:04 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 331AB2B05B92;
 Thu,  8 Sep 2022 10:03:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 08 Sep 2022 10:03:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1662645780; x=
 1662652980; bh=ZcIBIDlpdLVKZg4IlXd05S6h4JkWIhQqXXzWfBJ83ow=; b=c
 zNe6gLuyvdjRW551IVFEYSdvQD3T1eshLEO+8vISeoBxTjKAUZaGJdL08oseMrqZ
 Fut6XphRqmkGK1h4QU7mkM6EW6nEBRN/eRh9i/MqyJFJKZ4oq0aEfd3rKhkg/snx
 7lFjef8FWWTagRHm6af1CHCss+2PSst8CB7iPb2m8HnNbecu2BQ4EgjjjVSZTx6W
 Dxga0MidtrFihJM85mmSVwcrI9Rush4dDlAy/Iouc2qHobNbKdWj2voBmEfOyWka
 GGQwayc6261/IF5J7i0pEiv2N0ryPWw/2rgqUlV2pcgIAAktZN3HwNjrAyyJ7ml1
 p04Wsngh4+31AfndU9nSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1662645780; x=
 1662652980; bh=ZcIBIDlpdLVKZg4IlXd05S6h4JkWIhQqXXzWfBJ83ow=; b=n
 afufB3YRGZd7vArNXwFSQtbB56G4qFj1c2iTf8oXEIZJfq/cpgOEWgDEI2p+EXfl
 0MmREMov9f691O0PEgmDn2QdCY0LcUXjI0veG6f0P84fh/PjdFS3OTYJdDe6uKFm
 ikxXlF689P+AZ32ATwlcdZvGmIgqybmD4OJfmrhg8wREg8k3WyS7epbT7zq+E5Jo
 mWYxQrLdvvDWYibTVAhJTrvUXTUsC2jGvc/1aFrHZG8w+Y3SoYg+c+1VVqHbNxgw
 wY0EyD/EQgciCBrFuGituKnIHN5QfHt786H59uJntnddeH9LMqntUWc3+2fIUDnp
 L0T/cryCIafj8x+1QKqTw==
X-ME-Sender: <xms:E_YZY5vKIBQ3SRZPsaFTs-xNCu4rej7pwqWIobPdZ20jgV8las1G2g>
 <xme:E_YZYyei14DxCSGS2IAfDQugKMVik5VcUneHV-CcrUuimar3TzLS6Xq8-MclN__XH
 VXNLWZiJ50f9Ku_Z9M>
X-ME-Received: <xmr:E_YZY8xs09y0S8XFFwW_yCAdG-1jSOKDZx_cku77g7U-ZMOtMtrWDQiOpw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedtfedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepueeigefghfffffeifeehudeiuedvteegueefffevgfetvdffheehkeff
 vedufeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:E_YZYwMHuHLjTtcD4id5zjudOWWh84hu3GkTVuOPu-ThDVpls32v5Q>
 <xmx:E_YZY59yr3vj3GSjDbehToXaDzaOLHdvPijpyn8hLZT5HDHINbnEGA>
 <xmx:E_YZYwVEKVh_ApDL07RXjXw2dv-oLAeCIMsfsJiNUgiySgC6m7hFFw>
 <xmx:FPYZY5lfjsH1-vUzgP5LB5dOEZNbB11TWY6qNAU_GjLsPJzPD6qV-PBttKk>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Sep 2022 10:02:58 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Emma Anholt <emma@anholt.net>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime@cerno.tech>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: (subset) [PATCH v2 36/41] drm/sun4i: tv: Merge mode_set into
 atomic_enable
Date: Thu,  8 Sep 2022 16:02:54 +0200
Message-Id: <166264577079.2930603.15990827641277549331.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-36-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-36-459522d653a7@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>,
 Hans de Goede <hdegoede@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 29 Aug 2022 15:11:50 +0200, Maxime Ripard wrote:
> Our mode_set implementation can be merged into our atomic_enable
> implementation to simplify things, so let's do this.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

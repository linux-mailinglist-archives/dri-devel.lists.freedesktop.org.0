Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1B35F9E6D
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 14:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B493C10E4CC;
	Mon, 10 Oct 2022 12:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F49510E4C0;
 Mon, 10 Oct 2022 12:10:59 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 9013F2B05E7C;
 Mon, 10 Oct 2022 08:10:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 10 Oct 2022 08:10:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1665403854; x=
 1665411054; bh=L5Z5B6isr7zhmBy09gztcdAltnEW7XHKwrn1wwbNLVs=; b=s
 ASd12KPn7bXBdHSv9OIWlcM2Roxh3LEHN3jXT5q/OCCWX0ctY8LPsGO6LGG0ZrFq
 +8Iz3KlSLqN4pVS9hIiwex875g/nwOxaUuSHd7qT9Ik6MQHpvJFagjMTejs65p5n
 LqGvq/DPRoQUeapT8L/JQ6op01TAwuK6SVVwLfw2C+iUALyVqDx9S5s0ap1X73w6
 CcdkNmnHv3WaDgFN4BLv64m3ChuRTG2q5D1m9vcTYr9tkNK3jo8GZoTktbWbyIIv
 d9oIkMClQRekze1Dd13j9cA+5TqPCHJATZ3clml5xTs249oQOcLksxhg7WDcfzvq
 qQdlRsfND9U0wjV2HtHkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665403854; x=
 1665411054; bh=L5Z5B6isr7zhmBy09gztcdAltnEW7XHKwrn1wwbNLVs=; b=U
 Uk3UomI6uJxjliCeAsinYVQ8ymV4DrEZq/qPr4MxJ20hpUMWT08zb/LQO1i+va99
 WnYALo7P2PQn5rf1ITK+GAxi+0M4uhRhHrJcpaFH16ncIJBnhKdSiYN7qVQU1C6O
 CKGlC4pq9l3smlm013uILbgGvHyHgyQqiBRHucWSjEE6bu3fHlypm5PJ1hCthKNf
 /v0i1XtRHlnWWESZ/QMY4r+Qxqm068ixRglERlq1eCPIla+ZOGBid+vWDNIK+/8P
 38oGyKoIi+g4P5yoFSvJy5Myq9O5yyMF5+pks4aq7aJ4zGhGeIKXk2BRxjbLJZrN
 b+vRfw+wlLQCCeDOKHHkA==
X-ME-Sender: <xms:zgtEY8-1YGX0kockfv4QCa8qXQc172uoLq0EwsO2OmPM080pfcK-xA>
 <xme:zgtEY0t_T3JCDetFapi6uymG9z42Lkiu8mUgs8Ps5b84bNdgmGu3HzifAwqUfUkUq
 5Ivj-wRhe65W86LcPA>
X-ME-Received: <xmr:zgtEYyDtunJdIE6TB_sZ9f9Lb9LI-inM-aG4GqxYDsscPVv5bd4AKdKKRASH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejgedggeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepueeigefghfffffeifeehudeiuedvteegueefffevgfetvdffheehkeff
 vedufeeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:zgtEY8ciBWkhnmki44PenrN-plhi-yuJVw8zPYIdB-UWDGdGtCsY6w>
 <xmx:zgtEYxNdJjI_jtllgI14FOMLlok_qgzK7Gzvllt8OcOb9HTcnvQw5A>
 <xmx:zgtEY2lPX5ru_ago7Nu8gHGHxIO9w9f4sDFtnP_64nydvfF69RmIVA>
 <xmx:zgtEY4oQBY-nZUu5DcCnjexFPUaeuHFBZxR4jXxADNKA_--WnjSlVEcjZgs>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Oct 2022 08:10:53 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>, Karol Herbst <kherbst@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, Samuel Holland <samuel@sholland.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Chen-Yu Tsai <wens@csie.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Lyude Paul <lyude@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, Maxime Ripard <maxime@cerno.tech>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: (subset) [PATCH v4 04/30] drm/atomic-helper: Rename
 drm_atomic_helper_connector_tv_reset to avoid ambiguity
Date: Mon, 10 Oct 2022 14:10:37 +0200
Message-Id: <166540374295.183315.3036709435447216340.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220728-rpi-analog-tv-properties-v4-4-60d38873f782@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
 <20220728-rpi-analog-tv-properties-v4-4-60d38873f782@cerno.tech>
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
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?q?Noralf=20Tr=EF=BF=BD=EF=BF=BDnnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 29 Sep 2022 18:30:58 +0200, Maxime Ripard wrote:
> We currently have two sets of TV properties.
> 
> The first one is there to deal with analog TV properties, creating
> properties such as the TV mode, subconnectors, saturation, hue and so on.
> It's created by calling the drm_mode_create_tv_properties() function.
> 
> The second one is there to deal with properties that might be useful on a
> TV, creating the overscan margins for example. It's created by calling the
> drm_mode_create_tv_margin_properties().
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

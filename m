Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 362CE629404
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 10:14:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836CE10E391;
	Tue, 15 Nov 2022 09:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A0710E387;
 Tue, 15 Nov 2022 09:14:29 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 6D5822B067B9;
 Tue, 15 Nov 2022 04:14:24 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 15 Nov 2022 04:14:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668503664; x=
 1668510864; bh=82rrm1cPM5h8knW+8auhgpBiIWvA4DKT6azSx+4b8hE=; b=S
 5Z8aQMsDNqRonESvyTgzYgATFhMBJzcrTjGxZosyLrCPKbvwOHspyZMG2/tZK1Ow
 XXJqlk/ohT+n1B0axV2xSZR2l5d7yPgsYqxy2r6tkwQCs5j0Cwr2DyjmJsv9OV9a
 6L0Z4tECbsbR7efjbHbKAnUQ/Ah8q3kEtxE3QLy/f6OtdDysNDptPvdVCxoakKb9
 AA2dP9HqGGtAHJcHj/LNuGX4I5xVLHl36LEvFbRBXvQ95yRMw6+M/dpEUJWThjXL
 JsUTtII2WHTcAdwclDlM8bMptye1Mnst6tyofX0TZPiZgcO4F65gN2fALWoLvw36
 rWOWfcSr8vha34zMZlMVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668503664; x=
 1668510864; bh=82rrm1cPM5h8knW+8auhgpBiIWvA4DKT6azSx+4b8hE=; b=V
 +j7Qoh4kD3FTCtCfOkuHOVNIQFM8GjIAzB6lCnuFbxCZFvwu4PG/LSqtJ0mLBsvL
 +ns1HgX1FfD8bFJCUHyiX2Cj4ROpQ6N6NtqV0F7FdTzZhVE408/3VwJJQoCm51ak
 7Vg+Dac9jcwq3EHx8cuWOd6Gs1Hl/A6OK2xSD8MlSxt38Lz3D5gf/ThXS800g4I2
 EKgiYHC3pm2ndaIyAK/cym/PeBPZHbPiwL5WTGsVTp4+JWtdYPKg/CpVbmR+LV4t
 93HPyJ8sEqgC8GGk1SBePA913EqQyW+6FtrIBydQSatiwMFhpPVv6BHlBB9jdDmu
 7Tj794qKyvyvpotjGSIUg==
X-ME-Sender: <xms:b1hzYzu-mDq3L2PGB3nQ_DaeweunMaHSCKnbNM3rCvm5epmk7a4V3Q>
 <xme:b1hzY0cdTP4ehXQm9rasinMtDFPZb0HYYGQNriFLZDMSKDS-MnqHRu21OW7m8qRvr
 Ktba9VhqQluokyQqxY>
X-ME-Received: <xmr:b1hzY2yZii-6BOxoEvJ5vPTfmJfNPr4eVd2xi1eCS4t7ShNH3w6ZQFcgLSddClUcgBvVHuke0XhkHB42VvE6qxBoo-eObKNe03Q5AtNYOccR0g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeeggddtvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeifeeigeelhfehkeeltdetjeetueelteeuveekueevffduhefffefhhfeh
 gfehieenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:b1hzYyPHTSDlI1KZlqRlaFHyJYbtH7vgrzu0RcymXPq6pWDq3R8EzA>
 <xmx:b1hzYz8Aj8x7xQA0E3T737TnygB6FaJDZG231X_y9pEG2XN0fntCPw>
 <xmx:b1hzYyVRFvCm9GioiUmkLvdOtP6FTR1DDhhMXuV-yRVaSHruOSS07w>
 <xmx:cFhzY7a_AnRl5_VASlAuVkxX61xdom3w2SmdMPPJeaip9JA7g5GxbQAosJY>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Nov 2022 04:14:23 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <maxime@cerno.tech>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@csie.org>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, 
 Karol Herbst <kherbst@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Emma Anholt <emma@anholt.net>, Lyude Paul <lyude@redhat.com>
In-Reply-To: <20220728-rpi-analog-tv-properties-v9-8-24b168e5bcd5@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v9-0-24b168e5bcd5@cerno.tech>
 <20220728-rpi-analog-tv-properties-v9-8-24b168e5bcd5@cerno.tech>
Subject: Re: (subset) [PATCH v9 08/25] drm/client: Add some tests for
 drm_connector_pick_cmdline_mode()
Message-Id: <166850358084.1237314.23879958208527722.b4-ty@cerno.tech>
Date: Tue, 15 Nov 2022 10:13:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>, Noralf Tr��nnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 14 Nov 2022 14:00:27 +0100, Maxime Ripard wrote:
> drm_connector_pick_cmdline_mode() is in charge of finding a proper
> drm_display_mode from the definition we got in the video= command line
> argument.
> 
> Let's add some unit tests to make sure we're not getting any regressions
> there.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

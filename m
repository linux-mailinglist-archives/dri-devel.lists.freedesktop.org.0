Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D514D5AFF17
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 10:35:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B226B10E43A;
	Wed,  7 Sep 2022 08:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84CE510E437;
 Wed,  7 Sep 2022 08:35:20 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 5074F2B058ED;
 Wed,  7 Sep 2022 04:35:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 07 Sep 2022 04:35:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1662539715; x=
 1662546915; bh=igr6qV0Eap7xUGhc2oop9vyUXnwE0FGWJSHkINHCAhI=; b=q
 /5Cpz5wmf1mwzJktQrLqiRJNbE7FRpX5OQ9rnZKjEoNjOTcODD6+ZhKiu8tQOzZB
 rSQlX15NnPEovbWp8NMQKTuvlQT3Sop7RIqzbvKRIFPVZfGmTGG9SpBfUuljPzDs
 EXwg+xlIN3mwm5YMDk7cdUphSv3OYYUFLjh272Zd6JrXUNHUAp7MX8gOs0Rxlf1J
 DPff3VAZmv6ipflX74mSUzdKbDZle4Q1m1LXku19YZwumEcHT1pgorDdsDhRdWl7
 Q+wKdOGX/HfGRo5O+2tnBOADgjfTZ0Oc8HHEhkU7VSpmSZ9qtYaZGk1rBAyLVIZb
 wnSA/DtNHyImh+pgetFKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1662539715; x=
 1662546915; bh=igr6qV0Eap7xUGhc2oop9vyUXnwE0FGWJSHkINHCAhI=; b=g
 5nMgFf4L+SbZW5HRS12/t7VBHgbkL/z+rbOvxjR/VCekvNEF73oked/eSz7PMgov
 f+Pi2IpkNA9cgYKx7RN7Ns0p/L0GhxDZtmT7bk66JSYXUP7BdjTSSlC6HNA8mlWY
 MOcQ+I/+JYOEmcaqiakd4+tGo/9M3R/Dpv7Qop9bJzD4nYcdwIrvIJHOhXPPZCd/
 gGU2xS6hYhOOWmObEBzZL+89OFSHQ8QpaW1FkKsEpIXx4aPkbtn1FCNIH0bSa12s
 aIQ04+40fq8yS+VXPenRq5RgSczs4SkVBb8Y7tZgf1VjmtG8ARCgRGQe2ZXeBuPN
 6Hx6kFAxRHAXJXBPX3D5Q==
X-ME-Sender: <xms:wlcYYyA5D20iK0dkKl3xZV0Zr0xtX9Cl-s4qTNz0mNEPiZ-Szt_lVw>
 <xme:wlcYY8guRM42Vsz4FMirJ5nd3gTsWFtW8PZAJAcnEA6eSm0Q56zggl7-qtZXTO-7P
 gH5ODvk8DRGDCjMRFg>
X-ME-Received: <xmr:wlcYY1nzz5wnA5jZVnNGqyZJHxlGX7l18PgNy3b6J3zMZUWWsOHKWbonAPA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedttddgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepueeigefghfffffeifeehudeiuedvteegueefffevgfetvdffheehkeff
 vedufeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:wlcYYwz_G2L-cl3Ll3DtPNYWBQ7-RrX9uURvSRH_BQlJTN7iSsT9Zg>
 <xmx:wlcYY3QkZLAgjj7B9kCtDPo0QY2REcE_Db0Xp8IzisSWmScHi7ro4w>
 <xmx:wlcYY7ZZOsebrukJK5WuKsVzXZvvJHznw38uGNDBnEQrHiWiagEQmA>
 <xmx:w1cYY7LvDbHLfmef9qCFQIGfOnFAsRRpVRNR4HQ1DbDGwqvJOEUo30-zx8c>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Sep 2022 04:35:13 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: David Airlie <airlied@linux.ie>, Samuel Holland <samuel@sholland.org>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <mripard@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Emma Anholt <emma@anholt.net>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Lyude Paul <lyude@redhat.com>,
 Karol Herbst <kherbst@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <maxime@cerno.tech>
Subject: Re: (subset) [PATCH v2 24/41] drm/vc4: vec: Remove empty mode_fixup
Date: Wed,  7 Sep 2022 10:34:59 +0200
Message-Id: <166253967461.2236193.9388419483041463666.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-24-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-24-459522d653a7@cerno.tech>
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
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Hans de Goede <hdegoede@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 29 Aug 2022 15:11:38 +0200, Maxime Ripard wrote:
> The mode_fixup hooks are deprecated, and the behaviour we implement is the
> default one anyway. Let's remove it.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5695862940C
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 10:15:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F3B710E399;
	Tue, 15 Nov 2022 09:15:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FAA710E394;
 Tue, 15 Nov 2022 09:14:49 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id A6BA22B067C0;
 Tue, 15 Nov 2022 04:14:44 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 15 Nov 2022 04:14:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668503684; x=
 1668510884; bh=rX6lrK/x7gDl8linFFM/07jMaoEnPN855bl+cIeyljk=; b=T
 Xj2jzI7QnI0osu1B+sWSrMGwTpF47O+nhxAQcg7NhyKs3uhIjc5cryNlZPCfRSij
 m9d6kRJgfYqIA2lGec8DhGVzfmtBiGwcvQzAQgCO5kphVceAB7MtlRjlnmfxRRbJ
 uTDlyc66ll8y9dwJHUJQISKY+BryhVW8TmyRGJTtlTwabRCuCTVG0GJnTzHOK3P1
 A3adjc0GJCmCjGEBMoIyxtl+68seN++MYp+Si8NIPBd/jS205tuWe+PydYZnvV9Z
 pEM9iNyBY/zKBsjCwA7EL9ExXrMKHeWNl9MjWaDpiltDB9Z0OvUNUQyKqUlzTmuQ
 jfdNebdMyuo4WMAD2cWSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668503684; x=
 1668510884; bh=rX6lrK/x7gDl8linFFM/07jMaoEnPN855bl+cIeyljk=; b=l
 DqFYH+3EyRt1M4W7g8IBE0Dm4Kh62WjM2Ml93S/48umyWWbCpDcv6YFD1MxhPPCa
 nOJ4KK5uSGcFKqs8GIkBwkToph/hb+aNYn7eiXNI+GqC5N40h8/Ng6i/zirOtTGe
 vxnxXvpHFb8ZiSto0Bz8UDc+Ry3kBGiYhP2C21gIixLrbVph2z/3IXl7iTmjPiAa
 BcPXoKvGI/trsu8B2oGECNNjDAkCTo302ilm2R2B+Oc4bELbki8BcRI7/K8/L145
 qERuGGumfhHZs580vi9EH1Q/Rxgxf4tusM3A4gx0DsdJQzhSam/GIA1+SQ+H2F3C
 zftrusCwuRMM3FdmV/wrQ==
X-ME-Sender: <xms:hFhzY_B47SVCE9gqxoksbZDaxVUbybACP4ODcspiMKANX22GEz4IGQ>
 <xme:hFhzY1g6-mX1ck9fVP66fj7NO07laOX8r21kgHiHmeuEMdVeg2mn7IyxhxiKWi8A_
 syAUraRRVzlO4rTtAc>
X-ME-Received: <xmr:hFhzY6k_dkzdAugRxpjJtizDsOZ4Tvem2OPHmLMruWa5IamwO99RyAxxcfH_0ALuRr-DwJtAV3egHuFGAYz0MbwYL9xbxGDZc-dzGM2KW3_OZw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeeggddtvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeifeeigeelhfehkeeltdetjeetueelteeuveekueevffduhefffefhhfeh
 gfehieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:hFhzYxxdOk4NL8lEutlwKveBMJpXb70JqqlRMTR0FI4gb6sgbaSDBQ>
 <xmx:hFhzY0SRlBhw-d67HNybjafm-8FlBFtC-B-1QPaHk1vP5uWnd67y4A>
 <xmx:hFhzY0aOW1VNaOpd0mdnaIj3M7rGT5LS7du-LOgi0snX_DuEsx246w>
 <xmx:hFhzY7td-SSRFOZderR4oS-sQsmlkUpsPdp057MwbopzQb8C1ai87N_MD3k>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Nov 2022 04:14:43 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <maxime@cerno.tech>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@csie.org>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, 
 Karol Herbst <kherbst@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Emma Anholt <emma@anholt.net>, Lyude Paul <lyude@redhat.com>
In-Reply-To: <20220728-rpi-analog-tv-properties-v9-11-24b168e5bcd5@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v9-0-24b168e5bcd5@cerno.tech>
 <20220728-rpi-analog-tv-properties-v9-11-24b168e5bcd5@cerno.tech>
Subject: Re: (subset) [PATCH v9 11/25] drm/modes: Fill drm_cmdline mode from
 named modes
Message-Id: <166850359897.1237314.11879970127406356499.b4-ty@cerno.tech>
Date: Tue, 15 Nov 2022 10:13:18 +0100
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

On Mon, 14 Nov 2022 14:00:30 +0100, Maxime Ripard wrote:
> The current code to deal with named modes will only set the mode name, and
> then it's up to drivers to try to match that name to whatever mode or
> configuration they see fit.
> 
> The plan is to remove that need and move the named mode handling out of
> drivers and into the core, and only rely on modes and properties. Let's
> start by properly filling drm_cmdline_mode from a named mode.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

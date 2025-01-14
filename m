Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA32A109A8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 15:45:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C2410E370;
	Tue, 14 Jan 2025 14:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ArLYPNP+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7018A10E370
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 14:45:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id ED674A416A3;
 Tue, 14 Jan 2025 14:43:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96D8DC4CEE3;
 Tue, 14 Jan 2025 14:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736865932;
 bh=njLUbHodj+PkFFJbOpBXMJe/dUHzlPds6g689ssKjDA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ArLYPNP+SZ3jG9EoUmQe5FLLdIDakxwq6Q7RuSD32e73BsYYGiP0HGskwiYISsVk/
 A4cN4oaepryylm2zcdyZvwXYmrLXtLEkSjmh3sypogzbKV5dGowGgn5utBYogoeqCQ
 gGkaQY0DleA1JU9QhyMp3KQpXRHFHLHLiauaOSxLBjUzjflCEWHxRDD1Tr5JejWzfB
 rDcIoXWLIpb1nRBKBBEyfnD3XWjNbkCB8L9qbqxDEpYrpu5k96LEAYFBhQj/kso8Re
 cSId/vsSLtV+VWwQndcoz6njFJXIniqcEvPmIAynpF235AZiTHCOJKUOH9gpbPBxqK
 RiYjQh2gbztFQ==
Date: Tue, 14 Jan 2025 14:45:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Phong LE <ple@baylibre.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Russell King <linux@armlinux.org.uk>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: (subset) [PATCH v10 00/10] drm: add DRM HDMI Codec framework
Message-ID: <078e2d2f-3bd1-47ed-b6f8-60f6913fdce9@sirena.org.uk>
References: <20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org>
 <173680655387.149204.17517246537828613856.b4-ty@kernel.org>
 <CAA8EJprDaOTEOYf5JHC7UYwqRn2vXUH9FT==HjZg1QNfDMmBcA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nKWVI6A6JSkBavZP"
Content-Disposition: inline
In-Reply-To: <CAA8EJprDaOTEOYf5JHC7UYwqRn2vXUH9FT==HjZg1QNfDMmBcA@mail.gmail.com>
X-Cookie: Sauron is alive in Argentina!
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--nKWVI6A6JSkBavZP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 14, 2025 at 03:45:15AM +0200, Dmitry Baryshkov wrote:
> On Tue, 14 Jan 2025 at 00:16, Mark Brown <broonie@kernel.org> wrote:

> > [01/10] ASoC: hdmi-codec: pass data to get_dai_id too
> >         commit: a8e792d3f0bbecb87ab05e9592cadf0b178ab952
> > [02/10] ASoC: hdmi-codec: move no_capture_mute to struct hdmi_codec_pdata
> >         commit: 5b0779ae13de345b405a67c71cbb63705cadb295

> Mark, they had your Acks, so they were picked into drm-misc-next.
> Would that be a problem?

No, the reason I applied them was because I was getting fed up of the
resends and figured it would be easier to just apply the patches so they
were in -rc1 and could be dropped.  I'll have missed any mail about this
being applied due to the drm: header.

--nKWVI6A6JSkBavZP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeGeIIACgkQJNaLcl1U
h9BABAf/Rpl0QApU53vHkXku439fvk1W2JlcIkEhtO9wlYIsly+z2mnUMkCOSX4i
JLpb+GVB0L2TJAF1Y3HQ0ESBC6JzV7JzQiUqBkOTZEOQIXLdCu40xDg5coebNiS4
sw5DHqMiE7q3rAcXPCkkACdE+o+7S6CuIKgnMXuvMBcNUlNCcmbDEei/z3aSihs+
A/02s7UlSruEVd5UZv84abvqrMTVq963YEtAnbufnFJ/+xmJzqxzreVWOOMZFG3v
EmzqBpCq91RmV1JJ8gJe6RnmIfKn2PjesCresNQhoIQecqVkff5nZFIxu77C2vVF
UlobtBVzPrmFG8C//RkIpQUHCptnCQ==
=oDw/
-----END PGP SIGNATURE-----

--nKWVI6A6JSkBavZP--

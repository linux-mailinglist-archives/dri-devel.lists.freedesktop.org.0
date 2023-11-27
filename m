Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CAF7F9CD6
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 10:41:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E21D10E20E;
	Mon, 27 Nov 2023 09:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3228410E20E
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 09:41:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D917CCE107F;
 Mon, 27 Nov 2023 09:41:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31DAAC433C9;
 Mon, 27 Nov 2023 09:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701078060;
 bh=VAe16eg7y6ayTkfAT9VTCj+Q3FFIy+QqJ0XsEAFzdqo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ie6DAQKQwth6/jsj75eLcKctEZhUSo3DB0NwQ2dpsFGO1StB90BsXbeaHN0mAAp5r
 eBTOZ0KH8MvrhVT6ZSAnGs89nyE+jIjaFTVBfoRB5NI1Lx2Cch6ycLeW5aA1RB8nR1
 5Mrnhw6eBJEzPlKSL6d++7ZRL0QcMchZ30C/YoEic6QG3a+aEdIAWmzFtJFP3sLZAb
 4O2z7iEkjaCO8KpJx9qFQH2UviDu92Ydl/azM+Wc7SAkwxNbnb1cRGkcCrU4TRNM+b
 hmM91Th0AzdPz8u7IuiA4GPFBr4oJJ9Do4FmdDr4hCfNvLT4Y2j38vpWSBxUO0i+CW
 9jqQWwJk6rFyA==
Date: Mon, 27 Nov 2023 10:40:57 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Johan Jonker <jbx6244@yandex.com>
Subject: Re: [PATCH RFC v3 22/37] drm/rockchip: inno_hdmi: Remove useless
 output format
Message-ID: <pxj5yv3f5ukobsqfokd5ojh2is5za5wdv3imfqrlcu3smoib76@5lw5bwl77uvg>
References: <20231031-kms-hdmi-connector-state-v3-0-328b0fae43a7@kernel.org>
 <20231031-kms-hdmi-connector-state-v3-22-328b0fae43a7@kernel.org>
 <52b232e4-7ffa-1d01-efa6-a0af84729483@yandex.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fgomrsf3hj7iwzkr"
Content-Disposition: inline
In-Reply-To: <52b232e4-7ffa-1d01-efa6-a0af84729483@yandex.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 Samuel Holland <samuel@sholland.org>, Sandy Huang <hjc@rock-chips.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-doc@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--fgomrsf3hj7iwzkr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Nov 25, 2023 at 11:00:52AM +0100, Johan Jonker wrote:
> In stead of further cripplingRockchip HDMI drivers one could also make
> it functional based=A0 on EDID info.

I'm not crippling it, it was dead code. This has no functional impact
whatsoever.

> To start with the output could you turn RGB888 input and switch between
> RGB444, YCBCR444 and YCBCR422 output.

I don't have any hardware to test that out

Maxime

--fgomrsf3hj7iwzkr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWRkKQAKCRDj7w1vZxhR
xRUcAP9CI1PcttTNikiIZjxjYzvcKVQK/UCxKc5meY4XBGQ5OgD+LSZ4/nwHLH0l
7NofWH+K9NjPixshRfY99cdGrd+x+wc=
=/lNp
-----END PGP SIGNATURE-----

--fgomrsf3hj7iwzkr--

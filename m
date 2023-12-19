Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC13818725
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 13:13:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FF010E44B;
	Tue, 19 Dec 2023 12:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 356F110E188;
 Tue, 19 Dec 2023 12:13:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7C5536124D;
 Tue, 19 Dec 2023 12:13:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 576A0C433C7;
 Tue, 19 Dec 2023 12:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702987990;
 bh=SRbJeb/lafoOVi38gDCirQ380OjOLL/YF1Vy1K7bXbs=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=GXZM3VRuQRDhB+YjCDHplLpulygeailXQj/l7EahCLNnNk7S6KppMCFMW2fQW2Bc+
 GcdwFTwVjKX4TizCFWGbEFjhPABemIsovIRk/9SiZMLukPxTVys6UiENN0lR7tiOb8
 a9ruGNtUM5/WmEJhwBFNZxld+BDCZB93sJriWcgngwFfqejwkr+J3qHbebOyAUrOgE
 VYC8IB+aPNfjqjOA1kwb82buy1ri0Sg9pNeCwqEzhV35pN//kkPi+5XctkppdXAUEG
 nvBOahCweOHynS+ItfAfRfikVX9COGenUtcKajvvt7MIzGVdn8AyHqhffi1VBLELm1
 oHwIdXdqzZWVQ==
Date: Tue, 19 Dec 2023 13:13:06 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>, intel-gfx@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-fbdev@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jocelyn Falempe <jfalempe@redhat.com>, linux-sunxi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>
Subject: Re: [PATCH v5 00/20] remove I2C_CLASS_DDC support
Message-ID: <ZYGI0j1sQKWHyjgF@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 intel-gfx@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-fbdev@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jocelyn Falempe <jfalempe@redhat.com>, linux-sunxi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Yongqin Liu <yongqin.liu@linaro.org>,
 John Stultz <jstultz@google.com>
References: <20231123094040.592-1-hkallweit1@gmail.com>
 <ZV/FNWfw0jdXSglr@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nfTXMlsJedlWZlXe"
Content-Disposition: inline
In-Reply-To: <ZV/FNWfw0jdXSglr@ninjato>
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


--nfTXMlsJedlWZlXe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I created an immutable branch for this which the buildbots will
> hopefully check over night. I will reply with comments tomorrow when I
> got the buildbot results.

Applied to for-next, thanks!


--nfTXMlsJedlWZlXe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWBiM4ACgkQFA3kzBSg
KbbkDhAAlu3skAFMgL/czpyvc8H7iWxUzDlW5sljLuKQm3A0YXwBnsqjJmjCb/LG
H1zt31+/vygKszONX+ZtYzzzYxxeM0SE/gnaHdlexO6ohMXRdfMYF21WGwJVGLKq
iIVKhcRRxxWrB/mrgfv3s7tzBpM72r8xdOXOv72gEy25axtKmZu1B7G0UDxsRgoY
eX3bNKQYB/fL2JNR5htEUCW7ZfWIpGhPIPEjuXmIKgQOKgK97h1QpsADcftbHMpJ
NRulrstcOPJpZPvA7fpp9B0AIc3sLcA9hMR/JmGSzfZ/3ToGTXqfUAgH6mxbvWrf
Uf7HbOyyNFj2a03qHgQK6E3wDVR+rZ99v5fCriroj9g15+K2Paw5XOWNrode1NiO
5dal0ykGNFWh7Ru0TnPy0l4ouVmI3GwBAB1fBek3mSG1PpTzw2cIvIrAW8fjzEuu
xTQMjD7D8UPyE7yREFir6azghFNinIYPanaJyWycB7x1lYfwy8wbDlJNIaiWrDd6
lOSjG3iZ1XSY9LC0qibZo3vSGWFZfVjxSAMOVtsKBG3mTakCp2me/WUZDowtowhl
siROJjd87lXAh9paay6AV+KAAc4WYIQ3wzaIT8Kabya0A3aQTPh5f11l8SKfimeX
mOlNuwam1yEf3xbXUcqBnOUMQ7wewOU2tB2/g2pihA/Y0B6ZrLc=
=W3AE
-----END PGP SIGNATURE-----

--nfTXMlsJedlWZlXe--

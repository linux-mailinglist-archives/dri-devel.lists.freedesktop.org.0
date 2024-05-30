Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7988D4F88
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 18:01:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058BF10E72D;
	Thu, 30 May 2024 16:01:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pL7bmRgE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5804C10E72D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 16:01:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8048860B98;
 Thu, 30 May 2024 16:01:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B77EAC2BBFC;
 Thu, 30 May 2024 16:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717084905;
 bh=FP8/5FQncnWsBLeEJyks6gInPyOgSPm7Rv5Zub73SAs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pL7bmRgEb0J9tWmaHfOnM5mHqxmnFxqsysjHbNYmA/k9sbVt7KqH0VIr+Ul43l1qX
 1jDsrvGerBPUbumUczNEl6EFTJrGdHdNjOY88DfRVpqKKCSrOqD7s+4Z+hMql7lkGL
 mlrs4QzQZPC3heBY85/UvLvu8JS78L/MqWQzlSoMmS5YOhX1peBiaOTmliP2feDBj4
 Yvhzgzy0Qu9HWRfxhy2lTz/1nhCN3817T+aY7ePSF5+xszH1i/QMCOyI/FSIthFduX
 wcaOAQKE5qN9NluLT1oyqsPf9IQNBEHvNoAEXKy9LdfVmdxNdI+QWgMU4yCV8QMoSR
 m5lkFgMBjMEVQ==
Date: Thu, 30 May 2024 17:01:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, John Watts <contact@jookia.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: Add WL-355608-A8 panel
Message-ID: <20240530-satchel-playgroup-e8aa6937b8b9@spud>
References: <20240530082318.40516-1-ryan@testtoast.com>
 <20240530082318.40516-3-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="02T0Ro5vIUzEWiAz"
Content-Disposition: inline
In-Reply-To: <20240530082318.40516-3-ryan@testtoast.com>
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


--02T0Ro5vIUzEWiAz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 30, 2024 at 08:22:22PM +1200, Ryan Walklin wrote:
> The WL-355608-A8 is a 3.5" 640x480@60Hz RGB LCD display used in a
> number of handheld gaming devices made by Anbernic.

> By consensus a
> vendor prefix is not provided as the panel OEM is unknown.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    spi_lcd: spi {

The "spi_lcd" label is not used and can be dropped.


--02T0Ro5vIUzEWiAz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlii4wAKCRB4tDGHoIJi
0nVMAPsE4m1GYmW/3mLp51oYhB61w4I2oTPHFg9asROk00Hi2QD/cjtW6i4X3Okx
wqk1H8O9+xjsQ/5gspA7xFcIHQCQNQU=
=YXkF
-----END PGP SIGNATURE-----

--02T0Ro5vIUzEWiAz--

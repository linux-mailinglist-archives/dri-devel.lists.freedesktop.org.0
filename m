Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6D08FE2DD
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 11:32:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291B810E8AA;
	Thu,  6 Jun 2024 09:32:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qX8oGRT/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 257C710E8AA
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 09:32:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6197F61D09;
 Thu,  6 Jun 2024 09:32:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83EFCC4AF0D;
 Thu,  6 Jun 2024 09:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717666339;
 bh=fPwcz9PcQVr+dXSEZDosmZ7ie3Kr+GKp5dXJ0mDW5+Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qX8oGRT/hk67NF+4pgYIgwNsxPZIMNEXlMYo3+iKniuv2eRhkN5tz7vRvjnccJk40
 MfH8TPifEzyWipLTLn6AnM0QP+eKi3RizBFwgxZi1cxzQLWzhRzFAE+feiO3DnbpVB
 ZeISSA1Ms10jOsez6xVRmTgJyjhkg4XcxcX/dMd1NRO32UiQ79nAKOaCGOTkHDosf2
 MwikExCLf/gnlGjCkqC2XaqWJ3jiP6HnsG/vp5DMcAdVjK1DfTAMzBwOTLzj4qRx3k
 pR+h6J6Pawjtsei3Ix6btbOKYu6Pvvi7Avk/3zboeTAdPTDbO/HbyScbc1/8+/eq2U
 MKDy8VeHzzcwQ==
Date: Thu, 6 Jun 2024 11:32:16 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Hironori KIKUCHI <kikuchan98@gmail.com>, Chris Morgan <macroalpha82@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, John Watts <contact@jookia.org>, 
 Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: panel: Add WL-355608-A8 panel
Message-ID: <20240606-intelligent-aromatic-magpie-80a7a4@houat>
References: <20240530211415.44201-1-ryan@testtoast.com>
 <20240530211415.44201-3-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="xjhxlcmuj2evi5ma"
Content-Disposition: inline
In-Reply-To: <20240530211415.44201-3-ryan@testtoast.com>
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


--xjhxlcmuj2evi5ma
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 31, 2024 at 09:12:14AM GMT, Ryan Walklin wrote:
> The WL-355608-A8 is a 3.5" 640x480@60Hz RGB LCD display used in a
> number of handheld gaming devices made by Anbernic. By consensus a
> vendor prefix is not provided as the panel OEM is unknown.

Where has this consensus been found?

I had a look at the previous discussions, and I can't find any consensus
being reached there. And for that kind of thing, having the ack or
review of any of the DT maintainers would have been great.

For this kind of cases, we usually use the device it's attached to as
the vendor, so anbernic in this case. Can you send a followup patch?

Maxime

--xjhxlcmuj2evi5ma
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZmGCHwAKCRAnX84Zoj2+
dmxZAX4pKqW/khT/zXUOr+BBW6eu2tIIGzFo7WMiKhbxRIcWdUQH75SjZtS6I59l
80naA1oBfjTsyAuVx0OrYaS+Lpr/CQHR10Bp9eOs48keNgPqy24flMJ4gVReaLnV
tJkRQoQfcg==
=Vm6J
-----END PGP SIGNATURE-----

--xjhxlcmuj2evi5ma--

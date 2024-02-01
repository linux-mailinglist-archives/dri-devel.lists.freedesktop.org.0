Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89686845BA8
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 16:34:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A9CA10F2F5;
	Thu,  1 Feb 2024 15:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cknow.org header.i=@cknow.org header.b="dbsB0s4y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 359 seconds by postgrey-1.36 at gabe;
 Thu, 01 Feb 2024 15:34:31 UTC
Received: from out-184.mta1.migadu.com (out-184.mta1.migadu.com
 [95.215.58.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FCD810F2F5
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 15:34:31 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
 t=1706801306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=26SIQ5pnUVxGBuzI6N0P1NMwW5cCHuoQn92ze0+AFsQ=;
 b=dbsB0s4yLvfcXftjxVr1PtbRs0QgJobNiO59PIQlR+5vqDeS6MwE3KDheQe7Zeo/6jj9Wu
 3YYkWz02yT5UvIE6dYU778APsSZ3OoLjiw2acfpe6EN01sFNvUpeSrL9WCuwQ7DKzvVNL3
 TPT83bfEyHiowg7jkGq16z+gZOX95kRZ2T6KvX8sKvgryAaTlZGnuhBVcZpDNzM/RHvOGv
 4/CZVqJC3FKT9xqUgVCBSIcnoNPNHdQzMlaMeEzMw2mqMwUxCbwJIRXSNEwJOKrXBBIN8r
 hxvCJau/xkmanotkIlFn8oAO33+ZY43btxhwKWKJUXJ3S3dKTANUGpCdb6Y4Sw==
From: Diederik de Haas <didi.debian@cknow.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, Mark Yao <markyao0591@gmail.com>,
 Segfault <awarnecke002@hotmail.com>, Arnaud Ferraris <aferraris@debian.org>,
 Danct12 <danct12@riseup.net>, Ondrej Jirman <megi@xff.cz>,
 Manuel Traut <manut@mecka.net>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Manuel Traut <manut@mecka.net>
Subject: Re: [PATCH v4 4/4] arm64: dts: rockchip: Add devicetree for Pine64
 PineTab2
Date: Thu, 01 Feb 2024 16:28:15 +0100
Message-ID: <13234147.MA61SxHe9P@bagend>
Organization: Connecting Knowledge
In-Reply-To: <20240127-pinetab2-v4-4-37aab1c39194@mecka.net>
References: <20240127-pinetab2-v4-0-37aab1c39194@mecka.net>
 <20240127-pinetab2-v4-4-37aab1c39194@mecka.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1794107.V1UpVPejRP";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Migadu-Flow: FLOW_OUT
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

--nextPart1794107.V1UpVPejRP
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Diederik de Haas <didi.debian@cknow.org>
Date: Thu, 01 Feb 2024 16:28:15 +0100
Message-ID: <13234147.MA61SxHe9P@bagend>
Organization: Connecting Knowledge
In-Reply-To: <20240127-pinetab2-v4-4-37aab1c39194@mecka.net>
MIME-Version: 1.0

On Saturday, 27 January 2024 10:48:45 CET Manuel Traut wrote:
> This includes support for both the v0.1 units that were sent to developers
> and the v2.0 units from production.
> 
> v1.0 is not included as no units are known to exist.
> 
> Working/Tested:
> - SDMMC
> - UART
> - Buttons
> - Charging/Battery/PMIC
> - Audio
> - USB
> - Display
> - SPI NOR Flash
> 
> Signed-off-by: Alexander Warnecke <awarnecke002@hotmail.com>
> Signed-off-by: Manuel Traut <manut@mecka.net>

Everything seems to (still) work, so:
Tested-By: Diederik de Haas <didi.debian@cknow.org>

Thanks for submitting this upstream :-)

Cheers,
  Diederik
--nextPart1794107.V1UpVPejRP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZbu4kAAKCRDXblvOeH7b
blXGAQDP5qENxaN5dIVjBieTyOlY8fPPngqtXwFL4vkEdreqjQD/b48bb1yvUxQr
vS2R3FNuHLcDSnHLKoxjZg+592xUfAU=
=5fTJ
-----END PGP SIGNATURE-----

--nextPart1794107.V1UpVPejRP--




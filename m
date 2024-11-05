Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F88B9BD398
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 18:39:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D1610E417;
	Tue,  5 Nov 2024 17:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="g9lKUavl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 937B110E417
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 17:39:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7A692A43790;
 Tue,  5 Nov 2024 17:37:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9800EC4CED1;
 Tue,  5 Nov 2024 17:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730828383;
 bh=QZbld1TF8KsohUr4pPq9BpKFDSwxyE2URVgltsDBIDk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g9lKUavltsMy/YgW1mRbOREkoLHT6SzFY/ltRciRGIXWeU02o3fUYrVXpC4THnNEU
 j7CRaD86REpFzqxNAdJng+OPBJlIFv8GWy2JPT0v6DIfnAmoRsnFcBMbjtwBfxcjsA
 8h3IycPpR6OxDQfSm4/f7HNDy8qdVZvDw7AAS+zb6IfbfVwpTN3qO0x6ms25HfbaOq
 jUrNreINqb4mmREz3gmVLvFYPMp1qJIYKQnjwiqr6FWRYKHBpPY5ebPa3FEQiiQWPy
 bdfRmnZWJYR2Cmu8Yg4Xm1t447d6k8aQYaGzrabZsPey/BMbtvePXCilClscDGKPU0
 KYmhjE1Um9yZw==
Date: Tue, 5 Nov 2024 18:39:40 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Liu Ying <victor.liu@nxp.com>,
 andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_jesszhan@quicinc.com, 
 mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com,
 will@kernel.org, sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
 tomi.valkeinen@ideasonboard.com, 
 quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de,
 nfraprado@collabora.com, 
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: Re: (subset) [PATCH v5 00/13] Add ITE IT6263 LVDS to HDMI converter
 support
Message-ID: <20241105-succinct-pygmy-dingo-4db79c@houat>
References: <20241104032806.611890-1-victor.liu@nxp.com>
 <173080602214.231309.12977765173766280536.b4-ty@linaro.org>
 <20241105-secret-seriema-of-anger-7acfdf@houat>
 <CD810D31-F9C5-499D-86CF-B94BEF82449A@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="lpikbxgr4ajy2ceg"
Content-Disposition: inline
In-Reply-To: <CD810D31-F9C5-499D-86CF-B94BEF82449A@linaro.org>
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


--lpikbxgr4ajy2ceg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: (subset) [PATCH v5 00/13] Add ITE IT6263 LVDS to HDMI converter
 support
MIME-Version: 1.0

On Tue, Nov 05, 2024 at 05:33:21PM +0000, Dmitry Baryshkov wrote:
> On 5 November 2024 16:13:26 GMT, Maxime Ripard <mripard@kernel.org> wrote:
> >On Tue, Nov 05, 2024 at 01:28:48PM +0200, Dmitry Baryshkov wrote:
> >> On Mon, 04 Nov 2024 11:27:53 +0800, Liu Ying wrote:
> >> > This patch series aims to add ITE IT6263 LVDS to HDMI converter on
> >> > i.MX8MP EVK.  Combined with LVDS receiver and HDMI 1.4a transmitter,
> >> > the IT6263 supports LVDS input and HDMI 1.4 output by conversion
> >> > function.  IT6263 product link can be found at [1].
> >> >=20
> >> > Patch 1 is a preparation patch to allow display mode of an existing
> >> > panel to pass the added mode validation logic in patch 3.
> >> >=20
> >> > [...]
> >>=20
> >> Applied to drm-misc-next, thanks!
> >>=20
> >> [04/13] media: uapi: Add MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG, JEIDA}
> >>         commit: 5205b63099507a84458075c3ca7e648407e6c8cc
> >
> >Where's the immutable branch Laurent asked for?
>=20
> The patch set has been picked up after getting an Ack from Sakari,
> before Laurent's email. I am sorry if I rushed it in.

I mean, this was less than a day after you've asked that question
yourself. Waiting less than a day for a mail to be answered seems a bit
short, especially when there's no rush to merge these patches in the
first place.

Maxime

--lpikbxgr4ajy2ceg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZypYWAAKCRAnX84Zoj2+
dqB2AX9GZdjTPnmcByvgBSDmocLc9jx/UxPVwoxcockjnXv6ZTkFXoDJPi/fdgYU
ZVhEdvwBgMatI1KVXAWu/endQAK5PMRNxHeFsbekB5ouNQnFLuCJ1Hnf5FHt+whO
wHHi4EMLFA==
=rM90
-----END PGP SIGNATURE-----

--lpikbxgr4ajy2ceg--

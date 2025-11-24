Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F266C8094F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 13:51:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF39610E2B8;
	Mon, 24 Nov 2025 12:51:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WtaMyIGp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A48110E282
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 12:51:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7174A601B8;
 Mon, 24 Nov 2025 12:51:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F434C19421;
 Mon, 24 Nov 2025 12:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763988696;
 bh=EXDo7TfmqMYLXWZ+bEU8LHDRso075CUberKN/3Yl4CU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WtaMyIGpd0P0Yxd553IklvraZ7IuKp+jtok9+96rXwpbeE5QrU14D1ufrJVCGBLMd
 JyY6HBpS1WmBOXh8bbRwjtolFQtQN1p+40KcegUTLDiRnlLprmmEYgKmE9IWik6Gx2
 UDlfpSKhman3mgloEbSLoPoJsI28QboFahJ3t5Orxat58FDZRG1S1Oqv08E0PGIkK6
 uj4nJ+uhTVBkyu4dzlUgeO4zPLjl0mEldp81TlOqDNf/BHZHV/t8ti1ccfGYLL3Gub
 EhDL5TVJ97+/KCFlNlJyRdxlneQQKPAfTzgZVyakupTexIt6SfydIAwh09VJ0e1Ws7
 x4qjIspfHCfLw==
Date: Mon, 24 Nov 2025 13:51:33 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Schultz <d.schultz@phytec.de>
Cc: neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 thierry.reding@gmail.com, sam@ravnborg.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 upstream@lists.phytec.de
Subject: Re: [PATCH 1/2] drm/panel: panel-simple: Add Sharp LQ070Y3LG05
Message-ID: <ehhdijawntxsaguhygczk5vrb2quqg3ep5eer25auh7rrq5f3x@pvcaxa7n5ybm>
References: <20251124123938.936521-1-d.schultz@phytec.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="rvokvobwpqpxokhq"
Content-Disposition: inline
In-Reply-To: <20251124123938.936521-1-d.schultz@phytec.de>
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


--rvokvobwpqpxokhq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] drm/panel: panel-simple: Add Sharp LQ070Y3LG05
MIME-Version: 1.0

On Mon, Nov 24, 2025 at 04:39:37AM -0800, Daniel Schultz wrote:
> Add the Sharp LQ070Y3LG05 7" WVGA lanscape LVDS RGB TFT-LCD panel.
>=20
> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)

Any reason to use panel-simple over panel-lvds?

Maxime

--rvokvobwpqpxokhq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaSRU0AAKCRAnX84Zoj2+
dgFRAYC7ZxtCjqS1P8rnbGd1iiuHj8rT08fFhj2+PukMkX1ltGk4t6x4MbLmx3kZ
PS8hLn8BgPtouuM6DSesAlWkTSxBnuMWNum5pyqoc0TBDTiebftlSRgs+qZQMUUb
YYMpn0dumw==
=pIal
-----END PGP SIGNATURE-----

--rvokvobwpqpxokhq--

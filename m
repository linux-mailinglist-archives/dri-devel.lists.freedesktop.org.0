Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 849C8878407
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 16:42:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF92510E63D;
	Mon, 11 Mar 2024 15:42:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ljKD6Epw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A454E10E63D;
 Mon, 11 Mar 2024 15:42:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C94E9CE113D;
 Mon, 11 Mar 2024 15:42:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3E20C433F1;
 Mon, 11 Mar 2024 15:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710171748;
 bh=aqhRjI76v+bv52khrO1HHXTz4mSJ69TVhYQBRbIrjI0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ljKD6EpwoFLjSS4NUkRSNv5QCKEkV1Soa3UBNbqaBi1tLy86AtWL1kWu0sBMkqnLI
 iWq2vGEDY0ffMq13hVolyRefUmq27ybVPa8d5tS3IdHdYHLBJxDmWMOIkJbTObYuVv
 hRWKDp3gipZrnWuiozcxU8pxo2dgp3XfmDsXS7+OBfu54JvVnVrrdFCIrwsuBnZWUE
 FnB18KdTUSMnhHY/oZe+bj0yN7/DDPCuywdqBxxGKwiHhP45V2gHFLj+jNp1AE+2f4
 Bi50iXDJ9r6fiUranXbeRMb5asS56xEAPJeqdQs04fnBNrwZzpfeZnlJJRynf77wOL
 VBYJAz/eUTsSw==
Date: Mon, 11 Mar 2024 16:42:25 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC v2 0/5] drm/msm: make use of the HDMI connector
 infrastructure
Message-ID: <20240311-hypnotic-asparagus-shark-efe75a@houat>
References: <20240309-bridge-hdmi-connector-v2-0-1380bea3ee70@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="telqess2t2hb5icb"
Content-Disposition: inline
In-Reply-To: <20240309-bridge-hdmi-connector-v2-0-1380bea3ee70@linaro.org>
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


--telqess2t2hb5icb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Mar 09, 2024 at 12:31:27PM +0200, Dmitry Baryshkov wrote:
> This patchset sits on top Maxime's HDMI connector patchset ([1]).
>=20
> Currently this is an RFC exploring the interface between HDMI bridges
> and HDMI connector code. This has been lightly verified on the Qualcomm
> DB820c, which has native HDMI output. If this approach is considered to
> be acceptable, I'll finish MSM HDMI bridge conversion (reworking the
> Audio Infoframe code). Other bridges can follow the same approach (we
> have lt9611 / lt9611uxc / adv7511 on Qualcomm hardware).
>=20
> [1] https://patchwork.freedesktop.org/series/122421/
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v2:
> - Dropped drm_connector_hdmi_setup(). Instead added
>   drm_connector_hdmi_init() to be used by drm_bridge_connector.
> - Changed the drm_bridge_connector to act as a proxy for the HDMI
>   connector  infrastructure. This removes most of the logic from
>   the bridge drivers.
> - Link to v1: https://lore.kernel.org/r/20240308-bridge-hdmi-connector-v1=
-0-90b693550260@linaro.org

Overall, aside from the small comments on individual patches, I think
it's in good shape right now.

Thanks!
Maxime

--telqess2t2hb5icb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZe8mYAAKCRDj7w1vZxhR
xcJYAPsE9OUfafDUvbdD0djMOBMzoNkIx6BIzOWyl2qfbh3lUAD/cmCv01v/WK2d
+MTdWYpHjGsC79o9SGj1M6F8WW5tOwU=
=bKi3
-----END PGP SIGNATURE-----

--telqess2t2hb5icb--

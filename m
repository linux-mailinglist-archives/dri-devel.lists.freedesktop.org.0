Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D96A20883
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 11:29:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C54910E63B;
	Tue, 28 Jan 2025 10:29:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DBaMMK/W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF8210E63B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 10:29:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 26B1BA40BA5;
 Tue, 28 Jan 2025 10:27:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40BA8C4CED3;
 Tue, 28 Jan 2025 10:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738060155;
 bh=MbrOrR12wO0Cz/pgj8LdrGbVGmvqsMgT9HJGNYGKYkE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DBaMMK/WERNknQEQgpJo8og2vDfrmQDeQSrANS2x5NmpTAkNUx4VjgMQ7QFMtg0mM
 aZ1H+EbQCPALdiP+cJlQBcqMUSVlpCAA9s3k1IlCi44c5T7X1tLemCVCpPqoLOfkEM
 iluTKHZkS4q4HaHmHbhrJlYAtEjDKcWtaJImrwrAmrKs831C05ZutDr9yKoaJgEXwY
 CF3sc+WsCSFwwh4T0SO44McxM+CeS7ZJRGMlyYkRL2x2Ce3cskfR3OOBOzLb3JYXLu
 6fCkL0xUCqDTUhL0DCOV9PYOd4V6uwqnmrVy0F2DxBALfFUhA1UCim7bcWUGtUzEXG
 sKzs4aJZuokuA==
Date: Tue, 28 Jan 2025 11:29:12 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 03/10] drm/display: hdmi-state-helper: handle CEC
 physical address
Message-ID: <l7jzlpm735qwmasg2obpu6ogxhwvqm632wzem45c2pkxzfl3ck@dzmur2t6m6jz>
References: <20250126-drm-hdmi-connector-cec-v3-0-5b5b2d4956da@linaro.org>
 <20250126-drm-hdmi-connector-cec-v3-3-5b5b2d4956da@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="wrycs6lsut7iinca"
Content-Disposition: inline
In-Reply-To: <20250126-drm-hdmi-connector-cec-v3-3-5b5b2d4956da@linaro.org>
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


--wrycs6lsut7iinca
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 03/10] drm/display: hdmi-state-helper: handle CEC
 physical address
MIME-Version: 1.0

On Sun, Jan 26, 2025 at 03:29:08PM +0200, Dmitry Baryshkov wrote:
> Call HDMI CEC helpers in order to update physical address of the
> adapter.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--wrycs6lsut7iinca
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ5ixcwAKCRAnX84Zoj2+
do/XAX44dKoFK9+Qe4NY79WaWKrVrGvodsTTz5NRfCUrBr4cJCKA3cRjj5x8txBc
Q1R2nDgBgJTxDRqtP+3Ah7f2fTpUkwrLrjcybM8GyPpD0o7w4dLL0yilL5Z5ZEK9
MHjax+E9sQ==
=aCXr
-----END PGP SIGNATURE-----

--wrycs6lsut7iinca--

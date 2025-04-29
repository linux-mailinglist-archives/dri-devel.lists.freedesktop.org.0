Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0589AA108D
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 17:33:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A16910E4D3;
	Tue, 29 Apr 2025 15:33:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="As0clNKB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7935810E4D3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 15:33:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 91A1461567;
 Tue, 29 Apr 2025 15:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A17BC4CEE3;
 Tue, 29 Apr 2025 15:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745940797;
 bh=QRc538ahWb8AMl4t/fqcG4itSbaOR0buUFsVMWElxNs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=As0clNKBo8KGh/FMC2d3vvXI5kA5xPIXGrWZI1QE+A+sN/lm4TiRe6fWTnnBnFOQy
 BaT11ATRyz3H5ZS5EMMQfn35ROu5xHIPj2ovzvI2Xomk6nCEzNReWivdAQAQxCh9/h
 yA1m9aEOvDFn5y5KVE4mk4f+Pnye510RA9Mj62vMtC44VKLtkpatStAFjYQWO6eWum
 0bJeNmOGz0kOa8l6kKYwmpclecEXUvUlzanfVQrAwFesd61DDmJfXL9EytOd2Y0jyA
 8HNxw59BRcAkMTNhmc97rtSz3NoV1DVlf4kP5+0ge6TFK0VXS2KjM8iTQrHQnM5MEA
 f+tTOHtRnpKtA==
Date: Tue, 29 Apr 2025 17:33:15 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v5 03/11] drm/connector: add CEC-related fields
Message-ID: <20250429-rainbow-jumping-boar-dbbb3c@houat>
References: <20250407-drm-hdmi-connector-cec-v5-0-04809b10d206@oss.qualcomm.com>
 <20250407-drm-hdmi-connector-cec-v5-3-04809b10d206@oss.qualcomm.com>
 <20250414-augmented-origami-fulmar-acb97b@houat>
 <ac890d36-f61a-456b-9833-4615f691eed6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="366y4vsvvysta3b6"
Content-Disposition: inline
In-Reply-To: <ac890d36-f61a-456b-9833-4615f691eed6@oss.qualcomm.com>
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


--366y4vsvvysta3b6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 03/11] drm/connector: add CEC-related fields
MIME-Version: 1.0

On Tue, Apr 15, 2025 at 12:10:06PM +0300, Dmitry Baryshkov wrote:
> On 14/04/2025 17:52, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Mon, Apr 07, 2025 at 06:11:00PM +0300, Dmitry Baryshkov wrote:
> > > +/**
> > > + * struct drm_connector_cec - DRM Connector CEC-related structure
> > > + */
> > > +struct drm_connector_cec {
> > > +	/**
> > > +	 * @mutex: protects all fields in this structure.
> > > +	 */
> > > +	struct mutex mutex;
> > > +
> > > +	/**
> > > +	 * @funcs: CEC Control Functions
> > > +	 */
> > > +	const struct drm_connector_cec_funcs *funcs;
> > > +
> > > +	/**
> > > +	 * @data: CEC implementation-specific data
> > > +	 */
> > > +	void *data;
> >=20
> > Is there a reason we don't just skip that data? The only user I'm seeing
> > so far are the helpers, and they only put the cec_adapter pointer in
> > there.
> >=20
> > Can't we pass the connector to CEC and make the adapter part of drm_con=
nector_cec?
>=20
> It will be either cec_notifier or cec_adapter +
> drm_connector_hdmi_cec_funcs. Initially I sketched a union here, but then=
 I
> thought that a void pointer makes more sense. It allows us to make CEC da=
ta
> helper-specific. For example, cec-pin might store platform callbacks here.
> DP CEC might need to store AUX pointer, etc.

Ah I see, that makes sense.

Thanks!
Maxime

--366y4vsvvysta3b6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaBDxOgAKCRAnX84Zoj2+
dl/aAYCik51xsbDezLJo8jlJ5MHP+NTPYmBAZuSpj83lu4TBoUOJKS9aywuMfhJa
pT0FJZwBgOb3tH0d4pJUW2Ke9bYpnhbnLv5UiQg0UKm9KtB9JLtFM5mFNAu3hWj9
QwgA3/uQhw==
=//IR
-----END PGP SIGNATURE-----

--366y4vsvvysta3b6--

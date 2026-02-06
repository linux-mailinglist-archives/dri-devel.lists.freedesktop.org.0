Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CPxKBz1hWnHIgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 15:05:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48507FE9B5
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 15:05:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE3D10E7B0;
	Fri,  6 Feb 2026 14:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IauM6qxA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD0610E7AE;
 Fri,  6 Feb 2026 14:05:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C4FEA6001A;
 Fri,  6 Feb 2026 14:05:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEEE2C116C6;
 Fri,  6 Feb 2026 14:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770386711;
 bh=TaPvEsWxvpYYOThGeX1+fx1sD+0RPf/kwBUPBJTjDY4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IauM6qxASUz/Fo2EiCWex3fCTVey671ArIsYwK+3iWyqrXjBxzIIu0605avahH/xr
 bSczKKlSeMkMSaXRdtdNAm4UwaNkQISaJ4zChYTk8plrSLGlCORmAIB3y7aPZDe4W3
 OMLxLp8FrcOjYrrUT+1D4xG/ZcuP8aTy+c8DrQT5CEluNQJ8y+by7nO9V4JKFd8kDf
 gUyBwVFXjeV1lcwrd19xHwLadFcEVKvrpaQx8sJ5EyzqWQJtC6tjjnUlX2y38QsmVO
 NavvJ2C/rmXxkBKX2/nuo7Rir0p9ae99WqUXRqq6JjEHoeddDS8lKaqWyY5NfewNXW
 EeLaCc7mQMLFw==
Date: Fri, 6 Feb 2026 15:05:08 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 kernel@collabora.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-doc@vger.kernel.org, 
 Andri Yngvason <andri@yngvason.is>, Werner Sembach <wse@tuxedocomputers.com>, 
 Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH v7 02/22] drm: Add new general DRM property "color format"
Message-ID: <20260206-deft-provocative-perch-6ca9bf@houat>
References: <20260121-color-format-v7-0-ef790dae780c@collabora.com>
 <20260121-color-format-v7-2-ef790dae780c@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="tlakrgvje6y2sbf2"
Content-Disposition: inline
In-Reply-To: <20260121-color-format-v7-2-ef790dae780c@collabora.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[39];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,suse.de,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org,yngvason.is,tuxedocomputers.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 48507FE9B5
X-Rspamd-Action: no action


--tlakrgvje6y2sbf2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 02/22] drm: Add new general DRM property "color format"
MIME-Version: 1.0

Hi,

On Wed, Jan 21, 2026 at 03:45:09PM +0100, Nicolas Frattaroli wrote:
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 7eaec37ae1c7..b5604dca728a 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -556,6 +556,16 @@ enum drm_colorspace {
>  	DRM_MODE_COLORIMETRY_COUNT
>  };
> =20
> +enum drm_color_format {
> +	DRM_COLOR_FORMAT_AUTO			=3D 0,
> +	DRM_COLOR_FORMAT_RGB444			=3D BIT(0),
> +	DRM_COLOR_FORMAT_YCBCR444		=3D BIT(1),
> +	DRM_COLOR_FORMAT_YCBCR422		=3D BIT(2),
> +	DRM_COLOR_FORMAT_YCBCR420		=3D BIT(3),
> +};
> +
> +#define DRM_COLOR_FORMAT_COUNT 5
> +

I don't really see a reason to expose an enum, with a bunch of values
that are all mutually exclusive, as a bitmask. It's pretty inconsistent
with most (all?) the other similar properties we have.

I appreciate you did that to avoid fixing up every driver using those
values, but then maybe we don't have to? We could create a userspace
facing enum, and convert to DRM_COLOR_FORMAT internally.

Maxime

--tlakrgvje6y2sbf2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaYX1EAAKCRAnX84Zoj2+
dm20AYC5qAkdhJdQsWaSZelEFrrJKVRqs5zBtYWPBOAMRObg77mefUoSO3ktgK9d
TYXfpzUBgPXlGrYnILXs7XVYlFu//eO6ufmogZ3qIYuVKGT1yKooE8WKx/MfpzM3
iY+f6mFzuA==
=GGG7
-----END PGP SIGNATURE-----

--tlakrgvje6y2sbf2--

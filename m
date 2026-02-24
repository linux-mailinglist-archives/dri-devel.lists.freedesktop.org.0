Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCKAI3JpnWnBPwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 10:03:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0621A18430B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 10:03:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57C3010E522;
	Tue, 24 Feb 2026 09:03:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EY0o15rc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E04A710E51F;
 Tue, 24 Feb 2026 09:03:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EE51A60145;
 Tue, 24 Feb 2026 09:03:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18FFBC116D0;
 Tue, 24 Feb 2026 09:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771923820;
 bh=F66MvL8Ia7cFuSm/xIyKma6BJNqk8VAV91xYEJfDrVg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EY0o15rcNpeohXzKzHiT9RXLl5kMeW1SU7uJP4j5vdBXUrNRY6a5C+/OcAjng08uR
 Rl6JkyaqdyQznw5IFlCczaP7rRSb8iAqrPn5VodGC6D/C1Z16P2UZmpcXL3BtEl3ze
 uenoEDKvbAopscHS02nSxIqf2ehtR7UtybzG2acv1jVBwJ8MQ4Ic1c6hxkhoiQTLSk
 IYPylxg2vmsIcFlPlIsnXjJ+NOrY3JIC5tvlamDn1EO6oFOtX7+PvItdWwHjUn9V7+
 FWNB14pxkA4x1NJNVz5TN6leROlqjT+1c+FYkRVroInPqD8Vumk+fEYE2ycDMpBREq
 E4Qsy059s6ndQ==
Date: Tue, 24 Feb 2026 10:03:37 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
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
 Andy Yan <andy.yan@rock-chips.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, 
 kernel@collabora.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, Andri Yngvason <andri@yngvason.is>, 
 Werner Sembach <wse@tuxedocomputers.com>,
 Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH v8 02/20] drm: Add new general DRM property "color format"
Message-ID: <20260224-rustling-provocative-lemming-b2ed2f@houat>
References: <20260216-color-format-v8-0-5722ce175dd5@collabora.com>
 <20260216-color-format-v8-2-5722ce175dd5@collabora.com>
 <3b5e5af4219671c5b4ffdcb09bd22679332244ac@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="36zlw2efj76bnmz3"
Content-Disposition: inline
In-Reply-To: <3b5e5af4219671c5b4ffdcb09bd22679332244ac@intel.com>
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
	FREEMAIL_CC(0.00)[collabora.com,amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,suse.de,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net,lists.freedesktop.org,vger.kernel.org,lists.infradead.org,yngvason.is,tuxedocomputers.com];
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
X-Rspamd-Queue-Id: 0621A18430B
X-Rspamd-Action: no action


--36zlw2efj76bnmz3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 02/20] drm: Add new general DRM property "color format"
MIME-Version: 1.0

Hi Jani,

On Mon, Feb 23, 2026 at 06:17:23PM +0200, Jani Nikula wrote:
> On Mon, 16 Feb 2026, Nicolas Frattaroli <nicolas.frattaroli@collabora.com=
> wrote:
> > +/**
> > + * enum drm_color_format_enum - color model description
> > + *
> > + * This enum is a high-level description of the component makeup of th=
e image
> > + * data. It says nothing about how the components are ordered or how m=
any bits
> > + * they take up (i.e. is unlike MEDIA_BUS_FMT\_ or DRM_FORMAT\_), but
> > + * describes the type of components (Luminance-Chrominance vs. RGB) an=
d the
> > + * sub-sampling.
> > + *
> > + * &enum drm_color_format_enum makes statements about the same attribu=
te of
> > + * an image as the DRM_COLOR_FORMAT\_ bitfields do. Its purpose is to =
inform
> > + * choices made by display protocol specific implementations when it c=
omes to
> > + * translating it to e.g. &enum hdmi_colorspace or &enum dp_pixelforma=
t, both
> > + * of which also describe the same attribute of the image at the same =
level of
> > + * specificity.
> > + *
> > + * In precise terms, this enum describes a color model. It makes no st=
atements
> > + * about the primaries, gamma, or current phase of the moon used in co=
nversion
> > + * from one to the other. Furthermore, it also makes no statements abo=
ut the
> > + * order of components (e.g. RGB vs. BGR), their depth in bits, or the=
ir binary
> > + * packing.
> > + */
> > +enum drm_color_format_enum {
>=20
> The enum name should not have "enum" in it. That's just not a style
> that's being used.
>=20
> > +	/**
> > +	 * @DRM_COLOR_FORMAT_ENUM_AUTO: The choice of format is left up to the
> > +	 * display protocol implementation. All implementations of the same
> > +	 * display protocol (e.g. HDMI) are supposed to behave the same way,
> > +	 * though display protocols may choose to behave differently compared=
 to
> > +	 * each other (e.g. HDMI's "AUTO" does not have to match DP's "AUTO").
> > +	 *
> > +	 * Implementations may rely on @DRM_COLOR_FORMAT_ENUM_AUTO to be fals=
y.
> > +	 */
> > +	DRM_COLOR_FORMAT_ENUM_AUTO =3D 0,
>=20
> Ditto for the enumeration names, no ENUM in them please.
>=20
> > +
> > +	/**
> > +	 * @DRM_COLOR_FORMAT_ENUM_RGB444: Image components are encoded as RGB
> > +	 * values of equal resolution.
> > +	 */
> > +	DRM_COLOR_FORMAT_ENUM_RGB444,
> > +
> > +	/**
> > +	 * @DRM_COLOR_FORMAT_ENUM_YCBCR444: Image components are encoded as
> > +	 * luminance and chrominance of equal resolution.
> > +	 */
> > +	DRM_COLOR_FORMAT_ENUM_YCBCR444,
> > +
> > +	/**
> > +	 * @DRM_COLOR_FORMAT_ENUM_YCBCR422: Image components are encoded as
> > +	 * luminance and chrominance with the chrominance components having h=
alf
> > +	 * the horizontal resolution.
> > +	 */
> > +	DRM_COLOR_FORMAT_ENUM_YCBCR422,
> > +
> > +	/**
> > +	 * @DRM_COLOR_FORMAT_ENUM_YCBCR420: Image components are encoded as
> > +	 * luminance and chrominance with the chrominance components having h=
alf
> > +	 * the horizontal and vertical resolution.
> > +	 */
> > +	DRM_COLOR_FORMAT_ENUM_YCBCR420,
> > +
> > +	/**
> > +	 * @DRM_COLOR_FORMAT_ENUM_NUM: The number of valid color format values
> > +	 * in this enum. Itself not a valid color format.
> > +	 */
> > +	DRM_COLOR_FORMAT_ENUM_NUM,
> > +
> > +	/**
> > +	 * @DRM_COLOR_FORMAT_ENUM_INVALID: Error return value for conversion
> > +	 * functions encountering unexpected inputs.
> > +	 */
> > +	DRM_COLOR_FORMAT_ENUM_INVALID =3D -EINVAL,
>=20
> Please don't hide negative error codes inside enums. If you need to
> return one from a function, please return the negative error code
> directly instead.
>=20
> > +};
> > +
> > +/*
> > + * Constants for specifying bit masks for e.g. providing a list of sup=
ported
> > + * color formats as a single integer.
> > + */
> > +#define DRM_COLOR_FORMAT_RGB444		BIT(0)
> > +#define DRM_COLOR_FORMAT_YCBCR444	BIT(1)
> > +#define DRM_COLOR_FORMAT_YCBCR422	BIT(2)
> > +#define DRM_COLOR_FORMAT_YCBCR420	BIT(3)
>=20
> I don't think we should define both enum and mask. One or the
> other. Moreover, now you have two independent definitions for the same
> thing, with nothing to ensure they keep matching. It's a bug waiting to
> happen.
>=20
> I think the problem is that they were originally defined as bits even
> though most places actually use them as single values only. It's
> confusing. It would probably have been better to just use enums and
> BIT(DRM_COLOR_FORMAT_*) where a mask is needed.
>=20
> Maybe that's what should be done as the first step anyway.

I largely agree with the sentiment, and can extend it to the
HDMI_COLORSPACE used in drm_connector_hdmi_state.

I've been working since yesterday on fixing that up to make Nicolas'
life easier. I'll post it sometime today.

Maxime

--36zlw2efj76bnmz3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaZ1paQAKCRAnX84Zoj2+
dhj+AYCJxRTvr7o7P0A0JR9ICn8LRGV7zoUZ6CpFzW+1A23VNzGrMHwlhRmfhyfX
tIXqxK4BgKdTepytTJVLjkyW62yHxmDFSIGl3zjxOOEMlvvU+yKc/TvA/GTUDyqw
nc1ZuwKhKg==
=86U0
-----END PGP SIGNATURE-----

--36zlw2efj76bnmz3--

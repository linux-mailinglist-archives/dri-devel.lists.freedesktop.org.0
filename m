Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIHmDOdpi2k1UQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 18:24:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE30111DE66
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 18:24:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 622F510E5E0;
	Tue, 10 Feb 2026 17:24:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ng5pmDJN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C2310E22A;
 Tue, 10 Feb 2026 17:24:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4E13160141;
 Tue, 10 Feb 2026 17:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70CDBC19424;
 Tue, 10 Feb 2026 17:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770744289;
 bh=AybflH6vCiFt0c5IgI0vjl85jJ21G95boT+74nEtcOk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ng5pmDJNkBc2/oSRx4pOQZtMwfVdnyLJCAe+kx5tWyYItYLMZQhdYN1JE+R3ufDCh
 Sg3MPeIvUefZiasC4ZD9NZ69q61KWUj9jJc70gTsT44q7Q7e4ruOwJ9x+J4guA4lYn
 72mmOFfmlEJ0RoX0lX6wRJTTZMjmjgf1RWmc5JylLOP3m0B0ER3uqzfdJ0LU6yYr89
 1my9GNZBbWW+nOuxJ33JuBoa0ELUcTqbIRdBPIMnuLKZOhptweV4AQdHhfv2b3RHOk
 fjvj7G/GuPv4VuzsnknEAcq+Hdt4sUa+ypgV+QzMPvpmipP+okDxfu9/sBzc27vkWV
 hV0aZRNUVvh5A==
Date: Tue, 10 Feb 2026 18:24:46 +0100
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
 linux-doc@vger.kernel.org, Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH v7 03/22] drm: Add enum conversions between
 DRM_COLOR_FORMAT and HDMI_COLORSPACE
Message-ID: <20260210-prophetic-elk-of-superiority-b0ab03@houat>
References: <20260121-color-format-v7-0-ef790dae780c@collabora.com>
 <20260121-color-format-v7-3-ef790dae780c@collabora.com>
 <20260206-angelic-crimson-bug-aaab40@houat>
 <2028270.PYKUYFuaPT@workhorse>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="3gcl4wmc7phuuk27"
Content-Disposition: inline
In-Reply-To: <2028270.PYKUYFuaPT@workhorse>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[37];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,suse.de,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: BE30111DE66
X-Rspamd-Action: no action


--3gcl4wmc7phuuk27
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 03/22] drm: Add enum conversions between
 DRM_COLOR_FORMAT and HDMI_COLORSPACE
MIME-Version: 1.0

Hi,

On Sat, Feb 07, 2026 at 08:55:16PM +0100, Nicolas Frattaroli wrote:
> On Friday, 6 February 2026 15:08:46 Central European Standard Time Maxime=
 Ripard wrote:
> > On Wed, Jan 21, 2026 at 03:45:10PM +0100, Nicolas Frattaroli wrote:
> > > While the two enums have similar values, they're not identical, and
> > > HDMI's enum is defined as per the HDMI standard.
> > >=20
> > > Add a simple conversion function from DRM to HDMI. Unexpected inputs
> > > aren't handled in any clever way, DRM_COLOR_FORMAT_AUTO and any other
> > > value that doesn't cleanly map to HDMI just gets returned as
> > > HDMI_COLORSPACE_RGB.
> > >=20
> > > Add a second conversion function that gets a DRM_COLOR_FORMAT from an
> > > HDMI_COLORSPACE as well. In this case, reserved HDMI values that can't
> > > be converted will result in an -EINVAL return value.
> > >=20
> > > Co-developed-by: Marius Vlad <marius.vlad@collabora.com>
> > > Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> > > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > > ---
> > >  include/drm/drm_connector.h | 54 +++++++++++++++++++++++++++++++++++=
++++++++++
> > >  1 file changed, 54 insertions(+)
> > >=20
> > > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > > index b5604dca728a..ffeb42f3b4a3 100644
> > > --- a/include/drm/drm_connector.h
> > > +++ b/include/drm/drm_connector.h
> > > @@ -2612,6 +2612,60 @@ int drm_connector_attach_color_format_property=
(struct drm_connector *connector);
> > > =20
> > >  const char *drm_get_color_format_name(enum drm_color_format color_fm=
t);
> > > =20
> > > +/**
> > > + * drm_color_format_to_hdmi_colorspace - convert DRM color format to=
 HDMI
> > > + * @fmt: the &enum drm_color_format to convert
> > > + *
> > > + * Convert a given &enum drm_color_format to an equivalent
> > > + * &enum hdmi_colorspace. For non-representable values and
> > > + * %DRM_COLOR_FORMAT_AUTO, the value %HDMI_COLORSPACE_RGB is returne=
d.
> > > + *
> > > + * Returns: the corresponding &enum hdmi_colorspace value
> > > + */
> > > +static inline enum hdmi_colorspace __pure
> > > +drm_color_format_to_hdmi_colorspace(enum drm_color_format fmt)
> > > +{
> > > +	switch (fmt) {
> > > +	default:
> > > +	case DRM_COLOR_FORMAT_AUTO:
> > > +	case DRM_COLOR_FORMAT_RGB444:
> > > +		return HDMI_COLORSPACE_RGB;
> >=20
> > I don't think that's correct. What auto ends up as totally depends on
> > the atomic state it comes with.
> >=20
> > At the very least, you should output a warning there, because that case
> > should never happen.
>=20
> Yeah, my hope was to keep this function __pure so that the compiler
> has maximum freedom to do whatever. With a WARN, it's got side-effects
> now, and we're no longer pure. With a status return value and an output
> parameter, it's no longer pure either, because the output parameter is
> not local memory.
>=20
> The limiting factor here is that as I understand correctly, I can't
> really extend the hdmi_colorspace enum, as it's basically 1:1 from
> the standard. Doing this would be the ideal solution, because we'd
> keep the function pure and without surprise conversions happening.

I feel like this kind of loops back into the other two reviews I did:
you paint yourself into a corner by having auto in the enum, and by
passing it directly to that function.

If, instead, you don't allow auto in the drm_color_format enum, and
resolve auto in the hdmi_compute_config function instead of passing it
directly, then we don't have to deal with it here.

> Looking at hdmi_colorspace_get_name in drivers/video/hdmi.c, it returns
> "Invalid" for any value not in the enum itself. Would it be allowable
> to tack an HDMI_COLORSPACE_INVALID at the end of the enum with perhaps
> a negative value, or is there a different approach you'd prefer?

And again, if we only ever have to deal with RGB, YUV420, 444 or 422,
then we always have valid values for HDMI_COLORSPACE.

Plus, the hdmi_colorspace enum matches what the hdmi spec defines, so we
can't really extend it, and most importantly, hdmi_colorspace_get_name()
is only ever used for debugging / logging purposes, it's never in the
"functional" path.

Maxime

--3gcl4wmc7phuuk27
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaYtp3QAKCRAnX84Zoj2+
dpXQAX9YW7+dFFercH/6Ci5pTtOduK0WFGtCE+czBS0MekL3hIR8Qk0XOe/wCQ0N
lSl/1g0BfiBZVN1+rZWOQ89eweN9INWHQO3r4Uh4l9OvZzduZolxq+5q62yTdhYG
QVZ10CHXHA==
=jFA7
-----END PGP SIGNATURE-----

--3gcl4wmc7phuuk27--

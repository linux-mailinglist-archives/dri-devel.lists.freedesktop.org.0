Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCu5H9JNqWlp4QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 10:33:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C3A20E7CF
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 10:33:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C5110EBD7;
	Thu,  5 Mar 2026 09:33:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="a95GeOy3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 380EE10EBD6;
 Thu,  5 Mar 2026 09:33:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E46904005D;
 Thu,  5 Mar 2026 09:33:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43DBBC19423;
 Thu,  5 Mar 2026 09:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772703181;
 bh=J1mPT0AS8G1kySDxO52H0dygz5R6XVL35p3Y+NkqEgs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a95GeOy3NiPdBOqMQASBUPOamqYfl0FLVGcbxOgvYBHwGTjZVrzEX5K33FLrVBezv
 xsGGp75ylQLEv0gME68PFfq67dpOdq+tFzm7dRZw8OHjs5O7YA+t0USAlx2OkXZxsE
 0F6pJeDYsNDp4MncGFvuL/NgDTNFA44ahWG0eQ7YI3kHLsqNFMwbuBanMj9T8ISewP
 ZLa8wISf1QPRTlFmAoHnRRMGe9HtJ09u++rOeW2kjpE9CfiHGzGD+gkpIMOqmtyyCy
 58qwM1coJUmNA4IX49yeejBpXhcJ6Piw8c6vtCgf5xS5r0RuJEFRUCuB6LxUkedn0I
 mADgD+p2e1AxA==
Date: Thu, 5 Mar 2026 10:32:59 +0100
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
 Shuah Khan <skhan@linuxfoundation.org>, kernel@collabora.com,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v9 04/19] drm/display: hdmi-state-helper: Act on color
 format DRM property
Message-ID: <20260305-sweet-boar-of-certainty-70f15f@houat>
References: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
 <20260227-color-format-v9-4-658c3b9db7ef@collabora.com>
 <20260302-literate-shrew-of-health-ec19d2@houat>
 <8648916.T7Z3S40VBb@workhorse>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="etgtgheqnhe6g46r"
Content-Disposition: inline
In-Reply-To: <8648916.T7Z3S40VBb@workhorse>
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
X-Rspamd-Queue-Id: 31C3A20E7CF
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
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,suse.de,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net,linuxfoundation.org,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action


--etgtgheqnhe6g46r
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v9 04/19] drm/display: hdmi-state-helper: Act on color
 format DRM property
MIME-Version: 1.0

On Mon, Mar 02, 2026 at 01:53:34PM +0100, Nicolas Frattaroli wrote:
> On Monday, 2 March 2026 09:46:06 Central European Standard Time Maxime Ri=
pard wrote:
> > Hi,
> >=20
> > On Fri, Feb 27, 2026 at 08:20:09PM +0100, Nicolas Frattaroli wrote:
> > > With the introduction of the "color format" DRM property, which allows
> > > userspace to request a specific color format, the HDMI state helper
> > > should implement this.
> > >=20
> > > Implement it by translating the requested drm_connector_color_format =
to
> > > a drm_output_color_format enum value as per the logic HDMI should use
> > > for this: Auto is translated to RGB, and a fallback to YUV420 is only
> > > performed if the original color format was auto.
> > >=20
> > > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > > ---
> > >  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 28 +++++++++++++++=
++++++++--
> > >  1 file changed, 26 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/driver=
s/gpu/drm/display/drm_hdmi_state_helper.c
> > > index 9f3b696aceeb..31c6d55fa995 100644
> > > --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > > +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > > @@ -669,10 +669,34 @@ hdmi_compute_config(const struct drm_connector =
*connector,
> > >  	unsigned int max_bpc =3D clamp_t(unsigned int,
> > >  				       conn_state->max_bpc,
> > >  				       8, connector->max_bpc);
> > > +	enum drm_output_color_format fmt;
> > >  	int ret;
> > > =20
> > > -	ret =3D hdmi_compute_format_bpc(connector, conn_state, mode, max_bp=
c,
> > > -				      DRM_OUTPUT_COLOR_FORMAT_RGB444);
> > > +	switch (conn_state->color_format) {
> > > +	case DRM_CONNECTOR_COLOR_FORMAT_AUTO:
> > > +	case DRM_CONNECTOR_COLOR_FORMAT_RGB444:
> > > +		fmt =3D DRM_OUTPUT_COLOR_FORMAT_RGB444;
> > > +		break;
> > > +	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR444:
> > > +		fmt =3D DRM_OUTPUT_COLOR_FORMAT_YCBCR444;
> > > +		break;
> > > +	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR422:
> > > +		fmt =3D DRM_OUTPUT_COLOR_FORMAT_YCBCR422;
> > > +		break;
> > > +	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR420:
> > > +		fmt =3D DRM_OUTPUT_COLOR_FORMAT_YCBCR420;
> > > +		break;
> > > +	default:
> > > +		drm_dbg_kms(connector->dev, "HDMI does not support color format '%=
d'.\n",
> > > +			    conn_state->color_format);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	ret =3D hdmi_compute_format_bpc(connector, conn_state, mode, max_bp=
c, fmt);
> > > +
> > > +	if (conn_state->color_format !=3D DRM_CONNECTOR_COLOR_FORMAT_AUTO)
> > > +		return ret;
> > > +
> >=20
> > We discussed it before, and it wasn't as trivial as it should have been,
> > but now, I really feel something like the following would be simpler:
> >=20
> > if (conn_state->color_format !=3D DRM_CONNECTOR_COLOR_FORMAT_AUTO) {
> > 	enum drm_output_color_format fmt;
> >=20
> > 	switch (conn_state->color_format) {
> > 	case DRM_CONNECTOR_COLOR_FORMAT_AUTO:
> > 	     drm_warn(connector->dev, "The format shouldn't be auto here"); //=
 or any better message
> > 	     fallthrough;
>=20
> Why shouldn't it be auto there? This is the function where the auto->rgb
> mapping is explicitly handled.

We just tested above that it wasn't, so if we took that branch but it's
still auto, something is very wrong :)

> > 	case DRM_CONNECTOR_COLOR_FORMAT_RGB444:
> > 	     fmt =3D DRM_OUTPUT_COLOR_FORMAT_RGB444;
> > 	     break;
> > 	....
> > 	}
> >=20
> > 	return hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc, f=
mt);
> > }
> >=20
> > ret =3D hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
> > 			      DRM_OUTPUT_COLOR_FORMAT_RGB444);
> >=20
> > It makes it much clearer what the two branches are, and we don't have to
> > test for auto multiple times.
>=20
> Testing for auto multiple times is done for the "4:2:0 fallback on
> AUTO only" case. If you fall through from AUTO to RGB and then return
> the result of hdmi_compute_format_bpc on RGB, then you will not let
> AUTO fall back to 4:2:0. hdmi_compute_format_bpc only does a fallback
> for lower bit depths, not different color formats.

The part above wasn't meant to be the whole function but only the part
covered by your patch. My point is you should have a test of whether we
have auto or not. If we don't we use whatever we have and early return.
If we have auto, we do RGB then YUV420 like we used to.

Maxime

--etgtgheqnhe6g46r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaalNygAKCRAnX84Zoj2+
dhnCAX9DNAh/ZSZ/rCHg5+5ZYomOTbZkZfYVH9tmTzU1bVK4L/QKl1+OT4JFZgi4
MOwWQH4BegMzSI+E4j/H8ZJUYoTCAU2UluDtmLLmQt5+1qE3ZOKXXBngFnNDHiYU
ARwHaTH91w==
=n+uK
-----END PGP SIGNATURE-----

--etgtgheqnhe6g46r--

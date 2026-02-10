Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEoHE+Rki2kMUQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 18:03:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E9311D822
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 18:03:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 054E110E5C3;
	Tue, 10 Feb 2026 17:03:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UbiQl67K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0ABB10E1CA;
 Tue, 10 Feb 2026 17:03:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 54B7343C5F;
 Tue, 10 Feb 2026 17:03:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAFE9C116C6;
 Tue, 10 Feb 2026 17:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770743005;
 bh=YLgcpRDnWTHgN5iEvcrgGHQykKQfZ6+q//x2uAoTL2Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UbiQl67KXho6dNAGklbzIoKY/CuPlIJmYXE2CfYzHTIJToITEXD9N+eJzfXKt3SHM
 lSwwfms3XZg5cG1604q/3nRhYxZODV132zqUHy30bF0Dh0anrvl14BTtczFIKaSiYm
 zJTXSfV6rqXSV50GwWyl6vA1rVF3ciiUruOnRDGq6DnYFjeRsSyoJqUWBM3Pbtn2jn
 LJJWnwEsxMQrAdj/juSXJYCtctRajep/Kh0DdrCh6UAdgmSTLXq5zrsB5ZVAJneeZu
 VtIJfcfdhuQmgZ/ahhSGGz/a0V5r6TH0Q5Q+pRphfFKzqvrlRShcEj+B874bueM1vH
 ii6vUvQ94znzA==
Date: Tue, 10 Feb 2026 18:03:22 +0100
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
Message-ID: <20260210-imported-ant-of-defiance-7cdb42@houat>
References: <20260121-color-format-v7-0-ef790dae780c@collabora.com>
 <20260121-color-format-v7-2-ef790dae780c@collabora.com>
 <20260206-deft-provocative-perch-6ca9bf@houat>
 <6318997.lOV4Wx5bFT@workhorse>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="bzvkctnspkvgvs72"
Content-Disposition: inline
In-Reply-To: <6318997.lOV4Wx5bFT@workhorse>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,suse.de,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org,yngvason.is,tuxedocomputers.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 40E9311D822
X-Rspamd-Action: no action


--bzvkctnspkvgvs72
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 02/22] drm: Add new general DRM property "color format"
MIME-Version: 1.0

Hi,

On Fri, Feb 06, 2026 at 04:26:56PM +0100, Nicolas Frattaroli wrote:
> On Friday, 6 February 2026 15:05:08 Central European Standard Time Maxime=
 Ripard wrote:
> > On Wed, Jan 21, 2026 at 03:45:09PM +0100, Nicolas Frattaroli wrote:
> > > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > > index 7eaec37ae1c7..b5604dca728a 100644
> > > --- a/include/drm/drm_connector.h
> > > +++ b/include/drm/drm_connector.h
> > > @@ -556,6 +556,16 @@ enum drm_colorspace {
> > >  	DRM_MODE_COLORIMETRY_COUNT
> > >  };
> > > =20
> > > +enum drm_color_format {
> > > +	DRM_COLOR_FORMAT_AUTO			=3D 0,
> > > +	DRM_COLOR_FORMAT_RGB444			=3D BIT(0),
> > > +	DRM_COLOR_FORMAT_YCBCR444		=3D BIT(1),
> > > +	DRM_COLOR_FORMAT_YCBCR422		=3D BIT(2),
> > > +	DRM_COLOR_FORMAT_YCBCR420		=3D BIT(3),
> > > +};
> > > +
> > > +#define DRM_COLOR_FORMAT_COUNT 5
> > > +
> >=20
> > I don't really see a reason to expose an enum, with a bunch of values
> > that are all mutually exclusive, as a bitmask. It's pretty inconsistent
> > with most (all?) the other similar properties we have.
> >=20
> > I appreciate you did that to avoid fixing up every driver using those
> > values, but then maybe we don't have to? We could create a userspace
> > facing enum, and convert to DRM_COLOR_FORMAT internally.
>=20
> This is what the series did at v5 and earlier. IMHO it was kind of
> counter-productive, because we then had two different things for the
> same purpose, and some conversion logic between them. I think it's more
> error prone to do it that way (think: mixing up the two), and doesn't
> have a clear benefit. Just to give a picture of how bad things get:
>=20
> 1. we have the HDMI color format (aka "HDMI_COLORSPACE")
> 2. we have driver specific output color formats, e.g. the intel ones
> 3. we have DRM_COLOR_FORMAT
> 4. we have the bus formats (multiple per color format)
> 5. we have the DRM plane formats (again, multiple per color format)
>=20
> Adding a sixth into the mix feels a bit bad because we'll then need to
> justify why we should have another layer of switch-case statements.

Yeah, but they are all semantically different:

* The userspace one you want to introduce is going to be a superset of
  all the valid output format for all the output busses we support (so,
  HDMI + DP + etc.)

* plane formats are the input format, we have much more variation there,
  and we will never output these. We can ignore these.

* bus formats are somewhat similar, they are more about the wiring
  between bridges than anything else, and they are not exposed to
  userspace. We can ignore these too.

* DRM_COLOR_FORMAT are definitely redundant.

* The intel color formats are also redundant, but also internal. I would
  expect them to converge to whatever we come up here eventually (but
  really don't expect you to do that work).

* And HDMI_COLORSPACE is really mandated by the HDMI spec, and is only
  about HDMI connectors. It will never fully overlap with what we come
  up with here, if only because HDMI cares about things we don't.

So we really have two formats in my opinion: the one exposed through the
uapi, and the internal one exposed to driver.

In my view, the internal -> uapi conversion is trivial because the uapi
one is a superset of the internal one (if only for auto). The uapi ->
internal one needs to deal and resolve what auto means, but your code
already does that.

I don't really care about the internal format, as long as drivers don't
have to be smart about it, so auto shouldn't be exposed to drivers. As
far as I'm concerned, DRM_COLOR_FORMAT would fit that bill if it wasn't
for the fact that it's both a bitmask and an enum depending on the
context, which makes it pretty weird and error prone to deal with.

Maxime

--bzvkctnspkvgvs72
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaYtk1QAKCRAnX84Zoj2+
dtH+AX9icXQp+NxFc1ZKirTjKLdjN/aWcl/dtMD8J4ci+mTqPt3KkSi4+FSK/s7a
WNYTGwkBgOD8I055eaRKcNaaDGxQykXaPnfDkqAkw+xuNqdU6H6Fu+Om0bh+yw2H
icXSLJ4gYw==
=puI2
-----END PGP SIGNATURE-----

--bzvkctnspkvgvs72--

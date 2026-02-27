Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBbVL9pVoWk+sQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 09:29:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 739BC1B48E1
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 09:29:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE0B10E1BE;
	Fri, 27 Feb 2026 08:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ofDzrsEv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C60010E1BE;
 Fri, 27 Feb 2026 08:29:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DFA3944097;
 Fri, 27 Feb 2026 08:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A915C116C6;
 Fri, 27 Feb 2026 08:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772180948;
 bh=c8kyPUTfjiKvPIqR7TvbHjiIxKrmJz6TvW1tdw40CNo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ofDzrsEvFziU5bJCQJenBgUdKWnvapcui45AO8WukPJ3C9nQEaqTbw1jSWXTaUZ46
 HG/tGLR9AcxzdFzsTNVv3ajsQdEXgN5kMvPtSDE9fcCxQtEf10Z008H+x/yBqdTCw2
 sgPxqSuOA8RtD4gziJbnHpaldmrJ4JrqN7xLYEMiBvmWuWQwX4KgG1bsPHOtkfmhjt
 jxPVdBGCheLMsHu/ZUUPH95AEu1xJZltS3OzdsWkbRURN9sL3TqfJT2Rqu/yIT6+Cp
 c1Oppfx9pWVq1P4PXrEi9mbiZqrFicJCaTFtBKbKOdz7d9eFl6D49xnZcJAJrWfEHq
 8/JLcJhgDMYIQ==
Date: Fri, 27 Feb 2026 09:29:05 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andy Yan <andy.yan@rock-chips.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, 
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Liu Ying <victor.liu@nxp.com>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 14/14] drm/display: hdmi: Use drm_output_color_format
 instead of hdmi_colorspace
Message-ID: <20260227-dramatic-agouti-of-brotherhood-416e19@houat>
References: <20260224-drm-rework-color-formats-v1-0-bebc76604ada@kernel.org>
 <20260224-drm-rework-color-formats-v1-14-bebc76604ada@kernel.org>
 <5558942.31r3eYUQgx@workhorse>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="loc25nvmfl5t2czh"
Content-Disposition: inline
In-Reply-To: <5558942.31r3eYUQgx@workhorse>
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
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch,amd.com,igalia.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,rock-chips.com,arm.com,pengutronix.de,collabora.com,sntech.de,nxp.com,sholland.org,raspberrypi.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 739BC1B48E1
X-Rspamd-Action: no action


--loc25nvmfl5t2czh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 14/14] drm/display: hdmi: Use drm_output_color_format
 instead of hdmi_colorspace
MIME-Version: 1.0

Hi

On Thu, Feb 26, 2026 at 05:24:05PM +0100, Nicolas Frattaroli wrote:
> On Tuesday, 24 February 2026 11:58:53 Central European Standard Time Maxi=
me Ripard wrote:
> > The hdmi_colorspace enum was defined to represent the colorspace value
> > of the HDMI infoframes. It was later used by some HDMI drivers to
> > express the output format they should be setting up.
> >=20
> > During the introduction of the HDMI helpers, it then was used to
> > represent it in the drm_connector_hdmi_state structure.
> >=20
> > However, it's always been somewhat redundant with the DRM_COLOR_FORMAT_*
> > defines, and now with the drm_output_color_format enum. Let's
> > consolidate around drm_output_color_format in drm_connector_hdmi_state
> > to facilitate the current effort to provide a global output format
> > selection mechanism.
> >=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  drivers/gpu/drm/bridge/inno-hdmi.c                 |   6 +-
> >  drivers/gpu/drm/bridge/ite-it6263.c                |   2 +-
> >  drivers/gpu/drm/display/drm_hdmi_helper.c          |   7 +-
> >  drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  52 ++++--
> >  drivers/gpu/drm/drm_bridge.c                       |   2 +-
> >  drivers/gpu/drm/drm_connector.c                    |  14 +-
> >  drivers/gpu/drm/mediatek/mtk_hdmi_v2.c             |   8 +-
> >  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |   2 +-
> >  drivers/gpu/drm/tests/drm_connector_test.c         |  80 ++++-----
> >  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 182 ++++++++++---=
--------
> >  drivers/gpu/drm/vc4/vc4_hdmi.c                     |  18 +-
> >  drivers/gpu/drm/vc4/vc4_hdmi.h                     |   2 +-
> >  include/drm/display/drm_hdmi_helper.h              |   3 +-
> >  include/drm/drm_connector.h                        |   7 +-
> >  14 files changed, 205 insertions(+), 180 deletions(-)
> >=20
> > [... snip ...]
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_conn=
ector.c
> > index 4f5b27fab475c7c733622eb8727927571f3fb8fe..171cd495976a3e16f201fd3=
39d3d42a09dc3b63f 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -589,14 +589,14 @@ int drmm_connector_hdmi_init(struct drm_device *d=
ev,
> > =20
> >  	if (!(connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIA ||
> >  	      connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIB))
> >  		return -EINVAL;
> > =20
> > -	if (!supported_formats || !(supported_formats & BIT(HDMI_COLORSPACE_R=
GB)))
> > +	if (!supported_formats || !(supported_formats & BIT(DRM_OUTPUT_COLOR_=
FORMAT_RGB444)))
> >  		return -EINVAL;
> > =20
> > -	if (connector->ycbcr_420_allowed !=3D !!(supported_formats & BIT(HDMI=
_COLORSPACE_YUV420)))
> > +	if (connector->ycbcr_420_allowed !=3D !!(supported_formats & BIT(DRM_=
OUTPUT_COLOR_FORMAT_YCBCR420)))
> >  		return -EINVAL;
>=20
> I don't think this will work as-is. drm_bridge_connector_init calls this
> function assuming hdmi_colorspace bitmasks in supported_formats.

Yeah, you're right I missed the conversion in drm_bridge_connector_init.
It should be fixed now.

> This may have slipped through the conversion; the synopsys dw-hdmi-qp core
> (separate from synopsys dw-hdmi) also assumes hdmi_colorspace, see e.g.
> dw_hdmi_qp_plat_data::supported_formats in include/drm/bridge/dw_hdmi_qp.h
>=20
> So should be a simple fix I hope.

For this one, did you identify anything more than the comment in
dw_hdmi_qp_plat_data? I couldn't find any user of HDMI_COLORSPACE_* left
for the dw_hdmi_qp_plat_data.supported_formats users.

Maxime

--loc25nvmfl5t2czh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaaFV0QAKCRAnX84Zoj2+
dvCEAYDaGC/59F9atETzuzgChsYLcJVNJgdGWjU1NRJZAQyUqV3NtgL5f6q6GBTD
pJd6kloBfiNvk4tOHoJdLuYHcXKOHPexZHHDkJhCCZcQq5xaZ4nI/2u9TG4/zvD0
jRPv06q3tQ==
=uKAU
-----END PGP SIGNATURE-----

--loc25nvmfl5t2czh--

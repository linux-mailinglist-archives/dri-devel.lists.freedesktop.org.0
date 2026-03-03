Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEJqHT+UpmnmRQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 08:56:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0781EA6E8
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 08:56:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E3B10E655;
	Tue,  3 Mar 2026 07:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="r9ufdgva";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B7BC10E653
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 07:56:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 77E34600AE;
 Tue,  3 Mar 2026 07:56:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1176C116C6;
 Tue,  3 Mar 2026 07:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772524600;
 bh=FPSWXBq5h5afHHQAEz+9DZlmBzF6MzQWH5e4VqK9Y2Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r9ufdgvawrpPlnAtM0ouFDuO3f2CKQ1CsgRa+jiWLDMs2bFdicnx6eHyvUQ6KK+D/
 9f6XAuTB+2XI9tKop3mvMVv9kt5EXZ2U4nVYa4tlkfAUQNWNDxS45NH4tT/0xXKTBj
 JZQrO/Ju55zTuQ1rEp0uhzZrByObywMowr21VJCcs3+F56nQqxbdzZsYc0hfWX/oY5
 ImwJWEza5HcQJZm0i33RWIHwc5YB2KffTZ3Ww3/HvQCLC8srNynT7CRc9Ct6Voi3mJ
 MNpxDZYVGoXJesTgJ7xmbSqUwl2Q4kk3M9xmI3HwI4SteBuYAbbsMaNuGDzhSkh9b4
 GEWz2HEm/NAkg==
Date: Tue, 3 Mar 2026 08:56:31 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Joseph Guo <qijian.guo@nxp.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 2/2] drm/bridge: waveshare-dsi: Add support for 1..4
 DSI data lanes
Message-ID: <20260303-free-kudu-from-vega-20fb3e@houat>
References: <20260115024004.660986-1-marek.vasut+renesas@mailbox.org>
 <20260115024004.660986-2-marek.vasut+renesas@mailbox.org>
 <3af09657-78ce-4bc6-b8d5-b346a3b86c5b@mailbox.org>
 <fe436c72-deae-41af-87ea-726fe4801e7b@mailbox.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="m34revu4ahbvqc7p"
Content-Disposition: inline
In-Reply-To: <fe436c72-deae-41af-87ea-726fe4801e7b@mailbox.org>
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
X-Rspamd-Queue-Id: BE0781EA6E8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut@mailbox.org,m:qijian.guo@nxp.com,m:andrzej.hajda@intel.com,m:conor+dt@kernel.org,m:airlied@gmail.com,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:krzk+dt@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:rfoss@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:luca.ceresoli@bootlin.com,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,nxp.com,intel.com,kernel.org,gmail.com,kwiboo.se,ideasonboard.com,linux.intel.com,linaro.org,ffwll.ch,suse.de,vger.kernel.org,bootlin.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mailbox.org:email]
X-Rspamd-Action: no action


--m34revu4ahbvqc7p
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/2] drm/bridge: waveshare-dsi: Add support for 1..4
 DSI data lanes
MIME-Version: 1.0

On Mon, Mar 02, 2026 at 10:35:31PM +0100, Marek Vasut wrote:
> On 2/6/26 12:48 PM, Marek Vasut wrote:
> > On 1/15/26 3:39 AM, Marek Vasut wrote:
> > > Parse the data lane count out of DT. Limit the supported data lanes
> > > to 1..4 which is the maximum available DSI pairs on the connector of
> > > any known panels which may use this bridge. Internally, this bridge
> > > is an ChipOne ICN6211 which loads its register configuration from a
> > > dedicated storage and its I2C does not seem to be accessible. The
> > > ICN6211 also supports up to 4 DSI lanes, so this is a hard limit.
> > >=20
> > > To avoid any breakage on old DTs where the parsing of data lanes from
> > > DT may fail, fall back to the original hard-coded value of 2 lanes and
> > > warn user.
> > >=20
> > > The lane configuration is preconfigured in the bridge for each of the
> > > WaveShare panels. The 13.3" DSI panel works with 4-lane configuration,
> > > others seem to use 2-lane configuration. This is a hardware property,
> > > so the actual count should come from DT.
> > >=20
> > > Reviewed-by: Joseph Guo <qijian.guo@nxp.com>
> > > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> >=20
> > Is it OK to apply these two patches now ?
>=20
> Can this be applied now ?

It looks like you have a reviewed-by already, what's stoping you from
applying it yourself?

Maxime

--m34revu4ahbvqc7p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaaaUKwAKCRAnX84Zoj2+
dskVAYCJ7J/l8B9fqheSoxJIx+Y4Gx3nWzFKUqBV2qBIdXmqMJzsizWpwlJw8gqh
rBzx6/sBfRXuFUNae9IbISIR3FomKKf98SSgyl11gageLtdnZz/5cy+j5xq+k6Fu
wslp5YJncA==
=MSWU
-----END PGP SIGNATURE-----

--m34revu4ahbvqc7p--

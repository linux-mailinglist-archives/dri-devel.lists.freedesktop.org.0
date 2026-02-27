Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4UfFEq14oWkJtgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 11:57:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 729451B644E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 11:57:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC3A10EAF9;
	Fri, 27 Feb 2026 10:57:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uKoU2ttm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C7A310EAF9
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 10:57:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D617B41913;
 Fri, 27 Feb 2026 10:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37C45C116C6;
 Fri, 27 Feb 2026 10:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772189863;
 bh=EV++6fc7wgpSpcgWlcOMt/xe137qRBgNctkEkpXLWgg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uKoU2ttmFrLP8NXYua797uuFYuyvTHBm7A3f1waYp51zq550diTXVRbTPT0ytknvR
 Z1z8jXzG22BA9F5LoHq3fzwR+/LcNbTGjnD0dfTmVkvA/r6YEfbzjxPI3PYzmhiWsC
 REk8cRAu+CuYzk9fkocrzJfBt+u8RUxQ+/tK9yTxWKJz4q3xoOBA2FwdK4Qkhmjw8w
 oBMMtdNLDIw9r/h1bNZbknWbDdJeJyrd8J7/mW14Rhjj6UBrL5ZJ4LASAJMDHeffCr
 1D5D9g99OyxsqbwithM1CPBnz1N5fHrLBh5VyK2cDFwv90Ay7sqM2orzSiyFsWDnb6
 +bhf5t0KKA4lg==
Date: Fri, 27 Feb 2026 11:57:40 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, Marek Vasut <marex@denx.de>,
 Linus Walleij <linusw@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/bridge: ti-sn65dsi83: add test pattern
 generation support
Message-ID: <20260227-loud-silky-macaw-8d4d3b@houat>
References: <20260226-ti-sn65dsi83-dual-lvds-fixes-and-test-pattern-v1-0-2e15f5a9a6a0@bootlin.com>
 <20260226-ti-sn65dsi83-dual-lvds-fixes-and-test-pattern-v1-3-2e15f5a9a6a0@bootlin.com>
 <71224e5f-d982-45f9-be91-b61b78f38853@mailbox.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="biqdddwbes3n3dob"
Content-Disposition: inline
In-Reply-To: <71224e5f-d982-45f9-be91-b61b78f38853@mailbox.org>
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
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut@mailbox.org,m:luca.ceresoli@bootlin.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:frieder.schrempf@kontron.de,m:marex@denx.de,m:linusw@kernel.org,m:thomas.petazzoni@bootlin.com,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[bootlin.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,kontron.de,denx.de,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ti.com:url]
X-Rspamd-Queue-Id: 729451B644E
X-Rspamd-Action: no action


--biqdddwbes3n3dob
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/3] drm/bridge: ti-sn65dsi83: add test pattern
 generation support
MIME-Version: 1.0

On Fri, Feb 27, 2026 at 11:41:29AM +0100, Marek Vasut wrote:
> On 2/26/26 5:16 PM, Luca Ceresoli wrote:
> > Generation of a test pattern output is a useful tool for panel bringup =
and
> > debugging, and very simple to support with this chip.
> >=20
> > The value of REG_VID_CHA_ACTIVE_LINE_LENGTH_LOW needs to be divided by =
two
> > for the test pattern to work in dual LVDS mode. While not clearly state=
d in
> > the datasheet, this is needed according to the DSI Tuner [0] output. And
> > some dual-LVDS panels refuse to show any picture without this division =
by
> > two.
> >=20
> > [0] https://www.ti.com/tool/DSI-TUNER
> >=20
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > ---
> >   drivers/gpu/drm/bridge/ti-sn65dsi83.c | 13 +++++++++++--
> >   1 file changed, 11 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/br=
idge/ti-sn65dsi83.c
> > index 17a885244e1e..ddc8b5e1dd15 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > @@ -114,6 +114,7 @@
> >   #define REG_VID_CHA_HORIZONTAL_FRONT_PORCH	0x38
> >   #define REG_VID_CHA_VERTICAL_FRONT_PORCH	0x3a
> >   #define REG_VID_CHA_TEST_PATTERN		0x3c
> > +#define  REG_VID_CHA_TEST_PATTERN_EN		BIT(4)
> >   /* IRQ registers */
> >   #define REG_IRQ_GLOBAL				0xe0
> >   #define  REG_IRQ_GLOBAL_IRQ_EN			BIT(0)
> > @@ -134,6 +135,9 @@
> >   #define  REG_IRQ_STAT_CHA_SOT_BIT_ERR		BIT(2)
> >   #define  REG_IRQ_STAT_CHA_PLL_UNLOCK		BIT(0)
> > +static bool sn65dsi83_test_pattern;
> > +module_param_named(test_pattern, sn65dsi83_test_pattern, bool, 0644);
>
> Can this be enabled/disabled at runtime via sysfs attribute instead ?

Then you would have to deal with concurrency with the atomic state
updates, and it would really be better implemented as a connector
property.

In other words, it's probably enough for now :)

Maxime

--biqdddwbes3n3dob
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaaF4pAAKCRAnX84Zoj2+
dmfGAYCXrIMmmlOgJt3MTEOT4TgCw+0VLkqRfKu/QjAEEEHfpUQtW8l3Qwj/APbO
b4lUOGMBgMZstfRKFeohlKrLQdrYO0mNeA3W79oQEPgEJgK3dTYlFxD3JT3llzax
SoEiSaFyOw==
=5fXu
-----END PGP SIGNATURE-----

--biqdddwbes3n3dob--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGkPAJIclGn0/wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 08:45:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA16149476
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 08:45:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 803B210E108;
	Tue, 17 Feb 2026 07:45:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sti2F08u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A6E10E108
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 07:45:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 727EB60133;
 Tue, 17 Feb 2026 07:45:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C71C2C4CEF7;
 Tue, 17 Feb 2026 07:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771314316;
 bh=2SCaHPmmHOUeBJaqZQWfCOmJYKDO1gw3Ra7MsZgfvIE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sti2F08ueeiU39mBUfR0M/+OzAunNriD5726YArYv3Ytwug+iYhx1WTVaDU9AJ3Se
 OfsuthKBSGJIXBQMmH5U9bRzXBkhQYrKLOn3jym1LQSHAWBtDegwT9dGutvOqkVOCY
 IXeu7UzG1aPx7N1UGfePhicKwajugo/XKHxh0CASpZMANS87XbHixco/FvKuVVRr+A
 z1xW4dG0B6C4YvCis1QIb26100F5hwH7m8PQzpuEUyOStdEzrtiohfPOyOqcs3ZnBo
 b1fkl2rlF8z3ZYH8UC3U3iAD8yFFkdFkxMoSII9XUBd2RECYbMvVa/sTZL1/SdwcQv
 vDyc4ZIj0TVRQ==
Date: Tue, 17 Feb 2026 08:45:11 +0100
From: Maxime Ripard <mripard@kernel.org>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Stefan Wahren <wahrenst@gmx.net>, Melissa Wen <mwen@igalia.com>, 
 Iago Toral Quiroga <itoral@igalia.com>, Chema Casanova <jmcasanova@igalia.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 kernel-dev@igalia.com
Subject: Re: [PATCH v5 3/7] clk: bcm: rpi: Mark PIXEL_CLK and HEVC_CLK as
 CLK_IGNORE_UNUSED
Message-ID: <20260217-quaint-phenomenal-macaw-20b550@houat>
References: <20260213-v3d-power-management-v5-0-7a8b381eb379@igalia.com>
 <20260213-v3d-power-management-v5-3-7a8b381eb379@igalia.com>
 <20260216-brave-ara-of-typhoon-cf90ba@houat>
 <b55ac433-4fe7-4179-9777-278022ccd3cb@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="tgdafevhsdd5reyk"
Content-Disposition: inline
In-Reply-To: <b55ac433-4fe7-4179-9777-278022ccd3cb@igalia.com>
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
X-Spamd-Result: default: False [-2.91 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:mcanal@igalia.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:nsaenz@kernel.org,m:florian.fainelli@broadcom.com,m:wahrenst@gmx.net,m:mwen@igalia.com,m:itoral@igalia.com,m:jmcasanova@igalia.com,m:dave.stevenson@raspberrypi.com,m:p.zabel@pengutronix.de,m:linux-clk@vger.kernel.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:bcm-kernel-feedback-list@broadcom.com,m:kernel-dev@igalia.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,broadcom.com,gmx.net,igalia.com,raspberrypi.com,pengutronix.de,vger.kernel.org,lists.infradead.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4DA16149476
X-Rspamd-Action: no action


--tgdafevhsdd5reyk
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 3/7] clk: bcm: rpi: Mark PIXEL_CLK and HEVC_CLK as
 CLK_IGNORE_UNUSED
MIME-Version: 1.0

On Mon, Feb 16, 2026 at 09:18:31AM -0300, Ma=EDra Canal wrote:
> On 16/02/26 07:53, Maxime Ripard wrote:
> > On Fri, Feb 13, 2026 at 03:52:56PM -0300, Ma=EDra Canal wrote:
> > > If PIXEL_CLK or HEVC_CLK is disabled during boot, the firmware will s=
kip
> > > HSM initialization, which would result in a bus lockup. However, those
> > > clocks are consumed by drivers (vc4 and HEVC decoder drivers,
> > > respectively), which means that they can be enabled/disabled by the
> > > drivers.
> > >=20
> > > Mark those clocks as CLK_IGNORE_UNUSED to allow them to be disabled by
> > > drivers when appropriate.
> > >=20
> > > Acked-by: Melissa Wen <mwen@igalia.com>
> > > Signed-off-by: Ma=EDra Canal <mcanal@igalia.com>
> >=20
> > It looks like sync_state would be a better candidate to handle this?
>=20
> I have the impression that CLK_IGNORE_UNUSED is still a better fit here.
>=20
> First, the clock framework has no sync_state integration. The only use
> of sync_state in clock drivers is done by Qualcomm's clock controllers,
> which uses icc_sync_state for the interconnect framework.

It's done at the device level, so you don't really need any kind of
integration, you could roll your own implementation.

> From my understanding, CLK_IGNORE_UNUSED is the idiomatic mechanism
> for "don't disable this clock during clk_disable_unused() and allow
> drivers to manage it", which is exactly what we are looking for.

Ish. CLK_IGNORE_UNUSED is kind of a hack that only does the first part
of what you stated. After clk_disable_unused(), all bets are off and for
all you know, all the unused clocks could still be disabled. You can
trigger such a condition if a driver gets and enables the clock, fails
to probe and disables it.

It's been mostly used for clocks that should never be disabled on the
system (and has been superseded by CLK_IS_CRITICAL for this use-case),
or to ignore clk_disable_unused, where sync_state() is the superior
solution.

> Apart from that, if we decide to use sync_state, I'm not sure we could
> handle granularity. sync_state is a per-device mechanism, not per-clock,
> and clk-raspberrypi provides multiple clocks (consumed by different
> drivers). With CLK_IGNORE_UNUSED, the protection is per-clock: once a
> driver calls clk_prepare_enable/unprepare() it manages that clock,
> regardless of what other consumers of other clocks are doing.

sync_state would replace clk_ignore_unused, so would run on the
controller device and disable all active clocks with no users.

But yeah, maybe CLK_IGNORE_UNUSED is good enough still.

Maxime

--tgdafevhsdd5reyk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaZQcggAKCRAnX84Zoj2+
dqAZAX9FIC16SlVDcviD9Y2sRbwr9brIcP4q0nuFqEvJfNkrfyS0IsifP24IJvPP
Mp/qj6sBgLxZd73gcDi35g0a9b0sOWqUJUzX4FUCqrqRdRRbb5gSzdpoopNycn4f
O1jlFJnbwg==
=jSWZ
-----END PGP SIGNATURE-----

--tgdafevhsdd5reyk--

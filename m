Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DJNH9ndeWnI0QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 10:58:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F35BB9F205
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 10:58:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4434E10E640;
	Wed, 28 Jan 2026 09:58:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EZgjrPHI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 936F510E631
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 09:58:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A91A46001A;
 Wed, 28 Jan 2026 09:58:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AA03C4CEF1;
 Wed, 28 Jan 2026 09:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769594324;
 bh=S+kzbsUAv+9ZIJ9gROnXWuYdug3mDJrjsfqbJmx1oyo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EZgjrPHIvRauCS4zCGzFR/1kiUJjREfmbeFXQIh8TesIeDPKJayOjWs5vEge8LVF+
 AZ7vfN10DR3Loc0192AuZzHRoBJiOnyU7LW+isLs+n81+AOjS2cM3+t4npaX3c46RE
 7muag92gaobKB7dJQrwUEIG59sgcX4czzchjkHXURZaH/d92/oYCnWivqjm7+NisEA
 Q4umbhq3/ujNgDHoUrCccTc15QfZVI5MvSYHGCVBWuXw/REnZAduQP7Lu/HS/3B0yX
 f0f1O3hwrF4bNEyTwlTGsVwG3ArXaOQOFEEqpsUTZaouOIRVdCZdHnJlxmIxOKKl6i
 0OX+DlyrGosmQ==
Date: Wed, 28 Jan 2026 10:58:41 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2] drm/imx/tve: fix probe device leak
Message-ID: <20260128-inchworm-of-fascinating-enthusiasm-de5ab2@houat>
References: <20251030163456.15807-1-johan@kernel.org>
 <aR8TWJurF1a0LLGJ@hovoldconsulting.com>
 <aWd2xizOQAnVRaSs@hovoldconsulting.com>
 <aXjg2C0XeVGEtdDy@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="lpelexmbpijxrpns"
Content-Disposition: inline
In-Reply-To: <aXjg2C0XeVGEtdDy@hovoldconsulting.com>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:johan@kernel.org,m:p.zabel@pengutronix.de,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:imx@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:Frank.Li@nxp.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[pengutronix.de,linux.intel.com,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,lists.linux.dev,vger.kernel.org,nxp.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,pengutronix.de:email]
X-Rspamd-Queue-Id: F35BB9F205
X-Rspamd-Action: no action


--lpelexmbpijxrpns
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] drm/imx/tve: fix probe device leak
MIME-Version: 1.0

Hi,

On Tue, Jan 27, 2026 at 04:59:20PM +0100, Johan Hovold wrote:
> On Wed, Jan 14, 2026 at 11:58:14AM +0100, Johan Hovold wrote:
> > On Thu, Nov 20, 2025 at 02:10:48PM +0100, Johan Hovold wrote:
> > > On Thu, Oct 30, 2025 at 05:34:56PM +0100, Johan Hovold wrote:
> > > > Make sure to drop the reference taken to the DDC device during prob=
e on
> > > > probe failure (e.g. probe deferral) and on driver unbind.
> > > >=20
> > > > Fixes: fcbc51e54d2a ("staging: drm/imx: Add support for Television =
Encoder (TVEv2)")
> > > > Cc: stable@vger.kernel.org	# 3.10
> > > > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > > Signed-off-by: Johan Hovold <johan@kernel.org>
> > > > ---
> > > >=20
> > > > Changes in v2:
> > > >  - add missing NULL ddc check
> > >=20
> > > Can this one be picked up for 6.19?
> >=20
> > It's been two more months so sending another reminder.
> >=20
> > Can this one be merged now?
>=20
> Can someone please merge this for 6.20?

I'm not sure what went wrong, but I just applied it. It should end up in
6.19.

Maxime

--lpelexmbpijxrpns
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaXnd0QAKCRAnX84Zoj2+
dsV1AX9BFigou9HGowx/ngN6YjSXQ5Rff4NddhPSZcqx3xHqGrrWdRHACfLWnB2l
Jgv0sXUBfjNJajMrRR/Xk+iEilujyUH/t0vyCgIuBps5wF4bv3JnenqhEhH6FomS
GvuA1Y2Hvw==
=rF9r
-----END PGP SIGNATURE-----

--lpelexmbpijxrpns--

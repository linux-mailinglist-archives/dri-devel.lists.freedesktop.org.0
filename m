Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xFMnEu7eeWm50gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 11:03:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 988BC9F2EE
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 11:03:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCAFE10E631;
	Wed, 28 Jan 2026 10:03:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="W6h34WAW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5840510E631
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 10:03:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0EC7542DF6;
 Wed, 28 Jan 2026 10:03:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E01E5C4CEF1;
 Wed, 28 Jan 2026 10:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769594600;
 bh=AZ+G2n1H7iZMtDW62AcAI4EgJDI28l5C/OSZDSSn/NE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W6h34WAW9FilZFbvanBuoTC9l6Ab8gyYkTTvLteaQzdxm84d2Ubrmq0UnuO+yDvDh
 1/6TENRAU1xAz9SUW1D/q2PU7S+lpfRBcBWItV4Yvfs7Ohq+EMveg9MPxlp/nni5BF
 kofD+nGjrbMKrZI07XxG6z2GS13qD++eQX1hQuLSiRwan9smVJaNGYMxVQ0Vkt1TyM
 e1BBOTGD5VaqtakMnC+GKeInrqUq4cucmohTCqpfEtz8fqz3usjTkCSO/gRyY9wu+l
 ooBazBuqo7dd5Sm7OJerCVnwaW71g/JV1X/5yG/6hWqNTh7iNChMOAkakQH1Ri2OnE
 hUhBPfWv/ZgKw==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1vl2OG-000000005sl-0ZkC;
 Wed, 28 Jan 2026 11:03:12 +0100
Date: Wed, 28 Jan 2026 11:03:12 +0100
From: Johan Hovold <johan@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2] drm/imx/tve: fix probe device leak
Message-ID: <aXne4DIURKOMQ0gG@hovoldconsulting.com>
References: <20251030163456.15807-1-johan@kernel.org>
 <aR8TWJurF1a0LLGJ@hovoldconsulting.com>
 <aWd2xizOQAnVRaSs@hovoldconsulting.com>
 <aXjg2C0XeVGEtdDy@hovoldconsulting.com>
 <20260128-inchworm-of-fascinating-enthusiasm-de5ab2@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="QFGDsgi8T3Q4koif"
Content-Disposition: inline
In-Reply-To: <20260128-inchworm-of-fascinating-enthusiasm-de5ab2@houat>
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
X-Spamd-Result: default: False [-3.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[pengutronix.de,linux.intel.com,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,lists.linux.dev,vger.kernel.org,nxp.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:p.zabel@pengutronix.de,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:imx@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:Frank.Li@nxp.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[johan@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nxp.com:email]
X-Rspamd-Queue-Id: 988BC9F2EE
X-Rspamd-Action: no action


--QFGDsgi8T3Q4koif
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 10:58:41AM +0100, Maxime Ripard wrote:
> Hi,
>=20
> On Tue, Jan 27, 2026 at 04:59:20PM +0100, Johan Hovold wrote:
> > On Wed, Jan 14, 2026 at 11:58:14AM +0100, Johan Hovold wrote:
> > > On Thu, Nov 20, 2025 at 02:10:48PM +0100, Johan Hovold wrote:
> > > > On Thu, Oct 30, 2025 at 05:34:56PM +0100, Johan Hovold wrote:
> > > > > Make sure to drop the reference taken to the DDC device during pr=
obe on
> > > > > probe failure (e.g. probe deferral) and on driver unbind.
> > > > >=20
> > > > > Fixes: fcbc51e54d2a ("staging: drm/imx: Add support for Televisio=
n Encoder (TVEv2)")
> > > > > Cc: stable@vger.kernel.org	# 3.10
> > > > > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > > > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > > > Signed-off-by: Johan Hovold <johan@kernel.org>
> > > > > ---
> > > > >=20
> > > > > Changes in v2:
> > > > >  - add missing NULL ddc check
> > > >=20
> > > > Can this one be picked up for 6.19?
> > >=20
> > > It's been two more months so sending another reminder.
> > >=20
> > > Can this one be merged now?
> >=20
> > Can someone please merge this for 6.20?
>=20
> I'm not sure what went wrong, but I just applied it. It should end up in
> 6.19.

Thanks, Maxime.

Johan

--QFGDsgi8T3Q4koif
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCaXne3BsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIACgkQC8XNwux9ZQhmrwD/dHjD06shoLG8q1QsEcQp
DoBYWhA8S4AEi/XcZp5AMtwA/24TN9ZoDNU3rcJ7aveBPM/5PIT3JBQJUZKPEY0J
xqMM
=HQx8
-----END PGP SIGNATURE-----

--QFGDsgi8T3Q4koif--

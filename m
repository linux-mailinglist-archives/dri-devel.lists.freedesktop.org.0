Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHisHFeepmlqRwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:39:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F191EAE2C
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:39:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5933010E663;
	Tue,  3 Mar 2026 08:39:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gZDfkicP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E1D210E663
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 08:39:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E2BDB402AF;
 Tue,  3 Mar 2026 08:39:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F1E6C116C6;
 Tue,  3 Mar 2026 08:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772527187;
 bh=wYFL/UizRE6SL9LpDWbjhEbVjqGuHZ2/AHz5HQhFD20=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gZDfkicP8eFmJKX33w0Yd6xx0He2+j1A7zNK8+eR7aePXEQ6GzVpHczP3BaidcIeu
 WGx5PZDW9EjdXyHd0YMwxpvtRQzel793O35b8KSYp3Hln5Rx++Kdrwbun0G2PsbB8H
 3/htbqtg8GTANjyxugAlETm3nl8t3A8/fuG8gDCoX0oMsj6i/8gtVwRVf5ENk8lJV9
 GDev2IIl2wzT0SuzBftQLvUmYFvsjzA0+nj5LPGtearM7D5YSxVmGUhUj2nlPYGO4r
 YZ11tfTi52PD8EyNTbcZP1Bz/588ssQpGesJKilpxCaA09t+lwi0UW2xpbIe/lFOl3
 SzVzPBLU6b5+w==
Date: Tue, 3 Mar 2026 09:39:44 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm: of: Fix drm_of_get_data_lanes_count_ep() return
 value documentation
Message-ID: <20260303-delectable-just-clam-d25e08@houat>
References: <20260115024610.661624-1-marek.vasut+renesas@mailbox.org>
 <20260303-uppish-finicky-mustang-cd135f@houat>
 <CAMuHMdW4HwgwiBJFkA43MpYWOScG8n7p4p3_KBL+Cg3_P_a18w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="x2izyhm4hsbiouzm"
Content-Disposition: inline
In-Reply-To: <CAMuHMdW4HwgwiBJFkA43MpYWOScG8n7p4p3_KBL+Cg3_P_a18w@mail.gmail.com>
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
X-Rspamd-Queue-Id: 10F191EAE2C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:marek.vasut+renesas@mailbox.org,m:airlied@gmail.com,m:maarten.lankhorst@linux.intel.com,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[mailbox.org,lists.freedesktop.org,gmail.com,linux.intel.com,ffwll.ch,suse.de,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mailbox.org:email,glider.be:email]
X-Rspamd-Action: no action


--x2izyhm4hsbiouzm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm: of: Fix drm_of_get_data_lanes_count_ep() return
 value documentation
MIME-Version: 1.0

On Tue, Mar 03, 2026 at 09:14:53AM +0100, Geert Uytterhoeven wrote:
> Hi Maxime,
>=20
> On Tue, 3 Mar 2026 at 09:07, Maxime Ripard <mripard@kernel.org> wrote:
> > On Thu, Jan 15, 2026 at 03:45:53AM +0100, Marek Vasut wrote:
> > > Update drm_of_get_data_lanes_count_ep() return value documentation
> > > to match the drm_of_get_data_lanes_count() return value documentation.
> > > The drm_of_get_data_lanes_count_ep() is only a wrapper around the
> > > drm_of_get_data_lanes_count() and therefore returns the same error
> > > codes.
> > >
> > > Fixes: fc801750b197 ("drm: of: Add drm_of_get_data_lanes_count and dr=
m_of_get_data_lanes_ep")
> > > Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>=20
> > > --- a/drivers/gpu/drm/drm_of.c
> > > +++ b/drivers/gpu/drm/drm_of.c
> > > @@ -539,8 +539,8 @@ EXPORT_SYMBOL_GPL(drm_of_get_data_lanes_count);
> > >   *
> > >   * Return:
> > >   * * min..max - positive integer count of "data-lanes" elements
> > > - * * -EINVAL - the "data-mapping" property is unsupported
> > > - * * -ENODEV - the "data-mapping" property is missing
> > > + * * -ve - the "data-lanes" property is missing or invalid
> >
> > I have no idea what "ve" means in that context. We should rephrase or
> > pick something more obvious.
>=20
> "-ve" =3D negative, "+ve" =3D positive.

Thanks!

My point still stands though.

Maxime

--x2izyhm4hsbiouzm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaaaeSwAKCRAnX84Zoj2+
dnryAYD/570fpRsYtJ/kuqtzFArOc/SBUrjT6SVESmlB/LC/0P1+wmazr+MJtT22
SGs6lWgBgJqaHU8aUhmnF5wIw5v9XevoPqd4HT0iFxGp9adBMwRtVV0wxtQGtyi3
AVIEk8YnUg==
=9M4s
-----END PGP SIGNATURE-----

--x2izyhm4hsbiouzm--

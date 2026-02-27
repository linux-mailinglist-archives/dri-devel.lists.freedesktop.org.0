Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPfAMp9noWkUsgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 10:45:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 309F91B5817
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 10:45:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2EB710EACE;
	Fri, 27 Feb 2026 09:45:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kcAwxgpe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 732AB10EACE
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 09:45:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 44A9A44725;
 Fri, 27 Feb 2026 09:45:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 961F2C2BC86;
 Fri, 27 Feb 2026 09:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772185500;
 bh=xz65APia0l8XWWzIhARIp/L1/RRCNyTqWTNP/+F5IL8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kcAwxgpeIaX/O+Nj1vy2GzI73FwrJJdnfTCGiRTFYbVFWHOpE3+z8DaCZZFt81jb2
 pfSEv08YfSh6DPwrXY193xfKzy+Ilkui/K7OfMmHFmMn3qtQDX6lTpHAXXNuQvzp2J
 8iVSxvBMHskAOJWOwKe4aSC6hW2KPChDdiIMF8INVWo8+AtDmw0INSnp8mVs9uZ6f2
 2IUKvJZzT0W3pic+rTL8+bJrpfItzfviv0cJpnAhLBkwHX2beqRpeCW8nLMsGeFyZY
 yTqusUdakGTfbGWHGbRb1q9/dnHfZqK1nCL/CdcEdSM38QX2LWGRieH5FzZvBDwfOX
 5iEgrTtclPzaQ==
Date: Fri, 27 Feb 2026 10:44:57 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: phasta@kernel.org, Matthew Brost <matthew.brost@intel.com>, 
 Danilo Krummrich <dakr@kernel.org>, Christian Koenig <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Matthew Auld <matthew.auld@intel.com>,
 Arun Pravin <arunpravin.paneerselvam@amd.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/tests: Mark slow tests as slow
Message-ID: <20260227-smoky-shellfish-of-penetration-a3be8d@houat>
References: <20260224110310.1854608-1-mripard@kernel.org>
 <1c76b8d6-9394-4017-a18f-95ecc2c08175@ursulin.net>
 <20260226-certain-tuscan-caribou-ba4c5e@penduick>
 <e343e45b-6328-4a38-ad31-1487e273f12a@ursulin.net>
 <595ce86b8a91f18ab8c73295a4a89c8f9353a794.camel@mailbox.org>
 <1d6a5850-117c-4586-aeae-9f22a96aefab@ursulin.net>
 <142389ed41fd83f94419ceecca9aa55f131494be.camel@mailbox.org>
 <6e9ae259-3830-4d1d-bedc-fbd58c5bae35@ursulin.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="nbfb324uq5cwy6sc"
Content-Disposition: inline
In-Reply-To: <6e9ae259-3830-4d1d-bedc-fbd58c5bae35@ursulin.net>
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
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tursulin@ursulin.net,m:phasta@kernel.org,m:matthew.brost@intel.com,m:dakr@kernel.org,m:christian.koenig@amd.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:matthew.auld@intel.com,m:arunpravin.paneerselvam@amd.com,m:simona.vetter@ffwll.ch,m:airlied@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[kernel.org,intel.com,amd.com,linux.intel.com,suse.de,ffwll.ch,gmail.com,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 309F91B5817
X-Rspamd-Action: no action


--nbfb324uq5cwy6sc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/tests: Mark slow tests as slow
MIME-Version: 1.0

On Thu, Feb 26, 2026 at 01:23:56PM +0000, Tvrtko Ursulin wrote:
>=20
> On 26/02/2026 13:17, Philipp Stanner wrote:
> > On Thu, 2026-02-26 at 13:02 +0000, Tvrtko Ursulin wrote:
> > >=20
> > > On 26/02/2026 12:48, Philipp Stanner wrote:
> > > > On Thu, 2026-02-26 at 12:42 +0000, Tvrtko Ursulin wrote:
> > > > >=20
> > > > > On 26/02/2026 10:56, Maxime Ripard wrote:
> > > > >=20
> > > > >=20
> > > >=20
> > > > [=E2=80=A6]
> > > >=20
> > > > > > > >  =C2=A0=C2=A0=C2=A0=C2=A0	{}
> > > > > > > >  =C2=A0=C2=A0=C2=A0 };
> > > > > > > >  =C2=A0=C2=A0=C2=A0 static struct kunit_suite drm_sched_pri=
ority =3D {
> > > > > > > >  =C2=A0=C2=A0=C2=A0=C2=A0	.name =3D "drm_sched_basic_priori=
ty_tests",
> > > > > > > > @@ -544,11 +544,11 @@ static void drm_sched_test_credits(st=
ruct kunit *test)
> > > > > > > >  =C2=A0=C2=A0=C2=A0=C2=A0	drm_mock_sched_entity_free(entity=
);
> > > > > > > >  =C2=A0=C2=A0=C2=A0=C2=A0	drm_mock_sched_fini(sched);
> > > > > > > >  =C2=A0=C2=A0=C2=A0 }
> > > > > > > >  =C2=A0=C2=A0=C2=A0 static struct kunit_case drm_sched_cred=
its_tests[] =3D {
> > > > > > > > -	KUNIT_CASE(drm_sched_test_credits),
> > > > > > > > +	KUNIT_CASE_SLOW(drm_sched_test_credits),
> > > > > > >=20
> > > > > > > Same really.
> > > > > > >=20
> > > > > > > Anyway, the scheduler parts LGTM and I can follow up trying t=
o optimise
> > > > > > > these two later.
> > > > > > >=20
> > > > > > > For the scheduler:
> > > > > > >=20
> > > > > > > Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > > > >=20
> > > > > > Thanks!
> > > > >=20
> > > > > I have a patch already which makes those (and one more) test cases
> > > > > faster, but I will wait sending it until you merge this one.
> > > >=20
> > > > And why would we want to flag a test as slow just to immediately
> > > > afterwards make it faster?
> > > >=20
> > > > Would it not be wiser to drop Maxime's change?
> > >=20
> > > Just so he doesn't have to respin, or that we don't end up merging my
> > > patch on top of the test already marked as slow. I am okay either way.
> >=20
> >  From my POV Maxime can decide that.
> >=20
> > But if your speed-up patches go in after, they should probably remove
> > the marker again, shouldn't they?
>=20
> Yes, that's why I said I was sitting on the patch.

I've just pushed it to drm-misc-next

Thanks!
Maxime

--nbfb324uq5cwy6sc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaaFnmAAKCRAnX84Zoj2+
dl6FAYCWwqGZtMMOk0BkjIwuawVYX2CLRqO7EYIM6hd4gXrN2Jt2Q1cR7yI/1KSW
LCL56nwBf2TNLehPTO6XOEoqYzdaOmlnffdU1LGfilqc1rURVLzXIPgFN//X1PnR
K4/IEdFI3Q==
=6M7u
-----END PGP SIGNATURE-----

--nbfb324uq5cwy6sc--

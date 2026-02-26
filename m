Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFhDOtQmoGk6fwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 11:56:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 514E01A4B02
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 11:56:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC5610E8DB;
	Thu, 26 Feb 2026 10:56:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Mb4yrmq2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC28510E8DB
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 10:56:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8E982418A1;
 Thu, 26 Feb 2026 10:56:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12FA2C2BCB1;
 Thu, 26 Feb 2026 10:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772103376;
 bh=rPO6cUOdVrWcPFhjPqfdLAHg2ysunhQpbYi7ff9keqc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mb4yrmq2Lz4VvMoyPpDC+bKBnJT1c62lixgdOfWRs63hYf45InkjhFFctNeTIEMs1
 lEeTDpRSmfu+zNW5OFup6zEZ7ht4wuUri6SsAtLrYWNPfnLOUn6MeTYvui9T9cyazi
 VMhwjv2uR/NM+Q8QHMAxDexa17jHh0tfNgfr8lB+sZwT6v5ovsbsbPEG1FAIROl7Js
 z+F1+HGAdRd86FfoeINUjDydHzMrG3fzqNuep+UB4q0GwNxSEaJj/aRmvGWtzrg/dP
 88Cx2WiXETgvhPQCP5asgP5tizh01JMIg7sXx3eOUc8Po15pxfM8KeRotfz5G3nHar
 UFb1pvihDXWZQ==
Date: Thu, 26 Feb 2026 11:56:13 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Matthew Brost <matthew.brost@intel.com>, 
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>, 
 Christian Koenig <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Matthew Auld <matthew.auld@intel.com>,
 Arun Pravin <arunpravin.paneerselvam@amd.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/tests: Mark slow tests as slow
Message-ID: <20260226-certain-tuscan-caribou-ba4c5e@penduick>
References: <20260224110310.1854608-1-mripard@kernel.org>
 <1c76b8d6-9394-4017-a18f-95ecc2c08175@ursulin.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ewen6bozgbrdj5du"
Content-Disposition: inline
In-Reply-To: <1c76b8d6-9394-4017-a18f-95ecc2c08175@ursulin.net>
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
	FORGED_RECIPIENTS(0.00)[m:tursulin@ursulin.net,m:matthew.brost@intel.com,m:dakr@kernel.org,m:phasta@kernel.org,m:christian.koenig@amd.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:matthew.auld@intel.com,m:arunpravin.paneerselvam@amd.com,m:simona.vetter@ffwll.ch,m:airlied@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,amd.com,linux.intel.com,suse.de,ffwll.ch,gmail.com,lists.freedesktop.org];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 514E01A4B02
X-Rspamd-Action: no action


--ewen6bozgbrdj5du
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/tests: Mark slow tests as slow
MIME-Version: 1.0

Hi Tvrtko,

On Tue, Feb 24, 2026 at 12:49:01PM +0000, Tvrtko Ursulin wrote:
>=20
> On 24/02/2026 11:03, Maxime Ripard wrote:
> > Some DRM tests cross the 1s execution time threshold that defines a test
> > as slow. Let's flag them as such.
>=20
> Curious that both did not trigger for me and I even run them under nested
> qemu most of the time.
>=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >   drivers/gpu/drm/scheduler/tests/tests_basic.c | 4 ++--
> >   drivers/gpu/drm/tests/drm_buddy_test.c        | 2 +-
> >   2 files changed, 3 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gp=
u/drm/scheduler/tests/tests_basic.c
> > index 82a41a456b0a..a5a5a35a87b0 100644
> > --- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
> > +++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> > @@ -419,11 +419,11 @@ static void drm_sched_change_priority(struct kuni=
t *test)
> >   		drm_mock_sched_entity_free(entity[i]);
> >   }
> >   static struct kunit_case drm_sched_priority_tests[] =3D {
> >   	KUNIT_CASE(drm_sched_priorities),
> > -	KUNIT_CASE(drm_sched_change_priority),
> > +	KUNIT_CASE_SLOW(drm_sched_change_priority),
>=20
> This one deliberately aims to run for ~1s and I don't have an immediate i=
dea
> how it would go over 2s.

1s is the threshold for a slow test:
https://elixir.bootlin.com/linux/v6.19.3/source/lib/kunit/test.c#L365

It only warns about it if it crosses 2s, but if it's expected to take
1s, it should be flagged as such still.

> >   	{}
> >   };
> >   static struct kunit_suite drm_sched_priority =3D {
> >   	.name =3D "drm_sched_basic_priority_tests",
> > @@ -544,11 +544,11 @@ static void drm_sched_test_credits(struct kunit *=
test)
> >   	drm_mock_sched_entity_free(entity);
> >   	drm_mock_sched_fini(sched);
> >   }
> >   static struct kunit_case drm_sched_credits_tests[] =3D {
> > -	KUNIT_CASE(drm_sched_test_credits),
> > +	KUNIT_CASE_SLOW(drm_sched_test_credits),
>=20
> Same really.
>=20
> Anyway, the scheduler parts LGTM and I can follow up trying to optimise
> these two later.
>=20
> For the scheduler:
>=20
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Thanks!

--ewen6bozgbrdj5du
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaaAmzAAKCRAnX84Zoj2+
duK+AYCZ2w2OrrKnkMGunBvb9P6RexxZVqO3A8ryGfkoD7XWNnE71nmzXL++bmDn
7er07hABf0JjZyJXwagKudwPS7csXeUZnq4+wjDfk8tzRGr21RfzbaAVbQ9+fJPU
nTPqP0VW9w==
=O9cF
-----END PGP SIGNATURE-----

--ewen6bozgbrdj5du--

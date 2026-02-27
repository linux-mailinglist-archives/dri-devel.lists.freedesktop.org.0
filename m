Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Jd75E8ZYoWlssQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 09:41:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A217D1B4A21
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 09:41:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DFA310E1FC;
	Fri, 27 Feb 2026 08:41:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="V9wdS3/r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80E610E1FC
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 08:41:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6DFA443E08;
 Fri, 27 Feb 2026 08:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C15B3C116C6;
 Fri, 27 Feb 2026 08:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772181697;
 bh=jI7uXKFVKtj31aIVLoVOA6W18xSHXGOZ6BlwrcaNx4Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V9wdS3/rls6yOiZweMNhSXCCPyamtwmiIXo+wYzMHygGkZe2+dT6fLsesaJyBkz9P
 kXYEjxF6cVN/nlNLKUloZjRZD13oNsGD4qNJ0/b6lvHTtqhIlUOXX58rLYSc+JWqPq
 VLb+lalArnPsrp4FtalkJGnCPEiUXb4H1wTDcxumSLTq1wlAoUYl9kCBNAhs/NIshQ
 QH7b8+/qwU0aoYkMOJkjjcf0Y51aPg3iZLOcJuFMQ9CGi3C/erx9DcHQiiRx+eEXpt
 5X/5glJpjN7/7gcTebE+/tOnBpIz+LbFZd3PHMLsKRpr30kCChqiNDgnwVCmTU//Nz
 ChNp/m/yhZxbA==
Date: Fri, 27 Feb 2026 09:41:34 +0100
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
Message-ID: <20260227-silent-eagle-from-uranus-f196a5@houat>
References: <20260224110310.1854608-1-mripard@kernel.org>
 <1c76b8d6-9394-4017-a18f-95ecc2c08175@ursulin.net>
 <20260226-certain-tuscan-caribou-ba4c5e@penduick>
 <e343e45b-6328-4a38-ad31-1487e273f12a@ursulin.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="htjyf6jtjxsd7azu"
Content-Disposition: inline
In-Reply-To: <e343e45b-6328-4a38-ad31-1487e273f12a@ursulin.net>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tursulin@ursulin.net,m:matthew.brost@intel.com,m:dakr@kernel.org,m:phasta@kernel.org,m:christian.koenig@amd.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:matthew.auld@intel.com,m:arunpravin.paneerselvam@amd.com,m:simona.vetter@ffwll.ch,m:airlied@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,amd.com,linux.intel.com,suse.de,ffwll.ch,gmail.com,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A217D1B4A21
X-Rspamd-Action: no action


--htjyf6jtjxsd7azu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/tests: Mark slow tests as slow
MIME-Version: 1.0

On Thu, Feb 26, 2026 at 12:42:39PM +0000, Tvrtko Ursulin wrote:
>=20
> On 26/02/2026 10:56, Maxime Ripard wrote:
> > Hi Tvrtko,
> >=20
> > On Tue, Feb 24, 2026 at 12:49:01PM +0000, Tvrtko Ursulin wrote:
> > >=20
> > > On 24/02/2026 11:03, Maxime Ripard wrote:
> > > > Some DRM tests cross the 1s execution time threshold that defines a=
 test
> > > > as slow. Let's flag them as such.
> > >=20
> > > Curious that both did not trigger for me and I even run them under ne=
sted
> > > qemu most of the time.
> > >=20
> > > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > > ---
> > > >    drivers/gpu/drm/scheduler/tests/tests_basic.c | 4 ++--
> > > >    drivers/gpu/drm/tests/drm_buddy_test.c        | 2 +-
> > > >    2 files changed, 3 insertions(+), 3 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/driver=
s/gpu/drm/scheduler/tests/tests_basic.c
> > > > index 82a41a456b0a..a5a5a35a87b0 100644
> > > > --- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
> > > > +++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> > > > @@ -419,11 +419,11 @@ static void drm_sched_change_priority(struct =
kunit *test)
> > > >    		drm_mock_sched_entity_free(entity[i]);
> > > >    }
> > > >    static struct kunit_case drm_sched_priority_tests[] =3D {
> > > >    	KUNIT_CASE(drm_sched_priorities),
> > > > -	KUNIT_CASE(drm_sched_change_priority),
> > > > +	KUNIT_CASE_SLOW(drm_sched_change_priority),
> > >=20
> > > This one deliberately aims to run for ~1s and I don't have an immedia=
te idea
> > > how it would go over 2s.
> >=20
> > 1s is the threshold for a slow test:
> > https://elixir.bootlin.com/linux/v6.19.3/source/lib/kunit/test.c#L365
> >=20
> > It only warns about it if it crosses 2s, but if it's expected to take
> > 1s, it should be flagged as such still.
>=20
> I know, just curious which environment managed to trigger the warning.
> Because I thought my test setup was the slowest one (nested virtualizatio=
n -
> qemu-system inside vmware).

I was running a cross-compiled arm64 system on my x86 machine, so
emulated. That being said, that one didn't cross the 2s threshold
either.

Other tests did, and I used the occasion to flag every test that was
taking more than 1s.

> > > >    	{}
> > > >    };
> > > >    static struct kunit_suite drm_sched_priority =3D {
> > > >    	.name =3D "drm_sched_basic_priority_tests",
> > > > @@ -544,11 +544,11 @@ static void drm_sched_test_credits(struct kun=
it *test)
> > > >    	drm_mock_sched_entity_free(entity);
> > > >    	drm_mock_sched_fini(sched);
> > > >    }
> > > >    static struct kunit_case drm_sched_credits_tests[] =3D {
> > > > -	KUNIT_CASE(drm_sched_test_credits),
> > > > +	KUNIT_CASE_SLOW(drm_sched_test_credits),
> > >=20
> > > Same really.
> > >=20
> > > Anyway, the scheduler parts LGTM and I can follow up trying to optimi=
se
> > > these two later.
> > >=20
> > > For the scheduler:
> > >=20
> > > Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> >=20
> > Thanks!
>=20
> I have a patch already which makes those (and one more) test cases faster,
> but I will wait sending it until you merge this one.

Ack, thanks!
Maxime

--htjyf6jtjxsd7azu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaaFYvQAKCRAnX84Zoj2+
dmcvAYD3FzIjoZnHgVGYHgMsPGceTls5rA3TR48Dr2LaQFCAYSfhTdCYILZvdvJz
GW1JqSYBf0VOMZ9/HR/OX7N6N7DBTJL0vBx/5GsuK5GwCq0R17u/sdADh1YVGgLN
SY+4F8RTiQ==
=sXBx
-----END PGP SIGNATURE-----

--htjyf6jtjxsd7azu--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHavBPJHoGkuhwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 14:17:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6ED1A63E2
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 14:17:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4791C10E929;
	Thu, 26 Feb 2026 13:17:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Z48YIJ00";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9428310E932
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 13:17:32 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fMBns1Z4Rz9vBj;
 Thu, 26 Feb 2026 14:17:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1772111847; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0SnjggdeCcYIM2NbkIfqaLdrKrKmBeMoy57ilSU+b6U=;
 b=Z48YIJ008Hu1RCIw4JYm4W/iTzs05FygO/pgkioe0iYCj3w7ZUq5MFFzaZr2nkBwR0LeDt
 Y32RewCUJ4sO/6Pm0l1oPboI2rSAGlG31cj4fYgbBiG4Psg5UsYx2KReWxgomN8hMsxQo8
 GXy8RUcfxvLzkO2eBpUsk5hwTdWkz7MblMevxApRuWz8DsfZkpGY1H1dSh7YMVZn3rBgHV
 8v9KdHm6VcpJA2+YMFJ5gLBOSdge47isN6as4qll9jQ0utgaGLR0QZXbRIfZdPLwynhBE8
 0jvwhiSVapWkDGaBMEIrEA6JlMT3XFCs731rf8CMVaGeGuRu8qaQyiCT/VuS9A==
Message-ID: <142389ed41fd83f94419ceecca9aa55f131494be.camel@mailbox.org>
Subject: Re: [PATCH] drm/tests: Mark slow tests as slow
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tursulin@ursulin.net>, phasta@kernel.org, Maxime Ripard
 <mripard@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich
 <dakr@kernel.org>,  Christian Koenig <christian.koenig@amd.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Matthew Auld <matthew.auld@intel.com>, Arun Pravin
 <arunpravin.paneerselvam@amd.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Date: Thu, 26 Feb 2026 14:17:11 +0100
In-Reply-To: <1d6a5850-117c-4586-aeae-9f22a96aefab@ursulin.net>
References: <20260224110310.1854608-1-mripard@kernel.org>
 <1c76b8d6-9394-4017-a18f-95ecc2c08175@ursulin.net>
 <20260226-certain-tuscan-caribou-ba4c5e@penduick>
 <e343e45b-6328-4a38-ad31-1487e273f12a@ursulin.net>
 <595ce86b8a91f18ab8c73295a4a89c8f9353a794.camel@mailbox.org>
 <1d6a5850-117c-4586-aeae-9f22a96aefab@ursulin.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 591a834be86b9fac72b
X-MBO-RS-META: b8adcsub8dfg5hrn31o6abb8rtyrusu1
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tursulin@ursulin.net,m:phasta@kernel.org,m:mripard@kernel.org,m:matthew.brost@intel.com,m:dakr@kernel.org,m:christian.koenig@amd.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:matthew.auld@intel.com,m:arunpravin.paneerselvam@amd.com,m:simona.vetter@ffwll.ch,m:airlied@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,amd.com,linux.intel.com,suse.de,ffwll.ch,gmail.com,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mailbox.org:mid,mailbox.org:dkim]
X-Rspamd-Queue-Id: 4D6ED1A63E2
X-Rspamd-Action: no action

On Thu, 2026-02-26 at 13:02 +0000, Tvrtko Ursulin wrote:
>=20
> On 26/02/2026 12:48, Philipp Stanner wrote:
> > On Thu, 2026-02-26 at 12:42 +0000, Tvrtko Ursulin wrote:
> > >=20
> > > On 26/02/2026 10:56, Maxime Ripard wrote:
> > >=20
> > >=20
> >=20
> > [=E2=80=A6]
> >=20
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	{}
> > > > > > =C2=A0=C2=A0=C2=A0 };
> > > > > > =C2=A0=C2=A0=C2=A0 static struct kunit_suite drm_sched_priority=
 =3D {
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	.name =3D "drm_sched_basic_priority_te=
sts",
> > > > > > @@ -544,11 +544,11 @@ static void drm_sched_test_credits(struct=
 kunit *test)
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	drm_mock_sched_entity_free(entity);
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	drm_mock_sched_fini(sched);
> > > > > > =C2=A0=C2=A0=C2=A0 }
> > > > > > =C2=A0=C2=A0=C2=A0 static struct kunit_case drm_sched_credits_t=
ests[] =3D {
> > > > > > -	KUNIT_CASE(drm_sched_test_credits),
> > > > > > +	KUNIT_CASE_SLOW(drm_sched_test_credits),
> > > > >=20
> > > > > Same really.
> > > > >=20
> > > > > Anyway, the scheduler parts LGTM and I can follow up trying to op=
timise
> > > > > these two later.
> > > > >=20
> > > > > For the scheduler:
> > > > >=20
> > > > > Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > >=20
> > > > Thanks!
> > >=20
> > > I have a patch already which makes those (and one more) test cases
> > > faster, but I will wait sending it until you merge this one.
> >=20
> > And why would we want to flag a test as slow just to immediately
> > afterwards make it faster?
> >=20
> > Would it not be wiser to drop Maxime's change?
>=20
> Just so he doesn't have to respin, or that we don't end up merging my
> patch on top of the test already marked as slow. I am okay either way.

From my POV Maxime can decide that.

But if your speed-up patches go in after, they should probably remove
the marker again, shouldn't they?


P.

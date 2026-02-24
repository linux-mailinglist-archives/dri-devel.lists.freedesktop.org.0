Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOeuECKdnWnwQgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 13:44:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D83218722E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 13:44:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA3E810E56E;
	Tue, 24 Feb 2026 12:44:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="pBVmotrV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A1C895CA
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 12:44:13 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fKy8V0Nkkz9vBl;
 Tue, 24 Feb 2026 13:44:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1771937050; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RxkSCX9jSePv4HDz10rAW//n/j/3CWDn153Nc3v7e4o=;
 b=pBVmotrVELLGAUGb28t67xg/5T/yqRFV19GJzIe/dIgIN8r7/2MklrNmcwQpq7jVIJIULD
 RQcMy7c1mbWjmmodSITWGF3J14OPA8JJhn1l+NMFGiIJxyDiXrm45fLK+GT4fTkepgiyJj
 X90piuNHTq8iTQTJuxtjo/4wgxOyUdRSvXxhaDr1zE+AYUXKPYd9YlF6WzsAlnZXWUkqGM
 gxTSqcG/3RRAMXteZ7ZhCztswIbvx/hiVod6L9leHx9nXHGJDmBmsv+Oqqb0MGFHuoEm5F
 WrXr3lgAuNZ7ebMNiNyQ6KbMXRdTqKQUueUYdP+CDXyhw7Uq8FBcrpw0XzkmQw==
Message-ID: <020433384b88cd7bc88762373dd6e6b5a9d07c66.camel@mailbox.org>
Subject: Re: [PATCH] drm/tests: Mark slow tests as slow
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tursulin@ursulin.net>, Danilo Krummrich
 <dakr@kernel.org>,  Maxime Ripard <mripard@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>, Philipp Stanner
 <phasta@kernel.org>,  Christian Koenig <christian.koenig@amd.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Matthew Auld <matthew.auld@intel.com>, Arun Pravin
 <arunpravin.paneerselvam@amd.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Date: Tue, 24 Feb 2026 13:44:04 +0100
In-Reply-To: <bafed0bf-4cb0-4ad2-b027-8d826dc781d4@ursulin.net>
References: <20260224110310.1854608-1-mripard@kernel.org>
 <DGN5YXMO9CBB.5T29K0XHUXMF@kernel.org>
 <bafed0bf-4cb0-4ad2-b027-8d826dc781d4@ursulin.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: a7834fe8ea3ba1e234c
X-MBO-RS-META: ogaqg9sg758u9gi595xcrx9hjnm55uet
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tursulin@ursulin.net,m:dakr@kernel.org,m:mripard@kernel.org,m:matthew.brost@intel.com,m:phasta@kernel.org,m:christian.koenig@amd.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:matthew.auld@intel.com,m:arunpravin.paneerselvam@amd.com,m:simona.vetter@ffwll.ch,m:airlied@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,amd.com,linux.intel.com,suse.de,ffwll.ch,gmail.com,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:mid,mailbox.org:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6D83218722E
X-Rspamd-Action: no action

On Tue, 2026-02-24 at 12:29 +0000, Tvrtko Ursulin wrote:
>=20
> On 24/02/2026 11:43, Danilo Krummrich wrote:
> > (Cc: Tvrtko)
> >=20
> > On Tue Feb 24, 2026 at 12:03 PM CET, Maxime Ripard wrote:
> > > Some DRM tests cross the 1s execution time threshold that defines a t=
est
> > > as slow. Let's flag them as such.
> >=20
> > <snip>
> >=20
> > > =C2=A0 static struct kunit_case drm_sched_credits_tests[] =3D {
> > > -	KUNIT_CASE(drm_sched_test_credits),
> > > +	KUNIT_CASE_SLOW(drm_sched_test_credits),
> >=20
> > Hm..I don't think this test should be that slow.
> >=20
> > Looking at the code, I see intentional timeouts through:
> >=20
> > 	done =3D drm_mock_sched_job_wait_scheduled(job[1], HZ);
> > 	KUNIT_ASSERT_FALSE(test, done);
> >=20
> > Since the timeout is in jiffies, this should be always 1s, which seems =
a bit
> > overkill.
> >=20
> > Maybe we should just change this to msecs_to_jiffies(200), which should=
 still be
> > plenty and keep the test below 500ms.
>=20
> Right, 200ms should be more than plenty.
>=20

Who volunteers for implementing that change? :)

P.

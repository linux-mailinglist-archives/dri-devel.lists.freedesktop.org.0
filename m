Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPl7BumOnWkXQgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 12:43:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F965186777
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 12:43:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8656D10E29A;
	Tue, 24 Feb 2026 11:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QU3QYEk1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80B410E29A
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 11:43:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B9B5261332;
 Tue, 24 Feb 2026 11:43:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A3BAC116D0;
 Tue, 24 Feb 2026 11:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771933411;
 bh=WFO0FMP0ZkIjT7q1qvREiyHrV6yYl5FohSSycAyQHxk=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=QU3QYEk1C7eiNqnC8bSji+efrn76LSvARsliu3yJ6Dd2Jh1IOmaLNK+ebwWuNwq66
 M5hYq+t2VPSs0JtKqVoYB4WYqAensQAMoZW91MHJjc93enEmAjh1RGis4cIa5EDJaI
 BoFOUzKDooZzGFgIzBxBri+DxDuqTYhbDhGR3HYWwZDKIT4YjACGpP8mShqD4IRBJ0
 lTsT5zOENjq1SQjctASjb8EYxqH/YdJLBpb6Et50GDXT2FYNF8fUxI3bMR0y9QO+PD
 5KdiGDtCrHAuag+e0UqB92oD0z6VtuX0Uk35yqaxOOW0kC4l6iQNMF0Ul/D4gTDIYH
 GjIrI/UbFh86g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Feb 2026 12:43:27 +0100
Message-Id: <DGN5YXMO9CBB.5T29K0XHUXMF@kernel.org>
Subject: Re: [PATCH] drm/tests: Mark slow tests as slow
Cc: "Matthew Brost" <matthew.brost@intel.com>, "Philipp Stanner"
 <phasta@kernel.org>, "Christian Koenig" <christian.koenig@amd.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Matthew Auld" <matthew.auld@intel.com>,
 "Arun Pravin" <arunpravin.paneerselvam@amd.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "David Airlie" <airlied@gmail.com>,
 <dri-devel@lists.freedesktop.org>, "Tvrtko Ursulin" <tursulin@ursulin.net>
To: "Maxime Ripard" <mripard@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260224110310.1854608-1-mripard@kernel.org>
In-Reply-To: <20260224110310.1854608-1-mripard@kernel.org>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,amd.com,linux.intel.com,suse.de,ffwll.ch,gmail.com,lists.freedesktop.org,ursulin.net];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:matthew.brost@intel.com,m:phasta@kernel.org,m:christian.koenig@amd.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:matthew.auld@intel.com,m:arunpravin.paneerselvam@amd.com,m:simona.vetter@ffwll.ch,m:airlied@gmail.com,m:tursulin@ursulin.net,m:mripard@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7F965186777
X-Rspamd-Action: no action

(Cc: Tvrtko)

On Tue Feb 24, 2026 at 12:03 PM CET, Maxime Ripard wrote:
> Some DRM tests cross the 1s execution time threshold that defines a test
> as slow. Let's flag them as such.

<snip>

>  static struct kunit_case drm_sched_credits_tests[] =3D {
> -	KUNIT_CASE(drm_sched_test_credits),
> +	KUNIT_CASE_SLOW(drm_sched_test_credits),

Hm..I don't think this test should be that slow.

Looking at the code, I see intentional timeouts through:

	done =3D drm_mock_sched_job_wait_scheduled(job[1], HZ);
	KUNIT_ASSERT_FALSE(test, done);

Since the timeout is in jiffies, this should be always 1s, which seems a bi=
t
overkill.

Maybe we should just change this to msecs_to_jiffies(200), which should sti=
ll be
plenty and keep the test below 500ms.

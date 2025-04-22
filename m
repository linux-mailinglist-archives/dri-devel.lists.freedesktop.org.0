Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C179BA96854
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 14:00:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C62B10E087;
	Tue, 22 Apr 2025 12:00:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="q+PykJF0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DAF10E087;
 Tue, 22 Apr 2025 12:00:22 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Zhgm16Xl5z9tQY;
 Tue, 22 Apr 2025 14:00:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1745323218; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1vpYm+GQxhLlWhb6ifByWLEltnQPSlybhasf4ERMH8Q=;
 b=q+PykJF0H2r6JiN/VNCR1+a218ywnoE6PZ226N3JwQaNyjuwRz4fAT6XKX3pyflIz4HoME
 rbRL2GVEz0rbAmX7yH6J4ksvagXPGG8V8pWJDPjJmG/UCni3uBQ9pF7dxnc3zE7Y0PgSp1
 geQjVuk4jtftJ4tzLhKujml6kqfkuT50KgaEPJ5JEof2MoOXZf0eTAVSLvQPE0FfpgaATu
 QEb58Ly1Z7Sjm1MC+IWZFBchEal9sgWhuFyzTPzYp2Wlkr1Uzp/NF5E600OwgVDTECI2Q+
 IlITcPQyB1KXHifWKHx8D03jHd13EdMpOYiATDl8Z/xv3rlikLbkvpRdKEoNRA==
Message-ID: <649c7fe3469c39496db89de6951d9f2b61c36576.camel@mailbox.org>
Subject: Re: [PATCH 3/5] drm/sched: Warn if pending list is not empty
From: Philipp Stanner <phasta@mailbox.org>
To: Danilo Krummrich <dakr@kernel.org>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>
Cc: phasta@kernel.org, Lyude Paul <lyude@redhat.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matthew Brost
 <matthew.brost@intel.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org,  linux-kernel@vger.kernel.org
Date: Tue, 22 Apr 2025 14:00:11 +0200
In-Reply-To: <aAd54jUwBwgc-_g2@cassiopeiae>
References: <20250407152239.34429-2-phasta@kernel.org>
 <20250407152239.34429-5-phasta@kernel.org>
 <9607e5a54b8c5041dc7fc134425cc36c0c70b5f3.camel@mailbox.org>
 <3ac34c84-fd84-4598-96e1-239418b7109f@igalia.com> <aADv4ivXZoJpEA7k@pollux>
 <83758ca7-8ece-433e-b904-3d21690ead23@igalia.com>
 <aAEUwjzZ9w9xlKRY@cassiopeiae>
 <0e8313dc-b1bb-4ce7-b5b7-b8b3e027adb7@igalia.com>
 <0bfa746ca37de1813db22e518ffb259648d29e02.camel@mailbox.org>
 <5a5d4a33-2f7b-46e4-8707-7445ac3de376@igalia.com>
 <aAd54jUwBwgc-_g2@cassiopeiae>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 4c04011615e20bdd267
X-MBO-RS-META: n61eesopsdmkks4z8prq1n7h8hkk6wg4
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

On Tue, 2025-04-22 at 13:13 +0200, Danilo Krummrich wrote:
> On Tue, Apr 22, 2025 at 11:39:11AM +0100, Tvrtko Ursulin wrote:
> > Question I raised is if there are other drivers which manage to
> > clean up
> > everything correctly (like the mock scheduler does), but trigger
> > that
> > warning. Maybe there are not and maybe mock scheduler is the only
> > false
> > positive.

For clarification:

I messed up the comment from the cover letter.

What I did was run the *old* unit tests (v5 IIRC) from Tvrtko that
still had the memory leaks. Those then trigger the warning print, as is
expected, since they don't provide fence_context_kill().

The current unit tests are fine memory-leak-wise.

IOW, both with Nouveau and the unit tests, everything behaves as
expected, without issues.

Sorry for the confusion.

P.

>=20
> So far the scheduler simply does not give any guideline on how to
> address the
> problem, hence every driver simply does something (or nothing,
> effectively
> ignoring the problem). This is what we want to fix.
>=20
> The mock scheduler keeps it's own list of pending jobs and on tear
> down stops
> the scheduler's workqueues, traverses it's own list and eventually
> frees the
> pending jobs without updating the scheduler's internal pending list.
>=20
> So yes, it does avoid memory leaks, but it also leaves the schedulers
> internal
> structures with an invalid state, i.e. the pending list of the
> scheduler has
> pointers to already freed memory.
>=20
> What if the drm_sched_fini() starts touching the pending list? Then
> you'd end up
> with UAF bugs with this implementation. We cannot invalidate the
> schedulers
> internal structures and yet call scheduler functions - e.g.
> drm_sched_fini() -
> subsequently.
>=20
> Hence, the current implementation of the mock scheduler is
> fundamentally flawed.
> And so would be *every* driver that still has entries within the
> scheduler's
> pending list.
>=20
> This is not a false positive, it already caught a real bug -- in the
> mock
> scheduler.
>=20
> - Danilo


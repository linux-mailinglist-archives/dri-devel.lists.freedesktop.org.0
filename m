Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4535A5EE1D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 09:35:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C62310E372;
	Thu, 13 Mar 2025 08:35:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="aTlo2QJz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA8010E372
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 08:35:05 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ZD15d3xYPz9sjF;
 Thu, 13 Mar 2025 09:35:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1741854901; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kp8qFH5yvk4Y6Gha5eriA5DnXELSGdFZ7uTulNdAiE8=;
 b=aTlo2QJzu0I6l65wL0MeA7YCnAkr2k6qnD7y6XuhMH/VdO03AmwUKGhBJs3hSc9leAgN8+
 hxMs+qgB/ns5QfGkqDCREUDIbtn+CqjJfwvqVUHwtE+BfSvjcU0a1Y9Q78oSG23vIG+zSP
 EI/SryXF7ch9JWis6dOBCWMk+YgsuvH1atBKSzGEWT1ZtQHFu7l95fwJlV86MVh8IcCair
 Ki6wBNYwTh+mXa3nU/R2beRm5SiQUBP1uQ7yx/6gk+34s33kEZUFnM0e9jly2mXyRRK5iD
 115Y2zUJnHXOAXAGvVPaMfO+AjVz8sTqpIhSlDyMs1uyvgS3UzkM82H8pv+c8A==
Message-ID: <2b63f2889e77dc884b663dda1a52a3c8012b4e01.camel@mailbox.org>
Subject: Re: [PATCH v7 0/7] DRM scheduler kunit tests
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, phasta@kernel.org, 
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>
Date: Thu, 13 Mar 2025 09:34:56 +0100
In-Reply-To: <8526f1e1-07d7-4389-8655-482f3c25f641@igalia.com>
References: <20250311092339.52199-1-tvrtko.ursulin@igalia.com>
 <d92d3b58fa34f4beb957feeb372f9e18237d1c1c.camel@mailbox.org>
 <0f0102cb-8036-4fc6-898e-cd4eab4edfe0@igalia.com>
 <3ce2bdb2cacd9d30bd5de282e227721d838822b8.camel@mailbox.org>
 <f3e52167-eab5-44a7-a769-c861c7f46a8d@igalia.com>
 <750b4501-fd2b-45e9-b563-1e6440216129@igalia.com>
 <91dd26db9b89e58c9c36272b7ac777ed9c6e3c61.camel@mailbox.org>
 <8526f1e1-07d7-4389-8655-482f3c25f641@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: b3jpgc396qbhn49h396yfnirz87p7ooy
X-MBO-RS-ID: f442c1db970f2f579e9
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

On Wed, 2025-03-12 at 14:33 +0000, Tvrtko Ursulin wrote:
>=20
> On 12/03/2025 13:49, Philipp Stanner wrote:
>=20
> [snip]
>=20
> > > > > There I see a UAF. Do you have an idea what that might be? I
> > > > > would only
> > > > > expect memory leaks and the test assertions failing.
> > > >=20
> > > > It is expected all hell to break loose in aspirational mode.
> > > > There
> > > > the
> > > > mock scheduler shutdown relies solely on drm_sched_fini. So all
> > > > tests
> > > > which do not fully idle the mock scheduler themselves, whether
> > > > implicity
> > > > or explicitly, will explode in various ways.
> > >=20
> > > To clarify I made it like that because that is what I understood
> > > was
> > > your vision for drm_sched_fini. That it would be able to clean
> > > everything up etc.
> > >=20
> > > If you meant something different we need to adjust it. Although
> > > it
> > > could
> > > be done later as well.
> >=20
> > My primary intention was to use those tests to see whether my
> > memory
> > leak fix works or not.
>=20
> Okay here I don't know exactly what are you changing and how you are=20
> testing to comment.
>=20
> > Thus I'd need something like in v4, where the tests run as intended
> > but
> > leak the jobs in the pending_list. Would indeed be neat if they
> > also
> > check for list_len(pending_list) so that you don't have to run
> > kmemleak
> > manually.
> >=20
> > And since we shouldn't have such leaks in production tests the idea
> > of
> > optionally enabling them arose.
> >=20
> > More generally speaking, I think that the tests should behave as we
> > expect drivers to behave *currently*, while we have the option for
> > the
> > tests to purposefully misbehave. In my case this means: just leak
> > the
> > jobs and optionally tell about the leaks.
> >=20
> > When used as intended, the scheduler currently AFAIK doesn't have
> > UAF
> > or nullptrderefs, so they shouldn't occur in tests that use it as
> > intended. Now the leaks are special because we never intended them.
> >=20
> > So what surprised me is that, when compared to v4, this v7 here
> > actually now also has UAF. Besides not cleaning up leaks, what are
> > you
> > doing in aspiritional mode?
> >=20
> > Let's talk it through before you invest your time into v8
>=20
> 1)
>=20
> "Normal" mode is fine, do you agree? No leaks, no UAF. Ie. it is=20
> exercising the scheduler how drivers are supposed to use it today.

Yes, it is fine.

>=20
> 2)
>=20
> Aspirational mode I added on your request and you can define how you=20
> want it to work.

My personal intention is simple: have the jobs leaked like in v4,
without UAF or faults and the like.

>=20
> Lets have a look in drm_mock_sched_fini() and see that it is pretty=20
> straightforward. First I'll pre-process and annotate the normal
> version:
>=20
> void drm_mock_sched_fini(struct drm_mock_scheduler *sched)
> {
> 	struct drm_mock_sched_job *job, *next;
> 	struct kunit=C2=A0 *test =3D sched->test;
> 	unsigned long flags;
> 	LIST_HEAD(signal);
>=20
> 	// Stop the scheduler workqueues so nothing further gets
> scheduled
> 	drm_sched_wqueue_stop(&sched->base);
>=20
> 	// Idle the mock scheduler in-flight jobs:
>=20
> 	// First move them to a local list so any in parallel
> "hardware"=20
> activity does not see them any more
>=20
> 	spin_lock_irqsave(&sched->lock, flags);
> 	list_for_each_entry_safe(job, next, &sched->job_list, link)
> 		list_move_tail(&job->link, &signal);
> 	spin_unlock_irqrestore(&sched->lock, flags);
>=20
> 	// Now for jobs which "hardware" hasn't processed yet we do:
> 	//
> 	// 1. Cancel the completion timer
> 	// 2. Mark the job as complete (signal the hw fence, wake up
> waiters)
> 	// 3. Release the hardware fence (list had a reference)
> 	// 4. Free the job itself
>=20
> 	list_for_each_entry(job, &signal, link) {
> 		hrtimer_cancel(&job->timer);
> 		drm_mock_sched_job_complete(job);
> 		dma_fence_put(&job->hw_fence);
> 		drm_sched_job_cleanup(&job->base);
> 	}
>=20
> 	// Finally drm_sched_fini
> 	drm_sched_fini(&sched->base);
> }
>=20
> In aspirational mode it becomes this:
>=20
> void drm_mock_sched_fini(struct drm_mock_scheduler *sched)
> {
> 	struct kunit=C2=A0 *test =3D sched->test;
>=20
> 	drm_sched_fini(&sched->base);
>=20
> 	KUNIT_ASSERT_TRUE(test, list_empty(&sched->job_list));
> 	KUNIT_ASSERT_TRUE(test, list_empty(&sched-
> >base.pending_list));
> }
>=20
> So relies on drm_sched_fini to cleanup _everything_. Including the=20
> driver (mock scheduler) state. Which is what I understood you wanted.

Thx for the detailed explanation. _Everything_ seems a lot, though.
Even in this version, you still stop submission to your entities, don't
you?

IOW: is drm_sched_fini(), in aspirational mode, responsible for more
than preventing the leaks (and for what it is already doing in mainline
linux)?

>=20
> For example drm_sched_basic_entity_cleanup test case will exit (kill
> the=20
> entities and tear down the scheduler) with half of the submitted jobs
> still in flight. That's one example of what will be caught here by
> the=20
> asserts and also UAF since kunit test will just exit and free up
> memory=20
> regardless.

Hmm. OK, so kunit does the free. But who does the access?
drm_sched_fini() still stops all the work items.

>=20
> If this isn't what you had in mind you can either a) tell me what you
> want maybe I can tweak it*, or b) we can drop the aspirational patch
> for=20
> now.


So, here's the bad news. I had a chat with Danilo yesterday who
reminded me of the fact that there are testers out there (like the
Intel bots) which do random kconfigs - so avoiding that with another
kconfig option does not solve the problem.

Thus, I think the way to go is to indeed drop aspirational mode and
whoever works on Schr=C3=B6dinger-Problems (like myself) has to tweak the
tests locally.

That's probably even more productive process-wise, otherwise we'd have
to remove broken aspects of (or the entire) aspirational mode every
time that we solved a known problem.

Unless you have a better proposal, let's drop that mode.


Sorry for the zig-zag, but that wasn't on my / our radar


P.


>=20
> *)
> For example it would be possible to avoid UAFs by moving away from
> kunit=20
> managed allocations and just leak memory. Plus, it would also be=20
> required to cancel the timers or so.
>=20
> For running in the VM or UML cases, which I thought were typical, it=20
> wouldn't be a benefit, but if you are worried about running on the
> host=20
> kernel and expect no crashes, then that aspect would need to change.
>=20
> Regards,
>=20
> Tvrtko
>=20


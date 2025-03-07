Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFC6A5700F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 19:06:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0174210E008;
	Fri,  7 Mar 2025 18:06:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="l+TDEK3b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A24B210E008
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 18:06:15 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Z8Z3S2VBmz9t5k;
 Fri,  7 Mar 2025 19:06:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1741370772; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gOULT+y5tMwGMCr3JTm9sUOzkdY6/PVrtxtXoMBxsy0=;
 b=l+TDEK3bLzvuX1cQSW9KMszYFnKG1rWUlm6XxJcGyABdBTOYJEB1vQQot9+r42jOjQ8tWC
 7HGbz1aU97cZMcf+jkX1RWBEs06gJv/JNAtvg819tRnM9VWHrdbRVPxtRJI5SBAv0UZYxW
 dw5gsL65jAPeGjMIhRM5FxOEMMN+fzRgF/sEWkTArj5cVegOjXkSakBGaC7wiHwv8Obul8
 w/pFqXWsB29v2SIUihnOsedDVK1xjaPM3ukta3j5VkoRklCbTmO5AXepowCzRDc66Zk1tJ
 03oG6KaKywqwfJL+JV6QWJabSR/5XQMmwD8elM8HMJEyfZN5Jsbq51gJKrb4iw==
Message-ID: <61b4e7342572269b61ed4188dccfb688c3d95d79.camel@mailbox.org>
Subject: Re: [PATCH v4 1/5] drm: Move some options to separate new Kconfig
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, phasta@kernel.org, 
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Simona Vetter <simona@ffwll.ch>, David
 Airlie <airlied@gmail.com>
Date: Fri, 07 Mar 2025 19:06:09 +0100
In-Reply-To: <f9bbc28f-d2ee-403d-ba9b-708edcc4fb20@igalia.com>
References: <20250306170555.7244-1-tvrtko.ursulin@igalia.com>
 <20250306170555.7244-2-tvrtko.ursulin@igalia.com>
 <d355bccc3127b727c9f6fe03dfd7a43e4c5cc78e.camel@mailbox.org>
 <f9bbc28f-d2ee-403d-ba9b-708edcc4fb20@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: bur4rtrjkbix4tf67o74knjecyoqnyjj
X-MBO-RS-ID: aebcc51d303fabe15c1
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

On Fri, 2025-03-07 at 16:59 +0000, Tvrtko Ursulin wrote:
>=20
> On 07/03/2025 13:41, Philipp Stanner wrote:
> > Hi,
> >=20
> > You forgot to put folks in CC as recipents for the cover letter :(
> >=20
> >=20
> > On Thu, 2025-03-06 at 17:05 +0000, Tvrtko Ursulin wrote:
> > > Move some options out into a new debug specific kconfig file in
> > > order
> > > to
> > > make things a bit cleaner.
> > >=20
> > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Philipp Stanner <phasta@kernel.org>
> >=20
> > We all have our individual work flows, so don't take this as
> > lecturing
> > or anything =E2=80=93 I just suspect that I was forgotten in the cover
> > letter
> > because you Cc people by hand in the individual patches.
> >=20
> > What I do is that I run get_maintainer and then put the individuals
> > listed there into the --to=3D field. That sends the entire series to
> > all
> > of them.
> >=20
> > Only sometimes, when there's a huge list of recipents or when the
> > patches of a series are very independent, I deviate from that rule.
> >=20
> > JFYI
>=20
> Notice it was there in v3, I just omitted to paste it this time.
>=20
> > Anyways, we have a bigger problem about the entire series. I now
> > tested
> > again with the same setup as yesterday and the faults are indeed
> > gone,
> > so that's good.
> >=20
> > But to be sure I then did run kmemleak and got a list of leaks that
> > is
> > more than 2000 lines long.
>=20
> There is this comment for drm_sched_fini which ends with:
>=20
> """
> ...
> =C2=A0 * This stops submission of new jobs to the hardware through
> =C2=A0 * drm_sched_backend_ops.run_job(). Consequently,=20
> drm_sched_backend_ops.free_job()
> =C2=A0 * will not be called for all jobs still in
> drm_gpu_scheduler.pending_list.
> =C2=A0 * There is no solution for this currently. Thus, it is up to the=
=20
> driver to make
> =C2=A0 * sure that:
> =C2=A0 *
> =C2=A0 *=C2=A0 a) drm_sched_fini() is only called after for all submitted=
 jobs
> =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_backend_ops.free_job() has bee=
n called or that
> =C2=A0 *=C2=A0 b) the jobs for which drm_sched_backend_ops.free_job() has=
 not
> been=20
> called
> =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0 after drm_sched_fini() ran are freed man=
ually.
> =C2=A0 *
>=20
> =C2=A0 * FIXME: Take care of the above problem and prevent this function
> from=20
> leaking
> =C2=A0 * the jobs in drm_gpu_scheduler.pending_list under any
> circumstances.
> """
>=20
> I got bitten by that. Keep forgetting how fragile the thing is.. :(

argh damn, those are *all* from the pending_list?!

OK. Well.

Now we've got a philosophical problem:

We still have to fix those leaks (I'm still working on it, but my
current attempt has failed and I probably fall back to a refcount
solution).

And to see whether the fix actually fixes the leaks, directly using the
kunit tests would be handy.

After all, this is what the kunit tests are there for: show what is
broken within the scheduler. And those leaks definitely qualify. Or
should kunit tests follow the same rules we demand from drivers?

I'd like to hear more opinions about that.

@Danilo, @Dave, @Sima
would it be OK if we add kunit tests for the scheduler to DRM that
cause leaks until we can fix them?


P.


>=20
> Regards,
>=20
> Tvrtko
>=20


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BE3B895E1
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 14:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411A910E998;
	Fri, 19 Sep 2025 12:11:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="JY36eORK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58AAE10E998
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 12:11:36 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cSrvn1m29z9tqX;
 Fri, 19 Sep 2025 14:11:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1758283893; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JJK735vegIkWG7nNh4y99VskygLNEoaW8Uhdx54BEJs=;
 b=JY36eORK5cUOQdLbJZWlcJ3GuBdV37+oKbxdYfYPij3uFB7wpk/5Ewq/THP86j+PP3ZDH3
 9IFfvliFbIs9ZoeSkm0rrQvC8E1NSbeqb/MLyva8csFs5FkNwGKSipdqBqOnfaS9F8ijeT
 bPjybw1Hq3f0coD+e42eId7JAlb6A2ujNXGijBTDqpOGi2PKy/CpIm+qPXYxG68wY5MK7k
 y79yH9v0bs2nAAIG5OZOeShzXi4EWqFdSNKxPtVGgSrRs3kms65lINqA1DA8cEZ/IvCT7o
 yX1LRpTSyNrapO5qAiCRMPRHy/PVLO7miYgAxAYxL+aXjzQpEs2DC6gpPaszBw==
Message-ID: <421f5c8946671872a2f7c35c15f3def5bdc053d5.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched/tests: Remove relict of done_list
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Philipp Stanner
 <phasta@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Danilo
 Krummrich <dakr@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,  =?ISO-8859-1?Q?Ma=EDra?= Canal
 <mcanal@igalia.com>, Liao Yuanhong <liaoyuanhong@vivo.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Fri, 19 Sep 2025 14:11:27 +0200
In-Reply-To: <ad1359c3-86ae-4ed1-ac60-902daa2331a7@igalia.com>
References: <20250919064450.147176-2-phasta@kernel.org>
 <ad1359c3-86ae-4ed1-ac60-902daa2331a7@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 4abchh9ij7rdgjz97ny44odjxy17aqpb
X-MBO-RS-ID: 52f79e0cb21bf2566bb
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

On Fri, 2025-09-19 at 08:33 +0100, Tvrtko Ursulin wrote:
>=20
> On 19/09/2025 07:44, Philipp Stanner wrote:
> > A rework of the scheduler unit tests removed the done_list. That list i=
s
> > still mentioned in the mock test header.
> >=20
> > Remove that relict.
> >=20
> > Fixes: 4576de9b7977 ("drm/sched/tests: Implement cancel_job() callback"=
)
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > =C2=A0 drivers/gpu/drm/scheduler/tests/sched_tests.h | 3 +--
> > =C2=A0 1 file changed, 1 insertion(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/tests/sched_tests.h b/drivers/gp=
u/drm/scheduler/tests/sched_tests.h
> > index 7f31d35780cc..553d45abd057 100644
> > --- a/drivers/gpu/drm/scheduler/tests/sched_tests.h
> > +++ b/drivers/gpu/drm/scheduler/tests/sched_tests.h
> > @@ -31,9 +31,8 @@
> > =C2=A0=C2=A0 *
> > =C2=A0=C2=A0 * @base: DRM scheduler base class
> > =C2=A0=C2=A0 * @test: Backpointer to owning the kunit test case
> > - * @lock: Lock to protect the simulated @hw_timeline, @job_list and @d=
one_list
> > + * @lock: Lock to protect the simulated @hw_timeline and @job_list
> > =C2=A0=C2=A0 * @job_list: List of jobs submitted to the mock GPU
> > - * @done_list: List of jobs completed by the mock GPU
> > =C2=A0=C2=A0 * @hw_timeline: Simulated hardware timeline has a @context=
, @next_seqno and
> > =C2=A0=C2=A0 *		 @cur_seqno for implementing a struct dma_fence signali=
ng the
> > =C2=A0=C2=A0 *		 simulated job completion.
>=20
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Applied to drm-misc-next

Thx
P.

>=20
> Regards,
>=20
> Tvrtko
>=20


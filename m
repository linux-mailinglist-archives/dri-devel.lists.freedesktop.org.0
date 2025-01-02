Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE7A9FF9AB
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 14:09:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10DB810E311;
	Thu,  2 Jan 2025 13:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="htOfb+5n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91DF610E24F
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 13:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1735823380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BxNyZTWE7+0XZ+XHQuVmZ22haZg9cPXynyr3IzXDXQk=;
 b=htOfb+5nP88LuDubThUPNvl0Frmf4zjRPKK9+5CvDAwaxPy93soNtpqCa0fUHZLmBqv4zx
 acjQg+S8OOwYJxNBwNFzhTZ2WUzgtZvRqteJ3338FoKNhIpszksD/fbmQMWhYeJm6GR5mY
 OlpptApFIqyxG9nZB5Nf/x9ZRb/akWE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-kz3q_jQXPb-Iq1hUXKPhCA-1; Thu, 02 Jan 2025 08:09:39 -0500
X-MC-Unique: kz3q_jQXPb-Iq1hUXKPhCA-1
X-Mimecast-MFC-AGG-ID: kz3q_jQXPb-Iq1hUXKPhCA
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-385ded5e92aso1393202f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jan 2025 05:09:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735823378; x=1736428178;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BxNyZTWE7+0XZ+XHQuVmZ22haZg9cPXynyr3IzXDXQk=;
 b=bz8UmLQdNL8bLOQJ5P7OZNj4JXaGhazIv1d13+7/Iz90IkXeq2B54x9oUIuZuxgQLy
 BXRc4z7fHEg5pFMJFeDDCUX7hzjGBT74ueyHJn94EfZSgHzycVnk4MW4Uua873bGEBul
 wyNpfvfNxM/srfwRdkHnjd9tpWBOo6TxhjsJBNGCdNzZNP2jow0oWfu/3M5Np7A+Sjd5
 qPXOhWpiF5KZhL/qhDz9UdP2Kh123+lDPjA2m+XHoQLFX1Ub72TWhL4h+57RBYxbyn/d
 FYZ1eTAmZasT5XvWW7LkNabhQm/XlShD6Bt7FHhwe9yFQSsWb22ld5Pw6XGtQ8AphajV
 xqvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyOx/SgHOG3bt9onBZJqnGfFM9PnYjebdpVET04nb/OpGGzsoFNSYpXdDd2gVTx7zXYsb7JjiUbhk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8fmcttZbRg6RDp9xnRzRdotUkA7rxU/jfUAElEtFEwKwq1Xyx
 16x2pQtJ8DgRAJJ0OuyKpzRWwNeE4s5AGsNFt2yz5dSk6ZXYYz7ddH+ZmebmMTc3v5PnsTSZ8d1
 yiJVxrQ682Lkr3B8Cn6T6/urB2tH0c04Vuur9zaE54M/R8mQVJCYZ9X9E7MaF1tf1mQ==
X-Gm-Gg: ASbGncuwlR77/fuB1Ik8Rt2kTI2nJL40A/1xcHaA42YLQVgqYtf9BXTsUlvA9lqcLea
 Lp0MWosiFdAm344W0AhdTH3BYIasbUttfsTKnux/aYWDHObQQCJnbyy01Q4ucpN/bM2UI+V4EMJ
 UGY15cLRntet1x4nLVcjK5aDnBxX/i0+ox5scusPEwDffh9nPFY6lf/ZMrDqmCfDy7RYO03xaUV
 Z/ZzZlWqvfLeRWj2Is7wWCLZhwCa9XFMF/Q/71zx+JOPzpNRN49Ga2U3TozmexsBnvH5Hw+gu59
 RyQWCSA=
X-Received: by 2002:a5d:6c65:0:b0:386:1cf9:b993 with SMTP id
 ffacd0b85a97d-38a221fff31mr37788749f8f.26.1735823378050; 
 Thu, 02 Jan 2025 05:09:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJpAqajXFGsdn0J0qrk5BvHQwZiNYb4EXuSw96sIlNQSHS5GJOV5J1/NlNHmrUP/Q+7Iyn8A==
X-Received: by 2002:a5d:6c65:0:b0:386:1cf9:b993 with SMTP id
 ffacd0b85a97d-38a221fff31mr37788728f8f.26.1735823377553; 
 Thu, 02 Jan 2025 05:09:37 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a28f17315sm32776732f8f.108.2025.01.02.05.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2025 05:09:36 -0800 (PST)
Message-ID: <31842e821032305e5be7a8dcc3e13593fd09da20.camel@redhat.com>
Subject: Re: [RFC 00/14] Deadline scheduler and other ideas
From: Philipp Stanner <pstanner@redhat.com>
To: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Danilo
 Krummrich <dakr@redhat.com>, Matthew Brost <matthew.brost@intel.com>
Date: Thu, 02 Jan 2025 14:09:35 +0100
In-Reply-To: <20241230165259.95855-1-tursulin@igalia.com>
References: <20241230165259.95855-1-tursulin@igalia.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xqBmlyDapli6CSLhm5IYZHp9UtLvLXG7uqdBpA071Qk_1735823378
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, 2024-12-30 at 16:52 +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>=20
> <tldr>
> Replacing FIFO with a flavour of deadline driven scheduling and
> removing round-
> robin. Connecting the scheduler with dma-fence deadlines. First draft
> and
> testing by different drivers and feedback would be nice. I was only
> able to test
> it with amdgpu. Other drivers may not even compile.

(on my machine I could build them all)

> </tldr>
>=20
> If I remember correctly Christian mentioned recently (give or take)
> that maybe
> round-robin could be removed. That got me thinking how and what could
> be
> improved and simplified. So I played a bit in the scheduler code and
> came up
> with something which appears to not crash at least. Whether or not
> there are
> significant advantages apart from maybe code consolidation and
> reduction is the
> main thing to be determined.

Hi,

so first of all: Happy new year and thx for putting in all that effort
:)

I gave the series a first look; Since this is an RFC, let's abstain
from doing deeper reviews of the exact code for now.


>=20
> One big question is whether round-robin can really be removed. Does
> anyone use
> it, rely on it, or what are even use cases where it is much better
> than FIFO.

So AFAICS Round Robin is not used anymore by anyone. And my
understanding indeed is, too, that there is not really any use-case
where one would like anything except for FIFO.

Looking at 977d97f18b5b ("drm/scheduler: Set the FIFO scheduling policy
as the default"), it seems to me that RR just was easy to implement and
it had the disadvantage of systems under high load cause the oldest job
to be starved to death, which is why FIFO was introduced.

So my guess would be that RR just is a relict.

If we agree on that, then we could remove RR in any case, and the
subsequent question would be whether FIFO should be replaced with
deadline (or: if there should be FIFO *and* deadline?), wouldn't it?

>=20
> See "drm/sched: Add deadline policy" commit message for a short
> description on
> what flavour of deadline scheduling it is. But in essence it should a
> more fair
> FIFO where higher priority can not forever starve lower priorities.

See my answer on that patch.

As you can imagine I'm wondering if that "better FIFO" would be worth
it considering that we are running into a certain risk of regressing
stuff through this rework.


>=20
> "drm/sched: Connect with dma-fence deadlines" wires up dma-fence
> deadlines to
> the scheduler because it is easy and makes logical sense with this.
> And I
> noticed userspace already uses it so why not wire it up fully.

Userspace uses the dma-fence deadlines you mean? Do you have a pointer
for us?

>=20
> Otherwise the series is a bit of progression from consolidating RR
> into FIFO
> code paths and going from there to deadline and then to a change in
> how
> dependencies are handled. And code simplification to 1:1 run queue to
> scheduler
> relationship, because deadline does not need per priority run queues.
>=20
> There is quite a bit of code to go throught here so I think it could
> be even
> better if other drivers could give it a spin as is and see if some
> improvements
> can be detected. Or at least no regressions.

I hope I can dive deeper into the Nouveau side soon.

>=20
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>
>=20
> Tvrtko Ursulin (14):
> =C2=A0 drm/sched: Delete unused update_job_credits
> =C2=A0 drm/sched: Remove idle entity from tree
> =C2=A0 drm/sched: Implement RR via FIFO
> =C2=A0 drm/sched: Consolidate entity run queue management
> =C2=A0 drm/sched: Move run queue related code into a separate file
> =C2=A0 drm/sched: Ignore own fence earlier
> =C2=A0 drm/sched: Resolve same scheduler dependencies earlier
> =C2=A0 drm/sched: Add deadline policy
> =C2=A0 drm/sched: Remove FIFO and RR and simplify to a single run queue
> =C2=A0 drm/sched: Queue all free credits in one worker invocation
> =C2=A0 drm/sched: Connect with dma-fence deadlines
> =C2=A0 drm/sched: Embed run queue singleton into the scheduler
> =C2=A0 dma-fence: Add helper for custom fence context when merging fences
> =C2=A0 drm/sched: Resolve all job dependencies in one go

It seems to me that this series is a "port RR and FIFO to deadline"-
series with some additional patches that could be branched out and be
reviewed through a separate series?

Patch 1 ("Delete unused...") for example. Other candidates are Patch 5
("Move run queue related..."), 13 ("Add helper for...").

A few patches might be mergeable even if the main idea with deadline
doesn't get approved, that's why I'm suggesting that.

Philipp


>=20
> =C2=A0drivers/dma-buf/dma-fence-unwrap.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 6 +-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_job.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 27 +-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_job.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 5 +-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h=C2=A0=C2=A0 |=C2=A0=C2=A0=
 8 +-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c |=C2=A0=C2=A0 8 +-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 8 +-
> =C2=A0drivers/gpu/drm/scheduler/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c=C2=A0=C2=A0=C2=A0 | 316 ++=
++++-----
> =C2=A0drivers/gpu/drm/scheduler/sched_fence.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 5 +-
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 587 +++++-------------
> --
> =C2=A0drivers/gpu/drm/scheduler/sched_rq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 199 +++++++
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 74 ++-
> =C2=A0include/linux/dma-fence-unwrap.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 31 +-
> =C2=A014 files changed, 606 insertions(+), 678 deletions(-)
> =C2=A0create mode 100644 drivers/gpu/drm/scheduler/sched_rq.c
>=20


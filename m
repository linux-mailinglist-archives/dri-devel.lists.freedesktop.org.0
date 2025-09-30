Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CD8BAC274
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 11:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A7110E293;
	Tue, 30 Sep 2025 09:00:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="nHp3Iqcn";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="bSO6IffR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A4F610E293;
 Tue, 30 Sep 2025 09:00:40 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cbX8P6LPCz9ttD;
 Tue, 30 Sep 2025 11:00:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1759222837; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U892Esd5mTj/d5tmho52j6cdCEfSjQZJiBCIwYm4Eqo=;
 b=nHp3IqcnvbreOZc3OzulvC0i3d3NSiJcd0pCNkdKLzgChgANiDCaIFIHrrSraFbz88obvY
 vWUbERulvbsWPTd6n6DMWPyclCe4TxnC7uMh6WVyVuxjEORtXY5UOM8g53jWBwgMsWOu7V
 g1dkh6m2vjxHSNGwrSVHfGZNahe37BLJoP82ol8dm4Guj9FjSi9FsfyV6jauE8VfXhpXcN
 i+ZQUZuBhdAdfB7ids8lhfHg8lcVa8p/LHu9u0TTm4dKGMQWeryKXHObLXOl5tbUY3+c+A
 m5LAILorzuL3c6qjQ9/ckXcQrY2RuIG/zgZJcDRODFGOBhO+0KuG1EOhxuLhHA==
Message-ID: <4453e5989b38e99588efd53af674b69016b2c420.camel@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1759222835; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U892Esd5mTj/d5tmho52j6cdCEfSjQZJiBCIwYm4Eqo=;
 b=bSO6IffRMsKMfrWE4WksV2egg/AdsOdKcTyElsfS4oISvSwRGOOW93aUMveSOG0rjkRBKZ
 8PPEowKvBC4mDwsXsIDBH/+4hRb9ZTPgIOff66KQra6p2+PtECJs03s2SngMG5vaGtmePA
 lznDHFbnBdjhqFie87d43A9cq7Vrc/ai6cHDTSsv+Ej4ObjfEupmywM6vJDuyY6XG0qfp1
 /Fci7+7JEhC/WXMfFYc7s39KRPheF9umg+XA4lqRCj2pyIgiYQbLWU9bn4WDzB41NInUiY
 0j4VK3p4zunEX1jXUTc1gklny9621t6Nh4Xz8ZY895Tkx4vsbd4lqiHH8NEQLA==
Subject: Re: [RFC v8 00/21] DRM scheduling cgroup controller
From: Philipp Stanner <phasta@mailbox.org>
To: Danilo Krummrich <dakr@kernel.org>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 kernel-dev@igalia.com, intel-xe@lists.freedesktop.org,
 cgroups@vger.kernel.org,  linux-kernel@vger.kernel.org, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Leo Liu
 <Leo.Liu@amd.com>,  =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Matthew Brost <matthew.brost@intel.com>, Michal =?ISO-8859-1?Q?Koutn=FD?=
 <mkoutny@suse.com>, Michel =?ISO-8859-1?Q?D=E4nzer?=
 <michel.daenzer@mailbox.org>, Philipp Stanner <phasta@kernel.org>, 
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, Rob Clark
 <robdclark@gmail.com>, Tejun Heo <tj@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, Alistair Popple <apopple@nvidia.com>, John Hubbard
 <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi
 <ttabi@nvidia.com>, Alex Deucher <alexander.deucher@amd.com>, Lucas De
 Marchi <lucas.demarchi@intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, Rob Herring
 <robh@kernel.org>, Steven Price <steven.price@arm.com>,  Liviu Dudau
 <liviu.dudau@arm.com>, Daniel Almeida <daniel.almeida@collabora.com>, Alice
 Ryhl <aliceryhl@google.com>, Boqun Feng <boqunf@netflix.com>, 
 =?ISO-8859-1?Q?Gr=E9goire_P=E9an?= <gpean@netflix.com>, Simona Vetter
 <simona@ffwll.ch>, airlied@gmail.com
Date: Tue, 30 Sep 2025 11:00:00 +0200
In-Reply-To: <DD5CCG4MIODH.1718JI1Z7GH8T@kernel.org>
References: <20250903152327.66002-1-tvrtko.ursulin@igalia.com>
 <DD5CCG4MIODH.1718JI1Z7GH8T@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: zm9rtuzamubk7iurtkm9beynczfjwck6
X-MBO-RS-ID: adb1f3886a0592d9927
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

+Cc Sima, Dave

On Mon, 2025-09-29 at 16:07 +0200, Danilo Krummrich wrote:
> On Wed Sep 3, 2025 at 5:23 PM CEST, Tvrtko Ursulin wrote:
> > This is another respin of this old work^1 which since v7 is a total rew=
rite and
> > completely changes how the control is done.
>=20
> I only got some of the patches of the series, can you please send all of =
them
> for subsequent submissions? You may also want to consider resending if yo=
u're
> not getting a lot of feedback due to that. :)
>=20
> > On the userspace interface side of things it is the same as before. We =
have
> > drm.weight as an interface, taking integers from 1 to 10000, the same a=
s CPU and
> > IO cgroup controllers.
>=20
> In general, I think it would be good to get GPU vendors to speak up to wh=
at kind
> of interfaces they're heading to with firmware schedulers and potential f=
irmware
> APIs to control scheduling; especially given that this will be a uAPI.
>=20
> (Adding a couple of folks to Cc.)
>=20
> Having that said, I think the basic drm.weight interface is fine and shou=
ld work
> in any case; i.e. with the existing DRM GPU scheduler in both modes, the
> upcoming DRM Jobqueue efforts and should be generic enough to work with
> potential firmware interfaces we may see in the future.
>=20
> Philipp should be talking about the DRM Jobqueue component at XDC (probab=
ly just
> in this moment).
>=20
> --
>=20
> Some more thoughts on the DRM Jobqueue and scheduling:
>=20
> The idea behind the DRM Jobqueue is to be, as the name suggests, a compon=
ent
> that receives jobs from userspace, handles the dependencies (i.e. dma fen=
ces),
> and executes the job, e.g. by writing to a firmware managed software ring=
.
>=20
> It basically does what the GPU scheduler does in 1:1 entity-scheduler mod=
e,
> just without all the additional complexity of moving job ownership from o=
ne
> component to another (i.e. from entity to scheduler, etc.).
>=20
> With just that, there is no scheduling outside the GPU's firmware schedul=
er of
> course. However, additional scheduler capabilities, e.g. to support hardw=
are
> rings, or manage firmware schedulers that only support a limited number o=
f
> software rings (like some Mali GPUs), can be layered on top of that:
>=20
> In contrast to the existing GPU scheduler, the idea would be to keep lett=
ing the
> DRM Jobqueue handle jobs submitted by userspace from end to end (i.e. let=
 the
> push to the hardware (or software) ring buffer), but have an additional
> component, whose only purpose is to orchestrate the DRM Jobqueues, by man=
aging
> when they are allowed to push to a ring and which ring they should push t=
o.
>=20
> This way we get rid of one of the issue that the existing GPU scheduler m=
oves
> job ownership between components of different lifetimes (entity and sched=
uler),
> which is one of the fundamental hassles to deal with.


So just a few minutes ago I had a long chat with Sima.

Sima (and I, too, I think) thinks that the very few GPUs that have a
reasonably low limit of firmware rings should just resource-limit
userspace users once the limit of firmware rings is reached.

Basically like with VRAM.

Apparently Sima had suggested that to Panthor in the past? But Panthor
still seems to have implemented yet another scheduler mechanism on top
of the 1:1 entity-scheduler drm_sched setup?

@Boris: Why was that done?

So far I tend to prefer Sima's proposal because I'm currently very
unsure how we could deal with shared firmware rings =E2=80=93 because then =
we'd
need to resubmit jobs, and the currently intended Rust ownership model
would then be at danger, because the Jobqueue would need a:
pending_list.

So we'd be running danger of redesigning drm_sched, whereas with Sima's
idea there'd never be a scheduler anywhere anymore anyways.


P.


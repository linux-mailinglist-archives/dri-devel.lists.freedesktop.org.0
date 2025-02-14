Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81356A362C6
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 17:14:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53ACB10E050;
	Fri, 14 Feb 2025 16:14:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="b1HVB7ni";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="w/+1W1HZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-a5-smtp.messagingengine.com
 (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 755D310E34A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 16:14:27 +0000 (UTC)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal
 [10.202.2.47])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 8D6CF1140105;
 Fri, 14 Feb 2025 11:14:26 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-07.internal (MEProxy); Fri, 14 Feb 2025 11:14:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1739549666;
 x=1739636066; bh=PnGApNhid7Ud6Ofq1uk6X53en3KIGAExFrctRTMlloc=; b=
 b1HVB7niaKbnXK2Db727kt/TgERHywWkl3wwW1cIK+DmhVYwE9aR9bBX/4E6X8ks
 vPPa1nD5ShiQJ3tb3bfykaResSgBLMwaODIMNb4GNwrg9cmr5nTjtYgY8E5spCpI
 7BwUmLc2aLnrB4F6xWEtp7c8fT6xy4b8ja6HCVEvVEaoxY3B0YqqO+jLiXfx2Hey
 +1pdXD14U1H4jxyQymS2MIWXRjP2wXrYV4nKjsfnTvACuoCPFtJiOQEAx8p4mmPY
 mqL4oUP2z+2KDMLxJRSQgNqsgfrWoU/KhgGoOE19HjCBuncQ/hKltATtZJItDMZ4
 604ogf4pnMuf+SilxYdtYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1739549666; x=1739636066; bh=PnGApNhid7Ud6Ofq1uk6X53en3KIGAExFrc
 tRTMlloc=; b=w/+1W1HZYUUblRpX8ZUl3hKAIlSxyv7Ogypk2iZ+zxY1z3azWY0
 wOhiLt7d/dcr8dTsWHB50GMsiNJpEs44mfBrer/mdH6/3MzIlLwsK1BR6nDW/DJc
 8VrzkBU03an9AZnEsiEyWWy6wepuAFZhnKSWeXTARX5yTGrDsbha2twCwXijOHpj
 6sy9WXh6rOnCwrXRNEDcezSi6iN2HGXqapBNU84ZR7Rz4nx+cCcWf+JW6/1hql2Y
 DMXznNkh6VVedyaH6gvKSgcIYkJcKpuY01VXrkbE+GNz8W8TynQ52gVV5LPbXOSx
 CfvaVbvkn6TIQ1DEF8Fwd6AjkBQCpS7y/iw==
X-ME-Sender: <xms:4muvZ1Lilx1cho2ISvSJmSYKH7iQIQiXhaXgiROa3-cSokUTJeOh8Q>
 <xme:4muvZxIljxYjfpx6Kxh_CydX0K7PIjqaS5EXVOxWUpxxI6T62-tVbdZMMmWYfd-B4
 AmBB4_T8zhG7fU>
X-ME-Received: <xmr:4muvZ9tMOfaRDS1juHZKVezjjkiU6Q1j5YnmCDRV6mwQ_uiCgaV8Y4UMZ7I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehtddutdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdej
 necuhfhrohhmpeffvghmihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvjeet
 geekhfetudfhgfetffegfffguddvgffhffeifeeikeektdehgeetheffleenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhi
 shhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopedutddpmhhoug
 gvpehsmhhtphhouhhtpdhrtghpthhtohepthhhohhmrghsrdhhvghllhhsthhrohhmsehl
 ihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgrthhthhgvfidrsghrohhsth
 esihhnthgvlhdrtghomhdprhgtphhtthhopehinhhtvghlqdigvgeslhhishhtshdrfhhr
 vggvuggvshhkthhophdrohhrghdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsth
 hsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohephhhimhgrlhdrphhrrghs
 rggurdhghhhimhhirhgrhiesihhnthgvlhdrtghomhdprhgtphhtthhopegrphhophhplh
 gvsehnvhhiughirgdrtghomhdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgt
 ohhmpdhrtghpthhtohepshhimhhonhgrrdhvvghtthgvrhesfhhffihllhdrtghhpdhrtg
 hpthhtohepfhgvlhhigidrkhhuvghhlhhinhhgsegrmhgurdgtohhm
X-ME-Proxy: <xmx:4muvZ2bnOVqWUjQaNO5Ui7XLYgpDEeHM5jvL0m2UFOk6k--Xi8i7gQ>
 <xmx:4muvZ8bu2HLOmyqgV9xDsQz6d6k8U2gClXuE2ncWHcE0AkNTfi3vGA>
 <xmx:4muvZ6AqUiCKPwacFoWO8nWIbdxyt5DnBPouRqiEYe5HvniYZxNvKA>
 <xmx:4muvZ6Z3ZRPyWFIEPJqEK8AdHtxdDmvHhTnVb31TiPIeGYucf1T1ow>
 <xmx:4muvZ5S-EN0VlCl0SDmZPdHg0kcmVDC3NIWtynWAzZ26yxuDIq9Wo-up>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Feb 2025 11:14:25 -0500 (EST)
Date: Fri, 14 Feb 2025 11:14:10 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Subject: Re: [PATCH v5 00/32] Introduce GPU SVM and Xe SVM implementation
Message-ID: <Z69r3reWGZq5W7iw@itl-email>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
 <Z65ix566lLCPOsob@itl-email>
 <433228556ac6ad42b21c942dc6c070069107660e.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lLJ6w5bkTZhj0wAx"
Content-Disposition: inline
In-Reply-To: <433228556ac6ad42b21c942dc6c070069107660e.camel@linux.intel.com>
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


--lLJ6w5bkTZhj0wAx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Feb 2025 11:14:10 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
	simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Subject: Re: [PATCH v5 00/32] Introduce GPU SVM and Xe SVM implementation

On Fri, Feb 14, 2025 at 09:47:13AM +0100, Thomas Hellstr=C3=B6m wrote:
> Hi
>=20
> On Thu, 2025-02-13 at 16:23 -0500, Demi Marie Obenour wrote:
> > On Wed, Feb 12, 2025 at 06:10:40PM -0800, Matthew Brost wrote:
> > > Version 5 of GPU SVM. Thanks to everyone (especially Sima, Thomas,
> > > Alistair, Himal) for their numerous reviews on revision 1, 2, 3=C2=A0
> > > and for
> > > helping to address many design issues.
> > >=20
> > > This version has been tested with IGT [1] on PVC, BMG, and LNL.
> > > Also
> > > tested with level0 (UMD) PR [2].
> >=20
> > What is the plan to deal with not being able to preempt while a page
> > fault is pending?=C2=A0 This seems like an easy DoS vector.=C2=A0 My
> > understanding
> > is that SVM is mostly used by compute workloads on headless systems.
> > Recent AMD client GPUs don't support SVM, so programs that want to
> > run
> > on client systems should not require SVM if they wish to be portable.
> >=20
> > Given the potential for abuse, I think it would be best to require
> > explicit administrator opt-in to enable SVM, along with possibly
> > having
> > a timeout to resolve a page fault (after which the context is
> > killed).
> > Since I expect most uses of SVM to be in the datacenter space (for
> > the
> > reasons mentioned above), I don't believe this will be a major
> > limitation in practice.=C2=A0 Programs that wish to run on client syste=
ms
> > already need to use explicit memory transfer or pinned userptr, and
> > administrators of compute clusters should be willing to enable this
> > feature because only one workload will be using a GPU at a time.
>=20
> While not directly having addressed the potential DoS issue you
> mention, there is an associated deadlock possibility that may happen
> due to not being able to preempt a pending pagefault. That is if a dma-
> fence job is requiring the same resources held up by the pending page-
> fault, and then the pagefault servicing is dependent on that dma-fence
> to be signaled in one way or another.
>=20
> That deadlock is handled by only allowing either page-faulting jobs or
> dma-fence jobs on a resource (hw engine or hw engine group) that can be
> used by both at a time, blocking synchronously in the exec IOCTL until
> the resource is available for the job type. That means LR jobs waits
> for all dma-fence jobs to complete, and dma-fence jobs wait for all LR
> jobs to preempt. So a dma-fence job wait could easily mean "wait for
> all outstanding pagefaults to be serviced".
>=20
> Whether, on the other hand, that is a real DoS we need to care about,
> is probably a topic for debate. The directions we've had so far are
> that it's not. Nothing is held up indefinitely, what's held up can be
> Ctrl-C'd by the user and core mm memory management is not blocked since
> mmu_notifiers can execute to completion and shrinkers / eviction can
> execute while a page-fault is pending.

The problem is that a program that uses a page-faulting job can lock out
all other programs on the system from using the GPU for an indefinite
period of time.  In a GUI session, this means a frozen UI, which makes
recovery basically impossible without drastic measures (like rebooting
or logging in over SSH).  That counts as a quite effective denial of
service from an end-user perspective, and unless I am mistaken it would
be very easy to trigger by accident: just start a page-faulting job that
loops forever.

The simplest way to prevent this would be to require DRM master
privileges to spawn page-faulting jobs.  Only the Wayland compositor or
X server will normally have these, and they will never submit a
page-faulting job.  My understanding is that other IOCTLs that can mess
up a compositor also require DRM master privileges, and submitting a
page-faulting job seems to qualify.

There is still a legitimate use-case for running long-running workloads
on a GPU used for an interactive session.  However, DMA fencing compute
jobs can long running as long as they are preemptable, and they are
preemptable as long as they don't need page faults.  Sima, Faith, and
Christian have already come up with a solution for long-running Vulkan
compute.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--lLJ6w5bkTZhj0wAx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmeva9oACgkQszaHOrMp
8lNsQhAAkz1ou+XsklZj28NJgvNx2Vwlc+izNtslBzlB84i/rcNmMkvxcS1jZFv8
paZKHZFXcEzniG8dlTAdIbICifc6FiyqCgA5V3WjuvIDk4gqg6mVM4WugGh+uJYr
nvWNHzgbIb3sgiRS1OEurEV5bkd+xCh6YFZRY+PC9t5qt7zsw3mNNxaL3Yxu7izX
1KBoo+cr0xOHYof+RIp0JJhoyp+0txjCSjrGq23rbvvZF3cFBai7dKfZy2yIcr7l
5e83clAUapeSGowlyDtkWbR91bAsMRGjNt2u1eSInwD0e4nPeBFCR3eYfliULCNY
rJ3m1obj17ReiGhd9qOepa9eIl/zkjXO/eeigUObG8POPLm67WgZc+MeYuhQ1imz
hp8efrNNy3lpXCMpGbxAPdf3NLE35aB5F0dzm085KW3tBhX121shinE+Q4jiUHfd
aQ+PEHrGnO2NxiLwC44yBfNtBSapq8uSW+vvjtCviQPFUSh+LynWW2bvtIWl0rjf
Hmi7SAjegTRiThBsbowxluKdHObjUZZ8tHlQnuQJRqLKvKRASie5DND4MrCtHHcP
wODIv5EAYr5p7h8OjAli8pvzQNZW0klTDive7zvbiem6t+66iTC3zVpWpxOjSFOX
SHdQvZ9SIX1jCBI+G80d2tOvvdrij0lZMqATYtlA8s/L5+Lq2Yw=
=mbAl
-----END PGP SIGNATURE-----

--lLJ6w5bkTZhj0wAx--
